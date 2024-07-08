const { getFirestore, FieldValue } = require('firebase-admin/firestore')
const { onRequest } = require('firebase-functions/v2/https')

const db = getFirestore()

exports.addNewCode = onRequest(async (req, res) => {
    const { code, collection } = req.body

    await db.collection(collection).add({
        code,
        timestamp: FieldValue.serverTimestamp(),
    })

    return res.send({
        message: "Game posted"
    })
})