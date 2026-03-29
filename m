Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA93C07A
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788471; cv=none; b=WzTccjXGMxLJMqg4+ny581uhK3aFMKGxlo4GgSn+2l4frjJWZjQ+j+JkH+lxke1WtOlCohiwUP6TDykjyQsvEiShVInJC0fZHg2N9GANaRFzRjAh7PN7fmbrsRgzAfannc3ch2URxGUop7A2F2m1R+ziE8a/56wlblUqrGOv01I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788471; c=relaxed/simple;
	bh=MvkkEyVwAo5MY+4mYN5MJUep5pWozd4NHldH5j+0AfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/MqmxEdCackpBF4KsA428eOJfb/FzaNsa/g5sf9ZmI9ILGrTOfUl4iyQ556nIwMu6p5voiErnEbCoGKoSKa5moN9SwLqqsS7QCFAABhPDQWwsLGq1ZNOKLZNP/FCgE3ie9AGhICigCHCUB9jpFbLzlMde2qOPawewmpHioeWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s+LG6JU4; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s+LG6JU4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774788467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWo0D5vr6sXARhCEDOgf0yOPOE+4/FG05b+0KxOU8Qc=;
	b=s+LG6JU4Y8gXRD7+SZPONGw8guLo6tmIDQ6k97FQI1D1eD5wSw+34RBlST+4m8DaKqScLx
	8IdhHgrZNNYwMGSovW1/hvsQwkqqHeserQpPy+t2W60LdiBzdUx0tlkrZUIBcpNB0bZk8d
	cbKEhQXa+yfMsYwdfVgtJU9C/36dQwo=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/3] platform/x86: asus-armoury: add support for GV302XU
Date: Sun, 29 Mar 2026 14:46:57 +0200
Message-ID: <20260329124659.3967495-2-denis.benato@linux.dev>
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

Add TDP data for laptop model GV302XU.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index d332daeb626b..22e42a6d2c57 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1404,6 +1404,33 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GV302XU"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 60,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
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
 			DMI_MATCH(DMI_BOARD_NAME, "GV302XV"),
-- 
2.53.0

