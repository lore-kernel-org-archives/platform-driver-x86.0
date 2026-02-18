Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570A34A3D9
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448345; cv=none; b=TeQurLdLNNntFcoU8hOMlMIe5puSZCFHizqqjABz9lTixSUD6sMwKEQmVrwDAFycmx0IBuqaKDKqlystSfRxozqXt2fHKeoTUiaNouZc11uxM7hgHjJkOudmHdojQnJSgC6Pifa3Umw3jBpjSWv/rg1xYU016+XnTGWYAjfQtSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448345; c=relaxed/simple;
	bh=pnl7tVGSI/jbazZU1HXqvEWLoN/pFhNyqDP8Iv9cFkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6KkCLur/AhRbE0N1oX3SirzyaF7VhKA0Ci0j0TGnBQ4PSKVWB9aRK+iRWdjhLVkOuv2+qJkQTcMQPoVreIW9Wl00N6imohMRyCQdpuPamhVYvVwMvs4Y4Me0s/T2DE+JkViI5jFJiO/j0aczhjutS8I5ABNa6qAmLMGXET8CP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCaiypTY; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCaiypTY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba88e53b46so716530eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448342; x=1772053142; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I9ASmF9ljQ0NQCC/MWXj1TYs/qTEfdHfffzqvwGNaA=;
        b=kCaiypTYIN39DkNr98m9nMVSKK0VfL0lsxS2xPHKJDNbj8ngmolzpIBTLjwfC4d3Ac
         spE25HqX41n9LbteZABxYrpIFCjbEVFILU+V+ZlXI3FR2Vj90QfcdkLiSJccmuc1AoCM
         HFzy3vnOOkOwmh4xW6CbMlEqt2rVdk2oSG9g1DDSuqbmgrDziopSLK9hEQh0qc5uthDH
         pDNAKv8/i3JqUT5eTQidd1rjrlZJJpY4kWN1/emzWsA6c3xo01MgMER8mrirAf51FpEz
         SI6c96zRWugZwGcW1fkrBFoDLDnvXA9O7FvHbQ7fN3GBeT0uAFkIL92Wrw4AkY3chtPh
         bzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448342; x=1772053142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I9ASmF9ljQ0NQCC/MWXj1TYs/qTEfdHfffzqvwGNaA=;
        b=PvRwJBsfDG8IXH69gFM82THjiT2PLJV+pHC5yI82HZ+yuRSP0qnAmekpmGjvL+dt8t
         HyS0zqyvgTMdu3DkAVWGDRtTcUePJGdR7vDB5QYcjxF4NVrx2nCwjJ5F9oO3vWBo+jyf
         4elVKdXxoIaVkSXaNdFG5qxR/ApEoZoDrqq7NHxF9KbQz9ycZoz7GBkU59zfrGeubvnm
         27ulfL6mkNBSDLyMFqZKKT5kRUx8S4Ahcyc9Mk01ECx7piK4P8EACn0dMK7vILqSIff0
         LROUlEfppf1ckAxOwzWEkkeViHtyF7iYsRDjOfRoFm3PrHFvmk6mIAgSl/criDwf00WG
         kmJw==
X-Forwarded-Encrypted: i=1; AJvYcCVRIruGBbLteWzLUMu4Dvhk9f5BiK1w0RlU+nuisrMiJURqp7rfAORhz3GZDVVNsGHCKaoVHvgV/9RTpBpBz5lZWsnM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhcn48Nfs5a1yodhxyE+JdcZM2Ya2npBK5sq5eBUhdov8p5mt9
	/tKcxMq3EZ7wy0EnZlStg6nFVo18vYO8J1Rv1/wIUnsIfRF13OjAv8pk
X-Gm-Gg: AZuq6aKJdcCqCZpkPvn50H+//yhg0VNEMLQob4LvCztgT+P2MYCKpFGTS+iOyFJoU3W
	SfL/OIamDSJCL2NtggpLZT3n62ixSoZ7VujdUrm+ZtAnm+AK6yCoy84Tyz30nNp0QPF2m7CHCwB
	H0aurFNEs/EgJcINfaSg4xLv4UYByiLQ6IXMu+hIYlde/qxdkE45pgIUZMyZ/VPHhczbedtcsLT
	hd9YBQ9Cieo2z6qxCn7AwW9AMrPbcIo5Eneq/DzpFeD1gpIpXT7Wttr7wsrjXqskrNpujBZWlFw
	zMzJgtGXtv5FUY1auX84chJ2I374zj5mjjmUtFxFoQM0cPc372k3+sz07JeGX4L0Y1VBhtlRUuy
	D/xbh+6hq7jsFN200aApzDsGOUGqbMS13Z6OXervJvW8l+SkRni3Tsl7gvVNta/qBPjsqeMqLj3
	x+LL68HEJtf9sOPrJyBaUSmS7mt5oFbd8KABrD8MNoAsk3gdc5jSgGTFsTHStTSYUC
X-Received: by 2002:a05:7301:5f04:b0:2b7:4f83:9a84 with SMTP id 5a478bee46e88-2bd50a9aa9fmr1215235eec.17.1771448342097;
        Wed, 18 Feb 2026 12:59:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cad9desm19386182c88.11.2026.02.18.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:59:01 -0800 (PST)
Date: Wed, 18 Feb 2026 12:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
Message-ID: <aZYn_xDxBXn_Ijem@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by p50_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 6f13e81f98fb..360ffd8505d6 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0)
+	if (ret == 0) {
 		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+		if (ret >= 0)
+			ret = !!ret;
+	}
 
 	mutex_unlock(&p50->lock);
 
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry
