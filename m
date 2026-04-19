Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E1238150
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776618633; cv=none; b=MihnrkK+Z52hEMkaz4merZ+14c9/GPODTafXTKXl25yex56YUysHjZbubdOer2grgUxAHGUBIjo1O5zdaoSN6ORx7pKZKfb+u2a3j7bqkEj1NNCrWNhZT/g81siqt4qt79iKc+KfvFvZO9MKkOhiS7QCcPfC5HqK083WxXO380c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776618633; c=relaxed/simple;
	bh=g048MkCvqSOBynlchfJh57UY0Z1vzIEQS6EpQbM4rkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZXNq8yfyMNvE4blsyuIDQYZhFZHL0G/odAn6GLwyLVdYW8PJ3okyFlgeTp5Rofcxxv3V2c5+Cihlg6yerAuy4kPtq0q5c46aNhnvYJ0Km3FOdODYnA5x3x9OV2Ew6Rro3NVEc+QHNnkA+OAiE1efhmsSKAWnf4ILyxa7uUR76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvnHDdfA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvnHDdfA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3614826eca4so1632954a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776618631; x=1777223431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=JvnHDdfAwvt/p9TyZSefPy6/l/JzAoDj1+mwjgfHyeTGj9KzvkNJCHF9198zT2jPlY
         GIyHlXUK7WYSB7zT7OBurzRO1/JhF5IoiMEQRwJ4hQG3k9tK4/4igwg0Jah6Vd3ocMaq
         9rWcUrhwt0VXz76wqm/kKcNOVrmxoU7h3T1RuwxyJiwXnkrQA9AKQHRJuLPP9ODfs2db
         FaYTymonVMgfZkjq8pPwrb2TIzPYI0q45ewfNOFpT0dGw3BLJN87vesbNN6VE+iJh3X7
         cA8rfT2UFiMEVJ5DPtoqYA+RnZ8zDLPmwmYoCjYsY1mTC2fGpPrpDs0aiZHDIVR0Mt1x
         Jy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776618631; x=1777223431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=DTVMvXpfO5zAS6Dvvig+DFQZ80DFH6c7PqRncPqLL4O4+EpR8sSm8G3x8GfOqB4Qf5
         aeCpQxN8XOoRTJLQDbLHbC13wKqUGJpTbYJJXdaQW/EgHHk93nW0uFJY/VSYeRJVahdC
         jOpCHSoJ33z5C0tmeiJG7ie+oDmeCSylH54mRjixcSVTCf1N61HcaK+U9tx1bhKpDSVs
         NOlOqEeJXbLp6oLdLhmQqhXW7ngvTpBU+/4nMpzND13XKL7kyv4pBAgVlVjkKdPnHwB6
         +/J6GvNiCgSOs3dihUfApr0QuVAKCFyA39i3Oq9HGeNUlFuI0EvqxlXE7ImI40SPOsXa
         2vAQ==
X-Gm-Message-State: AOJu0YxGouq9EnCK7bncDUdsEdOm9CWM1jNZH7AkACZ1EQ2UXstvATfD
	m0/+Eyktz9QO1yVbR/P8/TaswOnzSEYJ7D4xZdlb1tilFeJos4B2tSia
X-Gm-Gg: AeBDieue2A+2R+R2Cstpj/YoPPGzQYXIE8MVx56MqPBhXV+Jp/Q2Ybfv+xjaB/NrdSq
	iJOCLSvvzCY6Q83xpgMQf7DVXC8GEJIVZ2puq7OFMrJ3B0BhdX57jR38o9F7/5NvgP6tXAgS+uD
	3dcnsFKUqoBg4z3JX1CN5C4/bWjJoYO7/R0pW4O6dDumVfYW0hdZ9D15P7cwtKIWVF75Gq4IUaj
	Y+zZRci15iq0w5lDp7TL6snk9Ik2+MTKKnoMJOdWPxdb2FKv0sBGCytASO+RSYZFwVsJvbSyXhQ
	CngkNAlnTOFU8OiUSrkgoz3NOq7I99qblta9a5dqGhpcKbNfpi9kRfDXKwU7LX+FJy+8vknKTeF
	xcb7pbtvoL+IFwRypSqR88P3mvC6LXRnskN+59DSzeMcz4axzl6oJfW1xSeeumwv4a9b1Um1n0B
	tmshQR7Oz5ecrpfRycsh/qt6O+wNszDSEow+yu592/ho21sTe926nR+SvJgKMGCUcQSJ6SvlkJ0
	3GmbsVdCEr4b6GNjg==
X-Received: by 2002:a17:90b:4c52:b0:35c:30a8:31f with SMTP id 98e67ed59e1d1-361403bdd28mr11782171a91.2.1776618631255;
        Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3casm98158695ad.17.2026.04.19.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:10:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
Date: Sun, 19 Apr 2026 22:38:35 +0530
Message-ID: <20260419170835.347910-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-other.rst.
Fixing it.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..1d0410500d3f 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -144,5 +144,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };
-- 
2.53.0

