Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBD320CAD
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123518; cv=none; b=tX8+gzqOtpgGvMXq/ZeziwFrqIIjBzeZBhGaSlYerI8rHwXHhVFMLUZLLGdbgzWN3hC07E/QXySDv0nx7bBqJ2hQMVBibskLBGpTSeGY9/fx6oNWh3map9W1LiPTBB0ktraNrE/bqpHbxA+dSRp6ZpdSnbPLmJx4lA5IAndzG8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123518; c=relaxed/simple;
	bh=VlgOLU/SAL8F0zd+At1U9RW8a1ngZacbFmBgI40qeF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMjaph/JkMmd11d3Q02Cv2yjjruTrmmt36JMS6z6gFqH3wm88URfuBuA81meymmXJPM4y/gnr57IDIDaJq72VSxKrFQdfFRKxWN2Db3goA5L1hYkfIBrS41lZ1LSeqSybEdEv4HvrvM2nlNtZtHD6BI6hDRgnEbsg67uK45rvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAgVhH6+; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAgVhH6+"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso7855891eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 23:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123517; x=1773728317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjtQZnmo8Gwc+dKRjcrzPdJaL+KCrJVCb46smQt/ILU=;
        b=UAgVhH6+2GarzBsrOc8PA8/PZu7drUyKWT3wijPecI1XHM9hH1Y9DP+kZKSke2LnMC
         yY1yOHcX4mlkHHfZEobjK5g+6QLVV4fqkpq4OxlP9ti1Yj9sPeJ4i2Xoa1uatL/kG9he
         eci7vzkhykTu/G8yCkPzEiOFITJttNWAMy0qcbIF4Uo/cY0NfGvg4GfYmfiiY9rLvBO2
         K8faDuKDsoHAdhbHDFECN3hvynrSTx9Nn5gMCP6MSj11uK0xkZUPexJlTbRJtPGqm42K
         bg2aDyxPx/NEYTfdYowe97fd6BijtxcrhuwA1vhOxhBCDWVG/Cuu7Q+Q6KnXpPixhHVI
         f5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123517; x=1773728317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjtQZnmo8Gwc+dKRjcrzPdJaL+KCrJVCb46smQt/ILU=;
        b=rMlW9p/P9r7+Z/FDqfRHcrwtzyX6EaAVu6u7sAkMtoL4wp072V46B3QfzzFbptBogj
         QfiLRvVQzgO9J624ZRKbq9SETEfTSLZVYIFYxQyJ/6VBmDVbPdO4d75wPTQtiBILqULq
         derxXV++r/SJeKDD6OmfDgaJAmpIqBiWo+5yAtJ+m7gVEblDvz0lVcIy8otbAL2PLGVo
         4Ov/XmQBvH+pUYI07l4WhM9twJQ2HRNWeVmVmmHD8q+GrVWrmfsH8Jq7fMovP9BwKwNu
         tT7EZkSDQOkI4YQiPuzNc+Y5MVyMZg49iJO0nlzF3pkgEmDtdTm7mTsgdVxLsvaFYPxJ
         JAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyFzpczTyHaqFcfaEKwl5roM9vXWfzz5DeoB9QSQD8LcHjWO0y5JLlTXbx76/pbrRXfV8i1oEqCBE6l4e4Dpidof7@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUYuNprBql/MSHfRWycoimE46rl0mLfwLeEy/Ycf08juxXT8f
	Ku1ej6BQp8zhNplykDmBn5uHv390laq6fS9GXM6oTTMRuO1RQyx2I+RN
X-Gm-Gg: ATEYQzxLCGvCmHileQAYF0LpZ2he7k31hhzMrdfbRHLYORIXQgFmceHzsFLB4KDQuCo
	z+cY8Hnb/xjpCzKYlyq05JB0jb3HoDp+2Yt/r0C9JPDTtnNz3k5NmIW3VzHU+9/RasK7q7CZ4Ci
	98dd7wCOx12hhesh3dOU/HZOx1IepQ0mOhlO6vUsummXV6jHn98zC7bqkwprUI9VqWksXm+XAI1
	apSWd/ay/nc8bPrM/IfGa/MKBnaGkl//QWIz1b4Aj2PjoQKuCgpaK8M1iuremQ6RnyZfZV7JF8X
	pHJMkOvZQHFVm+FZQuGHZiNKJyipCwncVjBQU1XREBtnBEcNlMZGHQFZszLyPdwUUbyJFrHs90w
	2qEeZLaHOMbDT+d+4BNjdxClX5IPUiBb85+dnVqs50M2TAtrgVse7ILlUk63jh4VfqUWsGmr0tP
	SbDnGhPS4pEW45b3sdU7zWJzk8DfS0/NSinnPh8jegv1EoFE4OVJYa6IsotXLHseV1Tz7+miHCV
	QA=
X-Received: by 2002:a05:7300:1489:b0:2b8:6ae5:79c3 with SMTP id 5a478bee46e88-2be4e090105mr5356857eec.38.1773123516637;
        Mon, 09 Mar 2026 23:18:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm13202342eec.33.2026.03.09.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:18:35 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:18:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
Message-ID: <aa-3e_Wjh5J5XFi3@google.com>
References: <aZYn_xDxBXn_Ijem@google.com>
 <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com>

On Mon, Feb 23, 2026 at 04:11:10PM +0200, Ilpo Järvinen wrote:
> On Wed, 18 Feb 2026, Dmitry Torokhov wrote:
> 
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by p50_gpio_get() is normalized
> > to the [0, 1] range.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> > index 6f13e81f98fb..360ffd8505d6 100644
> > --- a/drivers/platform/x86/barco-p50-gpio.c
> > +++ b/drivers/platform/x86/barco-p50-gpio.c
> > @@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
> >  	mutex_lock(&p50->lock);
> >  
> >  	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> > -	if (ret == 0)
> > +	if (ret == 0) {
> >  		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> > +		if (ret >= 0)
> > +			ret = !!ret;
> > +	}
> >  
> >  	mutex_unlock(&p50->lock);
> 
> A simpler flow would be preferrable over all that nesting. Is this 
> logically correct:
> 
> 	guard(mutex)(p50->lock);
> 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> 	if (ret < 0)
> 		return ret;
> 
> 	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> 	if (ret < 0)
> 		return ret;
> 
> 	return !!ret;

Yes, but I wanted to minimize the amount of change. Maybe I should send
a followup patch converting to guard()?

Thanks.

-- 
Dmitry
