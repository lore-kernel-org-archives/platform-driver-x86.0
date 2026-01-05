Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA91D2C0F96
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624741; cv=none; b=dv/9iRQ3bSm6rD3aXeT5Dcl38elPQwu6LWuNtfbURNu7zO+nR4vnWAcVZJVksuGxXSW/QHGNPYLrZMv3giw4C2a9Hsrgr4Iq2mcys+23rIC8QGdObS7w42uZce7SfxBExkZAH13T60P9+zOWejSdaXkjobwd1EPUqor40tzcNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624741; c=relaxed/simple;
	bh=5nMIfEABV8JPk0/1GBhF6FLpko1dWB1z4qO3YVpNfT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnWEPR4JTRo86FLK883yQu3HbBP49NMTuvjwNdgA3k6T9ZhJjD8XGIkLLwQfklTdK2yEXqvjfx3K58Si7i2mniilOQBSTuzxk9LESFxehwOYmvNe5FzHyi/bgtmJtfgaiHzD4lKH110qC6ZlDNhzP+8PsGJzPP17kkAu8P3IMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lj0HN+lm; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lj0HN+lm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767624730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hr+N5djQhAopsvCEmnr4rlHkUGJjovOU/36k2aG4V2U=;
	b=lj0HN+lma+qGJRr88y0yRTX7xvpcJ1rUcjqWTnJSjTOOxs+f0wvYIgv9l69NRgF0VzCcbw
	V2SuEEAWRD2u8PnZ04f+fL5IcxTUUFLZM1Jv/+pM8QgcPGHOvlbDrkrZHnt9OVS4KGECtI
	gX6bGkeUhKLC18vtSt1r3SDuFMYrKlA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Chen Yu <yu.c.chen@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/surface: Replace deprecated strcpy() in surface_button_add()
Date: Mon,  5 Jan 2026 15:50:46 +0100
Message-ID: <20260105145045.52764-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy().  No functional changes.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Remove local variable 'name' (Ilpo)
- Update patch subject (Ilpo)
- Link to v1: https://lore.kernel.org/lkml/20260105121802.1947-2-thorsten.blum@linux.dev/
---
 drivers/platform/surface/surfacepro3_button.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/surface/surfacepro3_button.c b/drivers/platform/surface/surfacepro3_button.c
index 2755601f979c..e652c85c9161 100644
--- a/drivers/platform/surface/surfacepro3_button.c
+++ b/drivers/platform/surface/surfacepro3_button.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/input.h>
 #include <linux/acpi.h>
@@ -189,7 +190,6 @@ static int surface_button_add(struct acpi_device *device)
 	struct surface_button *button;
 	struct input_dev *input;
 	const char *hid = acpi_device_hid(device);
-	char *name;
 	int error;
 
 	if (strncmp(acpi_device_bid(device), SURFACE_BUTTON_OBJ_NAME,
@@ -210,11 +210,10 @@ static int surface_button_add(struct acpi_device *device)
 		goto err_free_button;
 	}
 
-	name = acpi_device_name(device);
-	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
+	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
 	snprintf(button->phys, sizeof(button->phys), "%s/buttons", hid);
 
-	input->name = name;
+	input->name = acpi_device_name(device);
 	input->phys = button->phys;
 	input->id.bustype = BUS_HOST;
 	input->dev.parent = &device->dev;
@@ -228,8 +227,8 @@ static int surface_button_add(struct acpi_device *device)
 		goto err_free_input;
 
 	device_init_wakeup(&device->dev, true);
-	dev_info(&device->dev,
-			"%s [%s]\n", name, acpi_device_bid(device));
+	dev_info(&device->dev, "%s [%s]\n", acpi_device_name(device),
+		 acpi_device_bid(device));
 	return 0;
 
  err_free_input:
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

