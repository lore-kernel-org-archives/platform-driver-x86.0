Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF1A4519AE
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744058; cv=pass; b=kLrF1JdNSsx6RyUUxRA78+Q2uW3/rHj1NtXbHZhvYAUHbii9Zc0BSqCmDJajz4rUQjs5QKgxtkqCECtJQZW7zAirvDCTROtwxbsDsOVtDCF3dQ+9CAJJjK75Zh/P9TEiVyywrVuI5LBhvGn1mEni5qGlYPJlIjclVuf9G/VpY+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744058; c=relaxed/simple;
	bh=ru1HcpddrF7ZhWjbyLCYjSKdq9ZS1lfVzrbw0XuDiFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9O9aApU4EAIdT6XgQsvFCzuYVEyFs6+YxqBzONB9eZR+fgHsBiepFakCVu4MXggRilol0VnBXRoy71oyCWsRDtt7KH1ttcwTqE9rDtDQ7fcvCdQe63K8LHstJSLsDWis/WHN3xDTddA1MdOIRvN4ziePtQJScf1KZXV+qD0NPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1mQJNyS; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1mQJNyS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aaebeadf3cso1933631a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 11:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791744046; cv=none;
        d=google.com; s=arc-20260327;
        b=lRBYzgbsi6sMDX2Ga62BfoB1zf5uxI80odwmRvG57wfJZMHPu0BXxE+n+guKjguHcr
         IHZvEIlrgq0p9wnc1o5iOkNR/+uZTuCIGy/b1UOErSQOOPSpXKkMNNWhnLQPIgMVQW6B
         9dYZRcnBSqV+t/mx4yAVIYv6VWmMLvCrUMFkIXnwKSqKUhsvP+A+pmv2bZyh6GYMlIu/
         Uf5Ho7vHkn4ZsJ3xKHQPExqcF667q5ff40+TLdZ/5ruPsApLkOcL9uqIG+c+abUdbeyg
         9zE/c8CHV9Zi0bvXhdSovBgYR+0yS08Zq70MEBO1lJaCS8l7yOc1FyCGKVNrZXbX7OSV
         XQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        fh=bmzOYLrHKWIK8iPyXrqqs3h1MJbIMsCPGF/2JBvjBMo=;
        b=YtBK3VekCMDw1YE5YVJLn7wkO3xpU1nzGcEUdZiyEkejLMbrX1K80+/LHjA9UzuonE
         iXZDfyI/ff1+TpOn5ZO+kD8X9DK65jGD/jAEl4mODoyMIpTIKQFVPnR0M4+wCKt4UqSM
         6lpRt3tMFLIq/8IOlbl6H8CggozsHRuPz4afb8+tcCIbqBSt0dl/bm1t3adNM1Mg5t+8
         p1KikXasbC3AmzwUPmui/NHg1hXiUiEj6kgeynhqFnUy0Moto9yrBlNIsPD3GFZjDdhC
         64awuMirdPfxAoWadE3wDAT+2RyINaZo/SBqN/yBPK1JyKXVYPd3ajaDzlRckW3DDUSe
         2qRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744046; x=1792348846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        b=L1mQJNySaSlewL5YnVM5JaiCSNBCnwmwoBSuSX4LtwnCUiEN749tQ3JEIw9ZvMxnMo
         O5yCmRgMHUykDdRgpVwccRP/GORjIGzdN7ZNaiKQ5MhULnNt1rWejU/1u1guN1F1FZQA
         p/2takMmjSb4Ch0HQB4uhhE1JuWGeKDhTZxt5Cr1q2B3Olvnpiy77jPablt3fyrC61Hi
         ztaO6wRdYK7Hkr+m0oDMQsUFME+AW/gUKbGH6t/bNtQn51ZbszKYSQGH5sE7HcAdHxOF
         stj8kxk6/f++Ma7/oCWw/Lva6Qv1LmcFbZIfs3vVaYNau1FlYQ/+odnmnKe2+Qhi7a6R
         /rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744046; x=1792348846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQfggiPo/EuM6hWbTx5HWkYsMpDudQ8VvnQ+iYehotw=;
        b=yMxiMJqGsHp4Patox/30LrdLE5polwjIbJXzJiKgEYJtHdBX9baYVj2HfAUSG58j5l
         u5617743CNbmiyN9VDIjj+wz1M3nhFYv80iGvy8UvrG8XpzOD3JRszuODUcv9sLapGtx
         4MIVMSNoiO0QX9vOZQKHwMrsBbmjeGYiz/yE8zk5xPs3J38yHvI8pjTpV1/bsHJhmufE
         vWqdUOxdiTMLC3JZV8m7y8nUrntPd1SrWMBTsItPaqh6v4CKLSafZmJqSQ3xl1ZMjKBb
         O3870Zw5HP3V0I0mZypk5UV5XvoiCRNKzg8BN8y6+D54ZcuPxzNIFQnBA/vRE6uEvBRI
         Vnlw==
