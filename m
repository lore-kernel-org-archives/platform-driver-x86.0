From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/7] platform/x86: fujitsu-laptop: sanitize hotkey input device identification
Date: Fri, 16 Jun 2017 06:40:55 +0200
Message-ID: <20170616044058.30443-5-kernel@kempniu.pl>
References: <20170616044058.30443-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33108 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751879AbdFPElP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 00:41:15 -0400
Received: by mail-wm0-f67.google.com with SMTP id f90so2748209wmh.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jun 2017 21:41:15 -0700 (PDT)
In-Reply-To: <20170616044058.30443-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

In the case of brightness-related FUJ02B1 ACPI device, initializing the
input device associated with it identically as acpi-video initializes
its input device makes sense.  However, using the same data for the
input device associated with the FUJ02E3 ACPI device makes little sense,
because the latter has nothing to do with video and assigning an
arbitrary product ID to it is redundant.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 06d04500dac0..5c0dc2126313 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -555,13 +555,12 @@ static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 	if (!priv->input)
 		return -ENOMEM;
 
-	snprintf(priv->phys, sizeof(priv->phys), "%s/video/input0",
+	snprintf(priv->phys, sizeof(priv->phys), "%s/input0",
 		 acpi_device_hid(device));
 
 	priv->input->name = acpi_device_name(device);
 	priv->input->phys = priv->phys;
 	priv->input->id.bustype = BUS_HOST;
-	priv->input->id.product = 0x06;
 
 	dmi_check_system(fujitsu_laptop_dmi_table);
 	ret = sparse_keymap_setup(priv->input, keymap, NULL);
-- 
2.13.1
