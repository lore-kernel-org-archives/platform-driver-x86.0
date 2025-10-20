Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61AA333747
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995089; cv=none; b=vCnTyG0sSuMXolUqdFvv4gJeIUxjQVJjPZ8OfzxMOkQ0s5Xxl1JdmJZwjNEM7FaZL+73BE0+lLiJzs2J6ZPWdNQc+HjcoxBnd/ScOOkyYTjYlMNbOwPFtNPrcCLDtebod7mf0IlXv8HKhF785cJpS54PFQmkgX2AZ7Kna/VvcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995089; c=relaxed/simple;
	bh=dDKQb2Jp752Rl00PjZyJdgg+I14sXcmVVgxBGh7MIOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ua7U2Du4ocQgbkPpxT+SaEXFr3dT7tR3z1wV4YhLzP5LQheE9tzS7uV1blC7tsLRQlx7AtSQFpnRvs/lhseZV0XL87jKVLqJT10Q5Ubqyeu3OudQbV/U+7haS1aVzlSTfzTIDiks5rXsnRvdxJKZRbuqpoUU9GVNTj9fat7Xk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bt1vaaQI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bt1vaaQI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-427007b1fe5so3152937f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760995082; x=1761599882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24k/+IQksUqDs45sTJ+Ur00fPTiqMg/ZZl9NEKDMYks=;
        b=bt1vaaQIEfnVdrPDqoyPNiY26r37VBO49kIz+cklmze59FDmjTzy7wLPqs5C3UBGWm
         q47DDdDQ520vZdKz1/H6wCd5OTC9qsw4NY8BcJ2aMHtnaHPM46uWyk8OPz/5Emct1dJ7
         aOkxNtuniEFChhM+O41d7ibpniVL2r0Wt/9SZTiYKZlhKX41xx/WISY7Bu6+ZjmZU4MK
         L0tlh8uFF3/GJhzGotGbzaemDlLb/KJw/LNTUhZ5gb9l3jek2jXMAlNZod6Hcafmm+o+
         Of38DYHRTLmdEqNBKWsIOGkajtzfQa/qFN1PiUC0lTA+QK2YT7qrfDix8IZD1Ch6xNVP
         0PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995082; x=1761599882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24k/+IQksUqDs45sTJ+Ur00fPTiqMg/ZZl9NEKDMYks=;
        b=vEdqwnHONL8yqWJhwm/EjsWPgQ19M8H1MFHkYao9R1JwfJLnEnYHlCZDSfrCTFD8L8
         d4pL5IWWNJ8lAoRkEwDRVVikSsnqjH1cutmy/W1srl0A2VO/y8vDJRes7KzyvuTJZMaW
         Sl/YIZgDLTbigR9XKmqxqFkEyMgML4XofM3SL8zjYrGMItDSsI6mr1cYQGU9xcJiV7ap
         lMnUEOmS0XDkOX6OK8y0GoDMLndvgzSHlt+ubTaYwwGtPr0SBasvZWoaHu+iX82V8tu8
         oP03pTz2cpvX3e2ENGdWVSEeGdHHg8q5RRZk5YDvzrwb62i55Do9kxvcYeIo6CYDX1jN
         Gjzw==
X-Gm-Message-State: AOJu0YxCZfnHX5Mlh7Xhl50923bIunasw8ssj5C8X5TKokRlIxhLM9X7
	7aYQBetsJhp42zldhiMupIdcIUkjZekiy4YIl6J2GDHLzcGzvBQIz7rI
X-Gm-Gg: ASbGncsQqd5SbGX1a6kYKAqDtY+kzHo3uuPTpGH01UwZgFSHRcArTeWx+ZaZT4s2RDy
	pPSAlJnjwvnqmn20UX03KOAd8H/V9Yee1K0j2o/YPhCwlbywmH76saruMMcZ7YNbrxv0ybBH++9
	0yQg4ByDRtsYkdDFnQpT9ioH5vyBaKgtmB7DM9iEIlMbeK19OF2giEuzlO2OkI+W56N5EEeZvLN
	ON4J4paRlIqOYGkD8cERjRVuVmEkApIkvgCyYeYIbph4sbL7FHZWdXm9OLZwUP7yjn5rguGoUK9
	aVVcysmDIt5RtxmFKUbRI2FRZyML2Ka8C68DKQMEfrek5az/Fa1YXnG5HJbb9WtRJ6CUtVh0AOA
	NPqTx6X2xwJd51NrJB+3C+zLYO0cpxQQeLI0eunNzFoynMYdIrwzEt778hzX7bPwEhIFoHw7UVc
	159KC7dX7V+Fgl
