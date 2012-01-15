From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] toshiba_acpi: make one-bit bitfields unsigned
Date: Sun, 15 Jan 2012 14:28:20 +0300
Message-ID: <20120115112819.GC20463@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:38854 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab2AOL2V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 15 Jan 2012 06:28:21 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

This doesn't change how the code works, but it silences a Sparse
complaint:
drivers/platform/x86/toshiba_acpi.c:121:37: error: dubious one-bit signed bitfield

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dcdc1f4..eab5e11 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -118,10 +118,10 @@ struct toshiba_acpi_dev {
 	int last_key_event;
 	int key_event_valid;
 
-	int illumination_supported:1;
-	int video_supported:1;
-	int fan_supported:1;
-	int system_event_supported:1;
+	unsigned int illumination_supported:1;
+	unsigned int video_supported:1;
+	unsigned int fan_supported:1;
+	unsigned int system_event_supported:1;
 
 	struct mutex mutex;
 };
