Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574072FE586
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492988; cv=none; b=qNqPQl8bJUDdCgut17hJyQ1W4u9HS8KA+BxbEsTQ6D2e1Wre3buPR6iPP/qvHFYLEtUXcoef12NyA3YxGRFk4JDIdrbx/f2vMa1Vuv0x66dPkzuBUxKX5/+SuyiLKdviYJXWGF/+AONu2qOiqZKEAMkp0oiBZPs/GTs4XCW4zSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492988; c=relaxed/simple;
	bh=TbswgXQwCCTmzsX3hGAnNwHOzR/5QSN6bjAPmQkfsmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEwo5UwHCONaejL4qisYkZxWtMm7ukCQaVZNuwjsClEQEwzc76JAy1HBUwZlQbfynWybRUY+3eoxcNbQqE/KurN6CXainbTYciAEqSUEoJcTY9zYsGiUtOMffoHVZkPsF0JTBD8XbsGJ9M7gAoKp0+M4G5WSEkPJ7ph0YteoQOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zwv/AYzJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zwv/AYzJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-421851bca51so3965797f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492985; x=1761097785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txV+xh/18MrOzYRQN9sCc73WlopP1Drxah2geRIuTgY=;
        b=Zwv/AYzJjU4tK5bsCzXsY4jAfptjxWTsyWmLcUYDnjAnVwzGrMp0XoIw2pVeKERKbp
         UW40OBcfsa/9t7YXIL+s5iGi/gOueYvXSplUnahf6GeDLrLTPA5Bkh/wYqp5LNBfJcEW
         C1DNJxyrlP1qaI3YHpvWmO9I1mAFRBdw6vwXhzjMqOmstqJwpXmf6Zh8m2x8pbogZ5oz
         f8yYARBqvuxTILUqMraB5e6MHD8a2fAc16Hac576Vw1MdcngfCG4Qkyw4qME1GlnBeTu
         lJY/kcIgwDsPNXiH5h6Q7O57VLaotQHrGSkMbAL35bdKRr6SsLuA4Vbz6dFP3+osRE0D
         x9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492985; x=1761097785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txV+xh/18MrOzYRQN9sCc73WlopP1Drxah2geRIuTgY=;
        b=qNmmDybntaZUbqUc5zyIU5P+SpGA3CEb9s9xUX/OvIf/lVTv5S8LT7e95Rr5hgPydD
         ix+0TBvy/vLhawkoaNKoLbhNxs7oPhmycQNPsW6IJV5t8N6vDtfng7UBtrsexOQn+FrC
         J0j2kkbDXE2lgjyHpm08rqSSzYAXvbE77N7wAK/f8oyjDmOGh/pBKarTTUWAr7hEPbR/
         UeK5ro8PR8QFiUsO0nLJCROLPEiHhzMGzoXztnUspJXpwo4U/cU51LbHYU2/qhNHMMcI
         Scdh9rC8exAZHECjiIYQU7L0HNMBWP4BcKfy7Ps65I+JF9c+S8gesMhN3yiz6uQPp6cb
         iP7A==
X-Gm-Message-State: AOJu0Yy4+54yhPb9klPHSp6cM7/fYrXTn0KqLSr3iXCABRBkgCqLwoBn
	uS5jWvyZ6GXZW+DmaFnPNNSd8irB2g9uaQVwokotMPVYnokrWJOHVR2G
X-Gm-Gg: ASbGnctuYYZQh6lLukJxY702nF0SihenXvpO9zY7TzaWxmxOdzwPOgqH29bu0VdDBU3
	B+evhTJlIYnR8Y+79Zt7O095LYmAUjRZLRCzEoVQ0B8BFY0Zui6yUDEQBhqAupx/p/ii9YgFc4W
	QfTA508nkCFSOMV4/gBtA28DqwJvorMMKyMIdtN41/V8z7kLbhebxMOJKqFgOD736yiOWtVfouT
	ASE87rkBu+CMM/xB2qaj7qrta40DOvFxvYkkdEaOzsrBn6yhYZHYkGWrqa8KtoZNz3ZA3mnlJVB
	FOqaPoFHXpR5olPk6aEQ13VhLnJqlOMZ07n8av5iCxNrnxum1fYxohb4uRFFgpK0t1we0+dQOHh
	VyeRkVgd2WPRcsy2y0Zn4IGXHM0NQOGwW/IrtUPo0u14kWw==
X-Google-Smtp-Source: AGHT+IHF1sWPjvUGu8+8OrodAM8EEtHpDXES1qHmreRu52tK/mgqLAQMzqFl56vD3PWEl1xGAsxgsQ==
X-Received: by 2002:a05:6000:22c5:b0:3e7:5e19:5ec3 with SMTP id ffacd0b85a97d-4266e7e02dbmr15880705f8f.41.1760492984520;
        Tue, 14 Oct 2025 18:49:44 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:44 -0700 (PDT)
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
Subject: [PATCH v14 6/9] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Wed, 15 Oct 2025 03:47:33 +0200
Message-ID: <20251015014736.1402045-7-benato.denis96@gmail.com>
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

Add screen_auto_brightness toggle supported on some laptops.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 4 ++++
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 3d963025d84e..e27f964aebf8 100644
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

