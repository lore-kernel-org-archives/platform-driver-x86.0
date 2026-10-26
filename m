Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792991784;
	b=wQnPzhqRQiHrmZRMRKd6SzTrrFKybb/+GD1fNej8uEJhyNKOmTOj2CbKWG5jXUA0Fa8C
	 CcoedM9FPE/kjfiAs0I6WdcRAZD+h1RgegDs3pd0u0Eya5LqS9kuiA2wxbpMOiqLpaxnU
	 64VjGTEVrblfnKViMtlcISyN7Q5xepxA/y0NIrtQzVmC6baQm3S3aICzsoUPvyzzL8Ow5
	 5X6YRovK5tet0R2KPmBZADZQ9ifJw8LR11qNiYKteNidRaQmlHdMYW4af4Gm9bD2Lpd8u
	 QJgrbExRZVcya3ekCsc37tQet8/r7XnNrEpaY/G+B1oPpiWzNyGY4bA8qYMisfrf2UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
	b=LcEj3rK3fiXDW3yaiubLg0347K3xocDQ5n6DybjbfvorFQ6gRPM2X/Fr7/aTOIXaEQ8M
	 2ZHe7CEugyhc+00mkea7bQOiUdx+qRAE1g1JsWa9fdeNDugvc6hMWFgBR+fBn2GRHolmm
	 VTyuYVEOZGMQLJPsqHmrdMtc5w/MQtl8/ZW/LaI3H5wamSV7ZSGcG3L1L1A2Xml5M1Gxy
	 7sGyco2FUzOip/IjXjOrcTHwW+xaLUv+x4L4ZCzcpWf/hb2t+Fnflb4YXKNnTB2hY6R2M
	 ZTOEUcnL7hFOiZvd4iumyTO4c2wx8+Nzz6c12LEkjdWwy3l+BuZnUeOtaWvKKSzV6hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ2SpM7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5605606A320
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 05:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5605606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ2SpM7u
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so557389366b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 22:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792991782; cv=none;
        d=google.com; s=arc-20260327;
        b=mzxeOx1I3zWOEGOr9ncxvP67xhBGw9TKWmZKWw2jtVGccE52vWqwwmQeYLY0XhwprJ
         sZP5y0746dMhDPejeHlspCrPAFJMBhrvA28/9ecC10rtUB1tO5Q0U57zhADRwOIgqupY
         E2ZBct3wqd8jgF2LD/XlpUDi2o5mC1c/OBNrCbrtnkPhib2sJygYPBqshgxEPV+6g9gG
         uP+HGkfZdmbl5x6Nl+iAmCjJbL4Gh1GyHXhllkdP5wGb/k3uVdfJzEaDf6Nrnf3oNPCt
         Nf1J5KSZsakTqo8pqxPVyXsoUaD/irCTS2aiyJ3BcK7+v33gkM59hZrRImzDdxggSihl
         Phog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        fh=4qENut5Q8VQHpuOm3v/9r9i0Mv/NHH5LufQRGD3dlSw=;
        b=sfZuReSkckmG7xiTUPY5DF3PFydsHXvD/JgA+dberal7EdkvlQyUuV9iEe9QSp3xhP
         wu2WccXrjNYXtTXEtYHATBD0rUVGIOOESFmAMEjgz7KyEz53yCeV5it+10ac91jZJ+W9
         Xv50tV54tcIz+n1RoKiAE8J4Z/Uo9FMh/8hNc8T7mjbG0cWbnoS0pvRTDIugk3phiP6x
         qOhU+WFlD+BjXYK8kNTzsj4AHOs6MYwXLi7mfjPJc4+n6b3fUIJthAyG/7QfCxRW9gTR
         Fgu7lDwXAI9ijgruD2h8TYnGFFCV5L/gmkiWT8m5PqpgKhmIovFIOREqv91mG/EZZt8j
         rpkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792991782; x=1793596582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        b=PQ2SpM7uqS9WHlEZYY7Xf+ANwxpo6Pdajhn2HOJ1DdtJm/nPGeq4afxXIMr1/D0MP1
         ZqEBE0YbnLXvvUOl5gxOUHjMwRYdV2O++fEWWPEwHF8pP20adYQjiRoJXhB8FjLAJbr4
         vIaCRcfHDK7mwKQdbDPFb+sVbhQzcjXA8oa65NvU3BNMqIAUP518xme/iTq6wXy7j6eQ
         xS+BVtRr9zQmDq/N+LW+aaRMQ5826kw+BNnfZmCmZsefZTh+Ld7rFEKIL0ghsEpd7fU4
         nQH+HKmVJthRcrKvvp+55A01lX8R+i8OYuFfufFg/8xCne27EwX2KXB0eUOYkQdXtmzj
         HKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991782; x=1793596582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahOsVudUc7c7Un9O3y9zKqIgbSxfkYu+yvHVouvLUFk=;
        b=UttsgANxnORNG4fT4k8nsmIbh5W8Nk6Ux8RszL/oLA8hOAonFeBOKZRztEUQPUd0Au
         rLuj2XB14XY0azRX4kB23z4BYgPPUJnM87ygxekRI0bKpK6vYdl69FJJLx0dbUDE/xrH
         eq14eyvpfgqePV9V8Da+c7MfLzMMF7dLeRVWNRdg+PMLSesti32Vyph5ebI7/u6ZLp9/
         IDFiMLHPDII+MyRAIhlOq95IDvFCEg5BlHxd2DpFZG3C5nvyFqYYa0iio2XDDVgMZdGe
         oT2LwwWPuoZeNY6Nq4rcV1QWV4jISQzyZUr0ofJQQJUdjnJN+YADSkoAuSBQ1JCIqfBN
         MkPw==
