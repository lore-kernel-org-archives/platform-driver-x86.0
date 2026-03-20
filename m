Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6A39900C
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007904; cv=pass; b=SK5zyZW6ucyxsMlrcUQZ4WqoBSs2yvPPIUKzLIBLTV7ps4J1fA1MC1I/oK3iIw4VeqDtUali79tvSTP2j9gehIIrjPYEi6t53gZBx1+SCVuYEQK7yAjUuhSahV6Ek+vPzGlm7Pt6VNMee11u1JINiaxusACGXLwuZOG9poqO2wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007904; c=relaxed/simple;
	bh=ztq0XN4yhJhZ+H+SUKom44LN5xT6zJrtq7WhpYvj3oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ka+8giCeV1pjo91YSSTcuAkp0PReMRNwWRVvYKUM9/vkTP9sLTbgci+om6OF0pbRpgZspr2pAkZR1QzAwNA2wKea6n8D7k7XLGvqrIwsXcetsXezWoLIKzV6GAW+GynQOT3a+RptF0wrYZpGu3M5yZ1KpNQZ3DKh7HQRsvA+MkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkzMu99K; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkzMu99K"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b982a80317fso70371166b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 04:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774007901; cv=none;
        d=google.com; s=arc-20240605;
        b=QCxLFwHmkEBbZZ02xigX+xB24PdJUyiiWr7S+0GgNBSBADLPY8q68tzJpue7hWAFZj
         rjM7yXYVg3sm0P62O+YJ08XVRninnENX7ffjVMkjbFypbRDBcYrn+U12BX60Bcn7B8DU
         ZgLdpg0pO/oUoLkbzLDe/K4sMOihPszm2voWXDD/vhNOIfVX3s5qMxNfumkYeUtbsW2m
         iaHfllFTCn3dzFVHlcwGxlivT8Rx+3+mMdf7lgin3nVLO8p0hkFGKqZgH0C7yhy0NCYW
         PYimFv003HdkkagUv/Lq3BfbVtIusH4sux5Xr61GrXCUHHo+ixBrQRVG4N1twff8L1I1
         FrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        fh=jw3sQeh2ZWnAtudSEVcl0udI9yaHxEOvGYfSRImQnXg=;
        b=RNK0AMBloOV7DV/2SHIe71xFjDU2kvIq17QMX2dHHzGUO7jW6r9F+DINnyFe6sJaLg
         gq9BFf7WHTcw8fUQCB/IGTuXQpJEFAKLDywaZr58ztYx/L7YcCS/i1GXLH2jNfru0pCm
         N8ncir42xtwNDBEnIw2HP3HKrveG4nN8wLOUqeHFohOZrLbScSDQWA6FZeWm1Kc9LXsg
         2XPFCbZQpZ7x3yRdvyKiQcoNJNm8pwH3yWESx49jCNCKcjZ/seFOwmamkIVDvmHhrmMH
         WvIgXRVtbVbmnv8W9OgfSjFES8Dx66UZBXny2EOGQ6+p9vsMmnmdbYkxjD6kSOEvIYCg
         uxbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774007901; x=1774612701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        b=BkzMu99KzdnGQJAXCGjuv4jHiuFBBxizQjqlNc2E8gAFx+W0OmFKk3GCKjcscZWGMf
         AEAwfSp4j3yP80RMURiWvn8wcwC271mMntU+a382nqZnhKSQ2xjfkw5fx0Ap7H+LEwsS
         /EDMrZv8XRVtTYy4vr+wgB0fL2HohUGv13HIe8HRPUb+mJG2LbW2zTTZijPG9CUEddj+
         xmXmvCKFWK8LX55viFgmpfh1QZoA9XiZdTLu7HlEHa3pGT5U+jG7sEsGgDvtj17A5Dm9
         8UJZaZYI01VdkQ5zZs9l5syPpIwT/mXn+ndEfIvFIIUb+CzDoPZNkpwcD4Odv18pVPfX
         RzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774007901; x=1774612701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5eNfxooG1gP7hO3DBkITDlnLkQZIW9n5lE1qr674V4=;
        b=h6SZT6R4g7tKk7+zXkS0rZZS86DaE6+HmJwbo8ZD8XlKJjn0W7dEptixrPGtPhB3kE
         H7ebRCFeMw08YsA1J0d6T3DaGrGx9RXyOPfFEq9uzDquAxV/pwGrKNa3CTfjgtkItJu3
         STzOqOCCYxpWL7Q7xdTNw2sYhRRsgrUxZYFZIqhIPqFMJf7bYU3JX+sWFcfHmDU3FSYR
         XzDGMaOkPtcRu2Fxr6h5NSvX/ciTHiGb8bm4b5OvCZXEA4Qyo5uK62BYg9aqUga36H+B
         2eo8SPZL18fd/gOnuB12YdofB2Eq9/b2sDVYleg9RfmB/8eyU6vpspTLH7mf4z8rx+iz
         u8qQ==
