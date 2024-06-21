const { onCall, HttpsError } = require('firebase-functions/v2/https')
const { info } = require('firebase-functions/logger')

const { getFirestore } = require('firebase-admin/firestore')
const { creditUser } = require('../../helper/paystack')
const db = getFirestore()

exports.appleSubcription = onCall(async (req) => {
    if (!req.auth) {
        throw new HttpsError('unauthenticated', 'Need to logged in')
    }

    const { productID, purchaseID, serverVerificationData, localVerificationData } = req.data
    info(serverVerificationData)

    if (!serverVerificationData) {
        return req.data
    }

    const { docs } = await db.collection('plans').where('apple_id', '==', productID).limit(1).get()
    const plan = docs[0].data()

    return creditUser(req.auth.uid, plan)
})