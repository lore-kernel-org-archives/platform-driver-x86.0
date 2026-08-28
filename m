Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3653C1D56;
	Fri, 28 Aug 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900376; cv=none; b=SRHdEzR2kvnnXKFfPbgOuWgR4lmtVPNaLm2vq9drCHxRy9UTk5y9LmEMUkneJnVpu1kH/CG0Uubyc2zrcSzBiG8rRV4c/XWa5aeACG31hyr4onUUd6QVKP+8BbQqdsMp0JSqDumLBvGkzfL+7+RuOW7vqkzym5nzVgRZ2Z9WvTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900376; c=relaxed/simple;
	bh=o1C2EDwKr2DNH71cdifEGbUkSRu/14k1VLApC0DUmSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eaCE5jGQdlU3ZS+FoKgP5H1BjzeWlz439sHVOsvqUAj4LoZKwrvenvZHqcuQ8/K1Z6I+KmvlvqE9APdpFfD/9koiUkZO3erACocrQVBQUpwdLIUl6EzO0PA7UWrO+GCo0BBvZ5ND93wNcVf5QMMb0otwaZ5ZEeFbmWUqn62xzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jgxaEfCj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jgxaEfCj"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 75DD888283;
	Fri, 28 Aug 2026 08:59:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSWBirneRrZK; Fri, 28 Aug 2026 08:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1787900369; bh=o1C2EDwKr2DNH71cdifEGbUkSRu/14k1VLApC0DUmSg=;
	h=From:To:Cc:Subject:Date;
	b=jgxaEfCjawzCG2HEX/z5AU9MBW0mNiEco0Lv3ZZ7qFRgwYiDmdwNu8MbF7wm9oFsv
	 kAxW7A/sZHXbghfcPWgIp3mHLRtnYrZmUlJ9kC/sIbBVSSIeTlN2xcS+7KP8/ABe20
	 BjqYkhgope6lKf5kry96iu5iBkHW/4lIhdAtvdGexMHm7rYTuO7AvnC6M9sJU/emAu
	 wADGOXLZSroBhkmmfxPua+vGI20YlmDx7bqGGMH5AVyKytbQ7fasCEfIz7N6TOxbzh
	 5gNwAsx8FaqURtxx+2uS6vVUmOJxpSJQE7S0O0Rjx1DM8qWlr0pXZCKj2OVNxoTu+7
	 MAoi3LdDJDEPQ==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for G614FM
Date: Fri, 28 Aug 2026 08:59:01 +0200
Message-ID: <20260828065904.11355-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS G614FM laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1056,6 +1056,37 @@
 			.requires_fan_curve = true,
 		},
 	},
+		{
+			.matches = {
+				DMI_EXACT_MATCH(DMI_BOARD_NAME, "G614FM"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 5,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 120,
+					.ppt_pl1_spl_min = 30,
+					.ppt_pl2_sppt_def = 140,
+					.ppt_pl2_sppt_max = 165,
+					.ppt_pl2_sppt_min = 65,
+					.ppt_pl3_fppt_def = 140,
+					.ppt_pl3_fppt_max = 165,
+					.ppt_pl3_fppt_min = 65,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 65,
+					.ppt_pl1_spl_min = 25,
+					.ppt_pl2_sppt_max = 65,
+					.ppt_pl2_sppt_min = 25,
+					.ppt_pl3_fppt_max = 75,
+					.ppt_pl3_fppt_min = 35,
+				},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
-- 
2.55.0
