const {onRequest} = require("firebase-functions/v2/https");
const nodemailer = require("nodemailer");

// إعداد حساب البريد الإلكتروني (SMTP)
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "manarsalah", // بريدك الإلكتروني
    pass: "your-email-password", // كلمة المرور أو App Password
  },
});

// إنشاء الوظيفة لإرسال البريد الإلكتروني
exports.sendEmail = onRequest(async (req, res) => {
  try {
    // إعداد تفاصيل البريد الإلكتروني
    const mailOptions = {
      from: "your-email@gmail.com",
      to: req.body.to, // البريد الإلكتروني المستلم (يتم إرساله من التطبيق)
      subject: req.body.subject, // موضوع البريد
      text: req.body.text, // نص البريد
    };

    // إرسال البريد
    await transporter.sendMail(mailOptions);

    // إرسال ردّ عند النجاح
    res.status(200).send("Email sent successfully!");
  } catch (error) {
    console.error("Error sending email:", error);
    res.status(500).send("Error sending email.");
  }
});
