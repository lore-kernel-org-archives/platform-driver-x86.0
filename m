From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] Input: soc_button_array - Add active_low setting to soc_button_info
Date: Thu, 14 May 2020 22:52:41 +0200
Message-ID: <20200514205242.138230-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

This is a preparation patch for adding support for Intel INT33D3
ACPI devices. These INT33D3 devices follow yet another Intel defined
(but not documented) ACPI GPIO button standard.

Unlike the ACPI GPIO button devices supported so far, the GPIO used in
the INT33D3 devices is active-high, rather then active-low.

This commit makes setting the gpio_keys_button.active_low flag
configurable through the soc_button_info struct and enables it for all
currently supported devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 08520b3a18b8..e3a22a61f5d9 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -23,6 +23,7 @@ struct soc_button_info {
 	unsigned int event_code;
 	bool autorepeat;
 	bool wakeup;
+	bool active_low;
 };
 
 struct soc_device_data {
@@ -110,7 +111,7 @@ soc_button_device_create(struct platform_device *pdev,
 		gpio_keys[n_buttons].type = info->event_type;
 		gpio_keys[n_buttons].code = info->event_code;
 		gpio_keys[n_buttons].gpio = gpio;
-		gpio_keys[n_buttons].active_low = 1;
+		gpio_keys[n_buttons].active_low = info->active_low;
 		gpio_keys[n_buttons].desc = info->name;
 		gpio_keys[n_buttons].wakeup = info->wakeup;
 		/* These devices often use cheap buttons, use 50 ms debounce */
@@ -173,6 +174,7 @@ static int soc_button_parse_btn_desc(struct device *dev,
 	}
 
 	info->event_type = EV_KEY;
+	info->active_low = true;
 	info->acpi_index =
 		soc_button_get_acpi_object_int(&desc->package.elements[1]);
 	upage = soc_button_get_acpi_object_int(&desc->package.elements[3]);
@@ -383,11 +385,11 @@ static int soc_button_probe(struct platform_device *pdev)
  * Platforms"
  */
 static const struct soc_button_info soc_button_PNP0C40[] = {
-	{ "power", 0, EV_KEY, KEY_POWER, false, true },
-	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true },
-	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
-	{ "volume_down", 3, EV_KEY, KEY_VOLUMEDOWN, true, false },
-	{ "rotation_lock", 4, EV_KEY, KEY_ROTATE_LOCK_TOGGLE, false, false },
+	{ "power", 0, EV_KEY, KEY_POWER, false, true, true },
+	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false, true },
+	{ "volume_down", 3, EV_KEY, KEY_VOLUMEDOWN, true, false, true },
+	{ "rotation_lock", 4, EV_KEY, KEY_ROTATE_LOCK_TOGGLE, false, false, true },
 	{ }
 };
 
@@ -444,9 +446,9 @@ static int soc_device_check_MSHW0040(struct device *dev)
  * Obtained from DSDT/testing.
  */
 static const struct soc_button_info soc_button_MSHW0040[] = {
-	{ "power", 0, EV_KEY, KEY_POWER, false, true },
-	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
-	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false },
+	{ "power", 0, EV_KEY, KEY_POWER, false, true, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false, true },
+	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false, true },
 	{ }
 };
 
-- 
2.26.0
