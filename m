Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE27366DAF;
	Mon, 23 Feb 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871424; cv=none; b=IIG/9v69FagYMzsUMrVGIHAFaxTFWytWvL3S1jG5gucVQ7Awp3aXnDAGpASzUwEHQ/QQrmCbmexuWKY85txPUoIQ7ujq7Ab+iW0WoYGVJwx/gKWVg59ttnBp/BpQhtEtEw1vR2mEznSHhUPP/6Hd/5wR8DpzIZnXG19MvCXq0Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871424; c=relaxed/simple;
	bh=972RJD+OLBIDqX2hpJMSAOo8JFWMJZAzxPkzVAEjFqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eD7/0OW0jUUfajV51aFQbzfNxvFZo/mN92Brz4clIkEO/9AFK7s8xS1dpIn/RQMNeTaveFOgrr92oGv8XkPYSUz3j5XJepEavpEj3vIm12Z+PUC0382dcAbx/mAc/IEFaa/QizcaIlaZFrKLs48FJk2EiIuEgAyAo7vrFPpAcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=X9q6wEJG; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="X9q6wEJG"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 38BD85E5EB;
	Mon, 23 Feb 2026 20:30:16 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 678125E520;
	Mon, 23 Feb 2026 20:30:15 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D5CA71FDAAF;
	Mon, 23 Feb 2026 20:30:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771871414;
	bh=tSout++RBG2QfdHXmvyQZuEWkftBkNAV8Y15o5wRbNA=; h=From:To:Subject;
	b=X9q6wEJG/xK0zL5t4zDEjNUg9uHcbyLaFyMU1lKTUo2SMEUr/9M0ejpL4L6UTlLXx
	 uSq93+rRhQwO+yppGR7h7JjANg4OEB/NFlzwj4aCm59UiC0ChzlrFdwpfuAPla4D5V
	 eny/4n2cx+fj96+EXXzPUQrOszt8DH9sEXgdbOFt0gBo0crqETmzDOA5QXkYHwDcIa
	 SoJpznkOHEdjNKcevor/ti5rBQV3z7Ggb/qHcoEzOsx42+539PGfxnijewGkmqBIg/
	 nFxlgE4VOeRWzQv3Yle4vf0rZOwArds5qTSkECcfH0Ps5fXPcxOSeGrjkEmyTB3AQQ
	 QPt61OQic/VZw==
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
Subject: [PATCH v2 1/4] platform/x86: oxpec: Add support for OneXPlayer APEX
Date: Mon, 23 Feb 2026 19:29:50 +0100
Message-ID: <20260223183004.2696892-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223183004.2696892-1-lkml@antheas.dev>
References: <20260223183004.2696892-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177187141447.873734.9925245740030716156@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

OneXPlayer Apex is a new Strix Halo handheld. It uses the same registers
as the OneXPlayer Fly devices. Add a quirk for it to the oxpec driver.

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


