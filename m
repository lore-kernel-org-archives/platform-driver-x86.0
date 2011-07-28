From: "Anton V. Boyarshinov" <boyarsh@altlinux.org>
Subject: [PATCH] acerhdf.c: spaces in aliased changed to *
Date: Thu, 28 Jul 2011 18:05:35 +0400
Message-ID: <20110728180535.51dce58d@boyarsh.office.altlinux.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vint.altlinux.org ([194.107.17.35]:52310 "EHLO
	vint.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751007Ab1G1OMl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jul 2011 10:12:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

It seems that aliases shouldn't contain spaces, as 
module-init-tools uses them as delimeters in module.alias file

Signed-off-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
---
 drivers/platform/x86/acerhdf.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index fca3489..7a8568b 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -703,15 +703,15 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Peter Feuerer");
 MODULE_DESCRIPTION("Aspire One temperature and fan driver");
 MODULE_ALIAS("dmi:*:*Acer*:pnAOA*:");
-MODULE_ALIAS("dmi:*:*Acer*:pnAspire 1410*:");
-MODULE_ALIAS("dmi:*:*Acer*:pnAspire 1810*:");
+MODULE_ALIAS("dmi:*:*Acer*:pnAspire*1410*:");
+MODULE_ALIAS("dmi:*:*Acer*:pnAspire*1810*:");
 MODULE_ALIAS("dmi:*:*Acer*:pnAO531*:");
 MODULE_ALIAS("dmi:*:*Gateway*:pnAOA*:");
 MODULE_ALIAS("dmi:*:*Gateway*:pnLT31*:");
-MODULE_ALIAS("dmi:*:*Packard Bell*:pnAOA*:");
-MODULE_ALIAS("dmi:*:*Packard Bell*:pnDOA*:");
-MODULE_ALIAS("dmi:*:*Packard Bell*:pnDOTMU*:");
-MODULE_ALIAS("dmi:*:*Packard Bell*:pnDOTMA*:");
+MODULE_ALIAS("dmi:*:*Packard*Bell*:pnAOA*:");
+MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOA*:");
+MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMU*:");
+MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMA*:");
 
 module_init(acerhdf_init);
 module_exit(acerhdf_exit);
-- 
1.7.2.2
