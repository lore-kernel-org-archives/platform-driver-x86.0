Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414412;
	b=NstyulCVVVneldUk3jeZwTTyNDDS9V4NnDOS1xDSf6KuvaAHpURoyL5c4Nd3dWdTOWA7
	 sA/3NBf/NJPTLkK94I1Ecctprwhsk89aOfeji2GXK4qv2jLqB5Tvj4De4QyXJM6FpfdMQ
	 dBpNG3cihXIaMbGlwzm0sg1LE+GYh0cNA8qC6WaWUBTbJkEcuDvOdo8F8phKZ641OT7as
	 A0g+FopaPq6kFivo3FCAviO3h7/p3pnUrpA11S3QahXA2Q4WZnXMdavJ0x7uY4UZlG+BK
	 bxq5eYYKHfG6k/P30Xap8TYhU51L3am5cKmIO5cse62OMOq9qsAGAWd5MgO7ruM1MSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414412;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZWjueH6EuZn1xYNyYWbihZE5Mj/7NmXTCnPzzqgLWwc=;
	b=KFanEs6RyKbUBdokrk0TQd3ybbMQei50uxwfTP8hD54bpYyBVyirhB8Bs58WdsllX8xq
	 6CrFQwXaqvR4L3YnbzUl8TmVorCB7jZ15sACWfSH93E6O+AeuMhwgmtpuxx4h+ynn26l2
	 YNwdMjMoKS6thWaxhgy6QnGFKo1OJlCsLU6jN/ZsHAIt89nT4+8opAIa25EXmbM0WbT/M
	 iqNtzVLv0F8cd04KEFNYQdSbgelWfoZTRmy4WoRUn16PWnYuHUvX7uKT2L5XE/wnM6CRt
	 lV80xWyo58u2YkybAYSCVSJIZRKimQNs7Ze5ef21mlaETbcLpUIABKWmWf/qEr9AWpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BIuvXjRF;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC2606A31A;
	Mon, 23 Nov 2026 06:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BIuvXjRF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZW
	jueH6EuZn1xYNyYWbihZE5Mj/7NmXTCnPzzqgLWwc=; b=BIuvXjRFGdLp543amF
	vOMDs1eB+NGtRGH+U9R8UPTHd13hsp6O/6DnG+lvQshkKtUFyBu1suSp5D3r2DYI
	IH/1svFnpnmt15oeY3gb01pWgDYO4XWgF73jBisLBqtZYXvWjcWFJoBJK7WBmZjd
	C74xo4crjnnLlm3E2iCqvkEq8=
From: Alan Pluto <alanpluto@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe,
	W_Armin@gmx.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw GetDataByPackage interface
Date: Mon, 23 Nov 2026 14:11:20 +0800
Message-ID: <20261123061120.18740-1-alanpluto@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116040532.154928-1-alanpluto@163.com>
References: <20261116040532.154928-1-alanpluto@163.com>
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
X-CM-TRANSID:_____wD3n5Qd2QNrVlNJKQ--.51074S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFW8GFyfCw1xuFy8XF18Zrb_yoWDArW8pF
	s8Ca4rJrZ5Kr17Ga4xCF12vwnY9w48Zw15Wry7WF1jkF1Iyr95XF1FyFWvvrW7XrZrGw1F
	qayUKF45ur4DWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQ0edUUUUU=
X-CM-SenderInfo: hdod01poxw0qqrwthudrp/xtbC0R8ZDWsD2R-PHwAA3k

Lenovo's userspace utility uses the Other Mode WMI GetDataByPackage
method (99) to check device readiness. Expose the method through debugfs
so the firmware request and response can be inspected on Linux without
adding a stable userspace ABI.

The interface is disabled by default and can be enabled by passing
enable_get_data_by_package=1 when loading the module.

Signed-off-by: Alan Pluto <alanpluto@163.com>
---
Changes in v2:
- Replace the character device with a debugfs file, disabled by default.
- Allow one open per WMI device and require a single read for the response.
- Use scoped locks, lockdep checks, automatic buffer cleanup, and the
  WMI helper's minimum response size check.

 Documentation/wmi/devices/lenovo-wmi-other.rst |  12 +-
 drivers/platform/x86/lenovo/wmi-other.c        | 208 +++++++++++++++++++++++++
 2 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 011054d64eac5b601333373c4d405f9c5117ffc2..42e1525a8852bd7c8ddc04cc4047b1f09c5b770f 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -33,6 +33,15 @@ under the following path:
 
 Additionally, this driver also exports attributes to HWMON.
 
