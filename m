Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A170F35580A
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761829421; cv=none; b=KhdAXe/iZolHMA7NWalIKdQb01D/mNGT8+xz/il8oxg4jNEFri6WKF4Oj47niWgYrao8UTsCOdAK81m9vvTNFDOO/a36F/nYBaZ/q8xwyHn6Jr0r3EpTTbbnJuFvyd8prDTkEgUfMX1QIytzKtYLei5JFcx5QYzzjwgmW/9Yt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761829421; c=relaxed/simple;
	bh=UFK/Wv6hbq2X5wCZfllsGSKL+KYirf6JGa56UZSm9UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qc8IbOmKcEUkp1E5uos7FNAitlrtriMJab2EpxzdiKcL4+NOOhIjqQWsy4TYWg+wHLHnR35qqYs1P0R1Qyp7sBkneleYz5/w2ZwLrrRN3X8UmblQs0bhoKZp9KS4/lbdBTF4HvoZ+IKGINhK3f5NMk3wb/7dYCpW0nM1ceyuFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O1GgaEeK; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O1GgaEeK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761829417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2Qaadxwq1PoE2hU2NcVxogvqUvLM9EBOTr9yOc03eY=;
	b=O1GgaEeK9JqLUt1+VpLfgmOriLZzFcB19txoRVXL7te9h+xUaesyMXS/nF+0mOSfuIOBnk
	mdu2e05+o0CinGMDX5jJIfbTu3P4TkZXn6/irJwlfTekcbQeMh+Zq0kZ1XFIUqSw6HczVn
	/Bt3CcxGfJ6WVS+1JSPmZnpVsXRbuEQ=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	porfet828@gmail.com,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v16 6/9] platform/x86: asus-armoury: add screen auto-brightness toggle
Date: Thu, 30 Oct 2025 14:03:17 +0100
Message-ID: <20251030130320.1287122-7-denis.benato@linux.dev>
In-Reply-To: <20251030130320.1287122-1-denis.benato@linux.dev>
References: <20251030130320.1287122-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: "Luke D. Jones" <luke@ljones.dev>

Add screen_auto_brightness toggle supported on some laptops.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
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
2.51.2

