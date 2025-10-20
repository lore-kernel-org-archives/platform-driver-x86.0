Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A133468E
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995089; cv=none; b=eAeHExXGClXfyvSRY0luBO+4guXoRi6IEy9ibeyYx32eVKEVzS27zd+G8W3OjjSnmii9iAoVoavjuwTo4wQt9Z8skN4fY3HiGES/cF3sWUfoR0OQKnpvWroEeS/qx7J/sXKBv9yESoPqwYgtEd1gpG0dfT19cBudM/BjZX7UhHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995089; c=relaxed/simple;
	bh=XUIu0yJnHpaU6yDdK8itrBMnaI+TV9U3pUj3pDx3pJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PKDMb+LzTuCt903Q9wTqjYJRcoVy3wm/6aSzCQzUCNg8OXIGaBb5ERf7tn7HbJJle+W3SRdgwRoAgC/f/lMHnYtQtXZ6zas0DTtR1oJdXkI11fZN0uYt0fsvDwr3dw9kf9SCxclqb2hQnrWwLSNhp2dokkFkIVcEUlKrgFUPuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsW6037G; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsW6037G"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42701aa714aso2963896f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760995084; x=1761599884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwTqeObnVu7J9XjuI6EE7KOvq+Bo0IM3TssQrG7nZcs=;
        b=hsW6037G0H/6Bwk4ELAhJ6ArlGjP64qt91Uftqx/BV1xp6ELwiTxQgu0aeF2IdW+yt
         IxJFnIWQWL7NsiB+y9wSAnFerb1OJfJJTT5eliKWvxK1wWgqh1YBGfX2trlbugO8KzXK
         InM1F8vgqcdCL6y99DPGlLvdqV1vAqnhOY2RHaR8JjSiWp/vI9v7xDrdtp9U1d39PXp4
         Lvp5iD+NU4cN+nAmwV3iK7WrlhH6+o0YTHUN6ix9vR4J6O7JgKYjwf26cHrOqSHCA4eh
         19eux9IU7TiphDvCdwspBCKH8Xw44EpMB1oM646WO4SeWEQjzdVarZ/+09pRXiPCSk3I
         QLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995084; x=1761599884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwTqeObnVu7J9XjuI6EE7KOvq+Bo0IM3TssQrG7nZcs=;
        b=eMEFymFUHcqw19iByj/pgr4KEoxfYaTD/AaS4FyEsAcJnms3DWRj1vSDOXFEwuEBSS
         5PjH9pULSLqiC1naLNZLrojl6D5sr6y5wFmY0zgYgjyyraPKKziCX54DijIc77pIWeNp
         s2nZptxUMwNIBKedw1ICzMb6hxPuGEsb571082NF8gulbit7515kc9TRzRIBoe5+ZRdJ
         MWc28QoszSDbaC3CqyGBlBilDLcy12n7WuGKvvk4xz7U4l2o7ORLOeCDW8EZWmnXCLqF
         xrcpgnlQexrQDb0Ld1Mz15gRHN6A449eySqC0AVSaKyE8QMJoK0LYADLj54PRZ3wvEs+
         CfLA==
X-Gm-Message-State: AOJu0YyXY80Mv3VJpxxrTc4AysWPoEkj4owYQ4oOEmwzT+4pYjHuhF+p
	ciptbf8En8jcsxbzTgh/hrlFc8LtUsJyoRWMWS6X0EBbmwR3+idmOSp1
X-Gm-Gg: ASbGnct/avsvungQvnxNObPHOv62+m8asOruhqFSfBMvD+bMyxRFWt9bsomMh262joK
	3HfG9KcwfxaekAwNsGdlEtmHvV2qaXfAFK+XESjhrCFqZA1H4CgHbaRvtizFWQMLWzIcR8qszlh
	CWVTM8Mj0KFpMqUtuzVmXqfReaZc3VIAUWVxPgf7sgNnWg4QjMuxdVFx8LiASoFD+Mc+ISiL0Ve
	SjSUwCBjWVFEQqAp8PGH1Wgp/sXPj7RPVsxov9lYN5UbAxVzYw0Ak17z27WHDM5d3dsRQgG51hN
	0cMG43KZRWUbtsoROWNGNDE8UbJQPE6mC4mSfTnnykcTlEArRkDAlrRtnAIWH/T1YnzmQMQ6ke0
	LhVYB/UKZZzGrNqr54Ut62leteHXLvPXO0NvE59SQMUouXpc7/JBh+mPla+voRN40yp3PXPd0MN
	qJnw==
X-Google-Smtp-Source: AGHT+IHXxMB4sBPgdin50MXV16gbM2Ll2ndbqdYfFYFfHeqqoCq18H/JYaaUfJYGYOeg5+yxdx0sbw==
X-Received: by 2002:a05:6000:3105:b0:427:64c:daaa with SMTP id ffacd0b85a97d-427064cdaecmr9779376f8f.44.1760995084428;
        Mon, 20 Oct 2025 14:18:04 -0700 (PDT)
Received: from denis-pc ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm17254971f8f.32.2025.10.20.14.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 14:18:04 -0700 (PDT)
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
Subject: [PATCH v15 6/9] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Mon, 20 Oct 2025 23:17:37 +0200
Message-ID: <20251020211740.719676-7-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020211740.719676-1-benato.denis96@gmail.com>
References: <20251020211740.719676-1-benato.denis96@gmail.com>
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

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 4 ++++
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 1b34c929a0b4..63579034756a 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -968,6 +968,9 @@ ASUS_ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 			"Set the panel refresh overdrive");
 ASUS_ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
 			"Set the panel HD mode to UHD<0> or FHD<1>");
+ASUS_ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
+			ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS,
+			"Set the panel brightness to Off<0> or On<1>");
 ASUS_ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 			"Show the eGPU connection status");
 
@@ -985,6 +988,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
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
2.51.1

