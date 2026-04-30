Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2FC42668E;
	Thu, 30 Apr 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558070; cv=none; b=fxIQwobnNZikA6PYcKW6jHi+t9e42fhCNqvrIUEdHKplmO2qAJw0UB0Rvi3IEq6PVphgrk97P3Gz8Ktp8FK2MjMXZr7gEY7GAUur0TIJHG/WVgzX5w1ktANiMxg1Kw4hdUWp7+w6b3OVllpEAvkl+PfbXYZSnYFAxwhve7FR6EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558070; c=relaxed/simple;
	bh=iqOjluwfb45uDNypBhulDIlaPH71TwKI8bOhxchaDu8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MsPliR90bEZbZcZgsnl4jHUPM4JPTUG7rnsZ2T2eIM/P1xg2+gRkzNbfi4nyaEqTSskpHeQVR25uZ3qTRrjqyTFrsUZ5IQj1HjAXF+NX4Dxbfg4x2GeeBy3QvdhPKWjR9nWXBdAqjuH/a1RM0ZSDFjKO5Xp4No0NaIkdNDf1nac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Mzy7ps/5; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Mzy7ps/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777558062; bh=Al+7gPYdwYQgpiT4xpm7zU6Gi2Y7NxsU6cragIK+g4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mzy7ps/5xheGu8UHtHIu8AJTuH2iw6J9W2+jQteMaAZ6Asz/+8iV8AuEPzzgsJaIg
	 AFf1geV2JT0pXOSnoAZEXnLwBjRS1f7eSjUr4ezrxeNeQsdgagEraDxAD6PIl/ifWl
	 wPIywlk9x0UfGJLgSTuVwOTSWxpmF/TT7nWCb5ng=
Received: from hp-victus-16r0xxx ([42.48.251.129])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 1E81C048; Thu, 30 Apr 2026 22:07:40 +0800
X-QQ-mid: xmsmtpt1777558060t27dfdiax
Message-ID: <tencent_9CF63EC05D4DDF3637125CC36CFC465DB206@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GGADTObJLaC4WTX9xBDirNSPQvTIivdJe65S9+UkBPN+eDW0NfL
	 FF+yDtmB1zXLhk2w8P3TZheWV3wlbhH4PGlXY8TV2irOVd6dVqMAOYpl9q3UTqyxaAyGELjC6UbR
	 sA6Aqreza6Zcc7B8ls3nX3jIa7hStgXxEy4ANhxyND9S9EfBj95K/ncP4eKATuZc0JS2Mre/epGE
	 zwOdh1+e+uO6FrDXl2nPm/LbPsb+E8SInfLaiyzM6tMTAdOMPGlLv0ka4lVVIfVeQ0EXM+tzhv9q
	 /nxSqkAgH+/eppoJ82HXK2DY1nxLrrUvvNFN2rWH+WbBVVa91xscCkgaqzulavNqZfxZ6ZRguEl1
	 TqXMQp+e3GxV5mtbHZqt3XDTq6YuFP4ZPJYETzqyI07VVcLgKPhoYCs2TypUKPRAblw85HiBSlyv
	 8IAoZAucLibxpUwWUA7rPCKin/qiul2XnvmpNL2RGiEh2uiyD7RPoUdc4WVedMF+2aixUOZvS+ZG
	 NEwONiri3Jt1skoP76vAyFgmMvxnB2ezZMSxn4FyGZYMNZPC5TFUamUXKrC3L03t6b+O4KRZVko9
	 kO00r04nAoxKtVaN5x/lEJ1g9sdC1RpQHwyIxOZTRJvjRCLMEM1TAiNW6pxIms1TgHVXBjEBt//s
	 TD6fbeUCP6HVErdwQ4lX9v+F4gJoNnYOAiSmcgjBFZdt/QfvV5G50x98QuajelcXFBhelHWygbct
	 qXtrubz6DnY/CnZO+lshVRIp9NPhHyC9A0SZEaLyG5S0AumMu8mnuN+wF2VDp0lvdeCClaS7FJyK
	 NL8DEY/5hJ2shhR8uhWmtW2l+ljLP4xvU4YKysxDkOfLZB5Y4VvQ/lRxFX2FqNNrwCK1g3baU7IH
	 esXkhZvLmzuzidYnvndDcTsDoNgxH40x3HigWmcneizjW4KtLxa2n1ve7Z/AU+bviYWkINDq1VCm
	 6AfTAJxG06OkBGt/ORdI1VBhrHDb2B619EcFtmclIWGNzxxF0uc4IJA8y8w7yWaYS24CjQtHNjHt
	 qgiCPXZG12cpSyf7SrZ5Mmu+O/Md0XgbBSHMJcabGALBAIgnbH
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Haichen Feng <2806891994@qq.com>
To: ilpo.jarvinen@linux.intel.com
Cc: 2806891994@qq.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
Date: Thu, 30 Apr 2026 22:07:38 +0800
X-OQ-MSGID: <20260430140738.312447-1-2806891994@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com>
References: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
S boards, but requires quirks for correctly switching thermal
profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8BC2 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Signed-off-by: Haichen Feng <2806891994@qq.com>
---
Change in v2:
 - Move 8BC2 matching code to correct place
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d1..184eb920b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -209,6 +209,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
 		.driver_data = (void *)&omen_v1_thermal_params,
 	},
+	{
+		.matches = {DMI_MATCH(DMI_BOARD_NAME, "8BC2")},
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.54.0

