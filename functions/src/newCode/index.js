const admin = require('firebase-admin')
admin.initializeApp()

const { getMessaging } = require('firebase-admin/messaging')
const messaging = getMessaging()

const { onDocumentCreated } = require('firebase-functions/v2/firestore')
const { getGames } = require('../../helper/games')
const { getTokens } = require('../../helper/user')
const { batchArray } = require('../../helper/batch')

const handleCode = async (event) => {
    const snap = event.data
    console.log(snap.data())
    const { code } = snap.data()

    try {
        const games = await getGames(code)
        console.log(games)

        await snap.ref.update({ games })

        const cName = snap.ref.parent.path

        if (cName.indexOf('free') > -1) {
            return messaging.sendToTopic('free', { notification: { title: 'New Free code', body: code } })
        }

        const tokens = await getTokens()
        const toks = batchArray(tokens, 500)

        for (let i = 0; i < toks.length; i++) {
            var t = toks[i]

            for (let a = 0; a < t.length; a++) {
                await messaging.send({
                    token: t[a],
                    notification: {
                        title: 'New Premium code',
                        body: code,
                    },
                })
            }
        }

        return null

    } catch (e) {
        console.log(e)
        if (e.errorInfo.code == 'messaging/registration-token-not-registered') {
            return;
        }

        return snap.ref.delete()
    }
}


exports.newFreeCode = onDocumentCreated('free/{gameId}', handleCode)

exports.newWorksheetCode = onDocumentCreated('worksheet/{gameId}', handleCode)

exports.newPremiumCode = onDocumentCreated('premium/{gameId}', handleCode)