X-Forwarded-Encrypted: i=1; AKwUvBzPBa/UYo8y1c07RJcqkp7qFVZlm5ctM61Yr9IvpVxv08+sryedHdfZ8aJdZxqHMv6pXFEoBEtsvY7/FOLzYtGCLxLY@vger.kernel.org
X-Gm-Message-State: AFq9FYKqeIQ4F0NilelNwgcXb36RPWUbP6+nGoJXrs3NedgLTxG66iU6
	khGdJmb4FX+x6mk3Py9zF62FHZzU8+ZI54RA+2PCbA1josxvn7gHBJesmFBfjE081P5kbYlJaQH
	E9cQ7iyZ6MJJ0Onf3E+q9Juh5HOqNi1M=
X-Gm-Gg: AYBFou2CYIaJHEdJfFNkSYLz3bVf95xCBJaHxna+28dK5YmVQ7p8O2/RgaIcfkBi2Vj
	CPZFgktTmQQ3NXnXjw7R8EIQfytQ4lrGceYL7Dkr4ZQaHaKLxuGM/q8hRuIXO1fDwM/ezEYUE2w
	uCboE/U/PnxdcYZVZaNGp/aBQRcEAasjW1BMsFDTAcMT7/G6BRur6KMToLsV8tRMZYkQAygLGmP
	CY8up5M8k/pTnzlJpubVjyE1Ozs+PD7u2K6boWXCQ+Qyld3vpNjSrWl8HnxWjXu4//L4/UkGP8f
	PWC5jAP8htVMdIxB2DQTK6lqgBXKZkN3KAWgMjKPbgoNqEPnuFQ7X1eeynmo+HtVNPbo8QIpxxr
	wDalvwZZAdNCY/32xlpXysZBfjcTQu2k4YR6+Cc0KcOiz0LtBJt0+oOXLY8ePDbxOzBHN0OWZ47
	Wfil6pQNAo2GO45F8FodYSFFycT5btoGSMhNbRKdVjSQkk
X-Received: by 2002:a17:907:f48b:b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c46be5bfa80mr612811866b.15.1792991782008; Sun, 25 Oct 2026
 22:16:22 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172641.19424-1-meatuni001@gmail.com> <at5d__q_RzGad7zt@ashevche-desk.local>
In-Reply-To: <at5d__q_RzGad7zt@ashevche-desk.local>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Mon, 26 Oct 2026 10:16:10 +0500
X-Gm-Features: AclHuK_gXUAQAd7y9XjGt8VKlv2KxyzU6RO9-KdAgpiiPwDIUw-cWtN014mbLq4
Message-ID: <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
Subject: Re: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@weissschuh.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

No particular reason. I removed them while trimming the diff, but
you're right that both comments are still useful. I'll restore them in
the next revision.

Thanks,
Muhammad

On Mon, Oct 26, 2026 at 12:52=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Oct 24, 2026 at 10:26:41PM +0500, Muhammad Bilal wrote:
> > The input is copied with kstrdup(), which stops at the first NUL, but
> > the full write size is passed to hp_enforce_single_line_input(). With
> > an embedded NUL the helper reads, and can write one byte, past the
> > copy. Use strnchrnul() so the scan stops at the first NUL, and return
> > -EINVAL for a NUL or newline before the last byte.
> >
> > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > followed by 4093 bytes of "B" to current_password 100 times returns
> > -EINVAL every time, without reading into the heap.
>
> ...
>
> >  - Drop the trailing comments
>
> Why? At least The first one has the same meaning as before, what's wrong =
with
> the second one?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
