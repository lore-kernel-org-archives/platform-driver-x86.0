Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792476517;
	b=eklOtEOmbJDmsCBDxpsYG4qWNO68LfqSoja+0FYItP3Vf6IQNMht4HJjdAZxtZv7w6Fi
	 PZWErar+FP4RS+dQ12whsVc2fLc/rF9qqRUC32KiP9W2V6kXRWYJ51vfMkUlfXpCf3wjt
	 1ALKiU9ufulTbV/DYPhwR4zBerYjG2vLTzWPPqPIY9D5cWYoHSs/VxDfPEyufM337O4GF
	 lO0yIwrOtS/BvVbtTVTPkuHhOyJ6X/K/FGVN6ZVPQ6FnNB06Tq14BGIm8WlnBWHlpeo6K
	 BlmYfSlYDtqxNLjBeQTH88pGYwmD4uBeEwpKrZtr1Yg4JuiqBDQOmGR4CLngMdYnEeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
	b=UHzivpjAhR+NW4IHeZsVESgathakmmGxPJgt9w3BYEWsXdUDpydBfw4LcbwM9CqkYq/k
	 kBY6FxspGibJLB4WdvFv6Qz8OFGgDZZtD/0tcdwCyuG8MqvK2v9D3PtDDydRinjPV5K7I
	 5/7jjHu3yH7ncZRdB7qVWNYaZwsD17AWvGaP2uGMUvtlQVMZogqFmkUdwIs873t7BUn+Q
	 SLCpE4X8r0RniNT37Iy6Uve1NzihDJgs37iJQvSabxtsRuyhzv0aFjOzYXngG3rQSlIn5
	 k1TDyYs4TuJotci79K9XDXQ+g9g6DVaK7l6n481UpLJvZJCtvII7puJTujksSTM74bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YnxSBBWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EB606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 06:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YnxSBBWH
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e30c26a4so49503366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 23:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792476514; cv=none;
        d=google.com; s=arc-20260327;
        b=dDX3bWL9CfMmLjXXXFC3mLUGtvb7/vN3gRmhTgAslo98arPD9u5oL+xVIg+tLsj5vi
         7ii1UKwm5ngpC05o8enzAswUuYxqbbbkb5/DwtXw4V3n9YGwl7Y4YyDCwbuBQl6vx2yR
         ycUfEBHQOnxSoYvRDbOSr/JEQI46jACK5isOoz6JxpHdfbRWanBgtwvpCCoVlQB5Jw3g
         Dz9hIYl5GzF5mwUIhjUpuEZsIxggDAfkg84NNDLzc5phmBxaxXtNOTCoyRVon7MhkMVf
         8FJD+vqlOG+MeMRqxwGvFerlsIk9HeWwy1O7T7qr98fZcQH0fGO2Q2tq5G3LhAKewNmo
         999g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        fh=KSJU1F7QHCvtsRrWJaL0Yltu20M+yfPw0aFO3pTL69s=;
        b=F5NqXkPL4bR+NKPx+gAnZ+N+epvy0ug0zxXEiWesl2ukDHBZaGCzRX8/MABzBc87Zd
         EAHGqJLWy/9DubTe3UciPDMVW1iSo00umcJXltfpa7piCFfjI0gtUt+eSzm5ghoc/8PI
         bFFgDpkXabJ9G7QoeyyoRRfZP+QLO70QJFyiME2tCt+N5rJlmKzSD2VJZPqpjSw4eeIu
         hS0LzXgdGQKf/0BwytpkuQq/21gTC8kzKbENHPUrQ+O/wB/ZBTmtKm6L8rQRcUppeLrg
         eK3nLVPcsaTPyB686X3jLulRGuFXoqDxfYwcDeGYVpxsLfqCkQM82PtfsFrR4cHxCHZz
         QcmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476514; x=1793081314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        b=YnxSBBWHVrkaUeSSDayl0uhIwRfnwEv+Puu+OwRyKnn8VRyygbSL4sIuZiFN4NLBEk
         g55xRjcFEDjfy+t7dQr9jS4AaAMIFyaMOiLAUkfsnnIZj6btEw+xrdnFer8boq8PiO1m
         IddtGJ/pXbmLF2Mf7Mn/e0MlAFgIchaOqt8Iave94DnR0BCHXrX4tIcnkgWCZiBKkgq2
         MlRri2NP9UDHQ1RWolaAbFRQKxKmlIFV3KmTfJOoWdVKpNGmKUevd1m0Lxm3SKplhtVz
         bBQzKsQLGy+KedwWvlcEp5x/0shubRY23DEOtC9Kdzc8DJd+dgzF0m/IzyHpm20jRqhH
         P0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476514; x=1793081314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoYOnbE8zEhaUTNNg5EvX6Px2rVWLGPe8RxRxFiK/ys=;
        b=m+re1yPj1jAq/0LqNhrpQDeYgJPf79q8eKAoj2ZH7dkv+8j8KzHal273NlbWcaUQw4
         0BdBWdQ7d3l4L4BIk1+8VWmVDLDrKZpoOnCsapgzXFLvH7pIBbeTd/lnOLkbG6HaruaI
         Gyamvx0tsypYXyhRYwEQ1hYmS2do9tob6Fq0etnOLs/VWaa9M3zlRcvzs30QA+H9mg1+
         GclmkKYez/hId+NzFoUJCGnnkEKRauvtqtuaXI7HVjpIF6rVAi7JoI5R/G6VUW1UbJcS
         EsVdraiCRtp3rghV7ed3L/De4U8GWdDsQyxj3rcaW71gOpL47MyaZrg9rDWaGmR3TzVB
         viLw==
