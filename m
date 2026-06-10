Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836275477E
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110189; cv=none; b=fZ8S7nlxfqtLMVNkn5YxDAJ6NOCasgBo0QncchaDloqagMDvDIYocSQMJYqOgpg6QGRYnUgDUG0X9jXafsGdt2nStrK/JFf/FAoMwyJHcSHcwtSNNQHIKhLpuxWWua7x0UD3YFUk2vHyvfXyycWyHHJuiC7TG27v7NqWnRkF350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110189; c=relaxed/simple;
	bh=I+SUe0goqJpNsl5qVR6bEQJ6+tkuts0BtbgHdPfXf9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hZhi9MDBrh22IkFS5KVSm7illTMbTU2m+oNGecZsXLYZv1rhA3bn/GLcKQMG86imF/atRMu6hlicy/6FOJrdgyz1A2Dw2KCBgPjrZOmg7aylWZjQySZPN9botJ5lDcWJhwxHQ1qeacjgdhqsEFBXp7MjchepuSp4GjszIWAVmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrQaeKaG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrQaeKaG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso81177945e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110186; x=1781714986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FkXmnCzF3e6ZXKR1eFQBaZLZRi1UB66/X/ti0NbFPk=;
        b=SrQaeKaGjCRId8/fCiG4Y3dROwRna4mNXDcKop+5zvRByXc5S540zN6vFCZUCKEfd1
         KzZJi0NbzyIk3Xo5cBB74UYT4BXa6sFkkp/a6kbEuZVpoRtwpVbdhBq6H0WzQ8Z7emp1
         pfI/1fhse3nqsxBK9MDXN2rjuK/tWS7pQZHkSwPi59mt/piRpybbo8qRgQF6TjWC9rEV
         P73YXmhOdGOFwVX1RFHNX+Jlobp6uDDmUiMncPPzdPn85w6siVfIqNRGo4a1VDpMXYwN
         ekearm1jvQ0K8qpU43KPyASMOUn6dS6kYBQBEOQEKns2VFnQFP+HTQKZ1Ys2QVaH1Ick
         OPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110186; x=1781714986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FkXmnCzF3e6ZXKR1eFQBaZLZRi1UB66/X/ti0NbFPk=;
        b=VKkgY2lz7wZNyCnQLesEq4wpPggbV36+ZVnrxT569MRvqY27LY9YC4SNib1h3O95Tw
         yrxGBsAO+x2FSStX5h1KlkeaBqPMfb5BaPcnjTgsnZ1ldd8jYth/zRXYNTJJytLplZWL
         /8dGAcH6UVBreFg5BPJnYpM35Kfh60NnDn9dGnDM5l1fD532jQITkx0txEvixzrC3bE1
         yKOkBiEgfOfRwq6jiBXfyHZzoFg94wqKttYQf9cWXPzgBT7xCRhtOlhb3xxBdEuBwI7B
         /1sB1q3QCxmDYXNpBq89Eb29TzbLpd4jgsCuKTxtoGDKIssZ3fXK/jCmthFATlCnqsV7
         qAGw==
X-Gm-Message-State: AOJu0Yx8XgUdL6vhh7L5h+3E0AI6NcrV9I1GQ6Ib5LTEF+zu+dZAX+M7
	EZAgyW9QAbt1QIrahqokERTHJtES+Oo6u/me9LSwOJUIL3XdA9c3SMWZH/0tYpSD
X-Gm-Gg: Acq92OF53TZzNRQT8mKLo4pcxMswNtmdW89Jv7VXEtVHdJoLkbVoshY4Ygmj3JwVZtV
	XVq5gZpO72+ErjhZIS+L9i3yJ+dbt3pvazW2gNfv/ctlDv+M2UnzCGfnMM0nzHQ+Z7T79CKMAQX
	SldwoVvdAtP6jYpGSXXTBfouMECn1at8hgIi+XYokGBGBFL/LwbXyBdv7FDrW1+IduivE4KkAHA
	3Hdjz88iOqY4AxEbtGqKtcHqQyzdcLFJSJmGtic5EC2dftdxUhs4HJUxDFPnHgdKTl9OjNg/zAl
	8kJdKqkcpcFsD+8oc2oSdX8mzjsZH+wWF++Wlfu6/qhtQQgAMpTD3GTRrHXSADxeQpPz/OWmy6z
	JItzXp/xAaG88GHVIf+CrG0SkLEKfhRpA5VqYo7FrwKJgwT7pUi2dxkFmGLHv4ubA3MqN/8Y8HG
	ucOlEDZ90cKijiU2JtnosR0pWBMpMtNTBuJqcRkfWOUnOExMYeU/D3TVpdqlQcaDUT
X-Received: by 2002:a05:600c:81c9:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-490c259f5c9mr374036645e9.11.1781110185786;
        Wed, 10 Jun 2026 09:49:45 -0700 (PDT)
Received: from shiro (83.6.47.15.ipv4.supernova.orange.pl. [83.6.47.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm74673553f8f.3.2026.06.10.09.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:49:45 -0700 (PDT)
From: =?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
Subject: [PATCH v3] platform/x86: asus-wmi: add keystone dongle support
Date: Wed, 10 Jun 2026 18:49:42 +0200
Message-ID: <20260610164942.74956-1-dariuszfigzal@gmail.com>
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

Reviewed-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
---

Changes in v2:
- Use .is_visible and platform_attributes[] instead of
  device_create_file/device_remove_file (Ilpo Järvinen)

Changes in v3:
- Add interface documentation (Ilpo Järvinen)

 .../ABI/testing/sysfs-platform-asus-wmi       |  9 +++
 drivers/platform/x86/asus-wmi.c               | 65 +++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h    |  7 ++
 3 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 89acb6638df8..f9825c6150b5 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -58,6 +58,15 @@ Description:
 			* 1 - overboost,
 			* 2 - silent
 
+What:		/sys/devices/platform/<platform>/keystone
+Date:		Jun 2026
+KernelVersion:	7.2
+Contact:	"Dariusz Figzał" <dariuszfigzal@gmail.com>
+Description:
+		Reports the Keystone dongle insert state (read-only):
+			* 0 - not inserted
+			* 1 - inserted
+
 What:		/sys/devices/platform/<platform>/gpu_mux_mode
 Date:		Aug 2022
 KernelVersion:	6.1
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

