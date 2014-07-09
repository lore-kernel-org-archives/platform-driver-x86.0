From: Roald Frederickx <roald.frederickx@gmail.com>
Subject: [PATCH] compal-laptop: correct invalid hwmon name
Date: Wed, 09 Jul 2014 21:12:42 +0200
Message-ID: <53BD942A.2070106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:48538 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753748AbaGITGC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jul 2014 15:06:02 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Roald Frederickx <roald.frederickx@gmail.com>

Change the name of the hwmon interface from "compal-laptop" to "compal". 
A dash is an invalid character for a hwmon name and caused the call to 
hwmon_device_register_with_groups() to fail.

Signed-off-by: Roald Frederickx <roald.frederickx@gmail.com>
---

diff --git a/drivers/platform/x86/compal-laptop.c 
b/drivers/platform/x86/compal-laptop.c
index 7297df2..26bfd7b 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1028,7 +1028,7 @@ static int compal_probe(struct platform_device *pdev)
  		return err;

  	hwmon_dev = hwmon_device_register_with_groups(&pdev->dev,
-						      DRIVER_NAME, data,
+						      "compal", data,
  						      compal_hwmon_groups);
  	if (IS_ERR(hwmon_dev)) {
  		err = PTR_ERR(hwmon_dev);
