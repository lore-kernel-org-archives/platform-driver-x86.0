Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10078F39
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055221; cv=none; b=hsGgWGIjSP8z/STV1hgwpjZMxCerRO8Szw1WO2Rtcc+jZrxLuBdyWBLnDyDrzgNHCoVnM6wr7JfPTouuqFnTcN5TsRiBRXep5eNINxqMiBoirDFtdUk43R2MomnkCouSY+tXLwcYfH5OGSEHqAqzuIdLjv5HJ84UkWDqCU95r0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055221; c=relaxed/simple;
	bh=y0uOAzU7M4KAU8fNgXGlNoTxNhKJ97eroUNiy5/5dBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQP1F3bgu1yT4X3oj2XwXOQYmlTfMKc+os/2Hyedy1LD+FcPZbzTTbhqjUqyG9K6GGXqOR9b+UJk+mXA9OF9MO9nviWrNcpuIqnJ1LGU5sPYiQTExFGdaAPb+qbTKo0CcbHH5ZAFvmTggXcWKkBrEyzvbH8MWh78IHTSrlLmxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O5FkaY7y; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O5FkaY7y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779055217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2QxtIJQo1Plzyc23tVfi39Ogv3/Ro2TZ6IsP/jzUuw=;
	b=O5FkaY7yeIDvW3Io8O8iUN5VuZKbj3R1rNK8Pxb3tZpNJXTcXyApK6YDbq4t0BRz+oGcob
	WL9XvXI+sla6hLptEEQYKkdFOamnhsgftPMiNkGE2xL5Hohmw1BvHM2qajmeOJgClkO9ug
	gH7NI848T3XaOlGjESFWQxxedfkpFY8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/4] platform/x86: asus-armoury: add support for FX607VU
Date: Sun, 17 May 2026 22:00:02 +0000
Message-ID: <20260517220005.4594-2-denis.benato@linux.dev>
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

Add TDP data for laptop model FX607VU.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index c30d2b451e01..bd394ef94264 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -886,6 +886,33 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX607VU"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 115,
+				.ppt_pl1_spl_max = 135,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
-- 
2.47.3

