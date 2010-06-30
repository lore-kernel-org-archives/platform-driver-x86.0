From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acer-wmi: set permissions on interface file to S_IRUGO
Date: Wed, 30 Jun 2010 10:20:23 +0800
Message-ID: <1277864423.14363.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:62611 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab0F3CSD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Jun 2010 22:18:03 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, platform-driver-x86@vger.kernel.org

The interface file is not writable, thus set permissions to S_IRUGO.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1415d97..fe7c9e4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1084,8 +1084,7 @@ static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 	}
 }
 
-static DEVICE_ATTR(interface, S_IWUGO | S_IRUGO | S_IWUSR,
-	show_interface, NULL);
+static DEVICE_ATTR(interface, S_IRUGO, show_interface, NULL);
 
 /*
  * debugfs functions
-- 
1.5.4.3
