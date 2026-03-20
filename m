Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23F41C62
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965408; cv=none; b=Vv5LrIg3+H9k8P9gGxt8ifK0+9oYTWBPR2V60wVSJOQ14LglZkhIOAftmrV9kTVG+i3Y1Mz5qGZwYjjp2e4dhdDeKY6fQFFH1++uhvI412jv/DAS7fzNe5sL9lYqpRa1dlq9UO+gYrAmQjRugRS1QAqvlxXBUbkR57enOIIS6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965408; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKH/98ffRpU8yY6IBKViJsn/yew+Ej38SQqlSYv3KJElHBQ6uTrrJlxIpPm2foDwEQwK5cOs+L//620FtGUVmtVZ6H3JP+ohmtI3VX2AhXJ4pYUdfrZZddcd/CUFWY3XqO05AdVcxzbeA7uIcKspTuFtNXzWu2KkCHuKMvZ6ZZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNFa2KsA; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNFa2KsA"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128e4d0cc48so109769c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965405; x=1774570205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=PNFa2KsAuefw4vdeT0WGKNfO0QhJXFSjEvelmrVPgiCXb9ZTX7ZMvYF0hqiQpLmjXA
         kdH3VO7+cfrMpkvlFvt0qdtNitwvaFxPKV7igMbsb+mTO9dnrAK/mL9jcqmlnWLo4SIx
         6iYRQSxj6E1r9NT5uCPseuemLWO+zF4lYQqBLHMAXUaVI73C8fFjVkVc0oBt5p+k8ae3
         pan9EPvbZ62U9d0iygUeYdmg5Ee2pcHaAUQECB4AMwB9Zzu2oiQ/X3FsB2x56vffLedE
         AGkEEjLU8Zq0VGIqmy9UzzGOhJWWLKTe6p9gHPNkoJFRGCKvHsAZ15iinRKBRpMmHdzD
         2Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965405; x=1774570205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=MQugvi9fk6SNuqio1vRZUQPJBTNuZUK2npoQm0p4V4huyBm71YQrRSDjS3Fdbzq1Gb
         wT0wvakaSS5UiFdVqWRQUikGBBvTLZLFPprOU8SzkUZFvfZ3dZReYsr5H+KfjGglG4pm
         LN1JdFp9jC/kW35NzuLtVE3OuXuMAbR2DRMwmTIL3++jCMDrI/dQAOCCj30dqOCLCtlJ
         EU3Bu3eU9I9wfSswC4CCfHdCH5RluOm7LkEsKCHZTCki+1GguFOH50tf/k8/g0U0FtwO
         kFOquYZFHRoTt54jvgRH5fQNgDAT9lwcpAo+ZcH50TbaUMtyc02ttfxbwDr8aEJdzaQy
         3QTw==
X-Forwarded-Encrypted: i=1; AJvYcCWpmeYn0Z50dJNCXk9vAsqkC7D/mnPXGVPzzByKnJg+ShPCzF9MjQLPixcjp6LRTZnhnahIu78hKYMwYRbgJPQf3qa8@vger.kernel.org
X-Gm-Message-State: AOJu0YymITPudBJe1xFSvVncYZ8RKF34p1HuYYzod1ClyvFVaccUoYJB
	/PzlP3nLadFAsUzD8cfjEkyxOd/JP/ZRLKHyMvX1hwXqQV6izZY+XDFp
X-Gm-Gg: ATEYQzxGfmR37sJysVwIkeGD6tz607x2RPEUut9HX0AhFYwG4gZMx6Lv+IJU2nEf8Gp
	v+X2mPNHJII5TE3wS5o+Oa6oBnoukQuxB4rCnIBO9AjaOmNYDu10AEvO27AG7/Z9KIaeLOLboCB
	is4MTzHm2XgQIBq3pqar4CaQpTOc9L8xQVrRlwhaoZPufqtbv5N5xQQXLIGUFmXyjHO0h5wq32W
	hnX09ylxCGDVhZlmKheMBWwdlhn+gQbUF3eGDaUZHQ+Fp8RD1zuzakjivzP6PB49VAChNU1jV8N
	WGHBEeuDIzHmg5PzsITWhIwSTI5ytNEz5nNRcFs1elk7IPufbMpyU3pPYLXbVYE703mjlrTT3V1
	3ydY2CMoXhSbiBCZNGkOZvcn7HE7CCfRgUZXu7Y2i/NI6j6EJnv/oMEZ/r2F/ncIDKF6fe1YYp/
	4N/JJs0oe1AgeH4XtVyiZr0dCtdB3gTbQE
X-Received: by 2002:a05:7022:2216:b0:128:cf70:9042 with SMTP id a92af1059eb24-12a72691fdbmr635944c88.18.1773965404564;
        Thu, 19 Mar 2026 17:10:04 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:10:04 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Thu, 19 Mar 2026 17:09:32 -0700
Message-ID: <20260320000937.9177-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
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

