Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221376;
	b=pmpaEcsSyloWRMSaKrbTTOQplZLjhPyNMzYcK9wR81WMx/Gliax3lKImfEpkGMxFLhzM
	 0ANHybyXGbSD4NQGdxGyyUpXEBik2v0Ch+WI6vopDqi4uRhdZ+ElmSqkC1gex72k7/O/E
	 dfIoguM6nt8iUFBZuV/xj26sr3klc2erxbReIPAH97AydU6fmSVM4AOEpN23o90nYZXpi
	 6OyNmeiIpQPQwlN2IWiWySsI9QYqaVrUGS1nhN/yHuZ71i4hJhoTuYTOYlA0cKnnlvlwC
	 Q+/6puITGoQvM5NLSyEtPMuVAMqIsabowy4lS+0ilWHl2Q1f+OCBOz+/7qfsxT4kUug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
	b=g5ZDIXcz49aSRgXBCpk0H9MS6nZkTPFxQW8tEGt0MgV2Jrornu7HWj7RdjpFAU8M/htU
	 RRES5r99nbJFK2aSy5u8PfZs+z3YLiz9U2YKGGXrB6qH/TUkzIlX6iFpIlrQGQbnwdPQb
	 /OSZkAnyJoVLK6GF2rSJZwaOFTTw0hHsQkxnQ2RgZOcSz7tbD8M8YXJVxYPfOpqsRABSB
	 r/0JZb/BHFTBKTm8IG1PTkmoy6wm7TuDNXKi5lzLDmxRPTCUpqTP0nTHRkB6pxBsy+JB+
	 ljJHLHaUaE/HsFwPbvyFfjM92kXrGNo/87z/dtmkPHtTVmjQTkakdzcRWrtDFSmLrDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA6606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea138a3497so4111645ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221376; x=1794826176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=mhuvuvXX0rIaEIqZ3DzR1FBgAu21NuHPq7Q31T7dFQOqeblaWlH9D1o+q9ykUC+Z6D
         sfTUBtHFNuNKu/0W97XuHP23fA2bJkNE9yggNCNrR1M/vXLFuLRK/l+/fLLmYYPLiXSA
         d0xl8e8ZMlhvge/faXWUC8mqUhtRzeYCOJCc2xWMPAB5WHlH3Q9NzA6xDRWOgNpKRjds
         FZQXe5ciiNXD5CJBbKjeX9XJoKsKHtdSV3RKYWgG5adtQEhRNTl276P2PJ99JamMM5d8
         iHn8Z+3fmQOdLTzBDWrPh62ezoPUQumOtOcgdtc9VgPTxHf/U+cbZhNGnkiuuSsrDckI
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221376; x=1794826176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=s6HN5WgA7s/hVUrB+ggDI4STnUK1IH2O7jiMicSCSUXEgtLLA0TZpzkPrKnKE4dkBQ
         1b7ZCEOG3/i6TLW8fcGoFOXYNj65la5O5WEeyqL16BB1jvTX8/38W4CtD8WhddmarANh
         wTC2GdLO5W6286709vHjzM5FGVINqLvGe7Tn1G4Hzerqpd1Wd4ukIoRWDVUHQRI1B6sj
         GWUTUIazxxAOxShdXW90iyg+XEEdnatb787GZsRGIgOJwYBrSqw/8CwuCiOJP9CHNsmy
         oMa4Gd+T0zpJGVl9z5vNS+px/UYtDlMDVExt1HHz6MEoRv29nHg07+PIZXNRmFOxB3/2
         8rIQ==
X-Forwarded-Encrypted: i=1; AL+hErEC5+SJxGpnjkDSTWlPkVnFq1sOezr2pGv6lmLO3p7L1UYhcEoPUiVMreXpNGg6RxfdZ7g55Eb1oYdhq4c+QNmvxY0b@vger.kernel.org
X-Gm-Message-State: APuU4Z8ewhXeYbkZI04JDCTEhMBpmnPdUlqSjs2OFuo/n1RnzYGCfHFs
	Ba8Otca7CvFBDPzS0ezGvN9quMLnFbKXOGMfRC9tqk75nlb3/EEFDkRm
X-Gm-Gg: AYBFou1rfuG9yJuJHBpaHpcnj1N3WEE0EU4iy/OIabopnklDAkV0As2i5Zoj4+DqZgW
	n82dJwVi3CSeTOB2qQnekaSqL697vT1YFJd/ChNzbJWIxjO1MRvy4ks6ig8+ZojfAXCWUDGml2J
	T++yRJy+c9pto9Qoz0WZDBc2CfEtxCZmZ85WFu4bvz5pxBGaynqPoh9GaErb3//nXqnGAVqIE1q
	ozvOKItxIFvEujArz4V7DFZpMDqoOD8c+TNn+AENGc5YbFkN+Nd1nRRTaxmJtj0KjHXE7gAbvj3
	Bhx8wicToFVTGdsBgg4Qglik40nSnzbfovBvzWsjBKaCbe6qZ8OKFosQRR78RaEbCkPKzojATQw
	i9AZlh4dl/SfTE9ClL9dnh1RQtJDgtSnsLom/5oxVy6Fz5/IYOqwGl6/UXnrkVF/SabUDu9Z0JW
	wMcgtjZsQxQHtVPpZSLbePBTJCDJ5jkZ4GtEXtawo40vzcXY8V9u46nIVocki6dlcGBOMb5dReW
	iAoDztPnk5uFH7BpbMts7pttgmKZK6XPWZf7TFIwuWciq010APVlDB8I6dszzUTHQs3oPJQie9Y
	IcK86Bay3wiotrLltMrus9cFqws40CbwkghXZCv5LtercERjjuCn1zntuKMmMZAbuwtD7bG8UY2
	//6rmkxw8Xzzb/aMY7jILanuele6bzHIgKHskzy3i26/LiVpdpmiTBzjhOubRLBAabAM=
X-Received: by 2002:a17:902:d588:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2ed8375ffaamr41615415ad.19.1794221375807;
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform: arm64: HP OmniBook 5 16 embedded controller
Date: Mon,  9 Nov 2026 16:19:12 +0530
Message-ID: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a binding and a driver for the embedded controller of
the HP OmniBook 5 Laptop 16-bf1xxx, a laptop with the Snapdragon X2
Plus/Elite SoC.

The EC sits on I2C at 0x76 and takes commands through a mailbox. Its
protocol and its command and event codes follow HP's ACPI methods on
this laptop. The driver exposes the fan speed and four thermistors
through hwmon (the thermistors can also serve as thermal sensors for
skin temperature zones), the mute and mic mute LEDs, the keyboard
backlight timeout and level, and the F9 and F11 hotkeys, which only the
EC reports.

The board device tree that uses this binding will follow in a separate
series to the Qualcomm maintainers.

Testing: the driver has run on the laptop since late September, on
Qualcomm's qcom-next (7.3, latest qcom-next-7.3-20261031). On
next-20261105 the series builds with W=1 and passes dt_binding_check.

Rahul Pon (2):
  dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
  platform: arm64: Add HP OmniBook 5 16 embedded controller driver

 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           |  49 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.53.0

