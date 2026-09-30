Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748951AECE
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 18:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793539; cv=pass; b=gKK8+d1eYxIOTN/78dJThHH6bXYMSn5r8hhxdtCz8r9U3hLEnNPojgrCqNicaoVWzjpn79jMcyE7h059eqwfaIOO59xcpJJEzEgn19sinhBhINXBQZ4DprMivwYMVVRZ6pNi6wYgkeri6xPJ7ojnTokDLOuCKZUa0MqqgUH5YZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793539; c=relaxed/simple;
	bh=NHeV94WugdmVD28bFMrZnAa3jDv81zue6/05rbrEI3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpFUGEzP0g6VmOl4rnapwcCfZWE28BKznLLsMYneIG4c8xtlZPKDgGYEQWeAZRMQ1/9HLXyY8JvopbmzOflxp70Xkm5gMtQvBPFQZ09DxCXlLfNSeDvQJvuCXajOzwmlxFEi3Yl9Qynj7m2+LJu9JDWa33bRVKG7+bJjkMZgx68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAg/Modx; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAg/Modx"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so173772766b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 11:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790793536; cv=none;
        d=google.com; s=arc-20260327;
        b=B1sWN7M6Wji2yhON4Bn3iP0pHvtDKcxoFw2SVjnFw+FLV7J0MZoy+0EUd+3DyPT9Wk
         emAySW9wkS8dEqeENdA+T5oZvy5Muq6DocReECiMblqzHWBXmIHcWYA6qMBTq5uQnXnG
         AnBjRsvacpzZtgblR4+ntXZbBD6Ye99sq84tTJOQY0xVaHSt5GpZ70VjvVKhpZhe/lfq
         6eO+nyPDQ//1PQp1bzju9NA5Dp2Z+hyyDRE+bH7DcDpmlFix3VgKwGM1a2Hi5cL4aefT
         P+KHrqJClRg/7J+ZV7abgPLF7BfwdAnPCY/RA5lgGbCMDA+hW/RivrNf0jtfkvwFQm8A
         Qtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        fh=SvoWkahu/WFPcQC867HuQfisAT++om4w5t42VgsmRE0=;
        b=OaykXwO7TbG+SlSA8jSxoDmPjGxGy0ijyrSC6q9GQkpahJHCs+l90YVr2yzsOT+ucC
         5SbxzvPOXHEOqqjjELJ1DEwJ4gM85GlsTSB9PsbbHEjF9gmk2POHX4mwl1mS65lVwFjA
         wE1tr+8ETkw3ioNN3C6eQNDqnGs3SyUfGIpLxZDEGwVVuBfvkv3pkvcEnwnWAJwuIJYz
         kyUhIIRCjPrRK8hC/b52vQM8+/UasYbOjNWjyg0d/GR2zCbpy9CZDIFKlDduDszst8/n
         5IFNsVgEdZWAVfxANIZzRB+QYctIDWEFyEMpLoJAmfwiSJrOn9cH1HoVKTHJIqxHjE1a
         Rx+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793536; x=1791398336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        b=bAg/Modxf0k68QX6jyn9V1xldXMPhone3+S4H+AL7uQ5fGFBfBTgxPg6jB0TdTVlNr
         yaSRPnUOzciQ1ttDaEuZ9RM9CW1pdWk4LyfxMAkFu/9vcbgXH9KqEYfGpkwdZoDA2wxi
         Smxa4Td2TO/TaAnVPCA14donfWy+bDTIyGlVA/CfYL8SOpercVLRoeYGCeiOw86V30eq
         U+L+ZiRXcx0IWFfIaIDiflAXQ8UKuL6o0+4ohEsu9UpqKK3agiiZHJC5E+32usS0Kh4u
         JGl5p7UVkwD4g/QLixUina1vv/1iFtDm7rosEc+I9GXqhTRK3CAPigIiTb/xrx0bObNm
         ptYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793536; x=1791398336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HI0jJLmE0KCx7SJ67izympvHFVqsl1F6acyVdnNn58o=;
        b=hMoxQlk9Dux0jIghPW9WwVE1+Cp2BI4u21ILXSO6Vi1OWpEl7BH2uf4U/uJHPlwmkH
         G3YPkACgmS19muYvzZJqoYBuThmHsVrxIZr98+r4FyairUjzUWa3DwVKxL70FDEVYLsb
         yll5GnEBIRUcaStLnseiZolOdWV5fFjT1B0qtGZaxP3RWKXy+LxsSonCFTJqdScYkCGa
         U2mNsVf+VyZZkFv6RtTJTzW6CwvAQwFhTa7zwaZ7m6JkAPagPOIbg9/pA9OFJzaB9pWb
         pmRx/oYcYnkHFs1+RZV/iMz9u+Kw6Bk/CRuRpmk6Xxpv/gO9HHfkgGs43uGfgnE/94Ww
         1Hsw==
