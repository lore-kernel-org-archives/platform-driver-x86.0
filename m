Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843498;
	b=PqswcAs8GcfqeMVRL+y3ZtOPEyrhN0H8qc7sv/UuNqerHjFfcblUHZ1ci46PUHtwP12y
	 YnwAUmvdUkw95SX23S2i+xhy05rspdM3C6qCYs7q1age3xxx2X9Ebct3/mZisraBWfLjL
	 m0zb3J5fF+XCnajvb2H37ByyVoQ5dAfVUIQYEtJvElZV6hdawaUQGFil4ep+prdF4NTFB
	 vTnI4GTAX4pI8hYW3M9Ipcyd0iavL94tqTL5uMiOPvhFtCZ3YzZrVffmKXdB1nZI0sVQE
	 cj7LbEJYo8NeLbbZLtdc0iPuiq6t/fkirHgUQzHBytQlqRvZ/uIiafpdYHEDbdrnG9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vD9JNVYkBr90+wNEOFzimA+/1Wmd6yeSBFAenJo5HNM=;
	b=DMzGqe1vmEsJiejLxCJzMMLGfez5YzLpjFK3HNejM8tyFcqY2FI6fsSBJIbp+Tncdum1
	 94bssQeWCyxofC4lPHUmE+QG//estMFcML0mQmBZ4Uy0tqUPs2+BtMhnBHs6qju+FgblI
	 N3QB+mXxseNL7SS+frbnaePSSkCiEZXt05HYBIYOtpn3V5J+wiDNT8cmauoo7wyPvWiHM
	 I5E6mywVv8Z1q7OtZgeXDucOdaOzBB3rF5rdAFC88RVhGT7T4Uzy/tx9T3LxRbZhM16cI
	 Qn8KgE7n9ekDaN2iBoWmPvFN5J/rDnIKKp529yRQKXg6zt/xeSUv/In1Esa/HQBr7Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="IGz/Di6N";
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A5606A324
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29A5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=IGz/Di6N
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8FD904013A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843496;
	bh=vD9JNVYkBr90+wNEOFzimA+/1Wmd6yeSBFAenJo5HNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=IGz/Di6NgLnKC737AGq7iwu27zL/X/sZkNrCg7SBmB3rgvDlAGX5gidNojNZa4mgA
	 WdkNl0vK7gz7aKUxu59ECNkSJi7a1/C7PIZyy0bRz1ye3uSOduL0rKNp338G9bOLVe
	 7wXw/YIzovhIcKVh5QdADev1Z4/OCIrILcnOBVRKLPu2YvswlAjS0YwIIjnpj45a2g
	 3GwenreCO6iTCIK5XACvyJhTnBXhfHVetpn/JM7CY9s6zfEBingglFYy5PPlnQALhq
	 oIA/bPaaCTyiRGKBqVIXnRkZGXP048qgxvc1waOJkmRFtDUyfBw04+vhKr83gfQEpJ
	 /PhPki1Llr600niwaMfQNTw6KZXiUsLk3c5dtD+QrSd1XFCTf6FyIs0ot99eOxM8e8
	 fYnOLYl05X28f2eqCW5AdMhrr0MtPZtgHiY9mDkrsho4pcgW0wYkDXATfIf8e4yXOS
	 B18qNkJZLrTEkSC4+orxNeFqs52JmaJ3F+vaM7NEfic2KpJJk3Azixidi8/GfNwBvY
	 X6efvGvUXSQjfPn7VZRUSqyl3nkOYeGAsaFljt6KZxOpn5DZU1JhWaWcKI6RhYhveK
	 eBn+4coltMtCsvSv73LshQ7i2a0eTFMLOKTf5AJeiOWjXY5PzGMTOpvqidK1ZhCiGR
	 f02kpA6t9qQonyujxbCRrh5E=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aa8f8c2638so508377a91.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 05:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843495; x=1793448295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vD9JNVYkBr90+wNEOFzimA+/1Wmd6yeSBFAenJo5HNM=;
        b=umGUMNzcaEYfj/Kt/j2s1+P0xGMful2b2ePswqU7aQDSipq/NXKOsbCXjVdh7AKS5Y
         4XTvy9sB8T2gpC9zNVw2/2DLEuR2XSCyWRllJKQj90wPWWxQlU0dxKoCPV/FCSGFrrl+
         wiW3uO/sB5UdReIGZNDpBHZrNKXNBbhbNcVt/CbP/MRNS/ygob62RScTIe00eFY+DIfU
         GLK8iJxSKIBuLltV8bWMdN1XWILx05tECxi43SgyrtuOZp3cvYis0F+ZCrw+IRqfJ4AO
         Rw7tjE51q52kATgEM9Pgk1xYbOvAIKVkJ7DO6j+VQtr5iYStl5XyFAsnEwIFsmhr6vl3
         M3jw==
