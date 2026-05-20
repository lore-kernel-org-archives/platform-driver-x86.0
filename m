Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B630C61B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246131; cv=none; b=Chqq5FHvd2jowW3naFvj1tIWz5op7XztgFGGe1YSKps7gx/fQ/uvcqrONY5Nzpe+lhG5YvGYVTJcXQCpshS/4D4cghaP1EF0w94/dd61MIaQTzUNDEtwAkKckKxWpSNiFejN7O1SMmjoTteIxS7NE7tCWilVkMQodn25t2wb490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246131; c=relaxed/simple;
	bh=ejrjgYvpb5olEN/x3FbshNDkFEd+gKS0sJmUfmxHotE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMzFaffsvvJKuYNPxLOJnoIDg6v7BzWpUE55PpP1HjQosfzrVSvoK7TND4VJEDKD78uh8hqgVl4VcuQ7dLhLJZ4AyRtFeC9lcic3xNFPrOVT2CzmvuOf+ZLQY8SSdKD0YuOtHJSbIhHxTXvOkGKJ3tbnBdTRePhxQRBdb3qiGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKbN9P+b; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKbN9P+b"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so4498646a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 20:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246129; x=1779850929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHNySbyyhwfx09DLMsDTUBE/Mwc2eQgIZDcQDlHCEkI=;
        b=cKbN9P+bUudKH6XH43uGuIX/WNZMGH3p1WikKwF4SS5eVkKZlsK3P/6/95oeX963zs
         /pwsahcx1b2e18B0r1jbL0vY0WPWbpDT4uVEGNYdRGyhSMfMAoEjJyr3Tk3kN/nZdCET
         fRXuy13MFeVwN5Z2F+NNAg6Q1K8kx+2vmuLDamtSS7ILBW58H/apr5f8ahWQNL59Sr9u
         ZPZHMlWIgeezY9qnOcjxTSia9w7w/ABL3j8VfFf84scC4a/xU21/IrfZvbl4WzFLR+JC
         tvl4gJRDcn4qlQwjwCKbqH/o5JcLIva/SBxQNCGMAhRgS4Ta+uaITNMHoigi+Nxmmhig
         RKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246129; x=1779850929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHNySbyyhwfx09DLMsDTUBE/Mwc2eQgIZDcQDlHCEkI=;
        b=TvLdo2xwcFUwJwkOuFyoH80bTkVwC6wY0Nb54mQ7QZ4PaCeIPRn+ss24dGq/oiyTj3
         vbWf2oRFAJeZxchkoPj4V5IQo0Bkt9QmDRTiNjMY2kyw5bZ4izu+ajaDDebQlc3KRzeE
         x6Cjn2nDUxZgcUh6otWTbKivyG02jvgRLWqkjJo+9Er+IllmonYpipBRBkUWz6ewHZc+
         XH+l29eesOXRcbArxgaC0ido8BJwMaTyDkWmp8wcEPpHgTIYuaOsxNG1VVT5rAgpCgPT
         5n8J27fvJhUO4kDD/s2hKW9iLkcmK+iZgPKZznw7P/AMaUdpLIqWCdbqO8Lu7kFYOx+7
         cl1w==
X-Gm-Message-State: AOJu0Yz2OIwuWeaBDBXJrD9BFRdO7yftm/O93GPsyCIeix9DG5nuEyDR
	SVTHRh4+tQAdXZ+Jt8U+sdQt97+KpPgRvkQE5gGnu0IOY206HGTzXf1apATe1hQ+E2M=
X-Gm-Gg: Acq92OGYMCM3JNSBTIxlkHfJU6/CZ5B7BWYoY5a3HByBGrZF3c8DZURiYPHIdGJgV0Z
	uywmpnXrEXu/6OgfZ8ZLPpVMreeItfRnog06Hblfl47XRex53eIC01mXOFyMrGjK1pIrG/WWPi2
	KLmF5KrZMv5ydi+aWoP9ap1jQYglZhhdNsCvuEiDgsyuuUPaaM9tpju6Dav85dFXpaHb5ZK09Mj
	lS/ZuHUoVIgo9MtJdfm7HRFPaYz6J+X8K00YrRdQ4h6uY1jBfKsSffypByXBc3ZAzoVa7HNQuJ2
	AjsDBZN4O442BGvbA5N6OqiBYhAzRuGv8RpeP3nDOs/ikX6wmg3VyODooHNHRi8vProYg2Wb2jb
	qKcE+lTPs+id+dldtpdhJ0lZGL+XZCpntNABMlnjxJmq5tHIQNQ1aMqPPcajbZkhlHyUD/P+PUS
	u0PfN+HZMrbm+rUI0RURp1YVbQgnns4yLlZA==
X-Received: by 2002:a17:90b:574d:b0:36a:9d7:8589 with SMTP id 98e67ed59e1d1-36a09d78874mr5126030a91.21.1779246128789;
        Tue, 19 May 2026 20:02:08 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm19869676a91.5.2026.05.19.20.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 20:02:08 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v4 4/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Wed, 20 May 2026 08:23:25 +0530
Message-ID: <20260520025325.103701-5-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520025325.103701-1-radheykalra901@gmail.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add it as a
fan-control-only board so the hwmon PWM interface is enabled without
forcing Victus S thermal-profile handling on this model.

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS F.22.
The fan table query succeeded and returned rows including cpu=23/gpu=0
followed by cpu=24/gpu=22. With 8A3D enabled in the fan-control path, pwm1
and pwm1_enable were exposed through hwmon.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 9d2966e..514c28c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -172,6 +172,10 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 /* DMI board names of devices that should use the omen specific path for
@@ -224,6 +228,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI board-specific feature data for Omen and Victus laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
@@ -2752,15 +2760,17 @@ static void __init setup_active_board_params(void)
 	if (id) {
 		active_board_params = id->driver_data;
 		active_thermal_profile_params = active_board_params->thermal_profile;
-		/*
-		 * Marking this boolean is required to ensure that
-		 * is_victus_s_thermal_profile() behaves like a valid
-		 * wrapper.
-		 */
-		is_victus_s_board = true;
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
-			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
-				dmi_get_system_info(DMI_BOARD_NAME));
+		if (active_thermal_profile_params) {
+			/*
+			 * Marking this boolean is required to ensure that
+			 * is_victus_s_thermal_profile() behaves like a valid
+			 * wrapper.
+			 */
+			is_victus_s_board = true;
+			if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+				pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
+					dmi_get_system_info(DMI_BOARD_NAME));
+			}
 		}
 	}
 }
-- 
2.54.0

