Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54D3446C5
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 21:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254658; cv=none; b=kwInxLl5Z7egLuPqjTRNBKNG3d9JMCpYw7czieJ5aNDq2BPohSz2/AZjnCP23mMURqZwCa7pPkEkQy/4Vmc/DDRtL/GDQuxT9kT26N0e52KaD8JPWot3F8CKzffUI9Kz/ttlOxTWwgVzBm7BPil+vuUmcBPcthDGS7PZC8LmXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254658; c=relaxed/simple;
	bh=kXcToBVA+qgkNAMrX9wMpedZ7Cm8Fn8FZX/Q2vPiQ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6wc5RyY5OdSrmAh+k+Gn6I2Kcsj9Q7z8xMsub+WWBXwBRQYP0tc07iyDlFYoIrxpOCWC0u8ArtLLQi/C+b8y0j5V5KybHr5aKgZ580WnaN/f20exWp/A9bZCtA2I3ltQ8RfAecj8N6fMI/F+AVtG5DlPWo15UW1m9V5C5B+YlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pWKEylhB; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pWKEylhB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768254655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLQUHelCOq1E3s4Vsn9j3Sn8WCWA1sWiAzo7y3I0bqM=;
	b=pWKEylhBcZ8P4Sm3iWeN+dGQCLV3NyncqOeoh9i2Hk9tkcvW2HlwYwD2ybnsNffIthhUrP
	sGMTSHP9bgDtZvRZ6FEBcCdPRubOrtNGNvF30CBpaJw4n3+HFf/UtYAk1LpssJWaZJpNyA
	p+Gjd7lVuWsUWmYoNFPEVAqkLaXo3nI=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/3] platform/x86: asus-armoury: add support for FA401UV
Date: Mon, 12 Jan 2026 22:50:37 +0100
Message-ID: <20260112215038.575883-3-denis.benato@linux.dev>
In-Reply-To: <20260112215038.575883-1-denis.benato@linux.dev>
References: <20260112215038.575883-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model FA401UV.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 5bcb7d266604..2e3dd3b17b40 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -346,6 +346,37 @@ struct power_data {
  * _def is not required and will be assumed to be default == max if missing.
  */
 static const struct dmi_system_id power_limits[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA401UV"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 75,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 31,
+				.ppt_pl2_sppt_max = 44,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA401W"),
-- 
2.52.0

