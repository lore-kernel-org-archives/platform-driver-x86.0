Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13852EACF9
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 02:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606482; cv=none; b=rVhAOGf29HEVZpRQ8LPgVuugRUCPksVc50BbZ6JKZhgw5LSiH5Rx5SUkusKnBNQ1J+m3+7zk73FavD2wTcTALaGIUmyBEv65C4vhS06JpYdteauAZul2yhO1kwpfSgJ5vHrHABq+FUFKX+IatbQI+FBH268LEYTz8Sp2Cdn4VdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606482; c=relaxed/simple;
	bh=jFwNwWdjU6JFz1vlO+bddlmMzNe96JhQtmbtF5Zah2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5GiFFMIUuG/xSW0pc5bnrqDgeQ+y9tpmH7oavIzQYwAnwyfGBl5D67+kMQUViJ4zbDL8trfUQZspD/I4rSq6sl9dqpGziTgglC5dk3nmW0oRvIoY1Mct8TURabDuyXSC3wibhj777j3lZbsdzhHgbO7zXHCf7lLE34lW77srfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LNlyhOn7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LNlyhOn7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763606476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GXKtuN+ygt1gHTstlLD2fqUyrh9LM0SOKM3E9WWFJi0=;
	b=LNlyhOn7sCoSvgPYUJ10KE74QavcLRS3/07la1jh4iZKtfS0CzcJobdwwH7p7A0Gj7M9LA
	dXDfEUOdG+m89FqOK1qWYkoFrQkz7XjxBJhjdPFxCT4IGqnZJi0K2ptpHZaLLX8rVycIwh
	LJhYrPfkCV90++EUTvq618q34bMEHF0=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	"Denis Benato" <benato.denis96@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix mini-led mode show
Date: Thu, 20 Nov 2025 03:40:59 +0100
Message-ID: <20251120024059.1341326-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Perform the actual check of the mini-led mode against supported modes and do not return the first one regardless of the WMI devstate.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aR1xbxEQyQPEvB9o@stanley.mountain/
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index d6aba68515e2..c4919f3bf4b2 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -373,7 +373,8 @@ static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
 	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
 
 	for (i = 0; i < mini_led_mode_map_size; i++)
-		return sysfs_emit(buf, "%u\n", mini_led_mode_map[i]);
+		if (mode == mini_led_mode_map[i])
+			return sysfs_emit(buf, "%u\n", i);
 
 	pr_warn("Unrecognized mini-LED mode: %u", mode);
 	return -EINVAL;
-- 
2.52.0

