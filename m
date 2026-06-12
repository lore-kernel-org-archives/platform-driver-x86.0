Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4E3CC7EF;
	Fri, 12 Jun 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266231; cv=none; b=CNpKzoP/Ls0b2lUlGFiEt5vJzui5Ts2QUWeD75+Ngj0Dsv3KheBvxyesqlBBW5k269a4udb7s0+GGIrji61+jP0wtWVNUye3L7EanINV7pifk05+ELLAEhhJodVu41AJz7ZEh/WBVhHIpbzHLVjrhCz+D7aJvmy8h0Pi6JZf+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266231; c=relaxed/simple;
	bh=TDgSGULml7aQqzN3qlaccaJpR3XTqxFN1/ky9TvRpWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsCRNUF8HAC9Kd1irSMduoTXC39zUji4/J709iP7ucXd+l9w7fcLjT0/8vkq2aeafnVfZvny94JcTDG07bVaXs8VaVVdH9PGFCeQISnjIoQ//TjvYEtkzOGwq44Nu/kj3zUfrzuRsk/ARZr9u9b8cYBV/EGc3U1uFUcbiWBbN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=doSX1UzF; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="doSX1UzF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781266224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWGGwH32IEZ2Q589HytbDawuQcwiqdNzhNfPOnrwgW8=;
	b=doSX1UzFC52ZdbdPRSQLbxLplGazgpacC1aDkulJc73qDLDu4Y8N9bm8BQfmdSQu4VijVG
	XuYDZVn72kcUn/atX3K/s7MfZDhX6QHKuxyuQpVlip2eRz4gp+YLihYdXp5ddXDO+Hu8x2
	xRvBuCGKeodPj7EaKO8jVO9Qwge2Lzs=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 2/3] platform/x86: asus-armoury: add support for GA403UM
Date: Fri, 12 Jun 2026 12:10:07 +0000
Message-ID: <20260612121008.970269-3-denis.benato@linux.dev>
In-Reply-To: <20260612121008.970269-1-denis.benato@linux.dev>
References: <20260612121008.970269-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GA403UM.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 381eaeed5906..39edc0114b11 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1065,6 +1065,38 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403UM"),
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
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
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
 			DMI_MATCH(DMI_BOARD_NAME, "GA403UV"),
-- 
2.47.3

