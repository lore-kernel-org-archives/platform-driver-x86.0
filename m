From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] samsung-laptop: cleanup return type: mode_t vs umode_t
Date: Thu, 15 Mar 2012 10:10:20 +0300
Message-ID: <20120315071020.GA3567@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:49888 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756294Ab2COHKs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 03:10:48 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

This function returns a umode_t (unsigned short) instead of mode_t which
is an unsigned int on some architectures.  Cleaning this up silences a
compile warning:

drivers/platform/x86/samsung-laptop.c:1108:2: warning: initialization
	from incompatible pointer type [enabled by default]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 7d7109f..0550bc5 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1086,7 +1086,7 @@ static int __init samsung_backlight_init(struct samsung_laptop *samsung)
 	return 0;
 }
 
-static mode_t samsung_sysfs_is_visible(struct kobject *kobj,
+static umode_t samsung_sysfs_is_visible(struct kobject *kobj,
 				       struct attribute *attr, int idx)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
