From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] thinkpad_acpi: Fix old style declaration GCC warning
Date: Fri, 25 Nov 2016 14:18:07 +0100
Message-ID: <20161125131807.3885-1-tklauser@distanz.ch>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.zhinst.com ([212.126.164.98]:44462 "EHLO mail.zhinst.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754329AbcKYNSS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Nov 2016 08:18:18 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Fix an [-Wold-style-declaration] GCC warning by moving the inline
keyword before the return type.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce7519411..c24ce1adc577 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7716,7 +7716,7 @@ static struct ibm_struct volume_driver_data = {
 
 #define alsa_card NULL
 
-static void inline volume_alsa_notify_change(void)
+static inline void volume_alsa_notify_change(void)
 {
 }
 
-- 
2.11.0.rc0.7.gbe5a750
