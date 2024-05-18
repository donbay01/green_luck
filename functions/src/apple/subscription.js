const { onCall, HttpsError } = require('firebase-functions/v2/https')
const { info } = require('firebase-functions/logger')

exports.appleSubcription = onCall(async (req) => {
    if (!req.auth) {
        throw new HttpsError('unauthenticated', 'Need to logged in')
    }

    const { productID, purchaseID, serverVerificationData, localVerificationData } = req.data
    info(req.data)

    return req.data
})