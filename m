From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 1/2] asus-wireless: Toggle airplane mode LED
Date: Tue,  5 Jan 2016 21:19:27 -0500
Message-ID: <1452046768-6291-2-git-send-email-jprvita@endlessm.com>
References: <1452046768-6291-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:33770 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809AbcAFCTm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 21:19:42 -0500
In-Reply-To: <1452046768-6291-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

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
 drivers/platform/x86/Kconfig         |  2 +
 drivers/platform/x86/asus-wireless.c | 92 ++++++++++++++++++++++++++++=
+++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index f37821f..5798cc4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -591,6 +591,8 @@ config ASUS_WIRELESS
 	tristate "Asus Wireless Radio Control Driver"
 	depends on ACPI
 	depends on INPUT
+	select NEW_LEDS
+	select LEDS_CLASS
 	---help---
 	  The Asus Wireless Radio Control handles the airplane mode hotkey
 	  present on some Asus laptops.
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x8=
6/asus-wireless.c
index 9ec721e..51a33a0 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -15,11 +15,78 @@
 #include <linux/acpi.h>
 #include <linux/input.h>
 #include <linux/pci_ids.h>
+#include <linux/leds.h>
+
+#define ASUS_WIRELESS_LED_STATUS 0x2
+#define ASUS_WIRELESS_LED_OFF 0x4
+#define ASUS_WIRELESS_LED_ON 0x5
=20
 struct asus_wireless_data {
 	struct input_dev *idev;
+	struct acpi_device *adev;
+	struct workqueue_struct *wq;
+	struct work_struct led_work;
+	struct led_classdev led;
+	int led_state;
 };
=20
+static u64 asus_wireless_method(acpi_handle handle, const char *method=
,
+				int param)
+{
+	union acpi_object obj;
+	struct acpi_object_list p;
+	acpi_status s;
+	u64 ret;
+
+	acpi_handle_debug(handle, "Evaluating method %s, parameter 0x%X\n",
+			  method, param);
+	obj.type =3D ACPI_TYPE_INTEGER;
+	obj.integer.value =3D param;
+	p.count =3D 1;
+	p.pointer =3D &obj;
+
+	s =3D acpi_evaluate_integer(handle, (acpi_string) method, &p, &ret);
+	if (ACPI_FAILURE(s))
+		acpi_handle_err(handle,
+				"Failed to eval method %s, param 0x%X (%d)\n",
+				method, param, s);
+	acpi_handle_debug(handle, "%s returned 0x%X\n", method, (uint) ret);
+	return ret;
+}
+
+static enum led_brightness asus_wireless_led_get(struct led_classdev *=
led)
+{
+	struct asus_wireless_data *data;
+	int s;
+
+	data =3D container_of(led, struct asus_wireless_data, led);
+	s =3D asus_wireless_method(acpi_device_handle(data->adev), "HSWC",
+				 ASUS_WIRELESS_LED_STATUS);
+	if (s =3D=3D ASUS_WIRELESS_LED_ON)
+		return LED_FULL;
+	return LED_OFF;
+}
+
+static void asus_wireless_led_update(struct work_struct *work)
+{
+	struct asus_wireless_data *data;
+
+	data =3D container_of(work, struct asus_wireless_data, led_work);
+	asus_wireless_method(acpi_device_handle(data->adev), "HSWC",
+			     data->led_state);
+}
+
+static void asus_wireless_led_set(struct led_classdev *led,
+				  enum led_brightness value)
+{
+	struct asus_wireless_data *data;
+
+	data =3D container_of(led, struct asus_wireless_data, led);
+	data->led_state =3D value =3D=3D LED_OFF ? ASUS_WIRELESS_LED_OFF :
+					     ASUS_WIRELESS_LED_ON;
+	queue_work(data->wq, &data->led_work);
+}
+
 static void asus_wireless_notify(struct acpi_device *adev, u32 event)
 {
 	struct asus_wireless_data *data =3D acpi_driver_data(adev);
@@ -37,6 +104,7 @@ static void asus_wireless_notify(struct acpi_device =
*adev, u32 event)
 static int asus_wireless_add(struct acpi_device *adev)
 {
 	struct asus_wireless_data *data;
+	int err;
=20
 	data =3D devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -52,11 +120,33 @@ static int asus_wireless_add(struct acpi_device *a=
dev)
 	data->idev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
 	set_bit(EV_KEY, data->idev->evbit);
 	set_bit(KEY_RFKILL, data->idev->keybit);
-	return input_register_device(data->idev);
+	err =3D input_register_device(data->idev);
+	if (err)
+		return err;
+
+	data->adev =3D adev;
+	data->wq =3D create_singlethread_workqueue("asus_wireless_workqueue")=
;
+	if (!data->wq)
+		return -ENOMEM;
+	INIT_WORK(&data->led_work, asus_wireless_led_update);
+	data->led.name =3D "asus-wireless::airplane_mode";
+	data->led.brightness_set =3D asus_wireless_led_set;
+	data->led.brightness_get =3D asus_wireless_led_get;
+	data->led.flags =3D LED_CORE_SUSPENDRESUME;
+	data->led.max_brightness =3D 1;
+	data->led.default_trigger =3D "rfkill-airplane-mode";
+	err =3D devm_led_classdev_register(&adev->dev, &data->led);
+	if (err)
+		destroy_workqueue(data->wq);
+	return err;
 }
=20
 static int asus_wireless_remove(struct acpi_device *adev)
 {
+	struct asus_wireless_data *data =3D acpi_driver_data(adev);
+
+	if (data->wq)
+		destroy_workqueue(data->wq);
 	return 0;
 }
=20
--=20
2.5.0
