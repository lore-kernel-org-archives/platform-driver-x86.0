From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 05/10] platform/x86: fujitsu-laptop: replace numeric values with constants
Date: Wed,  8 Feb 2017 14:46:28 +0100
Message-ID: <20170208134633.5152-6-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Replace three repeating numeric values with constants to improve code
clarity.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 55d696262301..deef40a03b6d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -97,6 +97,11 @@
 /* FUNC interface - responses */
 #define UNSUPPORTED_CMD 0x80000000
 
+/* FUNC interface - status flags */
+#define FLAG_RFKILL	0x020
+#define FLAG_LID	0x100
+#define FLAG_DOCK	0x200
+
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 /* FUNC interface - LED control */
 #define FUNC_LED_OFF	0x1
@@ -567,9 +572,9 @@ static ssize_t
 show_lid_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & 0x100))
+	if (!(fujitsu_laptop->flags_supported & FLAG_LID))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & 0x100)
+	if (fujitsu_laptop->flags_state & FLAG_LID)
 		return sprintf(buf, "open\n");
 	else
 		return sprintf(buf, "closed\n");
@@ -579,9 +584,9 @@ static ssize_t
 show_dock_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & 0x200))
+	if (!(fujitsu_laptop->flags_supported & FLAG_DOCK))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & 0x200)
+	if (fujitsu_laptop->flags_state & FLAG_DOCK)
 		return sprintf(buf, "docked\n");
 	else
 		return sprintf(buf, "undocked\n");
@@ -591,9 +596,9 @@ static ssize_t
 show_radios_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & 0x20))
+	if (!(fujitsu_laptop->flags_supported & FLAG_RFKILL))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & 0x20)
+	if (fujitsu_laptop->flags_state & FLAG_RFKILL)
 		return sprintf(buf, "on\n");
 	else
 		return sprintf(buf, "killed\n");
-- 
2.11.1
