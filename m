Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66B4C3527E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382612AbiDDVbh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380588AbiDDUi1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:27 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF77825EB8
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:30 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-df0940c4eeso12143006fac.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j7RsaSS0HO0J4CreRPJtBU6FZqHLAY7n1b1AmQqGI4w=;
        b=BqWImTLHznG78bQ9hSoc1s5ZXJc1zbrzvgKyjBgd8kzKvHlnbOiMI8G8rtmtRCAcX8
         h+aEqhXmXckUuj36/sVJGgFAbjyZMVhWZAnB2gS951mJQ0voC0dlKi+xpK6UfpzwqCjS
         6/gCXCuJaFn6mC6mnDOTsvbxcaW9bfbOfyFPYui5zCovJJSfuxR4F6ka/An7DzP0YkEy
         HTbOsddTPklGzZWhCCnW33ejUVH5ndal9bjWJPI7WIlPvikavXT28AOc/Vrr/FzNObya
         VsOn724UouxuYnN9GC5+dMmT+CgsAM5Zm9a7XgRrdOsx1kjvZebPoHFxXQNTy67g7hnf
         SfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j7RsaSS0HO0J4CreRPJtBU6FZqHLAY7n1b1AmQqGI4w=;
        b=Ku3EEfrdNqRWoBBmOvVJQcEn1EISaiVcOw4BD/BWG/6D67Z9g4IBLoH9mPMSI9cNBQ
         fXQjwlDhgQyzs8mfvcyiA4H/oI9d17NdlLUTJxLKJLnWNwVLJmQxjj53c+GQLyFhMdk2
         3xzEkkLh3xnRc7HgNBSB7FYXs+gvaSTXKsGNc0tyjkLqK7gl8sAjE23KCRL+j5UN0XfZ
         TBLExzQB50OVDTVNWd7IxKmhDuFIF1PUAa9BSH77wf6xMVpizJOZeBgTdMVaUD2jNRNZ
         UtAqebTwVqWsQ7OPc9muB1xrx63TJ4YhjDsFUh+0vK56FA0M+w+Ec8tTpdqVOyZSHkui
         9dKw==
X-Gm-Message-State: AOAM533uFRZhtcuoGditAkEwAu7iEQfSzZ8G3DQcbj9xyUpkzMARAxAc
        x6dmi4073ptZG29S1maV8jU7NrStSis=
X-Google-Smtp-Source: ABdhPJwPc8qFhbEkel/HEXeCf9EWnQmZYyqsuLjslZqGNqXAs6u63dkH8JbQzLjHUSc7pG44O5mdsw==
X-Received: by 2002:a05:6870:a79c:b0:dd:e5ad:ba00 with SMTP id x28-20020a056870a79c00b000dde5adba00mr4632oao.64.1649104589785;
        Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.29
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 3/6] Secure Platform Management Security Feature
Date:   Mon,  4 Apr 2022 15:36:23 -0500
Message-Id: <20220404203626.4311-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404203626.4311-1-jorge.lopez2@hp.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Many HP Commercial PC’s include a feature called Secure Platform
Management (SPM), which replaces older password-based BIOS settings
management with public key cryptography.  PC secure product management
begins when a target system is provisioned with cryptographic keys
that are used to ensure the integrity of communications between system
management utilities and the BIOS.

The private key is used by system management utilities to sign
payloads containing configuration changes.  The BIOS on a target
system uses the associated public key to verify the integrity of the
payload and apply the changes.

At the end of the PC’s lifecycle a signed deprovisioning command
restores the factory default state.

KEK Certificate (KEK) and Signing Key (SK) get provisioned, and status
can be read either as text from the status file or binary from
statusbin.

	/sys/devices/platform/hp-wmi/spm/kek
	/sys/devices/platform/hp-wmi/spm/sk
	/sys/devices/platform/hp-wmi/spm/status
	/sys/devices/platform/hp-wmi/spm/statusbin

