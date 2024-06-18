Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE26158DBE
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704890; cv=none; b=Xbaiaom/l2xbq5yy+dP4iFwKsuyqAO064a8bkjEFuM/Vy2uDyWYf1soOOGbQ/6nB3yv4yTwHrerhjgTVYF2AuL6KXZkLfdO8Z0UVYmNrjQY8E9L4EBDCIK2P69TyfQk2YwjdSyIcLouNwrEujT7OPBERwB/YnAloo/9UMUfZ6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704890; c=relaxed/simple;
	bh=3/wN22BKmov5evkB2wqvPitu8to7Y1Hlar435aIf7jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udF6O5e+LipjgcpsJRqKkZQRIAJjZrLpZhxVSdIfxYgMHQ+Fw/OnQLkP5vRna+Viavv1vTh9GvqgK6/nMKclY9twVEImRyeRHfmgtOWHJNJGSB8ruZXF/lCzLCQlCwqpjUlXX0cSp+Vz1yLTmbUhBkrDCQ94mPJ4Gbhfjit8KYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLtqI5IL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLtqI5IL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c85a7f834so6734730e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718704886; x=1719309686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cB7HwRCR8aHc6eQnVBtyt+21nLJFLrMKD+lR4P5dPFo=;
        b=nLtqI5ILV/v1KflPP1LRrjruxv/mSmQUsHVFJ7nUrvx9NO4C3Msg7yeytzXS6MI9YD
         Wnq8I2iGKoD5nTTE2m1RveCkdoumEcxe+0O6CFl1KLLi8GdwzGkFX1EQvSSp6vJVHXe0
         zp9EjPyadcGHtkTwsopcJdQYFvNY6kt9wJrtqisqW/w7pHfUp0FOk3mB2/lJyhbPtMeS
         3zmO0IEy2nqZrfAybhUQhv9PtJuw+HgDw77m+dDjobSkFJyv8gmjk3sxiadbbjpGkUX5
         h3jTo7E+9pcatEppvo51VisjhtYiPDj8rEcKNf9f/uM0nEAhJreKu4w+D6Tq48ZP00J9
         qEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718704886; x=1719309686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cB7HwRCR8aHc6eQnVBtyt+21nLJFLrMKD+lR4P5dPFo=;
        b=uKQRbPODIf0cjslt1nkIezi2O0+R4EXPr9VGtibMcoFRxDGPTXyJOBqFyDbBWmY6XH
         filyRay0RFrcytKtLJUXZ7CPzJ/s3g7qEfIUZfSWEUgaWQ7wBt8QSG5cPJ70hEZeYKY5
         0t9TDX3n0YnC6m+MOvH437e/HUKmR1CNWgaH/y8nrsskFF0Mm4yrxl2XIUPbjFz49rk2
         uCa4/pJ1ZrxnxxFyC5h0+gCdLUd2ZAMfIyszCzNKYxcki5Bs1VoPd8iIcApIfZU6NihQ
         tCGCFwKXV5jAREjuZRdHU0VbENcl5j1W+G8c4LFrCetuEo2HXKNM7VGZ3ztwsV1ca18C
         v+eA==
X-Forwarded-Encrypted: i=1; AJvYcCVnBSnHBRGnHBZ1MbmBL5psNp9U/2Z71oFIBl5UtEfdN8CZPFqcEGhcf7AR9jWpdEoOPlDnYrfd6QgOG/SdhJXcFJaigDBRoT6h48d5RMdOrTPVDA==
X-Gm-Message-State: AOJu0YxN6CUeNKuao+c4bnPc8FlTXC6J9LiC/MRErb8C2QyluwXH0M8a
	MvLR84fJUhLI8nERyH+3PnuOtTRcaOWM0paREsFtFYTtZcU1TEOg4+g2Iw/lgHw=
X-Google-Smtp-Source: AGHT+IFnTClOiXd6i/bQkfHvkxe1DmwjvM4u33wMBOsYhKkaVTbDV1ibbbyOvD9s+MswWwvrc2Au5Q==
X-Received: by 2002:a19:ca49:0:b0:52c:85a8:669 with SMTP id 2adb3069b0e04-52ca6e6599emr6328228e87.20.1718704886411;
        Tue, 18 Jun 2024 03:01:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287233dsm1471005e87.159.2024.06.18.03.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 03:01:26 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:01:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between pdx86 lenovo c630 branch,
 power/supply and USB
Message-ID: <nlsnjvwt45kytwxs7xhxl2ixzvkdyoeoodn4vwwzuxh3trxj3e@kjbjamd36coe>
References: <e999261e-cba8-740e-430b-4a4e702fd609@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e999261e-cba8-740e-430b-4a4e702fd609@linux.intel.com>

On Tue, Jun 18, 2024 at 11:35:40AM GMT, Ilpo Järvinen wrote:
> Hi,
> 
> Here is the IB containing the platform patches (1-2) the other patches in 
> the Lenovo C630 series depend on (Dmitry was going to do a minor update on 
> the remaining patches before they are ready to be merged).
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11
> 
> for you to fetch changes up to 5e5f2f92cccc29f356422d3cbc104f7f42430f22:
> 
>   platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 12:51:30 +0300)
> 
> ----------------------------------------------------------------
> Immutable branch between pdx86 lenovo c630 branch, power/supply and USB
> subsystems due for the v6.11 merge window.
> 
> platform-drivers-x86-ib-lenovo-c630-v6.11:
>   v6.10-rc1 + platform-drivers-x86-lenovo-c630
> for merging into the power/supply and USB subsystems for v6.11.
> 
> ----------------------------------------------------------------

Thank you!

> Bjorn Andersson (1):
>       dt-bindings: platform: Add Lenovo Yoga C630 EC
> 
> Dmitry Baryshkov (1):
>       platform: arm64: add Lenovo Yoga C630 WOS EC driver
> 
>  .../bindings/platform/lenovo,yoga-c630-ec.yaml     |  83 ++++++
>  drivers/platform/arm64/Kconfig                     |  14 +
>  drivers/platform/arm64/Makefile                    |   1 +
>  drivers/platform/arm64/lenovo-yoga-c630.c          | 291 +++++++++++++++++++++
>  include/linux/platform_data/lenovo-yoga-c630.h     |  44 ++++
>  5 files changed, 433 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
>  create mode 100644 drivers/platform/arm64/lenovo-yoga-c630.c
>  create mode 100644 include/linux/platform_data/lenovo-yoga-c630.h

-- 
With best wishes
Dmitry
