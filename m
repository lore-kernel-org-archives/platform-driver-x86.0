From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 03/11] driver: thinkpad_acpi: fix minor checkpatch errors
Date: Mon, 21 Apr 2014 21:10:48 +0200
Message-ID: <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:40791 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959AbaDUTLI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:08 -0400
Received: by mail-ee0-f48.google.com with SMTP id b57so3811989eek.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:07 -0700 (PDT)
In-Reply-To: <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the following checkpatch errors:
    - inline keyword should sit between storage class and type
    - "foo* const bar" should be "foo * const bar"

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9506026..7e1bc89 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7223,7 +7223,7 @@ static struct ibm_struct volume_driver_data = {
 
 #define alsa_card NULL
 
-static void inline volume_alsa_notify_change(void)
+static inline void volume_alsa_notify_change(void)
 {
 }
 
@@ -8792,7 +8792,7 @@ static bool __pure __init tpacpi_is_fw_digit(const char c)
 }
 
 /* Most models: xxyTkkWW (#.##c); Ancient 570/600 and -SL lacks (#.##c) */
-static bool __pure __init tpacpi_is_valid_fw_id(const char* const s,
+static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
 						const char t)
 {
 	return s && strlen(s) >= 8 &&
-- 
1.8.1.2
