Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48023612D6;
	Mon, 23 Feb 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871422; cv=none; b=Z1AOJ66GBCvwHWsuuAuZfbdQT6UYGKpHAMy/BG33Xmf+YdyHpGlb7l5bOMvUW2PwR4i2zqrJqttJpiScieiZc55ke2r61en15e9tFfvv8PaO6c6/XIpSTzwb/KXg3EX6Kw3LenacTeznugIfvOvYP5G9jLY8ihA/UwXgaYnMwhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871422; c=relaxed/simple;
	bh=RuCYhouHXTeKNE/fGCPiYgnUD7FM7H/u1CDu0RqRKSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oL07pf/WH+O5AD0UY5HlTMu7leW/CiSYV4HII4Fo7C3t2BpsQTmU99o+ipy3Nf+eSF/Ipjhe9K6dHYcp/jIa4PkM9iXJ3ec+MNlXeXucMius56tJgt2ZK83GvjdYz/agl3z6y2AkxjYLTJbKkivQ7uxhTQykKhAGr5lvCWiLALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZFF17PFn; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZFF17PFn"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id C25E0C1242;
	Mon, 23 Feb 2026 20:30:17 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 5F0CDBD497;
	Mon, 23 Feb 2026 20:30:17 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 83D2D1FDAAF;
	Mon, 23 Feb 2026 20:30:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771871417;
	bh=AKE4s+tYM/l7y9CIb185DAIMomBBYh/eQd3Qu/YHPf4=; h=From:To:Subject;
	b=ZFF17PFnrq3cUCwZWWjudhjaZQOF3+WAm/5hrdy7n/irssuGJ+Wuw/3nSH9l5hjXT
	 QSmm98C2SMssFJVZnqPhflXLOOH9i2Wb/tbhrhRTEv82P3pngJNqpqB8haYEzSwpzR
	 uFecMGobhvFJjD4SYv9rZ1nIQC+WGPnSwQ57mkq1IChowlGmW4kWliXx2vSivpi5Zd
	 yAWT8jKYxrnhON7mYb4Zg4Q4nWxmoWiTFfCX8vROv6fqQdFibAsI/p9CRYvDQhNO+f
	 7dqN75esBvOHf821ZRuGlgxioHd9kIB5s2N9hcYRarGBB5DSfcacVVaAlqx+dylZs2
	 AzffxeTU2ZsuA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 4/4] platform/x86: oxpec: Add support for Aokzoe A2 Pro
Date: Mon, 23 Feb 2026 19:29:53 +0100
Message-ID: <20260223183004.2696892-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223183004.2696892-1-lkml@antheas.dev>
References: <20260223183004.2696892-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177187141706.873973.17697439456927662006@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Aokzoe A2 Pro is an older device that the oxpec driver is missing the
quirk for. It has the same behavior as the AOKZOE A1 devices. Add a
quirk for it to the oxpec driver.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index d6ef8dbf568e..6d4a53a2ed60 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -114,6 +114,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)aok_zoe_a1,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
+		},
+		.driver_data = (void *)aok_zoe_a1,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
-- 
2.52.0


