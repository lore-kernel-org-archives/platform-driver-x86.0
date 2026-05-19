Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51F26B777
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205251; cv=none; b=OEnOoV3pgZXTsi00Nq+dZFsDNWc7UCxvrcEHLv4s4Yu8dmcGVk4ertEUI5KRPXILRs4JX+Rk//Zsr5lSc23t384ZTUCq+GbpIfsZytWI3fD6xc2L2vFpyvTih1SAnhVRr4OG/CUAKzJWfZRzKPqZoZj2jDcsn8U5YKJb03yp7WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205251; c=relaxed/simple;
	bh=U7tQin3VDAvG7LiVpjo+/J5UEFaFKhlDK1ivz+wCwWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AkpbS0eXhyCvLBVHYisL7zlueL6BD80rs1m4lIBMp0mG38ty3jBtCiLn99UhlA4F6n6HUBhcCNhxo7zO+TiIr23OVVbgkuFvI0h5zLqfi6w6TLB2S03X7xeMP30Nx/JGaUtQzm6QK6Q0czLpaJCH9aFnkNLAmt5v+gToGmbCgjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kE3Dpohn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kE3Dpohn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so36462885e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779205248; x=1779810048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpv7/FIndg818vIl83cmQXaZd5aETp4Y6mW3mRgGkUY=;
        b=kE3DpohnRxGByF9WDI8P60HOd3t/76VPubF4oNLg/sHhhOnlEE3PWNUoWCzqtQsK6O
         UH1ppdyrIdwxsurF+lMjbZbylusIuhsKt1/61bsnS36j5HOp8+dDMguXlXZHpN+lH6Gx
         kCKrRrdHIN0+Zes3UDEeXYumvLiUBbvnRSprxYEjrfVe82IjjqtGYgRJISo2l3BC/shS
         bzWh1i1pnRfmb/S6MJ70aEVmGeYcx1YoIiQRlVdki5yZMbzofFKHiJSF9FbzEw65Hqja
         PDO3lAsCEclcCJwLiSsEpnlD1i7A88DEkXq+QJV4pE3wCp4g/JZH827sXWu0PRtp9Tj7
         wrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205248; x=1779810048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpv7/FIndg818vIl83cmQXaZd5aETp4Y6mW3mRgGkUY=;
        b=HIujzGotmW95jSbRUxsht7Q0+jDlUHPUYmFfaEBt0iXDlAO0/lxYvl0JIVtv9bCANR
         PkwHJW6DPqZ68QPbIJQOi1lDVgnTHPSAiBeh96evDEqt9crWWgMcfUKsHRvhFBeHuVKf
         J7HTsB/qtIGqwgm3PMAi/XYdb/YFtudcwuR2tdoeg77X/XUBrDjzxzQKrSZAeDSItBA2
         SC610eh6XmuX/bNAkRtZCNEzM1vGtRVCWoEIQg8PXrBXb/XEX8JYc905yPnYhs0aC9oU
         GoYKN7uGwswXuS3tKPkpZgS9fxBTAtGRfSZG5mi+IB24Jh3NNBR/njmhVj72dVe6yp2B
         3tyQ==
X-Gm-Message-State: AOJu0YyKzdKMC15q+EgUeEBwO6yx8lOGYR0zbQ60Fj5dtw9wvKZkZ8XG
	5jEoH1+79l1FZt0oW+jiSUf12wsoA+mqbwH+6xNT+XqK18KJu0aXmXgJ/JSLTLH7qJs=
X-Gm-Gg: Acq92OG8ht3XIU4sSKf5FdCFOwa80DAr5zZsvii8MtsXQGcxbYLqQgqxH073s84NPdx
	tTCOLfryC8Sv5tab44SU1VIAICwf9Fci2FXOE+2bNY4sGGhLElfd4W87+uy3fDA7bWpgtOg9W40
	flPy5ZN6gIkdKcF2GuAl2p7DY610MtOBa60FoIm/dunoiTWNvJJhZNYT6V4UK5T6V3Oh63CboTb
	avI1xREF01k627m0aWoEHCCz1xfjIypMcMvnZq3OdqOeHZUgmChoVuOOTXNm7QvrqclcUOhQWQM
	lyidyy7DaagSVHcEpdbataXaWfmO/fGScYScr+Wi1FQTSvfbj1qV+v58r/F6df6I4NxEOAC69wu
	Jeff1tXqaMREng6I9aOZpYB+tBXKR/WsIf9H7+/b/xUx32VdBBLI3Vyohh+b/twY1sU9iDKjE1m
	xfJYTixiYlUxg6+QbcJw5dsmunCT5l1sZs4tGVFUWU/TGbY7lAc7UfyTgz7ATh2CTeOGwx8z3rV
	f95PbPqph0wzznVSQhLGD/QDA==
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id 5b1f17b1804b1-48fe66204e8mr293281235e9.31.1779205248022;
        Tue, 19 May 2026 08:40:48 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe537c788sm317273835e9.12.2026.05.19.08.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:40:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/x86: x86-android-tablets: Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 17:40:40 +0200
Message-ID: <20260519154040.1594878-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=U7tQin3VDAvG7LiVpjo+/J5UEFaFKhlDK1ivz+wCwWI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDIR4GYQGZYDQsoQ8VftEhQH+xgGh96WVbqZUx 7SAkX8ioguJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagyEeAAKCRCPgPtYfRL+ TvmVCACjSRY/usBwxK/ZfluD/3LgQy2svB7V1+7XwJioxtuGEYkjIgyArkPABK3N/ahve6pDaZx AA0f3UI7SH/HiEzruhZP3IW3KYxNX6Gb+yr+9Z2EXcgh88qN5U7H0OEH6M5FpcMdjeYccNT+hLO OyimdcEV2eys2T9eXeCxkUKqdpd1e9AjPBt3EXUGJ+OwFzBXz+aL6IFY9FkRIJgV4+dzgQTPBvs Gj1RLRba0DtYcbRePhdhmzW4OcqQIabioMiEzPGmW4D3hy8knUPnTJ3lmgc0PKn77lz53OJDKCE 3Ncl5M3qvBne08s+Ao41X0u4i8Iy40VFf2/4oHHqTcCkq8eG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as this driver doesn't
make use of .driver_data, so apart from the better readability this is
only about consistency with other subsystems.

This is the only i2c driver under drivers/platform/x86, so this is the
only patch needed to adapt the whole subsystem to the new style for
initializing i2c_device_id arrays.

Best regards
Uwe

 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
index ebbedfe5f4e8..67dba9aa51f6 100644
--- a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -242,7 +242,7 @@ static int atla10_ec_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id atla10_ec_id_table[] = {
-	{ "vexia_atla10_ec" },
+	{ .name = "vexia_atla10_ec" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, atla10_ec_id_table);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

