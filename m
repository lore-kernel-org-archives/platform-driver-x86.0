Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC2345CA2
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254659; cv=none; b=Ds+gLKNh0veENa0+3N8XK/0hkFbZ5aF3Z4my0oBuowpzBXoTDMj+Wi0NlJH4ct34sS3qHNcDoGqo+NS7Ii6+haLneH53FzmiBMr488bZGeUTWocC8xQ6BYxymtEOK/dsvRVTWPs5InNufxsrY22HJCYQduup/tZFjzmAcjyDHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254659; c=relaxed/simple;
	bh=/pMYFspFmOQA1lE+NRAPvYlCzCFxWQLmbHwv1bid/kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SE0Yxonaeas4Htz5adG9qD9hlhtLrNhbeNNCQX7x7Ypk6LzcJ6UJVgGG3+kiAzBFzEioanVyk5ebK5pthFv37NCdBlJGOiE8XBv0oMPCfpeTpFk1F3vNxlPZTpuErF+7b8vfiSxZAU4bD5watEz9PSl9E9Pc40fbyQ4Aob9ViOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MbGp5jer; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MbGp5jer"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768254656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ns8Qg8K1YFyIDpiL2nah6q8gEToUHc0fliMNiN9J3RU=;
	b=MbGp5jerPu7+Hfi/fUJr6+AOM2K3ISbo/ZWbe7vAndyV29odZPpTYhTL8bRtx6vx2s62kj
	gAxVvgl5aIZ/Uh3UCEkBsaSwSnX6iHGNKLYgm3Uwr6oEWDOjMLYFLanbL0T7unk6FG3U8O
	TCjBaGtnHlGky5PAUNI+mj5ztAf8LNg=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 3/3] platform/x86: asus-armoury: add support for FA617XT
Date: Mon, 12 Jan 2026 22:50:38 +0100
Message-ID: <20260112215038.575883-4-denis.benato@linux.dev>
In-Reply-To: <20260112215038.575883-1-denis.benato@linux.dev>
References: <20260112215038.575883-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model FA617XT.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 2e3dd3b17b40..2f49cee21a39 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -732,6 +732,25 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA617XT"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 80,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 145,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 25,
+				.ppt_apu_sppt_max = 35,
+				.ppt_platform_sppt_min = 45,
+				.ppt_platform_sppt_max = 100,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FX507VI"),
-- 
2.52.0