X-Forwarded-Encrypted: i=1; AKwUvByzURGTdG1s4DguqMQ2BGBJvOLJjceP2rdxXTj9nN9EktO0sA5++qJKYHa8VsZCvDn3Xf1MvZ4V/Y2DwPka1ZpozBYU@vger.kernel.org
X-Gm-Message-State: AFq9FYID17ZnxkOIO9snsTfOcFx61/mr7idPvsTjEGJW4JhRWZIXXYV7
	yvBdid4QUARBFAhilPy3feJ8xwZDr+hGnDx5MZbom9wpce2Hzm8gcO8BjswLQ2XWKgo3sbMUO1K
	pN5UuTfbmcdtFp+zZSpUKDHdJL9ABHUpIb2c/7kFPZ5KOzUAowcD6EwpEXA3ZJOvH8Z3pBz5KtQ
	radskyN8tVfWpTsZE=
X-Gm-Gg: AYBFou1kZ2ZLyKvIfrQX8RwBbcngOizqmDg3yjaQ+jiR89cPB3Rc584jfIecCJwuwJ1
	KDq5sU9GImzAx6w6OErhWXeilva6PrTf+vKXHAoMRxEkJYP73fLf/ZEtKNaDRkiPzEmT94C1z1D
	c9wVY0q6rjzAnNOJ5t62ux/H14/vGecPugqv1xish2DfakzaXLlCnA1BToS6h7DLQCs97vr2Vix
	sxTX2f+LhezOU+EgpLJICLmpsqtlc4/QIZVvO1Qy9mhyGzaVFU8v81Z51/Omb/rcOheFunKYsHm
	qRNOiQLSuwo4vfN2xpw7V/MFioA3FZfgJbAWZZAS01Ju0wGJ0yw9DhgpQ1DhzKjre6XyCcC/lk0
	thbGo9/hw1TeeSXqB4vv+/mBtquvzloO62P1u0tt9Gci2zkWgaW9M2sVrwxl/DJ/8Tv0fElvZeE
	mBsSdSrrT+XCJAMSENbcmtGAN7fBBEbtsF5+bi2akCjy6IbL8jWI9EV+JE0LQAZC/nGqBIkY5lQ
	okWPf6k23ngkkty2n3ekYb8/PZyGyj8tZGCPs6QkQ==
X-Received: by 2002:a17:90b:2689:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3ade946f661mr2849333a91.0.1792843494901;
        Sat, 24 Oct 2026 05:04:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3ade946f661mr2849266a91.0.1792843494205;
        Sat, 24 Oct 2026 05:04:54 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:53 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v5 1/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 20:04:38 +0800
Message-Id: <f3ec60d4e68819c994a0d4c6d44eb5cf8d511ddb.1792831564.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792831564.git.an.wu@canonical.com>
References: <cover.1792831564.git.an.wu@canonical.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Serdev clients instantiated by a driver have no ACPI companion and no
device tree node. Their modalias read returns -ENODEV, their add uevent
is suppressed, and they cannot be driver-matched, so creators force a
bind with device_driver_attach().

Resolve both TODOs in the serdev core by modelling matching on the SPI
bus: let the creator pass a modalias to serdev_device_add() and give
struct serdev_device_driver an id_table. ACPI and OF are still tried
first; clients without their own modalias keep returning -ENODEV. The
device name, derived from the controller, is unchanged.

