Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC575632BF
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884186; cv=none; b=EC/g/0EIXETgg7pHRyfLLp5YOb/4v6exVkrGGyH3tC0T7t5c0fVzZLLgtuTRpAJjRCSZRa2Kn9iFvH//NQD+ZRwIBkPWSID4DdP5sIp4LTPQCJW9Z2BLJwzkfWSVDIGPTH/SxLCIW5wq2NOYNXyHaVPM8Xu2rl7eqWRXPIqu1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884186; c=relaxed/simple;
	bh=CGZhEJ2/tDWk+P71VLdAS5cNFu0IAU6zV03Cwlzkac8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EX0kDPXftaVCmZ5EU6JZ43NAp+aRueiXydtWRnt6jFT/R8WGSvKEdRqhNAaJQ0V2hv5P0I98AWeK3t2VggwAnjlld/FHXfNGnHhQciKkPFTRFe0BmyyoJil5Q9GUU5MUGMhoNgKtY1uxwOQ5aU/P+ZcZ6IKZKjqJPUzEeHhYSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqYKK2Uo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqYKK2Uo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso15771695e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884182; x=1789488982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aW1yDnVQMbshAqUi9NqbYxbv2XerDdqOEtxHNL3um4w=;
        b=AqYKK2UoO8a1IsUtaRfW5epIFS6SxscA/cxnXXf2GF6nulMREIGBCriLXiCU9iqgWj
         crEnykrsexBxaD9B1lQWXIcur3i/EZp/UdX6mtlN95Wg4IB5EOUVoJJoRqveZeHEi3AY
         LrYoNJH8wmOvC9oJVo5W9PfdrEOO61EK5g5C4I9ILnG/RnR8aDYpvL0kxxjjHPCD5KSU
         0paghXsjR4Pd9YvcZVcYZJcFWbYBc+Tsz3lkx9uG4NyB1u/UOcBPrXE1wba4FRLV96ak
         d9ipf8vNGLmJTV21Tb5mjmOPNWXe34v9drQwgaB7EZfdBQ/9tc5DFTi6Fc6/qy2wM7HY
         5TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884182; x=1789488982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aW1yDnVQMbshAqUi9NqbYxbv2XerDdqOEtxHNL3um4w=;
        b=VxFR9uSQemTU+NxLwhNeZxJPoBVen0EqKEi3icdTKiv1OIVQQZk+mSsVcL3tVVp58G
         Bo96H/hkHxwKaMYD4Yd60+78QwZU3cgZgAb2TCHZugRH4erjQmBZcQPshZn8QkwQheBt
         t08rap5KWEM9/OFrYAn/oE+a5mKiP5qxZnh7yZDl4sQUZ5Jsx/lsDsOv4QfFMGftAo0s
         agIWc15bUdzRxprsoSh2EnRlQokTl0leTDK+/TY23ErK4aYDJbEbIfrt/IOPDd8oOVJj
         3hHpuMkchEu3a7SWHlNnWbuKaP3r0yqELSsO62ugyXUgcLq76B4FJA6qfWxFXU0VgiYm
         R/UA==
X-Forwarded-Encrypted: i=1; AKwUvBxa59WA6pYWEy9MuzP4AJpyNRCFTHBRpxXX088hPPq3NToQeAKTDh1mhazDsvddQbNN91OD7TQXdyXCdP2R7on1kKp3@vger.kernel.org
X-Gm-Message-State: AFuF++m030lt7vALS1Vau4uFPJ5sm3cyY5JSfti20u3bcvFuiEWe5wGG
	6PubacYb0+fsfmg3P5AXWXToKlFqincAERrOI5kgSfw/5KaklqWwKpg=
X-Gm-Gg: AYBFou0qa2IrdlQdgtbXIArsuiP3bkd3BoCUgk4dG2C3jSfqn5TLwJ1FrP4gX7GMEJY
	Hp5+Qql1EbCo5CLmLusXmVKt7UeQqWddbB3kTnkrFIB41duO2wrV4evnLNhrprcAhoZQfkhhQ4/
	6aul0ve/gQC8OnA16p6lbQua0/nt/py2a1P4gY5J9TcteqkP3E8SUf7VUNl63GWrC8CvTXkPiTd
	YioHMmxfM0vdu2DTgQiyutBJflFk72BpAZZZHajVxfK8NwZrnx5viRCUkAWz18oD+O4wYWmRO79
	DXaq4LnNsnvdmo8sySHjftNZh3G8MAwRg+h9qqE4FWdPJMmD8h5b+PLGP/sw/FH5NmOixUNN6hC
	J7ybafWOrrJrICQg4DDXiqzfmMH3/NQ0VwhMXR00+9dl+OM28kcOir+GtFzPBOurhQR99WMzWB3
	fYT9QjwaJqU2rSfNd/PIFNalIOjO1UUHwVgBGOIIexRpAUEMBKSWkon20nf0NAzp99klKyLiVZi
	2DEXmUYqUaroWn0HbiOpwYeLruNWK9jmR3G67mqnYQRGIYjMQ==
X-Received: by 2002:a05:600c:190b:b0:49c:fa21:e743 with SMTP id 5b1f17b1804b1-49cfa21e92amr288183415e9.25.1788884182199;
        Tue, 08 Sep 2026 09:16:22 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm341499735e9.0.2026.09.08.09.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:16:21 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Tue,  8 Sep 2026 18:16:29 +0200
Message-ID: <20260908161629.335223-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831160754.9857-2-tchatard@gmail.com>
References: <20260831160754.9857-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: Claude Code:claude-fable-5-1
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
Applies on top of "mfd: intel-lpss: add resource conflict quirk for Dell
Latitude 5285" from Thierry Chatard's v10 series [1]. Thierry, feel free
to fold this into v11 instead if you prefer.

The conflict was verified in the 7275 DSDT (BIOS 1.18.0): GEXP has
OperationRegion (BAR0, SystemMemory, SB04, 0x0208) and INT3446._CRS
returns LCRS (SMD4, SB04, SIR4). With acpi_enforce_resources=lax, which
has the same effect as the quirk, the controller binds and the camera
works with the board data from "platform/x86: int3472: Add TPS68470 board
data for Dell Latitude 7275" [2]. The distribution kernel here builds
intel-lpss-acpi in, so this exact patch has not been run yet.

[1] https://lore.kernel.org/linux-media/20260831160754.9857-2-tchatard@gmail.com/
[2] https://lore.kernel.org/platform-driver-x86/20260908161445.334910-1-dmanresa@gmail.com/

 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
