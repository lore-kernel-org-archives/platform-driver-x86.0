Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955A327C18
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994678; cv=none; b=ObF3OKuzSWxFoQlLr2WfMUZrQsTf1AiiqtvkWCExq/nv4fhlX8XLtaSQht4WLoHApCUwY9+S7lytw3IZuUh696uemCTBbu20k1QtGheDqgYinZxorcX0t87f9VmYskNl8tsxEx8c5LADXp9jkYUPFyUAOUcn9fkL8OFMUrGTqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994678; c=relaxed/simple;
	bh=MozaHNqyET9pV+QZs77p40YJfm2Dm3mE7Nd9L6TYFsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HFm/Fuk3DM8dnS6uQN9oxR1xT6YOWvedLPD84Kj4HWMo2wj9myeZA9BmYWeoWEb2oOmWEFDvb75IvotIw05jMNKX+bHpnNlQQdXg/Z7qj8Ux5VOF3JoyZlgcM57Z9EdUVncB3It8tROOBcJuOXrhOsZVtz3HZw9vdf1NP0n99nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsliY4B9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsliY4B9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so7986588f8f.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994675; x=1780599475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U6RwPcdJ3zNVONjocSGA28jC9qcgfm+AFsG+1ypMnpU=;
        b=bsliY4B9hXMyZPKAXZ/Zw6QDQ8Ox6JPKBlfd0p93jXbX76lpzmRIBrW2IBSLweNtiM
         65MgXi0KRt5/Khybi5b5vAZn4/feBVhVxwoos1XCpKUVhYVL6DQjsKCpUicRDzCuxSu2
         JPUYFGznGt7fEbqKhhvvqM7kFxQnIL5mXWLtw3e3F5fFQZU/1QbATuQVCYZlrixyYkqG
         uGRjddAbkGMBluMboZmH5/3dktpATFd6bOkZF/U8GXmEeJfjQkVJl45/lvMk/lNxL0wT
         80Bzjdzgl3yi+/Hvh+db3jrHLg/qFyxVNXErtC1FL3PRkw53QPJ7lAGrwpoiUB00Pxha
         Rl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994675; x=1780599475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6RwPcdJ3zNVONjocSGA28jC9qcgfm+AFsG+1ypMnpU=;
        b=UVKGww9w0ijguW5lXaafugnNU+CnZa+339uK3op6O++IKp7AY5M96rlHtNF6qrc1/a
         lbPQbgbfMmdf+Yw+qmnt4XDgZ9NrvDQTUjfbbUlf3Jw1w5CUXTY+GtukjjarMHY/2mT/
         T6k6y9Mx9PCBffVT5OBKMBQvqRY6Ehbzt6sTXXSg2/MBDOo5qLMOM4t413VC92NMdVlO
         w4GRu8BJUiiGbFWVYvYTN2TiJEcP6jnOecx3OOI+OPRvbUB91sQ9hRwQSJ00ywETmGYX
         rT/DmNKU8jWnSO8cs3hmbBbHCNE824MYJIbb1PNhyBo9mgykI34KDAyS7WXYyIu4tDbL
         PsfA==
X-Gm-Message-State: AOJu0Yxm+ru/okmzKTFrVGunpbCZaRDLipIk9AIFhPMHCdMM445rw8b+
	Jt1ik4R1/dkAAnBruRTygNyXjpP2nCayRoDxfXTZUTbNsEaeNZz3jGStpAprOvESuJc=
X-Gm-Gg: Acq92OEuzLUvNBSGpAbMQ5LLS0fFjGwgvpDMPs1VFtDf29MjvUS2VPE7fBgWqjXJXjm
	9lLjw5uGQu9RJklo77cXv71JLmYR6yPDJizT8GnskXtaojj8QVeZFz1ml2l/g4yoLaKnokQ6VSm
	jOs31GY9xfDaVRcrguJhfj4t1/CxxHqMygfdMD+a+bcVUERQZPAb4oQokkREunydylvdh1LJxoQ
	F9Mrnz5+GTilTiPIG0blpIJNLFcpDUOnwDoJ9K7kD9mLpoWoXl0Ef26yDiHbbinUXr2ivTRC8Lb
	AB9FuaXUeA4ayv8dg1UfXWwhhJT1L2z+UhgVFhSIbwtodkf+IpXgzcLXk8eGtBqlKNUS3H0yf9j
	v2ajvGin+nLJQKi99SHvWK5JtMzrtrQO+NRX+oNYctlBLNLkr3P8ABg1eOY0LaeK5A78CSYG8Jq
	QKGHD72D+R+oy4+ti+EcZU4rzUgBM3Db+vltOSLQXkMGkTUnnyiqOKI7vB+D10E/sPakPO+hytA
	6+PDham
