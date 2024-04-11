const admin = require('firebase-admin')
const { Timestamp } = require('firebase-admin/firestore')
const { updateUser } = require('../user')

const db = admin.firestore()

exports.planExist = async (id, amount) => {
    const res = await db.collection('plans').where('planId', '==', id).where('amount', '==', amount).get()
    return res.docs[0].data()
}

exports.getPlan = async (field, value) => {
    const res = await db.collection('plans').where(field, '==', value).get()
    return res.docs[0].data()
}

exports.creditUser = (uid, planData) => {
    const { name, days } = planData

    var today = new Date()
    var mod = today.setDate(today.getDate() + days);
    var payDate = new Date(mod).setMinutes(0, 0, 0)

    return updateUser(uid, {
        plan: name,
        role: 'Paid',
        payDate: Timestamp.fromDate(new Date(payDate))
    })
}

exports.handlePay = async (uid, paystackId) => {
    const data = await this.getPlan('planId', paystackId)
    return this.creditUser(uid, data)
}

exports.saveAuthorisation = (email, uid, authorisation, planId) => {
    return db.collection('authorisation').doc(uid).set({ ...authorisation, email, planId })
}