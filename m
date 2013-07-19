From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] platform: replace strict_strto*() with kstrto*()
Date: Fri, 19 Jul 2013 16:18:47 +0900
Message-ID: <001601ce8450$35c47280$a14d5780$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50521 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759752Ab3GSHSs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Jul 2013 03:18:48 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ600HUO9N96HT0@mailout4.samsung.com> for
 platform-driver-x86@vger.kernel.org; Fri, 19 Jul 2013 16:18:47 +0900 (KST)
Content-language: ko
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: 'Matthew Garrett' <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

The usage of strict_strtoul() and strict_strtol() is not preferred,
because strict_strtoul() and strict_strtol() are obsolete. Thus,
kstrtoul() and kstrtol() should be used.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/platform/x86/classmate-laptop.c |    2 +-
 drivers/platform/x86/compal-laptop.c    |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 36e5e6c..6dfa8d3 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -590,7 +590,7 @@ static ssize_t cmpc_accel_sensitivity_store(struct device *dev,
 	inputdev = dev_get_drvdata(&acpi->dev);
 	accel = dev_get_drvdata(&inputdev->dev);
 
-	r = strict_strtoul(buf, 0, &sensitivity);
+	r = kstrtoul(buf, 0, &sensitivity);
 	if (r)
 		return r;
 
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 475cc52..52f89fc 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -425,7 +425,8 @@ static ssize_t pwm_enable_store(struct device *dev,
 	struct compal_data *data = dev_get_drvdata(dev);
 	long val;
 	int err;
-	err = strict_strtol(buf, 10, &val);
+
+	err = kstrtol(buf, 10, &val);
 	if (err)
 		return err;
 	if (val < 0)
@@ -463,7 +464,8 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
 	struct compal_data *data = dev_get_drvdata(dev);
 	long val;
 	int err;
-	err = strict_strtol(buf, 10, &val);
+
+	err = kstrtol(buf, 10, &val);
 	if (err)
 		return err;
 	if (val < 0 || val > 255)
-- 
1.7.10.4
