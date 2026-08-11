Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F03B27D5;
	Tue, 11 Aug 2026 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431455; cv=none; b=CtNMpsYOMcgWFHNxT8rkNaOof3LQUQNTAryrwvaZDAmXNmFXtsnWUGgLI/3QyTAWfigBc/NCvVlP5L5NCnapO67pMjODswh9NugwZv8IVUWfaZLWemO2126KJ0d+In7KSu0j5xaHkO5/gFTtDKrUHTDYkcSfyvsjdugO6eCFnbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431455; c=relaxed/simple;
	bh=RmXSlV5Mp4ZoLokZvBVmcymyIVxhAia8q5jS15TpF/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJkunjln/yHsLrlTgBgE5GnDp0TqQhEKa92NGXAjRei4IRA62ovMlqzSG5lUkhx9F9P6cSP+vjEmjcN18aOh0hZXKyfbxwhpGgmqIG3sDJJQ9oAMTLVAXJAYgewErwyqiRCWnMViiaBdvKe0Nvl9/wItqAXEzrvlMP7ULh+qDuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MeRm7Ggm; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MeRm7Ggm"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1FF1C4349B;
	Tue, 11 Aug 2026 08:57:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NW2x60HYwTJY; Tue, 11 Aug 2026 08:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786431441; bh=RmXSlV5Mp4ZoLokZvBVmcymyIVxhAia8q5jS15TpF/4=;
	h=From:To:Cc:Subject:Date;
	b=MeRm7Ggmn2qt0DqAmFVIwANrwt6mCUTyQcAXFPyJ4Me3pOzlHmO4I2TqTLWVicg16
	 cyVflouSVI+tii17iaj7UU/5cZHISAy1llvo5R/NwpyYF5urwZBCn50mEtms7MLPum
	 Sv68cpfV5fcWPugB761BregTkSWP403lPSqzxVFv9q7fY42p7inNZHIpwN4r4ycbaj
	 SxxFSrTiLwAt1lVoKbi3DuO7OXxMC38Uk2lvQZGsFdTKadKGgBer2aiw6Mp/OUSOyG
	 n6p/4GEV6MTaKG8TskK5AKdPOx/ieGE38cxKwaQvZ5TBu6xTmWxnLIFgaLnlnA2MS6
	 PET64eFCBDVbg==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-armoury: Add power limits quirk for GA401IHR
Date: Tue, 11 Aug 2026 08:57:03 +0200
Message-ID: <20260811065703.6626-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add power limits quirk entry for ASUS ROG GA401IHR laptop.
The limits are extracted from the device's ThrottleGear XML
configuration file.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -966,6 +966,20 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl2_sppt_min = 15,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.55.0
