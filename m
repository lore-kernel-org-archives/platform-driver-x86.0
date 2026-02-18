Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD42DB7B3;
	Wed, 18 Feb 2026 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451372; cv=none; b=fiXddo+xyde/Nk/iWv15M9pRh48UvLzhrHXHIrB8nWEpCQol+65fBsbigDeFRJFgBWhxzIYzLZOC3gjfIHmA9Ulj0KDud8ihaRBWQ/2x6+mY3DcKmIn0jCxS4DfLthvLff/BT3FikkBNmRKXaOhdB+n5TKDNTrVRfRhDDQVJBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451372; c=relaxed/simple;
	bh=a+QTjQcq93UeZIJfPRHlltoM1hi1L1M/xrgAjtzR1ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2TPqO199OIKjeL/JAolDypG9OuRA4Wv2g/cs3MqfcwunOSD7z6EijOM/0azerhXQVzegMXDSRZ39FCUAwZ/TZd5ioyUl9dSg5ZdGr7ScIxkWZxAVA5O2A6/a8n8SQFdnv99WeawgQWo8JtGm7vObMk4Y3Cy4CwRwVIYbtUHfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nPZtzwNU; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nPZtzwNU"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 7459D5E647;
	Wed, 18 Feb 2026 23:49:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 1A7735E63B;
	Wed, 18 Feb 2026 23:49:25 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AE2B51FE9E7;
	Wed, 18 Feb 2026 23:49:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771451364;
	bh=DWCGS6uMDm31zuaBfOZ/L8KknCrtj2ttCofgBxYesy0=; h=From:To:Subject;
	b=nPZtzwNUbReviV7eR5StgqoKoZee2g5eVhyaqgbiBgUD8vltNz95QuEJcLfPWWI1u
	 RQo4G9VICTbiYnWmr1ZW3Dop6yAtrc2jp7I+YJw2PPNXlLDIXSyR99vWnupfzkhl1q
	 e/DGpWKJtqBzxlG0wKwJYGiP341drs0It3kS7xzGdoFDeMpxQO0X2qL8fumOrab6lN
	 J00MSaG18jja2Ha1UIIlwa8NT8fV5UPq3l/MNHDlKovsq15ocjOvektB2Fd3Z/3oj9
	 pgb3FbckcrM53IoOyr1hxvXE4Fzd3pgCmE8Jn5LYN5ewBk/uKIyYw5mZlVOjQkQAuD
	 L66FNPNVzQi5g==
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
Subject: [PATCH v1 3/4] platform/x86: oxpec: Add support for OneXPlayer X1 Air
Date: Wed, 18 Feb 2026 22:49:04 +0100
Message-ID: <20260218214919.449636-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218214919.449636-1-lkml@antheas.dev>
References: <20260218214919.449636-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177145136418.2900493.15263682106986794672@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

X1 variant with a newer Intel chipset. Uses the same registers as the X1.

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


