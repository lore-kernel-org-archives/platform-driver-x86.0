From: Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] x86: thinkpad_acpi.c: fix sparse warning
Date: Thu,  5 Feb 2015 14:45:38 +0000
Message-ID: <1423147538-13377-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:44914 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757562AbbBEOpx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Feb 2015 09:45:53 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

this patch fixes following sparse warning:

thinkpad_acpi.c:3459:11: warning: symbol 'adaptive_keyboard_modes' was not declared. Should it be static?

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 Found this issue on linux-next (gcc  version 4.9.2,
 sparse version  0.4.5-rc1) and applies on top linux-next.

 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c3d11fa..0e9262b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3456,7 +3456,7 @@ enum ADAPTIVE_KEY_MODE {
 	LAYFLAT_MODE
 };
 
-const int adaptive_keyboard_modes[] = {
+static const int adaptive_keyboard_modes[] = {
 	HOME_MODE,
 /*	WEB_BROWSER_MODE = 2,
 	WEB_CONFERENCE_MODE = 3, */
-- 
1.9.1
