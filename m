Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EA84A49A5;
	Fri, 16 Oct 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155848; cv=none; b=KKxRV/jlVTPpYY9/H4R5hmDg1ALArzFkdOtgYNuOU3E6nk9l/AhH8Z03J7lYy2CpybByTh4RA+/pyS33otEKIhRbzKGCuBlz+Twz9MGTYpesCSK5s/c/lUxk6ki7g3J4VovG218txMsF8GZTQ0lQVK4b2mInM5JpQLDeg4Q565Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155848; c=relaxed/simple;
	bh=ASObSo+0+eKvDuBgBfGr6fJLZeslfvltu3qJp1NIVu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdyQxWoQfiAIh9zyu9KMzUIPz+/W+RwbodvToe+RODLIIEx7NjROGSvCRl6aT/AE+uRpKBcPtdEtZbw1MKVYsmWwsrT3qioYLUKrHC7xDvKFyUJXC1AKYL6Ry/7JlZZMH68oKVKwJETzAUEYr9v31cb/4fW49Qy6v1MGkCMHCUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BzFd2GcV; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BzFd2GcV"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4BB5B80EE1;
	Fri, 16 Oct 2026 15:04:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vx6cgfZdlPon; Fri, 16 Oct 2026 15:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155841; bh=ASObSo+0+eKvDuBgBfGr6fJLZeslfvltu3qJp1NIVu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BzFd2GcV2q6XZiofxh26m+3qaQeS9uUvF8mfZGHIkGGqy+yxg+Zzfv2hjHcAK39pm
	 Ueyt+R/II0DdxCZyZg+tfxfc5laJCAJ4mWDII3s6RB+NQryyDZ47EiMzTdATpAXQTt
	 7RVHd/vOfO8r2x731fkZ4nZXEL3m5Gipv7p4JjSgAjySsAFGKQaocNxFKl0bwwksI5
	 clxryt1d3G40gIZ0mNj9CFSekxRfKM1OGCJm9CuoEkRPdqQhtSj/I9CizNTb1LDwkI
	 Sa7LRYXXfsfb6OkkWMUUunnVZm13iG5VLcYnTW5WX1n+VBBojth1N8elNB6+TT2afH
	 tt5JGbsynd03A==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 1/6] platform/x86: asus-armoury: add power limits quirk for G713QR
Date: Fri, 16 Oct 2026 15:03:37 +0200
Message-ID: <20261016130342.69923-2-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
@@ -1130,6 +1130,19 @@
 			.requires_fan_curve = true,
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.ppt_pl1_spl_max = 80,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 80,
+					.ppt_pl2_sppt_min = 15,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
-- 
2.56.0
