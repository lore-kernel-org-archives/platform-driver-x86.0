From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 4/4] asus-wireless: Toggle airplane mode LED
Date: Sat, 26 Dec 2015 09:56:37 -0500
Message-ID: <1451141797-1066-5-git-send-email-jprvita@endlessm.com>
References: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

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
 drivers/platform/x86/asus-wireless.c | 81 ++++++++++++++++++++++++++++=
++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index d3a088b..3d8dc0b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -592,6 +592,8 @@ config ASUS_WIRELESS
 	depends on ACPI
 	depends on INPUT
 	default m
+	select NEW_LEDS
+	select LEDS_CLASS
 	---help---
 	  The Asus Wireless Radio Control handles the airplane mode hotkey
 	  present on some Asus laptops.
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x8=
6/asus-wireless.c
index 7928efd..489ef83 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -17,13 +17,76 @@
 #include <linux/acpi.h>
 #include <linux/input.h>
 #include <linux/pci_ids.h>
+#include <linux/leds.h>
=20
 #define ASUS_WIRELESS_MODULE_NAME "Asus Wireless Radio Control Driver"
+#define ASUS_WIRELESS_LED_STATUS 0x2
+#define ASUS_WIRELESS_LED_OFF 0x4
+#define ASUS_WIRELESS_LED_ON 0x5
=20
 struct asus_wireless_data {
 	struct input_dev *inputdev;
+	struct acpi_device *acpidev;
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
+	pr_debug("Evaluating method %s, parameter 0x%X\n", method, param);
+	obj.type =3D ACPI_TYPE_INTEGER;
+	obj.integer.value =3D param;
+	p.count =3D 1;
+	p.pointer =3D &obj;
+
+	s =3D acpi_evaluate_integer(handle, (acpi_string) method, &p, &ret);
+	if (!ACPI_SUCCESS(s))
+		pr_err("Failed to evaluate method %s, parameter 0x%X (%d)\n",
+		       method, param, s);
+	pr_debug("%s returned 0x%X\n", method, (uint) ret);
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
+	s =3D asus_wireless_method(data->acpidev->handle, "HSWC",
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
+	asus_wireless_method(data->acpidev->handle, "HSWC", data->led_state);
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
 static void asus_wireless_notify(struct acpi_device *device, u32 event=
)
 {
 	struct asus_wireless_data *data =3D acpi_driver_data(device);
@@ -49,6 +112,7 @@ static int asus_wireless_add(struct acpi_device *dev=
ice)
 		return -ENOMEM;
 	device->driver_data =3D data;
=20
+	data->acpidev =3D device;
 	data->inputdev =3D input_allocate_device();
 	if (!data->inputdev)
 		goto fail;
@@ -64,6 +128,21 @@ static int asus_wireless_add(struct acpi_device *de=
vice)
 	err =3D input_register_device(data->inputdev);
 	if (err)
 		goto fail;
+
+	data->wq =3D create_singlethread_workqueue("asus_wireless_workqueue")=
;
+	if (!data->wq)
+		goto fail;
+
+	INIT_WORK(&data->led_work, asus_wireless_led_update);
+	data->led.name =3D "asus-wireless::airplane_mode";
+	data->led.brightness_set =3D asus_wireless_led_set;
+	data->led.brightness_get =3D asus_wireless_led_get;
+	data->led.flags =3D LED_CORE_SUSPENDRESUME;
+	data->led.max_brightness =3D 1;
+	data->led.default_trigger =3D "rfkill-airplane-mode";
+	err =3D led_classdev_register(&device->dev, &data->led);
+	if (err)
+		goto fail;
 	return 0;
=20
 fail:
@@ -78,6 +157,8 @@ static int asus_wireless_remove(struct acpi_device *=
device)
 	pr_info("Removing "ASUS_WIRELESS_MODULE_NAME"\n");
 	if (data->inputdev)
 		input_unregister_device(data->inputdev);
+	if (data->wq)
+		destroy_workqueue(data->wq);
 	kfree(data);
 	return 0;
 }
--=20
2.5.0
