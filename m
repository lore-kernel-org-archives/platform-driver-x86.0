Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F18345736
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586812; cv=none; b=sNeWmP3sfZkN6fQPFn56n3uUMF+OvmQWntsOa0n2g1dqRHi9EeOkoNjaFQJzzmZ0LrlPuOkC+AEuZd9QIbmz42LQ/RwZZRvGDMbqRynZhE9XfO7XCwGy+oCRCWasvenpH/m07CRqmL4+fQLZSopXULL2gBSKNJ6mc8xesx0A3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586812; c=relaxed/simple;
	bh=A6IfrlnavJEP6XcTlXdFsdwsx3ngNeZ42OVPcFkPLek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyUQfLdnUoCkKLNnbAlpABy4dKnSuIMXKXWUU7kcs4OMVJJM/jJbxwxRupWzDl/XT4Pmpt2NXUMxeZwbHiJ6Cc+fOAGeIcX1YUAYJ5EPdnuzjo000WV7MVh3hnnEmOygzqJG1vhSyCjZuVBMjrEBSCQNLUfiTwGiWWea72wTJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uy/0Y6/S; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uy/0Y6/S"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768586809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dQ99A/e0k4CWiLy0Eb8HzBcf28vluYoDz6iKGNg0jo=;
	b=uy/0Y6/SwJFTuhd0DcGv86IxMbkZT5PgGR1idTpRFLbMvw2BuAjtiPjYirljJnrv4Y86PE
	TwGzbdNMLsCSmfk7ylThkg91N2Ac+vNeJ8fVEcehR/2kqxOxU1An/UPrO0aDVzAeBqrB9b
	/jzAfM5pRz+at4Eki87o+zqvoYwRqfA=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/4] platform/x86: asus-armoury: add support for G835L
Date: Fri, 16 Jan 2026 19:06:35 +0100
Message-ID: <20260116180637.859803-3-denis.benato@linux.dev>
In-Reply-To: <20260116180637.859803-1-denis.benato@linux.dev>
References: <20260116180637.859803-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model G835L.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 710eef74cdb7..3efb4b4d0d22 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1724,6 +1724,35 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G835LR"),
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
+				.nv_tgp_min = 65,
+				.nv_tgp_max = 115,
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
 			DMI_MATCH(DMI_BOARD_NAME, "G835LW"),
-- 
2.52.0

