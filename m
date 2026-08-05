Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714173A254D;
	Wed,  5 Aug 2026 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954719; cv=none; b=rmFDvDcDJWbGBd7x5jUMyDkFnEzUwDZP2QA9iiSw9WtBBB4Gi+aKLW0pQ4aL1G/U+2sHnYIJhfGdqCaIDMUNNW/GofHA4rCVkqoLkqF4TgJ6pJKG3zcLO3o3FCkXGZdPjuwd9pg+i2x4sNbLRhPsiGFfuHQ1LmF3Hi5UoQ6rFTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954719; c=relaxed/simple;
	bh=rkp5LBes3zlk0gX4asRgFgJIKzIRzcrn6/epkt4x4ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoIKQONO3vy+4UzPSBhy0MbM6u5BXzCUY72LcbrvGxACMVLY9YuxPkNYK05riYL/SxQNOV7zFQly7BZkOYMPrvViVFm5IosssVmpWpUnWI6qXOJe06Ff1AKNUfm9lem55ZBXeC/L4PaRaxCqMsM9FcPIy3VAwFOOZg5Atm0jOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VjpmUrwW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VjpmUrwW"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 19FDEC2972;
	Wed, 05 Aug 2026 20:31:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikZn9S3hmXgJ; Wed,  5 Aug 2026 20:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785954707; bh=rkp5LBes3zlk0gX4asRgFgJIKzIRzcrn6/epkt4x4ZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VjpmUrwW/oWoOd/6vuS0XXTRKYUB6JsLmGY/SaJ9zAwuD1MKbaZIShpMGrf7z3ikk
	 Y+ACBjFkRYpr9t3RdNPnMPX9Li8a3RR54zisUhDgOo6jk0EGFUho+qaLtmJerza3u2
	 Pxvl6aOtuKjdKb8g6bILtotNSTdZCyaOpdkBtTtOHyK/rOiH7D6TWCPOrKox87Ebwu
	 2BLiSclVqq6kJbSHY4Pc4+AjprH2hIa5koXz9s0CJdFsbZBww5TaP/gw035Hj6wsn4
	 a5UYd8C02MDv88FEbc1KkqAnxOUZhzcEKVFAI/hmxDn1lw5fMqd28/6tEBeRruFKmc
	 zur4+/7WowWRQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 2/3] platform/x86: asus-armoury: Add dgpu_power_state attribute
Date: Wed,  5 Aug 2026 20:28:07 +0200
Message-ID: <20260805183131.3075-3-scardracs@disroot.org>
In-Reply-To: <20260805183131.3075-1-scardracs@disroot.org>
References: <20260805183131.3075-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for WMI device ID 0x00120097 (ASUS_WMI_DEVID_DGPU_POWER_STATE)
in the asus-armoury driver. This exposes a read-only sysfs attribute
'dgpu_power_state' under the firmware_attributes class to query the
discrete GPU power state (0: D3 cold, 1: D0 active).

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 93d9665717af..f745924af8a8 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -786,6 +786,8 @@ ASUS_ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
 			"Set the panel brightness to Off<0> or On<1>");
 ASUS_ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 			"Show the eGPU connection status");
+ASUS_ATTR_GROUP_BOOL_RO(dgpu_power_state, "dgpu_power_state", ASUS_WMI_DEVID_DGPU_POWER_STATE,
+			"Show the dGPU power state (0: D3 cold, 1: D0 active)");
 ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, ATTR_PPT_PL1_SPL, ASUS_WMI_DEVID_PPT_PL1_SPL,
 			    "Set the CPU slow package limit");
 ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_pl2_sppt, ATTR_PPT_PL2_SPPT, ASUS_WMI_DEVID_PPT_PL2_SPPT,
@@ -810,6 +812,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+	{ &dgpu_power_state_attr_group, ASUS_WMI_DEVID_DGPU_POWER_STATE },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
-- 
2.55.0
