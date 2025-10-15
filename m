Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6652FBE00
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492984; cv=none; b=OFOY70ss7n5emxDLqhh5XiObAHHlRhwBCAqNgfKR5jVGLqQskVeBgVIRsEtjNgvRXS8l+j+NdtdRIiRKQRkV5CpREwVIhpbIbJq/eRQlbpp1ou9nAzYRJa8QG8WHwu/uxkgL8VAO4gRLp8tSlBTPV3rYzRK2T7fsSznRTHlFYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492984; c=relaxed/simple;
	bh=JCk7VqzZDm0N9em80Jlh9Edcp6PBHzBN9/7plUWcVDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6eK+04fyYwMaRrxCaZlywaYKFvJuDHG+6iHoaH7MTuElNLS/uWZTrjHokshFrPw23mpi2DPxmCTSAriF9qMlWGRaRdgheAfaPZhSd2kTnUpDv06gaQmoLiKs0RoLxoY+7GQ9H0rjDYu1dqDFW89D+xTjeC0LxfHc3Voyg3V5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edu9c7lc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edu9c7lc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so3559575f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492981; x=1761097781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=edu9c7lcOrcu8nEOVf5OEvvp7ub9T/GOcoEmGCR+6nDiNTYMwIiL6Po9wn/mmomZAT
         zkPNojfz9aS+MqZE1TkRWWxwSee1aTUSbc08AaAB7SjF1YL9GT1FlO2/4Tlkr/63FsuU
         dR2gnIgQfvgw+lyVWWD2he49uXKbheoRwS5X0+AjWjYH3eQ5Y9VnSwZ+ypv9yLc5Zmj3
         tMNusFuRpbi6Eob/DscdDyy55nS0aVTAGX6mAKXpCj0D9/0a795Pa0efzOOKPmyFRIcX
         HA8l/IaHiw41J0noHro23+n4M+LlRnH8UCo3FtNWiHs3EV1vkqHjR4bqlt3oMNEf5AwT
         q0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492981; x=1761097781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=fRbfytACwoS5brCIvlI11HvONE/l8mdBQFl9fZbEY8xd73ovWEVoVj3JZXczZAkqmS
         x77aI0AJaDfzMWugbnufVF0zu7bwWdsEK1Z+2+lyNvkV5ctsqLcO9bPc8VnLDHfs5sTj
         2ns1D6ZZx1aZu2baX+wIikVPVWzgow2oTzukg1845r89FdQArqx/BRQt0jV84oCFdnIv
         nD4NV4MUUbr3bV9ezzh1QWTL6g80d8cDbicaaNh0/plQS+nA8Uj30ERKypZ+p9gqdQ7d
         oSiPRcytA6eutL5OxeqsEOkCBHLgIIRcF4ZCGMGagd2Ia6wAir07MII8espJt3TPoB9h
         oLLQ==
X-Gm-Message-State: AOJu0YznxdGatK6hP7xi4sTZWWdi/F9w4STA2P0PREDJOqpYnqrN/jTZ
	330Asqj44BpF2Xn1fv0pMB4OW5V02yyMU6g6vaFYmZNfjaAHqjJOBpgQ
X-Gm-Gg: ASbGncuIiLPv0EPtkHRGIdyysMikRFVRU1oQ8z/57r5a9pIvnw8bnQOLsMITagT09m5
	FEaWcssTQEldY1TmUzBJz+BrWK06/b2EAzxn6YydHoQeprlSvVWssKM224xu47nPEgWvxHwTurg
	cILyA8oWaOaNXSmu/jE6z9qhAT4IVoX+X393wGzNUpYkauBxFFDEZT8l4BNtI3twiuPxhEuf9tB
	z9Z5DRZKiyA5UfqT+sCFiuJGVcEC+zog8fH+fe1yuNbOATeHb5PqlfwVf8gJ3fciFHdRW2jwj6v
	R4c9lPMl1GR2Y/6RKKAh6t9VmAjJDRW4GnuANAc0lZsWKd84u4ZymiTFfDMbhpg0dCtA1+WI68f
	hNWlJ6pufI18k0yXTM1OC6CcAnmzL6mKkj0dPwGZ3DRCB0A==
X-Google-Smtp-Source: AGHT+IFPE9i3YnSnYkGk+8WL8qcYOO8XFGnUtR952/JUmTXbwxSCwjFj6JYZncS6crsmwS9AfuzdCg==
X-Received: by 2002:a05:6000:2388:b0:425:8255:fedf with SMTP id ffacd0b85a97d-4266726c31fmr16505848f8f.23.1760492981296;
        Tue, 14 Oct 2025 18:49:41 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:41 -0700 (PDT)
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
	porfet828@gmail.com
Subject: [PATCH v14 3/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Wed, 15 Oct 2025 03:47:30 +0200
Message-ID: <20251015014736.1402045-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 57ed9449ec5f..68ce2c159ae1 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -92,7 +92,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 static int armoury_wmi_set_devstate(struct kobj_attribute *attr, u32 value, u32 wmi_dev)
@@ -403,6 +404,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -416,6 +419,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 71c68425b3b9..10acd5d52e38 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -76,6 +76,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.51.0

