Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70569258EE0
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103546; cv=none; b=lGCAw3K57DrajKGrMA4zAeTn0QpFABlAt8Rz/qewIeTqG3RscGw2IUY+WTimXLGd5xHxSaRZfjzNlWvUeOS2NjEX6h36126UvYaORhB0+IcL532Vth1ojpxrEO++h7zxwG+mp/bUc+xLBPrqh32ipGcYCxGqyraJrWOStwScEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103546; c=relaxed/simple;
	bh=RiZhKucf3F+DsNI2mszSGbA1hu+8a1JLJs/ZxQ0gk5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruUi7y68+ywjfhvYcOZSBimoUW4CgMD0HMDQhf9F5EKBTYJZwcXUyI1+2FNrRgWk/+MAj4PkTEc/si5INlkWxbMbZEyQ9JJdVkTGYkcuOk7IPaM2pCRbMrz77bTjlwF3FPtYXvTl1eC7TGLl1vWpw8m4TLtG8Ptip9E4ZH4bAz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZNyJJxXN; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZNyJJxXN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767103542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7sRmowjLuZIJbDoNtsHQv6Gn9R/Ua9RMMCA5RMWpEc=;
	b=ZNyJJxXNDqqy8qr5zSH/9tK7ByCLHpjCtRM2nc2vprQaib3l9GPyLfXBwN41b5ixPhgnX+
	1cz3n4bpt2UhUCV+DYBwpQ9Rnm/S+8zGI0HugoayydIgA/qHLWjMvyElU6ZoUozjmc7EQC
	UK2LO+CTWJloAd/zE5hrifbQzrMe84M=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	=?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 3/3] platform/x86: asus-armoury: add keyboard control firmware attributes
Date: Tue, 30 Dec 2025 15:05:25 +0100
Message-ID: <20251230140525.42017-4-denis.benato@linux.dev>
In-Reply-To: <20251230140525.42017-1-denis.benato@linux.dev>
References: <20251230140525.42017-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Implement keyboard status firmware attributes in asus-armoury after
deprecating those attribute(s) in asus-wmi to avoid losing the ability
to control LEDs status.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
Tested-by: Merthan Karakaş <m3rthn.k@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        | 252 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  17 ++
 2 files changed, 269 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 9c1a9ad42bc4..5bd1abfa2d73 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -76,10 +76,22 @@ struct rog_tunables {
 	u32 nv_tgp;
 };
 
+struct asus_armoury_kbd_status {
+	bool boot;
+	bool awake;
+	bool sleep;
+	bool shutdown;
+};
+
 struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 
