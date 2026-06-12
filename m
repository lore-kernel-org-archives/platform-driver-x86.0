Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DB3A783D
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265399; cv=none; b=bY/MAyhOpx8u6MJchcY2Kf3bbREBJz3gq4FKUUlX1QdwAMuEeL4NAZ2e1Z/OO6vkVfOVktzmZsmvrLHV+vKJayofpcp5lRFVzhYhbqK1Irtoa/SAbXwxzQwLK6kSaHRUSmsJ1zTCOfYb4SPPPJS1l84NrkFlh0RlvSwGsQaUkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265399; c=relaxed/simple;
	bh=M3AXBOIXn4/48flpBi1ymil42EwYemlT04+4pvBBgmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnChUMGAFOAb3qQifqW70Mcjb/+sPjnorFa9HRWz3z7DvTPvbPQPjs/CS6gWcEa7JNv4CVz8cKNLaggyl20Tjs+CCnKMno5M/s4qKZkZeHNykIxQ6XckDVgmdyMn1jgW1aaD4m9DTp9PhTWTgtS5bx5D42QACVnZVBdk0zbWXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DozL/GtV; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DozL/GtV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781265393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+WaFx1Ed82Y+50c/zfDbtzt+uCN2xtCKB4IdiWu2YY=;
	b=DozL/GtVyvZ4NcTFdyc/cOT4zuWX0oPCdCd37nqx2G2hQRQpXku9FBPWu4LNC8RSTRNFKq
	SBFmLA8F6UD+PxV/TGAwrIsK2WcxY1nrQ0MLup+qOLgrZBd6oAy3X4IYd7Obn54n11SFTE
	csJz0jaozsG5A1ORCPq3zDlhTvZbh+I=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/3] platform/x86: asus-armoury: add support for GA402NJ
Date: Fri, 12 Jun 2026 11:56:25 +0000
Message-ID: <20260612115628.964152-2-denis.benato@linux.dev>
In-Reply-To: <20260612115628.964152-1-denis.benato@linux.dev>
References: <20260612115628.964152-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GA402NJ.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 692978b61959..381eaeed5906 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -950,6 +950,38 @@ static const struct dmi_system_id power_limits[] = {
 			.dc_data = NULL,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA402NJ"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_def = 65,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_def = 10,
+				.nv_dynamic_boost_max = 15,
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
+		},
+	},
 	{
 		.matches = {
 			// This model is full AMD. No Nvidia dGPU.
-- 
2.47.3

