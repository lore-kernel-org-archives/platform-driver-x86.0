Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32169425CF0
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460120; cv=none; b=QmAIX2pgE2hb6nuxVTWWkyaty/JyboFhjtTso0rZGONgCxUlGqOkhE2aiJs7TO+eCFAsEByK9ozYSRiekzPXijKgrfjMRM3xIlBl9usbtuiqFyOZg1y5tmDDeKQif2zAD96EpXCItnH1lKFIQAYrbk+At19AKr092XpcyWyNSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460120; c=relaxed/simple;
	bh=AjC0ktyvPQeI4RDN4A8wnPvSsIFfz5/0WHjRx9dH3UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onrgYcrgXWG16CBD78pSmh9a2qXZAVfVR5gUyJ0e+i/2z2ACjJWnxPLdbYnLb+c3C/gOIgRRmaCqM47kSTvYnPYsLJFisUDbGk3uFUV8zTBLCxuTWtoDiOQpJIb5KjoMUYuVlbbFrzHGo4TJ495cd7gfpw+g6fuM0i+yJhlTO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2VbmvsZ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2VbmvsZ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so5211973b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779460115; x=1780064915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88YLIo6TgvNgnlSaPgI2NY6rAJ5rlzf0h+LiaxqanXY=;
        b=g2VbmvsZ6kabadOQWv99uX2hnDW9lK8dxgJ8DYTnyqBqmMKusqcl8JrZ04nGTiA/xU
         TB8wV4CLJOR8lkp0lSEA5yKnY9AgQAU3t4zN/2jxtW6ki+sUDT459Al1UocAuNHupgUO
         4+zgfmlP6QZHkw5jpPI7ZBBpbN1kC4l604ZT96Jj+4zeUF5P/v6lU9qyV62tx22yvNrk
         +QoCoRXiDhK9pWXU5QXy/M87dTgBAjqUIjXBvAA2fX2POuPbgYw8L0Y6ojE7GDy1qfwD
         mKZYavXpCFeaERJi06XV1B9vIiMCoCbtYvYmoPq9FE68omnZiEriEJxodrbW+ZjpmQ+2
         1vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460115; x=1780064915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88YLIo6TgvNgnlSaPgI2NY6rAJ5rlzf0h+LiaxqanXY=;
        b=C9dPqIoyiPeHfbHVgol9Y8DYCoDGTadoT6a/DvTsgRPPGJvqkmz+2mj204qvmfuY8w
         klNAlIR9TnEqi/GvV1YjIeZfGfDXqqtigGCZahKB0fV8y9JFuewmRGFAu9Xgd3dKZ1up
         46apLgp7zCpoUYStkR9LL8/pbRN5vTN2r7JpveqdMk1g9czQJbt605Z1Plmj+gJ+mYIy
         mC8cYgV9Egoj2ho4qPi2QOwvy/yC5o1B5Vq6gixg7OLER4FULo86S0FpoK5nWPUZ8hg0
         BgtuXfqOzj9Vin17usWXaqjrKaOC5iFjfRd26ejeqRcPCdV+w7RsFItEmtAlnf/ZdjPr
         nOKg==
X-Gm-Message-State: AOJu0YwrDEK+5WuH8mMLlt3PFVEbZFIspu1yKDQ0hWWU/0cVH4WvbEYB
	ebqVYNTEWRiqMJOYB8MTvg+pvzJ8OKGKgUGtqVXOlYzlQawHQzHvLyCdrfPrDnx+
X-Gm-Gg: Acq92OHGtGl3krqBhNqvGr47lOWwPVka/+vnriHID9omnXojJgh+L3JMO9WBfUyG99S
	UiqozO8z/wwLL2Ku5KJ/xYGyovoEyG4FrtZEO5nr0fMiGgggKulmPYuubN9gMzE9c3W4cDRQOQg
	CclO9jLpmiXoIfmsPS9buXLEHfHJEkiHzDhm6ycXx7GsykdSliwpuWmy8W8rMFeEfshKVMXUYkz
	EY/kcuLLKzE2Ry7nnGHFfgzVor9uqXYDIdA5dMw+xuNwv3ROtO1n0QUfEHmjSC5OTfpHQPBDeD/
	KAOv48mAVibH86ZubR3PYK3SfjBsild4LG3668UAl5U4svCSV0ogM8Z+tkyK2TGkry3TlFF5C+R
	ZpU75pdAVt+bNoE8Yj/lPBZqDKpS9jKayUrCFhv+ElCgKQw/u8UCVhZFzZw+XOk69ZFKDA5eQe6
	y7EmQTxh3dQavAtK5DFbLijQT3NFuvTzrBLA==
X-Received: by 2002:a05:6a00:8c04:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-8415f3af2d2mr4572544b3a.6.1779460114793;
        Fri, 22 May 2026 07:28:34 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b0427bsm2585087b3a.22.2026.05.22.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:28:34 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Fri, 22 May 2026 19:58:08 +0530
Message-ID: <20260522142808.235894-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522142808.235894-1-radheykalra901@gmail.com>
References: <20260522142808.235894-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add board data for the
Victus S thermal-profile path and fan-control support.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6fd99b6..a25b12c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -170,6 +170,11 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -230,6 +235,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
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

