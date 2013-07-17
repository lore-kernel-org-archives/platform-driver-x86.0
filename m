From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] x86: smartconnect: use module_acpi_driver to simplify
 the code
Date: Wed, 17 Jul 2013 09:52:28 +0800
Message-ID: <CAPgLHd_eJ+6VCezsWKgbUzXNDDWjrUN164PPM7eqk-Ro=hJskA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:56358 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944Ab3GQBwa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jul 2013 21:52:30 -0400
Received: by mail-bk0-f47.google.com with SMTP id jg1so513381bkc.34
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2013 18:52:28 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

module_acpi_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/platform/x86/intel-smartconnect.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel-smartconnect.c b/drivers/platform/x86/intel-smartconnect.c
index f74e93d..52259dc 100644
--- a/drivers/platform/x86/intel-smartconnect.c
+++ b/drivers/platform/x86/intel-smartconnect.c
@@ -74,17 +74,6 @@ static struct acpi_driver smartconnect_driver = {
 	},
 };
 
-static int smartconnect_init(void)
-{
-	return acpi_bus_register_driver(&smartconnect_driver);
-}
-
-static void smartconnect_exit(void)
-{
-	acpi_bus_unregister_driver(&smartconnect_driver);
-}
-
-module_init(smartconnect_init);
-module_exit(smartconnect_exit);
+module_acpi_driver(smartconnect_driver);
 
 MODULE_DEVICE_TABLE(acpi, smartconnect_ids);
