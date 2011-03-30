From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 2/3] asus-wmi: swap input name and phys
Date: Wed, 30 Mar 2011 16:32:32 +0200
Message-ID: <1301495553-22468-3-git-send-email-corentin.chary@gmail.com>
References: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:52525 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932637Ab1C3OmJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:42:09 -0400
Received: from smtp1.tech.numericable.fr (smtp1.nc.sdv.fr [10.0.0.24])
	by fb1.tech.numericable.fr (Postfix) with ESMTP id C22779E77E
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Mar 2011 16:33:28 +0200 (CEST)
In-Reply-To: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index efc776c..832a3fd7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -201,8 +201,8 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	if (!asus->inputdev)
 		return -ENOMEM;
 
-	asus->inputdev->name = asus->driver->input_phys;
-	asus->inputdev->phys = asus->driver->input_name;
+	asus->inputdev->name = asus->driver->input_name;
+	asus->inputdev->phys = asus->driver->input_phys;
 	asus->inputdev->id.bustype = BUS_HOST;
 	asus->inputdev->dev.parent = &asus->platform_device->dev;
 
-- 
1.7.3.4
