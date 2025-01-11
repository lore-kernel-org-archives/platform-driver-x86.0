Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B881E;
	Sat, 11 Jan 2025 05:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736573768; cv=none; b=fh713MWL/t7fhhs3dg3DFXAC1FAX5OWV5cEZZo599ej2ez4Ao1k2ttPUTA6A2/RFLjmqyYf3ffxSJxL1/jM3J5QeQ9pVng/zBrsdMymayPykTIoxg36URpp6mzVJDcZXRpG/6BRGZZejXAR5B6AVjMfgzYu2EQnyuuswEtNKJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736573768; c=relaxed/simple;
	bh=Aq/xjpQtZVLw9xK5TH/McTrsYCo8FgmX8RWE4uq2UxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vF2WTvKslv0GDZ39cgtMok9+OSsJK1JzNJDhslkZgA+7GloSoWE5rtVE9BTuR5xnO+PKNO9xd2DunnHbGkGibyJgOES1/PKzpibINlBAUyzgKGL95/kYULxMEbpOCMNqNYViZDuxqtDXMNPfheEsNULuM5yfR/fEjNbQ4O8H49s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/plhJRK; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/plhJRK"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a7e499d7b2so777765ab.0;
        Fri, 10 Jan 2025 21:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736573765; x=1737178565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mstnNBxMYPZ3CSr2MAnnT3PORnU1/wTPKoJyvQayEQ=;
        b=G/plhJRKUkGxMpJG9JoVAKvh+t9I9GS04fPWHrSJMR4P1STV5nmtF8vqPXqw2LGGQM
         0SlOzXDMky2itY3eb8+0qQWi36qLUY2c8PWNRcRF3k05CzLNpG52JeJwEARWxamQcw8S
         g3msR1EgM+EzWeutrKRq6IWT2sAtrFVXzdh0/0kEtLck869S2RV5IoECpxkAcVymcoJa
         lRoS4sp8nRy1PQQMVMu0R36wCxHOZA08p0CwE1ICipTBpD6uzwtgl6rIAwL1WbUPYh0A
         Z+AYOVkVEpd9B2R6chBxP5buIiA1JSeH2RD9UtlkOr8ADV+PeZjerGa2ouv5smBrDL0P
         Q10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736573765; x=1737178565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mstnNBxMYPZ3CSr2MAnnT3PORnU1/wTPKoJyvQayEQ=;
        b=VTJ+pTPBLNFHvshH6iWY25bf8wVzwDrEgRv35bvF4f3zrgAstRNP0/5wQmxF5UALiY
         KrIIXNixA6pqcXftIMtQmCpHlRJQcbcFmiASkFJiCtGpmKov9e3ADPUOmYqlcHHCfTy/
         EioycJrRIHBxLi7ToC0Nch1gkrw71SPob8ge9Bm1lflQJAu8+ym4qHha0Fzt16ftQUAT
         2evxs4A0Q+cmDTxKUP06+SHu+qe90s4qrtGD5XD0CWxCatJtAAYDDC3M2pT+xpQpAx7z
         na1Q3VcVfYXr9ATiBIOP8bnyow9y+a9WoG/jHIVH41eRXRHnO9PRVUlGZOkQHgjhhvC3
         3B7A==
X-Forwarded-Encrypted: i=1; AJvYcCUNdtg3wWTLdjUlUXzqvfK/Z/jNi6T3somtem85w62ujqOqgyIEQKE/Igtky3PvDuVnYkIIy9ecHX27nnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/KLmn4UyOEQUeYCApzjMGW3QKlEdNPa/RbOHYkrMxYcKC5Np
	Tz3AOUCag/hlZ6JVb5sp/WEP2378XcJvbeUzVnTYzUcnz3oVbR0=
X-Gm-Gg: ASbGncsfKLpfa8LO0kCBVxYcuBq345FgEeh7XGn4MxKrgRLJ0bQcHa6UHuJAYxrIhue
	CCtx508Gh8tlFKnq3usHJpBercK2/oRP88qdacwsyzgGjThuD4DLpXKXtF4BpVf8HAgv7kc302r
	fPBLN9p5T6v2RoD5QAPeOTQajKfJ+TmXWSasZGIPhE0sjH/We6tKuWGS+Gc8hkAWE++Altm6WKk
	ZOvhQrWK3tO15gtnAXnES0OQllhTImr1Sgc/Svw4VMpPAj3AZDCew==
X-Google-Smtp-Source: AGHT+IFnlmBp8z0CCfLdw/2lSUnLXr6DcvBdLvg/LipYfFidVe706+HA6zaIJ9Rh2jFkgFCstN34Dg==
X-Received: by 2002:a05:6e02:1b03:b0:3a9:e2f3:8da4 with SMTP id e9e14a558f8ab-3ce3a8bcf99mr26182065ab.3.1736573765533;
        Fri, 10 Jan 2025 21:36:05 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4afc39d6sm13630865ab.69.2025.01.10.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 21:36:04 -0800 (PST)
From: yangchenyuan <chenyuan0y@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zijie98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix race condition
Date: Fri, 10 Jan 2025 23:35:57 -0600
Message-Id: <20250111053557.1803140-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chenyuan Yang <chenyuan0y@gmail.com>

The yt2_1380_fc_serdev_probe() function calls devm_serdev_device_open()
before it calls serdev_device_set_client_ops(). This can trigger a NULL
pointer dereference.
This is similar to 5e700b384ec13f5bcac9855cb28fcc674f1d3593.

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

---
 .../platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
index d2699ca24f34..1a4e66464a7e 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -199,15 +199,15 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	if (ret)
 		return ret;
 
-	ret = devm_serdev_device_open(dev, serdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "opening UART device\n");
-
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);
 	serdev_device_set_drvdata(serdev, fc);
 	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
 
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");
-- 
2.34.1