Split struct serdev_device_id and its defines into a new
include/linux/device-id/serdev.h, following the pattern already used by
the SPI and I2C buses.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 MAINTAINERS                                   |  1 +
 .../platform/x86/x86-android-tablets/core.c   |  2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
 drivers/tty/serdev/core.c                     | 62 ++++++++++++++++---
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 6 files changed, 86 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 917f3f72e31b..06e67aa5d9b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24905,6 +24905,7 @@ L:	linux-serial@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/serial/serial.yaml
 F:	drivers/tty/serdev/
+F:	include/linux/device-id/serdev.h
 F:	include/linux/serdev.h
 F:	rust/helpers/serdev.c
 F:	rust/kernel/serdev.rs
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index cfff7f5eac5d..853aa6ff5d50 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -317,7 +317,7 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
 	acpi_device_set_enumerated(serdev_adev);
 
-	ret = serdev_device_add(serdev);
+	ret = serdev_device_add(serdev, NULL);
 	if (ret) {
 		dev_err(&serdev->dev, "error %d adding serdev\n", ret);
 		serdev_device_put(serdev);
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e42e85f47629..e0482f2ef39f 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -309,7 +309,7 @@ static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
 	if (ret)
 		goto err_free_serdev;
 
-	ret = serdev_device_add(pci_dev->serdev);
+	ret = serdev_device_add(pci_dev->serdev, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add serdev for PCI device (%s): %d\n",
 			pci_name(pdev), ret);
diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 7500efcdfc21..e0517d5a48da 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -29,13 +29,21 @@ static DEFINE_IDA(ctrl_ida);
 static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
+	const struct serdev_device *serdev = to_serdev_device(dev);
 	int len;
 
 	len = acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
 	if (len != -ENODEV)
 		return len;
 
-	return of_device_modalias(dev, buf, PAGE_SIZE);
+	len = of_device_modalias(dev, buf, PAGE_SIZE);
+	if (len != -ENODEV)
+		return len;
+
+	if (!serdev->modalias[0])
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%s%s\n", SERDEV_MODULE_PREFIX, serdev->modalias);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -47,15 +55,22 @@ ATTRIBUTE_GROUPS(serdev_device);
 
 static int serdev_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
+	const struct serdev_device *serdev = to_serdev_device(dev);
 	int rc;
 
-	/* TODO: platform modalias */
-
 	rc = acpi_device_uevent_modalias(dev, env);
 	if (rc != -ENODEV)
 		return rc;
 
-	return of_device_uevent_modalias(dev, env);
+	rc = of_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
+
+	if (!serdev->modalias[0])
+		return -ENODEV;
+
+	return add_uevent_var(env, "MODALIAS=%s%s", SERDEV_MODULE_PREFIX,
+			      serdev->modalias);
 }
 
 static void serdev_device_release(struct device *dev)
@@ -86,28 +101,57 @@ static const struct device_type serdev_ctrl_type = {
 	.release	= serdev_ctrl_release,
 };
 
+static const struct serdev_device_id *serdev_match_id(const struct serdev_device_id *id,
+						      const char *modalias)
+{
+	if (!id || !modalias[0])
+		return NULL;
+
+	while (id->name[0]) {
+		if (!strcmp(modalias, id->name))
+			return id;
+		id++;
+	}
+
+	return NULL;
+}
+
 static int serdev_device_match(struct device *dev, const struct device_driver *drv)
 {
+	const struct serdev_device *serdev;
+	const struct serdev_device_driver *sdrv;
+
 	if (!is_serdev_device(dev))
 		return 0;
 
-	/* TODO: platform matching */
+	serdev = to_serdev_device(dev);
+	sdrv = to_serdev_device_driver(drv);
+
 	if (acpi_driver_match_device(dev, drv))
 		return 1;
 
-	return of_driver_match_device(dev, drv);
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	return !!serdev_match_id(sdrv->id_table, serdev->modalias);
 }
 
 /**
  * serdev_device_add() - add a device previously constructed via serdev_device_alloc()
  * @serdev:	serdev_device to be added
+ * @modalias:	Driver name or alias, used to match devices which have neither
+ *		an ACPI companion nor a device tree node. NULL for devices
+ *		enumerated from firmware.
  */
