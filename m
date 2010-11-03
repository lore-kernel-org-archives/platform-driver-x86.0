From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] eeepc-wmi: fix compiler warning
Date: Wed, 3 Nov 2010 11:14:01 -0700
Message-ID: <20101103181400.GA12818@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:45384 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127Ab0KCSOK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Nov 2010 14:14:10 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes the following:

  CC [M]  drivers/platform/x86/eeepc-wmi.o
drivers/platform/x86/eeepc-wmi.c:322: warning: initialization from incompatible pointer type

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/eeepc-wmi.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 462ceab..0d50fbb 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -298,8 +298,8 @@ static void eeepc_wmi_notify(u32 value, void *context)
 	kfree(obj);
 }
 
-static int store_cpufv(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
 {
 	int value;
 	struct acpi_buffer input = { (acpi_size)sizeof(value), &value };
