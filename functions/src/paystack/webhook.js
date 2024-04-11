const { onRequest } = require('firebase-functions/v2/https')

var crypto = require('crypto')
const { handlePay, saveAuthorisation, planExist } = require('../../helper/paystack')
var secret = process.env.PAYSTACK_SECRET

exports.webhook = onRequest(async (req, res) => {
    const body = req.body
    const hash = crypto.createHmac('sha512', secret).update(JSON.stringify(body)).digest('hex')

    if (hash == req.headers['x-paystack-signature']) {
        const { event, data } = body

        if (event == 'charge.success') {
            const { metadata, authorization, customer, amount } = data
            const match = await planExist(metadata.planId.trim().replace(' ', ''), Number(amount))
            console.log(match)

            if (match != null && match != undefined) {
                await handlePay(metadata.uid, metadata.planId)
                await saveAuthorisation(customer.email, metadata.uid, authorization, metadata.planId)
            }
        }
    }

    return res.sendStatus(200)
})