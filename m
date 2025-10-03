Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB12DF710
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517744; cv=none; b=jXjezmF1us2+DqlL4+5LF45ppOZw+a9unSxlMt4w1HzTn2Ys1ukxV9K1c3tCW/QTwHVLpXGon6QU7ikF8pA4BOYJ+JhL6Ert6xfRqz7ls3o6U0Rc9evIYUFdSi/cCvenTRQRi9DBy67gnw32Ei/be2D8AoERTQ3n0ShlZ0rQY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517744; c=relaxed/simple;
	bh=NE6dT61ylSvnM9qPLMfeti7JwQ+rMQw4u8ab3aOzzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzDl6NHEkpmEAHUi42NR4CmNq0vIgJB+lsq+PocudQYUaLGRIXcQDyC284cxKw2tQQhQBkXvEpWRSrCwQnbDrSHm+Dn5cyb/vwByp/xxzuCoM0yXzD2yonppNqk+T4pLgaQla7i6nFKoL5RHGAueFXfexWeoyMHp8O73KB4kmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmWUgllH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmWUgllH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-41174604d88so1396434f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517740; x=1760122540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Np10dU8vOqQAvntlvXJuwlLB6JmfodovFMH4459OEU=;
        b=UmWUgllHqEB1uVMnkIu4bT0IHZwjCf1Hd4EAubjUN/ZpKlA/9kczujdELPOsafewuu
         fMFYheUv5XU9WtRy0yQrX8VWyjkkUQ/jjvnnMfCG1vJ75pbTS/KzN4rJ9QHYbqnv7wif
         zNyJItzzcfDIOUFLMexJr47sfVYJJhWLT6KNy0xBimK15iCJCeK0DIYBfYRl2P2Vplux
         57c0O+WjJITl7+3irhMH/Fb1lAKCzOoSmLy2Tnmj+4ct1lAQFqGDrUhKCqk7ei5hJH/W
         m8blfzy7prskXqJqGbKJq9t/ZZ6cPzfVxdQHxM9th/oF7JyffSvsM0cCKYzBAMiO/Rid
         Eajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517740; x=1760122540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Np10dU8vOqQAvntlvXJuwlLB6JmfodovFMH4459OEU=;
        b=YcMLTlG92S1URQEmUFJPMVZgp54Um9CrOQLR6WGNpHqiV2lh473CBTc3ZTBVH1+HEA
         tLtMY+LPd60qww+7D5StKuz0/xuCfBPzKni/Eiwuzp9Khx621/uBwCONEWbI0gpUcViq
         3RHZHqLHk4hHSXHD8s9N5ZzrmBZlM4+LrxfGHy9BJdvNEY+uH56+lJfcYOuiltKMiGL8
         GKbs29+ImOd9K/bbD0aMgDXkc1XSuVhbP9qvPPRio8Z+EHAUJMvMAP0wLFF5h8QZUCnt
         1glHEdEj7+gGLE4pi9N82S+1JgiRao6fvqKcVNyy/JhtFUimlzDKNl9Hn5OWguWldeV0
         xSZw==
X-Gm-Message-State: AOJu0YwXf8nyBFm5cN5dl9hlYC2GbDXHJPwSXuGOnmv4F3VOEEmY6GcW
	m+dw8CwGvtV5CELr8Tmo5xcjRITVYzhFr+hY41fYyZE2CqrL5qQs6y4D
X-Gm-Gg: ASbGncvme22HQjZ4QdPOotF0/HYHhs499jIyFteQpJyf0ZAXsCG11tBk1R3ziMD71Vo
	o/Dlq4FWxkMLHAyOwlAdIo3pW+GXhRxA9JS93iFhXhCRXDsszC8QzF27c20Z+/NzGJeAvfaytk/
	DzQyC42EgyXQfDmWuTtCrKOrGVi0siZYJhvQyHbsQcOppGES2Mz5qtVlMdsgQiycmHsPW0Vl83j
	httwiY8mJcs+CF4g0eUAxcIp4+XM+N2vDjI79mMFxnuOII5zqGBWEapVcdR8xRKmi6uC7vCG+vs
	897qIBQxe6fU6ZmqeciIxWcsmZGQuhteW223t4i9vcKNuifzLpZJKgnaY1SsWti77JB3exprpaa
	bB8TOpQqu6NAuTyT2SGXg7YMfExw6Y5IWEuMV37LE04VmzVyklDwyUHqfcruHtg==
X-Google-Smtp-Source: AGHT+IGoah8TR//hQ35XXudBKdit7fS+mk64g95LZw6GSEiuN4dqWUvsfPltMt5apu0EySv28h1k3Q==
X-Received: by 2002:a05:6000:2089:b0:3ea:2ed6:9e37 with SMTP id ffacd0b85a97d-4256716d8cemr2507350f8f.24.1759517740252;
        Fri, 03 Oct 2025 11:55:40 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm8946927f8f.38.2025.10.03.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:55:39 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>
Subject: [PATCH v12 4/8] platform/x86: asus-armoury: add apu-mem control support
Date: Fri,  3 Oct 2025 20:55:16 +0200
Message-ID: <20251003185520.1083875-5-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003185520.1083875-1-benato.denis96@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
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
index 68ce2c159ae1..e458d23d020d 100644
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
+	if (requested > ARRAY_SIZE(apu_mem_map))
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

