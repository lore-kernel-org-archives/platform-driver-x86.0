Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D03F44D4
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811543; cv=none; b=M/pIkVWSARB5/03sbzbUFkSBnZFLK4d4jmUCIMotaquT/0mKyvkWNDFVHNmGTnqDsUjHYlRvSLf5rOi9omWESj9aN/Cm3/sZ2ghDaMP5SHt5lxTpqCIyPJscj4KjA5xmrm0bwgSDRSFwVhfdC9E76OPASJs5tvkukua0Dk4vI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811543; c=relaxed/simple;
	bh=wg3TcaVVekdUvsTeebuo2wdAcj2cM5xFuvb7dDROjSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWbgWpKQL5r1D6f1Gkg9OSZ/9KJPYX+hqEW8WMT2yQGd4YUIWiHZ1iDgnefN8vDYaRqkBl8FUaQaM3R2q9jMqOKMfd0w3Q0P2gRyXYUMz2JW6bThXgn4fk1SqRhtl/pcmRk/8qEXHzuU8qOoZPje9WP2tDRvhQnL6zXSu56FJBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bys70SuP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bys70SuP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so33491995e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811540; x=1783416340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6BhAW0EogNDAWJRNMduyFBF+HeqOA8gZ7VBP7Dj3Ww=;
        b=bys70SuPLrPYQ/qVaZJ3lTmPtoQlufsGUk8Up2nObC0M/Qqrb3g9BxYl19/7rtGlbe
         aG+KvzxdjMgo7uspiqnMDiyQRdrmOkUVgzD4pWE3kWdXgWeaJeO38R/F9uurfp6B1Lo+
         7HaGVD//tRE30LzChWAchDmqSW6BwKjyI8Dd0P2kiDxr7DSyNv1Xhfr3EvJ4mFdrlOZ1
         0UQ4hIJ+5ksCjHqPVJEOpvbyC74zMN3QCYLfUy8ETXU4e0N9KlKteJiwt5DVWeIy9pvE
         0PZ7iv8TYcqovKXsvvhOCQIyGCfDsGkjZyrAAx2xHuKucAcEVvuVJxwbak+5jOH9uhWR
         9ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811540; x=1783416340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6BhAW0EogNDAWJRNMduyFBF+HeqOA8gZ7VBP7Dj3Ww=;
        b=UGFOY41qSm8PxYun9QGkNPPXUIxMLaHvGL/Dmc9NaNwVjgIexBh3NbbNKAw8fB7zgM
         TYEnfWaChjba+VAgqQ4WHM1Aw0TveGArb70ShTVRwXhbBL+Z40JQmYGnO+NOwK7mRkx7
         I8ScDd27HAXTOMtpWyKuuofPz4GSFSjZPnLlEezyf45MFn68CwW3IPymW6d4btEudYkZ
         urWHcNlJmKGgt581RzgjGXCnDUQQhYAAGG8RT7HxohErSNDfiDCn06Gyhbq0LCCAP85T
         9XsrC1CYEciMPMQ/4jrhxxeHbHlsD0QfesiuL/C07BrwGjSEFToCG5ToNdhQP6soVR78
         7Pmw==
X-Forwarded-Encrypted: i=1; AFNElJ9v3m2ICQ5FKj1Uaj9xjsC9skCqc5eYg5DRVwCzKr/XQV9lg2ASJnee2Jqqzf7QoTjA1g5b9QUkznAiL9qvY8nGZKkg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyii38yf/Uz3gahZ20AtbpNPxcdBA+AQNPGRE9j5aHIbaoNR4tb
	VwC2tt7WxTeuVOojJG62cVzTrvBJyaGCS5FrBKMVioVSunbwpSWnjanPD+AUIYVGpYs=
X-Gm-Gg: AfdE7ckb0tIIsbqNCaIWawksWHIUr9tCzKgF90kcStJ3/95LhUlx3A08WPGx5ujNB/1
	7aJIU8wFUv0BP8NUFbsyLAxSZRHhCLmukIrK3ekk3qyncbcQ469+Aga2EZBIfy1O/bX7pOCAxAv
	SXU4ofYA/RqRe0DPJOjhXqthK5gGI9AWo5J7GhWUAKyMJEns3K1Zs8ycTpmTC5zYUq8M/KWh1lu
	yhJe+dWcz4FY7CrOeDZoecUK9EGP33ktmKv6UaIGArzgB8gvRSh0nT+0GOIlAxrlWBKNuqt7dpT
	bO9MF8i6ul8o8+g3Kvr9VF7BOggYmP2mYQyDm19j6IYrurAUJvdF7LIrDOacxNoXIJRLDxgRk7+
	WteVhLeGPo8PU6UQrZKwTJImzIzijISmjAwGykK/lG+8acRXOZLQE9KYCXzGMrZ4RN5TN9cHRDj
	mrBe7VCCQR8O3cRbpbypQw2L6XbY2QqCtQkhIqmHQD2hd75eCq9mY93XxWHI0sYYYZtiAB/ikJM
	+Df
X-Received: by 2002:a05:600c:a012:b0:492:699e:3113 with SMTP id 5b1f17b1804b1-493b82c1268mr45170425e9.35.1782811539937;
        Tue, 30 Jun 2026 02:25:39 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8cb62f1sm95089725e9.15.2026.06.30.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 10/17] platform/x86: int3472: Add include defining struct dmi_system_id
Date: Tue, 30 Jun 2026 11:24:29 +0200
Message-ID: <0ba52730f67dc995d9d896b81fa6a7320bf8cb4b.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wg3TcaVVekdUvsTeebuo2wdAcj2cM5xFuvb7dDROjSw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4thDt1togLbMsbmZlJtB2TdYEWzTy/htfjGH fsdOaliSHqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLYQAKCRCPgPtYfRL+ TgYvB/9EvyhxBnJrKlNbPuI/Cym5VhmnDNrKD9ff8qT4Aih33Qv0zA+FkoaxYoBfEhc8A//ldRT qymhiisEIbYLY4ShAYqZbXMEeu9c8BfdvB1txMufAe1ZLjOiGGrX4iYHQ+v189sYMuQVSnABa+Y xOYct9T07SRdILeSe0rLRTEXomXxRZszvYy7NEdUnI2jLZvD+VHqpDxknqQHrO2KT4dLHUcdZPX n/dKEh4oN1FBI2hgZM2GWp29IxEssdg3wn+1qI0pNuZgIaflhNf/me/YRyBNbTbFrCoTYK6BwwU SpnDmGR8wGzIfyaffobIqlE5SirY2T3Q/Joun3uRpzyalI0g
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/mod_devicetable.h> is included transitively in
int3472.h via

	<linux/clk-provider.h> ->
	<linux/of.h> ->
	<linux/mod_devicetable.h>

However these includes will be tightend such that only the bits relevant
for of will be provided by <linux/of.h>. To ensure that dmi_system_id
stays around, include the respective header explicitly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/55c02bb0f0577ea1534a1969e72cb6b771b8c5c4.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/platform_data/x86/int3472.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 93f1e1fe09b4..a73841dfae27 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -13,6 +13,7 @@
 #include <linux/leds.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/device-id/dmi.h>
 #include <linux/types.h>
 
 /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
@@ -72,7 +73,6 @@
 	container_of(clk, struct int3472_discrete_device, clock)
 
 struct acpi_device;
-struct dmi_system_id;
 struct i2c_client;
 struct platform_device;
 
-- 
2.47.3