+	struct mutex keyboard_mutex;
+
+	/* Current TUF keyboard RGB state tracking */
+	struct asus_armoury_kbd_status *kbd_state;
+
 	/*
 	 * Mutex to protect eGPU activation/deactivation
 	 * sequences and dGPU connection status:
@@ -97,6 +109,7 @@ struct asus_armoury_priv {
 
 static struct asus_armoury_priv asus_armoury = {
 	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
+	.keyboard_mutex = __MUTEX_INITIALIZER(asus_armoury.keyboard_mutex),
 };
 
 struct fw_attrs_group {
@@ -433,6 +446,163 @@ static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
 }
 ASUS_ATTR_GROUP_ENUM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
 
+/* Keyboard power management **************************************************/
+
+static int armoury_kbd_state(struct kobj_attribute *attr,
+			     const struct asus_armoury_kbd_status *status)
+{
+	const u32 kbd_state = ASUS_WMI_DEVID_TUF_RGB_STATE_EN | ASUS_WMI_DEVID_TUF_RGB_STATE_CMD |
+			      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_BOOT, status->boot ? 1 : 0) |
+			      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_AWAKE, status->awake ? 1 : 0) |
+			      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SLEEP, status->sleep ? 1 : 0) |
+			      FIELD_PREP(ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SHUTDOWN, status->shutdown ? 1 : 0);
+
+	return armoury_set_devstate(attr, kbd_state, NULL, ASUS_WMI_DEVID_TUF_RGB_STATE);
+}
+
+enum asus_armoury_kbd_state_field {
+	ASUS_ARMOURY_KBD_STATE_BOOT,
+	ASUS_ARMOURY_KBD_STATE_AWAKE,
+	ASUS_ARMOURY_KBD_STATE_SLEEP,
+	ASUS_ARMOURY_KBD_STATE_SHUTDOWN,
+};
+
+static ssize_t armoury_kbd_state_write(struct kobject *kobj, struct kobj_attribute *attr,
+				       const char *buf, size_t count,
+				       enum asus_armoury_kbd_state_field field)
+{
+	ssize_t err;
+	bool enable;
+	struct asus_armoury_kbd_status kbd_status;
+
+	err = kstrtobool(buf, &enable);
+	if (err)
+		return err;
+
+	scoped_guard(mutex, &asus_armoury.keyboard_mutex) {
+		memcpy(&kbd_status, asus_armoury.kbd_state, sizeof(kbd_status));
+
+		switch (field) {
+		case ASUS_ARMOURY_KBD_STATE_BOOT:
+			kbd_status.boot = enable;
+			break;
+		case ASUS_ARMOURY_KBD_STATE_AWAKE:
+			kbd_status.awake = enable;
+			break;
+		case ASUS_ARMOURY_KBD_STATE_SLEEP:
+			kbd_status.sleep = enable;
+			break;
+		case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
+			kbd_status.shutdown = enable;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		err = armoury_kbd_state(attr, &kbd_status);
+		if (err)
+			return err;
+
+		memcpy(asus_armoury.kbd_state, &kbd_status, sizeof(kbd_status));
+	}
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+
+static ssize_t armoury_kbd_state_read(struct kobject *kobj, struct kobj_attribute *attr,
+				      char *buf, enum asus_armoury_kbd_state_field field)
+{
+	bool *field_ptr, field_enabled;
+
+	switch (field) {
+	case ASUS_ARMOURY_KBD_STATE_AWAKE:
+		field_ptr = &asus_armoury.kbd_state->awake;
+		break;
+	case ASUS_ARMOURY_KBD_STATE_SLEEP:
+		field_ptr = &asus_armoury.kbd_state->sleep;
+		break;
+	case ASUS_ARMOURY_KBD_STATE_BOOT:
+		field_ptr = &asus_armoury.kbd_state->boot;
+		break;
+	case ASUS_ARMOURY_KBD_STATE_SHUTDOWN:
+		field_ptr = &asus_armoury.kbd_state->shutdown;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &asus_armoury.keyboard_mutex)
+		field_enabled = *field_ptr;
+
+	return sysfs_emit(buf, field_enabled ? "1\n" : "0\n");
+}
+
+static ssize_t kbd_leds_sleep_current_value_store(struct kobject *kobj,
+						  struct kobj_attribute *attr,
+						  const char *buf, size_t count)
+{
+	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_SLEEP);
+}
+
+static ssize_t kbd_leds_sleep_current_value_show(struct kobject *kobj,
+						 struct kobj_attribute *attr, char *buf)
+{
+	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_SLEEP);
+}
+
+ASUS_ATTR_GROUP_BOOL(kbd_leds_sleep, "kbd_leds_sleep",
+		     "Keyboard backlight while system is sleeping");
+
+static ssize_t kbd_leds_boot_current_value_store(struct kobject *kobj,
+						 struct kobj_attribute *attr,
+						 const char *buf, size_t count)
+{
+	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_BOOT);
+}
+
+static ssize_t kbd_leds_boot_current_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_BOOT);
+}
+
+ASUS_ATTR_GROUP_BOOL(kbd_leds_boot, "kbd_leds_boot",
+		     "Keyboard backlight while system is booting");
+
+static ssize_t kbd_leds_awake_current_value_store(struct kobject *kobj,
+						  struct kobj_attribute *attr,
+						  const char *buf, size_t count)
+{
+	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_AWAKE);
+}
+
+static ssize_t kbd_leds_awake_current_value_show(struct kobject *kobj,
+						 struct kobj_attribute *attr, char *buf)
+{
+	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_AWAKE);
+}
+
+ASUS_ATTR_GROUP_BOOL(kbd_leds_awake, "kbd_leds_awake",
+		     "Keyboard backlight while system is awake");
+
+static ssize_t kbd_leds_shutdown_current_value_store(struct kobject *kobj,
+						     struct kobj_attribute *attr,
+						     const char *buf, size_t count)
+{
+	return armoury_kbd_state_write(kobj, attr, buf, count, ASUS_ARMOURY_KBD_STATE_SHUTDOWN);
+}
+
+static ssize_t kbd_leds_shutdown_current_value_show(struct kobject *kobj,
+						    struct kobj_attribute *attr, char *buf)
+{
+	return armoury_kbd_state_read(kobj, attr, buf, ASUS_ARMOURY_KBD_STATE_SHUTDOWN);
+}
+
+ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
+		     "Keyboard backlight while system is shutdown");
+
 static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
 						struct kobj_attribute *attr,
 						const char *buf, size_t count)
