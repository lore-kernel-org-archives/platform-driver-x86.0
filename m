Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C1476682
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148088; cv=none; b=T1B7/cqZZq9xcdnw3yVGP+AZnIxtcFZKIMChkxa5pYixvoSCXYm5yCtQEenX6dhSSEErBBr7B+aS9hE7qEkX9l4a2tSouUrgCHODDvIjYM9Uu4d2eeGSAoCrh1u9GN0Y7jh/7gOTp0x7mDydHmLbt+K6GQbg1LI6BNpD1U1rnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148088; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBRZOeCabhPkoz0safBrvevaw/FDVCQrStaTOspv7tadHsI6/wKyANIGtUbytpoDVCpZR2abKOPcLseGff6iAqwRoGWwoa480KeNP6f6QHnOtLeDkA99OtZqQ1qTNCx/EgvVm+KuHQ8irpLFnkMzESnXp8lIlCWFcE9kGujV7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGwBHTpR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGwBHTpR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4957eefd361so8453525e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148084; x=1787752884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=aGwBHTpRkAl1g95/qIypJyRFejq/EnV4MnX5kJssY92jWQ49wjqpZ2MGbt1pRczR+a
         z5lKTaEfeQqpJlndkT5VkfGYujo41V6Tv7aWLcWhX17IQcSvcShtkvBmGBIbvu8tMZM3
         XF3gOeo4KWVBDpfGZFogfkXQtv94ouyJvAfaR7Fk5SA5zpYznrnY/3TCZozRG7U5Cjak
         xWc5WiSRlL/Z66gXMkfgw72Vod8s8253TvcWx88GGxVck2YKl+txqK/qPx69Fc6kerIx
         oTfuisG0MF1YQ5ZbmUP5n1ymmao5fNlBtUC8oysLHEO5WLM8N/whSC9G8c8ZLtd2VVwi
         /tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148084; x=1787752884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=YNfM3w7lKqhtyEruQzKgIP4XYYGj1uU6nMwrYuqsZh6SpkJ/2xx+K69puEq8lePpSn
         Q5Q/uS6MTqsSrRWUZ+H+/uAcrtXo1U3qpxZ+Dz3cV8tvwXa57VNKLL2HKl2ECoDvcgbj
         KdWzQFAcxYUUPhiU3W8tyr91IJCkDkXHFk6QW/u1kEAFhYOrqA/QqhlK2VeucpFlO2aD
         iYqUmeFEVaZuD5mEfRxMT5TGQrIb6Gg3ti58BGDpW191G4xVMENh076eNQ8qisllUrkJ
         wmsxIgSyODZqEhz9l3ujTvunAo6Mkk38WlbSS5zOnYvB9n9fyHqmaW+z/s/pufukAyjD
         AJKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/GOTi/Sm5LElDbqvpyHVTc7HgODX046wG4F4rHet5Q9jdU0jM2mJ1vjqamwNoFiAMYVIv9Hy1tg+V628l5CmUReui@vger.kernel.org
X-Gm-Message-State: AOJu0YxkdUU4gsXY1sRxp30f1YAqBAk6Nkq+ojNDcq5wPo5Vka1vZDJW
	LjxAeim/YqlvAohzmHxKUA81nhornsOh6N+TRCwVo2gLpx8CsckQ+D+w
X-Gm-Gg: AR+sD12k8XLnqMcnTkKDGToutzOLIhfAFpKuEHtyi0x0G6hbT0x1rdSu9s06kLgX0gv
	rPeGy1jeCRJQ+OyLIg+rzDJ7uNea9bX6HJzmwY4dVhYuh53hW8uzX7hDxqchMRs2VaelHGLs+Q7
	KnC9qP7HSGcozUHTbkpzuST1ML1zM6dR+Z26Ymu3559FETY53OJ+dENkoZADp+iC5jyZun75138
	8QMwl0JY1Js5XJYy/U2SJaphrucKGe2sus/MXgrVXg07qqBHeye0E+PKrGpuIk23JzbohhaZa4b
	OHlwMUYbFfHEejkWNib6qOKKk/J0Q3Gnk60daJCluvLkUmiVQaY45OthllNlHJ9hDpbPzWVy2wh
	QeTIRGS3xdXuoCCC3+a23+IKsb792s1CB1Vzh28+2WstSaL4lHd20/PsC6oJrOLdflFiigx//sm
	YbFvxafpocLDTd18rgoVlsbBOOlhC46F9O20pKx/Wv3097eocN7Vrp3YI=
X-Received: by 2002:a05:600c:8b06:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-499aa0dca0emr101822215e9.0.1787148084171;
        Wed, 19 Aug 2026 07:01:24 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:23 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Wed, 19 Aug 2026 16:01:06 +0200
Message-ID: <20260819140107.1329091-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
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

