Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8D143752
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254712; cv=none; b=Cp3GH9+qdIyWLl6QHyf9uYi/3OmkSfl133MOaS2MJpM93dblbh9eMhWgwjwPrkR8la68/UI6t6nzM3dFSEdYpVJTO1ho63ufovz5rd2wIU7kOUpUpe1+n7tRt3HtEAKlZp3nqMroqYDbSAIvcCCr8Cbiy2BG+k2eyiI+MwkQGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254712; c=relaxed/simple;
	bh=ZwOfBM5aYGB0CMuNEAy3790BFZyth8KJs4znRg1zJW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yfgo7GkIYmkGrtb8I/0TuWU5p1cL5+JNtTnfQcr4CYxJjbaTxV1i9KbtXZUdw4o4+dabMXWQW83RVLBW6xBgfWjWH5+4kt0nYKRpqqQ6ACNX2iB4UrLANqpgtbJ7Y70/mAWsooiN3vh5ozUKJdUHIK6c1qE+SAIOgZNzr21wPEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewZ3sA19; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewZ3sA19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722254709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4oKTbHm7Um9k1L8lhEn+g0CRCqNfxC+f7jqIN7aGUGA=;
	b=ewZ3sA198V7JENHmCB87y21pyuDzovHsWd2Myt5YTWYz713rqFgRxRp6OZDz45fFGTvr5A
	H0zZ+FNVI/3FPyyIwxEdIbxnJJPRK/9xKs85raW0zU20Rx5HDNsob8L02aGjH1y2siuf9P
	dT40eghb6N6/6+HGUElsTFVuExt95cM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-LwoQ7FJTMDqkt98hnHw7eA-1; Mon,
 29 Jul 2024 08:05:06 -0400
X-MC-Unique: LwoQ7FJTMDqkt98hnHw7eA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0A8A1896ED7;
	Mon, 29 Jul 2024 12:04:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.144])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 732F830001B1;
	Mon, 29 Jul 2024 12:04:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	En-Wei Wu <en-wei.wu@canonical.com>,
	Kostadin Stoilov <kmstoilov@gmail.com>
Subject: [PATCH v2] platform/x86: intel-vbtn: Protect ACPI notify handler against recursion
Date: Mon, 29 Jul 2024 14:04:43 +0200
Message-ID: <20240729120443.14779-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
Changes in v2:
- Use guard(mutex)(priv->mutex);
---
 drivers/platform/x86/intel/vbtn.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 9b7ce03ba085..a353e830b65f 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -7,11 +7,13 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
 #include "../dual_accel_detect.h"
@@ -66,6 +68,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 };
 
 struct intel_vbtn_priv {
+	struct mutex mutex; /* Avoid notify_handler() racing with itself */
 	struct input_dev *buttons_dev;
 	struct input_dev *switches_dev;
 	bool dual_accel;
@@ -155,6 +158,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	bool autorelease;
 	int ret;
 
+	guard(mutex)(&priv->mutex);
+
 	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
 		if (!priv->has_buttons) {
 			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
@@ -290,6 +295,10 @@ static int intel_vbtn_probe(struct platform_device *device)
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

