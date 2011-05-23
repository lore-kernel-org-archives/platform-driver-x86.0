From: Andy Lutomirski <luto@MIT.EDU>
Subject: [PATCH] Remove ThinkPads from _OSI(Linux) blacklist
Date: Mon, 23 May 2011 09:15:16 -0400
Message-ID: <2ef7d4696f9eeb60d9dfb85a7bc2efef132f3e96.1306156342.git.luto@mit.edu>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from DMZ-MAILSEC-SCANNER-2.MIT.EDU ([18.9.25.13]:49153 "EHLO
	dmz-mailsec-scanner-2.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752209Ab1EWNPc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2011 09:15:32 -0400
In-Reply-To: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Lutomirski <luto@mit.edu>, Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Now that thinkpad-acpi knows how to program the hardware mute button
on recent ThinkPads, the _OSI(Linux) hack is unnecessary.

Signed-off-by: Andy Lutomirski <luto@mit.edu>
---

I don't have all of these machines to test, but at least the X220 and
X200s don't need the blacklist anymore if the thinkpad-acpi volume
control patch is applied.

(I was one of the people who argued for the X61 blacklist entry, and
the X61 almost certainly doesn't need the blacklist anymore, but I
can't test because I don't have that box any more.)

I didn't remove the blacklist infrastructure because something else
might need it some day.

 drivers/acpi/blacklist.c |   54 ----------------------------------------------
 1 files changed, 0 insertions(+), 54 deletions(-)

diff --git a/drivers/acpi/blacklist.c b/drivers/acpi/blacklist.c
index af308d0..de0943d 100644
--- a/drivers/acpi/blacklist.c
+++ b/drivers/acpi/blacklist.c
@@ -274,60 +274,6 @@ static struct dmi_system_id acpi_osi_dmi_table[] __initdata = {
 	 * Linux ignores it, except for the machines enumerated below.
 	 */
 
-	/*
-	 * Lenovo has a mix of systems OSI(Linux) situations
-	 * and thus we can not wildcard the vendor.
-	 *
-	 * _OSI(Linux) helps sound
-	 * DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad R61"),
-	 * DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad T61"),
-	 * T400, T500
-	 * _OSI(Linux) has Linux specific hooks
-	 * DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X61"),
-	 * _OSI(Linux) is a NOP:
-	 * DMI_MATCH(DMI_PRODUCT_VERSION, "3000 N100"),
-	 * DMI_MATCH(DMI_PRODUCT_VERSION, "LENOVO3000 V100"),
-	 */
-	{
-	.callback = dmi_enable_osi_linux,
-	.ident = "Lenovo ThinkPad R61",
-	.matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad R61"),
-		},
-	},
-	{
-	.callback = dmi_enable_osi_linux,
-	.ident = "Lenovo ThinkPad T61",
-	.matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad T61"),
-		},
-	},
-	{
-	.callback = dmi_enable_osi_linux,
-	.ident = "Lenovo ThinkPad X61",
-	.matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X61"),
-		},
-	},
-	{
-	.callback = dmi_enable_osi_linux,
-	.ident = "Lenovo ThinkPad T400",
-	.matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad T400"),
-		},
-	},
-	{
-	.callback = dmi_enable_osi_linux,
-	.ident = "Lenovo ThinkPad T500",
-	.matches = {
-		     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad T500"),
-		},
-	},
 	{}
 };
 
-- 
1.7.5.1
