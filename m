Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1C37CD59
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631308; cv=pass; b=bfmsp1XS9d3pzj2RbLAd7kGTR632C9q45heb/r0Zkz2xehPEuKfPQww2EiBErow27mdchDiZEKe6ZAluuANdSRFCt29GZ6N5bUxSQI2p+FM1R961hQDUakCStrSeP6TfbbOxxDWVuafKE1DdQKO5K6X/n66jjmRNC+JlPign/kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631308; c=relaxed/simple;
	bh=vzJQ85GPqKFtTeBCXYuHKUzsnPT7TPrKjUdhJU56BoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKZnEB0D8KK5td3O4HIHn37KVN+FK6ujtyXxEtljbNGsbIGAD6UMMkGjOumGJmznUTuZFmfBIafHzR2rM+xOjDdzPTuoKdO4GQf+c8ZXIbkcqwR2ufCpR18gaBz/kj/5FjH88YA6iqL3oShBFfCwoT4sod89xFM+DWImx8qq/qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URNxiS6K; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URNxiS6K"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so382468366b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631305; cv=none;
        d=google.com; s=arc-20260327;
        b=J+X//xWawoj1Uqf/P1zuwd8CTkoprGMztvTlinif/z+40pzDVCzhJnTH4YRalTmAb1
         pv/psgnvDPiyQObSD5i7v6/91TrcdWNU8CKNrmqUBV5UzH2+NjMhcdwjNPggLv+VmUKf
         awudME4yzx2AZl68mr73gfCBWdWp9Nlor+rkwJJ6+KJ5AYHyNNwBW9pxyMlQfNWYmGSW
         DS+MIDppt7cQyPI1krsf0Zy2A77TwwRGAE02vVFWhruIE7iBx7d96knmD83tVY++psBc
         tzDq6PUG9MEjk6H1u9MN2bEB/nh3BvZ4dYWO5jUTl+N7jrVNYaJGN+eLenNJp4j/dfBT
         ZExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        fh=Sxj4fwxR2ZMJTwMUYUszLDFo3EjcHSY+Pe3ez0HS1KQ=;
        b=nPeFNAyr/kK7GvzN03avMTEX3d7uXzS8cPegBIGB+ferZDnjmImFHYDHH51HceIoDY
         9OkgoTN3m9waqz6gL4GTEZGx3zw/eOi7s+Eq2ZcA7pXp65I2O9IPHA2u0vrgKiUHfwC+
         gJycObpyGN4bgNwM8CARWjqb3Vh3hOtFoQsGLm0Xz56lyFJsQWtQ8ow1PuvhFx2KlP/g
         xvtF5dPNtonrmw/IAejpBW5lPRJnsErd8uAhlC0m00SDkmt/B9ZiDPfnSw0xwHbGxCF6
         D6H6lYzkyx3nXgpRmQYXnIZH7RHcAOlANWS414SlMWAUCYqRsmOSdGnrreqTwVhDonAJ
         xPmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790631305; x=1791236105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        b=URNxiS6KrB0BjiY8vW5pi3471D4ar4brtKl+SuMRzOHRw3Z9+IVokYEsFRFWaSjOdS
         gQn3p18H/PPrpgwZ3p4EiD1lPNYZZE0ndHqy3LSU5xz9ACmXZQ1BE5wKeIWAiVeSmWui
         NpyUGGtZGi50fa350yGn6V398YN/rVJT+ObA1n+0EDt+Ss3P2DqNOs62BO2a44MeWMly
         b7T+7zzkeWbpGBPDbTDjjL/jrg9FlSHExQ3uskbx/m5Sv1wGqbek8Dy1+K/t6X8Cs2eG
         SO0vHi/OGWMy5nKmp9s3NCq9hZ66GmleX3bcLfi3TIqEmcEvhtMt3L2zUZiNPe6BAZ8j
         s3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631305; x=1791236105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKH1VCmfZugQJTpZMRBvxmQ3C0yXJLdq33pyaJF/XR4=;
        b=wyCXp/HqYxos6YF2VoWO0Z6VirLM7gCuuC5RPpCHPaYRP2OfX+chyvhzJTeBhM09eS
         8Qbfz8uTrnsy1VXRqNgFYxnIKw1iYshv6BO0UvO6OYGzsEE0LRJr43NEgwbNsevZOTGF
         AUxwXHMS36tGT8xwL/DZjddecVmQjwP/7zw2m5mHLgG4OGvTb5oqJXn0Nl8EnYg824v+
         Cc2UYQnqMd6FRbti9LiCEYZD9e7RAA2qjZML3sRCdY4CLGaCfBDzlKjGfq3p+Iw/EImX
         3dAnmHbXiV9lijFjU4A5pKvsrPnBHJXDuHc8thP8V9Bj2+n518W6BlbeD3Pua9QNDkBJ
         JmPA==