X-Google-Smtp-Source: AGHT+IFLrKXoNgxDPNQk6LahfMwrO+Tj4kcxzlq3EU2jhpKwtDEEELftfcXKg9PZZJJInoIlYy9/pg==
X-Received: by 2002:a5d:5888:0:b0:426:f38a:a51 with SMTP id ffacd0b85a97d-42704d8d684mr11154732f8f.22.1760995082423;
        Mon, 20 Oct 2025 14:18:02 -0700 (PDT)
Received: from denis-pc ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm17254971f8f.32.2025.10.20.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 14:18:02 -0700 (PDT)
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
Subject: [PATCH v15 4/9] platform/x86: asus-armoury: add apu-mem control support
Date: Mon, 20 Oct 2025 23:17:35 +0200
Message-ID: <20251020211740.719676-5-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020211740.719676-1-benato.denis96@gmail.com>
References: <20251020211740.719676-1-benato.denis96@gmail.com>
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

Co-developed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 105 ++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 20edf4f5370a..fe80d5d04300 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -160,11 +160,12 @@ static int armoury_get_devstate(struct kobj_attribute *attr, u32 *retval, u32 de
  * armoury_set_devstate() - Set the WMI function state.
  * @attr: The kobj_attribute associated to called WMI function.
  * @dev_id: The WMI method ID to call.
- * @retval:
- * * Pointer to where to store the value returned from WMI or NULL.
+ * @retval: Where to store the value returned from WMI or NULL.
  *
  * Intended usage is from sysfs attribute setting associated WMI function.
- * Before calling set the presence of the function should be checked.
+ * Before calling the presence of the function should be checked.
+ *
+ * Every WMI write MUST go through this function to enforce safety checks.
  *
  * Results !1 is usually considered a fail by ASUS, but some WMI methods
  * (like eGPU or CPU cores) do use > 1 to return a status code or similar:
@@ -172,6 +173,7 @@ static int armoury_get_devstate(struct kobj_attribute *attr, u32 *retval, u32 de
  * and should perform relevant checks.
  *
  * Returns:
+ * * %-EINVAL	- attempt to set a dangerous or unsupported value.
  * * %-EIO	- WMI function returned an error.
  * * %0		- successful and retval is filled.
  * * %other	- error from WMI call.
@@ -182,6 +184,26 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
 	u32 result;
 	int err;
 
+	/*
+	 * Prevent developers from bricking devices or issuing dangerous
+	 * commands that can be difficult or impossible to recover from.
+	 */
+	switch (dev_id) {
+	case ASUS_WMI_DEVID_APU_MEM:
+		/*
+		 * A hard reset might suffice to save the device,
+		 * but there is no value in sending these commands.
+		 */
+		if (value == 0x100 || value == 0x101) {
+			pr_err("Refusing to set APU memory to unsafe value: 0x%x\n", value);
+			return -EINVAL;
+		}
+		break;
+	default:
+		/* No known problems are known for this dev_id */
+		break;
+	}
+
 	err = asus_wmi_set_devstate(dev_id, value, retval ? retval : &result);
 	if (err) {
 		if (attr)
@@ -592,6 +614,82 @@ static ssize_t egpu_enable_possible_values_show(struct kobject *kobj, struct kob
 }
 ASUS_ATTR_GROUP_ENUM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
+/* Device memory available to APU */
+
+/*
+ * Values map for APU reserved memory (index + 1 number of GB).
+ * Some looks out of order, but are actually correct.
+ */
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
+	err = armoury_get_devstate(attr, &mem, ASUS_WMI_DEVID_APU_MEM);
+	if (err)
+		return err;
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
+	return -EIO;
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
+	mem = apu_mem_map[requested];
+
+	err = armoury_set_devstate(attr, mem, NULL, ASUS_WMI_DEVID_APU_MEM);
+	if (err) {
+		pr_warn("Failed to set apu_mem 0x%x: %d\n", mem, err);
+		return err;
+	}
+
+	pr_info("APU memory changed to %uGB, reboot required\n", requested + 1);
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
+	return attr_enum_list(buf, ARRAY_SIZE(apu_mem_map));
+}
+ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
+
 /* Simple attribute creation */
 ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 			    "Show the current mode of charging");
@@ -611,6 +709,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
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
2.51.1

