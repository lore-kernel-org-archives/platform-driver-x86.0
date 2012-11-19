From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 049/493] char: remove use of __devexit_p
Date: Mon, 19 Nov 2012 13:19:58 -0500
Message-ID: <1353349642-3677-49-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41653 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754053Ab2KSSiA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:38:00 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devexit_p is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Mattia Dongili <malattia@linux.it> 
Cc: platform-driver-x86@vger.kernel.org 
---
 drivers/char/sonypi.c | 2 +-
 drivers/char/tb0219.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index 9b4f011..34f0db3 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -1491,7 +1491,7 @@ static struct platform_driver sonypi_driver = {
 		.pm	= SONYPI_PM,
 	},
 	.probe		= sonypi_probe,
-	.remove		= __devexit_p(sonypi_remove),
+	.remove		= sonypi_remove,
 	.shutdown	= sonypi_shutdown,
 };
 
diff --git a/drivers/char/tb0219.c b/drivers/char/tb0219.c
index ad26418..6bfe2af 100644
--- a/drivers/char/tb0219.c
+++ b/drivers/char/tb0219.c
@@ -334,7 +334,7 @@ static struct platform_device *tb0219_platform_device;
 
 static struct platform_driver tb0219_device_driver = {
 	.probe		= tb0219_probe,
-	.remove		= __devexit_p(tb0219_remove),
+	.remove		= tb0219_remove,
 	.driver		= {
 		.name	= "TB0219",
 		.owner	= THIS_MODULE,
-- 
1.8.0
