Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B98F48
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 02:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766631191; cv=none; b=qQCgoVkH9Es7mdSdPbNRY/T8tZVvhYtKOZn6pldoeWYBcsC+kT7dsPLTDRdrFH5Gc8M09CdtCAQIMz0tCVsxduUBPCJbURq+xiw0inXK/Gta8oz0nhMfnPvYONuSXim99L0uJ4APxRj8cLKkuNLvg/p/wwaHR9efyYiu9kogf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766631191; c=relaxed/simple;
	bh=c7Md9oSmcjY2+BEm/jBq4SHq4Vq0DRQdOJjrjqVzH4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSpA1lTTXEAbhd5V8/H/s+buUP155a2sZ3ONU+B6UvAVyXVpK7BfrLbTd9dwX2WNnEXReMM6cn4v2dU6xrLRnnadMhmK1i/+/JXd+5SeJy/3n0kShjMC6jbbOXOaN8PKBnN/Yl3DWM4PRPb2K+r64wZa5FCRxH2w5tM4HtRUkjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PBxFLJnM; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PBxFLJnM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766631186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u24y6gjcAX+Iq0jDwE2IF8tDLxBMC9XjBD3YbgOfHOs=;
	b=PBxFLJnMUfvDYYsE3Kq/DcHIGCa+YGC2pOlkhQ7jebypp7yDgwU44iRb1drj0ZNCjCf+9v
	RJTHEnDzYNwH5YFs+PK5NQQOeWvJ3n2nYDBkFTYTq5l/6xHaNGWfyezefIYJYQAqybHTqt
	Fl+jy+P6CATmdvOtPctBeIAsbA5gPnY=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for GA403WR
Date: Thu, 25 Dec 2025 03:53:01 +0100
Message-ID: <20251225025301.1980627-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GA403WR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a1bb2005c3f3..6a9f8e2900bf 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -822,6 +822,38 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403WR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 0,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 80,
+				.nv_tgp_max = 95,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA503QR"),
-- 
2.52.0

