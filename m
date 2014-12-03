From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] dell-laptop: fix kbd_timeout handling
Date: Wed, 3 Dec 2014 13:01:59 +0300
Message-ID: <20141203100159.GA18731@mwanda>
References: <1417597233.14672.2.camel@Pali-Nokia-N900>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <1417597233.14672.2.camel@Pali-Nokia-N900>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, kbuild@01.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The original code had a static checker warning:

	drivers/platform/x86/dell-laptop.c:1389 kbd_led_timeout_store()
	warn: this array is probably non-NULL. 'quirks->kbd_timeouts'

This warning does indicate a bug.  I have added a .needs_kbd_timeouts
flag which is true if the .kbd_timeouts[] array has been declared.
Otherwise, in the original code the quirk_dell_vostro_v130 struct didn't
have .kbd_timeouts[] declared so the loop:

	for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {

Would have read beyond the end of the struct with unpredictable results.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This fixes a patch in Darren Hart's tree and it may not have yet reached
linux-next.  The patch is 167e24aa8adf ('platform: x86: dell-laptop: Add
support for keyboard backlight')

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 46e9037..a311375 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -72,6 +72,7 @@ struct calling_interface_structure {
 struct quirk_entry {
 	u8 touchpad_led;
 
+	int needs_kbd_timeouts;
 	/* Ordered list of timeouts expressed in seconds.
 	 * The list must end with -1 */
 	int kbd_timeouts[];
@@ -90,6 +91,7 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 }
 
 static struct quirk_entry quirk_dell_xps13_9333 = {
+	.needs_kbd_timeouts = 1,
 	.kbd_timeouts = { 0, 5, 15, 60, 5*60, 15*60, -1 },
 };
 
@@ -1386,7 +1388,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (quirks && quirks->kbd_timeouts)
+	if (quirks && quirks->needs_kbd_timeouts)
 		convert = true;
 
 	if (convert) {
@@ -1401,7 +1403,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 			unit = KBD_TIMEOUT_SECONDS;
 		}
 
-		if (quirks && quirks->kbd_timeouts) {
+		if (quirks && quirks->needs_kbd_timeouts) {
 			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
 				if (value <= quirks->kbd_timeouts[i]) {
 					value = quirks->kbd_timeouts[i];
