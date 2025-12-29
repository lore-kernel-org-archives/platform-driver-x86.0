Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFD277029
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041109; cv=none; b=KH+/FL3KpPKkTxZ9dP7U4CQiEdZCTBEP2rJa0dvEz7Umq5MSKXznB2y10xDiVoqt9AvqmicOgjrHgCHFs6JYI96LWOgdm3sjSv1bvVe6wdHO9rBHyrAu3oaLBep/rq5dYIVEME1eb1qDZbwKDYxwR5L/PK2PMZpRVRSXhs7ymMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041109; c=relaxed/simple;
	bh=93AqE3fA+Vl4brEiffNkiHRyx8vfDQWZhBJdDVk+GkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=el+xx4Fqhi9Ekn3itQcmL02Jbgxy0mD9C2lNQUC7/0zPy725BrV2Lr6bro//HkmNQUWwW/GwveIgrAAHFJ2GbjJbKDSJv6CoWKpecd872HWLTITcHMNqEaVjcd1JEv2VWVANOwfSejQxDOGioXrnL0+DTUQnyU7U87gGIVLeNDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ptNB27Nn; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ptNB27Nn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767041103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YV2sWj691PWBCNhNLlsMnvQ+FxH0XQWylA2wIHdYDis=;
	b=ptNB27NncFPDbc9oVc2hu4glSuAjL2CzIDI+2ei0z2oOgS418VEPL+genNUrn2Kchi/Any
	uQPD0MxFLWYLQNC5a+879KUrptVHVNx/51V02CMY6BovYh3CMIOGGFRZfN8jc445gLVYBN
	Rg6b2I41RLL0fTOH9iQqj5q2dfG5FVE=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for G835LW
Date: Mon, 29 Dec 2025 21:44:58 +0100
Message-ID: <20251229204458.2658777-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model G835LW.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a1bb2005c3f3..98e05e11eef1 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1426,6 +1426,35 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G835LW"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 140,
+				.ppt_pl1_spl_max = 175,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 80,
+				.nv_tgp_max = 150,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "H7606W"),
-- 
2.52.0

