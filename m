From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 4/4] asus-wrc: Toggle airplane mode LED
Date: Tue, 15 Dec 2015 10:30:42 -0500
Message-ID: <1450193442-7930-5-git-send-email-jprvita@endlessm.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:35720 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964829AbbLOPat (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 10:30:49 -0500
Received: by mail-qg0-f52.google.com with SMTP id i91so2047181qgf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Dec 2015 07:30:48 -0800 (PST)
In-Reply-To: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, jprvita@gmail.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

In the ASHS device we have the HSWC method, which basically calls eithe=
r
OWGD or OWGS, depending on its parameter:

	Device (ASHS)
	{
		Name (_HID, "ATK4002")  // _HID: Hardware ID
		Method (HSWC, 1, Serialized)
		{
			If ((Arg0 < 0x02))
			{
				OWGD (Arg0)
				Return (One)
			}
			If ((Arg0 =3D=3D 0x02))
			{
				Local0 =3D OWGS ()
				If (Local0)
				{
					Return (0x05)
				}
				Else
				{
					Return (0x04)
				}
			}
			If ((Arg0 =3D=3D 0x03))
			{
				Return (0xFF)
			}
			If ((Arg0 =3D=3D 0x04))
			{
				OWGD (Zero)
				Return (One)
			}
			If ((Arg0 =3D=3D 0x05))
			{
				OWGD (One)
				Return (One)
			}
			If ((Arg0 =3D=3D 0x80))
			{
				Return (One)
			}
		}
		Method (_STA, 0, NotSerialized)  // _STA: Status
		{
			If ((MSOS () >=3D OSW8))
			{
				Return (0x0F)
			}
			Else
			{
				Return (Zero)
			}
		}
	}

On the Asus E202SA laptop, which does not have an airplane mode LED,
OWGD has an empty implementation and OWGS simply returns 0. On the Asus
X555UB these methods have the following implementation:

	Method (OWGD, 1, Serialized)
	{
		SGPL (0x0203000F, Arg0)
		SGPL (0x0203000F, Arg0)
	}

	Method (OWGS, 0, Serialized)
	{
		Store (RGPL (0x0203000F), Local0)
		Return (Local0)
	}

Where OWGD(1) sets the airplane mode LED ON, OWGD(0) set it off, and
OWGS() returns its state.

This commit makes use of a newly implemented RFKill LED trigger to
trigger the LED when the system enters or exits "Airplane Mode", there
is, when all radios are blocked.

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wrc.c | 81 +++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/platform/x86/asus-wrc.c b/drivers/platform/x86/asu=
s-wrc.c
index 941ad73..6acb36e 100644
--- a/drivers/platform/x86/asus-wrc.c
+++ b/drivers/platform/x86/asus-wrc.c
@@ -17,11 +17,21 @@
 #include <linux/acpi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/leds.h>
=20
 #define ASUS_WRC_MODULE_NAME "Asus Wireless Radio Control Driver"
=20
+#define ASUS_WRC_LED_STATUS 0x2
+#define ASUS_WRC_LED_OFF 0x4
+#define ASUS_WRC_LED_ON 0x5
+
 struct asus_wrc_data {
 	struct input_dev *inputdev;
+	struct acpi_device *acpidev;
+	struct workqueue_struct *wq;
+	struct work_struct led_work;
+	struct led_classdev led;
+	int led_state;
 };
=20
 static const struct key_entry asus_wrc_keymap[] =3D {
@@ -29,6 +39,57 @@ static const struct key_entry asus_wrc_keymap[] =3D =
{
 	{ KE_END, 0 }
 };
=20
+static u64 asus_wrc_method(acpi_handle handle, const char *method, int=
 param)
+{
+	union acpi_object obj;
+	struct acpi_object_list p;
+	acpi_status s;
+	u64 ret;
+
+	pr_debug("Evaluating method %s, parameter 0x%X\n", method, param);
+
+	obj.type =3D ACPI_TYPE_INTEGER;
+	obj.integer.value =3D param;
+
+	p.count =3D 1;
+	p.pointer =3D &obj;
+
+	s =3D acpi_evaluate_integer(handle, (acpi_string) method, &p, &ret);
+	if (!ACPI_SUCCESS(s))
+		pr_err("Failed to evaluate method %s, parameter 0x%X (%d)\n",
+		       method, param, s);
+
+	pr_debug("%s returned 0x%X\n", method, (uint) ret);
+	return ret;
+}
+
+static enum led_brightness asus_wrc_led_get(struct led_classdev *led)
+{
+	struct asus_wrc_data *data =3D container_of(led, struct asus_wrc_data=
,
+						  led);
+	int s =3D asus_wrc_method(data->acpidev->handle, "HSWC",
+				ASUS_WRC_LED_STATUS);
+	if (s =3D=3D ASUS_WRC_LED_ON)
+		return LED_FULL;
+	return LED_OFF;
+}
+
+static void asus_wrc_led_update(struct work_struct *work)
+{
+	struct asus_wrc_data *data =3D container_of(work, struct asus_wrc_dat=
a,
+						  led_work);
+	asus_wrc_method(data->acpidev->handle, "HSWC", data->led_state);
+}
+
+static void asus_wrc_led_set(struct led_classdev *led,
+			     enum led_brightness value)
+{
+	struct asus_wrc_data *data =3D container_of(led, struct asus_wrc_data=
,
+						  led);
+	data->led_state =3D value =3D=3D LED_OFF ? ASUS_WRC_LED_OFF : ASUS_WR=
C_LED_ON;
+	queue_work(data->wq, &data->led_work);
+}
+
 static void asus_wrc_notify(struct acpi_device *device, u32 event)
 {
 	struct asus_wrc_data *data =3D acpi_driver_data(device);
@@ -50,6 +111,8 @@ static int asus_wrc_add(struct acpi_device *device)
 	if (!data)
 		return -ENOMEM;
=20
+	data->acpidev =3D device;
+
 	data->inputdev =3D input_allocate_device();
 	if (!data->inputdev)
 		goto fail;
@@ -60,6 +123,10 @@ static int asus_wrc_add(struct acpi_device *device)
 	data->inputdev->dev.parent =3D &device->dev;
 	set_bit(EV_REP, data->inputdev->evbit);
=20
+	data->wq =3D create_singlethread_workqueue("asus_wrc_workqueue");
+	if (!data->wq)
+		goto fail;
+
 	err =3D sparse_keymap_setup(data->inputdev, asus_wrc_keymap, NULL);
 	if (err)
 		goto fail;
@@ -68,6 +135,17 @@ static int asus_wrc_add(struct acpi_device *device)
 	if (err)
 		goto fail;
=20
+	INIT_WORK(&data->led_work, asus_wrc_led_update);
+	data->led.name =3D "asus-wrc::airplane_mode";
+	data->led.brightness_set =3D asus_wrc_led_set;
+	data->led.brightness_get =3D asus_wrc_led_get;
+	data->led.flags =3D LED_CORE_SUSPENDRESUME;
+	data->led.max_brightness =3D 1;
+	data->led.default_trigger =3D "rfkill-airplane-mode";
+	err =3D led_classdev_register(&device->dev, &data->led);
+	if (err)
+		goto fail;
+
 	device->driver_data =3D data;
 	return 0;
=20
@@ -89,6 +167,9 @@ static int asus_wrc_remove(struct acpi_device *devic=
e)
 			data->inputdev =3D NULL;
 		}
=20
+		if (data->wq)
+			destroy_workqueue(data->wq);
+
 		kfree(data);
 		data =3D NULL;
 	}
--=20
2.5.0
