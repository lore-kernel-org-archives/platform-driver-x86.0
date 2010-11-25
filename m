From: Dan Carpenter <error27@gmail.com>
Subject: [patch] WMI: return error if wmi_create_device() fails
Date: Thu, 25 Nov 2010 20:35:52 +0300
Message-ID: <20101125173552.GB12939@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:60758 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752179Ab0KYRgH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Nov 2010 12:36:07 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, dmitry.torokhov@gmail.com, kernel-janitors@vger.kernel.org

The break resets the retval to 0 but we want to return an error code.
This was introduced in c64eefd48c4 "WMI: embed struct device directly
into wmi_block"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 104b77c..a5b7a4d 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -812,7 +812,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 		if (IS_ERR(wblock)) {
 			retval = PTR_ERR(wblock);
 			wmi_free_devices();
-			break;
+			goto out_free_pointer;
 		}
 
 		if (debug_event) {
