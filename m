Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F008F48;
	Wed, 18 Feb 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451373; cv=none; b=Ws5hV8prnrQB5B560UuS+YIiCcFERHk7wZCzOwzb7javVW5o4DI6TkgA6fus5i4de3ef+VUeus587wt4kAzv3rU+JGfHMtaD2ii1GLKbfkuxXEoHoaFPRnhlk0c7Y4w3J66QQ3nZDigjvaBSm9AypRtuPmVAZ7o63ZsyR24Wgks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451373; c=relaxed/simple;
	bh=dQBsDDew/w/8pVhKWdHql7C8aexDFjUTk51Wh8vjANI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a97k6iWsOHthdtwoU6/nSoW/JLieNphKqqYMXwFrT8XnTgywoAMeVxglNopjtchGw9h1TAqJlDjfVtjQSRBI/BUIs1h3G78/XPZVtdiE6pN+KJ2Q3k6F1ZrepIZo+udEzBam/Bl/0OMNchHUMKJumAhjPtOVPrNIF1CkRoiFWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NsEqignG; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NsEqignG"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id E70255E612;
	Wed, 18 Feb 2026 23:49:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 6DEBC5E63B;
	Wed, 18 Feb 2026 23:49:23 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2B9211FEE40;
	Wed, 18 Feb 2026 23:49:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771451362;
	bh=7vZFNINFavKdPoue8+rbC3CtxEI+rqdmvQI60cjkhUw=; h=From:To:Subject;
	b=NsEqignGIsObFgKGwWlM7vjHTNsS4iOJuFTT8W3bYpm9wx+0+fMOrxDTv7FxFtBij
	 ixHIBsTAD5Uge1b4cn+EuSSk0evfRnKDVjcyDxIPTe0wMjEujvAglBpmORZHv4E9fr
	 aSyDG+55FQZ7JZKXDERIHgfSwhJDMwBEE4InL+C5a8eRvGJjKpx5KO5ITmQkAua/Gd
	 T7bkJKytBLtY1P7Ug+P5Y0DiiRFti4yMcPwUX8L5DwlSVOoUG9EGpg45qVhfmsmeKv
	 tZkt0lof/rNTgDIDeC2y1bUaQDP8olST3OhC4Y+7Sc4znC6rxcynYIR1QahLO+e62r
	 vV6WBAKTYH4rA==
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
Subject: [PATCH v1 1/4] platform/x86: oxpec: Add support for OneXPlayer APEX
Date: Wed, 18 Feb 2026 22:49:02 +0100
Message-ID: <20260218214919.449636-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218214919.449636-1-lkml@antheas.dev>
References: <20260218214919.449636-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177145136261.2900407.7316984913005843633@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

This is a new Strix Halo handheld by OneXPlayer. Uses the same registers
as the OneXPlayer Fly devices.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 144a454103b9..59d6f9d9a905 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -11,7 +11,7 @@
  *
  * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
  * Copyright (C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
- * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
+ * Copyright (C) 2025-2026 Antheas Kapenekakis <lkml@antheas.dev>
  */
 
 #include <linux/acpi.h>
@@ -142,6 +142,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_2,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"),
+		},
+		.driver_data = (void *)oxp_fly,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.52.0


