From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 380/493] platform/x86: remove use of __devinitconst
Date: Mon, 19 Nov 2012 13:25:29 -0500
Message-ID: <1353349642-3677-380-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41486 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754228Ab2KSSes (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:34:48 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devinitconst is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Matthew Garrett <mjg@redhat.com> 
Cc: platform-driver-x86@vger.kernel.org 
---
 drivers/platform/x86/amilo-rfkill.c | 2 +-
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
index d2863c0..6296f07 100644
--- a/drivers/platform/x86/amilo-rfkill.c
+++ b/drivers/platform/x86/amilo-rfkill.c
@@ -74,7 +74,7 @@ static const struct rfkill_ops amilo_m7440_rfkill_ops = {
 	.set_block = amilo_m7440_rfkill_set_block
 };
 
-static const struct dmi_system_id __devinitconst amilo_rfkill_id_table[] = {
+static const struct dmi_system_id amilo_rfkill_id_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 06908a5..1509318 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -150,7 +150,7 @@ static const struct acpi_device_id toshiba_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, toshiba_device_ids);
 
-static const struct key_entry toshiba_acpi_keymap[] __devinitconst = {
+static const struct key_entry toshiba_acpi_keymap[] = {
 	{ KE_KEY, 0x101, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
 	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
-- 
1.8.0
