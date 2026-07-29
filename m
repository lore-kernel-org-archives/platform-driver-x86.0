Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7946AA8C
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323474; cv=none; b=FsRIN/b3kKfTmfPl6am37dvo/Mtvdjon6DEJ0rY+xJ+yqcYRTfInYNAfH0ACtlXQbkNcbuU18ZnlhZwzt6jUYKjcSuTAw6WY+YYJ8YTBisveTtChaEp4pM6bV37OTiGY+mKZ0KGtzBJTcHmekqxlb7nhWZDkHngJNdnT9taU1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323474; c=relaxed/simple;
	bh=uifaPCiKYm0yhBvGk0F4llBgJGWntVU7N2lm5vq1kdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L2epWyTTSMlQrBRh2sev/KbIb1FW/UTW7ABIhPeKd33c5Q+RgsCexIuxmUYZQr7Dfzhc468pMpMwJkzkiYSHeV4k8oB1EWqaPWATfAjx2LoWHyFG4r8Xvr0TeA2bkc7mRL8LJnCYi1wc+AbJWi6uXp9jlpq+JTSg4NnPXatHNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlFK9YoU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlFK9YoU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1292473f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785323471; x=1785928271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPtP1NqWYwTnSIvIr4pNCvTS2/zEpyvN0d/cS9WuDB4=;
        b=PlFK9YoUpeWwHUtlg1PyRV5OM3yVC8L0ApcQ+JOZxgCWPXpAtL2lHLC7GwgN30o1nz
         D05sLqtVJz7jLYzKagNYddhC8UTpWlsOeT1fTavP95GjxitVtSVJG9I+S3bwOoOKLztE
         GorXL851Kj+g59E0SfnizFqnUPEiUAJTh8SuHMM5af5LEpZb6WOBz4uTU+NbnzapCi0t
         gzzMijjK2FqubbJqr36ihUIoBlsVhrZgPZglRwFRPSGDWTInqXjwwp08/l0roe50uqAI
         kZM02siAsM+Siju0rS/WQp+S1dCyQxlAL5yMh8NB0iHTPGd3h8E4w8aIpw+fIGo4Te0J
         RXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323471; x=1785928271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPtP1NqWYwTnSIvIr4pNCvTS2/zEpyvN0d/cS9WuDB4=;
        b=BgXHbOtf4zn5TS4Ou0kE1vup3Q2KoADUUS4iRCUUBcL5Sztnq5B4q0FNS+PPASAlUm
         stthOv7rGG3cAscTwFAzTEfsqt2Zjv8X8o9DY7B3PhRGv6Ig+ygBw8e3GZO62a+vqRgg
         w/kKKU0yGZgo/zcJvqxMfVdlLKXLCEJ3ZYDC1vvrcYsQpW5wccS1OYXT5mwpHeEfq103
         JarWz6LRRum2Ud98e6SEG9fuaeGwDrUT8awQCw8kqureTtf6Ssds777xfS7Zwh0Lez/M
         9jBlHR5C9q6ckfgnxjAEBOLTSdUwCOlVOSygVhy422RHM0I15ZiN4JZbrALUUxeI3uig
         g7rw==
X-Gm-Message-State: AOJu0YxU8q10/FuEPVmQjj3Zlt52tInPJa5w0hbHAdxk5wOmEkJjBfjp
	O2m70E3dr4B6WRWaDHC70Skopi1l4JQi6pVRU9J16HOzdj/59FM7dbhaV1Xr55h7
X-Gm-Gg: AR+sD13zojPfeSNr+ioaZGcWt63uZPF7Cx3FJHSnBRpET5hHL/QXRp5PyQDl0Ta/F6a
	Ub8q21qO6hwroCF1X9l1lDO9ZgcOL8+NKkuwVTXcYCbD1IHfegoT+WW5yyFEuo1hZPND9fc43xT
	c7qDkKwx2QWx1WgsmH2ajncmOriTnNciO52r398/KYq/hF4kviqVTR/P8HqPzFylkj3y1YVI52J
	N4/12Ggt0UVkNt75Pqneu+6e88pcva9CWWU4fauyonMRXXoiDeO3NvXRnCOEhs/3XokI0jQFa5c
	gSKEyP6o2fIYsWJazlKEnGqePub1hkGbzg9SiqMbwDK1VWPGUyu/N1ha88viI1r+pYqwES9kTA5
	ggs/fONPQehLJrendV+LDr1NfPWaY93f7cuTgt+wnffRTmL9P7gQ3+S2hLk2gnnIkj8TDpOexPa
	1hiXdj9vas34penocIXmZkZmoAJJ2aQsLsbMO4NVfGM9su/V8j7D7v/XUAFCsUNPXo
X-Received: by 2002:a05:6000:184d:b0:45e:dd32:92fa with SMTP id ffacd0b85a97d-47fbabd61b2mr2532533f8f.12.1785323471001;
        Wed, 29 Jul 2026 04:11:11 -0700 (PDT)
Received: from tuf-arch ([197.52.134.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7483101f8f.18.2026.07.29.04.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:11:10 -0700 (PDT)
From: AbdElRahman Soliman <abdelrahman7987@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AbdElRahman Soliman <abdelrahman7987@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: add support for FX517ZR
Date: Wed, 29 Jul 2026 14:09:41 +0300
Message-ID: <20260729110941.26794-1-abdelrahman7987@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI match and power-limit table entry for the ASUS TUF Dash F15
(2022), board FX517ZR, an Alder Lake + RTX 3070 laptop.

AC and DC min/max values for ppt_pl1_spl, ppt_pl2_sppt,
nv_dynamic_boost and nv_temp_target were read from the sliders in
ASUS Armoury Crate's manual performance-tuning mode on Windows for
this exact model, since ASUS does not publish these limits on the Web.

Tested locally: values now report correctly via 'asusctl armoury
list' instead of unavailable, and Dynamic Boost via nvidia-powerd
measurably raises GPU power limit under load, consistent with the
80W base + 25W boost = 105W max TGP in ASUS's own spec sheet for
this configuration.

Assisted-by: Claude:claude-sonnet-5

Signed-off-by: AbdElRahman Soliman <abdelrahman7987@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index bc899bec7..46c308ba8 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -975,6 +975,32 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX517ZR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),
-- 
2.55.0

