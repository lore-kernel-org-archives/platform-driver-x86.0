Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51442DECBA;
	Sun, 20 Sep 2026 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931094; cv=none; b=rhjNn6SCjvhBO4xPSdDD5CztHsfEIiY5qgsOfM9/MM77rMxDyruP5ovaTCIxAw4e6vjs28ShZ8YIg6V9/S9RGpeXEiDkTnW2LPt9i00zE6gO9AAE+wDOZS7cxqL8U6tfoqdwFPtmfZIs9u1Wv6jN+OdDyD/CoCThnUct+34aAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931094; c=relaxed/simple;
	bh=sduPj6jJogkrA73QncBePIRZE2w3egVVPbU1J0PvDUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVJBhcgVQrgpQQ+6JolfdsgUb0Ie422oEMBzPom3Dxk/UYMZ95Sodo5mdNOuI3rLNSf7L3vI4M1pEWAjVQjIl2YJctrflwO9fGCAPsx3p/jNwI3Rl2C7gUXjOdhQNb1EBeo+zUhPShN9llWfEJe8L0IvZZFQ5/gwtEN6gwp/w7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=DSyGp7pJ; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="DSyGp7pJ"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 53BA542FE9;
	Sun, 20 Sep 2026 22:04:45 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id D5BD93F477;
	Sun, 20 Sep 2026 22:04:44 +0300 (EEST)
Received: from t14.cm.kolding.net (unknown [IPv6:2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C55FD201E01;
	Sun, 20 Sep 2026 22:04:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1789931084;
	bh=P6hsVpSwwRvavs/txZPulCxinqmpjuMbi59EmuTCH0w=; h=From:To:Subject;
	b=DSyGp7pJfkECAhy+80dXZiDEOdNGXXOr2fhdoYXhfhkT0mpnMaABJtX2rDhItIOyF
	 PzqE82ANWOZLyANWSheQjjWFomlpR1iXsruir1Q0f/HGphX2nn+rbZ7YEjOKSDKcbS
	 Pti5gl/FWrc0aF4Ft5TibPH5xYrhJbkGBEUidlJ71JUS9P1wNN8jHp/X17QO828rZ7
	 XrfewKkGhhaQXZu0Lbnf6MBbkoxGUYlXXMu6DR+ZGiT6vvpJTqagVecRoPOr0cQpRJ
	 XvILRgLIkaZed4QMOf0SO5sZN0AnCJ5+kzlx+LwWtHgtYNcfNaadCOiffhcE4q2R52
	 VueDx+kDS7ZWg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1) smtp.mailfrom=lkml@antheas.dev smtp.helo=t14.cm.kolding.net
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
Subject: [PATCH v1 2/2] platform/x86: oxpec: Add OneXPlayer 3 quirk
Date: Sun, 20 Sep 2026 21:04:38 +0200
Message-ID: <20260920190438.3444923-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920190438.3444923-1-lkml@antheas.dev>
References: <20260920190438.3444923-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178993108429.1697862.6485643199258191152@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The OneXPlayer 3 is a new Intel device by OneXPlayer. It uses the same
registers as the G1 Intel edition. So, add a quirk for it. Battery
bypass, capacity limits, fan curves, fan tachometer, and turbo button
override were confirmed to work.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 38c272995437..c4c4babe8e30 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -223,6 +223,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_g1_i,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 3"),
+		},
+		.driver_data = (void *)oxp_g1_i,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.55.0


