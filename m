From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 3/14] sony-laptop: replace simple_strtoul with
 strict_strtoul
Date: Tue, 13 Sep 2011 22:45:28 +0200
Message-ID: <1315946728.14415.128.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:38187 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755981Ab1IMUpa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:45:30 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Any occurrence of simple_strtoul has been replaced with the better
strict_strtoul, because the former accepts and ignores any char at the
tail while the latter only accepts a new line character following the
number (and -EINVAL is returned otherwise).


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -919,7 +919,8 @@ static ssize_t sony_nc_sysfs_store(struc
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
 
 	if (item->validate)
 		value = item->validate(SNC_VALIDATE_IN, value);
@@ -2437,7 +2438,9 @@ static ssize_t sony_pic_wwanpower_store(
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	mutex_lock(&spic_dev.lock);
 	__sony_pic_set_wwanpower(value);
 	mutex_unlock(&spic_dev.lock);
@@ -2474,7 +2477,9 @@ static ssize_t sony_pic_bluetoothpower_s
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	mutex_lock(&spic_dev.lock);
 	__sony_pic_set_bluetoothpower(value);
 	mutex_unlock(&spic_dev.lock);
@@ -2513,7 +2518,9 @@ static ssize_t sony_pic_fanspeed_store(s
 	if (count > 31)
 		return -EINVAL;
 
-	value = simple_strtoul(buffer, NULL, 10);
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
+
 	if (sony_pic_set_fanspeed(value))
 		return -EIO;
 
