From: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Initialize local in_tablet_mode
Date: Wed, 14 Dec 2016 15:10:59 -0800
Message-ID: <20161214231059.GA8243@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50263 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754088AbcLNXLb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Dec 2016 18:11:31 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

linux-next reported in_tablet_mode may be used uninitialized after:

b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into separate function")

This turns out to be a false positive as the pr_info call cannot be
reached if tp_features.hotkey_tablet (global scope) is 0, and
in_tablet_mode is assigned in both places tp_features.hotkey_tablet is
assigned.

Regardless, to make it explicit and avoid further reports, initialize
in_tablet_mode to 0.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Lyude <lyude@redhat.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 69cb0da..1c5a6e2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3143,7 +3143,7 @@ typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
 
 static int hotkey_init_tablet_mode(void)
 {
-	int in_tablet_mode, res;
+	int in_tablet_mode = 0, res;
 	char *type;
 
 	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
-- 
2.9.3


-- 
Darren Hart
Intel Open Source Technology Center
