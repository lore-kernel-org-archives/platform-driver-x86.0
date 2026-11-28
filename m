Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856807;
	b=AJCvxHcoTVx5JfU3i3VF8x56lqeHG/FVNIoG33/qt4ve1+Vxo//vYKfvyKSSmHOZvbM9
	 qOtUU/9MrdRaelzkMJ3Y+bsTnptIR41MElxYp1pl0UhoXc4pV1jhNia8Qq/GB78xSwXIj
	 0A7sykqoK/znnIlVFxe4FJsr1tZkiHgnCp2OkDZ5h8g++RYDyGq901VtSPuoFzsm/o/0a
	 WuGwN33lKn/7pHYbV2eCOszOh45qWFNLfzkFZIrfOTuVkoTCALLxm7qU9wJvhlLt3bqaW
	 f/+5+ypxrxQNYplDrMZp/qtYGrsLBFuPY0Z1XHRLDcoFacwnCvixSO8RXGGsv/3V0KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
	b=wjQYgv6d1M4bMdj5Otsm7uX87QH3B/KRLgfxS7v6h1s5dgSXrwIEdhfcfiDQLJkopom9
	 Jqp8gDDZ/P492UKiYJpkWKBsvG5M3XjsPF4ySfrzWRTxMdEkRXCZzbD5sjLAISfKK3Vd/
	 Gab2lQLzND9h8SnrOKZ6sI/HqhZd5VqepBjT3ba6h9v5xkByQH5VP6snYv55wgGGFHcmt
	 eWBHhcjvLZeF8/DT5YjYSIOV7t0O31kYiEZ7+cQX/ZVhWapSS/DhKM3dUr2K3qoP06Asf
	 /kpDTEisAWUuCEmy1tk/ol6VLRRI9sBDzD1SZQrjnocFJoZ1+sfKpcnMHrnN9ip0cqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPlTpPaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91F606A31F
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C91F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PPlTpPaP
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8631e07b756so4954450a34.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 01:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856806; cv=none;
        d=google.com; s=arc-20260327;
        b=lWGir/pvJFguCZkef41NL2qC24MVtG0k6mDe4sbA7eZx7jFZonfahYzvobHIGMTf4A
         L7Cs0cVbtyONo+iWSPj8Np/Pj6RQ/NCHDhJm970rMuiQEefilT4slDrhr07V7xOQWGAr
         bcpfHg+7br8PoGRTPokOLwyLLu74KPEXTvRPBZLXX819Au3xKf+Ws39y9TMmLcncuXst
         jZPizvnBqjRV4x1eAqUHgtAvkuQ/jVT6h6C1gUFUSZTGSW5SQWVYJ/ted8H9VPUAareE
         ZmaocmqCAy31bV/sotZoi4VN657SL/X+0OTWGZg5FaJTeQ8YLhNHfYnzg9qqRlDjzgB3
         VZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        fh=NW3j+Evk/K0HXylw4wOE1O+8LXY+HxD1joME8ahOXHg=;
        b=qBY0a6h9qAxHzJC5r1x0ahKPWfB2nWT8ZoDHD7qvxLBCP2Xk/Ty4qvXACDGB1vC9cx
         JMqb0XR8M9plpAxKU35NziT4feDW6A2Mz28kga6Tkld79RTKl9QoXwcJfxDHhoaEVGQL
         wGhjDWPPaOj5gCbPl0EExJtaghy0U5YbQjZ4iHU1goeaT2UtZ2xbjzeVioLmnkbad9bg
         0NHP/qttOjhSeFM6eubjM/ABM7+VMa4Q5taUqB8a/gl5dQeCnQFkeURw3Mo0EqI2EPJE
         6BNF3TXnwa3ACXeqBfu+tGxIeNAR59+qI4i2NSCbnyLsp9tgTPd7bhPhgFkctrUAO7sW
         aUCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856806; x=1796461606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        b=PPlTpPaPIWQu4tt1WtQw8yZH4PClFRL6Q0EIXxBXP/PoEA1bNulENZbewQmvvowmZu
         FCNMQ/Ykof91GkF6tPUVXAFZktN0evjnRGI+D8l2wS2t3Y1k9CZ1twtQUvoz6pgfsfFv
         0e7IaVT6Whoy1YrWxpcJ3t7C/sLYhF4yiyb1Ob0CGwJy5Ak3ekZirOPp97R2kfC7a3/0
         C0FNe0ILdtHQWA0tqc/2yPbDoyRGjuTGThUD8vI3DVEgw9OO2pOoOjsUBOg9xDPgC0mo
         56NkGa7nFdYF/lN5+BfvDfgwlm3hUrVSAeW+jBSMXKHjxrc8MB2Gajt2iN+1qze6NjmP
         KuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856806; x=1796461606;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WeNW7HHZDMNZjp9xO0wJKcxcyNfK2ZxIx4hcZ1YxgZE=;
        b=R+gGrLFT7rrNHonlRAezhADkGQoO0pi8iOJvm06IuqmGX7bf/zl7N5ejrdCGFAUYCA
         GTxMtupme/NWt5d4VLQqLohFTeu6Y3Ew1KFAHOHUlgeYxD35E+HYFBBFvPa82eNo1klz
         WREwnKfyaX1MXH51mCM5VAmd4WjDLJdFZkdFaeN5JunjN6+Qp6ct8tcBf4XA7wPNaWdY
         zCIkiGLdkuB9SjswmVyNi3TZ7us03OiujQEg1ti/YWS19uUi1RxBCrAzvSJ+NT3KujEL
         Cbu5NDPCZm4dcXqNYFa9/r/ynN86qTovefUZd0+J/I4pgJy1ewfaHIwY1fTnki52rctz
         i/Pg==
