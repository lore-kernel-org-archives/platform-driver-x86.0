Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640781;
	b=Nc6/fvsfjOkSDzhJZ9ehMsPi8ozd8eawjBMdE//CeA5c1XeyxTWqP3Rxw535RuQpbTUm
	 vs+C8PbjxJRGSLieUovStV08wDz1P8m4wQM7sUF52XFs/GFlLFS65qHA/de1OriflKYTf
	 NCinuPmqHZJsdi2mLIaCD878Ll9BoYpsoq7MGcc2Azn6mreZxJVz+rHc/uvs7egx0jCu5
	 SN8qycjDBpN3qQl3nVGZP6VcxQhhGUT/ODo2/MvA/kCxsCshlzLcS0CAUQfTzsWgtj/6E
	 gWZMVROeK1bpgg5QoWTGBoEgZZI0hpibnMGHeY9dPvYJYfeJAs8G0ul9xKTpPe8o2UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640781;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=T2v0oKEUuvQu9ULBOJ05bNtQbhhV+eSkd1ZBIqaUw94=;
	b=XXowrI+856Ojh7zBh+FHJqYobtwFqqE1Y2lkTVij/TDuT14kKFyohy+4QXwXCGyoMDtB
	 QNB24ROVb3JulWsQzNmnq8DWDXQVa0Tbe4GTwKEr/c429waWuB7ravZITkIptw4Lo3v2R
	 pPgdSfXflAj3rSBotfJczQshCkUxt7mbmJMOtTvSaWxfriQGsAhbm37wdNtr3I/i5ehf+
	 9EfJknE57XMR/M+GJ16sZIYip9Mu6VuMpjPo76z96L35NfNanmQmBwvtSUZk021yIJ4Rl
	 GSbCrWswL6WOblTdsDT+zkhf7pscvi4ujXEvPx9RcaZ0AsFdVC1V5AKhvq/Unc42vHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Z0T+HhqC;
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AD606A595;
	Mon,  2 Nov 2026 17:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3AD606A595
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Z0T+HhqC
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id BE9A9BCA6C;
	Mon,  2 Nov 2026 19:32:56 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 2EFD8BDAFD;
	Mon,  2 Nov 2026 19:32:56 +0200 (EET)
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c5:43c3:0:addf:9aff:bff3:4b66])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 033161FF672;
	Mon,  2 Nov 2026 19:32:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793640775;
	bh=T2v0oKEUuvQu9ULBOJ05bNtQbhhV+eSkd1ZBIqaUw94=; h=From:To:Subject;
	b=Z0T+HhqCkSA1tfPxgJeSL7J8kuZmoHTCe9ydS0zh9Oy1ri+tQSImtTrFn6mKNQa5N
	 DMKtk78SRAmI1VGR9M060MSz6xKgaO4+KmGzm/GmxmVt1GFK+DbLtUHDz3GfOo0dp5
	 CJTC2L5js8R7xW8ExFdDRtV+nrAGu0fAVNOWmM1jG7p6DeOY2/Lb04EOaZeo0JwhuF
	 qb7AgQYuqrkrlKHr139BbpEKareeIo5wL7t6uhoNW01bY864yiV8PROYS4wni+TwNZ
	 G+sAtwwykke+OGAokMlB96I0Mjw7KxT8Xs6p8lQpyMDqn5p3Js+VratQoW1zD7+jU5
	 CucvUqDERLmFA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:addf:9aff:bff3:4b66) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 3/3] platform/x86: ayaneo-ec: Add KONKR FIT support
Date: Mon,  2 Nov 2026 18:32:41 +0100
Message-ID: <20261102173241.1212460-3-lkml@antheas.dev>
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
 <179364077556.149234.11341746522340280110@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

Add a DMI match for KONKR FIT, an Ayaneo sub-brand. The board is similar
to an Ayaneo 3, with the same display and similar controller firmware.
However, the controllers are not ejectable. Relevant functionality
including charge bypass was verified to work, so use quirk_charge_limit.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/ayaneo-ec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index b1c064fd93f9..c31d954babc3 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -154,6 +154,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)&quirk_charge_limit,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "KONKR"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "KONKR FIT"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
-- 
2.56.0


