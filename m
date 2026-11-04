Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775973;
	b=Cw/eM73LTVTsCF9bNsHKMh2vo5L+eUtp8IwIcqz0+dLjSeIE1K2fQepRqiltZ2A+vj/i
	 +5dwHM3goGsfrfFLMZ75FeSmeCVbu4zhiRtcTqog8y6yVVAkhch1dop+Vm3YTRmqKAQWE
	 pbGQznjU72I5+Frxm0eo2hZFVxeqWTO0Ilv3dv43V/+ccQK4Rh8XbueIUKZzgIAnoTTxC
	 oUs/R3lWhHS9yV+kf0BOFdtBqcxhJVlfo0wxHPyqGJHUuLTYHWBJE0sAku76E//wu/lGa
	 aSx0gOETnqCCVHE/pmiQQgP+6MF61LpTRc+Nn9a4/Jqy9VqgmMwsa4hV+2I33xFovQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775973;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WokjOK4qUKpaWUewt5ne3nHyD3RlNEsjQzStQ+c1XNE=;
	b=cMC2aDuYReFYdFc3GZm4Xm+wsC/ZW9fp2odub2lzjL9fHkLwFcjZ6dbgNx2rtRSGg3u/
	 Mh1+Z7PSPVKy8hpal5/1FX1WjIM7woDzvEOpPYzdkl9Dz68fPjlCzqyMj5fQR5gQ52MhQ
	 hEhP1p0DeKACH52qPykS2ClQT+ZJqPTF+3FHMz5efTIHl98kbG2a8w/1z71EVIOWZ7v5H
	 Y+s4dVERnklAPaNoolOX/Quv6aT9EP/4kVXSRttDDmXscjpxEbHkzZ4/9J4RqGedk7Yaq
	 YB2ycdu7aPyx440t5/vT9aE2u1quXBN2+pRFyIjz+BjK0OQznJQpCyhKIM281uuZprg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=B88Yhe8a;
	arc=none smtp.remote-ip=91.218.175.157
Received: from mta0.migadu.com (out-157.mta0.migadu.com [91.218.175.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC6606A32F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 07:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCC6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=B88Yhe8a
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sN6eycwIKu/qE35PSu5sRh3YS6d8qIr8WXShRM/F29s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775969; v=1; x=1794380769;
 b=B88Yhe8aXbPotwPXS5mSp7q9WTisv3lU8edmv+yeUfUElnMVx+W199HXIe33849cJX0b2Pw/
 wAkTPyH2vUZI62vArFzpgbv0zKyNyjsp3i/yE1Rs6yeixslCXDENmaZamV2R5Co0F481foPyI9Y
 x57EOvQqvy5fStSms+7SVykevbLmYLjfWLwdD+noYCdGWW3pjP0bEsb25wP0gOUs9B4yYUii/B3
 aYT6G+EDqC1VSa+Cld2VMUH/FfChob4dmCWnDFa/187hnKwLgv/ElGS9msqhVqQXkAWnIRsSUXD
 93RK2RKyDdiTeDbCqa4+2nj7zRs13o4rTaPDSSVQhGwGQ==
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5fa99feb5128d1f;
	Wed, 04 Nov 2026 07:06:09 +0000
X-Mizu-Trace-ID: e5fa99feb5128d1f
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Val Packett <val@packett.cool>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/5] platform/surface: aggregator_registry: Add support for Surface Pro X
Date: Wed,  4 Nov 2026 04:04:36 -0300
Message-ID: <20261104070441.74127-6-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
References: <20261104070441.74127-1-val@packett.cool>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maximilian Luz <luzmaximilian@gmail.com>

Add SAM client device nodes for the Surface Pro X.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../surface/surface_aggregator_registry.c     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..bec0a87a2a95 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -51,6 +51,12 @@ static const struct software_node ssam_node_hub_base = {
 	.parent = &ssam_node_root,
 };
 
+/* Real-Time Clock. */
+static const struct software_node ssam_node_rtc = {
+	.name = "ssam:01:01:01:00:00",
+	.parent = &ssam_node_root,
+};
+
 /* AC adapter. */
 static const struct software_node ssam_node_bat_ac = {
 	.name = "ssam:01:02:01:01:01",
@@ -352,6 +358,22 @@ static const struct software_node *ssam_node_group_sp7[] = {
 	NULL,
 };
 
+/* Devices for Surface Pro X */
+static const struct software_node *ssam_node_group_spx[] = {
+	&ssam_node_root,
+	&ssam_node_hub_kip,
+	&ssam_node_rtc,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_sensors,
+	&ssam_node_kip_tablet_switch,
+	&ssam_node_hid_kip_keyboard,
+	&ssam_node_hid_kip_penstash,
+	&ssam_node_hid_kip_touchpad,
+	&ssam_node_hid_kip_fwupd,
+	NULL,
+};
+
 /* Devices for Surface Pro 8 */
 static const struct software_node *ssam_node_group_sp8[] = {
 	&ssam_node_root,
@@ -508,6 +530,10 @@ static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
 
 static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
+	/* Surface Pro X */
+	{ .compatible = "microsoft,cambria", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,carina", (void *)ssam_node_group_spx },
+	{ .compatible = "microsoft,caspar", (void *)ssam_node_group_spx },
 	/* Surface Pro 9 5G (ARM/QCOM) */
 	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5g },
 	/* Surface Pro 11 (ARM/QCOM) */
-- 
2.56.0

