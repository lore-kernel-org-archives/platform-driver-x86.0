Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358FE3D9041;
	Tue, 28 Jul 2026 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223149; cv=none; b=hQrdU4aWB2+rM7RfwHDLDnbYB+M3ZFHq1w0UxP404RLtawXTdF15GYSqu3MlyDW72ih6aQ9Lyvf7OXqdhfhQ1TxEFQTz7NmylikRRc4ZxFZJrbNxW8EZhEj/evgU0Vn9mr1KTMVXFT5fMolMJcwDs8QWlpymlYaLy1P3JOyPh5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223149; c=relaxed/simple;
	bh=AgrLh0/6flD1IOkS9tzMdh+uasVAWhc8B/qGRjw3dAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5gzelcvxllQcWFOpdMhEOBzkM/iaDzGo7YH4z9//3XIjI1iNqeBjB2m8yfGHOCOW8cBog29V9fv+ZJktjdWcS9UKsMcv+XzoosAgqu2LSQtzTlz7kHoKUEQkvHzbg9T0OY0mQze6RwvSUj4isOvuAzvL/L1vcC4SHHjFs7FJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OrS61pQO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OrS61pQO"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F410F85847;
	Tue, 28 Jul 2026 09:18:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ShGTsnnFKEP; Tue, 28 Jul 2026 09:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785223139; bh=AgrLh0/6flD1IOkS9tzMdh+uasVAWhc8B/qGRjw3dAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OrS61pQOLczkodD0FLtLkAYED3ooHpDGNTEZaw0Q5ArsaGKjktWmbDQuVUVj5bKE4
	 jnhnFxiu66yd5OK9LYNvwCR19XzLBZxhWkM8CGQb3bKrJlPB3d6S0InAfdCBaZhMFk
	 nYyXLpURxZMrQFBbdq6x/XOB1lS/gTmNVhTG0OBp9fWtAvQCvP4oRjgXd5//NnFmCS
	 jCnRbOZdEKiaNBER4eMGnH4GAFixMWgDTKuUfl0ycJXJSnhn5HTpztcr1ek4nFJkEP
	 nRlRABMdN8cfM8AwgOuGGPtAB8y6dS1Ol+Sm8ImIyQyjvk+0ei2RhSIkJjspS+izBA
	 ZDOaHhexxaV6Q==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 2/2] platform/x86: asus-armoury: add Whisper Mode attributes
Date: Tue, 28 Jul 2026 09:18:39 +0200
Message-ID: <20260728071843.130492-3-scardracs@disroot.org>
In-Reply-To: <20260728071843.130492-1-scardracs@disroot.org>
References: <20260728071843.130492-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose Whisper Mode sysfs attributes in asus-armoury.

Certain ASUS laptops support BIOS Whisper Mode acoustic profiles (both dynamic
control and BIOS-level toggle) via WMI.

Add helper attribute groups for:
- whisper_mode (read/write): BIOS Whisper Mode toggle
- whisper_enable (read/write): Enable Dynamic Whisper
- whisper_status (read/write): Dynamic Whisper status and control

And register them in armoury_attr_groups.

No functional impact on existing sysfs attributes; only adds new optional
Whisper Mode attributes when supported by device WMI.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 93d9665717af..398b81f15aac 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -805,6 +805,17 @@ ASUS_ATTR_GROUP_ROG_TUNABLE(nv_tgp, "nv_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP,
 ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_DGPU_BASE_TGP,
 				  "Read the base TGP value");
 
+/* Whisper Mode attributes */
+ASUS_ATTR_GROUP_BOOL_RW(whisper_mode, "whisper_mode",
+			ASUS_WMI_DEVID_WHISPER_MODE,
+			"Set BIOS Whisper Mode");
+ASUS_ATTR_GROUP_BOOL_RW(whisper_enable, "whisper_enable",
+			ASUS_WMI_DEVID_WHISPER_ENABLE,
+			"Enable Dynamic Whisper");
+ASUS_ATTR_GROUP_BOOL_RW(whisper_status, "whisper_status",
+			ASUS_WMI_DEVID_WHISPER_STATUS,
+			"Dynamic Whisper status and control");
+
 /* If an attribute does not require any special case handling add it here */
 static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
@@ -828,6 +839,9 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
 	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
+	{ &whisper_mode_attr_group, ASUS_WMI_DEVID_WHISPER_MODE },
+	{ &whisper_enable_attr_group, ASUS_WMI_DEVID_WHISPER_ENABLE },
+	{ &whisper_status_attr_group, ASUS_WMI_DEVID_WHISPER_STATUS },
 };
 
 /**
-- 
2.55.0

