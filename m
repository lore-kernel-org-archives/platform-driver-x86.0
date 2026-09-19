Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B939184B;
	Sat, 19 Sep 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795803; cv=none; b=WlDIhcuMgLQKFDwBAFZ42+O6GHvDkvrDw0JPju0Xu137U0Kb9CFDV125i+ibp7WOzbMkdAfndBrtwp/5xRQ+N2VclGHwsdRluhYiWOU89XxrFRD+2Ww9fIqJszzsRdZD1aGr+OgO7n/48yzFTdkFgCZZcHqRTsN16iNR0jiny0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795803; c=relaxed/simple;
	bh=XSQUvhcjrHU/fRAAcDkdlRs55n6pc6+HQMWne4NUUl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wbvass9zhfleMPUzZ7xpcYCK3JpVGjsNR0GYuwiKtnGMFHOXH5vZDWgYRlCPddplSP29rpe9CiLkBhTmPWMgJ45gxhARR9Bpo5P3cphBwLxyV2UbP7lcvwIDtylEHVVS52ajY05azxx0QjgtoTxuswgQH7zhUQrIT+hlEBYHzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YhhPz4jT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YhhPz4jT"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A0CF582D81;
	Sat, 19 Sep 2026 07:30:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA8Hod1Y8uV3; Sat, 19 Sep 2026 07:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795800; bh=XSQUvhcjrHU/fRAAcDkdlRs55n6pc6+HQMWne4NUUl8=;
	h=From:To:Cc:Subject:Date;
	b=YhhPz4jTBSGwxvfNj8CEgjVSlIG0vYkzur7Heb0b8px6kGgYlJs7hbzNPiXZ0aJ3E
	 DBEWhN/ZdozREADR8ZHqvDMMzhZ2Nkddttj/jekF4xaaqxLdtG37tXwhEEDi5Aonqj
	 +ZZ0S8bpDKpPZqiS0oWNIEOpm+OVmYlk9/9FOlT84Zqd6Z37lDVL6wyXsFCropXNQO
	 2hndqI52RB0fwisKlAZNFgpgZxx+Zb7yJOMtqm4o8CoJTGu9vjKALYbgMgL4HdrOZf
	 pkMBurwZkPLe8aSKFEo9HYAUpNfbr6rm5C96gsv1lNF42aktHziVpLUbS5pHagkJgb
	 /hP2oMvLlsPVg==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Denis Benato <denis.benato@linux.dev>,
	Luke Jones <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for FA608UH
Date: Sat, 19 Sep 2026 07:29:44 +0200
Message-ID: <20260919052944.24252-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608UH laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -713,6 +713,37 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UH"),
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
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
-- 
2.55.0
