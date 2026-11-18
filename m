Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975956;
	b=yZGUekAI6lCleZ2R/SDN2WEtEOp010i7E9C45XbLtyDvXZzNReg95eLQi10TZX0MtGbv
	 YtRXKhO5M1AYkTnkyUydUswmJJiNriLwitTu1xfNgPV1t3A8YqzUH8X5KAN6yRiKaKB0S
	 jObzdcNEnXYRu/B0d1+O6ZIv51tsSGUCqVBgFNDWKNrxjsr+CCa6FNrwm01F0vOHl+Dxo
	 hEj95sjZ5lF7Zy3tAqcSdtjNy2WWDctDJ6KuJHBXJ/E/k98N8vlPEuvOoUspJ2PAlKtXj
	 i6WoxT5TxN8/AHfQohNxqsK4+Va81KVtsqrwM/XZJiNnn3nnGdPg/BlrEiWASuHbUcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
	b=k4ZOldynePJwRp7/rvinN5nzudyZD0om6qZLr/HSuhvGJ0VnQLoKbpQzExcPKUXMXMVE
	 J8A0f/1v0NvAk5eCcopKTXADn7TtX3DfmHUJwXbb4N/QtpS2yXJRN7IjEz1As3CkrIg6S
	 WVsW807Q4LNPYnkp5sn0DUBDQZFZU7+eI8kjpS/HvYABsJDNKzzAoDavq9ieTYSaukLoj
	 oECtX+2QsOQgkGjWT/vnqfOQnUuYIM16/Ois4UP1MqOQS0KT94pPv1kiRL1fBQOJRt64R
	 BhwKEnokGs0XfLj0jpARR3D+35+Tsx3YTqeX2QicB/dGKWGFYd44fSNGIFn+fv1N7WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlYl2Dzu;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC61C606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC61C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlYl2Dzu
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e96502e447so4220015ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975955; x=1795580755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
        b=wlYl2DzutVKB3DMoXDmBIsDWyj8VNMplxKsAugBaZLdxjBqb2/LfXaZKJspaI6gCK9
         q+nM1G/6g5oT/HLsIy19nuUe1hZHAnAzQ2sXt5TdyOhKqTqd/jrw3BC8C+IiLp83j3zH
         n6aTG7l5uZ2sQ8Pljz3lEF8C09EIg3IDMi/ILDebFD9aMj30zfOquU4aDRovANQR/lHu
         CQDldC5TS2CUXkJKqnMezyOs2p8ccXIEKIJMiLrL5mI4PY990z5CNSXAxuNDKkkIVDEl
         Z4ByEVyTvlCGm52oxaSaAPi1yUHwzCw/BBIA6gOcstDCwwYsvEsSiijIUs7j1PTsHB3S
         2sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975955; x=1795580755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
        b=dE2EGjTPTr/OFntAStRaVOzYXUHNg2Y58wQ8iMVcVRb8xGaleUaT+iU68T2FrmOfm/
         Au14JgTEijdr/wpy/qAEh3CYu8xlhuVxclVWqG3a/TIDdbzm8SiCsgMFoUuwj06W8HEw
         xdZSci0x+WQtyFot7IJ6BuKqvFOMnWoFoXOmQWfDfgZR8yre2LXuxoceH9xcEcqII1ON
         rsOgJEe2kCa0i0GS7eC1aAN6rmEzwr0n8hI0VA3rA9rDIbM1NdCoPedPfWoBkUsXOeXq
         y3DS2UMetNC9RLkce62Zqdiurh/YHs5PT4f9sgxG+UKhTEFDNC20Wwd0fOzeFuaWEKZH
         G/Wg==
X-Gm-Message-State: APuU4Z8/LqCEwNWEpQz6SQGYq/oK8Iwsy3IaQ9eGMBnVDjVuLqqa0I7i
	vUEYhD8qK1PjUm5Em0hO2VFOD2ffOVnFjxmIUmWuh40BMQpRDV3s1BSg
X-Gm-Gg: AZFdTZcYG03h0cYbAMM9HsiZHH+7T0d851Aw1Nbz8qbi7q8pjAyxe1uj0OCyEaURe83
	z8hmdgIgPxQj62z6ZVXVoLwTn9v/7iY/Ynnpgc3iL4Ia+T/Bh4Rejhk8l04tOu7IZwaSzjABRH4
	DtKbSr3boZisO8f+7TyrdMG+Vi7g/29FqFm0OdqnQ/+nXXNN4ZWn1ZLzBK0hAt3MKoXu460mT9k
	G340A0IBvkRwIEsqvklX9I167q4WFYnEeBADHtbVzryZLWPXeYz4uxOb7tEKvtBfQLms9eJPal1
	whlmO7LQ0MKJ4KYijAVRCj699fiFECjFfoh59DHVsUaU5rESKl5IwT0Z0vdHZQxVT5juFnGlaZ/
	j1wz/t26ckQeeERUFtGmAsyREdk0BWZoZL3AiUbbaFEmkBSR+ydEIiJBhy9Ba43slj0modEI5/L
	EQKaYyup+S6Emjr55iLeciihuJ/M4xfIG3dpy3ve/9w6LPdzpVqzZuPIq7ifoT0juGnhG3CDDHL
	JcUKHgb42Re4aNGwq5DPOy3jlF37b5jkq+l7mx0RYg7lEMImejMuKzRPtQxQOHSAjqgclWOmXjZ
	b6AXh6zM19Egczvznq7seEf7MtVvY9ilcWlXD87wIXSzPfWFZlsvxqcPdea/JxF6sMxvgA3noI2
	goJ87/d6Wv6APu8XguhRUjjYZw1nF+w1XObAiPV2cAAsORp8eGMwP/E8Wh8whdstfhbUP0KpRZO
	DD7YigTgT8HJKJXl2xbOp5LnE=
X-Received: by 2002:a17:903:98f:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2eff72dda9bmr15561705ad.19.1794975955249;
        Tue, 17 Nov 2026 20:25:55 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 09/16] platform/x86: dell-smbios-wmi: Don't unregister a driver that failed to register
Date: Tue, 17 Nov 2026 20:25:31 -0800
Message-ID: <31a022aae6590cfee64c109936b56f0242c85b1c.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

exit_dell_smbios_wmi() only checks wmi_supported, which stays set when
wmi_driver_register() fails. dell_smbios_exit() calls it unconditionally,
so if the SMM backend loaded and the WMI one did not, module unload
unregisters a driver that was never registered.

Clear wmi_supported when registration fails.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index 7a5c6d7730ab..e126fb4f048e 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -308,12 +308,18 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 
 int init_dell_smbios_wmi(void)
 {
+	int ret;
+
 	dmi_walk(find_b1, NULL);
 
 	if (!wmi_supported)
 		return -ENODEV;
 
-	return wmi_driver_register(&dell_smbios_wmi_driver);
+	ret = wmi_driver_register(&dell_smbios_wmi_driver);
+	if (ret)
+		wmi_supported = 0;
+
+	return ret;
 }
 
 void exit_dell_smbios_wmi(void)
-- 
2.56.1