@@ -867,6 +1037,32 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
 	return limit_value > 0;
 }
 
+static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
+{
+	int err;
+	u32 kbd_status;
+
+	err = armoury_get_devstate(NULL, &kbd_status, ASUS_WMI_DEVID_TUF_RGB_STATE);
+	if (err) {
+		pr_debug("ACPI does not support keyboard power control: %d\n", err);
+		return ERR_PTR(-ENODEV);
+	}
+
+	struct asus_armoury_kbd_status *kbd_state __free(kfree) =
+		kzalloc(sizeof(*kbd_state), GFP_KERNEL);
+	if (!kbd_state)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * By default leds are off for all states (to spare power)
+	 * except for when laptop is awake, where leds color and
+	 * brightness are controllable by userspace.
+	 */
+	kbd_state->awake = true;
+
+	return_ptr(kbd_state);
+}
+
 static int asus_fw_attr_add(void)
 {
 	const struct rog_tunables *const ac_rog_tunables =
@@ -955,8 +1151,64 @@ static int asus_fw_attr_add(void)
 		}
 	}
 
+	asus_armoury.kbd_state = NULL;
+	if (armoury_has_devstate(ASUS_WMI_DEVID_TUF_RGB_STATE)) {
+		asus_armoury.kbd_state = asus_init_kbd_state();
+		if (IS_ERR(asus_armoury.kbd_state)) {
+			asus_armoury.kbd_state = NULL;
+			err = PTR_ERR(asus_armoury.kbd_state);
+			pr_err("Failed to get keyboard status: %d\n", err);
+			goto err_remove_groups;
+		}
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_sleep_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for keyboard backlight sleep state: %d\n", err);
+			goto err_kbd_state;
+		}
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_boot_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for keyboard backlight boot state: %d\n", err);
+			goto err_remove_kbd_sleep_attr;
+		}
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_awake_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for keyboard backlight awake state: %d\n", err);
+			goto err_remove_kbd_boot_attr;
+		}
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_shutdown_attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for keyboard backlight shutdown state: %d\n", err);
+			goto err_remove_kbd_awake_attr;
+		}
+
+		/*
+		 * The attribute is write-only and for the state to be coherent
+		 * a default state has to written: userspace is expected to
+		 * modify it based on user preference.
+		 */
+		err = armoury_kbd_state(&attr_kbd_leds_awake_current_value, asus_armoury.kbd_state);
+		if (err) {
+			pr_err("Failed to initialize keyboard backlight states: %d\n", err);
+			goto err_remove_kbd_shutdown_attr;
+		}
+	}
+
 	return 0;
 
+err_remove_kbd_shutdown_attr:
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_shutdown_attr_group);
+err_remove_kbd_awake_attr:
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_awake_attr_group);
+err_remove_kbd_boot_attr:
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_boot_attr_group);
+err_remove_kbd_sleep_attr:
+	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &kbd_leds_sleep_attr_group);
+err_kbd_state:
+	kfree(asus_armoury.kbd_state);
 err_remove_groups:
 	while (i--) {
 		if (armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 419491d4abca..1373d5056ed0 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -153,6 +153,23 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
 
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_EN 0xBD
+
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_CMD (BIT(2) << 8)
+
+/*
+ * Flags for TUF RGB state to be used with ASUS_WMI_DEVID_TUF_RGB_STATE:
+ * flags | ASUS_WMI_DEVID_TUF_RGB_STATE_CMD | ASUS_WMI_DEVID_TUF_RGB_STATE_EN
+ *
+ * where ASUS_WMI_DEVID_TUF_RGB_STATE_EN is required for the method call
+ * to not be discarded, ASUS_WMI_DEVID_TUF_RGB_STATE_EN specifies this is
+ * a command and flags is a combination of one or more of the following flags.
+ */
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_BOOT		GENMASK(17, 17)
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_AWAKE		GENMASK(19, 19)
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SLEEP		GENMASK(21, 21)
+#define ASUS_WMI_DEVID_TUF_RGB_STATE_MASK_SHUTDOWN	GENMASK(23, 23)
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 
-- 
2.52.0

