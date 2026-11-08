Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170962;
	b=cXmQah8qAjS3mjMtF/E+qnUtVCfZa75nJ8e+BKCurkrgEdd1rQKhyPO8quobfbTowZ7S
	 Kqf95e76gZgEgOuxhmj+7326vkaCz29orKgm2PGoB0QG4u0W7U71XhK5jwiwdK98gv23h
	 TSM0VgjOVkPEomDkpRIKlkuMJXEjYtGY1dx1/OG9gOzwg/REf7yvz9qgNcOuPiM+Say30
	 TZ99IT50Fki960JyT/pQ3dUlfi1/puRCkaMAhNMC46H6kre+cBcM3vXS7QYvriSa9bKZI
	 kTZ6+ujCKoykWLv3natP8aF38d4hZo0qdBXlLI/FxOxd44b1h9XRnuMZCbOlkApG6lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
	b=C5XcjlMDb+K2LowCyYIr863nbZll/z4LodbtvmyWqCfXu3/thwTYbROI40G5/LtOYFOt
	 Mptvq0GZ/n1vviYR4zhRO95JWuzJX5lxUL8ZNQLxAvxfArS7cBbWiwRgex7m1qF7Zoe1Q
	 5c+mgydWW6MonHJ6bit1Csl58VGY17ZVe9As22MHNrrtQQq7KSOXcrJT465DG+jGlYSAQ
	 zjn1sIkrINjF53KEz3jstRhI+yb0h9eQoFSlHMeRat16Xgy1UjqF6oOIBfWiOo3SDZ7Ud
	 vPVWp529VduJ32IpAP9jylZwXzSAQldQkkJO0lZoW8nTz91C+GIZi2owO3K0ozmQHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFa8jg8i;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8738606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 20:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8738606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFa8jg8i
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so1783955e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170960; x=1794775760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
        b=aFa8jg8ixedNGQI/n8mEkm3ReWeHLAj6CyUTxovTtYh5rOKopaS5Awgr+l5IZfG1u/
         MvS/XOwaIbmi5x/ObP9hebsAkFS6X0SorAJSkXVLbiNbz9Z51R4TIq3+pLCaoU2OAe5H
         n8fpJ1sfTpRrZiDAcaljfFeXPsmgtmuE/wPDG6NzTRpQaVkbMAdZ/oljm2BSJQjX8Ab2
         JNynkS8Rd4WJ12ZjPJD9ps/55tqQYOZkggqjqxQAz4osybo0pAfjRJ4faIdi1X0D38cP
         OkSRfjChdB3r/w7nAvYvzxN3aLlTicALJh8x8UEYimjTrKP6U6K3sdafi3nXAjoWVA2G
         e5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170960; x=1794775760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcBQT/DgFL+Q32k682qKIG9RkjDSDm8GiU83RqsNyh8=;
        b=Y/phz9E3sV4vYSSFXAf4FhirFaBlhE0kKizFOavosl3nDiOYlr1dAwjk+y9sy0hcwD
         7bTpNGlg053bLVcGnRtI/wIhJlVpf1Qjcr/rTsm8dUgWomaLr5GD9YEM3VNflcjBzCcX
         S+tPOuDDEaFpKsRlbeFynIb8wL7GVI0dfcKWB857jj7cz52hq0pd47N8VObL9FZQcxtE
         8/nTBNB58811FhFKMzRr+LtctF0d4DrWPdHg+gzEBiSI2YRfk5ocx+G+5ErBG7wKehQw
         6VLCqr4RzTv+nUL5yt8oQCFPO2mrcBbYuAYb8hpgbht590l0toyppPfvpP1CSeWIjLuS
         TBVg==
X-Gm-Message-State: APuU4Z/uHTGbaCQ0rJdr/RcPvFKC9+E0dE+KFHf3MbmGesbJ8oZfe+t1
	QBc1C3MT7AsYwnSIJssxOtkDADwOr8GICuHh4TBizZ5L98csZONAEVrv
X-Gm-Gg: AYBFou19Gr5uOUAX2/1HpjdNMYZ1ezCNtTqZTAFD++T5bw1VXXf4d0Js1ydGJxWoihP
	dO1O3PQk4PYLVLFwkfwwbx5/g+Z+GwHWowzjMMhQZXEQMLhyQ7EXmDvFjP7JDPaIbseZb90WQyu
	GyOmmBZmli2yqRtyi2w+2UAbt6RCqYqIGNuMsCfhesVLCwQby7yWkGmivGY55A9icNZNCe1wH56
	t1BaGVf6ewctJ9W7EMXtJWmUAELuUpJtqOnS+6iTnR76HQLHejjzXqCw7InoRVt4y1H3KcL6XIq
	Ko+OWymLGQpXsWwg5HyJCpkSq1oP5z9G67q+08mC+mq3LfRLvM/TCa1L3nlQ/n1yGTZXcGT5OQk
	VbGP/j3CRRdDxZl3ZpI9KeRmnpJN+TmXE+Rg8mq9G7MXyYNx6CUcyyXAW8Zw9rx0+3Xb1qzHb91
	E8G33NYddvWJdfW3zB60UntIklVtEn8xvEIryxjWET8pwgZ8VpHNuyTW0qpuh3GuBuvc8Lqlog2
	IxxkkRxK2wgdnK+MoCErLLpo659zQgPS/uA9rzy4frc24kCrHk/ipl0qhUs6Np4O0vuHrsIRMzz
	DWw4+JJ7pQdZYVVrqt9/pHQwJyvFJ20qEXuou9Lj2YeVfdcoXsw9BbhcqkTIByZGsQ==
X-Received: by 2002:a05:600c:83c4:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4b963c6ca2dmr42368085e9.20.1794170960182;
        Sun, 08 Nov 2026 12:49:20 -0800 (PST)
Received: from laptop.home ([2a01:110f:4f01:4800:421a:58ff:fedf:2e2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm94217595e9.9.2026.11.08.12.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:49:19 -0800 (PST)
From: Konstantin Pospelov <kupospelov@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Pospelov <kupospelov@gmail.com>
Subject: [PATCH] platform/x86/amd/pmc: Delay suspend for HP EliteBook 845 G10
Date: Sun,  8 Nov 2026 21:48:52 +0100
Message-ID: <20261108204852.11194-1-kupospelov@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On the HP EliteBook 845 G10 (Ryzen 7 7840U), the CPU stays stuck at 544
MHz after resume from s2idle. Delaying suspend avoids this.

Tested with and without the patch over 6 cycles:
1. Suspend.
2. Connect the charger.
3. Resume.

The issue was reproduced 3 times, and was not reproducible 3 times with
the patch.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218557
Signed-off-by: Konstantin Pospelov <kupospelov@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index fed6c51879fc..037bb575870f 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -297,6 +297,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83N1"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=218557 */
+	{
+		.ident = "HP EliteBook 845 G10",
+		.driver_data = &quirk_s2idle_need_suspend_delay,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 845 14 inch G10 Notebook PC"),
+		}
+	},
 	{
 		.ident = "HP Laptop 14-fq1xxx",
 		.driver_data = &quirk_s2idle_spurious_8042,
-- 
2.56.0

