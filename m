Received: from mail-ej2-f28.google.com (mail-ej2-f28.google.com [74.125.228.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB04E4C51
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.156
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626367; cv=pass; b=MkxSDXIFowgW88j4QHkRJW/eTRCKdJMVQZC2Z4bLbE1ed9h3dG9L3MJwcexO15YzxKef4w6q2HKqwfrBryXez/nPgSKFBze/KRUdyHCCWa0chfftrMfLpu6ck1AcuOX+U1xI8iXtS3RsfIikZrSOU8rqsbQVTxcoZsFK0clHX1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626367; c=relaxed/simple;
	bh=LYplrdyBy/ve1B9b3/A0Q3qNi6+XTJGeLMxYSFaxX+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1dStIAovz1ZcL2xZh1ddSrRH9BL0kLTCNkprSbodALYTEZOE9hlcgDu0cQy/n92LhHy2O0Luk5f39mhcrygXU1FrSXW0stxCcuGYDTaPuuPkuHAyoisPypOxR4o4OzqG7PjDsN/DSfv33CHZZL6p63ppLPT+26S3cDIYrWxqWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFd+iOdL; arc=pass smtp.client-ip=74.125.228.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFd+iOdL"
Received: by mail-ej2-f28.google.com with SMTP id a640c23a62f3a-c2af3701927so501602966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 13:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790626362; cv=none;
        d=google.com; s=arc-20260327;
        b=FshOOM0swd44sJPNAOv2b06HETIlZzrxy+awjqV8NeZ5M4F7hEASR4r9k1f45FlZvt
         OMlXzgXOmQggQ+zmv3HzCCAUxf6U32+FqEYY8KT3c0UUCeVhkdrGpN+UY3KYbQbnjwep
         38/abOnO6B8F3MRTBvm9b2euuKcWavjUO6ixYr1POXWP0MWL61fdCQ95Sq+yPsw70ErT
         eI3MnjwMqmtdul0O/AqYQ7raf/C2qJHJ8IZe1n8pF8Oo2L/K4glyXNBhGcWnWTwHTDxu
         DGMIaNTaF82hUSVV1P7/3W+7yaFXR7mtet9CUm5UCSAwu0RCB/tGLy0eHvWxaXTiZPIY
         xvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        fh=nXNucjUOKbrtC35NgR4yRVpmOdaxdu2GiuYoilRMFGc=;
        b=sEEbW9i+TWqCeo82K8TS99nQgT0HFH46Onz8EuhzYdJhcuGvw3gBaFxmg7pgtJ07DN
         qsTZhWpTrhRsKJZ9zLiq7B0KQeRORM50kCChnbZhuX3Olc8pwqlxE5hQ385Z2XDhDvNM
         7H+23k/M8oekrAzPVtYCCXHRYqG02dunCR3STPrMPLJ3iz6zA1MYzFbhpbYpHmWCHsWv
         HfJON39A2lJFt2PQ4+N3Yj7NIuORClbbLBPBMr2ZhGtWXxibd+5/KjtUnaW4Pv+j6RhI
         DZxNqYm0xJ7qiNBi2ywHWMUSSdf3DbjQ/NDHoI2jjGuOlnRFVxbJWKW1h8FBgZEFeXh1
         4DKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626362; x=1791231162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        b=cFd+iOdLI45sRnZVAbchIr3Yj+myKDsj5iXol4CaUTAd0+IT9u34qXPGCOmkOQjKtM
         Qid/vorez+NvJnemvwo2x2MWLzXCM3Xxsh/rnJ1LV7A5rNAG8ayU0ePQ9mjpolagtrWl
         GU+FIAUac8Gr2JfE6YqhQ8UugaeWOzCdJJkDbYBVafvk24vyYsWkWwXGKZPEhHZM6Lia
         OaPGHcX4RFzw1VUxmAT8LhaEKMV0MQCwXwdOoFLQbbEfT9PRYR3uJrCGuxwJ3pWOHyqZ
         yf7xtF2SBhqopJXiZFdQhChCd5Ycgcvd0h1F6/0B/LvLh6Yx12O6G8yM2HfBwpaQc3gk
         U3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626362; x=1791231162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=op3YdKxjJPB63dQXpqOAe1ZN2m+ULaXvCzt5oEDNYyM=;
        b=xZGlN/vtU9ZIEM5Arg2gn9ntphp66pkAo1h13msIxk7+0yVhExyMTXEErgcX877J79
         Y13pKFjNeC7C7Vl98CoODb3lE/pH01zt50ZnVFWrK3hmlo3XNmQR2yMSbsNU3uBp71fX
         sDlK8xdPlb+INCmPcyTgwkm32dhWTnoRKxcAOUwFS3CUGhJB74+NFhYh0fi2yvUwQqyk
         1VPrmgf0D5ms8YXC1HUoo+pfw09HG96yEIpKnFPsfDMqdY5Qunj2WOO4ujqMQiaAH79p
         Y5Me4VEALBCRSnFzsQpSsPmpAJZa7Y2oDI9wXvDKN2Avini/+awkuq/KBgTyzjvWkmbV
         dbLw==
X-Forwarded-Encrypted: i=1; AKwUvBzov6GiT0jHK3ZShFAdJPulZcYmLZ7dMWFz0CeHV1JiXO6WaWspuHp/JbXNTcu3TjoGRiR9cXytUXBI4RY6bI6s0FnK@vger.kernel.org
X-Gm-Message-State: AFuF++kjt08MaoYpsuYfNGfbxKdelMVOVD1Zb0avajmJA6j3sYACbemj
	7thUq4e3zhv6aApvos8poOtgihcgZ7csIVU3io6TvA6/i1hwiUEsXIb5qA53uq5Ks9En4ZCEwL8
	k3WEcvc7OIG0dfEzzbgQBY/GD0UbwZbZZgdeINch+ig==
X-Gm-Gg: AYBFou23cr29Oe1KCyQurKQhiiP5U7aPLKTfvlm3S7pO3WoB1oUJU7b2QhvXrr7xtoe
	j0Zd2dV8/lG/76yJxdXS62MUDRfHlVPq6nSRIh3CVpeyxGpwlGKRAbXK5p5JQ9ndJfeBbfX6+Vm
	GByze71mIwfx7fM+MNwI1qvCnHygfTH4Sw9jgxHDlrY9153ffNDgoLklhYpii7ZYcO7tLpaKH6t
	Y7yJ9sxCBZ2jvb6jFzUeRhLI5R4xnY56FbIgSYLeFeLiD2Utu/fQ7OL3+NIsTFJ7VzS0SIKIpLe
	hmRY79JzcycJFV981VnNMzQkEfdwp/lS3e0Obkk2cqa08NGTPVk1nkdexUoZCD9gOCAdiihXzqq
	Lag//DfHlWxj+0KW4awV7ZBItCBOii9rJahDvpF8=
X-Received: by 2002:a17:907:e8d:b0:c29:f5d8:9c7c with SMTP id
 a640c23a62f3a-c2ac22cb147mr1134942566b.43.1790626361635; Mon, 28 Sep 2026
 13:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9d60ef62-a53c-bb13-ff6a-0a195cf2f6f3@linux.intel.com> <20260919060037.84602-1-meatuni001@gmail.com>
In-Reply-To: <20260919060037.84602-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 29 Sep 2026 01:12:30 +0500
X-Gm-Features: AclHuK9JUTRFiE1kmA3vX9iGMdGDyovU-rO_D4_8LNq9x5prseHY4a5bJKiRjAY
Message-ID: <CADqcGBm5r0+t44E3fyN5Re4+nL8hm+XxY9knQVqGUy0WmqVh9g@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: hp-bioscfg: fix 16-byte heap overflow
 for empty auth token
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Josh Snyder <josh@code406.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping.

On Sat, Sep 19, 2026 at 11:00=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> hp_calculate_security_buffer() special-cases an empty authentication
> string and returns a fixed 4 bytes (sizeof(u16) * 2). But
> hp_populate_security_buffer() does not special-case that same input:
> for any authentication string that does not start with BEAM_PREFIX,
> including the empty string, it always builds "UTF_PREFIX +
> authentication" and converts the result to UTF-16, writing a 2-byte
> length header plus 2 bytes per character of "<utf-16/>" (9 characters),
> 20 bytes total, regardless of how long "authentication" itself is.
>
> The caller, hp_set_attribute(), sizes its kmalloc() buffer using
> hp_calculate_security_buffer()'s return value, so for an empty
> authentication token it allocates 4 bytes for the security area but
> hp_populate_security_buffer() then writes 20 bytes into it, causing a
> 16-byte heap buffer overflow.
>
> The authentication token used here is the current admin/setup
> password, which is an empty string by default until one is
> configured. Any write to a writable BIOS attribute while no admin
> password has been set reaches this path.
>
> Fix by removing the special-case early return for an empty string in
> hp_calculate_security_buffer(). The generic calculation that follows
> already accounts for the UTF_PREFIX correctly, which naturally yields
> the same 20 bytes that hp_populate_security_buffer() writes for an empty
> string, avoiding duplicate logic for special cases.
>
> Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
> Reported-by: Josh Snyder <josh@code406.com>
> Closes: https://lore.kernel.org/platform-driver-x86/20260402-hp-bioscfg-o=
verflow-v1-1-6985f8c9e67c@code406.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> Changes in v4:
>   - Straight re-generation against current mainline: v3 was written
>     against a tree state that had a duplicate "authlen =3D strlen(...)"
>     assignment (one copy meant to be removed, one meant to survive),
>     which current mainline does not have. That mismatch is why Ilpo
>     needed "special trickery" to apply v3, and why the manually-applied
>     result ended up with no authlen assignment at all (reported by
>     kernel test robot). The v3 diff itself was fine, as Ilpo confirmed
>     ("authlen is not uninitialized, so only the early return should be
>     dropped"); this is that same one change, regenerated from scratch
>     against the actual current tree so it applies cleanly without manual
>     intervention.
>
> Changes in v3:
>   - Remove the special-case return entirely instead of adjusting its
>     formula, avoiding code duplication as suggested by Ilpo J=C3=A4rvinen=
.
>   - Credit Josh Snyder who previously noted this approach.
>
> Changes in v2:
>   - None for this patch; resubmitted as part of the v2 series.
>
> Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.c=
om [v1]
> Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.=
com [v2]
> Link: https://lore.kernel.org/r/20260818191120.38556-2-meatuni001@gmail.c=
om [v3]
> ---
>  drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/dri=
vers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> index 4d94e48..abf8ce2 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> @@ -47,9 +47,6 @@ size_t hp_calculate_security_buffer(const char *authent=
ication)
>                 return sizeof(u16) * 2;
>
>         authlen =3D strlen(authentication);
> -       if (!authlen)
> -               return sizeof(u16) * 2;
> -
>         size =3D sizeof(u16) + authlen * sizeof(u16);
>         if (!strstarts(authentication, BEAM_PREFIX))
>                 size +=3D strlen(UTF_PREFIX) * sizeof(u16);
> --
> 2.43.0
>
