Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996227EF14
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656031; cv=none; b=C60Iw+tIOGGQ5CJeql92PdD263y+0nbWLeneBtZ9sEos/sl66cQsK5KOiP5Ode3HYaVZKQx0he2XAPbudBD8YXMRpvo8tLiPKFOroUMOkcR45Qu7ubHYht5esi77XmdPKSuEqAx77k0mE0ka8p8WqgO+stl40EfYckrJcqQQbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656031; c=relaxed/simple;
	bh=NQbNim9Kl9w3hMZilkX8mghToO2vPsILhxHQxKtN3Mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XqolaejbkrAD5qTg//sb1Mzp30yWVnu2BXJl5MyX2/x5EkPmIwjEn8nBkiZEgyhDhl04PFFY9NUl6k/LcVazlPBa5f7zcfNEo+FxUBJctAmfypWuqD3YRe/HsagY74Xq+/iyacJ84Xo/7HiSmAvNB9HCnvl9fkFaRe93MarPIzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=IDFVj/lk; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="IDFVj/lk"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60406f4e1d0so3317997b3.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 15:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706656027; x=1707260827; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyHH5Unq92X0kSKpyQantcGDB1tT8ugB/3UImkmNwAE=;
        b=IDFVj/lkAES27SD7y2PE+Akuu1uEcLvjm1pV7PsKvh1mqDPmiEnZqXYUtViiNbR7l6
         VDkXTTkz0Hqx7eTMM9pDE91rV5p8KBew1Od+J0ZCzAfw4YA8HU+I5S/u1Wo3eAdTFrEd
         PEypRiIv+MaBGxLu4FRZv7keu2qR6yQ/Lzbxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656027; x=1707260827;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyHH5Unq92X0kSKpyQantcGDB1tT8ugB/3UImkmNwAE=;
        b=JQnjCeqHME/LzGSWgO5kDipRkZoOcUwykXNultR+4DZggoEjClpKiaAeG5qIa0lqQ4
         iDj6ysdi7y6hIuDXQVvh83R7v7xo6XxISgeJuQzx2alNypowiMbYD/4h91KOFxvSjVwl
         6UGQuKCr/+R8o1U+eIctA5mcs7djesxxEcVK3rDIbO7qccv0G15t5Q4SlAFMLF5jCPjl
         bVOKxj3k9Zz+PGxW7ijIoOMFd0sOqXXXhDcXCKXzwfCkL35Iwr3/F3i6OXpqoLiWzxoY
         EYnug3XIsF/RRqmNFlzUC6FdI5ehoCsBB47mW20loKGHLuQAa7hCNjbTIJHWkrxOpr5k
         LqAA==
X-Gm-Message-State: AOJu0YzdtOVne9qMqAUZJCAevbRCYah4BgK23vfoT4TYlaGWm+iA6gy0
	c/D6N/u5XIQeLNsJAZYyaPDszpvuzhYS3GQ9v3rZjTYohaiHa6RBbefwh6K6Gic=
X-Google-Smtp-Source: AGHT+IEQXgQHf7sprO3/WcC9qBEGZ9XfRvNABgddgUIxPgQY3kLczs49/FKD+DKLZeQpM6lMZetBhA==
X-Received: by 2002:a81:eb0e:0:b0:5ff:6084:421e with SMTP id n14-20020a81eb0e000000b005ff6084421emr7017803ywm.32.1706656027480;
        Tue, 30 Jan 2024 15:07:07 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id di8-20020ad458e8000000b0068c47832171sm3081275qvb.65.2024.01.30.15.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:07:06 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Tue, 30 Jan 2024 18:06:53 -0500
Message-Id: <20240130230654.4218-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240130230654.4218-1-ivor@iwanders.net>
References: <20240130230654.4218-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
Changes in v4:
  - No changes in this patch.
Changes in v3:
  - No changes in this patch.
Changes in v2:
  - No changes in this patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 530db4db7..b0db25886 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
 	.parent = &ssam_node_root,
 };
 
+/* Fan speed function. */
+static const struct software_node ssam_node_fan_speed = {
+	.name = "ssam:01:05:01:01:01",
+	.parent = &ssam_node_root,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -319,6 +325,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_pprof,
+	&ssam_node_fan_speed,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
-- 
2.17.1

