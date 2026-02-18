Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F94CB5B
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 05:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771390988; cv=none; b=EEMiiFadQqMXUBNtaESoS4MQdA+yYyhKkLUj6LRxKoLjSChnch0KOPX/yobYK9tg6iSH9iu2mSC7qbG9MOlge27i8tL464G93t8o6GBfnGaUz+IrW4S4XXPFHM9l6u9hSRBCC5GWt2q80QveNChBRgzSkKkghH4vdX5iztE75hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771390988; c=relaxed/simple;
	bh=7fwbTCmADhdvyhhHvedDBuUM6m8RxKFoPTdFJWXwtxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jyu5TL9Btn7mvs/ponyIiWk+yyr04dFKlmeOP4V8prua9r/J9yUdi5E0PI4BKKv1IemD6JUB719/lKPFWbpOl2o+26vXOOZkMsvxiyDG9hhy+VKRGn2lIZgbxTMfCRxPkuk0j0xQiDqViQzaeuYxctggJD5OGB2VkGuR1HOJUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIZr/QKZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIZr/QKZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6e2a8db928so1923097a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 21:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771390987; x=1771995787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAf1Jqs66+l5ETuC/olHedrsCdG5IJLtle7NgFXOSPw=;
        b=VIZr/QKZNVUEYgaOxFIVS1Po+ytW7nbEUroBwp1IMyU1HvmOZUf+GDzW1hnw/wLC/B
         5I2uwRlBoTXG+zD36jtv3TYYjKc+raGrJKVZJbDcop6M3eR+DEBc181nGP9GLy8Te7qw
         KLXXOo57HoieMV/LZiZQA6uO4dgVMaplefU47WxEe8lxaBajkps3HZ/HZmDZf8WF6lo9
         CaD7pi/bA4MC28XE4xw3i2I9iAT9EcOT+7IqE5c4JKoQiMhqA0Zb3kl6wRukX/SJN/s6
         sGZqaWU/GFZJljoi5xRF9pIm+HwCc69T8/j+u2fQ47goC0Bp5lY09gbwB9gcQ6ovwfql
         kchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771390987; x=1771995787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAf1Jqs66+l5ETuC/olHedrsCdG5IJLtle7NgFXOSPw=;
        b=IRH2H1hllH9EJ/jmhdb3YUqoOHviEuMHXHUV+i6K8Hqa7FMRJa03CO+XbrN6n/SZed
         ajD19YhxbYldrHlpTARsJejtiYZLb/N5B4kvBYzeuOj+NHQzS/opEZ76JuICZU0vEvOV
         Fehgd7v+MB4KKXm3NRtDoEB5ACViNz7180myOzfapvmMYEcDk0WwSpGzugPcBjhooiHm
         6mGKtR5oU2srhfLA2g0MyVcj57/fAmk5riWq1M1NujplBTKNDH+VkQjdQ2IcpzHUzehL
         RjWYnivYJAY7aSbIXD4NfkT1uiOaHIb7jfWchNH2G+XfiH/Ikr0vy+Ve0ViZFpp7jSos
         RRXw==
X-Gm-Message-State: AOJu0YwQ2tRtgnfGVJlovSjPK+N8XLd5S7xxfBNHJ5qhVyuO/5u0ZXDF
	vIFH5IVcqMNfDRCSVAux5KTJYmGxUiy4SZsIBqsKj+1Lmp1zL/MmmFvw
X-Gm-Gg: AZuq6aJPrAtcT5AOEB3DkvGsol/k39e4FRBGbQXPYFluuwN19SxQDEvI/FICoCOFMVP
	YcgwuKpsyDi3NuIKJFBGn8wckx9eTu+2fbRhtLmXLVwx6h0AHIB8n4NyxaLwNfcYuv4iPFvkElK
	ZW+PraEq3WFi30PlOn22tUEIbexK3muAyKNsNjiGZ0GJUhfVb1x974W6mmQ35IC/TMUnOHfh8MS
	MHwuExmHD5+yDQjTQtxBoXanztqPjiAGTxRB/bUs+gtGuB/qkzI7W+y14jhumatK5qKcpNcDGDP
	/zZnlpT2TJgFXSK0dtN+MYTw40BJHKdMGltPMuE9zhTTRIVpRy7K5E7dTGSxN+DrZhF2NeM8Ahy
	w2igfPhol/h9I8+SVldNlVGdX6raz8vaQRfq9zEnOThH0y/+zWIrtqh+Xl9L9Ftxkl3AH7PYsQQ
	d1R1maTM8CYo0NXUaIdDdhJJmmymHTQfnCbBMZhcMZQ/1dPHH/veFR29SczmiI5ivL195mJM/pS
	P7v9LXzoXJC7B1v03M=
X-Received: by 2002:a17:903:1965:b0:2a9:5b48:2b38 with SMTP id d9443c01a7336-2ad1729c113mr122927605ad.0.1771390986839;
        Tue, 17 Feb 2026 21:03:06 -0800 (PST)
Received: from archlinux ([45.112.144.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73c6easm156494475ad.39.2026.02.17.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 21:03:06 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	varadpisale.work@gmail.com,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Omen 16-xd0xxx fan and thermal support
Date: Wed, 18 Feb 2026 10:32:35 +0530
Message-ID: <20260218050235.94687-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-xd0xxx (board ID: 8BCD) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile (similar to HP Omen 16-wf1xxx, board ID: 8C78).

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on HP Omen 16-xd0xxx confirmed that platform profile is
registered successfully and fan RPMs are readable and controllable.

Tested-by: Varad Amol Pisale <varadpisale.work@gmail.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..b91965117edd 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -177,6 +177,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.53.0

