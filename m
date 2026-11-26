Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.196
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682909;
	b=Tt5qBs8XU8d9d4Ds/N2qYFm3KpUbH9TNtlpDdnFhKjsK5WbmsbRCwDQlJ3gOzE1Y+1tg
	 91MKLyj/GY+YPd1NGSIoMf8fcgj1CcRjwWVlpVwRvV+jakni/+NeGCCVTXU9CFpIM+J8o
	 YWSDnooP9EL5/cqTktEx4sPpMCyg22hqK14ISWSWF501hwOX0bZ/ZN0QefM4pO24RAtfS
	 NE1Lvq8dcECbZDqx+wZy6Lr/OXYFhsYMkOQ3dhNEc9c78anNK0ngJhtX/MDydH95/H3f3
	 SIve3ilZj3ynnXJl5wyV/VN/qpXM35n4cSFLOi0nYf+zJ6wtO5e+8klo5VqHLSzj0iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPdYs6vJCqBkUvR8U/kgx89YZgfci4So8XtWHpp1ZRo=;
	b=BFPuxjubrOuQFTCsT5/2HtLuocheJ201o6J20qbdWhi7hMoXXCJ0qYbynVHIBVXEgM2f
	 VfTEfXDjCQZqGuYRoFz6aKqnN+H9VzOgsjgeqe+h1E9LhFQzvqVgoIeCZVnRYvDYo0szH
	 /GIFDe2lWpfwkRE1+WoxGcbQcDoaXReBqbx/eh+Fp6OhQ8vKxqRcuDttw2rg8Ma1QaTYK
	 v8lgQasNr9Elz4G0hyxcUcynDG7vWBGjfndd5ta2+IiVK7IBgiR88WQNSFF1GfHJ8ZOvF
	 d9aJbbObpO9X6hxX3exvPaK8/1p5T3rI6/Q/MJf1+h7EOEOhUlV36HvStxQ8crpp9/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqZA4KNM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.196
Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF7606A326
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 08:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFF7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqZA4KNM
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-8b4d07494b0so76574167b3.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 00:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795682908; cv=none;
        d=google.com; s=arc-20260327;
        b=qzabYcPgLJH1kS06+XSK7kj7ssP5fLI++cysLHiUnN+wQ41O6GtfBDj0PrN412SGmi
         8QInTV1H7UlbMkZjb3wvdSkT460ygyORId8ZrQBlMZEDwBXnkp8riod2P5CyWggXXksf
         zOnScOpCLkwuhMZs2Jgzz7B+lRZqADGDe8dTYemMAI+bZzjK/eJFHuCGKhyVv+H+uEn/
         GB50ebzHxOVV0GvxtASBMhT9jQHiqMj73OxRwpur/gtfUj40AWSizexnOTYsZUbbdkVD
         kzQfTTKfP8qr6XJLB2kSyKPp9ufhWF1DkyGTM8I732+3ahoE7BY2YPv+tAL4b+hgClg3
         d3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPdYs6vJCqBkUvR8U/kgx89YZgfci4So8XtWHpp1ZRo=;
        fh=X294bhU+gY8rShD7bTkmR8C8jwWIvK4uTPnltheZH3g=;
        b=Xo62m1sLAl9E3Zzbsxc8sHc9PzmINxGs2yrcDhysw+A4Uwhe3/WV5a/nMF/rPcS4+x
         QD1ieY7P687eCiAPmpweohJUyIotl0LTqe29RflTwMpsFvgiR4zbMEld50FYt8VftPKV
         cq+UdcGauRaLqD9zsJeR7PJzs8nM7VV8HgeBtv9Qm3fZNeC+6VYAW7rOX3qYLMXPOaRh
         5bTRIDf9kMFlM42sb7Va+cYAkIPV/meLRYjMHmxWRr0NhJjQfMWal6EPZhenl/LqJr3p
         0IVwaojDRZAvJZRfrfVYShHRtgyhzXzTxluqGNSjP8LngH7CRNZvhUk4tCiZZQauZJVu
         KUVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682908; x=1796287708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPdYs6vJCqBkUvR8U/kgx89YZgfci4So8XtWHpp1ZRo=;
        b=hqZA4KNMjir4uDRbPdzddXknwBMNiZwUnWs1LyJYcmBdMyuPRz+A2IXaH1ZmoqPng9
         hoDkbzk1i8zEcLWa5o8/AgeP3KieJmt6J2aBc9/wys0KofS7JFcZSC+zqh9On20LDKB/
         QFnrLIPuAkfDWCtEBSHiabEIq0DXdykj9ZMlsOOFM0RnmIq8W+asLQB+uXhL8MwQkjeE
         UUIYEL/t/Zy7hd3i/a4qACtKVIGe6nUcTWB5f23vczw5Nj6L7D85gEdwMg6KeZzdh9j7
         4qcqKR9bjwZyjnjTq2btS7kn60CIlzpsGtnSL9d4gylpBnzpTH6KT4jYg++NjSLGtSV1
         Yzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682908; x=1796287708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPdYs6vJCqBkUvR8U/kgx89YZgfci4So8XtWHpp1ZRo=;
        b=2o9NrEFfMc5PBWriC/Psgc799lH5U6CiWZpx1EiCIjxO+H1fnzQY8MawSvh5oVAibE
         teLK4HlrZb+UCt2lYgG2qnKvn2o15tSpcarFAIO8/X07gBFnLgl9vel37w5AYr5SXAwR
         7WtBpmDUxR/1PjouxVsOcKzJgDzRq39xvmi7DgcWQKD1raTRJ2r6xSlPUG5W6Nx3hr69
         mkbpycjQe1pVkvuNfeIqJZgbY8uEwt1ozcaO3S2iOuo/tFofUyi5HpmkvujGJG+aYP5y
         ZjQKobzPTy6sAup7orrK1DmyC7P0x4BTqJxZt4A9+MjpfEKeBlYn4OIvQ3Iku1EETifV
         hc4w==
