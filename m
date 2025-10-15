Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421482FCBFC
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492986; cv=none; b=EpIT8EBW7K2goeZMYqkvzb2dUF+hkfiu2ftCeIeUXD/yIUXMGSg/Cl/o8ndZEdUIT96Ko9PNeG92ZTmFdmvtjGlaSKshvPTOwAvTr/2wVoSBH2j4a18da8b3fxl3rYxpY7PjXdT4nfg6FrqAIyCORcvyGYZ4BPLqL+mnv3Q3Cto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492986; c=relaxed/simple;
	bh=q/EU7lSWeXS/l60j+bgP/a6Vbvr7aGyHaBwtx3X4MxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGS9GeDcWOP/Y0cS6qb81wGDtFRWDTvIyEQBcuI2cIPuoTvmd+7DvFjsqOQRhGrSIRcBgGLTyr4BGHmLB/ZZsO0QFWci9+TcYMV4YQ/XLwfRCFNXUXcOz9NY/jyzgmfW4U895iaGaXFf8NFmz/cGYG8tlS3NZVqIFaBRxti0hWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7fqHehj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7fqHehj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46f53f88e0bso34242115e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492982; x=1761097782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ADb/Xn7/h9pdMbRXBw0B+VvtgUC71nJ/4n9TIxqgDg=;
        b=L7fqHehj9LRh7qWvAorLQEyjmQu1EMFsvakIHCx2b5B6OYgFWoIFxXPkO43URVY/EF
         m551W5FxtlLRumdDkIlElbfjs8tWUApzyu8RK2VhDpBsDDvAmK39O9/A+f0JGaIxR6wu
         1mZtr2qCc58NZ6bCHGjn1D2VMFXj7KzkDLpxxhot+t52duES6xaPCn5Kr28ub61gUn6j
         hcheUFZzB0zNBxVauzjnkZZOffqcrvsobvvVt2uoPpxjNy4KtxxWtVG3E62e2LDoj2Y6
         KFbsC2ydtP605whLQJD8q82bn4rnWyXWUhDqj0lS2Car5BZt9NYuxgcKL018aNCqwO0B
         cquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492982; x=1761097782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ADb/Xn7/h9pdMbRXBw0B+VvtgUC71nJ/4n9TIxqgDg=;
        b=e6NG6nfGQa01CMlP0T5BvMciBNJHdUo1w02kEqO+hI/aXQ5kL91XLTv9+CEWkdR8Xu
         nDPujCM5+QFBse8QXl9YiUloLXMwXb9Sw8aoUapILl2HYZJgI2QteX1/D8lI/xy0i4ic
         XSSWFo5ZAJubAC61SKpYBAmcaac4rAHFyc9f5z5uTzENr4BLjqE0DZxZH/UN+F6xYgNe
         phvFbxwoEYh3UBQT4/qShvMBQ8Fv+ccnxR7/qK9zweYUbJtb7mdeJyRS2Lvjcw0m1naV
         TRmisYg5/tUdZ2oGlZRCPbFmRuHv4EXWduJI5nUfLb40xguPXM5A3SZ0KTcohbqqoYjK
         C5FA==
X-Gm-Message-State: AOJu0Yy13oZjmMjR9eaPtzi8Z2Kg4CQZpGbZVF/84MUf9O3fu7iulEk5
	rrcX22ti9tm6R6/11PrY3KEkdNzMEIs/4R8jbLi9za2xldhXD9Ba1N1J
X-Gm-Gg: ASbGnctA7gFaikqosAzz/6qRU4ilwEEov03D1kbewIt9RM4QzXhy0Uz0/fBnfqalFPf
	5hUuNCcr1RLq/1GXzFM3D8qExKboXIjXbP/s/94hiEvEbrRpS0W/M0EGzgFHK8anDc7/NeakAbD
	Dd+EH9ndSNnSN4g94Jckyk8JMCCIF3PRsDrztbZQucHJrdiNS3c/ijvZo6LP2r37whY8qBpT4Kb
	jL/53MdQOseY4HyWI4FxxrEaxH7ucjF2OMXkdXELWXUxTMfmK0sFVp2ol2YyZzVG7/X7OmkavDQ
	o5e8sqJ1ryWgVwF+4sThd4/0A5kLKhkzir7NTB972eBGcweOLew62iiFczxUT3SztgOUEZEDHlt
	QcwXDRiLByngWqgMeO4mRcZfMn99/MJxVL5xXwOQPo3ewGA==
X-Google-Smtp-Source: AGHT+IHtnJJvqvTlB6dTJyJLwdEbvLwZPN2hLkWi4mvxf/sdRLfS2GKYYjax96m/EWTUBBGMtLRVJg==
X-Received: by 2002:a05:600c:c4ab:b0:470:fcdf:418 with SMTP id 5b1f17b1804b1-470fcdf04bbmr7202705e9.27.1760492982329;
        Tue, 14 Oct 2025 18:49:42 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:42 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v14 4/9] platform/x86: asus-armoury: add apu-mem control support
Date: Wed, 15 Oct 2025 03:47:31 +0200
Message-ID: <20251015014736.1402045-5-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Implement the APU memory size control under the asus-armoury module using
the fw_attributes class.

This allows the APU allocated memory size to be adjusted depending on
the users priority. A reboot is required after change.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        | 81 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  2 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 68ce2c159ae1..3b49a27e397d 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -394,6 +394,86 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
 ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
+/* Device memory available to APU */
+
+/* Values map for APU memory: some looks out of order but are actually correct */
+static u32 apu_mem_map[] = {
+	[0] = 0x000, /* called "AUTO" on the BIOS, is the minimum available */
+	[1] = 0x102,
+	[2] = 0x103,
+	[3] = 0x104,
+	[4] = 0x105,
+	[5] = 0x107,
+	[6] = 0x108,
+	[7] = 0x109,
+	[8] = 0x106,
+};
+
+static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	int err;
+	u32 mem;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
+	if (err)
+		return err;
+
+	if ((mem & ASUS_WMI_DSTS_PRESENCE_BIT) == 0)
+		return -ENODEV;
+
+	mem &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
+
+	/* After 0x000 is set, a read will return 0x100 */
+	if (mem == 0x100)
+		return sysfs_emit(buf, "0\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(apu_mem_map); i++) {
+		if (apu_mem_map[i] == mem)
+			return sysfs_emit(buf, "%u\n", i);
+	}
+
+	pr_warn("Unrecognised value for APU mem 0x%08x\n", mem);
+	return sysfs_emit(buf, "%u\n", mem);
+}
+
+static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int result, err;
+	u32 requested, mem;
+
+	result = kstrtou32(buf, 10, &requested);
+	if (result)
+		return result;
+
+	if (requested >= ARRAY_SIZE(apu_mem_map))
+		return -EINVAL;
+
+	mem = apu_mem_map[requested];
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
+	if (err) {
+		pr_warn("Failed to set apu_mem: %d\n", err);
+		return err;
+	}
+
+	pr_info("APU memory changed to %uGB, reboot required\n", requested+1);
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
+					    char *buf)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(apu_mem_map) != 9);
+	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
+}
+ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
+
 /* Simple attribute creation */
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
@@ -414,6 +494,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 10acd5d52e38..a4f6bab93a6f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,8 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
+
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
-- 
2.51.0

