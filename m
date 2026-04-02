Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19B359A7B
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100270; cv=none; b=afiQjafrv9FzDV03NHwObrHn/Sabr2v3SRS3NxgucYrCiTozG8VjZokucuRZLM4HiClYft+FdT5szpXJbTh/YNYs0qM/JjYps6f41z0hjsuIq3HRBHseAdhidRMwiCELIkc/eY1/sbrqCycp5TQ5oR5IoEZbMqLh8KrBUTqKclM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100270; c=relaxed/simple;
	bh=xoAxyd23RUHtYfq932MDE3PcTF7vl72cZnWGDgo18cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgIXcX2fYfvJaqmX6p4gu18f8H+6CuN6r/LxgjXYQDmekdMtLcdnem2iUCw2e4FKAv1sp6K9XguhyUn6OVuMLtuvqmCZbXqg07usH5V2yyaSxv4qk06z9c2ynDkwewBtMNP4ohBHO171o4D55YQ24/fNACCPDed+BiqDi/LdeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJNVdau+; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJNVdau+"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c88992d77dso843139eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100268; x=1775705068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lNuuLOzmr03xq4m1O8HQgZGp2bHbRJpd3HGUaao6ag=;
        b=JJNVdau+RMHXLBNoH8a91Zz51IwaIMqy1HBvhcsaDi1TwTREuROK3cMTAXSMcgHHS+
         B01dkgpVIpCyxFHFaHmd5igJAYqxNSK2iVYAtV1nuQCbO/WwAJ8xHKizVGBQPJudOsPh
         a40bEeEEueyekxgzUaMkLSBhbIoOrHIU/+arJbyzdQ8pREScDY3GTU3IJo8Nx9tloyrB
         Gx+rHr0LidAYM4eWFi5OmVg6r/Yv5zfyDcKYiY8zWB+grCdTERRgLA/lSYAkT4W0rs1z
         eHWaS5XvXG2A1WF8A3tKLev3R7ywIZZ820/NjFfpvd4CgQhbe+8dnQKArYoh6tNvFcFJ
         60lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100268; x=1775705068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7lNuuLOzmr03xq4m1O8HQgZGp2bHbRJpd3HGUaao6ag=;
        b=p/3Pgf8lP3mjx/gAuoiwhLW6g2T2HTIQaCIHT089xn+MAIMLAbuQwLVvpO81R661ua
         Jfp3J619Q4KdsrAn0TsIT/XT00gtGQvmAgOsDV0Ag0pTKc/fH12Chzz/jvY0qLCSyiAg
         XPSJM8JktzCTmwDPJSUQW+NIOzlfpGaL5XU00jVnHRbmJ+fDF31MsLoVyiCUdHir6mN6
         xc7Kqud3hjxRx+wCnKefm2p++lZlYvx6NWv2AwAFvLosLVosceixzF+q69iIabTuv5CD
         Momvm11jvN7K/fbEwvWw3h86aoHMQHW+1tYSoz8ixOXB1AUCoRlj4IIfpv1gYcVnH646
         p7iw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3d9SlZ5r6AF+kJ/7ebGwplXGN1RSNne4mo1P5zYYzSDrxR041ycdu3r7FTp/V2BrGU03L29M1faWnJ13mGvQahth@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RX7t2+ZATc1MBaZTEE7JLWF9S0iYzBDyj3PIlPCwWpGX9OlT
	5t3m6TMLFY2+k3A1G86cDvHIQhMUVS2e7byktlS7XELx522yLhjZseD2OX13HA==
X-Gm-Gg: ATEYQzzco68jhjSo04mkPY6FoOXBezGg85G5ohfTWduy9vYizvlIRpj8sFXvpxNFddb
	Pn6we1x1XaxPFFR9Hqk2f7PcwJg90K4d1Uicv85cG1EtHWzqwY/eC622FRmxTqjFbFcs4dfiGNI
	rzBZijuADLN7QHaTP4RgRzWRfqG0/+qK0DxM2Qd2tVXjnQ2XviyqmULItpZhOIwpfrx8Bk54RVG
	rWGFQEXvKcnVkE5gLw/bvSZhb7DflU7J4SSPjtG04UkRQ/hO0o2vQJeG66XiN+j9ktJZms0QjTO
	JXhK33ifRATqbXMoZwS1dthF1qeoIMLT6vkLhWVq94REFDyeXZsGz/tZ4IG7Sj0whcRcYArsvqN
	yfo+do/YBi6xIiNGgcxdLuC8r5sUzRbUtptmYNp5CDLbRYo7rvqtdnEHeV1inNwxIXxHCFtpder
	J8br4wUMnNQ3RXVkbpb21e6EZKSI7XxKCbUB2Xall3Ho57qjHfT5b/Pj59BdPdv721mCssD39op
	7P8azkNbP/cC1A=
X-Received: by 2002:a05:7300:a483:b0:2c1:1d6b:1698 with SMTP id 5a478bee46e88-2cad67a8282mr332104eec.5.1775100267985;
        Wed, 01 Apr 2026 20:24:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:27 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 01/16] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Thu,  2 Apr 2026 03:24:09 +0000
Message-ID: <20260402032424.678528-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..80021f59d1ef 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -55,8 +55,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	ret_obj = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

