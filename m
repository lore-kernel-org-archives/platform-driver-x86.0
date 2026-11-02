Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589553;
	b=Bl+VqXQMztiezX60rl0dLmy2vNNEKd1bbyygKdcYWyKPTDX74OaHStFkhD5EE/rUgCHd
	 lvu7WLkibCf1iXY0z9DTVywX8j7CR1PRqGz2r3k4qbNdQ6gqTNTubxto3u8wtMBtSRPke
	 mXIjI6Z89kmpGYUfRKTL+GmFyy8u3n09swAlh1A9Uwko8/5JdIaMj9g1wQlKQH0AshAtR
	 bDSL8VAOI3hDYkJawpHMcY3mkjtXPs5zFTFJ9KFnP+V3wOg6jErdDPyeLDjibqe4aEwwC
	 NqUmWcmUA0EbbozZQ9Kgyb03/perk/NhNPE9fkl+EI9/tKeIFCbR+ttv1qzZ3SFDFuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
	b=u/JM6pDIayIKjUrT47hSgW7wr6pUoh7QUoSa6SOrwvpB8s+S91vnDHB8B3bI4N0El5xz
	 QawOIW4J88+7+m2F3CFU82urvjr7fJVWBD+fX7mkVmnxDopk6HqqnYM2HXOop9n1lfLlm
	 kQKhxhcucqc5382XLJAlRwhZOxd7+Jo82UmgHBNrjarfAf4vOJ9x8+vjmFBOVyRzPbmns
	 j91xmNrFIVLYQMwtrPdvDhnkuznkmjVYNuul7M0XsSd57uHlqwZYyU3nZsux3pSBxFX3a
	 Ux6LKGxzsiLyQEy5juqXsvx5TzArDd8KNpMKnBVt111IsbK6gIYjikXS6TdlHceVhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c4lNAqb;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCB606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 03:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FCB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c4lNAqb
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso706430a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 19:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589552; x=1794194352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
        b=0c4lNAqbAvc8AsVXd5NU8F1DHR4DwN4NTrsozwI15qfIQWOterjv+nT1KBRXjrRt1c
         dZyeR+imfEBPM1DpcuT3hEt/NPiscPltdOtGM10Es0jdEN+aVSYheQ0s0Irjd+jh3JVD
         rOAaK/CBiek7Y1Bntw9Ab2sazue6F9QgBPEmPPNNTE+dzZTh44SFWPXYGtGY5hXDdAS/
         c3F3kEGSNBML4pnSKP/wMMV42Z5ZyJcmBamJYOHz3wD2DyO/FZ5G9OM4AyshV6+5L70p
         XLhRERyHe3ZdCoxrKkwybkxfkeXD61g2DffpSWZwt5GA2DF3UAH24C3Ya9mSrq3XnjaL
         TSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589552; x=1794194352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq7i3VhC2u37X3a2faYflIcKZg9HRolwFH3fa/oNdq8=;
        b=dOjb6sssBK+e05Bg8NeKirywEUvjJeUaRIyQGYmVuUCaHrcVtMKVUSq+fwVswsfYqQ
         gydaGemesm5XpXGDbQKVCDIRBhqvNA8gq9LJD4/5ezFrzAod0Ds34HoOXAaG50R1tBh/
         NUNoSuktUOwgkuXWKExPotPLA3Qu5bRkZQuhsLK8wIHEReyWGtas9tBxbyWn8wdeL4Gp
         2FtV5nksFrhHpUsabpXmrNX0J3V2vIA2pxfJTXsejoJ/kRkCmG8p8SrmI84tsHs08DQP
         yN3etOhmeRofXrPZuRioL0nnZBsLB9SmKNqXhvzZ+w99+JZPZn0yMjveNfTbRLnow76p
         0VTg==
X-Gm-Message-State: APuU4Z+DmPLExTvuxq+TZT781xTm+gSTTRFgnN0698+I1QRLqdOplaWm
	xWIXxLdJUR6ZYeRo/z4hHr50+wYOuYtfW10usfZlJLATD8LuR/TKjUBztdJABQ==
X-Gm-Gg: AYBFou2JQmfI/g5XlQ214fySVWBVvl01iTE2e0ini0JFz+mKIzLx7PmqaXSKvNr+8T2
	yqq0JceS6QJNTrdcy6yHS6iaW0PFrOZb1rPZArQs7HSizCiEx0B0cf9FkK5RshJA0swPKfhaWhL
	4G8wVaMqrotUoXTS3lbJzkSXou0XumMKBXtj+XPnDLlItt0pI4hnCvHPR72VYX/Bw5gPCpYkdFD
	nG4+C6VyTjKblxffx67wNERVTGyWe5ZYhUaIBDz+z64YmB91amxbgiLslibpF3HpGYvgTgxRjJj
	geKYJAPCCufrRgCuFqsthucyM52wcx0nZqhdmbD78l7987I8MOEYsb0FUcDIuplxJtJwm+R1znj
	glZkFnVq/O2ApQwlCM5p50xCYukVcXFqjuZB0O9+IenUsS9hOdUyU/da28hKokxH5dQv3RXfgt3
	f8fGZ7xbnbVqgnQOZFSunRVt0fsY97rM87/6HzaL1LqIFQsHV5Sm006lYmTfUL7V89TU8tMNjLg
	3l6xFJbryQlJFVGU9oQHEkv2I9tM/fbhrQaa/o7e2JosnJSNtBMhZN4eyblmoB2sLdCpF1OHjNB
	3fpfu5SUlSR4OquTSatlqlXPy4PBor78QwPk7/H3mvEtRUUNSe0UiaY6VOnOceU32n2+at0egiM
	NTxZ7fqAtNEDk+Y4tF+eq3rIUYpX8qPq/dwaJ/FbuR/kaURlfxsZZNXKCn3OTO9BAAV0mxdOgmU
	DQJPX5fuiZTCpHrQJiJ576efs=
X-Received: by 2002:a17:90a:dfc5:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3ae897dd47amr7489423a91.67.1793589552079;
        Sun, 01 Nov 2026 19:19:12 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm7752417a91.0.2026.11.01.19.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:19:11 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] platform/x86: dell-lis3lv02d: Add Precision M4800
Date: Sun,  1 Nov 2026 19:19:10 -0800
Message-ID: <20261102031910.82286-1-rosenp@gmail.com>
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

The Dell Precision M4800 has an accelerometer on the i801 SMBus which
is not described by ACPI, so the driver currently skips it:

  dell_lis3lv02d: accelerometer is present on SMBus but its address is unknown, skipping registration

Reading the WHO_AM_I register at address 0x29 returns 0x33 (LIS3DC),
the same address as the sibling Precision M6800. With this entry the
sensor is detected and reports sane values:

  lis3lv02d: 8 bits 3DC sensor found

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index fe52bcd896f7..ee61b08324ad 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -52,6 +52,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6530",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3551",     0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Precision M4800",    0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision M6800",    0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
 	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
-- 
2.56.0

