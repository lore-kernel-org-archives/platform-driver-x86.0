Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68D3EDE52
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527909; cv=none; b=MHyXzCawmEgzkYxE6aELJy/VydxUVjGjjZo4p2Kvq553NAR+AKk990GvX8p6I2xn+GX6ogXRBkXBIp1Iz+ErZrsvp2DHlM05X0nyJ4wRLP7deGrwDci8cc3mKejectnw6SLFcfLJQtEpfWlh6/B80DlD5LOVviZRxRApW/nNmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527909; c=relaxed/simple;
	bh=qvJVXowb04UsIXxBDYgZ54VKsJDx0YmokNWEWgHEC24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A/6TslcDRrQejwKXMiOnEIclHQ5tjb8ZZKlG1bnCIP3WHkE/rG1y4mS5FLoWo0phsh2PeW6SnDPI0P7D6tt6/N3UpOvW1XA37jH40XteTqOsy+lI+Jpx6ICHcavCIPwvBJ+/fc+E5tCP6dXEdI341KVqFtLWERbnxDjFglSgNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jIWeFxpM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jIWeFxpM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46013161068so1607959f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781527907; x=1782132707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lb8/KSqs2mkhShiOS7gzeEphH2sgfBl4sVBkM5ax/8=;
        b=jIWeFxpMMU8bj8hipff0kiPFDE2WELyOaVrNCbUAkF+WDvfAa180bRhaVYQY9rsVQP
         ToEkqoOLc6Mloi/9oygv8cZ4bSJqz+WjKl4kBi2zCXRwNP32p70r5I2LraT34j/sDCqL
         CZPi6lBMm+AmuGDK5MemOZpex4EmuMhVl6NSLxwvSKwNh942SWfTIjZGZCvBGlFdxaGU
         2Ww7YT+rxNtx788heL8dPFPQmp1TL1TDbwBQuBrVWYHObyDlXERkHV2F4aXPyesKdAiZ
         dXS6TWW3gWJUhsNyvsnECbbkX0q+8PThgvwiDj1721XuepxI1XvFlnVhnZXirm5dbSTc
         8bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527907; x=1782132707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lb8/KSqs2mkhShiOS7gzeEphH2sgfBl4sVBkM5ax/8=;
        b=sYoKiUAkLRnVntMd9dLvrUu+sey0Jwq0JM6fHitscLyk4mHzwvqh2A5Dl4fOdk9JYU
         nF1eWffM2fJfEG3lDjt9L69Xam2dGUjucnrLsKYAxVDp28/efFRNLYvwb3WuiSI2sjlO
         UIu0wlzLGEiYFHDkEn+p2C1/Vr317jxHZuwgG2+s/0ON6l6mCFo0rV5HD5qLV/83FcQ9
         kmMzQhkL1kKaU71J/WLakDIhZ56E4pZjK8ykrf7RvjJePXEk3MV4odfCvv0a0/d9B3lK
         4tUWKtxWza+Ino5mc6vteb0Uf+nvCBHUkg2VsAOc826+H4VGfsqx752BXrNEbyglUZcQ
         ZDtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1k51Fokb7jsCYJ1ik2qxSk9r3hATjqDKkf6clx8vvuyU5cQpZCJzCZs3K2QCBNBP84dVvdDVVLVt7TohvkNrt4lNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Oaj76uyRm4yEEzEp8e/lyf6zbeQfpHWPQiJSoWz6sxCegstZ
	0K6rBuwmcIfVmeLcxd+ny+T2eYkfBmDw7t0tw+DNO9XKNprT/rwZar87VCqmcYyest4=
X-Gm-Gg: Acq92OF4dWP+Hynw8AcnhkrQgIL+qC8VZ0fjp0jMTRHbHQwLgxLZAx3q2BBRxk9mz7a
	FqXbNu+VWoP6M/sZidfDsdgQm3kkYKT2tNcih76MX5i+oVGreY8n1lJ1UHjwmlgIr+LfKy71ZqR
	xEp9OiwWGujG3UJ+Ved3AQmSdVf7koT2NTCbpHwvlLTpTBKPigGQs/047ydVkgtody6dKUCNHa5
	BNTBVFaQfsPlboLGqMp0rkG9XYNuiS3bESdzGN9LIsuqUU3mnbZ9blkiu91eFyPGMbciQAE5X2l
	BA+jrqSymaO2k8wTnldPzMwpakPjqEDx0bO4Wd7xCz31x6YMEOxg2OOlgk6er2iE/Iiu2KXBXoM
	xRwm9HcUkZZMydjcZI8ySb8WKjVYAesJkX7fRi7jgwHNPm1YUicM8mrjDzAECy5uBdnx3hgEgAN
	x/eP0oQaZwOSdjKvRwMRZZMOzXosKB
