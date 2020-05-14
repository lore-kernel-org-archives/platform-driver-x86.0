From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] Input: soc_button_array - Add support for INT33D3 tablet-mode switch devices
Date: Thu, 14 May 2020 22:52:42 +0200
Message-ID: <20200514205242.138230-2-hdegoede@redhat.com>
References: <20200514205242.138230-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200514205242.138230-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

According to the Microsoft documentation for Windows 8 convertible
devices, these devices should implement a PNP0C60 "laptop/slate mode state
indicator" ACPI device.

This device can work in 2 ways, if there is a GPIO which directly
indicates the device is in tablet-mode or not then the direct-gpio mode
should be used. If there is no such GPIO, but instead the events are
coming from e.g. the embedded-controller, then there should still be
a PNP0C60 ACPI device and event-injection should be used to send the
events. The drivers/platform/x86/intel-vbtn.c code is an example from
a standardized manner of doing the latter.

On various 2-in-1s with either a detachable keyboard, or with 360°
hinges, the direct GPIO mode is indicated by an ACPI device with a
HID of INT33D3, which contains a single GpioInt in its ACPI resource
table, which directly indicates if the device is in tablet-mode or not.

This commit adds support for this to the soc_button_array code, as
well as for the alternative ID9001 HID which some devices use
instead of the INT33D3 HID.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index e3a22a61f5d9..837c787e9c4b 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -397,6 +397,15 @@ static const struct soc_device_data soc_device_PNP0C40 = {
 	.button_info = soc_button_PNP0C40,
 };
 
+static const struct soc_button_info soc_button_INT33D3[] = {
+	{ "tablet_mode", 0, EV_SW, SW_TABLET_MODE, false, false, false },
+	{ }
+};
+
+static const struct soc_device_data soc_device_INT33D3 = {
+	.button_info = soc_button_INT33D3,
+};
+
 /*
  * Special device check for Surface Book 2 and Surface Pro (2017).
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
@@ -459,6 +468,8 @@ static const struct soc_device_data soc_device_MSHW0040 = {
 
 static const struct acpi_device_id soc_button_acpi_match[] = {
 	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
+	{ "INT33D3", (unsigned long)&soc_device_INT33D3 },
+	{ "ID9001", (unsigned long)&soc_device_INT33D3 },
 	{ "ACPI0011", 0 },
 
 	/* Microsoft Surface Devices (5th and 6th generation) */
-- 
2.26.0
