From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 4/4][RFC] fujitsu-laptop: fujitsu-laptop: simplify modalias
 (autoload)
Date: Mon, 30 Jan 2017 23:15:54 +1030
Message-ID: <20170130124554.GG10561@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:51868 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752783AbdA3MqS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2017 07:46:18 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

fujistsu-laptop will not load without the ACPI device "FUJ02E3". Use
this device to trigger autoload, instead of looking for PNP or DMI
matches.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Jonathan Woithe <jwoithe@just42.net>

--- a/drivers/platform/x86/fujitsu-laptop.c	2017-01-30 22:41:04.736105860 +1030
+++ b/drivers/platform/x86/fujitsu-laptop.c	2017-01-30 22:40:42.376105487 +1030
@@ -1299,6 +1299,4 @@
 MODULE_VERSION(FUJITSU_DRIVER_VERSION);
 MODULE_LICENSE("GPL");
 
-MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1D3:*:cvrS6410:*");
-MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1E6:*:cvrS6420:*");
-MODULE_ALIAS("dmi:*:svnFUJITSU:*:pvr:rvnFUJITSU:rnFJNB19C:*:cvrS7020:*");
+MODULE_DEVICE_TABLE(acpi, fujitsu_laptop_device_ids);
