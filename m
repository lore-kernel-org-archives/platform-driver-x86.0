Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566632;
	b=g8PvwKippS0fBbcGTIgQVdEmXaazfOPj+l5e69/FDbjpHXNRYj0cme7/N3DrZoI2Xlf/
	 MhbuHV+EzDSgbg8u6LNl7jWAzBiicXv41hBMyQUbUMZS4tQQCsiMqoYYSQGLrgWAonGDY
	 F8qRA5T3/Ccg4NvlFN/UUgZ0yS5u9xsaJgsIEbQxMAUdOJkvRb/epoLRbXIDQFQT4e8oT
	 HStTyZq8GS6BbLQr0QVT3hFcNX62SyU72+0KkluVC9HborgOcReiKkG28wCRoGiVPtoTX
	 6TrooJr9jTEGkS0lRMlwyViCQY5CTXCKyMuOgu0qg11SZj6fVo/SrR01NuaXs9L2kmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566632;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eklFQ3KrkIB1TTqphsGP5JZjNR3Kg7Fq7eOJPqrnXZw=;
	b=fv1zOWzzjX49DvQCem2+/kWMNTrPtRwry2cBjwiIJmSAZL5gwqXSRPijvKq+IN2wLl5y
	 n0bdUTyF88G80ju7VZ3MdVZZ6E/iVYzbcdKv9SI3rudc/Ozwp4JZYrnTvmRNLkOZViYqY
	 k7QUQIuU9mnynirWxOGa0+SNS4Dt8yjLxHYoct7V/Mu0W6WW9UttAhkb7N+g+KkMiSKGy
	 p0uxMIWvGl1lGQKOEbuzJ48B5FWB8aSHPUJ4xm/pICwZStfhuras0/xk6YWuxqP5Hh6hI
	 CxeRg9hwKXyMNy5rRKvlqVhuEAZ212MvGbztX2f+ObA8WvFsKg+70kPog9F8ZFCw06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=FkDnVUa8;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528EA606A32A;
	Wed, 21 Oct 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=FkDnVUa8
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7600280BDA;
	Wed, 21 Oct 2026 09:10:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1bzcHFi-FFZ; Wed, 21 Oct 2026 09:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566623; bh=POV5vgJtF7CHGx+5MoARLsyRaRGxJbxbPrH0BQzFyDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FkDnVUa8/KEaw+kJgxVmeaDCVvM74duu2Uv4mVKMNyNgHmFrvyCuszsTq4gUI+FJ8
	 MSROPgvYJZ1JocynATO+AtgZvL9bNMUgZGOFBEkRS46hg/DBeXAKT1wpSnU8DpB192
	 KI+AwTgnRfAE0fHudHOLH1ZTxlvbsdXmJtydgXhgESdWLydcaUnLTtox9q5IVYCUB7
	 y5nKfxwanaHpE20ac3SzKLQj2GvHOgGZ69KjIezQuWBDembHMSvNEU2iJ+WIEMqqJs
	 SIfrqj+vhowhQsYMP0fyL8jJX+n5Y2zaQ819ydGju3Buj+r+A3wZLkf3i6RGLypHq+
	 W5Jwf5Y4cmz7Q==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 4/7] platform/x86: asus-armoury: add power limits quirk for FA608UP
Date: Wed, 21 Oct 2026 09:08:16 +0200
Message-ID: <20261021070948.19916-5-scardracs@disroot.org>
In-Reply-To: <20261021070948.19916-1-scardracs@disroot.org>
References: <20261021070948.19916-1-scardracs@disroot.org>
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

Add a power limits quirk entry for the ASUS FA608UP laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 33 changes(+/-)
 1 file changed, 33 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -889,6 +889,39 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA608UP"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_min = 10,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 100,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 90,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+			},
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.56.0
