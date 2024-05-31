Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D68A50
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 May 2024 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717117143; cv=none; b=BRGu/oyY0QjXm8mn/MN+1ZghOwbtCaA5C5Qm7XnNd+MdmAOBR8sLftaGFcEbNa4PIpr1xtjrn1SMm2eu7dYrTHeX5yj8zI4hqI8mdSCxztXYjmTmuYbXQIsyaSKEGLotFHIj79Nz8/AOcY1VxYKne1SRjHoYzrJ2ehbtrXwbgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717117143; c=relaxed/simple;
	bh=bG+7N/6ZBRzyPqoSKv4Si9VHH6RWf6RrJ2vJAjp+SIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7lz+rOMeW/+qatGIzZwPp0MCX7IexfyvW9Rf0+3VhS1QhuP5hs4vBNNpwPrX9N/dsr/lNAVIjZlXg7dZ8Ji7Vuv2Xo8l+ZoU7xpoSaxTH4QozojeWH/ZnsBDND9njO1alcHnOHKh7WP8vkW8/ESBStON26BGnNLEtoGwdcpSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYwyhbK3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYwyhbK3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b78ef397bso1537287e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717117139; x=1717721939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QnFCRKDrZ3vO/pkEAc8zl9OdD2pxO44AabYMP/pb1KM=;
        b=LYwyhbK3t8UrsGk/nheTSAJ3TWN+Fo8uaufQ66JBi4cdbZHqUpgMTXixrqOxstULvh
         Gb/QUDbZlKyDcnSa+fzerkNU1Ksf7w10TJw4ZNVn2iizFiVEX3thRB0kR5utUN33j9Q3
         QX2OfgAgVbwxNUvRaWOlb0Ar6i8qviMKqFDIyGGnTXtHmk0QppRfTU84mKwGYFO4p3Km
         5OnMl3YtCmAr9HlCz/5dpy4s8X24yWcn9ROh0accSf0bhCj4zi35j/Ens4sbgxKKszLU
         AB4xdp9YcfpzF1OTIBh7A854fw9GaaHhkta7y968jRygOuI70Jk7Ja/Xbm35mFjua1Zr
         bubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717117139; x=1717721939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnFCRKDrZ3vO/pkEAc8zl9OdD2pxO44AabYMP/pb1KM=;
        b=AYmwAhW/stuSCrFp2SoitSo7TLX98zDZmRkWYC/Q3ghwVsPLSIRfoubPuVWwJ3EdZ0
         tjl55DIR8zsSFqwRyP1b+M+NwUES7gFTyGVzA57Wi3QMoxlvBPt8LLmvffjCEvz/EJuz
         ZtbBS/SRe5k7yBDiOFK4b2j2xS0D4AhWdt4CTSU+DP5qRvbyQOvh//+YGnzyjj9oJDEE
         grOt1JDSrcJUlsOIpOHyDed9kV7vN7At3o9akA8QvrsZvUGoWxt7LhS1AuoPqhCw7CfK
         Is9rnKbo+Wh6Gph+mdHsvbTiIauWeQSUuAM3hAoiEziuoZjmFiEEM/Z76m8MvE0f7WmF
         0blA==
X-Forwarded-Encrypted: i=1; AJvYcCUqvgO5F7HHYC8zgTANQYI76dWB13VW+BzvfiLTxeMEMcBoJg8N5nTpMAaKxf2xkfT2znyUF2rOwhPJFXhKppvHZbeEntRbilIq6fq/zvL9Rqpdaw==
X-Gm-Message-State: AOJu0YyD+sKYrUgiRKqXiRXch7L942/bRsSC2n3xNCT3/eWqIOZ1x3KC
	th11PHNoNY1hgBUg9wGyp2orIK+10o3QOl+chWsXv1MW40V7WBMEhTMPPnmMyzM=
X-Google-Smtp-Source: AGHT+IHW0DtGLMnQVs266dCybPR/6QxvGMTnPIV7eNFOlCzbPInTMDNv6MIo4HjAP0v2fgbbnnu7jA==
X-Received: by 2002:ac2:46f4:0:b0:52b:8366:27c6 with SMTP id 2adb3069b0e04-52b88783f7amr136279e87.23.1717117139073;
        Thu, 30 May 2024 17:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f835sm143476e87.115.2024.05.30.17.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 17:58:58 -0700 (PDT)
Date: Fri, 31 May 2024 03:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v4 4/6] power: supply: lenovo_yoga_c630_battery: add
 Lenovo C630 driver
Message-ID: <hggfy3pwu4du7msmeg2hz6y5i4kvogpbwzw33lcubhso7angob@q7llvdyz4x2b>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-4-4fa8dfaae7b6@linaro.org>
 <d24f720d-66e1-7fa1-5a99-6fa1defebf2c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d24f720d-66e1-7fa1-5a99-6fa1defebf2c@linux.intel.com>

On Wed, May 29, 2024 at 06:41:36PM +0300, Ilpo Järvinen wrote:
> On Tue, 28 May 2024, Dmitry Baryshkov wrote:
> 
> > On the Lenovo Yoga C630 WOS laptop the EC provides access to the adapter
> > and battery status. Add the driver to read power supply status on the
> > laptop.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/power/supply/Kconfig                    |   9 +
> >  drivers/power/supply/Makefile                   |   1 +
> >  drivers/power/supply/lenovo_yoga_c630_battery.c | 479 ++++++++++++++++++++++++
> >  3 files changed, 489 insertions(+)
> > 

> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_DESIGN_CAPACITY);
> > +	if (val < 0)
> > +		return val;
> > +	ecbat->design_capacity = val * 1000;
> 
> Check linux/units.h if some WATT related one matches to that literal 1000.

I'd rather not do that. The capacity might be either in microWatt-hours
or in microAmp-hours. Using WATT will be confusing in the second case.

> > +	msleep(50);
> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_VOLTAGE);
> > +	if (val < 0)
> > +		return val;
> > +	ecbat->voltage_now = val * 1000;
> 
> Ditto.

No, Volts and Amps don't have units in <linux/units.h>

> 
> > +	msleep(50);
> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_CURRENT);
> > +	if (val < 0)
> > +		return val;
> > +	current_mA = sign_extend32(val, 15);
> > +	ecbat->current_now = current_mA * 1000;
> > +	ecbat->rate_now = current_mA * (ecbat->voltage_now / 1000);
> 
> Ditto.

The same

> 
> > +	msleep(50);
> > +
> > +	if (!ecbat->unit_mA)
> > +		ecbat->capacity_now *= 10;
> > +
> > +	ecbat->last_status_update = jiffies;

-- 
With best wishes
Dmitry
