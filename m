From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 5/5] platform/x86: fujitsu-laptop: remove pf_device field from struct fujitsu_bl
Date: Tue, 14 Mar 2017 11:26:31 +0100
Message-ID: <20170314102631.8203-6-kernel@kempniu.pl>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Both struct fujitsu_bl and struct fujitsu_laptop have a pf_device field.
Up until now the latter has been redundant, which is logically incorrect
because the primary function of the platform device created by
fujitsu-laptop is to provide laptop-related (not brightness-related)
attributes to userspace.

Remove the pf_device field from struct fujitsu_bl and make all module
code use the pf_device field of struct fujitsu_laptop instead.

Suggested-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a2641cb79df9..f3ccef3d5a1e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -138,7 +138,6 @@ struct fujitsu_bl {
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
-	struct platform_device *pf_device;
 	int keycode1, keycode2, keycode3, keycode4, keycode5;
 
 	unsigned int max_brightness;
@@ -769,15 +768,15 @@ static int fujitsu_laptop_platform_add(void)
 {
 	int ret;
 
-	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
-	if (!fujitsu_bl->pf_device)
+	fujitsu_laptop->pf_device = platform_device_alloc("fujitsu-laptop", -1);
+	if (!fujitsu_laptop->pf_device)
 		return -ENOMEM;
 
-	ret = platform_device_add(fujitsu_bl->pf_device);
+	ret = platform_device_add(fujitsu_laptop->pf_device);
 	if (ret)
 		goto err_put_platform_device;
 
-	ret = sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
+	ret = sysfs_create_group(&fujitsu_laptop->pf_device->dev.kobj,
 				 &fujitsu_pf_attribute_group);
 	if (ret)
 		goto err_del_platform_device;
@@ -785,18 +784,18 @@ static int fujitsu_laptop_platform_add(void)
 	return 0;
 
 err_del_platform_device:
-	platform_device_del(fujitsu_bl->pf_device);
+	platform_device_del(fujitsu_laptop->pf_device);
 err_put_platform_device:
-	platform_device_put(fujitsu_bl->pf_device);
+	platform_device_put(fujitsu_laptop->pf_device);
 
 	return ret;
 }
 
 static void fujitsu_laptop_platform_remove(void)
 {
-	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
+	sysfs_remove_group(&fujitsu_laptop->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
-	platform_device_unregister(fujitsu_bl->pf_device);
+	platform_device_unregister(fujitsu_laptop->pf_device);
 }
 
 static int acpi_fujitsu_laptop_add(struct acpi_device *device)
@@ -909,7 +908,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&logolamp_led);
 		if (result == 0) {
 			fujitsu_laptop->logolamp_registered = 1;
@@ -921,7 +920,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	   (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&kblamps_led);
 		if (result == 0) {
 			fujitsu_laptop->kblamps_registered = 1;
@@ -938,7 +937,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	 * that an RF LED is present.
 	 */
 	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&radio_led);
 		if (result == 0) {
 			fujitsu_laptop->radio_led_registered = 1;
@@ -955,7 +954,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	*/
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
 	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&eco_led);
 		if (result == 0) {
 			fujitsu_laptop->eco_led_registered = 1;
-- 
2.12.0
