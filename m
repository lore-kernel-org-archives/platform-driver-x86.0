Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F1582B84;
	Thu, 15 Oct 2026 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088375; cv=none; b=FSNscs6jF38+zaw/zCPZSZhePulbkReX+VbLwwwb44zFbaSlaUvNUL5A6q+317bmsIMLH1K1wD79qF9eD7hrPvsd+dtocEjtJFOgyjvPclC1BgsT4oqg0jkj6ptgqwDvK9oojAfFvsN3FgpxSkVIL/wA7GdZuwDF5aw+axT83fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088375; c=relaxed/simple;
	bh=9W5h7fQ2hxK/JSydwdasFG2UHEOHnP613csEoJz1lPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCV813oSyFe8346qX0FOFkS1L5dYyit9Tqiz6F04aGqqYQuf2cdMkCcDi994EMr238WOVhkR+rNhJR0/QQMs/r4XrOgUVYqpFTABHJrXDXrgl1S43YeFKCwZXNueL/60FOm86DCT92NzR3ISXBi4CeVg1a/0ogpq8MCq+PU4asY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dYujEd+x; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dYujEd+x"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9A02A81071;
	Thu, 15 Oct 2026 20:19:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41mTvU-nG_K4; Thu, 15 Oct 2026 20:19:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088362; bh=9W5h7fQ2hxK/JSydwdasFG2UHEOHnP613csEoJz1lPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dYujEd+x/ZI4wi4m4QzmbrYj96nA9KWftXt0mxNKOyDuHwpAciYZXCiz58GJFw7XL
	 r3lvji+UMWXS7FJzkDESMOQqmX6NOYgb6cHgj+zWidrV+QN4J81aY7pnRoq1Z5YMpp
	 seDD/ZlkoIQEeuiytM57Y1H3M+Cx8gumEXb0NS2h16FbwSXlSn+/r25wEivqYSFOTW
	 eklxTlZyCTTZAd+ChD5pn+Rc9Eax9GN6Q8oxnLX0npFAAn7agVQchH9d1Z9erzR5UL
	 X+iztYfMX927GmzlrXSd57Z5/anEtMjUq3U/OSeDJagf7HelXTWw0EKJS81zpN3ZKf
	 3JHknvObdE1tQ==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 6/6] platform/x86: asus-armoury: add power limits quirk for G533QS
Date: Thu, 15 Oct 2026 20:18:50 +0200
Message-ID: <20261015181850.170862-7-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS G533QS laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1223,6 +1223,19 @@
 	},
 		{
 			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "G533QS"),
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
+		{
+			.matches = {
 				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
 			},
 			.driver_data = &(struct power_data) {
-- 
2.56.0
