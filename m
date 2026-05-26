Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348734F492
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779831918; cv=none; b=YVTLqBfxtk5zQbwWsi/0NVnmks3r/sP6mfBwqA/kZh31uElHxOFmjNk2lKP1rqgMUEB7qv5ue3176Nf2wAjR7cobbLXCU/3uVi7DtDoHErzcn2Qej7O5XBMqEjfXKWxvd3ASJt0nAWqXQDqSxkpnHWVHxfjMeaYUftrfGyCETXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779831918; c=relaxed/simple;
	bh=zATfa1rbHrlVnG5dOUsmtrQQCN0dtUgSHK+vSITKnR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RGppmbGk4s3rk1dO8t0MBR7vWL9UTJ8PP4ACBCMKQf3zrUMQoOPCj9MCnqtwt566o4SEbEAI2DVH2ph1raqbakuYvgmln3LqoJukNZcB0wPd2rYIS9xotXMKARBD+DuPSq+zh/mGBfHCSi1PzyOJD0Yo7NYuBMpL7DFt4CkkUmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Tec4ZL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Tec4ZL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48d146705b4so116940195e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779831915; x=1780436715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcCRAWkFYQNapDu/EJtVwj7lasodmrVBt/SVzCwAIkE=;
        b=i/Tec4ZLhas7+GgHjqQAd+1CPjhTIeWFFilgiU6r2IMSKwPEQ32CjvY5fiuNLAzAVy
         DpsyTFPDLgCr312JdhRyEEtr7J7QsVXNcK4Lbu2HzbVo4LAruMmldjXeIzKflM/JCcdT
         yZztpA+xnM2IGL5i4tZY0DqLRc4wIHpvxC5h9o/L/JiSsPWW2gh4lrnYQlMfZgPZ4A9+
         pRU6zJNeW7EE1R/MGhtkPvERLJ/+eKFwhO8YalATZ4wlb+DasIPj4WJoeajqMjYROAoC
         6Yhxq4/j9LtXDeb16gJ6FncK03qtsLJ9bVLaDgFSgbCYiAmFdaK9tw0H/njJIj2eT7uK
         cU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779831915; x=1780436715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcCRAWkFYQNapDu/EJtVwj7lasodmrVBt/SVzCwAIkE=;
        b=FDm0Pvualhvzkqa01NyC7J7V667JNQ9NADZ40ZpPSr7oD8YtWeZ2i5uYKZSMf4FZ6m
         8l1gUOs0FA5mG828BOkHL4XAhHzKPie2LiLv4mwMVSNTihABslit4z9wDUmZTlcA09Tr
         3Xef99xHOLvJFgWEgnuWfF9M0EHZaXS+/CrZweE7avqGVSQqVqUh/UU5Uj+ejwoml4Qp
         AGE6RLUsgmZgo/XhK/WQkjNiZeIcJzi2xFjYM+fwJZEqXYa0q18oRdBiBAZUH0KSoiIx
         u4GDUrkqv9Xaz/eHGX1rFzw/iQtnQ/L9eZdY8sHGv6VcUh1ol4BSaNZDpP442R5+odzS
         FSig==
X-Gm-Message-State: AOJu0Yzxz2PclyC2BRaZMJwO6cjRijrj1f7q2djO2Vz3rAGF5gz6UvIy
	bX42u4cCH3bJqx620+zJ/JS0JqFzBcBISS35a8cnYRuvAUf8hGf9I5gg8s2C43Nq
