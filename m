Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566632;
	b=O5J5UwjxLyxHD8y+oKr1LISv3A6IKwYUyHfTy4p41IOx60yGMgjxV/Go+lhP6FcmNG41
	 0/zG7vmLNm9jcnZfb3wqzQ0S8CuR2zMQ1D36XnKOj3WJJwC08EVEda0hjiI7kp5jjJ/AQ
	 oORODRvyWjnPpqeAWe+AromvuJr95X9wpr3PHsWRXIn3wzOx55taaB0y86e+eNdC6aw2d
	 downJ3wj43bQZmFa1shdDbqE7pbXTo5Zvhkhy8lBSlukso6daG/60raKoWeXRXor3evwk
	 uLv/jCxv6kPCTggMqs5CHtOJ8YG98LNaLLVqz74sufZnqzihK0hLpgetwZiQKM/bQtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566632;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5EpXwKojx6uXLXTsu3bkhq/Sx0QpgG44h1cOnG/HgCY=;
	b=Hmq/DpSv1xj9S8LpMBRZHeb8enIc/1JO5rJDTbP4RUsflct0TRBm8qnxgE6e+Zei/iee
	 UH9O3OC9XapM2m6NYPtTnVAwLtPlHjhldBIhkv/tbtT1YvxMzMiz81xVsGpuwJpx4/HJI
	 Wd4GCIidEjuBeDrh0kF2z+juBbEVDPPEOVj58A1m3Rwsp0IwWluLNn41brzxkXN9xLbp5
	 5vBtyLs3WVI9np4LtLGfcrtFbO64UrgtgFc5jrv0UH54j98rlzJM4bVxFNZvqlPwQYXzZ
	 Ya/dg0lSCYk4JiHsTOeOByhLR8uw+NLEJCjAWxVlc1vcfHOsFS4FURi/DyOr+GrJCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ww2tV1sC;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A6606A31A;
	Wed, 21 Oct 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 896A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ww2tV1sC
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E1A1480BE8;
	Wed, 21 Oct 2026 09:10:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 727ZEKpQrpuA; Wed, 21 Oct 2026 09:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566622; bh=7pM+7QFrFvAvctRTW4WiCSuoyu7jc/p3FCohOTtV5Ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ww2tV1sC/dJznax3KdBqaBbkm0ryeL45RqqpuYWpjqTlGjErgwqalW497wSYvJhRE
	 iLkb/G62i1GiQqquyzXT1YceOp5PMVl6beC9/y4rk/eobVBr1BZRlvuYOunmMzq4gB
	 nFP0ecniuTPT09P1M6lv/xhwTHEmzEoklOTTJJYQSCC+/1v+zmr7rmw79E2+6FQq07
	 jxREcvq8EFGKdoJBf++ckt55LM/wWna2lagO6kpIliLDNeO9AkA/atg40ZNJlI0eUj
	 fTgWjxcK6oPkkHHV86SxzQAZL0XVQRtUvsNbHdb7UB5QRP/ajkm5gThI7zjtWqNR45
	 buqfzwoNWuHog==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 1/7] platform/x86: asus-armoury: add power limits quirk for G713QR
Date: Wed, 21 Oct 2026 09:08:13 +0200
Message-ID: <20261021070948.19916-2-scardracs@disroot.org>
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

Add a power limits quirk entry for the ASUS G713QR laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1132,6 +1132,19 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl2_sppt_min = 15,
+			},
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.56.0
