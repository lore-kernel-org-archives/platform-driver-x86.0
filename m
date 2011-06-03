From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 2/25] sony-laptop: simple_strtoul replaced by strict_strtoul
Date: Fri, 03 Jun 2011 17:28:08 +0200
Message-ID: <4DE8FD88.9050302@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:38421 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753234Ab1FCPdg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:33:36 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Any occurrence of simple_strtoul has been replaced with the better 
strict_strtoul.

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
