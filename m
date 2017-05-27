From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH] platform/x86: dell-wmi: Add a comment explaining the 0xb2 magic number
Date: Fri, 26 May 2017 22:15:28 -0700
Message-ID: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48699 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751071AbdE0FQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 01:16:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>

From: Andy Lutomirski <luto@kernel.org>

The hotkey table is 0xb2, add a comment for clarity.

Suggested-by: Darren Hart <dvhart@infradead.org>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Pali Rohár" <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/dell-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 8a64c79..24467b1 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -449,6 +449,7 @@ static void __init handle_dmi_entry(const struct dmi_header *dm,
 	if (results->err || results->keymap)
 		return;		/* We already found the hotkey table. */
 
+	/* The Dell hotkey table is type 0xB2.  Scan until we find it. */
 	if (dm->type != 0xb2)
 		return;
 
-- 
2.9.4
