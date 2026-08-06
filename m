Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B95499F04
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054386; cv=none; b=QCVRnOGo9QBmrY3M4lsPjVgfp8nfRxSZ4eXFadJWlnV9wuSd3+//DQXP8wTPXSswksTZWac0Ce1Ok/SVDLrXx8pZ27Eta11gpj8gOlhAfcNQscdk09kLYNGhOkCVO72o8/uNHiOhjMq7EPle5eQjo4wWdN0I+Ydj5VLe+WnkTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054386; c=relaxed/simple;
	bh=dFzIYQsm22ZBaO4KmiWxUWVKWAjICxXvqy/20mR7nD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEkCO64bdZmoBuvOfNGAU8wUUY9c+oRim/foUXBS0KhjciyJiKFZzISnMsjd2imA93jy1kRcKckONXcVpnnmydru6m3tV8PUYRh0YRTKNHX+UPtKNykiR7pY/hGEcqZUZNZmhy9DqoPlcIUZCo8jzbtB+wmpBWtCQdUwLZ8WIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfsA67pU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfsA67pU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so4277749a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 15:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786054383; x=1786659183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCAlW3t30HJ3AH9YBgbieeQV72KNNPD72b176EEDN8Q=;
        b=AfsA67pUYg74oSBu5jvtwhSeEuXqS+XRGxP+4HCk3s3WQ22JWEuXJ1joqdqmm6CPjs
         4j4ScsgD9fEq1bgDsoSJe/M5qHAfafnyfmd2h7N/zfaGm+WfoVMb6nA/LpArkiO2p91+
         ONgjIAjHz/UQ2ims2AMr/5spCHhy/df+jMGuYyagZEwittwPavdrGiGxkrWUbvQWr7dO
         b74ZnF4BrfD5fiABOE/m4lmVm/MQlFKmyN3ZR8lJG43SCRDHgQtFwWVnQlVomueUPoM4
         FYEE1FNHTLHvKPftQwLS9/jkzBysfyeFapsUP8Vglgjv7wcz7Rd3GlDuqkc4HMrXuNbi
         osIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054383; x=1786659183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCAlW3t30HJ3AH9YBgbieeQV72KNNPD72b176EEDN8Q=;
        b=X5N/wzX9rlFxG26aP3QiT1ie4DM6N2DgjrUclEZ1SGZ0ngfyxRH4iS91uxsjWeDJRO
         p4Hs4TqWaGjzuO8kTGLr9G05xK6xJICkr909/XAF62Rg2T/9obzyZHlGmx5Lyqv0yKnc
         f7gDtq9+J5rCXwa7jwiGthrEa3cdFNYUMNVjuMrmoYvUnFYmJAkhf1Z9tcZlR7Aufp91
         KBO7OmpzppYQJyh0zj8I6Gl0kqxyv6qv6rhzdIqff3UXu0WEB+y52lWHiZ9LUZbNqEZo
         /00VPaEPc4QcnSNk4I7Ni1793cIoKxSkTihAS+pRZciigstCfXHcKlmTmfywqBsajm36
         ZjKw==
X-Gm-Message-State: AOJu0Yy1DmhLnYu2XirjWqnY/lk01QqVeR3IXbMl3ZdEpkM0p6s2JRGu
	vChZDRg4FfH9juHr4t2rKDjCDmf0+RkuC/q39ozM8kLfRKbzQpeiIThK
X-Gm-Gg: AR+sD10y2298wRjrQNn/9tKHrkOjfduvwTea7ADwdjGVW8/FoXbb+P2CsN2Z2X4kZcp
	+COEtWFPUHx0eVdnXM1gG/11BIqE6ilQmADs6y1m7ZKcmv2E6qX3h4RHXhEV7i42cvfdrw/Upkz
	8G1choMtBlxCB3yvkhAM2X8cQFYmWr62RUbn9L4RfENp9XAh8D8PnWamvMjtXJJU16SscwsRF3i
	eWdJkh/B9iikEkZNK/jzmFgZ6G92kkeN/valAYfJJ5REvIX7Khp2nxMAjtuV3zyI88jIof5OA08
	VuhJpHZDO+Zu4AIf5Bi7ArIMmduYUy3BW1PJjnO2DrJODw7M/Bv6uru1zB6w6TqfRNnHtX7xD9s
	JICN3W/3gvRxHxV34qAzJK9ivpfODic0xI8Ed2S6Hlt69fCSdbpoODSevqlA5IwALwEYD2aX21I
	OsycOmtyUZIoQznaXncsLKSa/DR663DhP3fVKMbesA+OSAEIH2hQcfbzKi9yP81k23uhpN6x9b9
	rjuX8XAQW9LW7V+MQZt
X-Received: by 2002:a05:6402:1586:b0:6a0:ffb1:9f65 with SMTP id 4fb4d7f45d1cf-6a14f14e076mr9480767a12.20.1786054382986;
        Thu, 06 Aug 2026 15:13:02 -0700 (PDT)
Received: from korabsdator (m83-190-32-126.cust.tele2.se. [83.190.32.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a195b737b5sm1311454a12.22.2026.08.06.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 15:13:01 -0700 (PDT)
From: Korab Doroci <korabdoroci@gmail.com>
X-Google-Original-From: Korab Doroci <korab.doroci@gmail.com>
To: josh@joshuagrisham.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Korab Doroci <korab.doroci@gmail.com>
Subject: [PATCH] platform/x86: samsung-galaxybook: Add SAMB430 ACPI device ID
Date: Fri,  7 Aug 2026 00:12:55 +0200
Message-ID: <20260806221255.40148-1-korab.doroci@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SAMB430 ACPI device found on Galaxy Book6
laptops. Without this id the keyboard backlight device fails
to bind to driver leaving keyboard backlight control unavailable.

Signed-off-by: Korab Doroci <korab.doroci@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..99f72b204a51 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1438,6 +1438,7 @@ static const struct acpi_device_id galaxybook_device_ids[] = {
 	{ "SAM0428" },
 	{ "SAM0429" },
 	{ "SAM0430" },
+	{ "SAMB430" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
-- 
2.55.0

