Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9238157A6C
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734850592; cv=none; b=N1zuVubxnYlFU85aPMe5tyNSpjKPGc0QuzfhitzRNJAxdTXS2NBB/E+9VyHV9ZxVLBQcOYoTYDHt3r22/Z3uwYwz786nea8/DTdXdFEgpmy86SHswJMnxkf56pmbJZ7xER7Uin5rhSiVjLQUfNaGPTSnvY80VR3i2hVq/eJcTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734850592; c=relaxed/simple;
	bh=vU7pF1l6heBUnP6qKrqqskOqc+3QuAvIdb8UyQowxYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKWGNRWHOYp8YqWXgpqJe738x+8gtyVM/j0DLkFtyFzsiVi+3MV1Rfwa0SypffJfnps/hnh8Za+1AJzV/4ksfbI7p0KSdHzmckGJKpyzj0ABoW18YP6kLeHBD6Wd9t6P/nvFkqxiC1fOw4GVhpntBvSrAQYQs6+GJOIUKq3DjSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RHEMtPla; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RHEMtPla"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso3427200e87.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 22:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734850588; x=1735455388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uICukBIZbE2d2nD3/HaAIupMmSJIRpwO49vB6bNfkI0=;
        b=RHEMtPlaFtcxRFx5VOncw7cn1vluzvLxyoSm4SbVCe3sm4XnX8sYL/vZ5ITDaBDpQY
         6en80IXo09ee9SwwykS5ahJocEkP31mf2hNIUMgrL+X3mXXEU3x9Y8sC2qg47vWK7xM3
         wSgFbUV1l//yNttzgvELM1skty7mqGiuHGTGBhY+JdyfTsaV/fMTyQesKTHRvzu5EW1J
         gEdxWSiLn7SPufLjFrYCOae4IFR6pbmWbja5MQGNhWF0r5+eOgfCPMg/pm5MKDuhXj7q
         OCyWZ/rS1c6XpcKRIkGFrelSLtZhJEBz1ewKeUNaVTtp7Ldhdk+1b7xNUa80db3hPy1H
         EcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734850588; x=1735455388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uICukBIZbE2d2nD3/HaAIupMmSJIRpwO49vB6bNfkI0=;
        b=rNuLnKTWTpudBzvgNBoYjrPGfzBd+z3ngQOHHVJgDpHFYJkyNJ5Z/nXgDVXhEi+Mo1
         860s2QzKexFgMki9fq5M2zsxgAFd3Ic2AgeRxOuNuk/6ER1tfKpBPxp4D+QrTSj/T0Mv
         nZob7l8WQ1Rz/B1cb/BVkLAEmsV7FHOQjuiFum2rUpcKW7dG0SuS7yZBCRfm0BTG8hIO
         p474Dpvf0SLvY4GTX+buNRM3fflqPKCr+guNMIG8xnfilJI46SJHJahaKocK2VcHi44W
         Z35hz7Fl74VB67P4J/uYH4ec4BJkHaU6EZuH/7I0iYdvSB6zSxDs6c3OpKj+6IQ5/v6s
         IvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD8C/yzgL4QvUFCJ/caRuwyMjlVrcfexkFn/M5Nlww2nFiMj3Ou7TvjodlGoSBh7uuB7nRf0aeCNE9inkx3t7W1Kp6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw31FPYMrWEyOCS23ypo5gCJWqKIrhuKwAZmlme1lR48HOxVbh
	axQhH/y0d380KGlWP/h/kaxPR1mLml4+Zw7exnnEP4TzV0evFC+OCYUBV3C084Q=
X-Gm-Gg: ASbGnctkRVft1sm6M99IPk/qqshOK7TRXcVOcymGEEYC2oxRRzZnHzPW6n0/bIUcrJ3
	x1qV8qR6iUk83ZUh7JdHQiwizTv4lXvYQuLezzSs3XyKrE/Ij3y6v40dp+n6fGyWN198PwUfJLW
	3U2eDrJytrR9oxkTjspebXfWuMWiuEdRcHFIcPHCVn2zPrYC9vD+rGvY09kv/sFeJ7o3nWfmZnx
	9HDsVH/YBcw4oUImJnE1K8XQDYEt97vcZGrUBoTMa2l9NgyDgePMz9eGFSOsfdeQZc6XiMHvpfS
	+bNH6ZDiQJgWvhfZXPW2ER2ZAfyg1wdbbPYD
X-Google-Smtp-Source: AGHT+IEWNp3WftkqK91RI0XeT7YHrgoXgpBtCCxp6/N91pmngJ2NyrecBHWdsDPZ6bj6Ped6tSTy6A==
X-Received: by 2002:a05:6512:a93:b0:53f:6c6a:f99f with SMTP id 2adb3069b0e04-542295224f2mr2827014e87.8.1734850587745;
        Sat, 21 Dec 2024 22:56:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236001d6sm911744e87.85.2024.12.21.22.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 22:56:26 -0800 (PST)
Date: Sun, 22 Dec 2024 08:56:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
Message-ID: <guwda22qwvvof6k64dsajaccrq5yfipg4dejycqfa3f6dz3abx@uc7evxnxcjue>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
 <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
 <CAO_MupK8GYwNep9k-C28=Ly8wgn1T6LLiYnFcbKg0spRNXbkYw@mail.gmail.com>
 <9d0324de-e42a-43b8-bdcc-0d0885434b25@quicinc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d0324de-e42a-43b8-bdcc-0d0885434b25@quicinc.com>

On Fri, Dec 20, 2024 at 07:50:45PM +0800, Aiqun(Maria) Yu wrote:
> On 12/20/2024 4:58 AM, Maya Matuszczyk wrote:
> > czw., 19 gru 2024 o 21:43 Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> napisał(a):
> >>
> >> On 19/12/2024 20:08, Maya Matuszczyk wrote:
> >>> Currently it features only reporting that the AP is going to suspend,
> >>> which results in keyboard backlight turning off and the power LED
> >>> slowly blinking on the Lenovo Yoga Slim 7x.
> >>>
> >>> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> >>> firmware with extensions which would need appropriate handling.
> >>> For reverse engineering the firmware on them I have written a Rust
> >>> utility:
> >>>
> >>> https://github.com/Maccraft123/it8987-qcom-tool.git
> >>>
> >>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> ---
> >>>   MAINTAINERS                              |   6 +
> >>>   drivers/platform/arm64/Kconfig           |   8 ++
> >>>   drivers/platform/arm64/Makefile          |   1 +
> >>>   drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
> >>>   4 files changed, 173 insertions(+)
> >>>   create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index b878ddc99f94..08d170e2e1e3 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -12890,6 +12890,12 @@ S:   Maintained
> >>>   W:  http://legousb.sourceforge.net/
> >>>   F:  drivers/usb/misc/legousbtower.c
> >>>
> >>> +QCOM IT8987 EC DRIVER
> >>> +M:   Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> +S:   Maintained
> >>> +F:   Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> 
> Actually, the IT8987 is from ITE Tech. As far as I know, there are other
> platforms besides x1e that use this. So if this driver can be also
> applied for all ITE it8987, it might be better to say 'ITE IT8987'
> instead of 'QCOM IT8987'. This also applies to the file name and function.

ECS Liva QC710 also uses IT8987 as EC, though DSDT doesn't seem to
contain anything useful wrt. the EC.

-- 
With best wishes
Dmitry
