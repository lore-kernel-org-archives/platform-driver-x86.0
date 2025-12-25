Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29353267B90
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766630342; cv=none; b=Ez2q9Q63KovZTSO/UMtSeRhp2EsLXniGOuwGoR9KvCbLhOUqfdjsiMtCkz/5KoyeCoFjZ3xcuQTqMDFpkY4biUrXMHY1jIFVi63F+STVga/EiY0PR63N9nI3uuJuodpjWE+haOiTu7M5Wmq2Z1mwO056O3N9oyCvv2xDa7rJgnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766630342; c=relaxed/simple;
	bh=6q6jqRy0TxTtsm0leJTdN9AD7Vc8YwYTuXApS5XWM2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nY6cKyVYQJJvSfr/SfAkHLrk24zVC3IYFiHXj/aOzaGyhphPRtoOldwIv+YfWJrmspO1LwEJvvGF4qfiaZaboGsF8HPFvZvW7QhKaLqV7KBJgjPhgwfRnMQJCzffVRVwK4k67uuA7AQKYUuKre9HguUEIFtBVVw8UxH0vbGEohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FCsNqL7Z; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FCsNqL7Z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766630329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KacvKWbLRAtShCvd8SDuEMahKmuRuZfk+QeIRiyx1dE=;
	b=FCsNqL7ZTFOeapPBsuU/z/9o50gZccEbNzxUmqoqzI5o/d3STUmgzzqSmn2KXyWA1O1lZd
	TXgr5dRw4tTs7qBziBMA9txftOvHYAHsAlk0LJrqfsxCIBXOutVm08sVINEtDji947PdjL
	JQ6G8Hf1yr4lmOXaWOTL/grYZmvyxJg=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for GU605CR
Date: Thu, 25 Dec 2025 03:38:41 +0100
Message-ID: <20251225023841.1970513-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GU605CR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a1bb2005c3f3..d8814165d480 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -950,6 +950,35 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605CR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 38,
+				.ppt_pl2_sppt_max = 110,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 80,
+				.nv_tgp_def = 90,
+				.nv_tgp_max = 105,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 38,
+				.ppt_pl2_sppt_max = 110,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GU605CW"),
-- 
2.52.0