X-Forwarded-Encrypted: i=1; AKwUvBy+xoZzqoBMhnj5vl6SEFP0orS8qpa08Yj0i/PIkPu/71bpPHjKNo6VeQLHjBLpvV4hDQF69CH7ftaprdkW80yJ3rTR@vger.kernel.org
X-Gm-Message-State: AFuF++lUuqEr73RFPINwaMYOcb1dfpVvCwLdQ0Q+dHlfxrHDYguF4r47
	SqeAr7/wShEecYXOGj7W5b/fSD3CtkTD7amnUE/V2zIPt+0SrDRgdPceM7HTGwmGpeyqUQKCv4g
	YvXZUlKmtXiOvYxABIDu7hqf8DG+O5POfEL+6fTjJAA==
X-Gm-Gg: AYBFou0xo2b6UkKbvJzyphZJjNwQg+JaTbFhMptDgcQBwPuSGBZDBtM/3n2l+2SxtQ1
	72KkeeOSUymxUO6m824qu1TuA0mBxcgwFtRphkfEAUvVGa3HscxXSS6IqOeT8s+JYrCVjdxqXzv
	1zi3r6kH3b0lyn99RiVt8o2kJsQ9ouXU1wOnHs2hXgPQYnBnxfD84ydmsDLsQHp6VVJB7W5XxRC
	fUf1AeuY2BPkYyYFkUdDIKY60KWmdCtmvN5z5+wp5f3gGa0d7Iidh8JAe9uy16hnawewPBRdb5l
	QaxHFu18Pey4uXMRppddLIUBKEz1q0pJ5HwqdWiFRcutzg5CimFr1HZhrxIKAcBzhHIwu2qZZQI
	CgC6x7GwLYxYCuNWp8Bl8tK5X2Q0GfSddiqox0nw=
X-Received: by 2002:a17:906:f583:b0:c2d:c57e:fab5 with SMTP id
 a640c23a62f3a-c2e33cec3c6mr41556566b.7.1790793536002; Wed, 30 Sep 2026
 11:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930183018.49629-1-meatuni001@gmail.com>
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 30 Sep 2026 23:38:44 +0500
X-Gm-Features: AclHuK9lQpT-wa7Q6XhMKeuCXwZ9qOLPqpfv3FTdw2GVk1xkzBB_NuWLafKSDzQ
Message-ID: <CADqcGB=tjzMS4xP8yDQrO5hKyoq0n=wDJNTBohdnDErDwK4gBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] platform/x86: hp-bioscfg: string buffer and
 password fixes
To: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Please Ignore this patch series, as I noticed an issue.

I will send a fixed v4 shortly.

On Wed, Sep 30, 2026 at 11:31=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> Fix string parsing in hp_get_string_from_buffer() and make over-length
> password writes fail.
>
> Changes in v3:
>  - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
>    and declarations (Andy)
>  - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
>  - Drop a blank line in the declarations in patch 1 (Andy)
>
> Changes in v2:
>  - Split the hp_get_string_from_buffer() fix in two (Ilpo)
>  - Drop the lib/string_helpers patch, use @only of string_escape_mem()
>    instead (Andy)
>  - Add patch 3
>
> Muhammad Bilal (3):
>   platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: fix non-ASCII truncation in
>     hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
>
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  7 +-
>  2 files changed, 28 insertions(+), 58 deletions(-)
>
> --
> 2.43.0
>
