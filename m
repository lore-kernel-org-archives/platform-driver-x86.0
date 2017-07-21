From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] platform/x86: wmi: Fix error handling in acpi_wmi_init()
Date: Sat, 22 Jul 2017 00:48:06 +0300
Message-ID: <1500673686-32577-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.ispras.ru ([83.149.199.45]:43840 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752091AbdGUVsQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jul 2017 17:48:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org

The order of resource deallocations is messed up in acpi_wmi_init().
It should be vice versa.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 1a764e311e11..e32ba575e8d9 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1252,12 +1252,12 @@ static int __init acpi_wmi_init(void)
 
 	return 0;
 
-err_unreg_class:
-	class_unregister(&wmi_bus_class);
-
 err_unreg_bus:
 	bus_unregister(&wmi_bus_type);
 
+err_unreg_class:
+	class_unregister(&wmi_bus_class);
+
 	return error;
 }
 
-- 
2.7.4
