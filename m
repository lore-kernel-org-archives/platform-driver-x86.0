From: Eric Curtin <ericcurtin17@gmail.com>
Subject: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Sat, 16 Jan 2016 23:43:57 +0000
Message-ID: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:37691 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752914AbcAPXn6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 16 Jan 2016 18:43:58 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi@hmh.eng.br, Kernel development list <linux-kernel@vger.kernel.org>

Message gets logged on machines that are well supported.
Fixed one checkpatch.pl ERROR also.

Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index 0bed473..b149dec 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6434,7 +6434,7 @@ static const struct tpacpi_quirk
brightness_quirk_table[] __initconst = {
  */
 static void __init tpacpi_detect_brightness_capabilities(void)
 {
- unsigned int b;
+ const unsigned int b = tpacpi_check_std_acpi_brightness_support();

  vdbg_printk(TPACPI_DBG_INIT,
     "detecting firmware brightness interface capabilities\n");
@@ -6447,7 +6447,6 @@ static void __init
tpacpi_detect_brightness_capabilities(void)
  * Lenovo Vista BIOS to ACPI brightness mode even if we are not
  * going to publish a backlight interface
  */
- b = tpacpi_check_std_acpi_brightness_support();
  switch (b) {
  case 16:
  bright_maxlvl = 15;
@@ -6459,7 +6458,6 @@ static void __init
tpacpi_detect_brightness_capabilities(void)
  pr_info("detected a 8-level brightness capable ThinkPad\n");
  break;
  default:
- pr_info("Unsupported brightness interface\n");
  tp_features.bright_unkfw = 1;
  bright_maxlvl = b - 1;
  }
@@ -7440,7 +7438,7 @@ static struct ibm_struct volume_driver_data = {

 #define alsa_card NULL

-static void inline volume_alsa_notify_change(void)
+static inline void volume_alsa_notify_change(void)
 {
 }

-- 
2.5.0
