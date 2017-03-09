From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] platform/x86: intel-hid: do not set parents of input devices explicitly
Date: Thu,  9 Mar 2017 10:36:51 +0100
Message-ID: <20170309093651.7824-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35557 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753291AbdCIJn7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 04:43:59 -0500
Received: by mail-lf0-f66.google.com with SMTP id v2so4196525lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2017 01:43:57 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

devm_input_allocate_device() already causes the supplied struct device
to be set as the parent of the input device, so doing it again is
redundant.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
This patch needs my recent intel-hid cleanup series to apply cleanly.
In other words, it should apply on top of testing, but not for-next.

 drivers/platform/x86/intel-hid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 5eab31659cba..b40059aba856 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -152,7 +152,6 @@ static int intel_hid_input_setup(struct platform_device *device)
 	if (ret)
 		return ret;
 
-	priv->input_dev->dev.parent = &device->dev;
 	priv->input_dev->name = "Intel HID events";
 	priv->input_dev->id.bustype = BUS_HOST;
 
@@ -173,7 +172,6 @@ static int intel_button_array_input_setup(struct platform_device *device)
 	if (ret)
 		return ret;
 
-	priv->array->dev.parent = &device->dev;
 	priv->array->name = "Intel HID 5 button array";
 	priv->array->id.bustype = BUS_HOST;
 
-- 
2.12.0
