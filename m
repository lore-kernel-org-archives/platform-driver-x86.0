Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A244238D
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771275; cv=none; b=G8lZRZQTxNPy+CQorzy/s4AxpO+NcW/+3xtOu35bzpKcx3H6V8KZxa8Hbxn5C2OwuqeKLASIoWruYmLSuraAyMDH0QBr5fRaO+p2Rg35UOCuq0EbCyY/yyk5bHGv5tgrEypztIYWVGabCAxjTe6ltQO56NpGYZTW+aZxwD55dAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771275; c=relaxed/simple;
	bh=wBxZaD2/ZNzVEOWbBVSkTP3gXiMJcM2J7W26OU7nAg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FgApD2P91owJX2rPBm7To4ihdCdFU2Df7wxji44ONT/d99FB0Cc42eZmfEgdsmQSmzSi4myHcFo9bscmCttmsf+eb3lxTAH5XEINCDBNy9Rev0BmBtYA5JSGUIOFB/kezOOQB3usB5gt4GlbJgUir8jJG9Rw5PRL8rT6f10qZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUrPZIJc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUrPZIJc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so29554695ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771273; x=1789376073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FrSxEN8ak5vclBPmxgXg5qafP5KTv46KpfDsZfuuR4=;
        b=PUrPZIJcGYy5wR7JIpPfXsWlt0fzBlNPXS1mkdIQfRiBB7OEIQc2HihiFlizvwuuz2
         BD0N2D8VoQlKLTdh//+u00xIrLWUKm/Wb5XHC0D8ol/vd+3BqfTtb8YA7LgNjBSXOma3
         foCo5TlnlKW0oUV5Twgbuc6KTPC4mJ4adyyBoPFGyvpQr4TBsmldDTpY66b/GDWbaGOA
         4b+305RIIu+YODAgFa0f//hOLwrJZjWcQhVMFR61Ix6OfFGPhRHKz/AE/IkaPhpqkmXF
         +vDqS/+liYRkNTDVQKsfF+IGMXO0YepzqyLlrXFz/7vFMb8X5IW7qIK0GLmKAT/DRP5F
         8sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771273; x=1789376073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FrSxEN8ak5vclBPmxgXg5qafP5KTv46KpfDsZfuuR4=;
        b=V9JWOOfn2/kgvja348BmDW/cGQaa9nGSExnLRCD1zzruaJbbjgJBJtTCqXSAtm1w/6
         IdP7HUcL7ESXt21vUhw49VgNfaVF4qoAkxlPK6r4Sv9MxFat5AK9JNre+UTDZur59w6r
         FyTRbI04n0k3CJb3UeWIXBQi1BrlGOW/f/sHxfcruqd+SnAdLpvwiTCrV9CexPCPPprH
         WD88lqtBLJGOJ5K7oj2RZvezMKtCrY6GUee3o3MChs9pqtXyR1UPjNjlcl7Tn/3f89Ux
         +nx18J2Ftod7xR8QYSb4GMe3j1vSw7UVorcf2ItEWtZxq0xFjwpTxG7W4XvY9V3q+2PQ
         I5sA==
X-Gm-Message-State: AFuF++kZ0BWUeDritC37GXa3jk+7wbN9A7HLEGKtqH1dsYK7BrRa10eo
	NcnA64EbwHsLx9qu83boBQC24hsmnYDhlEhxUDQfTxLwFSg/GD28Tmj/
X-Gm-Gg: AYBFou0T54HGU8IHiCiuUPjBuihfw7l+ieER6368QnQavnLvbpAamQC+M6ymK849aIJ
	O5ewVbOSSnwRRq2/6I9KviocQgTKL5QqkTtF2DJSNTcmgfJyX2Hk6LUMkPHzaagl0gllR0xXPeG
	RNefVVBeXe7SrpGZ+KPLnzGiSUuDkJyoLv2NuPx2CI2GkEKdMJq1GBp8VzGGb67w3d7DAG02FvP
	1jM5n94BQ5EeARwC/BCz5LW8XSZtgPCecYZ9hR0CCTgAyZ/6swaknZRZLm7516gEcn4W4sT4nb/
	j+8UgzBewbCdwt8yzL6XpRdL9mGYr/50OkTkOOFWTc6TeeWHMRhDYIeEdVeRcwZWyiLLBR2FAPy
	FJL44YV+BehpZwmUZ3mxmQkQ8X2gEtkBd8mCAMEiPlDxT4MKM57vvrfwgVopLpUL+XOjIyFYgFT
	EhFd54lRDaDyzfuhrpZ68MAhg1ISj8eDD4JYdkBhTvDt1Xb+bDQNfo6muWbh/JjCipUr1bq2N7S
	4C6FwG/c7xfqw==
