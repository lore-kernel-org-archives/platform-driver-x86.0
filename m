From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 2/4] platform/x86/dell-laptop: Refactor kbd_led_triggers_store()
Date: Thu, 16 Mar 2017 11:55:33 +0100
Message-ID: <20170316105535.8885-2-hdegoede@redhat.com>
References: <20170316105535.8885-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41578 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751901AbdCPKzu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2017 06:55:50 -0400
In-Reply-To: <20170316105535.8885-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org

Return -EINVAL immediately on invalid input, rather then doing
the straight path in an if block and returning -EINVAL at the end
of the function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
Changes in v8:
-New patch in v8 of this patch-set
---
 drivers/platform/x86/dell-laptop.c | 63 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f57dd28..4de7aa0 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1666,38 +1666,39 @@ static ssize_t kbd_led_triggers_store(struct device *dev,
 		}
 	}
 
-	if (trigger_bit != -1) {
-		new_state = state;
-		if (trigger[0] == '+')
-			new_state.triggers |= BIT(trigger_bit);
-		else {
-			new_state.triggers &= ~BIT(trigger_bit);
-			/* NOTE: trackstick bit (2) must be disabled when
-			 *       disabling touchpad bit (1), otherwise touchpad
-			 *       bit (1) will not be disabled */
-			if (trigger_bit == 1)
-				new_state.triggers &= ~BIT(2);
-		}
-		if ((kbd_info.triggers & new_state.triggers) !=
-		    new_state.triggers)
-			return -EINVAL;
-		if (new_state.triggers && !triggers_enabled) {
-			new_state.mode_bit = KBD_MODE_BIT_TRIGGER;
-			kbd_set_level(&new_state, kbd_previous_level);
-		} else if (new_state.triggers == 0) {
-			kbd_set_level(&new_state, 0);
-		}
-		if (!(kbd_info.modes & BIT(new_state.mode_bit)))
-			return -EINVAL;
-		ret = kbd_set_state_safe(&new_state, &state);
-		if (ret)
-			return ret;
-		if (new_state.mode_bit != KBD_MODE_BIT_OFF)
-			kbd_previous_mode_bit = new_state.mode_bit;
-		return count;
-	}
+	if (trigger_bit == -1)
+		return -EINVAL;
 
-	return -EINVAL;
+	new_state = state;
+	if (trigger[0] == '+')
+		new_state.triggers |= BIT(trigger_bit);
+	else {
+		new_state.triggers &= ~BIT(trigger_bit);
+		/*
+		 * NOTE: trackstick bit (2) must be disabled when
+		 *       disabling touchpad bit (1), otherwise touchpad
+		 *       bit (1) will not be disabled
+		 */
+		if (trigger_bit == 1)
+			new_state.triggers &= ~BIT(2);
+	}
+	if ((kbd_info.triggers & new_state.triggers) !=
+	    new_state.triggers)
+		return -EINVAL;
+	if (new_state.triggers && !triggers_enabled) {
+		new_state.mode_bit = KBD_MODE_BIT_TRIGGER;
+		kbd_set_level(&new_state, kbd_previous_level);
+	} else if (new_state.triggers == 0) {
+		kbd_set_level(&new_state, 0);
+	}
+	if (!(kbd_info.modes & BIT(new_state.mode_bit)))
+		return -EINVAL;
+	ret = kbd_set_state_safe(&new_state, &state);
+	if (ret)
+		return ret;
+	if (new_state.mode_bit != KBD_MODE_BIT_OFF)
+		kbd_previous_mode_bit = new_state.mode_bit;
+	return count;
 }
 
 static ssize_t kbd_led_triggers_show(struct device *dev,
-- 
2.9.3
