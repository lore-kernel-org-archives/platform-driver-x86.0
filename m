Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892FD2D2483
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378767; cv=none; b=dk0SYK/FzTRtDC7UgiS0OTHb/JDYqKhWpE9IkHEojVoFW9UzBkZouHKSICP88yGv55mVNTSzb4GspaUfNQDPABZPwfWcGKO5B9ifnaJXLXBO40RTYmHuIm50z2QrSQ4NHD5cxOYa3SX5tCglgueyH2Rb0ImjklLyUD1DQHihRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378767; c=relaxed/simple;
	bh=TbswgXQwCCTmzsX3hGAnNwHOzR/5QSN6bjAPmQkfsmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VK8QkxqplBKXCAcwChRwW3q0YcHdd1EuD+/arm0Uiel5cl1MmyeGPbXRALxLzWTnyvT/CQX3BrUvL2u71MAlIbVus+slWDIImwYb/iM+wRS10YnAyALDXOaZjYZvFtkyoxGS80nwfalgFp4RtJbq2WzTFTEbIwq6kujqbv4DDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSjS5rCj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSjS5rCj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42557c5cedcso2442079f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760378764; x=1760983564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txV+xh/18MrOzYRQN9sCc73WlopP1Drxah2geRIuTgY=;
        b=FSjS5rCj33mirLI3LPJg+ZZIXs4puMXe0d4x48SQmr/A1+FRYRTe5JdziokqUTuEth
         Rkx04uYg0AH60ZGFQetO0CQDijs1c85aQvG5pNASTkYkR8HjR5S3orNK2/pXavtiyUel
         ezy8CZhmK8VXPJS4XeCpw7PM1Bd2lRpQcnuVagcDh/cJAPb00G1WvCxH7n9vBtgtqJ3q
         xdLKH9wjJ1BxUeBxPrZ+79hwnZqwQqXlX+BwtQXKQFz2YA5/cy6sS1orkCmhQku6B095
         ayGUW6TJPUeX/+F0eYlsQtONuvvCxnR78B4bS6zN8md9MbYnVO529b+Wbtx0glUPP+Ll
         0MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378764; x=1760983564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txV+xh/18MrOzYRQN9sCc73WlopP1Drxah2geRIuTgY=;
        b=LzzzRK/UxqPaFQbx758XgVb4lSxsTG3En5OX7MaeFP3nP8OC2/NuArYdDCjao3/Jwx
         5PFGWPE6ocSV0ihQBZWotxFjntWGy9FzIeBD1uPbZSrAjo/zcefLfEMmz5qAJMMj6RUE
         dSCa5UKOSTu0yhO/Q605A1R7fzxOB7IxjrZOc52j0BQQefWsOLR4cvTWxKfSMd9ZufZo
         gbVa4whPcWgQkDxuU/vsCYr8DMMcn+LgQgHyQ3iIV6DKvgKBc0Cc/pmfioMvIm7Gg7Yx
         uEkWomo04AeF3EuMfhi1EIX5OWMyvMArbLyXo+yjqJ04qP5FWcr4ajZfge8ktySe14KU
         vD/Q==
X-Gm-Message-State: AOJu0Yypl1bat9AKbfZahDFBBfaJhGqd/UG4A15QO57ZCUVWOWLC3hBY
	13NZA/UjRgs2hkEbcJWqXboSg13MCLHB6302qG+2ZquxdiMzyzC+oGnn
X-Gm-Gg: ASbGncu2DijASUYRni7TlhdpPUCfyj+h7pZVwkz7MzpfqWNP8V6GzLJWP0uT02JK2tu
	tKR5L+HG5esJep9xeHDa4BALUY7LBkef6QhR7T2QerUocrcba2oOS4ZNemt5eBaSmvGWJkWdUrq
	sZYA9H7wzsXWcbnv22/jMgMJiQTC91c2kQ0f+36LWJ7TpFh+njegoaBnvbNNO+dp17JvfNqIiCc
	ZWGDBHynkMhgNoAbNjoXYdRcay/5MJgPZK8tky8OE9I6LDR6MeKgpsb6pGJDhwxOEZVtXPcZeNS
	+uYnjP64mx2uqGGhD95SyugfPJBs6QIOaRVLLa4d92qthXM9WP+vnlog4LMq/cKcdU4pataEQst
	vuOsr6Nn9IrpJCPRhjUhdYSpfhOqv4CplfwxgKB87ITxxug==
X-Google-Smtp-Source: AGHT+IE2I9xORwtrK2Nu7nQ1GfoRfwgnIUo+IlSIPD1ojVpvyKYovXwUWxmEbOvJzHN2uTTqI/lKzg==
X-Received: by 2002:a05:6000:250a:b0:402:a740:1edd with SMTP id ffacd0b85a97d-4266e7dfeb4mr15484754f8f.39.1760378763722;
        Mon, 13 Oct 2025 11:06:03 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm19933428f8f.24.2025.10.13.11.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:06:03 -0700 (PDT)
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
Subject: [PATCH v13 6/8] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Mon, 13 Oct 2025 20:05:32 +0200
Message-ID: <20251013180534.1222432-7-benato.denis96@gmail.com>
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

