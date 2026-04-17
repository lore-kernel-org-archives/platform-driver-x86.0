Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD1835AC1C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443591; cv=none; b=qH8541daMswQzIBc8R4SdAfY8cO20CFe3qDnqAdsw9UqhY8hlRSF8fgd5Gz6dcR5d5uG6YdtEcdcCzn878VXHUeae/bwVb9YQefZh6g6TxoVbhf0tqPaK/UsD6nPawi44okTSpJgxcA58oafTpC9lum6p6kXKEKhiJdlM8CTExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443591; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UE43K6z9ChnM26Q9MlizhzgbdRt+wmb2FYzw3JTsrlz7N+mH/hUGTcMJF/6jzr3IASTiVM5bn3BSpOl0r2Gb+s4C3hf8MqJTPItB2EM7saEkzCaCLQA9/cGROfw5BpfHBEk3q+NkXwfq67dsk402mTsN3KWbXOYrAENxKk3MdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDh9BjCn; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDh9BjCn"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c565dd3a7so1315270c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443588; x=1777048388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=mDh9BjCnf/w8BO1+JMrGkCDkZ783BuUbJzd8HDRs/jzlYQUsJZyesnoVJBgXU1hp+O
         j+LFV9+ajZspvucMIXFpz171eqU1Ugn1kDTE+7JyPceUttSAvwa3vh59eq5y54Vjx/2C
         6O+bL1vPGg4bBWNK8Bwtmpzsi1EssJJMadn9O58UNuIegM3m7mJrf3qOR0vgMM7nI6Uy
         7vxOjrYOMO+dOPyJv11FFdcmldNvIjEMoGlbrNgeVTX+vW3V552nLOyRddlLYmYKnjHo
         mzPYUu5LV4l8JAdLVgqvlQ6Wocc0uRyovHPo5VwcUGghBuvlF+QUeg3Ky8vkRka5oOlx
         CODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443588; x=1777048388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=MbWBGHSq9EJxXj3YhJy6aUKZkp3QK5DW47zdypmzYIAbItEAxy3ePha+PZfYOMw0/j
         NuUBvZfOXEKc89msp3DS5NA+V1KGfyOGcV2kuKTJp85F1at+DOgMZH1o8F5MeB/LAzAm
         DQc2kAr33w+EznbyY5Z0d2sd4aVGz2jTdRnoTv4wRc3mE+7yU5JE/CMRrHBtJ/apMhTv
         G696Sxeqh2q5CRnBqEtCzQ12/Svif5DQBrAQ9kSQ2Ou83dx93+0MxnuNb4GQwCPsLgBA
         BhJvre6mIiTTO7UA20tsg5oJqPLqMGNvEobZeBSK2O2saWcV+B9Y7e8D3PoEKd96LEUF
         NMpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dsD7eif1K33wMLdqOTJueh75A5fVCKfL269N4iV1SmsJ4VDOhS8jh2/Jrtx+rLwltewplk0dGZgGDW0CQ7BWrbTTg@vger.kernel.org
X-Gm-Message-State: AOJu0YxYn/KiTUg66gSwHcseYSZ31bHjj8dozcFXMZY/EPZpSe+fyUYE
	7J02NmLoHI36shqYlJe12YyDdY4ITyPPoTiAI97yix2T9CCTI8ATNzbM
X-Gm-Gg: AeBDietEbU+RyGan1xJf+AuUFe0fqnXqjnAabyFX9zof3SSRBiVt5nPaaWxOsYP15A/
	sBFXTqf3bHbKDEc/PkEvwzhTQxvNpEcQVuK4+b3Yu4BXhzv6q8sVbzt20uVpZG1yVyItUP5TVu9
	sKRd4W/FZiYdVwE3LE4EtVn4Xpaw7lBhOfzIkDhOhebepPL7/baeHDDJfN+TLvWxPXYrYTuZEl+
	njtXGZV/AvLSdovKU0Upnd0g+Gch7faFhzPQHxiuO0Gedo/OLGjnloessacMnUyFBI9caW+UEqS
	shwgJ3B9Yd1x5aoYVjQRWtm2muKFTXSLjT8y3zridfK4i8svAt/hP6Am9g/ZOTws04UN5pAkTCz
	eIb2FO9lgud/NudSgVFMZpu7E1Xipy424fYv3lu6pfQ8XWf57wtZVTq5UpzBpvZ1EbvIVUuOMLi
	TcZyrJo4qTjJZr2kTwCnSffrPydhFS8S9MM1DI4Rgn2RrEwaBxb1kj+Md6L58AlZ+GccZJZQ==
X-Received: by 2002:a05:7022:eac8:b0:12c:2f8b:4c4d with SMTP id a92af1059eb24-12c73f7cbabmr2017351c88.15.1776443588111;
        Fri, 17 Apr 2026 09:33:08 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:07 -0700 (PDT)
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
Subject: [PATCH v3 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri, 17 Apr 2026 09:32:51 -0700
Message-ID: <20260417163252.15603-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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

