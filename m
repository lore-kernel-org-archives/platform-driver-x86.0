Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7361D3585
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750941; cv=none; b=uG+txpktSuHDQZHCOB8y+tQ3B75TOr0KledzjVlFWOzxw6chp3N0UKiXh3BQBB+1k9vErPU7aW6qUtXpHkIupif69fcuJm3/gdAUxRD1KnaRI3hUNtgWPswWQiYBBCSbJZeLNpDvx0dkHKEWKEoaZp7qp4b7VUXPdnGKQCXkiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750941; c=relaxed/simple;
	bh=/8XJiOAoXeaqoN2WAGOvYtCm4CXbRyN+dIc0jXc89Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HScMyqJaGz7pjgeVEVYjrGHVeUT5azJ+7bkfwPtbnYs4WuZvlpdGvD4YInY9KtB9QLpAvp8hH5coqmykvWZbPVrlD/wArbs5bMSmmVHKu1Jd/EkFl82VVJhGJIz3BlNqh3N2c2g9695VLM3mmMFZxRgsLMEHO78dzErbvPLy+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NSjXqZ0C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSjXqZ0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730750939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2IHZ9OYZkdfrM8K23vVt8HHLIKGwXAip4mjt5lJ7C8=;
	b=NSjXqZ0CIY/OTcKHDyY0rdEofA7W5M/XijJPmBhY8hRFXaGARKYMhKLDUp4iGkIK7YRSma
	s4b7TKRVKb5ldFjgeUKm2j7Cpqv+sjj0bUXV//ssZimouPbkzOCB59s2/qVZ3mZGyhFdC9
	vkh3a55HXm0lT2qabiqrpj40zbPjh4w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-lEUAr-V6OhmzsYciz245TA-1; Mon,
 04 Nov 2024 15:08:56 -0500
X-MC-Unique: lEUAr-V6OhmzsYciz245TA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2FA31955EB5;
	Mon,  4 Nov 2024 20:08:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.64])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8AFDD195607C;
	Mon,  4 Nov 2024 20:08:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add support for getting i2c_adapter by PCI parent devname()
Date: Mon,  4 Nov 2024 21:08:47 +0100
Message-ID: <20241104200848.58693-3-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-1-hdegoede@redhat.com>
References: <20241104200848.58693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

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
Changes in v2:
- Move "depends on PCI" Kconfig change to this patch
- Put the code to get the adapter in a get_i2c_adap_by_pci_parent() helper
---
 .../platform/x86/x86-android-tablets/Kconfig  |  4 +-
 .../platform/x86/x86-android-tablets/core.c   | 39 ++++++++++++++++++-
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 88d9e8f2ff24..a67bddc43007 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -5,7 +5,9 @@
 
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
-	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
+	depends on I2C && SPI && SERIAL_DEV_BUS
+	depends on GPIOLIB && PMIC_OPREGION
+	depends on ACPI && EFI && PCI
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 4154395c60bb..5241b260c0e8 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -11,11 +11,13 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
 #include <linux/string.h>
@@ -170,18 +172,51 @@ get_i2c_adap_by_handle(const struct x86_i2c_client_info *client_info)
 	return i2c_acpi_find_adapter_by_handle(handle);
 }
 
+static __init int match_parent(struct device *dev, const void *data)
+{
+	return dev->parent == data;
+}
+
+static struct i2c_adapter *
+get_i2c_adap_by_pci_parent(const struct x86_i2c_client_info *client_info)
+{
+	struct i2c_adapter *adap = NULL;
+	struct device *pdev, *adap_dev;
+
+	pdev = bus_find_device_by_name(&pci_bus_type, NULL, client_info->adapter_path);
+	if (!pdev) {
+		pr_err("Error could not find %s PCI device\n", client_info->adapter_path);
+		return NULL;
+	}
+
+	adap_dev = bus_find_device(&i2c_bus_type, NULL, pdev, match_parent);
+	if (adap_dev) {
+		adap = i2c_verify_adapter(adap_dev);
+		if (!adap)
+			put_device(adap_dev);
+	}
+
+	put_device(pdev);
+
+	return adap;
+}
+
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
 {
 	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
 	struct i2c_board_info board_info = client_info->board_info;
-	struct i2c_adapter *adap;
+	struct i2c_adapter *adap = NULL;
 
 	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
 	if (board_info.irq < 0)
 		return board_info.irq;
 
-	adap = get_i2c_adap_by_handle(client_info);
+	if (dev_info->use_pci_devname)
+		adap = get_i2c_adap_by_pci_parent(client_info);
+	else
+		adap = get_i2c_adap_by_handle(client_info);
+
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

