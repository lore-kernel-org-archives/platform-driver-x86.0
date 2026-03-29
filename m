Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF08186E2E
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788475; cv=none; b=gcwCzoIDS3TK5x1rUJ3YoJZ8bPwMLo3PGaNklFp/pE17a78MdgYYn8a9HSM6tot7Pbq5cEb24P4UzYFHMMd15EXTYrR6+DDwV7BO1cxvzoWd6AnHv/DM9V+SVfBRwm1Zo4Nr42REHBoNsNXMqABPIhJV1avQAKQLxM9Dew0itaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788475; c=relaxed/simple;
	bh=J9zMNnXSpZW/ml3J/W6Cl7PTkhgPx0w9QIJelnalxWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEJsfoMhuUq1+XnNBpv0twNtZ9UBiwFSJT6Kopqabt/nwtIw67QLWyTKb42n3XRF2xjBB0aSgpI/h2KkZzAFuyyefJyfZMM3WXliZrPPil4GqD8CXgstkfE2BCGc6q32Rwb0RERB+mT5I/+KrNOAQouTQcgypFUbrf9KrliE8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fzVje7bA; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fzVje7bA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774788472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7gtMib7F8MJDg6wPr5TLyiwjAcAjQzBl86Ji3i8gUI=;
	b=fzVje7bAIdFj2SLf5GBQD7dI3Uf2z3x/D7oaQ+mRLB+Cdz8Y64u7WoWi62OTU68sCfiLGD
	AR2p+qaZ9sc7+hVDxneqeP4OrR9jZ6W6MJn+d7r8if9eIm2JC36IX3SpYiuluEj0jG9w7B
	B9nC6u9YvuIUo88Kd8O5uJ3AkhP1pTo=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 3/3] platform/x86: asus-armoury: add support for GU605MU
Date: Sun, 29 Mar 2026 14:46:59 +0200
Message-ID: <20260329124659.3967495-4-denis.benato@linux.dev>
In-Reply-To: <20260329124659.3967495-1-denis.benato@linux.dev>
References: <20260329124659.3967495-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GU605MU.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a37abb37555c..b6a237c943dd 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1368,6 +1368,34 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605MU"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 38,
+				.ppt_pl2_sppt_max = 53,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
-- 
2.53.0

