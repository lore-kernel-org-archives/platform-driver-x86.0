Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC33A255F;
	Thu, 15 Oct 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088367; cv=none; b=NH/dGXtmfg14mwOtlg+yRudqpd/An0Qjy03YEbKIEqwG4dp7zSYMel3OsDHyYKS0e1UbUiah/UYaunvh1jQRtISvKrPnEgDhVGvMzgg4BM5dZPCWuC0fZfF1/2lrmbnh/KYbTPKgcGwxeDsDBCHAb47B3wkU5ZAOV51SOPvwlTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088367; c=relaxed/simple;
	bh=Mxl9iALw2fOsN2nr4I26deeM/PlcRcI4ITOY6fMJdRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMgEFsRUYm5Hazd8jyT/p+QjrNuuZJ74KRNNNRqXa0AwkgaadxCSMRKNK/ngyX5B493ZgKbrfUyymuX8O2+ZnF7nOi7hf5BfqMG9BgzP52vfmU1Q09PeB2HFqR5FpJ0l4I/FawocppMZ7qmbmMUfZyBnzPh0exwuAwnpmnFScS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=asD76Zuv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="asD76Zuv"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6528F80916;
	Thu, 15 Oct 2026 20:19:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5cShB0eVn4U; Thu, 15 Oct 2026 20:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088361; bh=Mxl9iALw2fOsN2nr4I26deeM/PlcRcI4ITOY6fMJdRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=asD76Zuvon8VWfyLX1sJkFXETAacoNgT84dLxq5J+QhlMUnEkE9Vpbblq2Aw8UBiH
	 hPNW3uCzEC7OBiTTEpXbUkqYhpRN/hUJQfjpQv4eG+NS3VoDPqfATBqW3Py4nywjsN
	 VrpUJs0+tA3gJbO+LXd/cGFONAFvMgtqDKlxaGZiB1iXg0zIyLFaPt06vOvZQLQEDi
	 xcTli330vFGYCQ/TXPtHbdZBbdgF/d9Bpy0LFrdr8p3tnL//aH4d2anfNTL8g+qcR7
	 fAubIksspatMOs7Fd4XzxzSeY3zvfyCmAvaJMDDHOr13ASwB2OEYBS/QfQNjlKSFfE
	 LzLRngsrVqUOQ==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 4/6] platform/x86: asus-armoury: add power limits quirk for FA608UP
Date: Thu, 15 Oct 2026 20:18:48 +0200
Message-ID: <20261015181850.170862-5-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608UP laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -883,6 +883,37 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UP"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 90,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 90,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 90,
+					.ppt_pl3_fppt_min = 35,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_def = 45,
+					.ppt_pl1_spl_max = 65,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_def = 54,
+					.ppt_pl2_sppt_max = 65,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 65,
+					.ppt_pl3_fppt_min = 35,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
-- 
2.56.0
