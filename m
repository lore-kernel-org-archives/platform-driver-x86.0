From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?=
        <jeremy.lefaure@lse.epita.fr>
Subject: [PATCH] platform/x86: asus-wmi: fix cpufv sysfs file permission
Date: Fri, 21 Apr 2017 22:19:45 -0400
Message-ID: <20170422021945.5260-1-jeremy.lefaure@lse.epita.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from blatinox.fr ([51.254.120.209]:34115 "EHLO vps202351.ovh.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1042721AbdDVCTy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2017 22:19:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=A9my=20Lefaure?= <jeremy.lefaure@lse.epita.fr>

The cpufv sysfs file is defined as readable by anyone even if the
attribute does not have a show function. The result of every read is an
IO error. This file should be write only.

Signed-off-by: Jérémy Lefaure <jeremy.lefaure@lse.epita.fr>
---
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8499d3ae4257..0ace471cb700 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1761,7 +1761,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
 ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
 ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE);
 
-static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
+static ssize_t cpufv_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
 	int value, rv;
@@ -1778,7 +1778,7 @@ static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
+static DEVICE_ATTR_WO(cpufv);
 
 static struct attribute *platform_attributes[] = {
 	&dev_attr_cpufv.attr,
-- 
2.12.2
