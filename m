Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808987;
	b=oaDYyBHUyWCCxtKYQuv0BxvB7MsEJyMd/QP+ncnYCLiJuQ2afPQU8mjwXJbUfa877aNh
	 irmkVJqx+l7yz9F2LhpCwdzGjnYz46y+5xWR55zXllPR3LLLDbJLFBm68p8vAXiuZAwMe
	 YutfiGoVcf5L5ZDJO8Qtqc1z2jR7v8ADSb256j6N/HTMrh37Lb+DDwvVlXWd+v6AqIlbp
	 qhg+J2nYERZ3302019JintmhW/MEn3vparPD2siE2HK3q7JP6Tumdr7EYYG0F5VSkwVCD
	 5+XPjpy4W4ID20ath+YaKWhlcuHqAtSEpuRiDyTxtj+u6yoUaLa2mzeKxfMKH+VVj6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
	b=NdVOY2ob0QJrVyT/nCJzVzcSNNpOTuC2auYwZ87OycnJ5ETUHN2cX+BdVhFX8ycJ/RUO
	 Cd5lDmIOJmifdy77pynb8TYcJzk19R2A9LgZ8N7SHItxWP3F6g5ne9WJTkcKcBpAOgaWs
	 m3hwMuUGgcgV06Xu0AORxIp6Ljkj085n/NZRM4MjM5GB/jZkfc3g39now15pIbqtgF9TE
	 eVu3Mr7dcInS48TbP/GCbrEPokhYu6cQHI+9UmiaGa0oI+TVE0aIyswoRcXTHByunxAOP
	 g5A94YJJ6/MsDhJNMqVBb57N/NyT94itKjmkSOF7TL5D/7dyL3PizWjZSSA5IK/VLkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=nMYl7Afg;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8768A606A322
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8768A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=nMYl7Afg
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 069E1403F6
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 02:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808985;
	bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=nMYl7AfgUPHe/7mapPEAw4y0J5BBwF+y6yjlFQyBZS6wcFFobFOMXpQ5+N+tPVrg+
	 tDScXeAj7DQ0TIXbUR0inr/VbxLUcOtcqSSa3wEFYC9ID53ASFSYKJlHlk0/adjc1/
	 EROBJviy+oetTIN084Dt9lcxE2CJ18WcDaYsbgpCp5BX5CR0dz7+bc8iNv/aLhWHyH
	 felnqd4WJigqZY1j2n+3rGGwvUVlCYZjb1GLfxRp26rnJIGd/0GXoCLMNtoLbox1CU
	 MGwylCwR9bewz/38QjKnDAssd58oP1xVNbnufjFd/VthD2AuJ/GyqM2+2G+CEVwYHq
	 +t1iomcymIQ8brg7iyW+OhodWt8oE78tyACi5HP1owSMoWW/pHdqGwfoOmEJASmQkO
	 ydaskgsPg/pblj798St5oVT9wz+4jLp/vfMbNuPPdt9BQ+6vwkOe74Nlcsr+Z00Ghi
	 kfBbyI/hI/dUVDZH1Ms68iCw8xt0H8WCj6nAuSvwX+RUfvRyoDrT7xnofqnTEHKluj
	 Pxl2s7UOIRq06kJSYAQmeZ7wswCrkrnw1TGVTeVDCljmT3wOxNCchGQjhm2S35eH0d
	 nwaR18hfXqiKdIwLOp809OW3CEWupDR0QL9An4IY3yZ3AXyCMdcAStKb9qfK8m50dd
	 Y+BV08P+k17TZXsErTsFCI+8=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e848cd27beso5227595ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 19:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808983; x=1793413783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
        b=UbpeQehABynlPKrhq7c6Ej7HtvNepiy6AM09AOhNMgLHvk1LBcY8RoeCBQ2nuzb1c9
         Z9s+U6gXp3lhssMHGPyoze7pYp0cKxr2Pofx2XrUu6t2d2sYq/ufgI5KlMMes4PQU/a/
         qAVpktSZYbf8ANa9Z2RGYgPG7LesN4/M6woRPI5ZB9J4UtpuqK+i0wdbzDrIOB0G8ikf
         B5RWTBytIFIuNX9l8jPIRYsB5QB2Y3Ah6dt/hahDYPVsEttyvT5kUkCpn3EluVzCwmRm
         S7kUTcM37L8H1nEJT43tkm1xJ3zgWhwODOLWPPpfFRePZgBGIQLTstI9IGcK06ggUXFX
         zm9A==
