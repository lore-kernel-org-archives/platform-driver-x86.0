Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F732F1FED;
	Wed, 18 Feb 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451373; cv=none; b=McHj8wcvNgmFBgJnquTGgPuZ4Q1YhlZOyaX+w8vSEgsgnl4mPNdlE/Jn42cyrCIAtf6A/bVdN4ah9FXvs+VfLRfs/dM5BVu8ZhYS7tFdfT3q3YFWQAL0Uh//XixN9vGfcBvUcP1FjkEYpd9qXL2JRZ+vi2iTNZuqwil/abe2JoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451373; c=relaxed/simple;
	bh=V4e/dfQLP709BVkvEblRD45vHffaV4EWutqVnfPjdnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IeZq297nyCuWN8buP9cREc0oOfizOZvheG1RXm1ZmORc4c55YU3sl08cHoMzKMOtqLahmPyNG1E98jsYhRYt36UcyovuHn6OxanCp1saLdy2g0l75chV+I53Lww4CnVZXBLW9GG7Q0TWSo7zzjv/AfQGGrwaFpGae2gAz0e0n1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BiIgxhUZ; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BiIgxhUZ"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 847505E646;
	Wed, 18 Feb 2026 23:49:24 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 27EA65E63B;
	Wed, 18 Feb 2026 23:49:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DA5E61FEE59;
	Wed, 18 Feb 2026 23:49:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771451363;
	bh=ZtG5Qxc4zj/YjMexHCgnOw+V1TqIvnsFm5cqh9n3d9w=; h=From:To:Subject;
	b=BiIgxhUZVfA+CwEj0rpOYEOlbto8lZGHvrEtcNbTbY3n7prmQyhRpEseyJz4xr56i
	 I9Jc3AGc4mBH5x2DEV6kcSeHygO6jWTKXcpmN6WZwITZGUtw5pjLXu76J32jE5kO6i
	 j1uKY3yOAM3RGYMD5gXkDcZkrKRKq2ESV7vSKLLZPmvp65HTj03AvjggcUw0xQ9J3s
	 trqXbjbK7r8NPWteZ17K6KtdDMeWiKznxYjuPUZCQyCp7O5ABRIu9JEXT7Dw2KkHAd
	 SvVrmH8j7bhpeH3G0t6qkw7CvGO6rz4Nvqxa99HWYO3HxN36TDK+bL2xGm6fz4WlZl
	 9ni+pZQHHBqHg==
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
Subject: [PATCH v1 2/4] platform/x86: oxpec: Add support for OneXPlayer X1z
Date: Wed, 18 Feb 2026 22:49:03 +0100
Message-ID: <20260218214919.449636-3-lkml@antheas.dev>
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
 <177145136334.2900445.16448847226099897838@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

This is a variant of OneXPlayer X1 A with 8840U. It seems that only one
user has this one.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 59d6f9d9a905..623d9a452c46 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -219,6 +219,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_mini_amd_pro,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
+		},
+		.driver_data = (void *)oxp_x1,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.52.0


