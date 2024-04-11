const { onSchedule } = require('firebase-functions/v2/scheduler')
const { getFirestore, Timestamp } = require('firebase-admin/firestore')

const db = getFirestore()

exports.accountcleanup = onSchedule("every day 00:00", async (event) => {
    var today = Timestamp.now()
    const q = await db.collection('users').where('payDate', '<', today).get()

    for (let i = 0; i < q.size; i++) {
        var user = q.docs[i]
        await user.ref.update({ role: 'free' })
    }

    return null;
});