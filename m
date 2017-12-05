From: Jason Gerecke <killertofu@gmail.com>
Subject: Re: [PATCH] intel-hid: add a DMI quirk to support Wacom Mobile Studio Pro
Date: Tue, 05 Dec 2017 10:01:00 -0800
Message-ID: <A0A02DDE-F512-4523-AC1F-A63E0685B027@gmail.com>
References: <1512460332-7420-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:40022 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752481AbdLESBF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Dec 2017 13:01:05 -0500
Received: by mail-pf0-f194.google.com with SMTP id v26so712654pfl.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Dec 2017 10:01:05 -0800 (PST)
In-Reply-To: <1512460332-7420-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

On December 4, 2017 11:52:12 PM PST, Alex Hung <alex=2Ehung@canonical=2Ecom=
> wrote:
>HEBC method reports capabilities of 5 button array but Wacom Mobile
>Studio Pro does not have this control method=2E A DMI quirk was created

Nit: s/Mobile Studio/MobileStudio/ here and in the subject and the `button=
_array_table`

>to
>enable 5 button array for this system=2E
>
>Bugzilla: https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D197991
>
>Reported-by: Jason Gerecke <killertofu@gmail=2Ecom>

Please use "Reported-by: Jason Gerecke <jason=2Egerecke@wacom=2Ecom>"=20

Thanks again for the fix!=20

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one=C2=A0 /
(That is to say, eight) to the two,=C2=A0 =C2=A0 =C2=A0/
But you can=E2=80=99t take seven from three,=C2=A0 =C2=A0 /
So you look at the sixty-fours=2E=2E=2E=2E

>Signed-off-by: Alex Hung <alex=2Ehung@canonical=2Ecom>
>---
>drivers/platform/x86/intel-hid=2Ec | 34
>+++++++++++++++++++++++++++++++---
> 1 file changed, 31 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/platform/x86/intel-hid=2Ec
>b/drivers/platform/x86/intel-hid=2Ec
>index f470279=2E=2E54d761c 100644
>--- a/drivers/platform/x86/intel-hid=2Ec
>+++ b/drivers/platform/x86/intel-hid=2Ec
>@@ -25,6 +25,7 @@
> #include <linux/acpi=2Eh>
> #include <linux/suspend=2Eh>
> #include <acpi/acpi_bus=2Eh>
>+#include <linux/dmi=2Eh>
>=20
> MODULE_LICENSE("GPL");
> MODULE_AUTHOR("Alex Hung");
>@@ -73,6 +74,17 @@ static const struct key_entry intel_array_keymap[] =3D
>{
> 	{ KE_END },
> };
>=20
>+static const struct dmi_system_id button_array_table[] =3D {
>+	{
>+		=2Eident =3D "Wacom Mobile Studio Pro",
>+		=2Ematches =3D {
>+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
>+			DMI_MATCH(DMI_PRODUCT_NAME, "Skylake"),
>+		},
>+	},
>+	{ }
>+};
>+
> struct intel_hid_priv {
> 	struct input_dev *input_dev;
> 	struct input_dev *array;
>@@ -263,10 +275,27 @@ static void notify_handler(acpi_handle handle,
>u32 event, void *context)
> 			 ev_index);
> }
>=20
>+static bool button_array_present(struct platform_device *device)
>+{
>+	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>+	unsigned long long event_cap;
>+	acpi_status status;
>+	bool supported =3D false;
>+
>+	status =3D acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
>+	if (ACPI_SUCCESS(status) && (event_cap & 0x20000))
>+		supported =3D true;
>+
>+	if (dmi_check_system(button_array_table))
>+		supported =3D true;
>+
>+	return supported;
>+}
>+
> static int intel_hid_probe(struct platform_device *device)
> {
> 	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>-	unsigned long long event_cap, mode;
>+	unsigned long long mode;
> 	struct intel_hid_priv *priv;
> 	acpi_status status;
> 	int err;
>@@ -299,8 +328,7 @@ static int intel_hid_probe(struct platform_device
>*device)
> 	}
>=20
> 	/* Setup 5 button array */
>-	status =3D acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
>-	if (ACPI_SUCCESS(status) && (event_cap & 0x20000)) {
>+	if (button_array_present(device)) {
> 		dev_info(&device->dev, "platform supports 5 button array\n");
> 		err =3D intel_button_array_input_setup(device);
> 		if (err)
