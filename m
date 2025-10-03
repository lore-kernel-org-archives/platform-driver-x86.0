Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9F2E0406
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517746; cv=none; b=hCqeXsEzRqsNyQht3t93QYyK0WyF6Ji62P2tcl6nRTWaEDblgBtCgAsR+Xb0N5E/TjeDPiExHwdrq9DHM+iyskKNx9cABqtzgUNRgcf00+EQXBhaJHZ1+gHoY9Qztt6PnnUkulaZz1/wMyvd3VNopjxHEvUJrR5eQlEV4UCR08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517746; c=relaxed/simple;
	bh=ILfDJ8C2sxdWYXNpOmtY7mR2g5ESEnO3Ed4RU9z3cU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIjSZnUF3CC/zj9SWwZJR3F0Lz9LYXj27yaWqpFUlEAwZwla0dcvNLUF2OjOhPSX7yHgs4xPZLDSTWFShvl7iA72M0g26KiYSGfjwc/gj9PqVi96rVP2ft4/esLaz7PohS1dBHvMgpuAFeGV6Th6pwUpkoANfH6CwLFB69LZ+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1Pw1cS2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1Pw1cS2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ece1102998so1567459f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517743; x=1760122543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hbP19icpUSLNKexufOjW4sEiBEUZoEAcyKFsSz4n/k=;
        b=H1Pw1cS2mtEhZBhoTH4y7gyR6Wt2geHvb0OX19yU97kX7MaGZxp0uredoNHTutRibj
         61AVJH+bzoeK40SXKV7PkXxy8+Pa2I5prFW8FtEuH1Cy9d16aTj/zm9t6bc4uP6gceqw
         YPDRi4y7Y8bBKn8Ek51V/4v2F1DiVUP1gaVPVY/ZdDDO1PHdF46BHLfBn+R+93ZH9c8t
         LeKT0IDeNDQgPDHX8vmegblzVFlILa85q/nHjmTBcm8cuxC77wEyUYT4/WVaROF2TItD
         2TZ919oXfNEoXlM5BAYgw3/3XzJFfnGiNhHiWLlCnNVGi10ikRDYdGvnSEG7ZZt08/fi
         VsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517743; x=1760122543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hbP19icpUSLNKexufOjW4sEiBEUZoEAcyKFsSz4n/k=;
        b=d0RmROf+d2i7oqD0N5tuRB6hMVbAndOQTe+tkv/gssnEirAZPnf8MkMMWprZvj3HqQ
         Nvr9/YYc+gKXBShnSyrPGQCi1t8UsokGCS+MhU1/pEvbhrLdrjB9NG5N8KQyvrEakuFr
         c0uj2c8BkXs2GsdkH5uje1JDNnZm40ETnqFPeUkJKfdKOAxErT8NysDm3taVdxr1vbSL
         50Bu8fRppyuNtgMA6TGYDjp5o80ISf8Ysvc5SyzwOg17uENIGwo9c9Q8l51sdooRmPW2
         9bpQM0k8CGpHbw4dfEQb1GsRAIOF02qAkOrwrJrfmVznNESBd8Qc1wK7b6JbvAROBsvh
         UJgg==
X-Gm-Message-State: AOJu0Yx2jzCSwSrcDtH0gWWxPpcw/GqTFixt/IZAhEUA2BBxSdYogLn4
	QsVUQBUvUhDSro5HtV5bewziXRSFzwjd+lf9gbahk03ybj5AzYlPNCci
X-Gm-Gg: ASbGncuhznWJWy4UJn+egFWlOoYVFfAqBIantsursFeebmcN4auj8LD8q2BnI6JQKru
	7uO9ULq6nt8V1Ga48P/ypu8SB2ytp7sZX/Hf3ipi9+LL260/2Efnt3eleSpE4CvdZa7SOAjPWu1
	6kk9orzUfO20qH1TRy9pnyI8CX+kmx8mTlA7plKalDnkvIVBE1jFoxTqx7bof068JrSQEWe1TP3
	vN2u0banuL0WOTIYqzcPVEKKNCiysuc7MQn2W0bIOvcuvZfx+/vOGB4X0pz1uRjqOQHv5ZnFZsP
	Q8ePXRc54bgTnNxSKQI30RilJ1QeVX/Ja/cP03vg5EP2/90ivlfjTXq1EUv1cTaeovxWi98dFAn
	irsZsj6uikEVKDq5BdWCLCauB1XZC4DOJZrVq1anIjACZWzdvZZA=
X-Google-Smtp-Source: AGHT+IGiBk6J4kPLzdZExoroF7f2Sud2QeRJSA/56zJdvvCaylgQMMFmRb55+OfvPjvQig6e87LD9A==
X-Received: by 2002:a05:6000:2086:b0:3eb:4e88:55e with SMTP id ffacd0b85a97d-42567199a02mr2424244f8f.41.1759517743048;
        Fri, 03 Oct 2025 11:55:43 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm8946927f8f.38.2025.10.03.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:55:42 -0700 (PDT)
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
Subject: [PATCH v12 6/8] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Fri,  3 Oct 2025 20:55:18 +0200
Message-ID: <20251003185520.1083875-7-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003185520.1083875-1-benato.denis96@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Add screen_auto_brightness toggle supported on some laptops.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 4 ++++
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 4629389c4c25..36571290fc40 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -731,6 +731,9 @@ ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
 ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
 		   "Set the panel HD mode to UHD<0> or FHD<1>");
+ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
+		   ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
+		   "Set the panel brightness to Off<0> or On<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -748,6 +751,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
 	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
+	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 9a79dae97adf..260796fee301 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -83,6 +83,7 @@
 #define ASUS_WMI_DEVID_LID_FLIP_ROG	0x00060077
 #define ASUS_WMI_DEVID_MINI_LED_MODE	0x0005001E
 #define ASUS_WMI_DEVID_MINI_LED_MODE2	0x0005002E
+#define ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS	0x0005002A
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
-- 
2.51.0

