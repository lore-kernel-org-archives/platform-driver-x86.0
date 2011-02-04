From: Vasiliy Kulikov <segoon@openwall.com>
Subject: [PATCH 14/20] platform: x86: acer-wmi: world-writable sysfs threeg file
Date: Fri,  4 Feb 2011 15:23:56 +0300
Message-ID: <1456c564561bda820c358cf3c968b5c23a4c374f.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:32973 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033Ab1BDMYA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Feb 2011 07:24:00 -0500
In-Reply-To: <cover.1296818921.git.segoon@openwall.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: security@kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

Don't allow everybody to write to hardware registers.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/platform/x86/acer-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f21eb53..1dfd966 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1279,7 +1279,7 @@ static ssize_t set_bool_threeg(struct device *dev,
 			return -EINVAL;
 	return count;
 }
-static DEVICE_ATTR(threeg, S_IWUGO | S_IRUGO | S_IWUSR, show_bool_threeg,
+static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
 	set_bool_threeg);
 
 static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
-- 
1.7.0.4
