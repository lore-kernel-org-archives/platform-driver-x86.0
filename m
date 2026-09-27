Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355053C1411
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790501958; cv=none; b=K3t9FDsnL8ZzgBENoRDsZvOHYHEVNm0eJeghrGJbmjsVsgygwy6SnUXx+zK5dfe5lYjddLVoyzZYOnZpQEegB+CgY9RQFHDKKhjiQnaA93X6RcvAAtF1d2cbKMx3qzlmqzZBgpLzbcGTEeKTsbfKXwX2ZXbCV2shSKyZNe9c5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790501958; c=relaxed/simple;
	bh=uzg2Q5XVAoYbWmRcW+Dohoq2cjtZmGLJRTXMn8f31EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGP9lraK8eSMfejFHDthr9hz2zkeMFdJb8/pdrCFun+fq566uGuVKPHj7IsCbX00KMhYaGwxdrM/znCYoPE4lmlonpMu2nOOgxwCw5r+EDWPq8GWBUY7o3W9jOQOjXPzhCiGOXPB6ndJroX4kjduoKVM1iiYV9gw/UkKolsDNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLGKuvMN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLGKuvMN"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1029895a91.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790501956; x=1791106756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0KvKvHHZG597veyD5me7EYri/H01vI260yWKP9hXBQ=;
        b=YLGKuvMNQRlBLeyBZcbjBitajsOvemQak9D2PELsHEZa+qK0Jht1mQISWN6w0po5tx
         6QRFIvlB0g+nPugmalseOHAOIsH95MeriCmFWMYDUv2iKkTx0srG2bp59m2xjOM0+BtG
         aae4hY77J5bpuOvnxxkx0f4wGwi7vBbsCDGeOJz13VckLmnkuEjzihCScPB2R8DwKaWL
         szt6zvfc8aD5w3k7Nh6obIK/ZVFpCsnx/Pm1KxmO3rNQf78SFQEeOvEoB5DMXvEUJcn1
         LZEgltYBqlmGzq0Eeb33pHBuZ8hbqhPFSQZ0FQuiQCw54eV6aFwnRGZbHe9ZhSN5qsP3
         FiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790501956; x=1791106756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0KvKvHHZG597veyD5me7EYri/H01vI260yWKP9hXBQ=;
        b=GsrHVaY4l0pFMwydosf2mQt0xZd29U9p4ZnVyqYv4LtKJXfJoYmEw1C0I5bIUGcNMI
         aa9VvT9qdf1iPFIEIJFEv7FhCFXvfcTOIgnQExLzg+bYsdKI+G1KGMDOvK/R8jxUZxCl
         VE+XkAAf1KLCnAY7XPMB6CYo8gMnpyC5flRlDVEMBGMvpuxQ0DGagst9v6i2rnRApGHz
         +5M/+x3KcocCmu1lErr8L9t3731Dcudkdgf+A9An8PVS9FQ7qx63Y6g3vc2EOAZjXJQR
         7c6LfMCamCPLKUeWupet2Wl4JmphbQBmv+JTDm2qEoeHN7wjSF1DqBafeKJXGR4v/aIi
         RwQg==
X-Forwarded-Encrypted: i=1; AKwUvBw2qq5vE9Hfm2JcC5+dLedV/l+rZmXwyYVpHmz28cnOG0VPExeKW9tPWsUi1vuJ5agUZfSj/SJtTHBlVrkUKZKEyvdZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLa6Uu8Yh/b2J7UVogVxxm76O57zfuCnEZSZgp8I/H7TcobyXXO
	9dFs9za8v5yL8OE+wiCZvpNDYPZI+kn4ENfdWsOosdDx0xtC+xlYgaUl
X-Gm-Gg: AYBFou3/CHgNfBkP1480gnNyZzbi/Y5GNuNQEkL4qztgDcTKqIjE1g4X05JfjFFgJIB
	5sjPKaTgMxfRqQF0nbbd/tNQj7mUQ4rARZXKXhSu8V4nLiovb7wda9OOGX27KIkMgkuSY/8s4Ai
	oemTlGO3Uz6GzDNBo1aIC2pLg50f4QOQMTPfN1kCWz78X6GUUFb96PUzhRWCphmP8MOsQoQdI4j
	ersHdR9a/S62dcysj2vbGqxf2zfNgQVn85fx+atqS187xdgsI6MR/OfD43R/drzMTRwjHT9qqh+
	B8zDB5GLnPWD8lipvLqB895JyxM2jQhjkcJNFukEl01hndUrt0jtf1voCLJBshbQ436tu7rV4Mr
	aapZ4V1ZZx+vFpYbUG6xq1RJX1U/+47clArRSfw6HwEh5gy0cPzbCubmMCFQweHOQps0eIrGfHu
	1n/IUIMGkOkKo/6iB4Wkk9ly9JeF+iJJ1yyYQury3xYvLRVusoy+ofHh2i0A9qheVzH0xv7pbXd
	c70428LSlQisOCcuugGBnDZQed551Xoowk=
X-Received: by 2002:a17:90b:4a05:b0:3a0:bb4d:77ff with SMTP id 98e67ed59e1d1-3a0bb4d7a39mr6044564a91.0.1790501956341;
        Sun, 27 Sep 2026 02:39:16 -0700 (PDT)
Received: from archlinux ([157.48.21.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm10285191a91.16.2026.09.27.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 02:39:15 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: technosfan14@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-wmi: Define known Victus S driver data
Date: Sun, 27 Sep 2026 15:08:52 +0530
Message-ID: <20260927093852.161958-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927085539.96791-1-technosfan14@gmail.com>
References: <20260927085539.96791-1-technosfan14@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Victus S thermal parameters use the Unknown Offset for TP
(Thermal Profile) from the EC offsets enum, even though there is a
Victus S EC Offset in the same enum.

This was done so because the EC layout is highly
variable across this lineup of laptops. The only place where the 0x59
offset is used is the driver data for Omen V1 models, despite it being
labelled as the Victus S TP offset. The name clearly doesn't relate
to the use case.

However, after some downstream searching, I have found that there is
a Victus S board which does have the expected EC layout corresponding to
the very Victus S offset itself.

Add known board parameters for the Victus S models to correctly map
the found board (8C99) and any others in the future, and add
required if-statements for platform profile options for the new
parameters.

Link: https://github.com/yunusemreyl/omen-space/commit/f32a76386592d1a604e574c693b323d15e978089
Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d4..7851cb607c74 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_known_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_known_board_params = {
+	.thermal_profile	= &victus_s_known_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -316,7 +328,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_known_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
@@ -2146,10 +2158,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * of these values.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
-	    tp == omen_v1_thermal_params.performance) {
+	    tp == omen_v1_thermal_params.performance ||
+		tp == victus_s_known_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 	} else if (tp == victus_s_thermal_params.balanced ||
-		   tp == omen_v1_thermal_params.balanced) {
+			tp == omen_v1_thermal_params.balanced ||
+			tp == victus_s_known_thermal_params.balanced) {
 		/*
 		 * Since both PLATFORM_PROFILE_LOW_POWER and
 		 * PLATFORM_PROFILE_BALANCED share the same thermal profile
-- 
2.55.0

