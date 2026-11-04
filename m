Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782238;
	b=ELGyIxvag30lZRVHC1wgqYxd3ogIE3CbS7abCmTExfYPkKqB4o5KRPKYexguJGh6J55n
	 CPDPx45+SRvxyPCxRItpw1Fhkv5c9YW4bOSkbEDoETxE6UslNeFPbz62isn51haF4vZeQ
	 zPJtLwXPvRU+oSFnxG3yG5IrBX2BVYj5p8wyL47zbAP1MOzF8CbLZCzHmM4KTvZ1Ni/BJ
	 /nuXRyLrD6BfK6mlraXzrnnrGm/jy+YYVTaaUOkW7IfBoLMtyU+BB9kZPGKBVDmPr1yAI
	 9Tv9ilH5xb+vWWvkt3l+3fxGiI3nc4Ugsg+8bNojO+AmXoWdub/XlRNokLOML1au1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=wSVxLtlZScniw6EUHHIrCuh1CNxIw1v5iTXVGkIurHl/gFvBoLeVzbuymLB4shViyf5L
	 Jm6aO4G4atTQRtbxcdQBnsymfYggk+Gb+qWytOHOAdA309rlHhmAnD39tBun71yhGoPsE
	 j9p71XQSTpuh5NSw5XVkQ5i0oHH/gSehSiTUW8hCL61ewh1qvuIQiFOK8DEasp158Wh2b
	 omxhE8CaXrFCQhBU4QU7W/3IHoZ25Gj33bgphoKm7CGsD3WwP3xqF4W9YiA5Q5oiEqWQt
	 6+WjG3PzyuFa1GEP16ije9WMDX7/bNJzBgMIOeBIA3DxY8PoWvYA5/fKTQdXqWGdqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9B606A32D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A9B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso5441441fa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=jiriA+cAZNCkNCe34psmI22kXZO81OlGMcxwAoE8ITVGnRsRHwkGNisKGLyvcfyWI/
         KaSNnA9jusys6f/me4KQRDxE5a/1xv42iXBgBwxa/6oUaxbJtjvxmV5ITOv7FAfvSXVa
         DAfRq4lQ5ERjJ7glAKeeaCKOERHTHk/dTy9A727URnxyTMx3kkRiuNwO12xrLczkv2v/
         cEcd/AgNjD7oA33hLXGOe56cXDpsCI34pqVzjzJVSBVaLA1KBwKXjcTQERGEWyyL+G8x
         qTpUW4HAHQfi9aZOD6IDoEixjzDcwy2RSg9DCulCvEVU8gK+iMR1Wf9s098WvocYfyKa
         TdIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/wQf+dgOJUQOv3zrQE64jNI1VSrKIiqD7IXP4j4D6lboBaN0qmQgnTsEDoGZQ3agxbXsYyr4Xc+G9uNoh60jaNK9A@vger.kernel.org
X-Gm-Message-State: APuU4Z835HjGs+rKT6w3al/gd8cGg3XK3OuoS7dTWZ2CsTasybduyG/f
	PYHZatPVnGrM2ErbcVThLs+YDKgA4Kh6MxtAM1NQovlIYwMXJ6jO4X0rcgg21j3oQmE=
X-Gm-Gg: AYBFou2EqQ4AYnH/MuHU/MxQ6pz42+BX45UUSwEO272j7FbwTkHlhwxNlKqTEcvu2Gg
	a0KGXMYgv25AA8DkD2hQsivrVe/r8hJ5Mui1XJ1NIzwcVPsTL/9VXpE/45jn4TAZgtuoF0/pcCm
	Z9nmeWRLlAeLgVHzMPd2nFwIiZ63gfdU5+k0LIZfTNiqutGJRwvTV7damVBwGFLFG77pUCouful
	vr+vWYNrJCriZqZTmR831pEMJslxn4n0d1v9k85iU1tSmnaDWwo2LAuf6szHGbm+Df0V007UVNn
	D4bLLYRMbmoCe5CziF+jvBXW7BSk03UO2aXoJugxSVNr1Mt1QRiLs2JAcCgDalZ0DtLsIA62cMo
	tQ02t3swAoYTQqw1JxNQBge30+lV1rF9I2DHTff/TIAh/tATxX58yjocmblnOaVAzwe54R/bIr1
	iOZHILuPvST6n0zcPAsc1c9syRJUms62ipgkqmxPUezAmaHWO1VD/h0GacUbOj8hqrwvpYFV9r+
	GOgPOfdn7jrEqIYhT2lN2LwgIWY7GJGKFBgmoCMrZe/fiPiInFPyihkLxzH5IIB8vBUIWeyqrUe
	qu4FY4RrrdcpZngmcorJ+Lm783dKqEf3Z+T2fGI8efjP+GBZuO6tj28=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
