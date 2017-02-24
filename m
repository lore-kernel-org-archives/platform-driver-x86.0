From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/4] platform/x86: intel-hid: remove redundant set_bit() call
Date: Fri, 24 Feb 2017 11:33:09 +0100
Message-ID: <20170224103309.19463-5-kernel@kempniu.pl>
References: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35767 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751275AbdBXKdp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 05:33:45 -0500
Received: by mail-lf0-f66.google.com with SMTP id z127so1165740lfa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2017 02:33:18 -0800 (PST)
In-Reply-To: <20170224103309.19463-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Remove redundant set_bit() call for KEY_RFKILL as it is already made by
sparse_keymap_setup() due to KEY_RFKILL being assigned to event code 8
in intel_hid_keymap.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/intel-hid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index b17f33b832c2..5eab31659cba 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -155,7 +155,6 @@ static int intel_hid_input_setup(struct platform_device *device)
 	priv->input_dev->dev.parent = &device->dev;
 	priv->input_dev->name = "Intel HID events";
 	priv->input_dev->id.bustype = BUS_HOST;
-	set_bit(KEY_RFKILL, priv->input_dev->keybit);
 
 	return input_register_device(priv->input_dev);
 }
-- 
2.11.1
