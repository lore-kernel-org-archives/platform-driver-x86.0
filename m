Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EE62C3251
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378764; cv=none; b=kcnNv7xFzYsiXxowG5X10d8e8YvPU4iqZfawR2qmFPhP4vW2vc97k0fHOdT3+QVxQd8Bn45pkeWRUpSlC4tlPz/GmNETNq9yZ6Ct69zL0xHC5Gdbi0WCtOYSsumMWGnPnYH4xLfY3JHQDPAigyxBipSdJimQV+RawI7Y0zirS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378764; c=relaxed/simple;
	bh=JCk7VqzZDm0N9em80Jlh9Edcp6PBHzBN9/7plUWcVDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAMfiJw7z/OoWITpGvCwYQ1hmpHQHooVDeM12CacAjW4HUidv2T1NK2/lIE4R/62VfzckSpLgfj0W5DpZVZj3MNUZ2HiNXkeb4rvcVyxkSimlvACUETmh8h/fQvMKLq5woC+/eV5sWECbtD0Ne4rgQCfRGvnc0IF4u7RTMpkRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NexCQi08; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NexCQi08"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so2633419f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760378761; x=1760983561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=NexCQi08x/FZYSZa/mtyE2svonHF5EeSUFD9AF5lvHTXmv7fLjwRyKyuMMA0wTYvwR
         qVfEr5lc+6485J4k+RQocrwiB5Rb0GfKVNZknA57u1yZTJlP7SDMygvmbxDfFI8F11BZ
         4Mgh0P+I5rX1Wdg18ACHtbjwyArmJRgqNgQDC3hGOhV0Nb/tIfKUagnbs5rmCkXnf0rL
         EKFJH+wsO/usu46IvKv9DH7MSXt2N3GuxBc3wM0CllhzYP0GcyGoeG7Fe+SPUzja5U9f
         GThbZsG3BR5OptyfU1nq0zYJGrpKMcby3qLiwsjxL6od8f8n3GtNiLO+aqDkiNiamD81
         TBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378761; x=1760983561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Fxy/cL1NOLAJha530jz1vfM7F1ZmkTYxBgTPvWr6HI=;
        b=UvMBbZJLxgcTxeEbs6Jtwi9NFbtpHOAwDRhOQqX02ri2Of1ADmGpV1szQ9HCFXNkpV
         zwOSqstnp2vmVCSpj6cAuy6Y7lZCwo01kdWSa0K0n54n/l8IUH7DfyrQyiiQfs27Msns
         4s/I6kOo3/OPQRC+dzQmYK5n96jnchn32bVhxtFBbIszbCe0Wv/byZJkR7Iz2UjITXWh
         b94UDm6IGnzLfQktPL72VOklbLlT/VTd1BIvQS0SJsL1SJZfRBn5ewztDaYHS6BKiQCk
         xgonCqAb+zLqh89fXmH7hq+S1s+EHe/xurvrqJRSUuk7p7ctf/wWD4WA3Z9fyrrMxF1a
         MRog==
X-Gm-Message-State: AOJu0YyGQyBzED2jfUCLJcZwHcHoFLu3wKkdTkl2GFhlxPRzTFt3qVsG
	NWOiHmSkPsL4FdV9TrANrHA9zKh24kVyNPSsqKbg0FW8nXzgFzPGiNYU
X-Gm-Gg: ASbGncvu5SEQhK52ws4ZO+L/5nyDfaPd8dxTe5YgbdXHNgtSvreaDi1R2uqJzXeGbSd
	6YUfaD2lJ/fThfZJGMLOhTysu2VkWz9IjpMFH/xS9GXcvvMi9jEOmrBFaaMJPnnYiPEYlep4l0g
	0v/ApgnbOV6Z1wgQUQpyahLcFc7F89LpOE49nX38Xhu3ItJS241vitSH078NcH4g/kPQVOB5osv
	bTPoAOLEfnPjKz6Zs0TYLdBxRzIyfnqA/h4/Zh5F4wxHVRd/iFSbNJj7WCfppugmt+r6cz+iOiD
	4XXgq9W9n8qzXyMDA1xAXcNmeo83TVuedsKs5SlfT2MuyQC5/2385dbvVUUjwpkYgnlO+C2d1Ms
	i2aRcKJ1MKBQBIxWlhG3961mTLvMSjzvMzlDLUnrGofP3J5fBgPe4/e9T985jOaAH7Q4=
X-Google-Smtp-Source: AGHT+IE/Piq4iUI2yyiBoQ2SKW8waFEfQdsOU8j81sEVmDknFR04+8+MVQjit1d6dVH4bXCYkY18vA==
X-Received: by 2002:a05:6000:603:b0:407:77f9:949e with SMTP id ffacd0b85a97d-42666ac7026mr13525477f8f.21.1760378761225;
        Mon, 13 Oct 2025 11:06:01 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm19933428f8f.24.2025.10.13.11.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:06:00 -0700 (PDT)
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
Subject: [PATCH v13 3/8] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Mon, 13 Oct 2025 20:05:29 +0200
Message-ID: <20251013180534.1222432-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013180534.1222432-1-benato.denis96@gmail.com>
References: <20251013180534.1222432-1-benato.denis96@gmail.com>
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

