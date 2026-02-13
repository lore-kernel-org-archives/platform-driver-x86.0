Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF32673AA
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771022438; cv=none; b=DjLPggwu7JuSE5q4nQ+40xTNQceS6KH69O88c5dpAAFWM26ITk88Zx3vdjFrOv6f63NobjBSElZyZqYqvk7bgooR4ARKm7e5TZFOlYlznLa/wGOL0cIm/JIW6dvDJ6tJcSQvegzdec96uDkGNmdE+v8ReMwTnqe+vq/NdrF9D78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771022438; c=relaxed/simple;
	bh=0eBc3qag7iGqEolB9ehW3aG27JLfaI6+0LDtqtkVX20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWZPqiaCBeDO0XT3yqdLKlHp9gbPeh34MEcZ3ZeOg/FRrJH0a5tQjGOE+viXcG5DcOKgzHeV/hgGwH+NzsJFm0BNOfXwqkLesUmLoeipyeLd5mxK0ZLs93BYMA/cmobXdqQtIvcBjGH+eyaLF8XH3jKyUrgeSbRscmhdE3ZOnaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoCkg13t; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoCkg13t"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a95e592fso2312430c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 14:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771022436; x=1771627236; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdofLC/469pxKjhC0u9v3RUkxPN5TPjNFVOFZAGgsV4=;
        b=DoCkg13tleNs4351/oC0C2jxZnWhytQgew805ZTUi1sMR2wD88WKyhEhGmKFkplsae
         uQeh9dMjCXKRVVhilRgcOZw0J5OfZg0dOunSR9FpG5zQYXSt/MzORly5YdI7sreDbzr5
         XujJeWj4OA+gCcTO989MIsFWV91/sl4vl1bsqdaY9AG9eN8XXnYgwcwGGRMT1B6OycCX
         KH1TKVWWf2W7h3OaUot579/G2MOcRpNTB9sKNQMUWuAa5cChep77yFTYXLDMRGl8lK4v
         E86DYSSB6ISfptR8arnlZBsRPiNwylex/DP7ZKTt5fPC1qgbUpUgOPIJvxtjXYpKz46a
         zkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771022436; x=1771627236;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdofLC/469pxKjhC0u9v3RUkxPN5TPjNFVOFZAGgsV4=;
        b=QzKQXG9VT33v1xoeXDd4vSCxcYuZF76QCHFf8GdHs5DzFM3IdeNIy0EWybYRKzIrqt
         CYS66JC6LR5KyfMglqV67th9j03ybc5zrIXE5QeQnE0iaW8qAuOTMDwRuotlQgz0/8eo
         zc2u8ZYr8KxlX/v4l53JcKOBd/8X5JoIVLUtrat8lh6JNKmFV1lkms59stCvFETjoa8x
         Lqgz3rYW6Qlfh3AC4WrQWK/Ckj3ZhhLGzQIFzlfxFTbsoCDuBxjgeaFXPGDGgPsd0LzH
         k9fxpHZUl6IAhPz8mqW8x1hlWA7nXJSHmqMYhxXBcfAEQWBienFREPoPT/DQGHwIbDWa
         4MRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWahP7ZGgJQB9GruC40vyOdH43QBGLEXZ/boadZo75vycV0rAHL618jtaGjC2I/uFasBT4bx8p/5Ml0zSEiLfhpxTv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2joEy7z6wC6mlthE5/jTq3hGJC8zt0Uk0HQMB949d76jBV+v6
	x1rIwIcXKY6glbIRW5KUKrhszu/M6UTPtGh5+T3djMABJ8xxoBpyR3Q8
X-Gm-Gg: AZuq6aIH1XS2QAbBipXZH0OWX/XsdOI7L8MlIE4bBLPcrvTYCXK7jlffOKc5lftqhB5
	HgEWtNYs2s76zJmEIzS35u/sGPAwD0b7lyjAfZwHWeVZ7dnnZZwC0Ethe5uY1AjT6PiXjc2rgUG
	HDYaKRaaFapfGrLXLyNDEomrlOpS4i5Twuepn9sMEey5BGgVhvaaKEEyNNsX1kWq2Ytux08Khlx
	j7zcYYKvEsMz4wSEMr4zdo8e1+pgbg9i2ejrIMko3iAAnImZTMSf40Bg/OpAPb+aHZVg2ApnMbg
	PkBnfwEVrUg2NiZMUTL4tvty8KE6Lc+xPfLDBG1k25SXz+zlZJEEXhD9YH+L6uWHLKkxiqa+cyB
	IKKE41l/+EZPJaBl739gogseNeVeK7s3HnJ9WjS8hJ0A24gakRIbRG66WkO/02ZMPg8i0pA2XjL
	M08vzILKlBV4Gr5eRtL1/86yAA0BzcdQOg87ELFc4kP10FqdcxhOcry+aOvk3+olgm
X-Received: by 2002:a05:7022:43a6:b0:119:e569:fb96 with SMTP id a92af1059eb24-1273adbaa24mr1589222c88.5.1771022435617;
        Fri, 13 Feb 2026 14:40:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:b713:5e7b:5963:d2ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742b62274sm355552c88.3.2026.02.13.14.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:40:35 -0800 (PST)
Date: Fri, 13 Feb 2026 14:40:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: pcengines-apuv2: attach software node to the
 gpiochip
Message-ID: <aY-oAVI0TubcaD2K@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes from matching on node names to
identity matching, which necessitates assigning firmware nodes
(software nodes) to GPIO chips.

Attach apu2_gpiochip_node to the platform device representing the GPIO
controller.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 3b086863c6ac..3f19589d1ba0 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -294,7 +294,8 @@ static int __init apu_board_init(void)
 	}
 
 	apu_gpio_pdev = apu_create_pdev(AMD_FCH_GPIO_DRIVER_NAME,
-					id->driver_data, sizeof(struct amd_fch_gpio_pdata), NULL);
+					id->driver_data, sizeof(struct amd_fch_gpio_pdata),
+					&apu2_gpiochip_node);
 	err = PTR_ERR_OR_ZERO(apu_gpio_pdev);
 	if (err)
 		goto err_unregister_swnodes;
-- 
2.53.0.310.g728cabbaf7-goog


-- 
Dmitry