X-Forwarded-Encrypted: i=1; AKwUvBxyGwy2lX3Vm7NvOXW6TucnB76aVBvEcYVWRlvvIaWIyw0YglXqrQ5Z60klEUwKtrspYd3rTIUsl9nZkKHteGjMl0pO@vger.kernel.org
X-Gm-Message-State: AFq9FYKO9cM9buXKj9WQWzynBuzRfVtmqbCtYHONvAWU6/MtjcMtpOpg
	NCD3zWUF8uBYBdnvuvRxzeJOoMknbTrO4bqaDdmgl5P9vn2eMO0666iKdx+pLH2PWHIx5aPiut+
	7cTpUYtFQ658wPdpy5fPo3kBncG9N0H8=
X-Gm-Gg: AYBFou3Jk2+1OCz9oXCPjWlY7U4FWg1Kv/88rCCKI8Ag0zlvnnjYNqGCc2QhvvTzbFh
	miFYbM6dPDeTHJkooGVQUEBiIPPFQv+zStNSbwQF0MJU4XalfKMFhu0s4XMVfsaw2n2x27Q+3kI
	2Kv1wr2JKlCjwKH6DM6RTRswTXpRWxEPX5oLA/VoVOhLGYHC3NK6WhocLb7NfZIpqjgc7FvwSwo
	f54pJBsqO5VohcrlaOCMW/omxO6X0bsvdhnQftV/o0p++XoynFyr5DpqQ+69lNZyz47BqLzhxRJ
	R8iXMzSVs4lLktdddiUCJtyh3//puWa4VsQ8hW+ov3TClQEuZbDvHjFIw7XcdKw1YQ1Fey6vjMV
	E6Lnh4yFIRQod4PxtgPHZk8BLxS9MggtGTKHV9R+F
X-Received: by 2002:a17:907:3e8d:b0:c26:36c4:858e with SMTP id
 a640c23a62f3a-c31aa018731mr740472366b.25.1791744045539; Sun, 11 Oct 2026
 11:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002191434.58529-1-meatuni001@gmail.com>
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sun, 11 Oct 2026 23:40:33 +0500
X-Gm-Features: AclHuK_PQr1apdUCLCKqAhzYay7IqnMzIHODUR1hbQE3Linc1QaibmLRagzo2j0
Message-ID: <CADqcGBnsAO9UN9KOGtp7uHOe8Q2tTuheDrFbUOd7Cib3VbXE5g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] platform/x86: hp-bioscfg: buffer handling fixes
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have sent v5 of this series. [1]

Link: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.=
com/
[1]

Thanks.
Muhammad Bilal

On Sat, Oct 3, 2026 at 12:14=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> Buffer handling fixes for hp-bioscfg.
>
> Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
> handling, 6 the sysfs store paths, 7-9 SPM and integer parsing.
>
> Changes in v4:
>  - Add patches 4-9
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
> Muhammad Bilal (9):
>   platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: fix non-ASCII truncation in
>     hp_get_string_from_buffer()
>   platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
>   platform/x86: hp-bioscfg: allow clearing current_password
>   platform/x86: hp-bioscfg: fix off-by-one in password length check
>   platform/x86: hp-bioscfg: fix heap OOB with embedded NUL in store
>     paths
>   platform/x86: hp-bioscfg: validate SPM state returned by firmware
>   platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
>   platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
>
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  2 +-
>  .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 20 +++--
>  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  8 +-
>  5 files changed, 51 insertions(+), 65 deletions(-)
>
> --
> 2.43.0
>