X-Gm-Gg: Acq92OF2hg5lTVpI0uqDRpPxivKfPmI3sDqv0HnH4XMldn7AEt+OiMkazdiZINlwyuk
	S13ktiURooCLH+acmmUHXrAkuN8EI9GgyXAv3NsUZ6EMXKlaXHEkJ8CxAncRLCTyMh6lyd69bUY
	hHGQxiQcjxJbJJDt7EpiZDYzIELnjgL9S0rx2U8Hj/IBm+7kOb6Q0Hnc2FzRSvxqSV9UEp1ziuw
	RwjsRoj624Z4le3FQkjt6wxEjRHlxTBIKZJ6gWiviNryFhQszvZ+KpFpUE1G1ROL5sPG+n7fe7Q
	K1MW4M2mPBQHH5KQ39SaDrNDBqnRt+HqTkZCvXt2rKvHuwPv3B0A8u2Hr1Vw2U85Rj+GUpVVXzz
	uVBIzThSetnfJaAUJT46+bqqE5u4YvgW6++M1hOD8K8xmpuD3hDaATdoOPT/Rq38O+A4dN5iauo
	bRaL4MEoLxhxZRVdC/WQdv3vh6c9OM+wum1SvMajov9rSEywyVnejoGP2Kjjbhe0qOoN2XVQ==
X-Received: by 2002:a05:600c:a213:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-490424ada3bmr221028465e9.12.1779831915273;
        Tue, 26 May 2026 14:45:15 -0700 (PDT)
Received: from shiro (79.191.45.28.ipv4.supernova.orange.pl. [79.191.45.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2908sm1085607f8f.18.2026.05.26.14.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 14:45:14 -0700 (PDT)
From: =?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dariusz=20Figza=C5=82?= <dariuszfigzal@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: add keystone dongle support
Date: Tue, 26 May 2026 23:44:39 +0200
Message-ID: <20260526214439.70142-1-dariuszfigzal@gmail.com>
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
is detected by a successful DSTS call (any result other than -ENODEV).

Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  7 ++
 2 files changed, 82 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412b90..a3fa3921aef3 100644
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
 
+	bool keystone_detected;
+
 	enum fan_type fan_type;
 	enum fan_type gpu_fan_type;
 	enum fan_type mid_fan_type;
@@ -646,6 +649,66 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/* Keystone *******************************************************************/
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
+static int asus_wmi_keystone_init(struct asus_wmi *asus)
+{
+	u32 retval;
+	int err;
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
+	err = device_create_file(&asus->platform_device->dev, &dev_attr_keystone);
+	if (err)
+		return err;
+
+	asus->keystone_detected = true;
+	return 0;
+}
+
+static void asus_wmi_keystone_exit(struct asus_wmi *asus)
+{
+	if (!asus->keystone_detected)
+		return;
+
+	device_remove_file(&asus->platform_device->dev, &dev_attr_keystone);
+	asus->keystone_detected = false;
+}
+
 /* Input **********************************************************************/
 static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
 {
@@ -4575,6 +4638,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	if (code == NOTIFY_KEYSTONE) {
+		if (asus->keystone_detected)
+			asus_wmi_keystone_notify(asus);
+		return;
+	}
+
 	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
 		if (asus->fan_boost_mode_available)
 			fan_boost_mode_switch_next(asus);
@@ -5085,6 +5154,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_sysfs;
 
+	err = asus_wmi_keystone_init(asus);
+	if (err)
+		dev_warn(&pdev->dev, "Keystone initialization failed: %d\n", err);
+
 	err = asus_wmi_input_init(asus);
 	if (err)
 		goto fail_input;
@@ -5170,6 +5243,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 fail_hwmon:
 	asus_wmi_input_exit(asus);
 fail_input:
+	asus_wmi_keystone_exit(asus);
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
 fail_custom_fan_curve:
@@ -5191,6 +5265,7 @@ static void asus_wmi_remove(struct platform_device *device)
 	asus_wmi_backlight_exit(asus);
 	asus_screenpad_exit(asus);
 	asus_wmi_input_exit(asus);
+	asus_wmi_keystone_exit(asus);
 	asus_wmi_led_exit(asus);
 	asus_wmi_rfkill_exit(asus);
 	asus_wmi_debugfs_exit(asus);
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

