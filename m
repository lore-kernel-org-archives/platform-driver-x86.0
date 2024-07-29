Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61C23CE
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250844; cv=none; b=Bf88DyDefmQz6rO8fmfEL529wzYP4lTJmzO6cHIA8J29/WkympfFDEKyTB+hpeLnopcYNFc27TIXde2iULrwdFnGcMEPTUhvtnRdLIKTk/H/Pve0IpShoVNtUIQxhYYmEA5bKXl6VjjAjOGyEhTndyRTay71rEpOfs8jOd0wEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250844; c=relaxed/simple;
	bh=z3FR62RfMmzERRAwF7mGjWPdwb9AFxjsYguF+vnUSqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWLhpMZTVy6KXGYn90aOe9YewXcywWltATPB8mrQqAzvZv3/21WDYh6LFfijhRsBz5Sh2dnuEGY3SRHJRBQiNkNJrlX2cK9aXI3Ktb1BFX+JoO8YS2bNIeXlg2K0/Y68aF/cMCvxMQpUUBdShnCdk2b21w/Bg04m9clmNSoGJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W08j+BPw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W08j+BPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722250842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xSY1lMUUubpttoi2WlP1/dQ7XufGsZn/EWQ6vijKaLc=;
	b=W08j+BPwWx+Z50cyQ4frMbmFg3AoMiVi1SMpa895/QIv+wDVQhggLMgz18kZbb6DrvkUoE
	qseVBOEJqZLy7Jeru0ttYwh25jA3qcJuLqUmqArtlZFaCxokHpM1fFBXbUv44PF5mKKegy
	x5qdqqhcaQrJIu0w0KamlhG9ROsnshA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-MXzJuRxPOy24RpB_1SM2wg-1; Mon,
 29 Jul 2024 07:00:38 -0400
X-MC-Unique: MXzJuRxPOy24RpB_1SM2wg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CF021955F4A;
	Mon, 29 Jul 2024 11:00:37 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.43])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8CE6A1955D45;
	Mon, 29 Jul 2024 11:00:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	En-Wei Wu <en-wei.wu@canonical.com>,
	Kostadin Stoilov <kmstoilov@gmail.com>
Subject: [PATCH] platform/x86: intel-vbtn: Protect ACPI notify handler against recursion
Date: Mon, 29 Jul 2024 13:00:30 +0200
Message-ID: <20240729110030.8016-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on
all CPUs") ACPI notify handlers like the intel-vbtn notify_handler() may
run on multiple CPU cores racing with themselves.

This race gets hit on Dell Venue 7140 tablets when undocking from
the keyboard, causing the handler to try and register priv->switches_dev
twice, as can be seen from the dev_info() message getting logged twice:

[ 83.861800] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
[ 83.861858] input: Intel Virtual Switches as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17
[ 83.861865] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event

After which things go seriously wrong:
[ 83.861872] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17'
...
[ 83.861967] kobject: kobject_add_internal failed for input17 with -EEXIST, don't try to register things with the same name in the same directory.
[ 83.877338] BUG: kernel NULL pointer dereference, address: 0000000000000018
...

Protect intel-vbtn notify_handler() from racing with itself with a mutex
to fix this.

Fixes: e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on all CPUs")
Reported-by: En-Wei Wu <en-wei.wu@canonical.com>
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2073001
Tested-by: Kostadin Stoilov <kmstoilov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/vbtn.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 9b7ce03ba085..93deda7daac4 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -12,6 +12,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
 #include "../dual_accel_detect.h"
@@ -66,6 +67,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 };
 
 struct intel_vbtn_priv {
+	struct mutex mutex; /* Avoid notify_handler() racing with itself */
 	struct input_dev *buttons_dev;
 	struct input_dev *switches_dev;
 	bool dual_accel;
@@ -155,30 +157,32 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	bool autorelease;
 	int ret;
 
+	mutex_lock(&priv->mutex);
+
 	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
 		if (!priv->has_buttons) {
 			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
 				 event);
-			return;
+			goto out_unlock;
 		}
 		input_dev = priv->buttons_dev;
 	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
 		if (!priv->has_switches) {
 			/* See dual_accel_detect.h for more info */
 			if (priv->dual_accel)
-				return;
+				goto out_unlock;
 
 			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
 			ret = input_register_device(priv->switches_dev);
 			if (ret)
-				return;
+				goto out_unlock;
 
 			priv->has_switches = true;
 		}
 		input_dev = priv->switches_dev;
 	} else {
 		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
-		return;
+		goto out_unlock;
 	}
 
 	if (priv->wakeup_mode) {
@@ -189,7 +193,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 		 * mirroring how the drivers/acpi/button.c code skips this too.
 		 */
 		if (ke->type == KE_KEY)
-			return;
+			goto out_unlock;
 	}
 
 	/*
@@ -200,6 +204,9 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
 	sparse_keymap_report_event(input_dev, event, val, autorelease);
+
+out_unlock:
+	mutex_unlock(&priv->mutex);
 }
 
 /*
@@ -290,6 +297,10 @@ static int intel_vbtn_probe(struct platform_device *device)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
 
+	err = devm_mutex_init(&device->dev, &priv->mutex);
+	if (err)
+		return err;
+
 	priv->dual_accel = dual_accel;
 	priv->has_buttons = has_buttons;
 	priv->has_switches = has_switches;
-- 
2.45.2

