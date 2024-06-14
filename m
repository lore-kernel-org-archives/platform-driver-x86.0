Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7D19414B
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jun 2024 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360694; cv=none; b=EWNCB7FMcxpUMJyZ9O8rUichbCTL3piL6Cubn6r9o4goXzggKueIfotZHKCfN0AYD73bERyn7tb56NXQTGIk2xTtPQbVVaaoREz6S/DyrWLhSYLXzDgFna+Sv1i4NIdDd0XeNbaLhg19Fip7jYOvhMc8/fCM8HRiDYN1yothXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360694; c=relaxed/simple;
	bh=ZuwSgi9zLIoNZp877URK5FteNaoBqxpCKd2FeYdrG38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Pf/z+A9zgxvdE31Ha1Oy78F7AD6MEPa8x0WTglAGmTLd6QMY5z8V1t3UEozHczyHYfVTHIV5F0t4D3x0L17xMyN4iESC5MVxLR1hSht5R+scGiFADaF+NgcYA3H+iA7+9qaMH6HXbT6MB6/mLfij2kt7ZkwdUGrNRyeUi0/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVZqrN1b; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVZqrN1b"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52961b77655so1997191e87.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jun 2024 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718360691; x=1718965491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=efnhjpqQgsmtdaUVLcqkEj44nSpt4V5RfvjPWerlFZk=;
        b=ZVZqrN1bcVkscnqRfkObQYXi2bS6sEMRFe0GFJamipcs+6ukeqxE86Hgc/RVZfOKa/
         ZCv4KAN3DAJwAH+Zigx4dimz5aDoBUIhFlkzXZWcZ1zCypnt10DmANYns33SxLm4omOg
         eiCEMrgV1MHxZvbMcZ9li2buyyvPzmR+4NYXV0z+UVGCFK7hvImpwiSj0SCboHZ5wpTo
         idF2fQyVdX4wiliiqvet9M+WVQX204+OcpE4EZW/hYEPnoUpwAd2wnJ5yNCjhVK5t8nj
         V+x9FxyJDLpCvhEQ/iRZmKTYpU4S4ralN62CFSp6uZHs9olw4kfJvGfuZ098ZVF4D0ac
         zm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718360691; x=1718965491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efnhjpqQgsmtdaUVLcqkEj44nSpt4V5RfvjPWerlFZk=;
        b=Q9SN5DitOyrAG04ZslGOjDd764575nDciXmO9xP/MyNpjolsje8rTDbnSS2C6DAS4/
         xEKlriCpTa4g+VKKGtXO4Izw0ISzw5UceGw6VynzjWXCqRjHAFAzc+hsM/MLHYyFbea3
         5PYKTV5Lr65IkjWaE9VspgRCKZTjM05g+pP2SK3IE349Cd6HKwUoWvDL9OLeGleKEOqZ
         CxYk+rBhNP1Bzo+hTOljIoMjL8aSk/DxDEMSExq3LPYuCKIYzrtsFmbz+2vQFn/qf8BH
         ii9hzDd0yciDv9q3BZSLHdesI6U5itXk2pSqwGkFYKPWbEy8QBExyDLiwmW4NxfsRx1w
         Jp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5hgzSKtfhaa4UrfGVjU2nfv1+qj9wZyOufFHUDv4HFNzgbdiswnCR8Q6KMsSqQ3SQpMpBUa1pCARVnhSzwBbl7UtWqc0CDuJV/GoBNIzuOsB+mw==
X-Gm-Message-State: AOJu0Yyec4ybCUp3j9XuEr38vmHPZr3HEzkBIY16/6tahfve/kockn7h
	tvktjhFj17CU2O/z7eauD85lcVK91WuWFWniyahHSk7XIx/qZHDtLKv58J/JktU=
X-Google-Smtp-Source: AGHT+IEWORdeTtr6fZukAQJ2f/JpYbjWtk3eAvDeBEJR863+Icr9nb85v00/m9s9du9B/uAO5LpWzA==
X-Received: by 2002:a19:914d:0:b0:52c:8a4e:f4bf with SMTP id 2adb3069b0e04-52ca6e90db1mr1229088e87.51.1718360690961;
        Fri, 14 Jun 2024 03:24:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca886e23asm168540e87.270.2024.06.14.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:24:50 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:24:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v6 4/6] power: supply: lenovo_yoga_c630_battery: add
 Lenovo C630 driver
Message-ID: <s5ykyyczxrn7pblzbiu7st6barn47zrtjr6yn5shbeo7lwqkfk@hdctgjwpqu55>
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
 <20240612-yoga-ec-driver-v6-4-8e76ba060439@linaro.org>
 <r5wjdxqdechzxbyqwbyz7ou6nbxqewb6bruvklvcek2dhspixf@ujavcd3ky7n7>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r5wjdxqdechzxbyqwbyz7ou6nbxqewb6bruvklvcek2dhspixf@ujavcd3ky7n7>

On Fri, Jun 14, 2024 at 03:35:25AM GMT, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 12:59:35PM GMT, Dmitry Baryshkov wrote:
> > On the Lenovo Yoga C630 WOS laptop the EC provides access to the adapter
> > and battery status. Add the driver to read power supply status on the
> > laptop.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/power/supply/Kconfig                    |   9 +
> >  drivers/power/supply/Makefile                   |   1 +
> >  drivers/power/supply/lenovo_yoga_c630_battery.c | 500 ++++++++++++++++++++++++
> >  3 files changed, 510 insertions(+)
> > 
> > diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> > index 3e31375491d5..55ab8e90747d 100644
> > --- a/drivers/power/supply/Kconfig
> > +++ b/drivers/power/supply/Kconfig
> > @@ -167,6 +167,15 @@ config BATTERY_LEGO_EV3
> >  	help
> >  	  Say Y here to enable support for the LEGO MINDSTORMS EV3 battery.
> >  
> > +config BATTERY_LENOVO_YOGA_C630
> > +	tristate "Lenovo Yoga C630 battery"
> > +	depends on OF && EC_LENOVO_YOGA_C630
> 
> The driver should no longer depend on OF. Otherwise LGTM.
> Thanks for reworking it.

Ack, I'll post a fixed version once Ilpo announces an immutable branch.



-- 
With best wishes
Dmitry