X-Forwarded-Encrypted: i=1; AKwUvByuA/tDypM+yH4xjgRyTyEsRpwuEbf+PDWmgUD7stCSPEpJdJRNG74SdWMWWYGpztlV9oAEee/PUGdSUZX40Of4bT5W@vger.kernel.org
X-Gm-Message-State: AFq9FYK55/3d7045XxLcZBJQuo7ZZ7iEVJvE6an4gDd5m+VewZDY0sVM
	aWmD+wNdJVkkSryY6ZTqtA35WcL+zExZP3o9MIBxWULq4m0qhzL83QGCGs77sNFmZVa7gTj12T9
	u6PAGaMlof5u/j6KGzmjvNemA7R7B3VU=
X-Gm-Gg: AYBFou0bYh42tztYzH0f9w9sTJOc5EiHGUEYXYhLfvr0eLHXR95S0/5GQXkUlk5cdik
	CzMhh3ljX7tLlZ3upFi4V6TPbio3FZI8PFrhUc8CoE4T5uSMDFD8KQtSN9iUcTo7j4GF+jzapF9
	cKsI8o8uGAL1phaCswPoN2MHH/IwWV4FJQ8LO60yqEppM9ZB+XZyUXI76pc8DLp8N17ptk2WDD8
	TKNQJVWbuhJbew09hD05C3+3SBhU9eImEkHZkjM81kl2LIrcp60aY4oItq1i4fBGPzT0rAIIaky
	pAhzDvfnSPS7VRMr2OKk3CON50laCQlt5wjdwGQ4FF0qd7xg6H3XCA7MKOgkrFYoDrDJpDUDX1b
	JIRqkEq5qsPaY4H8huO95oGTd8Fv/SDnHJycRKXLHTCjj1iDkjNrKQg4EHT6hncKMQrcAANBqen
	vWtX4kTRTzJKRHP+apGeg/E/qQY+AsVZ2kX0OzZ7/T5ArB+M4I2Ic=
X-Received: by 2002:a17:906:478c:b0:c2d:b9b4:f4de with SMTP id
 a640c23a62f3a-c4604ed9efemr80609966b.18.1792476514274; Mon, 19 Oct 2026
 23:08:34 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-1-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:07:57 +0300
X-Gm-Features: AclHuK9mxBlfzqPJhisR4c9pDdEzb9nRSUMVCy6rRwKN_GMG2p1UiXDepmzcr-k
Message-ID: <CAHp75VdwhC_T+7NNroyqQH_qhLW3Uzi97VmLVg2_WT_4Mu7ZCg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: ipu-bridge: Add sensor configuration for
 OV5675 (OVTI5678)
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> The front camera of the Dell Latitude 7320 Detachable is an OV5675
> described in ACPI as OVTI5678. Without an entry here ipu-bridge creates
> no software node for it, so no fwnode endpoint exists and the sensor
> cannot be connected to the IPU6 even once a driver binds it:
>
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
>   intel-ipu6 0000:00:05.0: Connected 1 cameras
>
> 450 MHz is OV5675_LINK_FREQ_450MHZ, the only link frequency ov5675.c
> supports, and matches the two data lanes the machine's SSDB reports.
>
> With this entry both cameras are found and the front sensor appears in
> the media graph:
>
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
>   intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
>   intel-ipu6 0000:00:05.0: Connected 2 cameras

> [Rebased onto next-20261016 and adjusted the comment]

This should usually go just before your SoB line.

> Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
> Signed-off-by: Alexander Patrakov <patrakov@gmail.com>

> Link: https://lore.kernel.org/linux-media/20260809042540.15849-4-adee.sah=
an@gmail.com/

What is this Link for? There is no reference to it in the text of the
commit message.


> -       /* Omnivision OV5675 */
> +       /* Omnivision OV5675 and its RGB-IR variant OV5678 */
>         IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
> +       IPU_SENSOR_CONFIG("OVTI5678", 1, 450000000),

Please, split the comment, id est leave original one and add a new one like
       /* Omnivision OV5678 (variant of OV5678 with RGB-IR) */

Note, there was discussion at LPC 2026 about RGB-IR support. My
understanding is that the kernel lacks it right now, but media people
(Hans, Laurent) may correct me if I'm wrong.

--=20
With Best Regards,
Andy Shevchenko
