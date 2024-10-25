Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC81D45E2
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849492; cv=none; b=Vx9Glpd3u/RhGUePyOVAMJgauZoMSY8Z3qb7r/IuYwRdkufIyM509Gpx8CVvI+Um3LNcChXBvcIngAHOv+z8PQk0qtI8OMJrueGbfDgp016N/K2+W+nHnJvPg0bZfbCBdpLVoWge8gKXfZ/+v7GcLA7l69Dmeqeso8dI0W/v7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849492; c=relaxed/simple;
	bh=3ubS+LjPBthPcKrLKSKd+YLiT34RaKgDNgfRZqQwyI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMba6nZ6t6dLD5lLNyNcN4QtZuP/nFZIjoLrKG/qjKuxHIrGzHzfQhCcErb+kOpKlrDnO/y2dD/51U1esngsyYX9Jg8GyAMFhU5JYUbqUAhd2oYslxSMZQtbXaSbtmLJOkOAV/5jz9jr60zoIpaqv/2pgiF/icF8g++OqzBeaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqQoJKw5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqQoJKw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729849488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TzDeuALWxMkg9+6jidy2f2EEnpBbuxNtBaboOQRBQ2k=;
	b=SqQoJKw54UiygMgSyq8s50HrrkRHP3GE+EpIR5eE0lruGeHFIoRbbdwDQyaLhtCRK0KntL
	S6GQn9wjWNBq9Ffq2COtkspkJdYqMwZiU+IV3LuCNfwuw6NWKrkCkqIkcriIz/A4JJjeD5
	+pBdek0kPMwxFML7X2xYq8m0FU1zpeY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-Nn612S0MPd2GysiW5nrkrg-1; Fri,
 25 Oct 2024 05:44:46 -0400
X-MC-Unique: Nn612S0MPd2GysiW5nrkrg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7926A19560AB;
	Fri, 25 Oct 2024 09:44:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.162])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2912230001AA;
	Fri, 25 Oct 2024 09:44:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for getting i2c_adapter by PCI parent devname()
Date: Fri, 25 Oct 2024 11:44:34 +0200
Message-ID: <20241025094435.71718-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
(guadalinex) using the custom Android kernel the I2C controllers are not
enumerated as ACPI devices as they typically are.

Instead they are enumerated as PCI devices which do not have ACPI firmware
nodes associated with them, so getting the i2c_adapter by the ACPI path of
its firmware node does not work.

Add support for getting the i2c_adapter by the devname() of its PCI parent
instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/core.c   | 45 +++++++++++++++----
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 2 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index ef572b90e06b..599737d84242 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -11,11 +11,14 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/device/bus.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
 #include <linux/string.h>
@@ -155,26 +158,52 @@ static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
 static void (*exit_handler)(void);
 
+static __init int match_parent(struct device *dev, const void *data)
+{
+	return dev->parent == data;
+}
+
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
 {
 	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
 	struct i2c_board_info board_info = client_info->board_info;
-	struct i2c_adapter *adap;
-	acpi_handle handle;
-	acpi_status status;
+	struct i2c_adapter *adap = NULL;
 
 	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
 	if (board_info.irq < 0)
 		return board_info.irq;
 
-	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
-	if (ACPI_FAILURE(status)) {
-		pr_err("Error could not get %s handle\n", client_info->adapter_path);
-		return -ENODEV;
+	if (dev_info->use_pci_devname) {
+		struct device *pdev, *adap_dev;
+
+		pdev = bus_find_device_by_name(&pci_bus_type, NULL, client_info->adapter_path);
+		if (!pdev) {
+			pr_err("Error could not find %s PCI device\n", client_info->adapter_path);
+			return -ENODEV;
+		}
+
+		adap_dev = bus_find_device(&i2c_bus_type, NULL, pdev, match_parent);
+		if (adap_dev) {
+			adap = i2c_verify_adapter(adap_dev);
+			if (!adap)
+				put_device(adap_dev);
+		}
+
+		put_device(pdev);
+	} else {
+		acpi_handle handle;
+		acpi_status status;
+
+		status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
+		if (ACPI_FAILURE(status)) {
+			pr_err("Error could not get %s handle\n", client_info->adapter_path);
+			return -ENODEV;
+		}
+
+		adap = i2c_acpi_find_adapter_by_handle(handle);
 	}
 
-	adap = i2c_acpi_find_adapter_by_handle(handle);
 	if (!adap) {
 		pr_err("error could not get %s adapter\n", client_info->adapter_path);
 		return -ENODEV;
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 5517e438c7b6..d26a4792eb0e 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -91,6 +91,7 @@ struct x86_dev_info {
 	int gpio_button_count;
 	int (*init)(struct device *dev);
 	void (*exit)(void);
+	bool use_pci_devname;
 };
 
 int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
-- 
2.47.0

