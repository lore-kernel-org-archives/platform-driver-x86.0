Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF73D3CE5
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266231; cv=none; b=sUoK2jWqBwZBPNkfpYqHUBS9q39OaDtoB+kI3C9T15Fyz6qFSTPpYJJzhnS5zK2SihP6ypQ2E2WCWNom40/JiFMbhEJ4z9mwWzAAjq09IaZxicAcF6t8oFVop0hN/4Dlru1Tefg064cmP/sNUIfrwT3qQRxuIFSZ7sP4XrTaoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266231; c=relaxed/simple;
	bh=+S5Tl4Oc5xL5q69ORl3Eu7QVVL7x+sf2koLc8BPGpRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIlLq02wRoLnmNl8eVSpAEAxRfXcbHEYfltPGqKnFyVDScORg2Q2T7KIytvzYGU74oaqAD2YgIyf4iT2Q9MdWx7+CcVDFcnh1F5Jmm/ZzAwz6j3S42Kj0dyCDOIqX2bxIHrXXEHa/8AShI93hDBUjGBtPlJ3bhcOuIA2bU+4peo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N3FRya+O; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N3FRya+O"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781266225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1tWNLqd+aGUpp2cgJn1E+LwyNsQxUTiloEJmCxeWLmk=;
	b=N3FRya+O2avhU5gIYb/NPLrCv4IF1AL4hBvFpnUaEIMr3o39y4cgS2HFThBiBLjMjrdtR1
	OvtNdWiFlQlSpOHYOvPvCrxxX4jCkVXeaI4sfmfnqbs3GRtM+dflRHpUpagw+LX/vO3PTq
	0IY5S3VU6b3edfqorw7oFE/iJD0SEp8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 3/3] platform/x86: asus-armoury: add support for FX608JPR
Date: Fri, 12 Jun 2026 12:10:08 +0000
Message-ID: <20260612121008.970269-4-denis.benato@linux.dev>
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

Add TDP data for laptop model FX608JPR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 39edc0114b11..fce78e586a03 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -936,6 +936,34 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX608JPR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 100,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 10,
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 100,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 53,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
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