-int serdev_device_add(struct serdev_device *serdev)
+int serdev_device_add(struct serdev_device *serdev, const char *modalias)
 {
 	struct serdev_controller *ctrl = serdev->ctrl;
 	struct device *parent = serdev->dev.parent;
 	int err;
 
+	if (modalias)
+		strscpy(serdev->modalias, modalias);
+
 	dev_set_name(&serdev->dev, "%s-%d", dev_name(parent), serdev->nr);
 
 	/* Only a single slave device is currently supported. */
@@ -553,7 +597,7 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 
 		device_set_node(&serdev->dev, of_fwnode_handle(node));
 
-		err = serdev_device_add(serdev);
+		err = serdev_device_add(serdev, NULL);
 		if (err) {
 			dev_err(&serdev->dev,
 				"failure adding device. status %pe\n",
@@ -707,7 +751,7 @@ static acpi_status acpi_serdev_register_device(struct serdev_controller *ctrl,
 	ACPI_COMPANION_SET(&serdev->dev, adev);
 	acpi_device_set_enumerated(adev);
 
-	err = serdev_device_add(serdev);
+	err = serdev_device_add(serdev, NULL);
 	if (err) {
 		dev_err(&serdev->dev,
 			"failure adding ACPI serdev device. status %pe\n",
diff --git a/include/linux/device-id/serdev.h b/include/linux/device-id/serdev.h
new file mode 100644
index 000000000000..96644953cece
--- /dev/null
+++ b/include/linux/device-id/serdev.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_DEVICE_ID_SERDEV_H
+#define LINUX_DEVICE_ID_SERDEV_H
+
+#ifdef __KERNEL__
+typedef unsigned long kernel_ulong_t;
+#endif
+
+/* serdev */
+
+#define SERDEV_NAME_SIZE	40
+#define SERDEV_MODULE_PREFIX	"serial:"
+
+struct serdev_device_id {
+	char name[SERDEV_NAME_SIZE];
+	kernel_ulong_t driver_data;	/* Data private to the driver */
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SERDEV_H */
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index b6c3d957ec15..96a441abc1ac 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -7,7 +7,9 @@
 
 #include <linux/types.h>
 #include <linux/device.h>
+#include <linux/device-id/serdev.h>
 #include <linux/iopoll.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/termios.h>
 #include <linux/delay.h>
@@ -35,6 +37,10 @@ struct serdev_device_ops {
  * struct serdev_device - Basic representation of an serdev device
  * @dev:	Driver model representation of the device.
  * @nr:		Device number on serdev bus.
+ * @modalias:	Name of the driver to use with this device, or the alias
+ *		for it. Empty for devices enumerated from firmware, which
+ *		are identified through their ACPI companion or their device
+ *		tree node instead. See serdev_device_add().
  * @ctrl:	serdev controller managing this device.
  * @ops:	Device operations.
  * @write_comp:	Completion used by serdev_device_write() internally
@@ -43,6 +49,7 @@ struct serdev_device_ops {
 struct serdev_device {
 	struct device dev;
 	int nr;
+	char modalias[SERDEV_NAME_SIZE];
 	struct serdev_controller *ctrl;
 	const struct serdev_device_ops *ops;
 	struct completion write_comp;
@@ -55,12 +62,15 @@ struct serdev_device {
  * struct serdev_device_driver - serdev slave device driver
  * @driver:	serdev device drivers should initialize name field of this
  *		structure.
+ * @id_table:	List of serdev devices supported by this driver, used to
+ *		match devices which are not enumerated from firmware.
  * @probe:	binds this driver to a serdev device.
  * @remove:	unbinds this driver from the serdev device.
  * @shutdown:	shut down this serdev device.
  */
 struct serdev_device_driver {
 	struct device_driver driver;
+	const struct serdev_device_id *id_table;
 	int	(*probe)(struct serdev_device *);
 	void	(*remove)(struct serdev_device *);
 	void	(*shutdown)(struct serdev_device *);
@@ -158,7 +168,7 @@ static inline void serdev_controller_put(struct serdev_controller *ctrl)
 }
 
 struct serdev_device *serdev_device_alloc(struct serdev_controller *);
-int serdev_device_add(struct serdev_device *);
+int serdev_device_add(struct serdev_device *serdev, const char *modalias);
 void serdev_device_remove(struct serdev_device *);
 
 struct serdev_controller *serdev_controller_alloc(struct device *host,
-- 
2.34.1

