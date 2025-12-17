Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC43BCC22
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967832; cv=none; b=NCOjGwXDe5czFYaA50KeM0piBV+/FLhpLOBVW+u3oL91G0ucdJQvmHlYjazB+0kn0llr1y6xU56BCcQuXo+J+40VfZPf6pd8dZbfvQh+jas6nEnWJ4o4+AzIVLNPT1eb6DyXHVpmpJ46U0Gr33uiClvqIsFZEwcg1G1ud6dwIrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967832; c=relaxed/simple;
	bh=0IwkmUujrEfrRf+r7HujbMtigGcx69h1H/EKUwEUfhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkN5U8UJkPe/qSEJCWSjHKf15MiAWphN0oDcFuSo5BZmQvZOgyXL2j+6oRm6ksOp7ghyOHLJe/GHyPc0Yjriy0sZG+VfpAAi73HVzkNxtfeaBNU/rb1+Vgwp/ifFSVRRK/qtl5p1WJ16oqg1nM6tUxg7JDovyDD2hRJH0qRmLIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4WegwgE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4WegwgE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775dbde730so5646315e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 02:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765967828; x=1766572628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82l9YOaC/f73jZwrcIeqTDFF04uex1FP9G0AQGYcRDw=;
        b=N4WegwgE6yBVFdc3pHf1q0wAYd3ZRtxxnVwyg9UEK6XsBnlPXPzbxN7TnsevC5kdCW
         6SDzDJdyYTfmUObo7Rz4HJvybsZYullxAMpv0X2iI4FhydrQHKZ3iRjsRQGQonTJSGme
         mS6fbiZ7QSB40zZIouTXxGWJowCqAyV0ne17ZBTIMwTgyINhe213oKWHcjh3puk+froK
         lSl3IIMuNgKAW8opDsfWRS4FfblNGieKORjago6nBHVmO0Aj4ecmYIi30iRfShknH/Yo
         w5cKKuwKVn3mZ0sp7pm+Yt26QjOwldDQuoHSzxkGn6QX9axUnWbmml1H+emJqQJU7X5q
         zohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967828; x=1766572628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82l9YOaC/f73jZwrcIeqTDFF04uex1FP9G0AQGYcRDw=;
        b=xQ3fz7UBtWl+q3oNpc/Bx//QitAeRjhQSHKC8ntDKNbd/lQZ4xmMwei/H0/I3C2uR2
         BehmzxS6pfSO/4tvlOJOj1P0JtpXqNNBNjPVzugUU01Tm6kAm5nmfhjZIN5+ulhb1j9x
         wGWqPr80rgRekrY5HurhK0pRO+RF7B5YUgbdypvmU+KXNGmOjItzeftDVIqCp2tyXGNk
         gfweGBfP2kYLpYe1TIwUwdb7SRE/9kCYTkWPVvnxANrk5TsZ84K8apjtYw/hS832O9cD
         07xmsiK8Lk6gnteJLrz7s9tMJ0+uMGqLWMwLqW4fFUhJ9DJCk0XM1zGBxpo4rlDQLE9+
         MjkA==
X-Forwarded-Encrypted: i=1; AJvYcCWldYDZpA/rIMN/80a9VkKgXtRifI286WawxU8GlGo10dFGG3rnY/D7xRJ9HGbC/CVz7NyTVPBYWrwaUWQKPCcBlrmD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64M1ikvus135fs4SUeNtYMWY2Mn6CVjbJzGmBIev14QInbamf
	QsI9sHArRFppcNqKnDOTZ3sV5vgRj/R8Y7Iku8VrpoXzWnImdC5rubyt
X-Gm-Gg: AY/fxX6S8zWGbFaERPrFmNNJlcBQcqBgABCFxnyXfkcFAAhioe08bAugcgXWNXMV3Hv
	8HmEtjTHk1uh0tL4Dpbo7UO6QXMb2tOS/m+Bvts+SMgS1kQT3AGc4tIWDwP2xZo8uJ9XlFWb738
	YQv0YaumXICMUrQ+d002XYlxWm9PousHiTNZdmHJs5CInX/B8qtLpRDyjy5htx1lMy5w/XgCKNS
	Vs1XBh6OG/N9FZ/fBZBh68039hc4HfeY1WoI5kH3Lp3Dgynjrzbd8m7Mbki0LYcs2D93tRxLrtx
	D2X7hKxfLrA6BdGOYpT47yw4x5Wd9yGNNKh1KoFldOGJXJcvGeIEpoMFun/hOXGtPuhsktyvRax
	WCI/X041LvQJalGTz5osz4cfPdwNYknJY+kxlp+0EBLlWB6Qv7P+N63xTH8BZ/fdTPw+rYEx6lE
	NW0yKzpq4jtvRWDcjCHZYwWEA8ceOpKQyXP0xOfAvSgMQl7sdlA5jQzy+w2H2xha7GnAefCOC3r
	g7MpV0=
X-Google-Smtp-Source: AGHT+IEc9c/iXKKpqtn4WaK+3xTBlq6Qc8k2XqpSMw4oXSdehCCr4nOOh4OfbEzmV8mLtgo/Px3XMg==
X-Received: by 2002:a05:600c:468f:b0:477:7bd8:8f2d with SMTP id 5b1f17b1804b1-47a8f931e37mr121012425e9.8.1765967828066;
        Wed, 17 Dec 2025 02:37:08 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47bdc2314b5sm32153705e9.13.2025.12.17.02.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:37:07 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Matthew Garrett <matthew.garrett@nebula.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: msi-laptop: add missing sysfs_remove_group()
Date: Wed, 17 Dec 2025 11:36:13 +0100
Message-ID: <20251217103617.27668-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sysfs group is created in msi_init() when old_ec_model is enabled, but
never removed. Remove the msipf_old_attribute_group in that case.

Fixes: 03696e51d75a ("msi-laptop: Disable brightness control for new EC")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/platform/x86/msi-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index c4b150fa093f..ddef6b78d2fa 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1130,6 +1130,9 @@ static void __exit msi_cleanup(void)
 	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
 	if (!quirks->old_ec_model && threeg_exists)
 		device_remove_file(&msipf_device->dev, &dev_attr_threeg);
+	if (quirks->old_ec_model)
+		sysfs_remove_group(&msipf_device->dev.kobj,
+				   &msipf_old_attribute_group);
 	platform_device_unregister(msipf_device);
 	platform_driver_unregister(&msipf_driver);
 	backlight_device_unregister(msibl_device);
-- 
2.43.0

