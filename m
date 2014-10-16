From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH 2/2] acpi: Remove _OSI(Linux) for ThinkPads
Date: Thu, 16 Oct 2014 11:02:18 -0700
Message-ID: <69655aaf2db9f0d0c8b81d52f26f4ff8dac935b5.1413481880.git.luto@amacapital.net>
References: <cover.1413481880.git.luto@amacapital.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:45781 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbaJPSCe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Oct 2014 14:02:34 -0400
Received: by mail-pd0-f176.google.com with SMTP id fp1so3640814pdb.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2014 11:02:33 -0700 (PDT)
In-Reply-To: <cover.1413481880.git.luto@amacapital.net>
In-Reply-To: <cover.1413481880.git.luto@amacapital.net>
References: <cover.1413481880.git.luto@amacapital.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net
Cc: Len Brown <len.brown@intel.com>, Jerone Young <jerone.young@canonical.com>, David Henningsson <david.henningsson@canonical.com>, Takashi Iwai <tiwai@suse.de>, Grant Diffey <gdiffey@gmail.com>, ALSA development <alsa-devel@alsa-project.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>

AFAICT the only reason to set _OSI(Linux) on ThinkPads is to get
sensible mute button behavior.  Now that the thinkpad_acpi driver
can do this on is own, there is no reason to keep the ACPI
quirk.

Cc: Len Brown <len.brown@intel.com>
Cc: Jerone Young <jerone.young@canonical.com>
Signed-off-by: Andy Lutomirski <luto@amacapital.net>
---
 drivers/acpi/blacklist.c | 54 ------------------------------------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/acpi/blacklist.c b/drivers/acpi/blacklist.c
index 36eb42e3b0bb..4a3cbb5d3c55 100644
--- a/drivers/acpi/blacklist.c
+++ b/drivers/acpi/blacklist.c
@@ -265,60 +265,6 @@ static struct dmi_system_id acpi_osi_dmi_table[] __initdata = {
 	 */
 
 	/*
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
-	/*
 	 * Without this this EEEpc exports a non working WMI interface, with
 	 * this it exports a working "good old" eeepc_laptop interface, fixing
 	 * both brightness control, and rfkill not working.
-- 
1.9.3
