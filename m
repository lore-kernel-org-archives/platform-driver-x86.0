From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 04/16] asus-wmi: Enable autorepeat for hotkey input device
Date: Mon,  4 Jul 2011 09:49:20 +0200
Message-ID: <1309765760-22045-1-git-send-email-corentin.chary@gmail.com>
References: <20110701141558.GB1363@srcf.ucam.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb2.tech.numericable.fr ([82.216.111.50]:44431 "EHLO
	fb2.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812Ab1GDHuJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2011 03:50:09 -0400
In-Reply-To: <20110701141558.GB1363@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>, Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>

From: Seth Forshee <seth.forshee@canonical.com>

The T101MT Home/Express Gate key autorepeats in hardware, but
sparse-keymap does not support hardware autorepeat. Enable the
input core's software autorepeat to emulate the hardware behavior.
Normal hotkeys are autoreleased, so the behavior of these keys
will not be affected.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a09271d..35eeb69 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -205,6 +205,7 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
 	asus->inputdev->phys = asus->driver->input_phys;
 	asus->inputdev->id.bustype = BUS_HOST;
 	asus->inputdev->dev.parent = &asus->platform_device->dev;
+	set_bit(EV_REP, asus->inputdev->evbit);
 
 	err = sparse_keymap_setup(asus->inputdev, asus->driver->keymap, NULL);
 	if (err)
-- 
1.7.3.4
