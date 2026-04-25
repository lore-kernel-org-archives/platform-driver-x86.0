Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CC3603E1
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134720; cv=none; b=pyiwHooSyc4Id02Uu/toSXKUhRJYJM7YLj2Uiv3lAc0XnIdNmW60mZHrmZy1rAk15rbJlANhfBN79CvcJ+UrCkDQ/j4ph2hMkp+qUteViWzl6N9Cnxm9JIauaPEMqDQbcf7HnN5UUVWM8ExkCrVesBXwf+qFs3jugXNwY95/KvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134720; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssjWZNUjJ8pRek6qj2tbchtruXqryfcZiz89rGVIxQasAJarBZ8soOVEV2awM12Fkpykn3pkU5mud4aedZWJro0Bm4XFegSQEd1ojFBmg3bK+mSh+DobK7+MHuzDcL2SFFZSIwO7uYjxpnV/UGSsKIjwV2hc2/qBQVoisfWZncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRM/pyJF; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRM/pyJF"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2e221a71e19so8653458eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134718; x=1777739518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=BRM/pyJF4Wc5DelUIb5mB3NelzylN5o7Pxtc+CnZcWyGGR2q4/0nLRf1rx6wjETAoD
         +/x5Eks8WJ44n9nAnaLgQyTcxki8B2/Ea7nsUR+Wljuw556oHou1dnsblQ3OovU3Y2/l
         TMFAEZV3w6ruazM7b/7MVb7nMKKZl6usJJWHiNjGZ0qIrAYvf2n700hWYUnKY0IqwZyC
         Q6v504UtN7eAG0AdSAz8idUzP0UfN+WHB5kp/uVIx83kOmoWt0L6rP2POUqwU7rBbdGI
         hI1QQ7hnFXJcRDgcM3Hw5gIeF6lHnzyHvE9ERn2OuTfPLzx0fBHaeqeNVpLbP/xj0r/D
         mNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134718; x=1777739518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=UoeutiATPXu7+/l5+qxxHU5MdrjDdqQEoL5fzANWDJpNiik2SMRWV/bnZQknDHN984
         nQI5uj2uwQKZ4TLoDMrRQOGOfNd3pDpydIglI7iHq3IpREIlVRQOH9Qi4GqwAKUJKcSl
         P3ky3vCzukxeWaeWmP0Yp5c+OhEtcUwveATMP0InYxEYvXXukP0ATSYT48dyfD7/BCeN
         2BBCSsvzWt/dk8YduhQsTh0UQxYErlEls6xUOih2Ekel0iiOxBme9LsZTtUdVjaDuQmP
         v9N4y1oyEWiq96CAjiNRFscDcf4e+otuuMJdRNX7u/F8xzIoqOCfrgam1gsZN4W1/siJ
         lsoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sgvZ1ZGkNPnKz0RNY7+3aTrWIMF5VeYl6SByznjAZ1THyRjFylWbCZR6LSFh28rAxhrRkRF9hZtk1cEXs9xFLMcuI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PdwAQR+fM8DECkw8XyKnuGgNgT/irKp/ymgeimJxNGanCBLi
	udoJVAeJrchhbDzrrlkiL15VsuxP7YX8HeukIUvcwnv2VPghgH7j5+wSYXJ78IPu
X-Gm-Gg: AeBDietnfKduPD5zg8crXPRT9/XpWoAizNXnPZfc5YTOfb+lqd/pYZxXKnbN+hQwGqf
	yAmLsyzJRlYLpwN2oDhsqSb3qKS/6PFFBBnNc1PxVZA2YrpIhavANMmqqAq1AYYjJINdNasusNP
	UvMMVX5qv51L+frV2eyc70E147ZaHn6Dm/BFSPuioriBNBktdY6DXGB3RBx4Lu/pj7IgdtVZs5R
	pnvY5kXzCK1ayaTKXg9Mj1nl5aNNp3Fb0M7ylvekooKEokN6aEV7PtICDAFLNY5yaVqk8HHt3xW
	N6VgjHA5J+YCFG3NJZxWA3cawKgI4JbUOrbId5Qu2oXvajITfnzPUYWjRAu0mVht08rxhEcyblc
	Hgk0VPCvdgeLAIVYoopgX1cmPYs3yXiRh30du6ErfuFWhr5Osv73JYzDKpf0XiDM4l6Y/AV8yva
	jN5T/WmKTAaGGZcC5eihjD69Ob+UBTtUnl7X3szxHw8zg5
X-Received: by 2002:a05:7300:2393:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-2e483d82ddbmr21223138eec.24.1777134718278;
        Sat, 25 Apr 2026 09:31:58 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:58 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v6 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Sat, 25 Apr 2026 09:31:44 -0700
Message-ID: <20260425163145.8474-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0