X-Received: by 2002:a05:6000:400c:b0:45e:b99d:dad with SMTP id ffacd0b85a97d-4606dbe5a84mr18890507f8f.38.1781527906562;
        Mon, 15 Jun 2026 05:51:46 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f263923sm34621556f8f.2.2026.06.15.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:51:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] power: supply: surface_{battery,charger}: Consistently define ssam_device_ids using named initializers
Date: Mon, 15 Jun 2026 14:51:37 +0200
Message-ID:  <bc8eff03b2f36c82af5a75fc7114c277228921db.1781526433.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2783; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qvJVXowb04UsIXxBDYgZ54VKsJDx0YmokNWEWgHEC24=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz9r1EMjw5dtTi2wLDnzuxQnUlXm69EqzoYTLRR3vXzt vXeePu6TkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQ2hYtTACbC4cDB0JIpVRqw+k77qVu1 zR03vstKSHft5XiRNVf2zer/Gg0X3NbF880PZ85m+lWV49/hUlUzi+nLlFsfLQzv3ri77dfObj2 POyc7/EPaEyP7Iy6vXeoy33KNkbrXNcZLj43LF0Ul/utKyNv8XGFFGru0c/W9hW/7VULLvnQW6K m81NTO+3jkwWdL+6VKjOHRq/UdX16d3CbzzrjfZLt9aq7A7mULjp5fLCLz/MryzdO1c1c/vuL55 PbFi78FsiRvrOmbmZnOV7riR0+FU+Y8R9Xlx39rs5xRZexNdOKMLVMSywq9enpjD+dkjderp//q uNK0fJ+VYPWnnvTyEm693reRe2VT90q0FN5bwVlUM/U3AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The .driver_data member of the the two struct ssam_device_id arrays were
initialized by list expressions. This isn't easily readable if you don't
work with the Surface System Aggregator core regularily. Using named
initializers is more explicit and thus easier to parse and also more
robust to changes of the struct definition. This robustness is relevant
for a planned change to struct ssam_device_id replacing .driver_data
by an anonymous union.

While touching these arrays, also drop the comma after the list
terminators.

This change doesn't introduce changes to the compiled ssam_device_id
arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to ssam_device_id is similar to
https://lore.kernel.org/all/cover.1779878004.git.u.kleine-koenig@baylibre.com/.

That allows to get rid of the casts in these two drivers and thus
benefits a bit more of the (admittedly weak) type safety of C.

But IMHO the improved readability alone also justifies this change.

Best regards
Uwe

 drivers/power/supply/surface_battery.c | 11 ++++++++---
 drivers/power/supply/surface_charger.c |  7 +++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/surface_battery.c b/drivers/power/supply/surface_battery.c
index c759add4df49..1273b6082311 100644
--- a/drivers/power/supply/surface_battery.c
+++ b/drivers/power/supply/surface_battery.c
@@ -852,9 +852,14 @@ static const struct spwr_psy_properties spwr_psy_props_bat2_sb3 = {
 };
 
 static const struct ssam_device_id surface_battery_match[] = {
-	{ SSAM_SDEV(BAT, SAM, 0x01, 0x00), (unsigned long)&spwr_psy_props_bat1     },
-	{ SSAM_SDEV(BAT, KIP, 0x01, 0x00), (unsigned long)&spwr_psy_props_bat2_sb3 },
-	{ },
+	{
+		SSAM_SDEV(BAT, SAM, 0x01, 0x00),
+		.driver_data = (unsigned long)&spwr_psy_props_bat1,
+	}, {
+		SSAM_SDEV(BAT, KIP, 0x01, 0x00),
+		.driver_data = (unsigned long)&spwr_psy_props_bat2_sb3,
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(ssam, surface_battery_match);
 
diff --git a/drivers/power/supply/surface_charger.c b/drivers/power/supply/surface_charger.c
index 90b823848c99..d4bba6b41794 100644
--- a/drivers/power/supply/surface_charger.c
+++ b/drivers/power/supply/surface_charger.c
@@ -260,8 +260,11 @@ static const struct spwr_psy_properties spwr_psy_props_adp1 = {
 };
 
 static const struct ssam_device_id surface_ac_match[] = {
-	{ SSAM_SDEV(BAT, SAM, 0x01, 0x01), (unsigned long)&spwr_psy_props_adp1 },
-	{ },
+	{
+		SSAM_SDEV(BAT, SAM, 0x01, 0x01),
+		.driver_data = (unsigned long)&spwr_psy_props_adp1,
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(ssam, surface_ac_match);
 

base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
-- 
2.47.3

