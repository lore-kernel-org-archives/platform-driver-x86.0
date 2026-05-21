Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9D3DB97A
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370458; cv=none; b=c7W2rVZsV+Yl+vn87uKLWcPsMMHdEGYCZwMrt1GpTs3SQODn7F9YMLLuVrk0u1i4SM9ax7kvQhKN/Aoe1WRo2ypDL/v8oTOfCx3+8UUtaAc7nJTI/fPMIsbG51lmsa8mm2KyJurQ/25u/o/wKQYmnvLBRW6tTK+SAvqSsnMEC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370458; c=relaxed/simple;
	bh=VOL1dZ+0liw4I0f1TvGE7W03xZEqkwnrbh4Kv0+Xnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPNe9t6RGpfZe7/GURa92/kLwBuaijy+ZM+CziNoSm6nGPPlh2FkQmm78drhLDTukq/WlU33QrM1Tu0gTeL9NNjpnm+3vYtR8lNf88Gbb/zgDolNXT2AB20TxAnrYmmB9sBZKB5T3xKZ8V7CtcTqlqqFQ2ic9aU78KsfoJzMYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZGh4+W3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZGh4+W3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b4583f0a1aso39884465ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370457; x=1779975257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgzZmk7PrHR8G+H9VOVmVYi0JlqrD4zCuzYVpnJdAXI=;
        b=TZGh4+W3VLSDEDeR0iORcHr7Z85LpkgI7bQxT8zUi/nAr45iiHKKnuVcPpPCEt2wl7
         yK1xF0qd7HxIQJ9bt0sElw1pc4PPypb/N6MwZllZrRxZgpQz25Tgip4qB6eDSHTX4jpC
         SmjYYeRnSPese2TaDEyED4730+nSwzaYiW0cXw/UI988zWnrnolQzF+W2ZR5WTYtWTRR
         u+FK5U3YJu7e8kbLZwvit/yFYEorXnIROVb1VNkK8DJ1LYXEMlIuebGirthUVs8Sp4Uz
         KL+EQyfBrabbsiUt9lkxxAHYjz6kb3cwGcEyPpU6JGtjmsOdUx4APcbBwNnP79Nal+PP
         Lz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370457; x=1779975257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PgzZmk7PrHR8G+H9VOVmVYi0JlqrD4zCuzYVpnJdAXI=;
        b=L0RCcqKU7ow6ClXUOz9Zb6aNc/ju4ZoQjobmx8T5Ix0NJyz/d2LE0fc5q7QEwleV6F
         IGAGGgwyaNFDTUdF1m/CqGz1niHkrSB1bRIZ/tPdpoVOn/bKJ6xnVKK+PeXOAcCqEmdN
         5IyREBYNhuLjQ3qp9j4NAA64a8D5IJIjYFVVQM1NBlgirrXpHGg7KChB/Ole0DwJdmik
         A4kEOJJBtidTgKmaEv+KF9dCaGtrdnxL5cUOhchDUfUiVN69MLHXVL4lQ1nNbPlOoDNe
         f1nBFEAfW1s0e2LAuLjbmRVs5DpqFjz8HFE79JbIRKz3b87DwxLVwLaGbrbOueAeIc5n
         IFFw==
X-Gm-Message-State: AOJu0Yw6oVCBDDBsnY+9m3UiT/UhNlzUpQB3PeDc8pzuD0XDXyhXMlDB
	gbenT07p1E5Ihw8z3IWqibToR11NjZjrTbuqeznUMYNQGBVmwexUSqz/6+f9qXAQ8zA=
X-Gm-Gg: Acq92OFEu00gbp//PuUGPB0R4rb/t8BSqGJfAR2G4iKPoaEmYp5cqR0vkOimi/j75Op
	XbxxNFCodyRLmmKL8Eb8LL1nMFq3/9fDhESyycRaFgVE/J6f3OdHH2M/uUzlMREaBSlBuGHlCLx
	ndbqzR5nXJ0qS08HcZL1JmAiuWOLbA+F9eVsSdcQxmcbXb8gy70cAp64eUY155wTBwcINXOfkYr
	RoGRPAZ6AeS/dbFEx5zfVg9iwTu3j3A7OIm8DDzM6jTAImghtPLiXKLtWiImHA2/jlpOPTkQxrf
	iOeWcro/b9LVGtNBhp1KvQVrBmb1Y6TzefDpofHkqdCcOb9DDY/JJIzDfjcn1iIH4X5j/y6Dg+h
	lKTLFsms5ibEYm3/qsqzlbSW91qImFrXckMqrfIyPzK5OJYlY3IjDeo5omJW3sppjGehDI+03m2
	0zPsvKxRUG3Yi+ergtSkcdxuL0XD6qwCe6azMomCDNtIMHFwrMKAcrz+8=
X-Received: by 2002:a17:902:cf43:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2bea31ccb31mr31367405ad.17.1779370456516;
        Thu, 21 May 2026 06:34:16 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm12284785ad.32.2026.05.21.06.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:16 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 4/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Thu, 21 May 2026 19:03:51 +0530
Message-ID: <20260521133351.1512718-5-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521133351.1512718-1-radheykalra901@gmail.com>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
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

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. The fan table query succeeded and returned rows including
cpu=23/gpu=0 followed by cpu=24/gpu=22. With 8A3D enabled in the
fan-control path, pwm1 and pwm1_enable were exposed through hwmon.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index dcfffe6..f463823 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -170,6 +170,10 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -230,6 +234,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI board-specific feature data for Omen and Victus laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0

