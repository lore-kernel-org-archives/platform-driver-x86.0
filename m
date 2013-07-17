From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] x86: irst: use module_acpi_driver to simplify the code
Date: Wed, 17 Jul 2013 09:55:25 +0800
Message-ID: <CAPgLHd87cm4xATYHfVUQAdfdRgSY4LjNA5hP__B0yKJxT+hERg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f51.google.com ([209.85.214.51]:54528 "EHLO
	mail-bk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab3GQBz0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jul 2013 21:55:26 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji1so515615bkc.24
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2013 18:55:25 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

module_acpi_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/platform/x86/intel-rst.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel-rst.c b/drivers/platform/x86/intel-rst.c
index 9385afd..41b740c 100644
--- a/drivers/platform/x86/intel-rst.c
+++ b/drivers/platform/x86/intel-rst.c
@@ -193,17 +193,6 @@ static struct acpi_driver irst_driver = {
 	},
 };
 
-static int irst_init(void)
-{
-	return acpi_bus_register_driver(&irst_driver);
-}
-
-static void irst_exit(void)
-{
-	acpi_bus_unregister_driver(&irst_driver);
-}
-
-module_init(irst_init);
-module_exit(irst_exit);
+module_acpi_driver(irst_driver);
 
 MODULE_DEVICE_TABLE(acpi, irst_ids);
