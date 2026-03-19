Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428D2874E3
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888988; cv=none; b=j7NLOInAEGmJpq0fCzGd8mL5Z9ClLzX5ncUaoO+uLnXKsbRz25F/D/tp6AvoDQfM0UQwcy+v8OJInGEzGQr97NvRaWPS+iEH/ofLLLJAutToSKKG/3fV56MacFnWt5ULX+TcDMALV9/q0TH8QoMYJi4TBWY1iyXwYtt0o1nPR6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888988; c=relaxed/simple;
	bh=KMrCVoD5LrnOn5zkEXVr2yMChkZ1B/BYXUxvNYVU10c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nw4RjVlsDuVxEIYS73S7msaW53RRFCWU+rSHs0OK7C0O9kqiLBnEi4aXRP8ozFZj45iNFC19h0guIGib9Vvnll6CgfbJpJkCEMtNGWXBDOZdvSHtsWcOmOsp2rden9Lk8olsC56SHr5w6dc72AK5mhjmH2ZvesuvwuBATJ+OIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnlquoWI; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnlquoWI"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12776bebe9fso237888c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888985; x=1774493785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFQ/cIHAPkT6GWASuSfr6W9xPQcgCwF/USNF67U5DTE=;
        b=BnlquoWI/JyjHwadJP8YghI+9KTROZM0bpW+DMxlNKbL4od9nACbySrq49YcF/VH8x
         wsS3XUM8BX0uCITrMbh+34hLg7L4DpUdDXregSJevaEKF2QV0Bwsz6NX08WhsbiqFP5e
         zWEl6tJNBT82deGI0BJfT3HSbhmk6nD7dG60mEOYQiFsTe+mVsyXLNhgh70mqtjRZTr8
         6iLfBW5LWNYlRkaPzIP/WbUOdUA360oeOMeeMUxpYsTTL3x+99VeHbxvGsc9OPEiZGXb
         sdVUR04XK76I4SkmEeHSu9wItqpilosdO0Id72Dbe3w5WNj0lUYrxy6FrK6FgRDLNQY/
         cRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888985; x=1774493785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFQ/cIHAPkT6GWASuSfr6W9xPQcgCwF/USNF67U5DTE=;
        b=HVnVcr73spKc9WKOV3+3nHRRMh9fX/6yvnZdJZGmtx9Chgx0IuXRkGUzoCaLA/xsKk
         6pesyKyAoCKJvr1nja+7g1k+n+ggPlJaxmEVdZh+1oRP8itgTrgpZ9ecdTC6IU2Q9xem
         Y/jXaybVOCbYF7Wyn+RAwb+96HKH11hQ82AVJ8u7jYLY8VnKgldLaA9Buf5omi6UOj8h
         UAriYtuDZ2H6Jem6thnhSk5rYu9blD6bhgSTFKKtGSxcPj8gFWreKZotXRJs8GJYRzIb
         daUoh0b5kJs8CeqIzLhSXPcVodUmOHECyIchDSSxN6sYHs3rrcHA04jzm+OBrHt2ZguO
         8Vnw==
X-Forwarded-Encrypted: i=1; AJvYcCVdl4Kk/HXpPlavsM1/0dhDohRxCnVtDqOizC0qDXM4isn0/TBc/KMM4/LghCQV28gS78pMsQuyT74gADRB0s7079Za@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpCtfIRoNMnRyDv2gkPC3kiaT0FypJV+nI0VK48SvdI5pFaYH
	nsi5wA2HV4veCUsW5ykOR2ZEWeFNTKkIUzpH41Bng5lf3HGzP7zYP4sv
X-Gm-Gg: ATEYQzwBLBtU/sNhRPwNmKMAyoXzoN06dK53ojm2AxRz/3H7Kfcb2BNLZDUSZQOp1iv
	Rpw/dLGikB/rMYHbDoryg2ziOnfEytcac6ifzk94BV7oAJ0fhRwvM6qMeAPj3nhOmCnX19tqosd
	UZ34SpagBE/lJxzpNeR9h5zNh/b14d3iVTUEA0q5OZrs5p5IPvQIDMd7y/FNo25PvGQJ57t++xL
	aH1sfLXRsbiY0LjovjNossxtVuHBR+HXfSwt985m7p2vuvePfW19V8r28+D7X4inmzStJxX7MsZ
	Mv3PHHGKiKDsYA6gI93VAg15LipeVRwAtq1RcQexfy5+H7hA35mP165Ghtqtdk5AKvkdOR1ptG7
	3fvqIzCUCXIqmXC2yFlMDJ1tK4hs56OsgQK32EsqI7bBDlhQq6PPcEbE2A2NH/iMU/9C20NxAYB
	qVGeFsvuKnsg5DAm6czpomSYpcZ3Xl7jzJK1a2PSoTZGpJMnNxFl+uol6Kv9kfIIKFeNvOLaEkS
	6yS/x2Gw6GCFg==
X-Received: by 2002:a05:7022:226:b0:119:e569:f277 with SMTP id a92af1059eb24-129a718fa4bmr2987156c88.32.1773888985184;
        Wed, 18 Mar 2026 19:56:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] barco-p50-gpio: normalize return value of "get" and
 convert to guard()
Date: Wed, 18 Mar 2026 19:56:16 -0700
Message-Id: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBlu2kC/x3MTQqDMBBA4avIrDslVSKlq1K66Q36Q5FpHGOkZ
 kIiRRDv3uDyW7y3QOLoOMGpWCDyzyUnPqPcFWB68pbRtdlQqrJW1eGIH4pGMGiFNjjBxBMaXau
 WmHRVMeQwRO7cvE1f7+wuyohTH5m2FT0fvpmv8+Xum9vA49mK2C/vjYywrn+Y4BpWkgAAAA==
X-Change-ID: 20260318-barco-p50-gpio-set-c560daea533e
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826

These 2 patches fixes a regression in the driver arising from gpiolib
tightening its API, and converts it to guard() notation when taking a
mutex to simplify the code flow.

v2:

- added reviiewed-by and fixes trailers
- added new patch using guard()

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      platform/x86: barco-p50-gpio: normalize return value of gpio_get
      platform/x86: barco-p50-gpio: convert to guard() notation

 drivers/platform/x86/barco-p50-gpio.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260318-barco-p50-gpio-set-c560daea533e

Thanks.

-- 
Dmitry

