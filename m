Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4B18A943;
	Tue,  7 Jan 2025 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269557; cv=none; b=CRg3y5UapDnx9SixZlddXarZMAqlSakvD9EKh5WKrsZKy7+viKEZ4a2s3r00r7HC351TeJJxQRjb6cH0unH6Cjjfb67SaeIHfRyniTzAH1HHQWXZ6eGsUW9MEa8iqBHFrOltawJz3IQ9uKcQogLxb8xyGzds3iyJaUV2pLZMecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269557; c=relaxed/simple;
	bh=D9e3IIpmKAdeBMfMaTPg+oFMfCvFGt0p2+6XpKnJvIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQJlqv9P1vdqv99MVOZ+eM69kDrEKucr2sMgiYy3UzXfPVUek3SX0A1+HscM+6UX18mlETpxRedVLeuOd3605CdW/2tNLNOsVhAmVVa796iXfpfS5l7IvnZgHM67Hfz7ytlPFUwueeJHRn8RFd8AMZSD8Zl8dtm87ZUOMJhTO8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=d8KBKxYF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="d8KBKxYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736269549;
	bh=D9e3IIpmKAdeBMfMaTPg+oFMfCvFGt0p2+6XpKnJvIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d8KBKxYF6VYJ302vPrEqMcWBhmE5PdIIDJHLyEhmre4De391y21wy2LYmjSSujd0N
	 u3b5d+scTof4JxlaraXFOEw8TvoeeBMbBxUxeQCmIoo52cN7rxWNxCsuzPXLxuucxb
	 wlHqYpAcIrgXpBtHoo2IUOPTvfC7ZiVWhXli2aDQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Jan 2025 18:05:37 +0100
Subject: [PATCH 1/2] platform/x86: firmware_attributes_class: Provide a
 highlevel interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250107-pdx86-firmware-attributes-v1-1-9d75c04a3b52@weissschuh.net>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
In-Reply-To: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736269549; l=8103;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=D9e3IIpmKAdeBMfMaTPg+oFMfCvFGt0p2+6XpKnJvIw=;
 b=6luckhMX8m4J4XkKBQXtnYp7B7c3XatvaF4x62UtbPuQLNpFFMgE0OSV2WdE6thqPNY2hrnMM
 uSVzWEjCnV9CtriJAY3PUATVdX10ZKhevxpjnmdo68v2uDSwtWndIQw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently each user of firmware_attributes_class has to manually set up
kobjects, devices, etc.
Provide a higher level API which takes care of the low-level details.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/firmware_attributes_class.c | 146 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  37 ++++++
 2 files changed, 183 insertions(+)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 736e96c186d9dc6d945517f090e9af903e93bbf4..70ceae5215820098b017bfda991a3c2a7824c98e 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -2,6 +2,9 @@
 
 /* Firmware attributes class helper module */
 
+#include <linux/device/class.h>
+#include <linux/device.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include "firmware_attributes_class.h"
 
@@ -22,6 +25,149 @@ static __exit void fw_attributes_class_exit(void)
 }
 module_exit(fw_attributes_class_exit);
 
