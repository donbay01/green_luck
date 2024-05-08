const { onCall } = require('firebase-functions/v2/https')
const admin = require('firebase-admin')

const { default: axios } = require('axios')
const { UNAUTHENTICATED } = require('../../constants/error')
const { getPlan } = require('../../helper/paystack')

var header = {
    "Authorization": `Bearer ${process.env.PAYSTACK_SECRET}`,
    'Content-Type': 'application/json'
}

exports.genLink = onCall(async (req) => {
    if (req.auth == undefined) {
        throw new functions.https.HttpsError('unauthenticated', UNAUTHENTICATED)
    }

    const { planId } = req.data
    const { amount } = await getPlan('planId', planId)

    const payload = JSON.stringify({
        amount: amount,
        email: req.auth.token.email,
        plan: planId,
        metadata: {
            uid: req.auth.uid,
            planId,
            amount,
        },
        callback_url: 'www.greenluck.com',
        channels: ['card', 'bank', 'ussd', 'qr', 'bank_transfer']
    })

    const res = await axios.post('https://api.paystack.co/transaction/initialize', payload, { headers: header })

    return res.data
})