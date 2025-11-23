Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC92882B6
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Nov 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763910344; cv=none; b=VJFXFKFJJyIfOUghGYdFmQPxYDYLLgnrw4sL8u8/4Oan1IWcWFR9upFudpQyZFqliaBkWNVdAIJ3ZLWMWiwrwTfxtOYSKpPHrSyym1YYcqxbyhx2ns7dsaGzx6GXv/Y99iQQK0BXNPBG6KsRjL44eCPZ7APw1SgMfYiZXz791Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763910344; c=relaxed/simple;
	bh=yDjg6/5hTpz1pgDvg0DGAA4Z5PQR01yd9jlcS42CS54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eY9xFJ0LYO/zhH90JdpYC1D4H0Wh1gdgjR3XnrixUonmoIaZJHBIhGXlCXVRZpqCPm9F0rJKkzrnQ6SrRuT+P7Qo/BIlaDkwRk4RWYikPjo7NbTN6gPR7heEpC5xSHE66cueUHnga1bFSLXvUbd1WQJwRdoPN4Cj9i1/IWVo/V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dLkVshto; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dLkVshto"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763910339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIeh2Ma+bNtZ1Ujuo1YJUxPh5dcoOiB5eQU+19G6XVs=;
	b=dLkVshto4mBqM+ixY230zrLW7QCcOU8ZckotOuWGXIpAnsljw9P52vLDN53F8h4pUHqIMv
	kxMEgi+5DwWIDqHp6lBbAGcsZYcBgA+7UqxEmhNMTmBcBq3/qQXHRrLnSSjGlEpo79gth9
	SrHj32xxQguI9MAtvdSNvOsslog9I9Q=
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
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix only DC tunables being available
Date: Sun, 23 Nov 2025 16:05:35 +0100
Message-ID: <20251123150535.267339-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Module asus-armoury must use  AC tunables to check availability
of power-related firmware attributes: fix missing attributes
by using AC attributes instead of DC.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 5106e8a41e25..9c1a9ad42bc4 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -869,7 +869,8 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
 
 static int asus_fw_attr_add(void)
 {
-	const struct rog_tunables *const ac_rog_tunables = asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
+	const struct rog_tunables *const ac_rog_tunables =
+		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];
 	const struct power_limits *limits;
 	bool should_create;
 	const char *name;
-- 
2.52.0

