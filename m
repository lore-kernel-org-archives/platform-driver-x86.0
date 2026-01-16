Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157613590D4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586813; cv=none; b=aeSaMVyVn2UTTjCF5lYFRVlzyuxwDScy1PBhK8afADp8cxUKJmNAzhc9Y7+O1SkUG0RQR0DE6lT6swd86wERuZZeyQ+Q3264X3T7iUTGtKZ+tl9diw+d9xC09Mej3sPVD4nWao4qZa7RCaE4f7h0CHtVYE2L2SG2A6aTfsKbN7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586813; c=relaxed/simple;
	bh=HY8RuZXMA49ZG8ICGs1icY0NB293JtsalIPF0fLjs5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJ1//cLPXMm40ALayt9U0tUifOJ1zv6ZQblH5kePTSrTMqQ6+Q4xmLYakyrJTqykDTQ8FmAqX3eUvqSNdaOBiTBhhcEvlQaDT/1md4JuYxQbTVadAiHCdFfo7SX6fb5koh7HBEbyhYuR8M5LfSI+uzCy8MJzBUePfyj1ON9e0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=POmjq/An; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="POmjq/An"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768586810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0hSNEV5KJk3wiLdybmutG27O70kxLgs8kAwzk3rARk=;
	b=POmjq/AnJbnSnzP5H9TolJIL6vCJVvgmSEQLOgdrse1+By/8ZHMjO7Sr8CNRS8LWvePrFD
	TET90YSUzm1D4eYoRw2bHgPUO84CDBb3vyLLmdVX09KWETUYzMzS1j7vNCjIDuS0mi2rl6
	1DaKS0KP83vOX7xw5EMCirLFVDX0xxQ=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 3/4] platform/x86: asus-armoury: keep the list ordered alphabetically
Date: Fri, 16 Jan 2026 19:06:36 +0100
Message-ID: <20260116180637.859803-4-denis.benato@linux.dev>
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

Model GA403WM appears after GA403WR breaking the alphabetical order:
swap theirs position.

Fixes: f5fc40734b0f ("platform/x86: asus-armoury: add support for GA403WM")
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 3efb4b4d0d22..c67942010869 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -957,7 +957,7 @@ static const struct dmi_system_id power_limits[] = {
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403WR"),
+			DMI_MATCH(DMI_BOARD_NAME, "GA403WM"),
 		},
 		.driver_data = &(struct power_data) {
 			.ac_data = &(struct power_limits) {
@@ -968,11 +968,11 @@ static const struct dmi_system_id power_limits[] = {
 				.ppt_pl3_fppt_min = 35,
 				.ppt_pl3_fppt_max = 80,
 				.nv_dynamic_boost_min = 0,
-				.nv_dynamic_boost_max = 25,
+				.nv_dynamic_boost_max = 15,
 				.nv_temp_target_min = 75,
 				.nv_temp_target_max = 87,
-				.nv_tgp_min = 80,
-				.nv_tgp_max = 95,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
 			},
 			.dc_data = &(struct power_limits) {
 				.ppt_pl1_spl_min = 15,
@@ -989,7 +989,7 @@ static const struct dmi_system_id power_limits[] = {
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403WM"),
+			DMI_MATCH(DMI_BOARD_NAME, "GA403WR"),
 		},
 		.driver_data = &(struct power_data) {
 			.ac_data = &(struct power_limits) {
@@ -1000,11 +1000,11 @@ static const struct dmi_system_id power_limits[] = {
 				.ppt_pl3_fppt_min = 35,
 				.ppt_pl3_fppt_max = 80,
 				.nv_dynamic_boost_min = 0,
-				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_max = 25,
 				.nv_temp_target_min = 75,
 				.nv_temp_target_max = 87,
-				.nv_tgp_min = 55,
-				.nv_tgp_max = 85,
+				.nv_tgp_min = 80,
+				.nv_tgp_max = 95,
 			},
 			.dc_data = &(struct power_limits) {
 				.ppt_pl1_spl_min = 15,
-- 
2.52.0

