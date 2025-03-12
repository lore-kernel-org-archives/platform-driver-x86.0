Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16123278D
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Mar 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768324; cv=none; b=jYusStQp1/oqhB8875//Owxniqt/m2Z1TeOdI3I0eno8RF1PHXOaF6A90LJKDvG64VTUeijxqj+oQ2aiGrVj7KkZdeenLqb3BzfSL53in5kLOBJPvhCHBCo7mJJpXGCXaQnrmWCOEh62xJ5dMBdgtIRsThnQD2Z7BF+QboyOsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768324; c=relaxed/simple;
	bh=womKgPEIT9EPwHvn/d7tEBavuKDefTq2w7cv1JqJo10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmqNUag/8lCYDkr7XozoISIj9Y9cny4CExJjdOsQOWsK5ZYz+RMxt1DeO5zxiVaqO/TxjcyaPM0RaYzxKzchUKKZBciN7WfxnuRg0LLOv2a8UYr6xPrbhkzyNRtsLFFLtYjV3LG17oaXyh7L7QVmIHnlBZRpziwcZTOnz5w364A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Le1U6ds3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Le1U6ds3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3483572f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Mar 2025 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741768320; x=1742373120; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEv6giHm6T/LYVWvdNBEPXKv/Lj/EjidI+nVqaZEF3I=;
        b=Le1U6ds3OByim1KX+KsYcBV0nC8IrhcoiAmLnIj6dgUvE7kggJMijxcohvAWLFXhd6
         y5YzDrOdNeoiESvnoBmg3IXnSH4hIV/92b8M82ypcMaMiUTxmIEfSl5HWs2pFgGUdKcd
         W50BWXEH87p+vUxWS+VrAUxM5WS2/soN6WhVEvkIVINYqWZdxjpGdSwesWtxbbEZVw+J
         BFpeCDub8VTPgAk6EQviwICPpMh0/shkp9TC0qkunb/nWXhswapJ/DYShlbYKPHOyU7X
         9ysfBqd8ZUCw5WRfyfpd23XiCcae4pze6SmsaQZKwqbdywrVKuCHbJ1/cu0e6zaxk3W1
         nfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768320; x=1742373120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEv6giHm6T/LYVWvdNBEPXKv/Lj/EjidI+nVqaZEF3I=;
        b=KrjWJ/hOy7ZDTkTeg3c836tvA6S+Ax5HYh24yw3j62fPRz1Gm0DAguhaU8lDui23U3
         fYv/mri9sb4D/NgoNsT0AKXyOzKgawii5Ymem23lzhi9w+vTZvj24QZqsJ8o0oUVM/3H
         QenQRzNm+uEK/VERD3Lhst6pTMptY18xCOH68DybXjPVtDCYUjgItTybdCfVsGjYoMY4
         8IRqY3ZS5QNXeJBrvE2J4ZKm7SgFNwEu3i+BKlK/GWbbF9aXvwdvtoYwbtRbE6KoQZuy
         yPrOqnRHE19xPF2wMQ9heZ98RS7fhV5keshelu8/tSRXTuL30ZRE02KCQ/hF7TuYxddd
         0ULA==
X-Forwarded-Encrypted: i=1; AJvYcCWc30l69e2rMXYzp+wPzFCIrztlYkP6hmkQz98ePIGXzxtMypoWqaPmudDbap/5PfZE6My9QHK1g4ar5RwbjIZcz/eF@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1JSKA6hf77xQah+J/iVOQTZ5MAnTDrA8vlM0gVSML+cV49BO
	E0lxEg2gCw1R2J1Z4WiGvYP2yVvi6QGWRmykow8/EeypjKm7RJb5Q/KEz/jcRFs=
X-Gm-Gg: ASbGncsvV4M4bQAp/H13ghkvX9Nwrx3ij71SAovB5437rJv45bXEDm3rYwXKWp7nU/9
	4y3FMv64od+2ClLY9XAvnu2EId45YnQr3DXFIPwBvKpzOmhiBB+gpbg9/jj7JJyRa+bsLvnFtkC
	HI8SZu+bFKb0qC8oh40leYSiX1RjcohepluamJ/jM507UZBYFVst9iX+5OvTGRxAy/0QqGnmMCQ
	cloMiDivhz4nFAHDwFd6eTsvEbJbtdmOSHaBP0KOpNVD/a17dTgBxwGnm9ZE+ecw2ac7NNN1to+
	cb3hap55wsFQv28CUdlM/Rw3R909+qaAnYjbBaTaHSKUsQqGpg==
X-Google-Smtp-Source: AGHT+IEKC0UilnD8jhLQLusELnZkfDUTC5jmF/RjVLX0yHm2cONnPd8ZMZIZ6muxPlcdhALj4OaMng==
X-Received: by 2002:a05:6000:1fa9:b0:390:fc83:a070 with SMTP id ffacd0b85a97d-39132b64eadmr18012730f8f.0.1741768320619;
        Wed, 12 Mar 2025 01:32:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c103035sm20021324f8f.88.2025.03.12.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:32:00 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:31:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86/amd/pmc: fix leak in probe()
Message-ID: <65e2fffb-a1cb-4297-b725-661d6b790a05@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call pci_dev_put(rdev) before returning.

Fixes: 6ad1b2dc0f2a ("platform/x86/amd/pmc: Use managed APIs for mutex")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/amd/pmc/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 84bc47009e5f..d789d6cab794 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -785,7 +785,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	err = devm_mutex_init(dev->dev, &dev->lock);
 	if (err)
-		return err;
+		goto err_pci_dev_put;
 
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
-- 
2.47.2

