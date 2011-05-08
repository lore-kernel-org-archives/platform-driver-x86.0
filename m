From: Andy Lutomirski <luto@MIT.EDU>
Subject: [PATCH] thinkpad-acpi: module autoloading for newer Lenovo ThinkPads.
Date: Sun,  8 May 2011 17:58:49 -0400
Message-ID: <8d66d95c39ba6e68e2acb53ddafabcb3e401635e.1304890969.git.luto@mit.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from DMZ-MAILSEC-SCANNER-6.MIT.EDU ([18.7.68.35]:50336 "EHLO
	dmz-mailsec-scanner-6.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754246Ab1EHV70 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 8 May 2011 17:59:26 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andrew Lutomirski <luto@mit.edu>, Manoj Iyer <manoj.iyer@canonical.com>

From: Andrew Lutomirski <luto@mit.edu>

From: Manoj Iyer <manoj.iyer@canonical.com>
Date: Mon, 7 Mar 2011 17:26:47 -0600

The newer Lenovo ThinkPads have HKEY HID of LEN0068 instead
of IBM0068. Added new HID so that thinkpad_acpi module will
auto load on these newer Lenovo ThinkPads.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: stable@kernel.org
Signed-off-by: Manoj Iyer <manoj.iyer@canonical.com>
Signed-off-by: Andy Lutomirski <luto@mit.edu>
---

Hi, mjg-

Can you add this to your tree for 2.6.39 (or 2.6.40 if you think it's
too late for a missing device ID)?  This is needed on a bunch of new
ThinkPad laptops (including mine).  Henrique asked me to forward my patch
or this one, and I think this one is slightly prettier.

hmh's email:

http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg01817.html

original patch from Manoj Iyer:

https://lkml.org/lkml/2011/3/8/125

 drivers/platform/x86/thinkpad_acpi.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index eb99223..125d891 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -128,7 +128,8 @@ enum {
 };
 
 /* ACPI HIDs */
-#define TPACPI_ACPI_HKEY_HID		"IBM0068"
+#define TPACPI_ACPI_IBM_HKEY_HID	"IBM0068"
+#define TPACPI_ACPI_LENOVO_HKEY_HID	"LEN0068"
 #define TPACPI_ACPI_EC_HID		"PNP0C09"
 
 /* Input IDs */
@@ -3879,7 +3880,8 @@ errexit:
 }
 
 static const struct acpi_device_id ibm_htk_device_ids[] = {
-	{TPACPI_ACPI_HKEY_HID, 0},
+	{TPACPI_ACPI_IBM_HKEY_HID, 0},
+	{TPACPI_ACPI_LENOVO_HKEY_HID, 0},
 	{"", 0},
 };
 
-- 
1.7.5.1
