From: Dan Carpenter <error27@gmail.com>
Subject: [patch 1/4] sony-laptop: make a couple variables static
Date: Sat, 26 Feb 2011 15:54:27 +0300
Message-ID: <20110226125427.GI18043@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:65152 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173Ab1BZMym (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Feb 2011 07:54:42 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains that these variables should be static.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a0ba0e7..a7b9c72 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -745,7 +745,7 @@ struct sony_nc_handles {
 	struct device_attribute devattr;
 };
 
-struct sony_nc_handles *handles;
+static struct sony_nc_handles *handles;
 
 static ssize_t sony_nc_handles_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
@@ -1358,7 +1358,7 @@ struct kbd_backlight {
 	struct device_attribute timeout_attr;
 };
 
-struct kbd_backlight *kbdbl_handle;
+static struct kbd_backlight *kbdbl_handle;
 
 static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 {
