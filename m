From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] msi-laptop: fix section mismatch in reference from the function load_scm_model_init
Date: Thu, 26 May 2011 11:09:19 +0800
Message-ID: <1306379359-22684-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:47063 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752869Ab1EZDKv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2011 23:10:51 -0400
Received: by wya21 with SMTP id 21so184026wya.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2011 20:10:50 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

There have section mismatch warning message shows up when building
the kernel with make CONFIG_DEBUG_SECTION_MISMATCH=y.

The problem is the load_scm_model_init() calls msi_laptop_input_setup()
which is an __init function, but load_scm_model_init() lacks a __init
annotation.

This patch add __init on load_scm_model_init() to avoid warning message.

Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/msi-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 23fb2af..516aca0 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -800,7 +800,7 @@ static void msi_laptop_input_destroy(void)
 	input_unregister_device(msi_laptop_input_dev);
 }
 
-static int load_scm_model_init(struct platform_device *sdev)
+static int __init load_scm_model_init(struct platform_device *sdev)
 {
 	u8 data;
 	int result;
-- 
1.6.0.2