+static ssize_t fw_attributes_sysfs_show(struct kobject *kobj, struct attribute *attr, char *buf)
+{
+	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
+	const struct firmware_attribute *fw_attr = to_firmware_attribute(attr);
+
+	if (!fw_attr->show)
+		return -EIO;
+
+	return fw_attr->show(fwadev, fw_attr, buf);
+}
+
+static ssize_t fw_attributes_sysfs_store(struct kobject *kobj, struct attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
+	const struct firmware_attribute *fw_attr = to_firmware_attribute(attr);
+
+	if (!fw_attr->store)
+		return -EIO;
+
+	return fw_attr->store(fwadev, fw_attr, buf, count);
+}
+
+static const struct sysfs_ops fw_attributes_sysfs_ops = {
+	.show	= fw_attributes_sysfs_show,
+	.store	= fw_attributes_sysfs_store,
+};
+
+static void fw_attributes_attr_release(struct kobject *kobj)
+{
+	struct firmware_attributes_device *fwadev = to_firmware_attribute_device(kobj);
+	struct device *cdev;
+
+	cdev = fwadev->dev;
+
+	kfree(fwadev);
+	device_unregister(cdev);
+}
+
+static const struct kobj_type fw_attributes_attr_type = {
+	.sysfs_ops	= &fw_attributes_sysfs_ops,
+	.release	= fw_attributes_attr_release,
+};
+
+DEFINE_FREE(firmware_attributes_device_unregister, struct firmware_attributes_device *,
+	    if (_T) firmware_attributes_device_unregister(_T))
+
+struct firmware_attributes_device *
+firmware_attributes_device_register(struct device *parent, const char *name,
+				    const struct attribute_group **groups, void *data)
+{
+	struct firmware_attributes_device *fwadev = NULL;
+	struct device *cdev = NULL;
+	int ret;
+
+	fwadev = kzalloc(sizeof(*fwadev), GFP_KERNEL);
+	if (!fwadev)
+		return ERR_PTR(-ENOMEM);
+
+	cdev = device_create(&firmware_attributes_class, parent, MKDEV(0, 0), "%s", name);
+	if (IS_ERR(cdev))
+		return ERR_CAST(cdev);
+
+	fwadev->data = data;
+	fwadev->dev = cdev;
+
+	ret = kobject_init_and_add(&fwadev->attributes, &fw_attributes_attr_type, &cdev->kobj,
+				   "attributes");
+	if (ret) {
+		device_del(cdev);
+		return ERR_PTR(ret);
+	}
+
+	if (groups) {
+		ret = sysfs_create_groups(&fwadev->attributes, groups);
+		if (ret) {
+			firmware_attributes_device_unregister(fwadev);
+			return ERR_PTR(ret);
+		}
+
+		kobject_uevent(&fwadev->dev->kobj, KOBJ_CHANGE);
+	}
+
+	return fwadev;
+}
+EXPORT_SYMBOL_GPL(firmware_attributes_device_register);
+
+void firmware_attributes_device_unregister(struct firmware_attributes_device *fwadev)
+{
+	kobject_del(&fwadev->attributes);
+	kobject_put(&fwadev->attributes);
+}
+EXPORT_SYMBOL_GPL(firmware_attributes_device_unregister);
+
+static void devm_firmware_attributes_device_release(void *data)
+{
+	struct firmware_attributes_device *fwadev = data;
+
+	firmware_attributes_device_unregister(fwadev);
+}
+
+struct firmware_attributes_device *
+devm_firmware_attributes_device_register(struct device *parent, const char *name,
+					 const struct attribute_group **groups, void *data)
+{
+	struct firmware_attributes_device *fwadev;
+	int ret;
+
+	fwadev = firmware_attributes_device_register(parent, name, groups, data);
+	if (IS_ERR(fwadev))
+		return fwadev;
+
+	ret = devm_add_action_or_reset(parent, devm_firmware_attributes_device_release, fwadev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwadev;
+}
+EXPORT_SYMBOL_GPL(devm_firmware_attributes_device_register);
+
+static ssize_t firmware_attributes_type_show(struct firmware_attributes_device *fwadev,
+					     const struct firmware_attribute *attr, char *buf)
+{
+	if (attr == &_firmware_attribute_type_string)
+		return sysfs_emit(buf, "string\n");
+	else if (attr == &_firmware_attribute_type_enumeration)
+		return sysfs_emit(buf, "enumeration\n");
+	else if (attr == &_firmware_attribute_type_integer)
+		return sysfs_emit(buf, "integer\n");
+	else
+		return -EIO;
+}
+
+#define __FW_TYPE_ATTR	__ATTR(type, 0444, firmware_attributes_type_show, NULL)
+
+const struct firmware_attribute _firmware_attribute_type_string = __FW_TYPE_ATTR;
+EXPORT_SYMBOL_GPL(_firmware_attribute_type_string);
+const struct firmware_attribute _firmware_attribute_type_enumeration = __FW_TYPE_ATTR;
+EXPORT_SYMBOL_GPL(_firmware_attribute_type_enumeration);
+const struct firmware_attribute _firmware_attribute_type_integer = __FW_TYPE_ATTR;
+EXPORT_SYMBOL_GPL(_firmware_attribute_type_integer);
+
 MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net>");
 MODULE_DESCRIPTION("Firmware attributes class helper module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index d27abe54fcf9812a2f0868eec5426bbc8e7eb21c..66837ad9f65b8ca501dee73f48c01f2710d86bf5 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -5,8 +5,45 @@
 #ifndef FW_ATTR_CLASS_H
 #define FW_ATTR_CLASS_H
 
+#include <linux/device.h>
 #include <linux/device/class.h>
+#include <linux/sysfs.h>
 
 extern const struct class firmware_attributes_class;
 
+struct firmware_attributes_device {
+	struct device *dev;
+	struct kobject attributes;
+	void *data;
+};
+
+struct firmware_attribute {
+	struct attribute attr;
+	ssize_t (*show)(struct firmware_attributes_device *fwadev,
+			const struct firmware_attribute *attr, char *buf);
+	ssize_t (*store)(struct firmware_attributes_device *fwadev,
+			 const struct firmware_attribute *attr, const char *buf, size_t count);
+};
+
+#define to_firmware_attribute(_a) container_of_const(_a, struct firmware_attribute, attr)
+#define to_firmware_attribute_device(_s) \
+	container_of_const(_s, struct firmware_attributes_device, attributes)
+
+extern const struct firmware_attribute _firmware_attribute_type_string;
+#define firmware_attribute_type_string ((struct attribute *)&_firmware_attribute_type_string.attr)
+extern const struct firmware_attribute _firmware_attribute_type_enumeration;
+#define firmware_attribute_type_enumeration ((struct attribute *)&_firmware_attribute_type_enumeration.attr)
+extern const struct firmware_attribute _firmware_attribute_type_integer;
+#define firmware_attribute_type_integer ((struct attribute *)&_firmware_attribute_type_integer.attr)
+
+struct firmware_attributes_device * __must_check
+firmware_attributes_device_register(struct device *parent, const char *name,
+				    const struct attribute_group **groups, void *data);
+
+void firmware_attributes_device_unregister(struct firmware_attributes_device *fwadev);
+
+struct firmware_attributes_device * __must_check
+devm_firmware_attributes_device_register(struct device *parent, const char *name,
+					 const struct attribute_group **groups, void *data);
+
 #endif /* FW_ATTR_CLASS_H */

-- 
2.47.1

