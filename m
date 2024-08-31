Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FF16F271
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Aug 2024 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092773; cv=none; b=rTcp7ho901FbKY649APFd25uRKGzxiAT5sxXbvzd0wwxg0b7xStmLcRg885wHNbvBap3GmikOhrFQcHG8kFFweLDCzyylK0cKwNlGUzIsTIsOjMnbWQVyvRWH6ECzlWmx2sRnlH6d+MsoTdkXIJuq+QdXs+Wu2Qz4UitIxhsYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092773; c=relaxed/simple;
	bh=wrI9Ia4Ar4QKeJfDIgGIGj41ailash/OWxo+v7iPnis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZOF73Gk0k3R0gWJV+3V0XnWNWUxu/xHDYTFKsTH0LjBGLysnOKy5al2RVuogX6190nt4IgihQTUZ6twKoxJ2LMS1koG3zzIcW+YukDSr8FtH29wWN7vSzXXn9quG+haUmJ7hS33xb0J+u4fePC8vEGSIWjvWrvprh5ejg5rxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+Gl5hoe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+Gl5hoe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e0d18666so21469515e9.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 31 Aug 2024 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725092769; x=1725697569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUn25yylj83ADt3TIdVylAl6ydwxlNjsLdxzQbv/uu8=;
        b=G+Gl5hoeYYAEO/vbsF4zbV9SZ37CMfgMB3u9pibTRJURQUm4OhFevQGdp7tHsBEH+X
         hEgbOJ+IAf7M5wcIlx1PR3u6A4e+RdPdzCVIB0tZMNSIdNU/sh+szOshJPzV9Ul62VHR
         YT/6T622omHgz4JNGkAmbzdZBsYNo15XPTT1/xGKZ2qG+p4VWna+22MliUjjEksg4e29
         6GSAq/yO+Dm2Abgd/G6GmD+Po2bnUd+n4GSZbVBai8sxMdMJZUMe9Aw4tN20S3chphpc
         6qFZY7uM+IrZ3jsYb0AgrgrV25usngFsB6t61RgS5PRcAEOA5Z3MLlPiORAxVQeBztdi
         rPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725092769; x=1725697569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUn25yylj83ADt3TIdVylAl6ydwxlNjsLdxzQbv/uu8=;
        b=ZEhNKKarf5XN4Tar3av23JNuD8JProFiUQcpRu32ven0GA8uPbN1Pxa5NNuANxtJRt
         iNGxGOXTR0r2QQ2jJHJqDXDNNjLDINK1VCZraZwQKN4puXnxIbjCoisrBDJLq9WvAWqm
         C1WSlaUuNBTLy98tpyYT78Z4HGNXVIZc0WPY4jXgR319pdMOyBYAWm5zJxIycr49AYxg
         kvsP6zWAg8RwIYMexLKylL2o1SVmRWPLpd0ClHsRNwk4g2BO4h7FgkDt4lE9+DOvzeVm
         bdhvN/grw9XN7lE4xp6igmxkmAbw79LPPhL+069jP+rTp3j04YwY9RXc3y+LRHwdMYrk
         wH/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5ob5jmNxDNtxyIf1xEeeVSs4al4QViCx7Z15ORkDhDjwVTxeKWmP6kRN1WTz3Hht4kTm9Rd2jmZs08S64NE4gFU7D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4OsOS7H//ucUpFS12V1ohbqZ0LHUcXQwflLre0oeWaeHzrfM+
	+wYKEUZWUIUMfJU+ejPkcF1qHpDflU8ML7MVhxKmLu90/APrbEvn1aTvloWbSBI=
X-Google-Smtp-Source: AGHT+IHWvHDiyoJfajPjn0ChFw5L62xII7chAIudL8Rfv0VPD2SsDp1xkjww+bPGvwVAiAoynVDyIQ==
X-Received: by 2002:a05:600c:3b93:b0:426:5e0b:5823 with SMTP id 5b1f17b1804b1-42bbb44114emr36049175e9.34.1725092768683;
        Sat, 31 Aug 2024 01:26:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm104491425e9.4.2024.08.31.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 01:26:08 -0700 (PDT)
Date: Sat, 31 Aug 2024 11:25:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: Ignore 0 in dev_err_probe()
Message-ID: <ce59c3c6-8729-469f-a0df-b6844792e324@stanley.mountain>
References: <20240822130722.1261891-1-andriy.shevchenko@linux.intel.com>
 <20240822130722.1261891-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822130722.1261891-2-andriy.shevchenko@linux.intel.com>

On Thu, Aug 22, 2024 at 04:05:38PM +0300, Andy Shevchenko wrote:
> In the similar way, ignore 0 error code (AKA "success") in
> dev_err_probe(). This helps to simplify a code such as
> 
>   if (ret < 0)
>     return dev_err_probe(int3472->dev, ret, err_msg);
> 
>   return ret;
> 
> to
> 
>   return dev_err_probe(int3472->dev, ret, err_msg);
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is a terrible idea because currently Smatch is able to detect about one
bug per month where someone unintentionally passes the wrong error variable
to dev_err_probe().

I really hate this.

NAKed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

