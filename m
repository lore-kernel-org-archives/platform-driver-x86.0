From: Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
Date: Thu, 27 Aug 2020 13:52:22 -0600
Message-ID: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com, Shirish.S@amd.com, Raul E Rangel <rrangel@chromium.org>, Andy Shevchenko <andy@infradead.org>, Dan Murphy <dmurphy@ti.com>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>, Rajat Jain <rajatja@google.com>, Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The i8042_mutex must be held by writers of the AUX and KBD ports, as
well as users of i8042_command. There were a lot of users of
i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
This resulted in i8042_commands being issues in between PS/2
transactions.

This change moves the mutex lock into i8042_command and removes the
burden of locking the mutex from the callers.

It is expected that the i8042_mutex is locked before calling
i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
layer via ps2_begin_command and ps2_end_command. Other modules
(serio_raw) do not currently lock the mutex, so there is still a
possibility for intermixed commands.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/input/serio/i8042.c         | 29 ++++++++++++++---------------
 drivers/leds/leds-clevo-mail.c      |  9 ---------
 drivers/platform/x86/acer-wmi.c     |  2 --
 drivers/platform/x86/amilo-rfkill.c |  2 --
 include/linux/i8042.h               | 10 ----------
 5 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 0dddf273afd94..8590e51bcc087 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -137,8 +137,7 @@ static DEFINE_SPINLOCK(i8042_lock);
 
 /*
  * Writers to AUX and KBD ports as well as users issuing i8042_command
- * directly should acquire i8042_mutex (by means of calling
- * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
+ * directly should acquire i8042_mutex to ensure that
  * they do not disturb each other (unfortunately in many i8042
  * implementations write to one of the ports will immediately abort
  * command that is being processed by another port).
@@ -173,18 +172,6 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id);
 static bool (*i8042_platform_filter)(unsigned char data, unsigned char str,
 				     struct serio *serio);
 
-void i8042_lock_chip(void)
-{
-	mutex_lock(&i8042_mutex);
-}
-EXPORT_SYMBOL(i8042_lock_chip);
-
-void i8042_unlock_chip(void)
-{
-	mutex_unlock(&i8042_mutex);
-}
-EXPORT_SYMBOL(i8042_unlock_chip);
-
 int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char str,
 					struct serio *serio))
 {
@@ -343,10 +330,14 @@ int i8042_command(unsigned char *param, int command)
 	unsigned long flags;
 	int retval;
 
+	mutex_lock(&i8042_mutex);
+
 	spin_lock_irqsave(&i8042_lock, flags);
 	retval = __i8042_command(param, command);
 	spin_unlock_irqrestore(&i8042_lock, flags);
 
+	 mutex_unlock(&i8042_mutex);
+
 	return retval;
 }
 EXPORT_SYMBOL(i8042_command);
@@ -379,10 +370,18 @@ static int i8042_kbd_write(struct serio *port, unsigned char c)
 static int i8042_aux_write(struct serio *serio, unsigned char c)
 {
 	struct i8042_port *port = serio->port_data;
+	unsigned long flags;
+	int retval = 0;
+
+	spin_lock_irqsave(&i8042_lock, flags);
 
-	return i8042_command(&c, port->mux == -1 ?
+	retval = __i8042_command(&c, port->mux == -1 ?
 					I8042_CMD_AUX_SEND :
 					I8042_CMD_MUX_SEND + port->mux);
+
+	spin_unlock_irqrestore(&i8042_lock, flags);
+
+	return retval;
 }
 
 
diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
index f512e99b976b1..6c3d7e54f95cf 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -95,17 +95,12 @@ MODULE_DEVICE_TABLE(dmi, clevo_mail_led_dmi_table);
 static void clevo_mail_led_set(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
-	i8042_lock_chip();
-
 	if (value == LED_OFF)
 		i8042_command(NULL, CLEVO_MAIL_LED_OFF);
 	else if (value <= LED_HALF)
 		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
 	else
 		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
-
-	i8042_unlock_chip();
-
 }
 
 static int clevo_mail_led_blink(struct led_classdev *led_cdev,
@@ -114,8 +109,6 @@ static int clevo_mail_led_blink(struct led_classdev *led_cdev,
 {
 	int status = -EINVAL;
 
-	i8042_lock_chip();
-
 	if (*delay_on == 0 /* ms */ && *delay_off == 0 /* ms */) {
 		/* Special case: the leds subsystem requested us to
 		 * chose one user friendly blinking of the LED, and
@@ -142,8 +135,6 @@ static int clevo_mail_led_blink(struct led_classdev *led_cdev,
 		       *delay_on, *delay_off);
 	}
 
-	i8042_unlock_chip();
-
 	return status;
 }
 
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 60c18f21588dd..6cb6f800503b2 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1044,9 +1044,7 @@ static acpi_status WMID_set_u32(u32 value, u32 cap)
 			return AE_BAD_PARAMETER;
 		if (quirks->mailled == 1) {
 			param = value ? 0x92 : 0x93;
-			i8042_lock_chip();
 			i8042_command(&param, 0x1059);
-			i8042_unlock_chip();
 			return 0;
 		}
 		break;
diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
index 493e169c8f615..ce68d0c9ac29f 100644
--- a/drivers/platform/x86/amilo-rfkill.c
+++ b/drivers/platform/x86/amilo-rfkill.c
@@ -30,9 +30,7 @@ static int amilo_a1655_rfkill_set_block(void *data, bool blocked)
 	u8 param = blocked ? A1655_WIFI_OFF : A1655_WIFI_ON;
 	int rc;
 
-	i8042_lock_chip();
 	rc = i8042_command(&param, A1655_WIFI_COMMAND);
-	i8042_unlock_chip();
 	return rc;
 }
 
diff --git a/include/linux/i8042.h b/include/linux/i8042.h
index 0261e2fb36364..1c081081c161d 100644
--- a/include/linux/i8042.h
+++ b/include/linux/i8042.h
@@ -55,8 +55,6 @@ struct serio;
 
 #if defined(CONFIG_SERIO_I8042) || defined(CONFIG_SERIO_I8042_MODULE)
 
-void i8042_lock_chip(void);
-void i8042_unlock_chip(void);
 int i8042_command(unsigned char *param, int command);
 int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char str,
 					struct serio *serio));
@@ -65,14 +63,6 @@ int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned char str,
 
 #else
 
-static inline void i8042_lock_chip(void)
-{
-}
-
-static inline void i8042_unlock_chip(void)
-{
-}
-
 static inline int i8042_command(unsigned char *param, int command)
 {
 	return -ENODEV;
-- 
2.28.0.297.g1956fa8f8d-goog
