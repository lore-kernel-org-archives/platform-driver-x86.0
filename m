From: Vasiliy Kulikov <segoon@openwall.com>
Subject: [PATCH 16/20] platform: x86: tc1100-wmi: world-writable sysfs wireless and jogdial files
Date: Fri,  4 Feb 2011 15:24:03 +0300
Message-ID: <89dc8590aea5866047038dddd062b4c0a2f617f7.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:32973 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab1BDMYH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Feb 2011 07:24:07 -0500
In-Reply-To: <cover.1296818921.git.segoon@openwall.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: security@kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

Don't allow everybody to change WMI settings.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/platform/x86/tc1100-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc1100-wmi.c
index 1fe0f1f..865ef78 100644
--- a/drivers/platform/x86/tc1100-wmi.c
+++ b/drivers/platform/x86/tc1100-wmi.c
@@ -162,7 +162,7 @@ set_bool_##value(struct device *dev, struct device_attribute *attr, \
 			return -EINVAL; \
 	return count; \
 } \
-static DEVICE_ATTR(value, S_IWUGO | S_IRUGO | S_IWUSR, \
+static DEVICE_ATTR(value, S_IRUGO | S_IWUSR, \
 	show_bool_##value, set_bool_##value);
 
 show_set_bool(wireless, TC1100_INSTANCE_WIRELESS);
-- 
1.7.0.4
