Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAC15ACE
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jan 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bn+zCbWs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33765009941so4161604f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jan 2024 04:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704976500; x=1705581300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xmwvOs8ItsKkGVZWvFz4GNk7Se6b6TGVQHJO+AsqTk=;
        b=bn+zCbWsgf23yMWfXyTEXRL3AAidoTZ1aRgpRbwAvAoz++3JV9fFGdUByL5T+BqF6E
         Gmg/XdmmL1ZxWQVcCYKP4zfZJ0R2QH+DIdXkqyCOVOTNsOj2ia8HJYr93UQkGtWE98Wq
         emie7s/djz6JK99UdpwYgmo229pPL1uYyh19C31ADhG/XwGiNURHkJzprCTtzGZfvVZB
         /2UOZblyH3STmpEjU7IyoPoSkH5xX/AREtPKSZ6OVq5Ltysjs6d5tQxN8DWysFfdh58r
         7k9eTkTrhs7EC2jk6gAz9gCNOHwMhVjsuuDenk8H6J85Jty5y8Xy7oA956oGinSD8gT1
         QgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704976500; x=1705581300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xmwvOs8ItsKkGVZWvFz4GNk7Se6b6TGVQHJO+AsqTk=;
        b=toMb8dxtHLiIaYTNRVw7nQ9PEogYLbVTDyVnlFmppfPVbhBCHpHmNwLiP2+GNPxr/j
         EfMWjfKs8WPLP95ZDa8Qml/mSZk69WdXH3UHCIZY2FGe1BncW7B8cz3tc4aeObRRxoFM
         9Ew2Zue6vEfGf39S2wafdht8BChpS58lKhj+E7JE2Ii/fgwCnD1tJKGnNz6enyj9L8d3
         q22INQuwLBAh/xYccwus60NOmx6HC4MND6DmDR01u8R9eeW4j6sx8GJAnCA8kAUquaz1
         5veilM8Eq7uRERkb8VJr1vI2c5yYL7Mx5SNj1ADPChWvjzUjvYgKxljmzhbBQQDsF6WG
         cj8Q==
X-Gm-Message-State: AOJu0Yw5dQ4K9MIxu/52Y0jgTKmoZ3D9XSvvuMMbfMQ0q6yVAeSgjrKe
	jc5Jb8Y+TAxhQrokbG96HICmfdNV+JQA4w==
X-Google-Smtp-Source: AGHT+IHBfzDEkfBMWZKwVkSyy1K+59QjsL8NoZd3Eum5W0WTjIvdXTK+Np/6VDlhb30pz9hl6XK7Dg==
X-Received: by 2002:a5d:4211:0:b0:337:8eb4:8ebc with SMTP id n17-20020a5d4211000000b003378eb48ebcmr136839wrq.64.1704976499879;
        Thu, 11 Jan 2024 04:34:59 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033674734a58sm1136322wrm.79.2024.01.11.04.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:34:59 -0800 (PST)
Date: Thu, 11 Jan 2024 15:34:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Henry Shi <henryshi2018@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: silicom-platform: clean up a check
Message-ID: <05ae147d-fcd4-4f14-b2a7-8dfc651cce82@moroto.mountain>
References: <0402e613-446a-40d1-b676-0422f6223aa8@moroto.mountain>
 <90c2576b-006d-36eb-1fac-c4c4a6eccb4a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90c2576b-006d-36eb-1fac-c4c4a6eccb4a@linux.intel.com>

On Thu, Jan 11, 2024 at 01:56:28PM +0200, Ilpo Järvinen wrote:
> On Wed, 10 Jan 2024, Dan Carpenter wrote:
> 
> > "value" is either non-zero, or zero.  There isn't a third option.
> > Delete the unnecessary code.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/platform/x86/silicom-platform.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> > index 6ce43ccb3112..5cac698bf98d 100644
> > --- a/drivers/platform/x86/silicom-platform.c
> > +++ b/drivers/platform/x86/silicom-platform.c
> > @@ -258,10 +258,8 @@ static void silicom_gpio_set(struct gpio_chip *gc,
> >  
> >  	if (value)
> >  		silicom_mec_port_set(channel, 0);
> > -	else if (value == 0)
> > -		silicom_mec_port_set(channel, 1);
> >  	else
> > -		pr_err("Wrong argument value: %d\n", value);
> > +		silicom_mec_port_set(channel, 1);
> 
> This covers both cases without if:
> 
> 	silicom_mec_port_set(channel, !value);
> 

True.  Let me resend it that way.

regards,
dan carpenter

