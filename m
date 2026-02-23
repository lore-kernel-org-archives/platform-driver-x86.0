Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889E3366DC3;
	Mon, 23 Feb 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871424; cv=none; b=NqrmFBHx4c7D0cyv7A3hhIczrK2MqzNwQGhbT/Jt/fIdIa9JhksTj+ERHET9r3hrXoFtdZW+9vJHqd+MiC0kfYVpxuEwFGAqgQJb5BT8Tf/IdTM8angJc3teiOr9gYwyKrOmg+6DK6L3hG175QB9TuQD5rae4nBJtH959FYNK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871424; c=relaxed/simple;
	bh=A87cHiHCE28vlW+x4VkL4zV/QtfABZiUHL7u9OL0XSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtKe+UHa3EVW+U9+AOXC+DF6sSkYzb1lR9CW5XfX+w5pJfs77BwZ/l5MXOFkD8hBuX71optIcuiWZ/kXjujj9gJ0L9McZBel482IanfjZyzwBWirDIOcT6pvQgTX7ts+ggqrUsfWCcyrpCknmtiEzaxkVUSaVPcENjtDwvUzXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VnskQo8o; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VnskQo8o"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id A55695E5F8;
	Mon, 23 Feb 2026 20:30:17 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 19F165E520;
	Mon, 23 Feb 2026 20:30:17 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B3D1F1FD901;
	Mon, 23 Feb 2026 20:30:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771871416;
	bh=s1n81dNgEatfjhjXh8PHUVxGiU1XtA7AzYx69seAa3g=; h=From:To:Subject;
	b=VnskQo8ooHff8TIoaaNT/dS+ClbSHfNGSD0bzU2pIYV+bsOOVPe5mB2Q/RGMFFokX
	 G9ZQUYBplERIGq1+jGQOefV7Tui2Eo4XkJys10JL/sxH4dwaahahybcNugIbCPSkEm
	 /DDl17M0cBZN3Znskj6ledtBIz05pCgRoVT0v0pEo2nk3U6p1ybG4aLrY+NjsLfALv
	 2UPEdbjZSVUaXNWEdoa/lp6CuP9yuce2HyVQQg9+YBvWzI+fHdXo71foh0IsfQJTtw
	 OJFnRweczVD7Ma2eM4oV+DqjJdrwQanAVoQMHqW/4SzazO001XDI5zI2A/cEn5x4ql
	 B2NDD7P+4wbLA==
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
Subject: [PATCH v2 3/4] platform/x86: oxpec: Add support for OneXPlayer X1 Air
Date: Mon, 23 Feb 2026 19:29:52 +0100
Message-ID: <20260223183004.2696892-4-lkml@antheas.dev>
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
 <177187141624.873929.13954944206295933031@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

X1 Air is an X1 variant with a newer Intel chipset. It uses the same
registers as the X1. Add a quirk for it to the oxpec driver.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 623d9a452c46..d6ef8dbf568e 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -240,6 +240,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_x1,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Air"),
+		},
+		.driver_data = (void *)oxp_x1,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.52.0


