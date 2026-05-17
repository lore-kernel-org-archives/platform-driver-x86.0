Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6CD330B29
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055224; cv=none; b=o8TCJwwW1G6X7g1DCZOKWmfgbDEedFEX2zsX5nn3xmoyXFn1DNJmuqF20UZB55sEX38MqWrN0DcXVkzI0GrS3PIY5z13kBC01qIPAX5WoVRTYKnemvw+e0n+pmzk0WEgAnXTMBtaaM6b7QDQJIElV/pPH9I+3yB4htHA1SIsQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055224; c=relaxed/simple;
	bh=vlU3cqkNhf9IqK1KgK/3FJ7JQp59mSFoy3FiD0IlNck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r95p2aHc6Do6+wo+aTksmPLFkXDPamnX5x3D3JoS1d75ot5eGuYEKNMg6G9lz3bRiy/FD10Ztyj/xBAiZ0w3QzJLYvWZYGZGmyYkjUyZ05vv9pM1TqEAbvkUqy4xT+dPJJZb5m18lY1UcthhQwlv584CY8jCqxxPd+jewJRr8D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C4HPac6c; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C4HPac6c"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779055220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unt4mUxh2QaPXPAwJnYvbbGQmpdogoStSROGGGvohHI=;
	b=C4HPac6cOChn0MZ8eAfx0rb0H/KcVdk5iMELCuHaUPuj4lLTyBDZdFZVdWz82+x62YZ3Kf
	jRJwsOe1FkdkxOXRMPr5D3XtkaVG+tr6fb6mKhhs80O3VmnCZDME73qTEnbo5Xq5XnG9Su
	1jK9dBXghABGfit8TEGfBbUjv/nzFd8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/4] platform/x86: asus-armoury: add support for G614FR
Date: Sun, 17 May 2026 22:00:03 +0000
Message-ID: <20260517220005.4594-3-denis.benato@linux.dev>
In-Reply-To: <20260517220005.4594-1-denis.benato@linux.dev>
References: <20260517220005.4594-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model G614FR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index bd394ef94264..6c8f46d289d8 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1786,6 +1786,40 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614FR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 162,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 162,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_tgp_min = 65,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G614J"),
-- 
2.47.3

