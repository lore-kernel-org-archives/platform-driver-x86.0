Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF9224F3
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780732952; cv=none; b=CFTA7Lr2IEukTn9NAvphYntmFE5qJQ2dEglcdZuatR8rkeDPyrOMxyPXWiUgItD3kkkp1al00rJ94RP8D+Zu5acr2uyw72j1EnONe9jU7UncQ0RrZvhgUmePLjfiSkBreLeH1wGH4If+fdJ1mvqeim2vrs6CZekN9o3OL7cfZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780732952; c=relaxed/simple;
	bh=iP22ZjPbeV8HlZLtAq4yS6Uc8nMYEMRUeoyeTnODlsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHUXaWgf6KqGWlfqNsrYe78i5Ef2lv48R/5kD9bhxSSZ8S5thZc9lT6eHUQfxrZ1igf7nNO49J2dahDs5uDNMZJLeBDCYMV6qGEFiXt7Q6ZP+/FU1XeZlMxRxIVlrz4a8aPYeWxbP/gr34tlGIJqNzfn9CbGpJjQZPhx1j1yNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2xJZNvF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2xJZNvF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf55c39e16so16291285ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Jun 2026 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780732951; x=1781337751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YK0Jz87RxY8KthmB11KDDWIETMrPO+HjhUR1goGbjok=;
        b=Q2xJZNvFU4Oejk0mqao6ZDQxbxikNft7g2+6hP4RWdL9maVBVsuO9aV1X2kS7Djgop
         nO08eB42FkehLPLFuyAmL0vwzrnTjWQmk5g0dRgecdymF10zWAdmB2WM4A0nCoon/vrW
         8VsjPAKEODERsN1em7VMkOyNx6Q/HHu1OU/xncmQqGRFTeBKeb+jrss1TyrCQZ7PQvL/
         iMKcUrZ97yR2ZOySFcq/PYZajb+BIQPEtVrbC9nLrI8WlGrBvZ2mgD0ESQ/xJm7JOwLw
         kRcYZKOpd7I6CIEN6QUCIyxwPo6EKwSjwJCTqcLLKd0ekhjEoh7l+w//7IHegcQZ3Bsf
         /d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780732951; x=1781337751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YK0Jz87RxY8KthmB11KDDWIETMrPO+HjhUR1goGbjok=;
        b=Vl3l+vyCToSxrNUgDR2gXd/+CCMc1qFZVmU6Sv8JVEXoHbejQ173koWl05q0nkmTDM
         VQtwGTRsnktaBcGMMPwdSyieGbp5zUh83hEYIt3cIfME5Vf+232BUngYsmds3kuvwNeB
         ccuBqqfGR/GqqZqwCjTsxVJVxf15PLTdwd3a5MPNZMrN6/+FH9eApvedAaaoj22ReJvy
         5fHfPTzesT9wmm8ZmPgEdsalEW3nWu10+XWyYMVe5ejWAcf6v3RqR/dkqcR+4MLxEoiT
         1BDeO5hOOLxYc5K1XXvvaVdn8d7CQZM9TIIrlGD58hnXtdVIEiZ7mrOomBSJhiUK6m3k
         VHHg==
X-Gm-Message-State: AOJu0YxMp0+vrm69fCkFVJrXnd176qfTbIe1Vdwxf48O74OHlXI7v+w8
	orLF+1VHncUQgkAkL9PUZQWowZcrliu1g90b80dMvQCEZ3gZHywVo+gF5ngepVvZy7k=
X-Gm-Gg: Acq92OEpMkrJ7fggf2faYzBXW7/46Bk5oIVh85gOFp+b97elrsURb62xZejQoZy83Gp
	QB70afuG8Ffgl+e0MrRUifEF9JJ/tN0QJDyOWjF2X93ILiebxvWkZ5Muf9WOemvDbVMarx9H9vN
	t4175k6yFP1B/3uWmkgBeLHJ6AkohC/QXI1gtbVBMpv3NnJsNAnrZYWf2wIYSVNE45kjrOB4uuq
	xDj/s7uXScv6d0Z6osi+uCQBEODRQq2UJGm71xcNRFSJlmbyAA+6VVvDwkGhp/D6Ad3Y01rE4eM
	8HlMqf4AvN+Oyrs/WVwRlYTtsWA2zhjzIlpPsc5f4efy4FwS02ijd89Pnp9vHVOqhjcRC3aCXw9
	OhFawz/1I8HtwoqIMPTaE7lv23ryKFGU9gcDG/pAGkYrr1MzzMlmh8AR6jLDHuwqf+maod38o6p
	9oaxTpdJ64kfpQgX0hOaT/wDxOGB7hJJPnlP30Ymdt8WNh7A==
X-Received: by 2002:a17:902:e544:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c1ec7fe13emr57590025ad.23.1780732950936;
        Sat, 06 Jun 2026 01:02:30 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:eafa:a84d:d4c0:cda7:baa6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm120818145ad.27.2026.06.06.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:02:30 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v9 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sat,  6 Jun 2026 13:31:56 +0530
Message-ID: <20260606080204.724444-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606080204.724444-1-radheykalra901@gmail.com>
References: <20260606080204.724444-1-radheykalra901@gmail.com>
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
index 91578e7..c124ad0 100644
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
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0