'kek' is a write-only file that can be used to configure the RSA
public key that will be used by the BIOS to verify signatures when
setting the signing key.  When written, the bytes should correspond to
the KEK certificate (x509 .DER format containing an OU).  The size of
the certificate must be less than or equal to 4095 bytes.

'sk' is a write-only file that can be used to configure the RSA public
key that will be used by the BIOS to verify signatures when
configuring BIOS settings and security features.  When written, the
bytes should correspond to the modulus of the public key.

This feature requires "Update hp_wmi_group to simplify feature
addition" patch.

All changes were validated on a HP ZBook Workstation, HP EliteBook
x360, and HP EliteBook 850 G8 notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 195 ++++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0c7d863b8aab..139dc079c1fa 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -120,6 +120,12 @@ enum hp_wmi_commandtype {
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
 
+enum hp_wmi_spm_commandtype {
+	HPWMI_SECUREPLATFORM_GET_STATE = 0x10,
+	HPWMI_SECUREPLATFORM_SET_KEK	= 0x11,
+	HPWMI_SECUREPLATFORM_SET_SK	= 0x12,
+};
+
 enum hp_wmi_gm_commandtype {
 	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
 	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
@@ -133,6 +139,7 @@ enum hp_wmi_command {
 	HPWMI_WRITE	= 0x02,
 	HPWMI_ODM	= 0x03,
 	HPWMI_GM	= 0x20008,
+	HPWMI_SECUREPLATFORM = 0x20010,
 };
 
 enum hp_wmi_hardware_mask {
@@ -193,6 +200,20 @@ struct bios_rfkill2_device_state {
 	u8 unknown[4];
 };
 
+#pragma pack(1)
+struct secureplatform_provisioning_data {
+	u8 state;
+	u8 version[2];
+	u8 reserved1;
+	u32 features;
+	u32 nonce;
+	u8 reserved2[28];
+	u8 sk_mod[256];
+	u8 kek_mod[256];
+};
+
+#pragma pack()
+
 /* 7 devices fit into the 128 byte buffer */
 #define HPWMI_MAX_RFKILL2_DEVICES	7
 
@@ -724,6 +745,179 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+/* Secure Platform Management (SPM) */
+
+/*
+ * spm_statusbin_show - Reports SPM status in binary format
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *
+ */
+static ssize_t spm_statusbin_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
+				       HPWMI_SECUREPLATFORM, buf, 0,
+				       sizeof(struct secureplatform_provisioning_data));
+
+	return ret ? -ENODEV : sizeof(struct secureplatform_provisioning_data);
+}
+
+/*
+ * spm_status_show - Reads SPM status
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *         -ENOMEM if cannot allocate required memory size
+ *
+ */
+static ssize_t spm_status_show(struct kobject *kobj, struct kobj_attribute
+			       *attr, char *buf)
+{
+	int ret, i;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = spm_statusbin_show(kobj, attr, (char *)data);
+	if (ret < 0) {
+		kfree(data);
+		return ret;
+	}
+
+	snprintf(buf, PAGE_SIZE, "%sState: %d\n", buf, data->state);
+	snprintf(buf, PAGE_SIZE, "%sVersion: %d.%d\n", buf, data->version[0], data->version[1]);
+
+	/* state == 0 means secureplatform feature is not configured in BIOS. */
+	if (data->state == 0)
+		goto status_show_exit;
+
+	snprintf(buf, PAGE_SIZE, "%sNonce: %d\n", buf, data->nonce);
+	snprintf(buf, PAGE_SIZE, "%sFeaturesInUse: %d\n", buf, data->features);
+	snprintf(buf, PAGE_SIZE, "%sEndorsementKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		snprintf(buf, PAGE_SIZE, "%s %u", buf, data->kek_mod[i]);
+
+	snprintf(buf, PAGE_SIZE, "%s }\n", buf);
+	snprintf(buf, PAGE_SIZE, "%sSigningKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		snprintf(buf, PAGE_SIZE, "%s %u", buf, data->sk_mod[i]);
+	snprintf(buf, PAGE_SIZE, "%s }\n", buf);
+
+status_show_exit:
+	kfree(data);
+	return strnlen(buf, PAGE_SIZE);
+}
+
+/*
+ * spm_kek_store:
+ *
+ * Function used to configure the RSA public key that will be used by
+ * the BIOS to verify signatures when setting the signing key.  When
+ * written, the bytes should correspond to the KEK certificate (x509
+ * .DER format containing an OU).  The size of the certificate must be
+ * less than or equal to 4095 bytes.
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ * @count: buffer size in bytes
+ *
+ * Returns number of bytes written on success.  Otherwise
+ *         an HP WMI query specific error code (which is positive)
+ *         -EINVAL if the query was not successful at all
+ *
+ */
+static ssize_t spm_kek_store(struct kobject *kobj,
+			     struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
+				       HPWMI_SECUREPLATFORM, (void *)buf, count, 0);
+	return ret ? -EINVAL : count;
+}
+
+/*
+ * spm_sk_store:
+ *
+ * Function used to configure the RSA public key that will be used by the
+ * BIOS to verify signatures when configuring BIOS settings and security
+ * features.  When written, the bytes should correspond to the modulus of
+ * the public key.  The exponent is assumed to be 0x10001.
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ * @count: buffer size in bytes
+ *
+ * Returns number of bytes written on success.  Otherwise
+ *         an HP WMI query specific error code (which is positive)
+ *         -EINVAL if the query was not successful at all
+ *
+ */
+static ssize_t spm_sk_store(struct kobject *kobj,
+			     struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
+				       HPWMI_SECUREPLATFORM, (void *)buf, count, 0);
+	return ret ? -EINVAL : count;
+}
+
+
+#define HPWMI_ATTR_RO(_group, _name)	\
+static struct kobj_attribute _group##_##_name =	\
+__ATTR(_name, 0444, _group##_##_name##_show, NULL)
+
+#define HPWMI_BINATTR_RO(_group, _name, _size)	\
+static struct bin_attribute _group##_##_name =	\
+__BIN_ATTR(_name, 0444, _group##_##_name##_read, NULL, _size)
+
+#define HPWMI_BINATTR_RW(_group, _name, _size)	\
+static struct bin_attribute _group##_##_name =	\
+__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write, _size)
+
+#define HPWMI_ATTR_WO(_group, _name, _command)	\
+static struct kobj_attribute _group##_##_name =	\
+__ATTR(_name, 0400 | 0200, NULL, _group##_##_name##_store)
+
+HPWMI_ATTR_RO(spm, status);
+HPWMI_ATTR_RO(spm, statusbin);
+HPWMI_ATTR_WO(spm, kek, HPWMI_SECUREPLATFORM_SET_KEK);
+HPWMI_ATTR_WO(spm, sk, HPWMI_SECUREPLATFORM_SET_SK);
+
+static struct attribute *spm_attrs[] = {
+	&spm_status.attr,
+	&spm_statusbin.attr,
+	&spm_kek.attr,
+	&spm_sk.attr,
+	NULL,
+};
+
+struct kobject *spm_kobj;
+
+static const struct attribute_group spm_group = {
+	.name = "spm",
+	.attrs = spm_attrs,
+};
+
 static DEVICE_ATTR_RO(display);
 static DEVICE_ATTR_RO(hddtemp);
 static DEVICE_ATTR_RW(als);
@@ -747,6 +941,7 @@ static const struct attribute_group hp_wmi_group = {
 
 static const struct attribute_group *hp_wmi_groups[] = {
 	&hp_wmi_group,
+	&spm_group,
 	NULL,
 };
 
-- 
2.25.1