X-Forwarded-Encrypted: i=1; AL+hErFgDRSj3XGkas+7SGE59ijNsA9JqZcaB29NKWRa/Fp0qVfmE2tbiRLS62BjCG23bcpXI1X/GmJARtR5GPepba5bFJ8h@vger.kernel.org
X-Gm-Message-State: APuU4Z9yNPsWFEN2BHW/mEAnCvSQ69w/jXC5aPQer6BDykU3Y0zt+GGc
	PJp+TzsaHkOLuZldJUV8x2L3AgIbAs3LGCf0pAykxuO3I5HbES3Ok6x9nPipsRiZq5of+qdiEVT
	dp2mHgcYhhrrgGIlSxjxsgENEkl8l9fE=
X-Gm-Gg: AZFdTZfwVq+KJw6cg+wZVfFGVdOMBwWr7kmsHEJC2/OwOFiMD+4Us760ORko77Jewic
	muRIRw9GJjo/ev8f7YyMnIc3bl8mg08kFeXVPTl+MXYALOk5NQzgTX+FAtEwIkRCy2+Y6GyCumv
	J8qezjN6A0uxvmFHdZhjJtatx4bPSDqXbwlAQvWQI0ehvv14YBeOCzsY85eAGp2PBMLDE+euI44
	+vaZzaxox9fiDrGBbtysdrOBmvij7gu5q4dAYd7UR7wG9NYmqBkWzDgYh0AG9iZ4ZUSxl+V7IDs
	x+69NxI4tPQ5FRrp8DVD8PvzWwUy72gCFmrdsW2kq7COSLyJVxQPSu84mYd9Kl6xDn8dr1CIUEw
	6jPveNmY4+G6buy+8iDhDnYRY6MqDv0+uVdPHpxnEJxttM3yF1Wv/Cx6V0cKh2XFb59Y=
X-Received: by 2002:a05:6809:2c1:20b0:57e:99f8:c5b with SMTP id
 5614622812f47-57e99f80ec2mr2430299b6e.56.1795856806161; Sat, 28 Nov 2026
 01:06:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:44 -0500
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 28 Nov 2026 04:06:44 -0500
X-Gm-Features: Aa3M54oGKOOmytkNW16rQjprz1_eWE6_MIuouxfbjdbj4pE_sQlnY9HzJlzXKtY
Message-ID: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
Subject: [PATCH v2 0/2] platform: arm64: huawei-gaokun-ec: Fix short transfers
 and PAN ACK masks
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

These two fixes address short I2C transfers and PAN ACK mask
construction in the Huawei MateBook E Go EC driver.

Changes in v2:
- Patch 1 is unchanged.
- Patch 2 validates against the two physical connectors, as suggested
  by Pengyu Luo. The no-port-update sentinel still sends a zero mask.

An I2C stub and UBSan verified the empty ACK, both valid masks,
rejection of invalid indices without an I2C transfer, and short
transfer handling. The series builds as an arm64 Image and EC module.

OpenAI Codex assisted with source inspection, regression testing and
drafting.

Lee Youngjoon (2):
  platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
  platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index

 drivers/platform/arm64/huawei-gaokun-ec.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
-- 
2.53.0
