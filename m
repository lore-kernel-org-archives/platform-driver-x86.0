Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640784;
	b=eW/61fQjEYOyQScsibeqpSOQQGdZXP5rLXYh95FB1gnCEimjibkwd27/EuYcmZLEXo4h
	 T8AFlC9IIqMWfR7KGGVieLFjLnzgUCYXgCd0gMayHn3qnkAE20gkTGbrpwsi3ZKTj/8zO
	 BQZDlKuKacmW4lkMjIQXUlUtrhj3B9gypf4M6Lteg+pDuRd6AaYNHLUD/SWemm1tuBzoF
	 j43LxFaI2r5yu99A3NK07Bp4aPcdYhh86iiR8ta+j2d4MvjqzcZjc+mRn0VQnLeHjQFKc
	 RmHbJKAsRsZHTZHF339LkC2NeZm0OWNNm+ZVyGGYDB3zDg/ra/YruoygiVfWxyhjCSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640784;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=0EmdJFYsj2aSoudRck2XkKvJft7yZSJH/U8mB4M9N0E=;
	b=WB7moBWSVlo6kIqAyNU0akQwBGrcjs3MrkZ1OGq1SvduyocM0WtZZxhFdfqkFjD813bM
	 +cbewzzFisLf0XHEJBR9tn27/Uv19zAiyJ7HruHWzrR8HtMq15xZ6Usg3Uv2QWknXWil+
	 +V4KW1o8APwlDA59eFXyDT4eVF/zRD8tf1k+dnlxZCKfIN1pY70vYENUhH6EtcTZLw6tQ
	 NVNg/STM0VaPv+42wTaGCd0rlbM1kw6LQUS9istLeWHZ9IIz5JbjzTaSFY+MTI9WRuCBk
	 mcQ8NmeN4Lc5f7VibUKIldc2+JNLz0vhizck4GJKDCqFK6bFkjrSdGg2zY0JUYtBhdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=NJ6LXLIF;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB43606EEAB;
	Mon,  2 Nov 2026 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB43606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=NJ6LXLIF
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id C8F193EBF2;
	Mon,  2 Nov 2026 17:32:55 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 4AD523EC4F;
	Mon,  2 Nov 2026 17:32:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c5:43c3:0:addf:9aff:bff3:4b66])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C3C521FF402;
	Mon,  2 Nov 2026 19:32:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793640774;
	bh=0EmdJFYsj2aSoudRck2XkKvJft7yZSJH/U8mB4M9N0E=; h=From:To:Subject;
	b=NJ6LXLIFltaaOjgMkKGeHOkIIP7FuqCK9z4GGmpsyY6U1nyHzyuebF2PAihY1bugD
	 LUTMU6m8ez9GhGKIw/fn0u91KYP4XgsVnwlz+1gAgkyqXC154YQF9d8UQ29PqxEdYe
	 BUnQyywbtiHLLHSo6yzl15KZV1dB2WPoLzMWrmk7qPLGi/K3F3Gavfc9wlwqhvNufO
	 HhC0Vd0KxVeSsfii7bsN/zaEVOysoOZBwOAYYcom7te4fjYijbtFvklLT7GgVvrmeH
	 XJo3Oss0wMJ/Fx3MZMRMSuRGCcp4ao9bUjrQl87mA9YopLLX8p2/aoSnsRSlCLfhmz
	 r4/MJibrTFs7Q==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:addf:9aff:bff3:4b66) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 2/3] platform/x86: ayaneo-ec: Add AYANEO NEXT 2 support
Date: Mon,  2 Nov 2026 18:32:40 +0100
Message-ID: <20261102173241.1212460-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102173241.1212460-1-lkml@antheas.dev>
References: <20261102173241.1212460-1-lkml@antheas.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179364077431.149122.7239780735045426249@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The AYANEO NEXT 2 is a new AI Max 395 platform. As seen in older Ayaneo
units, it uses "AYA" as its board vendor and "AB09" as its board name.
Add a DMI match with quirk_charge_limit. The EC map was verified on Windows
and then all relevant functionality under this driver on linux.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/ayaneo-ec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 08e679347e9b..b1c064fd93f9 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -146,6 +146,14 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)&quirk_ayaneo3,
 	},
+	{
+		/* AYANEO NEXT 2 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYA"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AB09"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
-- 
2.56.0


