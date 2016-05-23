From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is
 suspended
Date: Tue, 24 May 2016 01:03:11 +0200
Message-ID: <1d56338e-6312-371d-ace7-96f762e18bba@gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
 <201605240006.03580@pali> <20160523221715.GE2735@f23x64.localdomain>
 <201605240022.28140@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36002 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbcEWXDO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 19:03:14 -0400
In-Reply-To: <201605240022.28140@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 24/05/2016 00:22, Pali Roh=C3=A1r wrote:
> On Tuesday 24 May 2016 00:17:15 Darren Hart wrote:
>> On Tue, May 24, 2016 at 12:06:03AM +0200, Pali Roh=C3=A1r wrote:
>>> On Monday 23 May 2016 23:26:55 Darren Hart wrote:
>>>> I've queued this. Thanks for your patience.
>>>
>>> Ok, In that case I would update comments in patch to try it more
>>> clear what code is doing.
>>
>> I thought I had your approval on this one Pali. Apologies if that wa=
s
>> not the case. Did I miss a change request from you?
>>
>> If so, please point me at it, and I'll dequeue this one and wait for
>> an updated one.
>=20
> I just wanted to review that code from somebody else and decide if=20
> accept it or not. Because I was not sure if it is OK...
>=20
> But there was no objection, so patch is OK.
>=20
> And I pointed that patch could have better comments to describe what =
it=20
> is doing as at first time I was confused.
>=20
> So I believe that you can update patch in your queue with new version=
=20
> which just change comments in source code (without functional changes=
).
>=20

Something such as the following?
=46eel free to reword the comments if you have something better in mind=
=2E

---
 drivers/platform/x86/dell-rbtn.c | 56 ++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
index 331d63c..e0208ba 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -28,6 +28,7 @@ struct rbtn_data {
 	enum rbtn_type type;
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
+	bool suspended;
 };
=20
=20
@@ -235,9 +236,55 @@ static const struct acpi_device_id rbtn_ids[] =3D =
{
 	{ "", 0 },
 };
=20
+#ifdef CONFIG_PM_SLEEP
+static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context)
+{
+	struct rbtn_data *rbtn_data =3D context;
+
+	rbtn_data->suspended =3D false;
+}
+
+static int rbtn_suspend(struct device *dev)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
+
+	rbtn_data->suspended =3D true;
+
+	return 0;
+}
+
+static int rbtn_resume(struct device *dev)
+{
+	struct acpi_device *device =3D to_acpi_device(dev);
+	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
+	acpi_status status;
+
+	/*
+	 * Upon resume, some BIOSes autonomously send an ACPI notification
+	 * that triggers an unwanted input event. In order to ignore it,
+	 * we use a flag that we set at suspend and clear once we have
+	 * received the extra notification. Since ACPI notifications are
+	 * delivered asynchronously to drivers, we clear the flag from the
+	 * workqueue used to deliver the notifications. This should be enough
+	 * to guarantee that the flag is cleared only after we received the
+	 * extra notification, if any.
+	 */
+	status =3D acpi_os_execute(OSL_NOTIFY_HANDLER,
+			 rbtn_acpi_clear_flag, rbtn_data);
+	if (ACPI_FAILURE(status))
+		rbtn_data->suspended =3D false;
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
+
 static struct acpi_driver rbtn_driver =3D {
 	.name =3D "dell-rbtn",
 	.ids =3D rbtn_ids,
+	.drv.pm =3D &rbtn_pm_ops,
 	.ops =3D {
 		.add =3D rbtn_add,
 		.remove =3D rbtn_remove,
@@ -399,6 +446,15 @@ static void rbtn_notify(struct acpi_device *device=
, u32 event)
 {
 	struct rbtn_data *rbtn_data =3D device->driver_data;
=20
+	/*
+	 * Some BIOSes send autonomously a notification at resume.
+	 * Ignore it to prevent unwanted input events.
+	 */
+	if (rbtn_data->suspended) {
+		dev_dbg(&device->dev, "ACPI notification ignored\n");
+		return;
+	}
+
 	if (event !=3D 0x80) {
 		dev_info(&device->dev, "Received unknown event (0x%x)\n",
 			 event);
--=20
2.8.1