X-Gm-Message-State: AOJu0Yx2Bomi15iesZfhTzho9Zou+S42eRe/BFP/8xAHTJG3453xRYDr
	2jkR0ThK9pke16sMqbSQbpxB+esc0i9jDFPzmozR6XMwbcmDr9dx6nlbsNZiNWu9zKRo+S11bdP
	drvOJXsWrS05JTISpAlurQGCLoGa0x4o=
X-Gm-Gg: ATEYQzz3R/CDSakdQKcSqWmF67hFmdTM+zVq+vqudgUwD31kxDIBG75+cFGsJPcizJ1
	ltLGdRWI05PzQcGg56Duw6mpfbXX9ygrC53O4Plm9AiwKIee2U8bzvRTJ0cuwQd8ICna9caLcw2
	dzUMyuh4DFzHaf3tEyzOg/63i1vcD8k2xhxyLLCvc1I/SMZauxBBVfACJG8YUiEk/26MO/yp7GH
	cBI+0VUUMznBktBzPY48n/dUJafLV9vySdfHKifvwKu0VH34Ipw0NeMzfq7qGc3Vr2I1BhxnHSZ
	WIJRzpSAjY4RzFamiqBflCWZLPMCNopP4B6tLlgcGjip8XaYc60OgtSzLcslwcFUjXBJkStYqc9
	yPssKy5Y=
X-Received: by 2002:a17:906:f28c:b0:b8f:e98b:4952 with SMTP id
 a640c23a62f3a-b982f33ebe2mr151584766b.41.1774007901031; Fri, 20 Mar 2026
 04:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
In-Reply-To: <ab0UvRdDpvZBiNsC@spark.kcore.it>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2026 13:57:44 +0200
X-Gm-Features: AaiRm52eDeLeXxl9ybPEeVXHCO5iKWVekdEX97JVBSSAnhft2AarkDF1CXLc8b0
Message-ID: <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
	hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com, 
	andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:35=E2=80=AFAM Marco Nenciarini <mnencia@kcore.it=
> wrote:

You sent three emails without versioning (no new versions) and no
changelog. Please, slow down with that, it's quite confusing. The
recommended period between two sequential versions is 24h+. Also see
more comments below.

> Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
> GPIO resources with type 0x02 for INT3472 camera sensor power control.
> This type is not currently handled, causing a "GPIO type 0x02 unknown;
> the sensor may not work" warning and preventing proper sensor power
> sequencing.
>
> Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
> approach used for similar illumination-related GPIOs. This is consistent
> with the original proposal by Hao Yao [1].
>
> Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
> OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
> bridge. With this patch applied, the int3472-discrete driver no longer
> warns about unknown GPIO type 0x02, and the sensor probes successfully.

> [1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/

This should be a Link tag in a form

Link: ...$URL... [1]

> Link: https://bugs.debian.org/1130114
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991

These are basically should be Closes: tags

...

> Cc: Hao Yao <hao.yao@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>

These Cc's are better to be after the '---' line below. The Git
tooling will recognize them and use them in email as intended.

> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>

...

> +       case INT3472_GPIO_TYPE_STROBE:
>         case INT3472_GPIO_TYPE_PRIVACY_LED:

Hmm... But strobe is usually used for LED flash... We probably need
Sakari and/or other Intel camera guys to elaborate on this.

>                 *con_id =3D "privacy-led";
>                 *gpio_flags =3D GPIO_ACTIVE_HIGH;

...

> +               case INT3472_GPIO_TYPE_STROBE:
>                 case INT3472_GPIO_TYPE_PRIVACY_LED:
>                         ret =3D skl_int3472_register_pled(int3472, gpio);

Ditto.

--=20
With Best Regards,
Andy Shevchenko
