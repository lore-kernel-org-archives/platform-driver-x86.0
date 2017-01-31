From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 4/4][RFC v2] fujitsu-laptop: fujitsu-laptop: simplify
 modalias (autoload)
Date: Tue, 31 Jan 2017 23:41:07 +1030
Message-ID: <20170131131107.GE6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52716 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752028AbdAaNp2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 08:45:28 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

fujistsu-laptop will not load without the ACPI device "FUJ02E3". Use
this device to trigger autoload, instead of looking for DMI matches.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
---
 drivers/platform/x86/fujitsu-laptop.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 7167223..5377d35 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1299,6 +1299,4 @@ MODULE_DESCRIPTION("Fujitsu laptop extras support");
 MODULE_VERSION(FUJITSU_DRIVER_VERSION);
 MODULE_LICENSE("GPL");
 
-MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1D3:*:cvrS6410:*");
-MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1E6:*:cvrS6420:*");
-MODULE_ALIAS("dmi:*:svnFUJITSU:*:pvr:rvnFUJITSU:rnFJNB19C:*:cvrS7020:*");
+MODULE_DEVICE_TABLE(acpi, fujitsu_laptop_device_ids);
-- 
2.8.2
