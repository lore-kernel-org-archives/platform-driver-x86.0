Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566634;
	b=LXisNLzEt9962ImkFFcgSMbZOdFK5KG7xLrwu2OWGngrlM5vYYKzZvefnhN42kqjdNyq
	 Hh7CkDqJH5ENP2/4UWKycJarZz0o16A/wlzYoKSo/XJSqa24knqKV4CWUKnyyHP4PYX6u
	 a1X1NpKixACDvjpn3zSVDtSUg9fFtaOuZ+On/e7s7yX56mmOxVna11rGviUTFwTzIlR5O
	 6lbFqqRxV/QCHoZK3B+O5PkbuNMIr3fVBwBMCEpuR3HJDipL/W4AUTQ7N2b7xfG3BVONy
	 e/WX2sVfmwWJWYJCilttbLLH73+aXd6cxEnzTcqwcID+q4bW7x9VZyhm7AyAnDfYs0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566634;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8PmrsT/f8AVQ75NQnBdWPNc466VcpcYsgLg8q57q8C8=;
	b=2A9ua+VdJDBXUcnZKlrs8bZ9vN1qGJCf9Nt+UCuFyLEKZCwBQkc2stroG8KSZ7Ls886e
	 hCWyUVi+UH2mFAir0Zq57hekiHn4Fqx/Gpz8gef2dqxvQdj3dYxdGxqfy5tD38yXesL8e
	 lKJigwulUMv6Tcx+GGtTNAAjMiiF/y3gDByJLftU8r8dZ8WPPZA3EkOZP1xO9BFy0leZM
	 /pi65kAKE9aSIDX125eKmop6PdGqnf2D0i21BFCR369xj9HtRt5o+EXZEHsEYaa+Jai3Z
	 CtsAUIw349QCcL/GAK6qkHDj9xDMNtnnpGQ3Y8u9S6ZeAKZc2bMTjYY+US5Ksb7gPOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=ZBLa1YVl;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA5606A33A;
	Wed, 21 Oct 2026 07:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAA5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=ZBLa1YVl
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 758BF8068D;
	Wed, 21 Oct 2026 09:10:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3J2wDlye4Hy; Wed, 21 Oct 2026 09:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566624; bh=+NLvmTd246YMZbkuJBcKDrvbpzHu/tEAMgItEBQYkWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZBLa1YVlVbJBvRJGupQiIIMmbdiWcnnRZv14w7Gq7pbzFWEUTlsOP9vxgTCybEuf6
	 hNmRa+xyCIbIx2Ykha+PNQW7uIwfMiTXMJ5BU2E8rhIQdtfhVIUH5Cni4SxEJwiuq6
	 FlBTJ1kLSB3XtwU/ndwBaGJNFeNTyeQhgPEduj05CJlU5gCywqUmx0jPgns2dFSqwC
	 vYaMhzSCU7KQPB3lJLWDeXre55ImOgDsBhHsQbLkGRHaB0GSHYiydXiI+mLHE2VdzE
	 EAW8qKnQ1aj0xj9gvJHGpiZHq951CX0LOPU7hqqZNbO4AVPRTWXiDqT1VyiNTm+e8f
	 2nXtBPWOfeQBg==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 6/7] platform/x86: asus-armoury: add power limits quirk for G533QS
Date: Wed, 21 Oct 2026 09:08:18 +0200
Message-ID: <20261021070948.19916-7-scardracs@disroot.org>
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

Add a power limits quirk entry for the ASUS G533QS laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1229,6 +1229,19 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G533QS"),
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
 			DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.56.0