X-Forwarded-Encrypted: i=1; AL+hErELElGcN0g5eY/Gvwt8F/qQfbBrHOsCLD9ZncSyFhECa2dTUsoWucOR+PSD9r6eiflcgxoPOo2A6U+8WA2KsTYckfCm@vger.kernel.org
X-Gm-Message-State: APuU4Z+/7IvnVT739w0jdQfkhqXYtIfSdHcIWntIOMlMcOhZoJYvN21i
	Rg5nME9KGTDR2XiC4BoHb+zvq7ddaGRx7t/bWVCQQUlCVCmeAkBqRaDejgKvtMFdIfqnbXf+Y4a
	4renxQP9TT5tMf0UHiXZjBL0VBQ+Y/Ic=
X-Gm-Gg: AZFdTZdgCf3UGOsxNR7OmZCEHXYdhX4HfCTgO2GBG3pPitB4zDrypYcKyQAEH507azd
	dKEKPnQtuAVPdPUUx6AwLTu9GR1MrnNGSMeU8B2Rl4+eb4TTaAlp6BY+vgQ5NMeXeGxNTmRMBPV
	twPuhEY4Ks+NJoFyHRX48T+a3mWBXcJW3aLSChau9Z7+l1vNepzEIek7H35+2MX28qLXjTYdcdf
	RvZ9UVJ6GTb4SxMdka3+skvabxtKbnqRPMxrkDyHmmEbpctglyyA1jkqKQLZaYKHI272ItxA7l3
	vfMGMLK7yFu64PTcgDvkh/xPaOeOAwjNfNsDsrVeEvH4/xAv6y8vbRk3D3h1QG3G1H444cvenhs
	XfIo47jDmSfDZKiiSK4Zs4D/75UYi25t8lCYbyMfZHTjo3ZSttzwUAY4r3ro=
