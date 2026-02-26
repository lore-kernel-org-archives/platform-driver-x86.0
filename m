Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF553ACF07
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115594; cv=none; b=CkO4n9LP5+rB+z3lCGs2TytheOme+w9NUvyJdjNqEenYj8Rcm+FYkeAkrHz8sAcmOzoH/FWMJEX0oi1pyBnJbqf7+IgZoffp6huPQBsEFzlezHRgTIoSSbXsLypYPMzhbnA4JvvDjLd/Ms9shW7qNWgaWpytr81kAcp6QSkKeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115594; c=relaxed/simple;
	bh=eS/iX+gRYCpehjmqHNRpPkGfJopM2hvSUlkJVgObF/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWoSQQcC/IXtQ3IPn4d4k9sw49xqLROF8hIl5bFB3Q4TDEAPPByfcYFAvSFq0gRQeFJ/88MvNbEEDjGQTeS1/p0q+3wN1rb57j8vFXEo8xmOg8iKpuf1yL4Q1fG+PWc5lvSKq46FX4NL5Mnrkzu44QbEBBGI8FZTSmmsRxUcEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HB3+9Qnh; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HB3+9Qnh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772115590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueV2ALXu7VuLVbuBCcEUzmMziBsQnH0gXooUcqbuR9M=;
	b=HB3+9Qnh0Mg/rrXk2G0u0WKJ8HKH5A/XkFFJCb5awLJHDfGTUOwUl5YCPjDsPrF3+SmTBy
	OdHTQG8/srHXuzmV4CLKd2yDcrv/Qmes6NqdicaLrPodygwxhCNUzmquw62jdqiaH2R3pB
	h0BS/Wnib0SRJ45hziWI5Qln/Oc92aY=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH 2/2] platform/x86: asus-armoury: add support for FA401UM
Date: Thu, 26 Feb 2026 15:19:44 +0100
Message-ID: <20260226141944.352923-3-denis.benato@linux.dev>
In-Reply-To: <20260226141944.352923-1-denis.benato@linux.dev>
References: <20260226141944.352923-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model FA401UM.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index f9d9136aec7b..208f6fe16168 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -346,6 +346,35 @@ struct power_data {
  * _def is not required and will be assumed to be default == max if missing.
  */
 static const struct dmi_system_id power_limits[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA401UM"),
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
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
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
 			DMI_MATCH(DMI_BOARD_NAME, "FA401UV"),
-- 
2.53.0

