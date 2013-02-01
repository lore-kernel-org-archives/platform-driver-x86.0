From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] sony-laptop: leak in error handling
 sony_nc_lid_resume_setup()
Date: Fri, 1 Feb 2013 16:28:27 +0300
Message-ID: <20130201132826.GA23374@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:51179 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755143Ab3BAN2n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Feb 2013 08:28:43 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to decrement "i" first because the current "i" was not allocated
succesfully.  Also we should go free the way down to zero to avoid a
leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 438c7fa..9557414 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2351,7 +2351,7 @@ static int sony_nc_lid_resume_setup(struct platform_device *pd)
 	return 0;
 
 liderror:
-	for (; i > 0; i--)
+	for (i--; i >= 0; i--)
 		device_remove_file(&pd->dev, &lid_ctl->attrs[i]);
 
 	kfree(lid_ctl);