X-Received: by 2002:a05:690c:85:b0:8b4:c1ef:e027 with SMTP id
 00721157ae682-8b518e8aec1mr83284417b3.9.1795682908396; Thu, 26 Nov 2026
 00:48:28 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMnz_-Dgg2eCgZxcCaGuKPV=3-kCfg7ajd9w=vs2fGL-Cb6hvw@mail.gmail.com>
 <f1b7d729-771a-4fba-89c0-996a8a168126@linux.dev> <ce46d69f-2a3e-45fe-abe2-f643f683d09f@gmx.de>
 <CAMnz_-Dztuj3CRsxcVnfe2=OCB3tTJzK6Lu7-AKfkbuqn5N-UQ@mail.gmail.com>
 <DSVPR12MB66402023AE5250384B26515942BC432@DSVPR12MB664020.namprd12.prod.outlook.com>
 <CAMnz_-C02J6CznPD68GgWCPCWEDSGsq6hoC+AJhsZjw39H+hhQ@mail.gmail.com>
 <DSVPR12MB66402044074D6A8B1EDC584825BC432@DSVPR12MB664020.namprd12.prod.outlook.com>
 <94785b4d-c807-4465-84a1-25ae317df4b8@linux.dev> <20A82893-B458-43A0-A3B9-0C090BAF7F00@nvidia.com>
In-Reply-To: <20A82893-B458-43A0-A3B9-0C090BAF7F00@nvidia.com>
From: =?UTF-8?Q?Riccardo_Zangh=C3=AD?= <riccardo.z.dev@gmail.com>
Date: Thu, 26 Nov 2026 09:48:17 +0100
X-Gm-Features: Aa3M54qIOIptLLdBNDvtxOYX8Oy0vd8iLsonH3drtLVWoujSV1jV7wZxtx5bRBM
Message-ID: <CAMnz_-Bah1bg9mR-t+oTnDVMXBwwm9n3GJ3cPB=q-X2y+_=YUQ@mail.gmail.com>
Subject: Re: [BUG] ASUS TUF Gaming A16 FA608UM: working backlight device
 differs between MUX modes
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "hansg@kernel.org" <hansg@kernel.org>, 
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "luke@ljones.dev" <luke@ljones.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 23:14, Daniel Dadap <ddadap@nvidia.com> wrote:
> You could also try patching the kernel instead, maybe with something
> along these lines [...]

Hi Daniel,

I tested your kernel patch (the later version using
acpi_evaluate_integer), with these DMI matches filled in:

  DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
  DMI_MATCH(DMI_PRODUCT_NAME, "ASUS TUF Gaming A16 FA608UM_FA608UM"),

Kernel: 7.3.6-1-cachyos-a16test (CachyOS tree plus this patch),
no acpi_backlight parameter in the command line.

dGPU (gpu_mux_mode = 0, G40C byte 0x07):
  /sys/class/backlight: nvidia_0 (raw, max 100)
  brightness control works, no "Unable to read" warning

Integrated (gpu_mux_mode = 1, G40C byte 0x4a):
  /sys/class/backlight: nvidia_wmi_ec_backlight (firmware, max 200)
  brightness control works

Hybrid (gpu_mux_mode = 1, G40C byte 0x4a):
  /sys/class/backlight: nvidia_wmi_ec_backlight (firmware, max 200)
  brightness control works
  dmesg still has "ACPI reported no NVIDIA native backlight
  available; attempting to use ACPI backlight." and two
  "Unable to read EDID for display device DP-0" warnings

Happy to test an updated version.

If this becomes a formal patch, I'd be happy to have a Tested-by (and
Reported-by, if appropriate) tag with the name and address I used on
this thread. This is my first kernel contribution (I'm 17, if that
matters :) ), so I'd appreciate it!

Thanks,
Riccardo
