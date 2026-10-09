Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC64D990D
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548829; cv=none; b=sJnKtmCc8qa+di7MJ/BPtfRf+JNWdlH0aB7AxbijmnzuwD6L0i8+uhB0YFFZIpEQ4p7DFJhFdQ1AS9DQGd8EYxMGlIMB9y4WLRr4CiScU2qCwiwySecD6sa0VvHbXp3CNfrWCbQ7kvbT3W0m6O4ZbbfnqR3tuDyIQRsdoWNomZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548829; c=relaxed/simple;
	bh=zcj1UP/uWaZlOap6IYuctN6jhC5vXlt+4pbftX/pN+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiwkkX+7u6M943OtKe6LkD8wSkooQj7dRacBdua5affB3KylHtn9cVwWlzYWV8Q+99FRXpDW5s8JAB8cKIa1bQ13vR1kdCcCvzoFJqr7arG/fWUoG0aocvnWkybHVdNqg3z9Twf/oWLG/o0B/aWbevtNXJUY/5mXimRVxnFp7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdlNDRiR; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdlNDRiR"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so2175151a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548818; x=1792153618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omRS45+vQBa/52QRk3tpqdOThEMPi8HnWucvIlnVNIU=;
        b=YdlNDRiR6I3yGEmGqO+bP90VwwvMF88o2n8k4Wca2Oo0PagSwivURFI8tdLJVHl2lQ
         cwUyg33yrVq4/sCyD4irARhutbsQuCcuCSySww+FyBgTIbgYCKjqvZJaU+h9itHsMnCw
         FqY5RwpBLMZje5XtDwyztyAoBQbToQhemdU9mvXXNL5R4gCuHV6r+agbedYxI4aHR/jR
         y9Y0sgqFN9PycJtWyRPO8Ddzb1KE0jEsWTkd+Y4ilY4K6oT5Cmq8bipN2rIpdnZ6bQ2U
         EYAlJ8RxhtXE6hTCs2rm+RXjCjTIA5gdl/A/NIUmPiBLx7TYuq16yx35HU3by/8+IEC9
         umVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548818; x=1792153618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omRS45+vQBa/52QRk3tpqdOThEMPi8HnWucvIlnVNIU=;
        b=ZCHC94oqRAxabIHHugLQBkviuqcmTwHbdhXRVvogPOlRPZFfhlxKGTaUKaBOUNki34
         ilSEmWCP4yPuS+dYVj0O5u1c37v+wCeVrJaJt39NFYWtj4/+A1/91lgTllvErnKd3Dx/
         EurcWbGlzXTV5hSPErP0NHJe3xZBOxcFpe2+CBnmaBBo2YcNrNjc/E59KYfhT07gOEDp
         Mk+GerARQbRAfWsnwDlEnCnOXZ28DsYZHjU/i2fc2Iq4BTcUpDzaC0LCxhy8KRO5O9NX
         feNfz/Ux9MUF4qH/hbaT+Xi/wMgxUu8HhgxrRAsVheYj/jX5d0LoIruWc4DtlLiKUHC+
         F/hA==
X-Forwarded-Encrypted: i=1; AKwUvBzocNI8DSQVLTlu8qTOGOOLYZ4Z4boaJefIoF6tlilyZdzLfkPMpSCk8DB0skdZUPl3+nwjuFq4Y3Qwz9IbB+Q2JwsU@vger.kernel.org
X-Gm-Message-State: AFq9FYLLnbTZ067jY/07GSogmnY4XUO3qsO5t7cxirEU3tbvedan6MAl
	SJU/7vcDDXaudRAPHCs39kqT2hvaHwZJbjn14tb0NS51VFucP/AI51E8
X-Gm-Gg: AYBFou1X9ApDQb+vXGZHkE03ktRatNwUcWOXexbvgpuPl4g197T4HYxljsTf2i3g9Oy
	YvP0oJNt+63FQsa9ZUkX/wv5d0zVcnc98TfpI6IV6ujBOkVsc2/gGIwjRhA3TY9S2nDD/acmLCI
	ZnqKYaTRH31tE+7QXpTLXYxJkTOg+rp05R6Q6FjStkThFxjS7jhoSdKdPKaIheahn3/2C5Z/gON
	i2VuC3+Mmn06hvxtVi0B6q6vl7DmaalUkclihb6UaUNQVegprZe52h1c3E24O6nPdOkph881tcs
	YzOjTYU0Ih5kzQieePo5dBKeYL4PDgVZWa9jm3ZNIDn9Fu0eBdh6ttOznt+yDhK35/L3YQN/3Rc
	Ak4ASURvPqdD7zgz3kAu8cV2cpBBwswyx3FpuKvzm0GAFCvNohK0a2n90sqtCxVc08uyhPKelpJ
	WjR0E+qRDsD7vZVXH/B0SjomSw1OfSgLlA04Ocm8QkVZq1EvTpgVOU1Iejlq+AQwRUKr210sw7w
	oIc2pPuclAVziC63BtifSdea/c=
X-Received: by 2002:a17:90b:390a:b0:3ab:413:49a9 with SMTP id 98e67ed59e1d1-3ab3a932609mr1852738a91.50.1791548818302;
        Fri, 09 Oct 2026 05:26:58 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9397:bb62:5cb7:971b:ead7:8dc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3426729a91.7.2026.10.09.05.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:26:57 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 0/2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Fri,  9 Oct 2026 17:56:00 +0530
Message-ID: <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Some Dell OptiPlex AIO 7410 (35W) ship with DELL0501 in ACPI but no
physical UART scalar board, leaving the machine with zero backlight
control after the UART probe times out.

Patch 1 is a preparatory refactor that extracts the UART initialization
sequence into dell_uart_bl_init() so the probe function can inspect its
return value.

Patch 2 adds a PCH PWM fallback path: when dell_uart_bl_init() returns
-ETIMEDOUT, the driver reads the Intel PCH BLC_PWM registers and
registers a BACKLIGHT_PLATFORM device.

v2 -> v3:
  - Split into two patches: preparatory refactor + fallback (Ilpo)

v1 -> v2:
  - Use __free(pci_dev_put) for automatic PCI device cleanup (Ilpo)
  - Replace 0x10 with SZ_16, add linux/sizes.h (Ilpo)
  - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
  - Fix double-space in block comment (Ilpo)
  - Reduce devm_backlight_device_register() to fewer lines (Ilpo)
  - Extract dell_uart_bl_init() for the normal UART backlight path
    so the probe function reads more clearly (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from
    probe
  platform/x86: dell-uart-backlight: fall back to PCH PWM on UART
    timeout

 .../platform/x86/dell/dell-uart-backlight.c   | 156 +++++++++++++++---
 1 file changed, 133 insertions(+), 23 deletions(-)

-- 
2.43.0

