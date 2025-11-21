Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CEB2727EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747496; cv=none; b=O4/R6+KN49WE91aL7RcfGaMIlJtB0RENDhjOyEMtuyWLN4SaqULw2GnU5cjVJU/WBHi7cm7a2caMtceF4SJYEM7x/Z2kQ78cyfRcvELnozILa/gX8Ky2l81DSIMG2e/pp2Go4hhmPHK8bLKXX9HVQrTBHUegNm6xyedRhK8xUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747496; c=relaxed/simple;
	bh=tkbPbY8uakB6fsy2RXg9ChOusKC20LdTkQT6Sc2kmnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSceoRjymI+6zGe04SPlyMKyySjhlHOMj0ABrHRE/c2db8blmmZCCRutrb2JtDLyhiFiXzgbzUdHDlm8PTltoqkzCJ9PX53+67yLAq5+hz6lPpeGTZdterfvSlhYx7XxvBEW7iQWSP9/sFru4j/eQnXbb1Ze4XDXN7CTHcf88SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+fczqxD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+fczqxD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47789cd2083so14345075e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 09:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763747493; x=1764352293; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3CcdV2cI8xxYpToB4V2hdBRf/2FV4zYAby5bxmP7DA=;
        b=w+fczqxDgATMUvy0zlsOHw3dF6oqs7pkfiHwXmBChFO+uC1tOeEpgc8oijkbxFJu9h
         AH9wtNM5ikay8fQYcfTSvOcngel7ZH7Sp5G82y6I0+Jiqajy32/RWjcd51p0OOj92kgM
         56DNt8968p0II5ehpRNIHNzb2Ov89wXLhTX679wjCyaEBx6GHfSzzDLdmWnkfhlTVjIr
         YCUybgWEo8asX30RF3xZOtWLXu8kop2rGk16S/zjYqyPo/W6/c4s9QPV85mwByGqxLsg
         c9FI8TAcYeIZRPherSss+Nb00a2gbmfMp62biMRIpBQE9EsQFpovHpC2nARiz2u8V0U2
         NTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747493; x=1764352293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3CcdV2cI8xxYpToB4V2hdBRf/2FV4zYAby5bxmP7DA=;
        b=ZB3Ifv3NPGQofkD9jZFgboD49jiS7J+Ayv9CxVk+8NIbo7dhu1yR1+rKGFVlt7DKtT
         1c3y46wzB4PdkCS4sXpsu7xBZIYuSz++qR6kSzvxvF1U8JtFkbcFy2PdoDqoW7DatkNd
         xbGFMENtxj5Qu8uFyq826eUCh9U91+E++bNnarAoX1KR4am3QZDw5vr/rqJJIls+oEOq
         0FsD+QciByPe7mqjZs4zEQrvUs5Xv1ElxcOia5iFMS9xxcbOUO+J/LLUulffgZV/bhgE
         Ap51jvPS1XpkmmiuakAPXYK91aPwCUKI+iu+HDJ08vzVfX+joCb2UlxTI1Hdp1br2fSI
         gdtw==
X-Forwarded-Encrypted: i=1; AJvYcCVzMyV3QCr0ErfBx/MkNzshKSES4KjEOUwlb+ODyMmrmJxn9/EoiQ6X3hYC0vsnuk2KNxG5k5OPX8JQ1uGwSHhqCdVp@vger.kernel.org
X-Gm-Message-State: AOJu0YxK0l9nNFxZyBpeAXrpIcqdOZdAueKXob3Jvu0FAqFvDAM4YzD1
	uE0GlcENlsQIFik5zdd002Gg/2rcF4qo4ll1PSPODCEe5/cBxQjSTciX9I0siPCoMu8=
X-Gm-Gg: ASbGnctmJWnZEO5r9yvOrqdtlcsIiKR/ZsVLg3ixA2IIGeyK+UUdZ2bTycUc1fl+Plj
	mzj+RzfX9G5J+l0KB4SVVct0zAkmM54fEiuFBjyP5hSyMnODgTFVmOagtRe89EDdetMXy26fTAb
	8RPqs77SAGy5mjgQR1uVnuAAzdO58M536Lt2w2cEPFtGLbOtuMSE1HL/vem2TS6pAAgsEHpCl6r
	9MW1IUbCHvC3HchSzqHNs4xe/UORHbJplf6Kik00FXDlrYOcBCefxBVNeSKrNXbiFnIvDHOGw34
	7ovYI5Gqh8kkN8gCgGjD3BU/SQNErBbOed3VY6+FfRJ31EVjfn/EEvEXks1JHhXsTuKpcHp45k7
	DxfP8ZPlNmuznouoj9kZS5rE9GF63ovCsY4yomYDH05dwWZPb8n/MRmTBPYPSFfr/odeqjjapRt
	gthh7EWENmG4MEFS48
X-Google-Smtp-Source: AGHT+IEkP7ShvssAtJw3GIKUaDnS4wUlsHaolDFR4OmugDcfe0FejBfxj+tozg7UBadoj0h8fnC5cA==
X-Received: by 2002:a05:600c:1547:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-477c114307emr35210975e9.16.1763747493071;
        Fri, 21 Nov 2025 09:51:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e574sm12264676f8f.3.2025.11.21.09.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:51:32 -0800 (PST)
Date: Fri, 21 Nov 2025 20:51:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] platform/x86: intel: punit_ipc: fix memory corruption
Message-ID: <aSCmoBipSQ_tlD-D@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This passes the address of the pointer "&punit_ipcdev" when the intent
was to pass the pointer itself "punit_ipcdev" (without the ampersand).
This means that the:

	complete(&ipcdev->cmd_complete);

in intel_punit_ioc() will write to a wrong memory address corrupting it.

Fixes: fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Correct and reword the commit message

 drivers/platform/x86/intel/punit_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index bafac8aa2baf..14513010daad 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -250,7 +250,7 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 	} else {
 		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
 				       IRQF_NO_SUSPEND, "intel_punit_ipc",
-				       &punit_ipcdev);
+				       punit_ipcdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
 			return ret;
-- 
2.51.0

