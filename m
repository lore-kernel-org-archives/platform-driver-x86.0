From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] sony-laptop: fix a couple signedness bugs
Date: Thu, 7 Jun 2012 11:22:21 +0300
Message-ID: <20120607082221.GA7582@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:27470 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757676Ab2FGIWh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jun 2012 04:22:37 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

These need to be signed to handle negative error codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 210d4ae..0a2f026 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2113,7 +2113,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	unsigned int mode = sony_nc_thermal_mode_get();
+	int mode = sony_nc_thermal_mode_get();
 
 	if (mode < 0)
 		return mode;
@@ -2480,7 +2480,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 	props->maxlvl = 0xff;
 
 	offset = sony_find_snc_handle(handle);
-	if (offset < 0)
+	if ((int)offset < 0)
 		return;
 
 	/* try to read the boundaries from ACPI tables, if we fail the above