X-Received: by 2002:adf:f1cd:0:b0:45a:c97a:905e with SMTP id ffacd0b85a97d-45ef028c943mr515703f8f.1.1779994675355;
        Thu, 28 May 2026 11:57:55 -0700 (PDT)
Received: from shiro (79.191.45.28.ipv4.supernova.orange.pl. [79.191.45.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a281dsm14737314f8f.24.2026.05.28.11.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:57:54 -0700 (PDT)
From: =?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
Subject: [PATCH v2] platform/x86: asus-wmi: add keystone dongle support
Date: Thu, 28 May 2026 20:57:52 +0200
Message-ID: <20260528185752.81563-1-dariuszfigzal@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS Keystone is a physical NFC-like dongle that slots into supported
ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.

Expose the current insert state via a sysfs attribute by querying WMI
device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
feature presence, and STATUS_BIT is never set. Presence of a keystone slot
is detected by a successful DSTS call.

Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
---

Changes in v2:
- Use .is_visible and platform_attributes[] instead of
  device_create_file/device_remove_file (Ilpo Järvinen)

 drivers/platform/x86/asus-wmi.c            | 65 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  7 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412b90..3c9ef826551d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_KEYSTONE			0xb4
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -279,6 +280,8 @@ struct asus_wmi {
 	u32 tablet_switch_dev_id;
 	bool tablet_switch_inverted;
 
+	bool keystone_available;
+
 	enum fan_type fan_type;
 	enum fan_type gpu_fan_type;
 	enum fan_type mid_fan_type;
@@ -646,6 +649,55 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/* Keystone *******************************************************************/
+
+static int keystone_check_present(struct asus_wmi *asus)
+{
+	u32 retval;
+	int err;
+
+	asus->keystone_available = false;
+
+	/*
+	 * Use a raw devstate call rather than asus_wmi_dev_is_present().
+	 * For this devid, PRESENCE_BIT encodes current insert state, not
+	 * feature presence, so asus_wmi_dev_is_present() would return false
+	 * whenever the dongle is absent at boot, even on machines that have
+	 * a keystone slot.
+	 * -ENODEV means the firmware doesn't know this devid at all.
+	 * retval is not examined here, only the return code matters.
+	 */
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
+	if (err == -ENODEV)
+		return 0;
+	if (err)
+		return err;
+
+	asus->keystone_available = true;
+	return 0;
+}
+
+static ssize_t keystone_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	u32 retval;
+	int err;
+
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_BIT));
+}
+
+static DEVICE_ATTR_RO(keystone);
+
+static void asus_wmi_keystone_notify(struct asus_wmi *asus)
+{
+	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
+}
+
 /* Input **********************************************************************/
 static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
 {
@@ -4575,6 +4627,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (code == NOTIFY_KEYSTONE) {
+		if (asus->keystone_available)
+			asus_wmi_keystone_notify(asus);
+		return;
+	}
+
 	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
 		if (asus->fan_boost_mode_available)
 			fan_boost_mode_switch_next(asus);
@@ -4698,6 +4756,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_lid_resume.attr,
 	&dev_attr_als_enable.attr,
 	&dev_attr_fan_boost_mode.attr,
+	&dev_attr_keystone.attr,
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 		&dev_attr_charge_mode.attr,
 		&dev_attr_egpu_enable.attr,
@@ -4741,6 +4800,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_ALS_ENABLE;
 	else if (attr == &dev_attr_fan_boost_mode.attr)
 		ok = asus->fan_boost_mode_available;
+	else if (attr == &dev_attr_keystone.attr)
+		ok = asus->keystone_available;
 
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 	if (attr == &dev_attr_charge_mode.attr)
@@ -5081,6 +5142,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform_profile_setup;
 
+	err = keystone_check_present(asus);
+	if (err)
+		dev_warn(&pdev->dev, "Failed to check Keystone presence: %d\n", err);
+
 	err = asus_wmi_sysfs_init(asus->platform_device);
 	if (err)
 		goto fail_sysfs;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 554f41b827e1..c29962d5baac 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -147,6 +147,13 @@
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
 
+/* Keystone dongle insert/remove state.
+ * PRESENCE_BIT (0x00010000) encodes insert state:
+ * 0x00010000 = inserted, 0x00000000 = absent. STATUS_BIT is never set.
+ * 0xFFFFFFFE means no keystone slot on this machine.
+ */
+#define ASUS_WMI_DEVID_KEYSTONE		0x00120091
+
 /* TUF laptop RGB modes/colours */
 #define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
 #define ASUS_WMI_DEVID_TUF_RGB_MODE2	0x0010005A
-- 
2.54.0

