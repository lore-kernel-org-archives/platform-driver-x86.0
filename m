Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE44347BB5
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766518051; cv=none; b=DRXbV8brlX9Fv+rQY8dhIiM7MyYmCm6Kff9IhL3ElKjnJh9vrDcFVuJCMlEXpUB9K96yVWfunaOFr7Dd/ghNiJyy6qrwslGl4d7SyWeIo0nt7Rs1R+bKLJMt9PSAL++1jnglhIDSP90tKwbtpLiCL14sWlHzi27jOBjcuxyIJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766518051; c=relaxed/simple;
	bh=pA6SEnll2coC8j5Ck3dzaHcEsnvUgi8wPWmuNmxxcog=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=l85HzagTy00aLTA9i8XKOUlO21WXkk7DMHR//M6nq+iIk786x54QZmaYSEeW4WMS76xVI/LLw29ZB3i/eLA8PcDUZn9obPVRLWD589YNGIXSwSUeUB1BwKSbAqLHl1xDxp+d0cF6ZhanE6DS1S6hrws8wYVRAdm91XO/7QfCe60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA8kzlx6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA8kzlx6"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dced861so62364171fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766518048; x=1767122848; darn=vger.kernel.org;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F49Uk+vOUj/TdSugQ6M4QBtLFO0ERMAdnr3doWPGvYs=;
        b=YA8kzlx6ggpjBhiicYsryUmQC5MXUHloBwXgUAoJI2wILiF3wbFM4Xp2k3+larbZXT
         h79bmOIWiQFbjiR4lZuUgtYCh0cEqqkZpIxrKXaK84k253vEvd0WLrdnP2EPg7oKWPrN
         qg1DmI3PNmlptfU3B0j59SpSyH+gLOyIG7zZy9Pyx254gpFGKYwrf6rSQEdhxTT5qWbP
         i/gb/TYG7r18aM/Ue81pj1VRd9bry6qKB01Mj3e3Vbdm+zs+50TgNYSRzM3zYQW0ORXg
         6klRXdnZE/QQhtzdYYn+MxTa15JewYo9xk7R3Z5O7G5BLz4b2Sxpnoaoo9u//sYXDIBW
         P49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518048; x=1767122848;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F49Uk+vOUj/TdSugQ6M4QBtLFO0ERMAdnr3doWPGvYs=;
        b=s8BkirxY1VxLsigq44xuna87n8qZS7kNb9F131pF6/yVzL2RRX/ewCNsvdcW47+M0t
         JyFpxAt+AWxQpDnK3OGjfxJ5CTEOSehZtywCydCUeWGIDHDJKs3fE4w3o40Pi0lwTmhV
         P1rObD7vdb8x6VV0jovrIHC1I2Cq2V99lehOWhP6CMTUfhOMg78gempjMYiIit1YtjgJ
         FvEhidx6qubtvG2ZLcyaD7+bb4VGtStLG3JKucngNzDrEkRmvAKa2DDrrqpWrkK0NGqV
         oPnmBt5/uMgpNCZ/VIdKvRnDEYkFRf6iFLH6sbdAJTHjinWwlXoLBhpU/wZKsEHMSwPQ
         vIkg==
X-Gm-Message-State: AOJu0Yy/6KoIj8/w2tjoVzlcd1PxYu0bzDRljWm+ARolbde7Yan0PPBZ
	/AylfgucJ/KJf1Da3T6e4GPCHLFgOksA+YLkjT4hzafxH5iuSkjVjlfuziyt9fcmsWw853aUutN
	FyYHC1aABBtif8IcOTjhu3i4PVCW0mARgEeh2
X-Gm-Gg: AY/fxX6PnTBtH3CEwRQy76wTQ0zv1kRgIGPBvF6OUvl/M2F1l9xlJUILWHBcVFlIodc
	+vZPrQeR6g72SpumrkvJxiiE6ucBjbqcFLjq8ZGkXD8Z4GxJOdl8NHdzfg40tccusaLGlzIR/cj
	4IFJrov7LjmiCFYb868e6zVKGVeVPI5742Lur7w+B+/xQErfr8hjmgLT0ec9K0GwYfQff2tkAqd
	lup/AbbRzbCyD+LoH93p8qMe+87Tw8RLD7NDisO9uDnUei+5NT/uxDo7cgCIwt1MFn4Yn0=
X-Google-Smtp-Source: AGHT+IH1/08OPvs961pctywTewE27IlPf6pyCpr4cE5I4UvnJPsbz2VOypHj6nHLSiqXVC3qR/KDfi95qnWvGbXocAg=
X-Received: by 2002:a05:651c:1542:b0:37b:986a:fc1 with SMTP id
 38308e7fff4ca-3811329665amr58848471fa.22.1766518047643; Tue, 23 Dec 2025
 11:27:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:27:27 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:27:27 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
In-Reply-To: <CAMEXYWdAzVQyiPaHnYgRsx70uJMLxD4rYbORg4VqXjq0tq7gMw@mail.gmail.com>
References: <20251223190844.944633-1-benjamin.philip495@gmail.com> <CAMEXYWdAzVQyiPaHnYgRsx70uJMLxD4rYbORg4VqXjq0tq7gMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 19:27:27 +0000
X-Gm-Features: AQt7F2rZfQd645CaIw98qNaCKaUf-CdwHTVQ1ShX2ZtGBnL0mN12SzhLovzYJP8
Message-ID: <CAMEXYWeGqq3_k55u3poOBtUQY3U6CxO1R3O--vjttap_=NCsNQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] platform/x86: think-lmi: Clean up types in headers
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Benjamin Philip <benjamin.philip495@gmail.com> writes:

> This commit replaces the uint32_t standard type with preferred u32
> kernel type, fixing the following checkpatch check:
>
> CHECK: Prefer kernel type 'u32' over 'uint32_t'
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
> index 017644323d46..6ea4bceafab2 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.h
> +++ b/drivers/platform/x86/lenovo/think-lmi.h
> @@ -58,19 +58,19 @@ struct tlmi_cert_guids {
>  #define TLMI_PWDCFG_MODE_MULTICERT 3
>
>  struct tlmi_pwdcfg_core {
> -	uint32_t password_mode;
> -	uint32_t password_state;
> -	uint32_t min_length;
> -	uint32_t max_length;
> -	uint32_t supported_encodings;
> -	uint32_t supported_keyboard;
> +	u32 password_mode;
> +	u32 password_state;
> +	u32 min_length;
> +	u32 max_length;
> +	u32 supported_encodings;
> +	u32 supported_keyboard;
>  };
>
>  struct tlmi_pwdcfg_ext {
> -	uint32_t hdd_user_password;
> -	uint32_t hdd_master_password;
> -	uint32_t nvme_user_password;
> -	uint32_t nvme_master_password;
> +	u32 hdd_user_password;
> +	u32 hdd_master_password;
> +	u32 nvme_user_password;
> +	u32 nvme_master_password;
>  };
>
>  struct tlmi_pwdcfg {
> --
> 2.52.0

I've seemed to have botched the In-Reply-To header for this email
somehow. Please ignore. Sorry!

-- bp
