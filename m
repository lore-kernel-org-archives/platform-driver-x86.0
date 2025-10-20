Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ECE33342C
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995085; cv=none; b=ErZQDtGbMGfRwClawnxJpZtm1U9anDyZ1EW01J6AuZZ0E9kTelC0errEmG3lH5PY8leUsLsbADj1YQJ7o2cPu3bepvIS3ubqDeTu70ZUFHvSX4fU996tnLuTBB1hVTSQJLVfA9ylPXz+iMdXsLWrH6kjj2G4b8tMLpwPCT0EDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995085; c=relaxed/simple;
	bh=IUe8CY/Lm4LqDKi0P5EID+TradzYFT1Di8fc7InZTC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ig5CA+z9+2eyE2jlz9m6uaQCKBuaMKX0DWXBEKh0oTRN88IiY4OWZOHHnyxJ62BVjO0G/9o0UgMtg3GYFgOV2+NACYBxDXG4M+/IMIF5i44waeFzCyPkx8msByD1swifF60aPYZpki/+6dJQBdWX5UPvWBEXIF3jt4Wo2mEZsx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQ9GjNb4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQ9GjNb4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4711b95226dso35733325e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760995082; x=1761599882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aJ+dhLzBqzw1XunhXi7lUbfSsyrtcVJMPwmoabXwKE=;
        b=kQ9GjNb4RtavcGil/YPFAFBr31Ac3b9u19cB3kkbkuMIVNRR1HmpikqxgVLvQj/lJ8
         Ssg6GBvLWDnYadL89IYYE+75xUy3R3lon8FaLrGCz/7ibgSvSDsGfe/aPlx0ED/Mu8Bj
         qCVk+rPksIf/RmGwQSUy6WwEtkEyxK3w+c67Y9/kQElJDPKwLQr5sannAoFmxEXG3oYv
         rN39MPm/n6GrhhlOz9PvXNnSBdq+l44j34WNphvyuWaO2YaBe9ahwcHFRPECfJ3N7ye+
         QMXTZGwHI8Su3kI7IYKCY5hO5C47xunAaaFkPFd9YZ0KQxdHDj6GBPy8pIhpAi20Jby/
         29Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995082; x=1761599882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aJ+dhLzBqzw1XunhXi7lUbfSsyrtcVJMPwmoabXwKE=;
        b=W3T35eUE1CT9eXUk2HMeIsM961ltpITtx95+QyZzjsNZfb2YLZlXyqUKwlrzEvW87l
         nVKC/i3KwfZgSfW8hHsbmOsjEhYehfzPjC7RSm7Nef52ecooRy9WPXhjLTkca+x38Dw3
         VoIJ3lzrzwjIW6caFiWk9NM1r5Fd7xwWvfJw9TL2jw2LpEinMEXWGKKaHjU/UJ9lr2VW
         3plFioVzE94dYNpLcMP/jAs2TIIOvBbJi0+DZy7yNbYgoITksNIInMbo6QRc4OlpPChf
         nhazz7kyuQPNHy6HNq8D8yPW0VJ5yZKZHTgmM9fphgJsrgfhSiNUGVPJSDJPONZtrH1d
         uXcQ==
X-Gm-Message-State: AOJu0Yx7PBqymeaY4Ulrnm1CApoyCgmyOabwfqO20vk4QTlfk29kbU1c
	jXsSgV37YmdcS0d5L87ec1eyN/cK5rZ7BA1P43kuk0RLgMzQATwFzmeBv/SgLg==
X-Gm-Gg: ASbGncuP3V9SrMDjc9X80fOCYK5e+/6JfQbKU3LC04xmYpsWzSggzsTzZ1p88sg+pXO
	4/+lSXOm3ynnLNMDsUk0ZsPkesacRwJ4Av9VVxCXqu1ANwFFs1vTMfZNhfhQMvcQA77UHOdQpHk
	GzEi6VNGdVELssEApHwv7r2lwnCyCSSR5vL6KI0GXdvMrJqLGENp4wAa7ZQrLeXEHR1ITRiBbCn
	X7z0IhjlvoLBHomv7h+XWblZ0OBPZSQcuQbARKAeCjcQUOEKvxi05FmOhiY2AWWZpEzGnCmkOpV
	5jfCsDQnNZFwxXNNTm+9gV0l9DRtku/OybXjdZ6R1xEUrroYIKg6MH7KALeYY/Q+Q4z5jUvYdQA
	Jl+gRFgZOWEsDJg7dwNpvO/5M/F2uMF+bPiWkrHaFAPdZ54cYx2YrPYpm7j3dBbXqBVLqjU4yW3
	S9rQ==
X-Google-Smtp-Source: AGHT+IE8NTSTXGy9JVF847QjoXFPJXHadskUMaLuPIb15N28TJHgBCaBwGQRppvT700gsNt3+NBcFg==
X-Received: by 2002:a05:6000:2209:b0:428:3ef4:9a0d with SMTP id ffacd0b85a97d-4283ef49ed1mr5507547f8f.49.1760995081544;
        Mon, 20 Oct 2025 14:18:01 -0700 (PDT)
Received: from denis-pc ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm17254971f8f.32.2025.10.20.14.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 14:18:01 -0700 (PDT)
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
Subject: [PATCH v15 3/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Mon, 20 Oct 2025 23:17:34 +0200
Message-ID: <20251020211740.719676-4-benato.denis96@gmail.com>
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

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index c5fe61557582..20edf4f5370a 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -96,7 +96,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 /**
@@ -600,6 +601,8 @@ ASUS_ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWER
 			"Set MCU powersaving mode");
 ASUS_ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 			"Set the panel refresh overdrive");
+ASUS_ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+			"Set the panel HD mode to UHD<0> or FHD<1>");
 ASUS_ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 			"Show the eGPU connection status");
 
@@ -613,6 +616,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
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
2.51.1