X-Forwarded-Encrypted: i=1; AKwUvBzOQtsKjkjZoA0Rzv1sJ6oI2jifiGTPJ7TWGpuTZ5puihDNSiQS+cW6yW0+NOF/6LSUUioF9NwFAWvqsY5j0IJYkJY5@vger.kernel.org
X-Gm-Message-State: AFq9FYLtpRjtChRjJBt3oqnLJYVxkeO7PPg7moMa8J1l6lrKEi6Y5ozm
	CxtFiX9959SupFZ4Rs3urqFK0WaZoitLEeHlxQCD8BcZHGR7oFBGyTFhuvA6fInK40/R/ZvbB0Z
	YMtSZ27COul5KauFRtJCHNy4D6GUt44sr1ibchQF39NkmqSILFH3n7poWvwbXmhLU6VU2MiVYgE
	G1YpnWLD88Kcah+uc=
X-Gm-Gg: AYBFou0P4/9sZLWU412fhSiIwm/LrpjBWG6uPwxsQUcjrDfzywkhRjoary7ia4ngctb
	jptE0xMQZ0Z4vxBSJwTgSrAlfs+ItR7ALxU7dm7QwSYd8CeH5sQlN1QOXGXExxnvo67jtHoSCVa
	CdJsJLu/VE22kzvaFCagMt5tRQwCbCWCOJdPBmqz5S4h+P8gwdY9g+f7LKNaWNDumxl8Q+ivjPX
	lUIt7loZak0uChQsnOt2fmW+AXVKTmkKsFqNXB+OFDFia6yYaKWAom/OwJfow3KkOCIFJq2Qlr1
	tE5IPCREKqbe8naB+Ddm6BWJs2ONnKSwr0pd1M0YnGELQtqddW4tkO0FlADJElg6gX0Ozl30gNO
	l2BAKqFhg6PE5D8QuGFfLzja2KUs8YJFQmxKUzJ6zcAIRPTqnTPmYUX478rU00g6sUQ/keQz8re
	fPGIlyUyHlV+U6pkvZYsnoFIKUDxGP8yvK3hikKSOWE5d2dofq0ZXA7ig7B1EUDjdoMFtJqGmcZ
	JEyTuCtH1ZQ7b4waxdVNgDFnKUj65OlW/a5SqTspYM=
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1474108a91.5.1792808983302;
        Fri, 23 Oct 2026 19:29:43 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1474086a91.5.1792808982878;
        Fri, 23 Oct 2026 19:29:42 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:42 -0700 (PDT)
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
Subject: [PATCH v4 1/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 10:29:28 +0800
Message-Id: <20261024022930.2704030-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024022930.2704030-1-an.wu@canonical.com>
References: <20261024022930.2704030-1-an.wu@canonical.com>
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
 drivers/tty/serdev/core.c                     | 65 ++++++++++++++-----
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 6 files changed, 82 insertions(+), 19 deletions(-)
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
index 7500efcdfc21..45175403bd55 100644
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
@@ -70,11 +85,6 @@ static const struct device_type serdev_device_type = {
 	.release	= serdev_device_release,
 };
 
-static bool is_serdev_device(const struct device *dev)
-{
-	return dev->type == &serdev_device_type;
-}
-
 static void serdev_ctrl_release(struct device *dev)
 {
 	struct serdev_controller *ctrl = to_serdev_controller(dev);
@@ -86,28 +96,51 @@ static const struct device_type serdev_ctrl_type = {
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
-	if (!is_serdev_device(dev))
-		return 0;
+	const struct serdev_device *serdev = to_serdev_device(dev);
+	const struct serdev_device_driver *sdrv = to_serdev_device_driver(drv);
 
-	/* TODO: platform matching */
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
@@ -553,7 +586,7 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 
 		device_set_node(&serdev->dev, of_fwnode_handle(node));
 
-		err = serdev_device_add(serdev);
+		err = serdev_device_add(serdev, NULL);
 		if (err) {
 			dev_err(&serdev->dev,
 				"failure adding device. status %pe\n",
@@ -707,7 +740,7 @@ static acpi_status acpi_serdev_register_device(struct serdev_controller *ctrl,
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