X-Received: by 2002:a17:90b:1c8b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39b26214502mr30482551a91.19.1788771273430;
        Mon, 07 Sep 2026 01:54:33 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm28958402eec.2.2026.09.07.01.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:54:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform: x86: fix typos in comments
Date: Mon,  7 Sep 2026 14:24:26 +0530
Message-ID: <20260907085426.3661-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/x86/asus-laptop.c          | 2 +-
 drivers/platform/x86/asus-nb-wmi.c          | 2 +-
 drivers/platform/x86/hp/hp_accel.c          | 2 +-
 drivers/platform/x86/intel/vsec_tpmi.c      | 2 +-
 drivers/platform/x86/msi-laptop.c           | 2 +-
 drivers/platform/x86/panasonic-laptop.c     | 2 +-
 drivers/platform/x86/samsung-laptop.c       | 2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 449addd1ac7a..de607edb9490 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 		len += sysfs_emit_at(page, len, "SFUN value         : %#x\n",
 			       (uint) temp);
 	/*
-	 * The HWRS method return informations about the hardware.
+	 * The HWRS method return information about the hardware.
 	 * 0x80 bit is for WLAN, 0x100 for Bluetooth.
 	 * 0x40 for WWAN, 0x10 for WIMAX.
 	 * The significance of others is yet to be found.
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..9b729afb34f9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -573,7 +573,7 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 	driver->quirks = quirks;
 	driver->panel_power = BACKLIGHT_POWER_ON;
 
-	/* overwrite the wapf setting if the wapf paramater is specified */
+	/* overwrite the wapf setting if the wapf parameter is specified */
 	if (wapf != -1)
 		quirks->wapf = wapf;
 	else
diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 39b73dc473f1..40e1b9fb1b6d 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -122,7 +122,7 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
 static int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 val)
 {
 	struct acpi_device *dev = lis3->bus_priv;
-	unsigned long long ret; /* Not used when writting */
+	unsigned long long ret; /* Not used when writing */
 	union acpi_object in_obj[2];
 	struct acpi_object_list args = { 2, in_obj };
 
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 0153dd57838e..fbe9c8af4aee 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -597,7 +597,7 @@ static const char *intel_tpmi_name(enum intel_tpmi_id id)
 	}
 }
 
-/* String Length for tpmi-"feature_name(upto 8 bytes)" */
+/* String Length for tpmi-"feature_name(up to 8 bytes)" */
 #define TPMI_FEATURE_NAME_LEN	14
 
 static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index ddef6b78d2fa..0a0c756a5598 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -117,7 +117,7 @@ struct quirk_entry {
 	 * Wlan/Bluetooth/3G, those netbook will load the SCM (windows app) to
 	 * disable the original Wlan/Bluetooth control by BIOS when user press
 	 * fn key, then control Wlan/Bluetooth/3G by SCM (software control by
-	 * OS). Without SCM, user cann't on/off 3G module on those 3G netbook.
+	 * OS). Without SCM, user can't on/off 3G module on those 3G netbook.
 	 * On Linux, msi-laptop driver will do the same thing to disable the
 	 * original BIOS control, then might need use HAL or other userland
 	 * application to do the software control that simulate with SCM.
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..a3597344edef 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -107,7 +107,7 @@
  *
  *	Jul.25, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.4  first post version
- *		        add function to retrive SIFR
+ *		        add function to retrieve SIFR
  *
  *	Jul.24, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.3  get proper status of hotkey
diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 710f3d5bf84c..18631e96bb17 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -295,7 +295,7 @@ static const struct sabi_config sabi_configs[] = {
  *   d0, d1, d2, d3   - data fields
  *   call             - call SABI using command and data
  *
- * This allow to call arbitrary sabi commands wihout
+ * This allow to call arbitrary sabi commands without
  * modifying the driver at all.
  * For example, setting the keyboard backlight brightness to 5
  *
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..eeead0159828 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1705,7 +1705,7 @@ static int uniwill_kbd_led_mc_brightness_set(struct led_classdev *led_cdev,
 
 	/*
 	 * The EC interprets a RGB value of 0x000000 as a command to restore
-	 * the device-specfic default RGB value. Work around this by writing
+	 * the device-specific default RGB value. Work around this by writing
 	 * a RGB value of 0x010101 (faint white) instead.
 	 */
 	if (data->kbd_led_mc_subled_info[0].intensity == 0 &&
-- 
2.48.1