+GetDataByPackage diagnostics
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The driver does not create the diagnostic file by default. To enable it,
+pass ``enable_get_data_by_package=1`` when loading ``lenovo-wmi-other``.
+The file is at ``lenovo_wmi/<WMI device>/get_data_by_package``.
+Not all devices support the method. Use only commands whose behavior and
+side effects are understood.
+
 LENOVO_CAPABILITY_DATA_00
 -------------------------
 
@@ -107,7 +116,8 @@ WMI interface description
 =========================
 
 The WMI interface description can be decoded from the embedded binary MOF (bmof)
-data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility. This older
+example lists ``Max(40)`` for GetDataByPackage; newer firmware uses 100 bytes.
 
 ::
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669db684145298ae088dd2c7f539d29..827b4215c612fbfc052bbadff0672e68e65517f0 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -27,13 +27,16 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
 #include <linux/firmware_attributes.h>
+#include <linux/fs.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
@@ -41,9 +44,12 @@
 #include <linux/kobject.h>
 #include <linux/limits.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
+#include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/uaccess.h>
 #include <linux/wmi.h>
 
 #include <acpi/battery.h>
@@ -90,6 +96,8 @@ enum lwmi_feature_id_psu {
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
+#define LWMI_DATA_PACKAGE_GET 99
+#define LWMI_DATA_PACKAGE_INPUT_MAX 100
 
 #define LWMI_FAN_ID_BASE 1
 #define LWMI_FAN_NR 4
@@ -141,6 +149,8 @@ struct lwmi_om_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 	struct wmi_device *wdev;
+	struct dentry *debugfs_dir;
+	atomic_t package_opened;
 	int ida_id;
 
 	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
@@ -156,6 +166,23 @@ struct lwmi_om_priv {
 	bool bh_registered;
 };
 
+struct lwmi_package_response {
+	__le32 data_size;
+	u8 data[];
+};
+
+struct lwmi_package_file {
+	struct lwmi_om_priv *priv;
+	/* Protects the pending response on shared descriptors. */
+	struct mutex lock;
+	struct lwmi_package_response *response;
+	size_t response_len;
+};
+
+static bool enable_get_data_by_package;
+module_param(enable_get_data_by_package, bool, 0400);
+MODULE_PARM_DESC(enable_get_data_by_package, "Enable the GetDataByPackage debugfs interface");
+
 /*
  * Visibility of fan channels:
  *
@@ -1611,6 +1638,174 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 
 /* ======== Self (master: lenovo-wmi-other) ======== */
 
+static int lwmi_package_open(struct inode *inode, struct file *file)
+{
+	struct lwmi_om_priv *priv = inode->i_private;
+	struct lwmi_package_file *state __free(kfree) = NULL;
+
+	if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) != (FMODE_READ | FMODE_WRITE))
+		return -EINVAL;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return -ENOMEM;
+
+	if (atomic_cmpxchg(&priv->package_opened, 0, 1))
+		return -EBUSY;
+
+	mutex_init(&state->lock);
+	state->priv = priv;
+	file->private_data = no_free_ptr(state);
+
+	return stream_open(inode, file);
+}
+
+static int lwmi_package_release(struct inode *inode, struct file *file)
+{
+	struct lwmi_package_file *state = file->private_data;
+	struct dentry *dentry = file->f_path.dentry;
+
+	kfree_sensitive(state->response);
+	mutex_destroy(&state->lock);
+
+	/* Unlike read and write, release can run after debugfs removal. */
+	if (!debugfs_file_get(dentry)) {
+		atomic_set(&state->priv->package_opened, 0);
+		debugfs_file_put(dentry);
+	}
+
+	kfree(state);
+	return 0;
+}
+
+static int lwmi_package_invoke(struct lwmi_package_file *state, u8 *data)
+{
+	struct lwmi_om_priv *priv = state->priv;
+	struct wmi_buffer input = { .length = LWMI_DATA_PACKAGE_INPUT_MAX, .data = data };
+	struct wmi_buffer output;
+	u32 data_size;
+	int ret;
+
+	lockdep_assert_held(&state->lock);
+
+	/* The tested firmware needs two calls before its response is usable. */
+	ret = wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
+				   &input, &output, 0);
+	if (ret)
+		return ret;
+
+	kfree_sensitive(output.data);
+
+	ret = wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
+				   &input, &output, sizeof(struct lwmi_package_response));
+	if (ret)
+		return ret;
+
+	struct lwmi_package_response *response __free(kfree_sensitive) = output.data;
+
+	data_size = le32_to_cpu(response->data_size);
+	if (data_size > output.length - sizeof(*response))
+		return -EPROTO;
+
+	state->response_len = struct_size(response, data, data_size);
+	state->response = no_free_ptr(response);
+	return 0;
+}
+
+static ssize_t lwmi_package_write(struct file *file, const char __user *buffer,
+				  size_t count, loff_t *ppos)
+{
+	struct lwmi_package_file *state = file->private_data;
+	u8 input[LWMI_DATA_PACKAGE_INPUT_MAX] = {};
+	int ret;
+
+	if (!count || count > sizeof(input))
+		return -EINVAL;
+
+	ACQUIRE(mutex_try, state_guard)(&state->lock);
+	if (ACQUIRE_ERR(mutex_try, &state_guard) || state->response)
+		return -EBUSY;
+
+	if (copy_from_user(input, buffer, count))
+		return -EFAULT;
+
+	ret = lwmi_package_invoke(state, input);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t lwmi_package_read(struct file *file, char __user *buffer,
+				 size_t count, loff_t *ppos)
+{
+	struct lwmi_package_file *state = file->private_data;
+	size_t len;
+
+	if (!count)
+		return 0;
+
+	ACQUIRE(mutex_try, state_guard)(&state->lock);
+	if (ACQUIRE_ERR(mutex_try, &state_guard))
+		return -EBUSY;
+
+	if (!state->response)
+		return 0;
+
+	len = state->response_len;
+	if (len > count)
+		return -ENOSPC;
+
+	if (copy_to_user(buffer, state->response, len))
+		return -EFAULT;
+
+	kfree_sensitive(state->response);
+	state->response = NULL;
+	return len;
+}
+
+static const struct file_operations lwmi_package_fops = {
+	.owner = THIS_MODULE,
+	.open = lwmi_package_open,
+	.release = lwmi_package_release,
+	.read = lwmi_package_read,
+	.write = lwmi_package_write,
+};
+
+static void lwmi_package_debugfs_remove(void *data)
+{
+	debugfs_remove_recursive(data);
+}
+
+static int devm_lwmi_package_debugfs_add(struct lwmi_om_priv *priv)
+{
+	struct device *dev = &priv->wdev->dev;
+	struct dentry *dir, *entry;
+	int ret;
+
+	if (!wmidev_instance_count(priv->wdev))
+		return 0;
+
+	dir = lwmi_debugfs_create_dir(priv->wdev);
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
+
+	atomic_set(&priv->package_opened, 0);
+
+	ret = devm_add_action_or_reset(dev, lwmi_package_debugfs_remove, dir);
+	if (ret)
+		return ret;
+
+	entry = debugfs_create_file("get_data_by_package", 0600, dir, priv, &lwmi_package_fops);
+	if (IS_ERR(entry)) {
+		devm_release_action(dev, lwmi_package_debugfs_remove, dir);
+		return PTR_ERR(entry);
+	}
+
+	priv->debugfs_dir = dir;
+	return 0;
+}
+
 /**
  * lwmi_om_master_bind() - Bind all components of the other mode driver
  * @dev: The lenovo-wmi-other driver basic device.
@@ -1693,6 +1888,7 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 {
 	struct component_match *master_match = NULL;
 	struct lwmi_om_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc_obj(&wdev->dev, *priv);
 	if (!priv)
@@ -1708,12 +1904,24 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(master_match))
 		return PTR_ERR(master_match);
 
+	if (enable_get_data_by_package) {
+		ret = devm_lwmi_package_debugfs_add(priv);
+		if (ret)
+			dev_warn(&wdev->dev, "failed to create GetDataByPackage debugfs files: %d\n",
+				 ret);
+	}
+
 	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
 					       master_match);
 }
 
 static void lwmi_other_remove(struct wmi_device *wdev)
 {
+	struct lwmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	if (priv->debugfs_dir)
+		devm_release_action(&wdev->dev, lwmi_package_debugfs_remove, priv->debugfs_dir);
+
 	component_master_del(&wdev->dev, &lwmi_om_master_ops);
 }
 

