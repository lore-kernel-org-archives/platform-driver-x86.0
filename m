From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH] platform/x86: dell-rbtn: Improve explanation about DELLABC6
Date: Fri, 26 May 2017 22:16:19 -0700
Message-ID: <c3d605a0a82e819891fec18b4057406358878a76.1495862179.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Lutomirski <luto@kernel.org>

According to Mario at Dell, the DELLABC6 device should not be used on a
Linux system. It also conflicts with Intel-HID and its interactions with
Network Manager. Document that we are aware of the device, but that we
are intentionally ignoring it.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
[dvhart: New commit message and minor comment wording fixes]
Cc: Mario Limonciello <mario_limonciello@dell.com>
Cc: "Pali Rohár" <pali.rohar@gmail.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index dcd9f40..2eeef03 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -223,14 +223,26 @@ static const struct acpi_device_id rbtn_ids[] = {
 	 * This driver can also handle the "DELLABC6" device that
 	 * appears on the XPS 13 9350, but that device is disabled
 	 * by the DSDT unless booted with acpi_osi="!Windows 2012"
-	 * acpi_osi="!Windows 2013".  Even if we boot that and bind
-	 * the driver, we seem to have inconsistent behavior in
-	 * which NetworkManager can get out of sync with the rfkill
-	 * state.
+	 * acpi_osi="!Windows 2013".
 	 *
-	 * On the XPS 13 9350 and similar laptops, we're not supposed to
-	 * use DELLABC6 at all.  Instead, we handle the rfkill button
-	 * via the intel-hid driver.
+	 * According to Mario at Dell:
+	 *
+	 *  DELLABC6 is a custom interface that was created solely to
+	 *  have airplane mode support for Windows 7.  For Windows 10
+	 *  the proper interface is to use that which is handled by
+	 *  intel-hid.  A OEM airplane mode driver is not used.
+	 *
+	 *  Since the kernel doesn't identify as Windows 7 it would be
+	 *  incorrect to do attempt to use that interface.
+	 *
+	 * Even if we override _OSI and bind to DELLABC6, we end up
+	 * with inconsistent behavior in which NetworkManager can get
+	 * out of sync with the rfkill state.  This happens because
+	 * NetworkManager receives events from intel-hid and fights with
+	 * dell-rbtn for control.
+	 *
+	 * The upshot is that it's better to just ignore DELLABC6
+	 * devices.
 	 */
 
 	{ "", 0 },
-- 
2.9.4
