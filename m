Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5891342C92
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707198; cv=none; b=NdLYtM/9egBJncoK6Dbzud5i7/9wsawKIQpMZ7RX0xpxvq8mWKtS+yQc2bfOlxqhZZwEwjEvShMWSlQjUxbdfIt+cfsiqI7eMG6IPomwrCIX8kUd5T4zL6RrWbPxysUz2tzqYcRfUo7oxVhc2Bi0Ra4gUDc+KfJekViH3HHUz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707198; c=relaxed/simple;
	bh=N1H694rnIB23NL5FZSIZ1GxBz254s/FfmyDM3xDVb18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pNImrnoDeOr5paaBIlSdW9VtM7ZcMLK3MxJ6etTLLi7bOPu/kHFdq8A35mfOFNWA7zA9KHpH0Xl/Y9e66WyWfAdEgE+4enWPZt6t9JwTo+Z6exi8ozgwkYX9Cn3uBaZoLouMj+kqvOUNDvINjHuZADJpgIglRmV5zsBrgjPw3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgbHnIJe; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgbHnIJe"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f1bcdf03c6so405782137.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 09:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769707195; x=1770311995; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4xXb7B0Ioz0Swo1DQNaF1EA4i8cqAzWN8A2le+WcD0=;
        b=hgbHnIJeDR2NuoYRspzUcvH1rEN1hVuusOlw6nKyPcwRD1GC9zwKpWEalLFdQRcU2r
         16S6oWL4tEHz8Zwsq6l3Ww+DQmwPhbmp8Rx874RHW1LYFQdVTaXPIDv9siFcTY7NY7yy
         7id9j7e7E7Owd0c24wlqkCZ52duowB8AKHTxVg9ruWGNdUc8Dq1zK/GGUhchh/aBG8eD
         zeznDNrtyT3P1J3aYZ0lHK4sdh15jELBDIrDdSsocz8P2z/Z86aJ6hJi8a0a+hDutd7h
         trG90hgE0uHZEqlVjetPDogG04MKlhAe31VhdzFjG507Wn/hDTRk5YoNjzq3AfdVjr+m
         XDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707195; x=1770311995;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4xXb7B0Ioz0Swo1DQNaF1EA4i8cqAzWN8A2le+WcD0=;
        b=YRSlMkEcJFfbob3UT8AGPzGvv7pEjuSErhtXx+VTL5DtxnrsLxaEmQNIOijXdRypgI
         7TlRyvOuLkT25AWvL/iTBast3lyP0lh2v57GmDIR4X0nnMo1uwsagX/DfKrHpxHm7Tm+
         6H86ylCd4tRZwVXj/eb/ZngGzKKI8zS1F6eexMDa7pzRQZ56RNrS0kHlCmJyb3owXgbh
         Yaqdo5IvWgBjMJvdepyy+n16mT7GZ2k51jeZ8bHsAD0kdhO8jJr2pgRsh+OFMLe1nobe
         OfQUgQnt8LBSfYt01eIHvAWN3aoayc22nKXlQIinipexGEA8mZRAv+Y+Q3ih0tb4m16X
         c69g==
X-Gm-Message-State: AOJu0Yz/yunSyRpy3nt7t9+8ygXUFK1QJZBrMW5ZEKg8s6FXgXY9GHdp
	R0AAgykV/ks55vp7CBC+UyiWLwmIC9fXIPPV+6LFSPMMzP5Upol5alut
X-Gm-Gg: AZuq6aJ09muRKVrv867DjZQSJ38bN/8wp3iJQ3a4P6zJ/FyVC997uy26Jy/ZI+u3bgJ
	5uGQo/JKGuZ8tbtrQiBp0r2Z4AFXGE4CrWBKjskEsy4/ggZyz9sKsUTrRbsHIGIgb8kYFCU4Aw3
	hWyzFqZRJi3TP7tuDB4/5xCwVjmPXrJeYMEjoFqjsY+3NIRfipN/n+eVVtZ22BjJZkIGgpNiHx5
	I2HvgpPpwFLE0tS1tlO6ar3PBnRpo05RDm4gtkJcDnKcCh29nF+lE/SvAhWEojZB5efb6ASfSxJ
	VF4J6ob0brhGWsfC/V741vIAMsPdg57MymFgb16Kndo7djCcexbQXCYYy4Ho9tgM7BtidsdePvT
	obbMj7q1KNSM+tHkajgP72LJdykuRcCzQx6KF6rtoxj5Ux2/TKkhBuEixW5c/4ow4FUPW1HVhxA
	QfHW0CNTLxkCSa
X-Received: by 2002:a05:6102:d86:b0:5ef:b3fa:c89a with SMTP id ada2fe7eead31-5f8e26ffc83mr66056137.32.1769707194124;
        Thu, 29 Jan 2026 09:19:54 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948723ef486sm1307892241.5.2026.01.29.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:19:53 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 29 Jan 2026 12:19:24 -0500
Subject: [PATCH] platform/x86: alienware-wmi-wmax: Add G-Mode support to
 m18 laptops
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-m18-gmode-v1-1-48be521487b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNL3VxDC9303PyUVN00A4vExDSLJMu05CQloPqCotS0zAqwWdGxtbU
 A2nXB31sAAAA=
X-Change-ID: 20260129-m18-gmode-f08aaf8b9fcb
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Olexa Bilaniuk <obilaniu@gmail.com>, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=N1H694rnIB23NL5FZSIZ1GxBz254s/FfmyDM3xDVb18=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnV0za8s7bLDlzvlDXVdEZwjtMHhi7h5r27v+ndyve0b
 nq3a+X/jlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIMWZGhpY6rrXiIirt5k8u
 uGf91/LqmPbqej1L5bYfpjUda9Z6xjP89y9j/q/p35Se/WeVi3rBjfAFXxJv2d18n1rHVpBceCS
 IGwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Alienware m18 laptops support G-Mode. Therefore, match them with
G-Series quirks.

Cc: stable@vger.kernel.org
Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index e69b50162bb1..d1b4df91401b 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -175,7 +175,7 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18"),
 		},
-		.driver_data = &generic_quirks,
+		.driver_data = &g_series_quirks,
 	},
 	{
 		.ident = "Alienware x15",

---
base-commit: 662c9cb86fc322038647d8808e751f5c6c0cc13f
change-id: 20260129-m18-gmode-f08aaf8b9fcb

-- 
 ~ Kurt

