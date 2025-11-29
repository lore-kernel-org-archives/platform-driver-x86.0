Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2F26F299
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426393; cv=none; b=AHuH/W1LD/U/Wq6Wj2AxvXl4BGFIkIGxzo5cmfB690Zhc9R91NpVU2kqqvht9K7UK/CLNHO7WFY2o2ofAg/udjCaAgqHdUXZYcF5q9daCipDRrsRSyvR9NO5Thpg1o8WA1DGhKAqPvoPWKttCM1NEW0fBwG1TTF+99HR/XPwvjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426393; c=relaxed/simple;
	bh=/jBmx2Wapxxwkd+H+Xh+8/chAEo031HqcDF3AthVxbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gw+5DuG2+vWpgtAN3Ru4nBPK123SxyA4/5InQWSLRxVDrBLIj8I+bgjHhtmJUZ4sa3JNJ5UmhqXYfaFBrcFv+lXYpfTsAfXEhK3oG1EePle/yaD+7TVwQRFx4nq9RuX+VKmFjGmGjlvbdy3ewoP/xYq26dkfa9nzYIfgFY+DUyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HdbdbZHs; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HdbdbZHs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764426388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IY9UUw14IXgmMrM/diyfL6pxylWuvaL+8vmwiexvwQo=;
	b=HdbdbZHssCv/FVTPQ9FacaIxZ+7mvVQQ6NNgK/tfuWikHZifiZJKdrsdf3XYyVQvRoMXTo
	mZIaSbL7ocxHC3bg70MeBwH6F5GD9XmQTwwQijnqCKSzfW2AWdOfTpqmQfcHb8DDcfAHwH
	oNwcNYXZDtixBnzxZ7Q6/qn+sXnLEJ8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for GA503QR
Date: Sat, 29 Nov 2025 15:26:21 +0100
Message-ID: <20251129142621.152027-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GA503QR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 40fcd7c04b73..a1bb2005c3f3 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -822,6 +822,20 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA503QR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_max = 80,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA503R"),
-- 
2.52.0

