Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D98299A87
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 05:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094061; cv=none; b=OUdbKigt/Fn7auzIdHsqWugD/dQ0n2KVfs/out+44gnEe2PCEpNOdx3+UsOOus3AvWV24dIpcmHzBOVCilu13+EuoLManSLwSeoIuQR/8QfP5ByknzT2OfShOikwJxOBJqUS8Ozozrf8wBTsWFXa7PLKohbo0swnK49QcCI31qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094061; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5eYWmYpU/lKIyGDCcENqs6Lzj94lcBblBSzocys3XWWysgZQSuPHUG0Ddk7B7PWb7EZG5CZ37VIapblJ7PZYwr6bWRHkGUMcjz4eHmkVHErdTY4iOx1LXG9wjCiDtC1vWxM0+wcF4sxtIbHVkGMCJdpMhyRQHvKqaMgV6fQ+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE0tNSjI; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE0tNSjI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2dee127b3c5so12276294eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094059; x=1777698859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=bE0tNSjIQLjK1jV8fqg0eFzXobNvnWukshZl0P2CgeIyKQw0p/pFWMx1EGztGbcZWj
         TIIzm9yUdYxWC5y2YEXtvOcJNzFT3pblMeVPdbcI4vgTOewuMS5oRLiy0dBi031Jgfb7
         lVaPDd0t5BD25OKsxcvbCEfshlLnQrQCU6mZD08bDKvLPk2X6/J21gogQfQk6oG7gCCg
         1Tichz2/rSdIGLz0RYVUmdPncSubhAtj0TCoE0SBxGnt1UwldiEKcNkZhQor04Ja2KQN
         0Izx1KgNePPFemfZHZYY8a24RTQAxuNm8odZBAwhao/Tr0JhxZj5D2cW7RLed3j8fQYq
         sP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094059; x=1777698859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=bttyo2CvIZvsRAumqkSrdVdOcoBiww1/uhIuLbwcUx5JI+FlTb9eX4rVDIMKejM30W
         eDiEtF4/sm452GpdPml2luUxh5U9/+Pz8/D28ARdImODqNJ6CHtBhFX1XKezfSClgvpi
         rnrWBKMUB1NpTzpplqcWFyru2aZxAm1nXByRySGCJXI//PzkwoKhzrUoiCVh1eZBX2p4
         rvaq/xfSDECGLRn5gYlu+GBNAsMoXrDbrSuZQYqKwCpm4U43PsiW4smWeYRuTB/rDKP+
         VQ3TAZxHQR8Rxg8pxPEP/4s4DphU6XM+80vHgYfW8UXqDEM15i/4hw5fCrYkUoKK95+v
         S7TA==
X-Forwarded-Encrypted: i=1; AFNElJ9qN6UKywS6skDWzvGxqKT8QKO/PPE7ONWCwdXh/3F8czPq1Q52caLItK0cfd3l54RHK8B27Io6QeB44Y+ECLvuYakm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdd0bgpC3armfIEIMHw8msEnj/OxMa15b2NeFEO/Eiclly7u7J
	FJqExdWgSfBwi6oWJonch1VatToWyqgozimBJ36wvpR7E3zsgcX/gA4A
X-Gm-Gg: AeBDievQ0UixocSNN/KAgQScYjLb5KjfuqzawUfyMXMZ33luipmdELl/qxS/AdUCD20
	uRoZdOk+LVVMVFtVMRE91u8ozn21fvZXkYo3i6JEmBS2kG59gW2lPQNIQHnl81jrad5WNsOKWqG
	qKUv2KK+dB9lYo2zhBEhwUQnhA3JhpOcbLy6R4Ud+XzVAWADQ+etTPVxwSBsNX7ChaOXg4BDjR2
	NKowM27vdsIVh9cI55dEeWT58KA5jZfWiCKx8o3G/9c6/m7ArNxGuNfdKWI09J8GjVCg8OZLAFH
	ng+4aS7r3XlvDp3/hobPlcnoU38gIbmniv7Uxvwv+DONQGCS047roQNPuCGMFY3iKiCpT83XRYe
	vK2DUjnJ+wcrbFoOvyqPtSqL1WHBU2D1aXL7L1IMkB9y6mmcxtbHF2nGFtkCUc16BShHjuAjPYH
	3of4aaoydFU4VywT9bzmOk7uc3TOy6Y5V1SA==
X-Received: by 2002:a05:7300:bc97:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2e4792151e8mr20448732eec.27.1777094058926;
        Fri, 24 Apr 2026 22:14:18 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:18 -0700 (PDT)
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
Subject: [PATCH v5 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri, 24 Apr 2026 22:13:41 -0700
Message-ID: <20260425051342.8960-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
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

