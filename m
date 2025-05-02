Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399728828
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 May 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175223; cv=none; b=GcQcIAWwZ7alD5Ty/MyrZU/SK2xofTp1mZjOY0VkicMAu6HjMJ/NkBlNzh3m3rNFmYXmLsamYhGGU5f5YP/BiHa1eo9OoyuEaa4whpNSeRhWbYvwqKbYb9VZe/iKbGmOrjKRfwF8JShhTEdAmoGLXDEYTlisxROXrxmKkK/ikH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175223; c=relaxed/simple;
	bh=4GwIMV2g6kYQJfYrG026JnY99HzIdumMHujNiN5PFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SyeZLDmuw14f244jW1JbD3hwrrBPSqN8fYPyj97h+6yJE+GN1xrPEfbfpM4xBVt3iNyV0gq5FPFRvr2UX/MdGiYehBMxIsZDSWUmVCCy5d3hj25V/g0YXcVbUOHV48D+ov+xxqTQfBvjoSnQRjq1E3TPccaro+5ko1+y9vpBjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e59c++Xo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e59c++Xo"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1183689f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 May 2025 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175219; x=1746780019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=e59c++Xolau9uKv5LXFDx7H/lPOQPzpuTp6hpnqxJpjBP3r/6dkH7pML7nyqFlfn7l
         Jk9/LaWBFyRpGjwX+0y252PGjgU0fHW9O+EAnDdsKcS+/ptq/AcWcAXVvAtbdsIJDb7Y
         vVomeIxKb7xYf/rNXMt1cj7WsGh8vVB7QzHDCZ+ab6x10LRy3eE4MyAFi+5k84PIfmI0
         ONasA/QKpHbEb98VZfvj2oGw0VVNU00wT6jhsF0ZuXm2QBT1NFCNA52O0JedBVmOzIjz
         K0U9JrMW1BJxHD3SeCos7d84A6Rb2oW0ayxKd0j7Y5nZSDVcmFYB0qTbolcKsLYoFZvC
         7sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175219; x=1746780019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=gEr92htXI7+QB5++IrjuTC54rlwQR6mE0gV1anFRv52ZdPpkuggh9N2MstWPyp8oby
         qOQ5JoLAbkbvqvrFPj//jj5v6gLh+tHD0QTcZunk3pJmzDSLImSdPgJeILMOc5dyarTW
         vy8u6JvARikJ6MNIh5TDNWZObZvDs3rjQaUcgYmqkorsdWHsByZKHt1j8e9iUh25N1wK
         Fk4BWW2xwuufeJgzM4a6RNXVJ7PMtaZW1vI4w3Xea5j32vHhwhsFCZ9Or5UYN2ZNoz2V
         G19Q1jrIxhJ8FT3/djo0/h4paYwxYBcuNlo3TsyQT5VFnAnuuH9MFihyJlG4m3vcbb5n
         Twvg==
X-Forwarded-Encrypted: i=1; AJvYcCXd1urSy8GyBr1lf5NQuxmKoWaRBwmZHhDZvBq/rCklHkeHNwl7xB0mNlLOXWomOQ9alSGXGtnKJ3FFSc6NxOft6lcD@vger.kernel.org
X-Gm-Message-State: AOJu0YylfM+bdWLVMyhXPfaadB6kAMfe7c5l2j4xOx9bW/KunPq0ssQB
	5SvZFcAog7UKxEbSKaeCaZu78kiuuq/5ABt2LwUeW3wyJKPo9hYZxts75S7okRk=
X-Gm-Gg: ASbGncvr7hOBMTVIRPcc6vmLb9ODAO2S0IsD1+H063HcRy2k2wFPEwJZoBYvIpx/9I0
	gchjGC9irsL114HwVADClsXa7GRPGqa4ECuEF1vL+kTVK+Zz5kMIB0jrcgAtyJAJbl9ERW/EFAT
	xfXqkb1EqtIcF+xz2xkvTCySpQsHUIunI/BBeO5Yu/aL7icHp9GXG2wC4367LefViWKPCJI7Na0
	UWKp+5xrgOZUIcGBOj6v9VfcHzts6ZiTc3dIDOLANiwhlMXuyiqzIePPPkG+PzaW5aqnUn512P+
	ob5ifgOCgzOI5vKMizFXyM9nQGWB4+epVeZAMWKWdoK5+w==
X-Google-Smtp-Source: AGHT+IHreIZwzg9TVSTEmBpk2mrA1QNuEKFUEw+ZtdCxQ4dopKGMwZ9mLqKa2D9lb6EAzaR8gqchzg==
X-Received: by 2002:a05:6000:1446:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-3a099ad46a2mr1385443f8f.9.1746175219587;
        Fri, 02 May 2025 01:40:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0f118sm1482225f8f.78.2025.05.02.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:40:18 -0700 (PDT)
Date: Fri, 2 May 2025 11:40:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: oxpec: Add a lower bounds check in
 oxp_psy_ext_set_prop()
Message-ID: <aBSE71VKfBlQg_fZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "val->intval" variable is an integer which comes from the user.  This
code has an upper bounds check but the lower bounds check was
accidentally omitted.  The write_to_ec() take a u8 value as a parameter
so negative values would be truncated to positive values in the 0-255
range.

Return -EINVAL if the user passes a negative value.

Fixes: 202593d1e86b ("platform/x86: oxpec: Add charge threshold and behaviour to OneXPlayer")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/oxpec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 4b48f4571b09..de70ca7e8493 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -582,7 +582,7 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
-		if (val->intval > 100)
+		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
 		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
-- 
2.47.2