X-Forwarded-Encrypted: i=1; AKwUvByo2zbn7wgugcUFI8dGDUQqDyXKvO9Seh4bRuDRt8tHKC7eOfcdBd9FQ0bvzojUiyZnMZL9VnMAObyHIGzAZDS8yco3@vger.kernel.org
X-Gm-Message-State: AFuF++mE1PZkLTRU1AAUz8uhwR4cHvWjXFdLvj07o2Ex31quexy3af9E
	eKvxWvpJ/HoKnYkIIU/Dwzrdu7hxUNKC6IMAa6f76N6LXRUvFxOr80yNFoW+cEYni8hbrXxCjNL
	Dt9O+DfMFaHxdM3xIPnul9dRcpCylru8=
X-Gm-Gg: AYBFou03svBwsbi55Dba/tK0UJIG9x3AuSadDwhBi60PwOGr7SuEEdgIoSor9stbM6S
	zK8+vpdyOjmF1cBs09VCWlHc7/8TTHPtaPVsRa2KBtp9PHEskw2sPCkSTo6iRb+mVkNaIMivr69
	dPCyR7NCFGSO3tNqIFk7jNXf4GfybDNSPZoBX9yoa9iE0sPYdAnzQ7sCfxE67GpEvQFi7upmt1+
	fmWxffFIT3Ixfqibul/kacjd1eahberzvgRyj/1cpd8pCbTZanWVHybdihFkgXEBHVj7HzBmcjP
	7BFCiAVWNlQzlSFcA/dQqgT+iKXtlzTWFwURc8cwCT8JTwKLSThcg3gmNT00ul6J/oXA/6q47KO
	2yh2BQ6gV3eQEj/eqt0p+06ysTPfQdzNPYpL88QV1hib8XoKPJHC+wccUsQY2Wli4aas1pge3Lw
	eNJv+WJ+KSrvOpHJ++V0DRxbA8go32O3RPi8YBDbet
X-Received: by 2002:a17:907:d789:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c2ac263bc06mr1090827066b.45.1790631305354; Mon, 28 Sep 2026
 14:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-4-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-4-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:34:29 +0300
X-Gm-Features: AclHuK_zWLiFRrc6U7vmxR1ZoTbaYKmfPM7Lz80sz5CYaEVPc8AD2uZZsDfOheM
Message-ID: <CAHp75VcrAo_XACcfcycaGyiEsDniBBzCGMyGLip32KQz82q33Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: hp-bioscfg: return -ERANGE from validate_password_input()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> validate_password_input() returns INVALID_BIOS_AUTH (0x0E, positive)
> on rejection. store_password_instance() skips the store on nonzero
> ret, but its final "return ret < 0 ? ret : count" treats the positive
> value as success, so userspace sees count instead of an error.
>
> Return -ERANGE, matching the sibling validators for string,
> enumeration, and integer attribute types.
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
> bytes to current_password returned 999 with no error before this fix.

...

>         if (length > MAX_PASSWD_SIZE)
> -               return INVALID_BIOS_AUTH;
> +               return -ERANGE;

Nope, ERANGE is for integer values. Here is definitely about the size
of the input string. We have E2BIG for such cases.

>         if (password_data->min_password_length > length ||
>             password_data->max_password_length < length)
> -               return INVALID_BIOS_AUTH;
> -       return SUCCESS;
> +               return -ERANGE;

Ditto.

> +       return 0;
>  }

--=20
With Best Regards,
Andy Shevchenko
