Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67E43C043;
	Tue, 30 Jun 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829830; cv=none; b=hG8mkZjVwInkPLNvHxADSKX30X77UzxnIQgwxE35CPGA0ZHLm2Zsch672Pu0zcCkhh3f0qMivyain/ew7jnYUGnabr7Cy1us/Cr4nbf2pr2VGRjzB2/FCvArOj8BdPGBi80nMAKemfnUgQkkh7fcrBNFt1/vl4y4oUk+jMODJYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829830; c=relaxed/simple;
	bh=8E4V3yXQWcq+36pYg2Ldb0IHR7VodmbkPcJJYLNh9qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlIJWnaH+4E6sRzw+R41tEzJ74Q7zFWHvilsTaKypqrE3Bg4yZT5qvTONX31u0PS03npQ394t8LUG5LEw8+iZJP7LvYsUDj+cNeAmX7aNU663nEnRDnxy6ew9ZDMyGD1iAWH146BOD1NV5j+KrsT2Wq060ZvPj1oNjzcfKtin5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=D8BroQET; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D8BroQET"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 80ADD840AB;
	Tue, 30 Jun 2026 16:30:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP6FODgP6tFv; Tue, 30 Jun 2026 16:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782829820; bh=8E4V3yXQWcq+36pYg2Ldb0IHR7VodmbkPcJJYLNh9qk=;
	h=From:To:Cc:Subject:Date;
	b=D8BroQETjTzBOqu698R8v6DHveACFUX6tgJw5SfRUIwfWEswCBi41D8sNZ4LaFkEy
	 nUcb47cg0YEW496bS3sHg3ldrQtZOmIrhvztVcXnyIQyP1eg1iIl0SJthUyiGDUnwO
	 m9vHTZ5U6tOtZronWiGznDOwLUYvZPKC9lao+RbitiDljfsQMlpzMiez00eWax40fL
	 XsO5zWBN5i+jqKmo0EU5rCcCaxneJOY/s0f2a467TETltsMSGyPGf0i0D9jwIHbfqv
	 yFmgB0UB6qfM0iZh2aV/EDFb1nIMqDiDRNZBwWC9RL+gn9M/yVL7gfdq+hJtwMiooO
	 TeoUjzWn4BKwA==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-armoury: update power limits for G614PR
Date: Tue, 30 Jun 2026 16:26:35 +0200
Message-ID: <20260630142957.7751-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previously integrated power limits for the ASUS ROG Strix G16 G614PR
laptop model were incorrect and too low compared to the windows counterparts.

Update the power limits to the correct specifications based on the
platform's hardware capabilities:
- Increase AC PL1/SPL max limit from 90W to 120W.
- Increase AC PL2/SPPT default/max from 110W/125W to 140W/145W.
- Increase AC PL3/FPPT default/max from 110W/125W to 140W/145W.

Fixes: 6b3bbe770f4ca0439710b7c42f88b9f6eeebabd0 (platform/x86: asus-armoury: add support for G614PR)
Fixes: https://lore.kernel.org/platform-driver-x86/20260610152130.25892-1-scardracs@disroot.org/
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 65166b50a2c3..322bfa647c2d 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1997,13 +1997,13 @@ static const struct dmi_system_id power_limits[] = {
 		.driver_data = &(struct power_data) {
 			.ac_data = &(struct power_limits) {
 				.ppt_pl1_spl_min = 30,
-				.ppt_pl1_spl_max = 90,
+				.ppt_pl1_spl_max = 120,
 				.ppt_pl2_sppt_min = 65,
-				.ppt_pl2_sppt_def = 110,
-				.ppt_pl2_sppt_max = 125,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 145,
 				.ppt_pl3_fppt_min = 65,
-				.ppt_pl3_fppt_def = 110,
-				.ppt_pl3_fppt_max = 125,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 145,
 				.nv_temp_target_min = 75,
 				.nv_temp_target_max = 87,
 				.nv_dynamic_boost_min = 5,
-- 
2.54.0
