Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68C23EAB8
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788474; cv=none; b=lG+e0XI84f8kYJQQXU7D9U5RguzVRlIhHVqfmhSfFVmWjKS7RhRcbq6oRz04DTw9jm2uRSjpHrSlgH6cqD/69pUeFSmNeNsDcpTWk1l3BluxuGqnc/K0tk22jPkWhIOffqg0/0J20uAm6h/ehrLbvzHFDsQP2nYXCRuOOX78sQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788474; c=relaxed/simple;
	bh=xOlXWLeN4V7En+a9aa/V9kkGrbgyaaMOtyD08kKoS6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcCptKbR1eZfIvDGr50vP030FarQRwtoBMxU6TXWWyQ3Xf41sel91ZyYppw/Bbb9A/IBtNJ7qW9+boT/kkCynjarkd2GFqo3GbNsHfEW9eLZ1wKrQ/daLO+WD9rTIsCOkfZMo0cK9L6fTENu24IVsjkeUL9S8Fnb8HkmAd1TZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qVZzyTgp; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qVZzyTgp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774788470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GNOoqYwM6zKTkBCUDtBUaZtqSSRGJYD1vR2eGGZpK7M=;
	b=qVZzyTgp8aEdz3XDhaxD9rbNCQrXzMUjYgdi9xWgjMc83xEA3jm39j1ZNj+OaH/XpQOTEK
	MHrSuPXGgKSimZsiSDoNg88omyBP0CkEefCbRNQDTL++ytALfEmA8s1pXy+rDyCSsc8G/U
	9z48JyhrP/Qqdjl3wSuFavWClgWgTso=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/3] platform/x86: asus-armoury: add support for FA607NU
Date: Sun, 29 Mar 2026 14:46:58 +0200
Message-ID: <20260329124659.3967495-3-denis.benato@linux.dev>
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

Add TDP data for laptop model FA607NU.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 22e42a6d2c57..a37abb37555c 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -592,6 +592,37 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA607NU"),
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
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 25,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA607P"),
-- 
2.53.0

