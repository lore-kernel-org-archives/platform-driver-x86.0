Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDB54791
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Sep 2025 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758483518; cv=none; b=q6iDL4paUjLGjT7jlMEVnUF51tesNlIU/cjNdlAJYcaP/mETetwEBMF19g6pA6OzKUgt5Rxr5gImKZGYHsrzW1N/bSvvGuKLK8jDFd5vcZjTP7RhtmjkEQhR9QobfmzlYxJehER3DVsaZm8ddGfY28b5OxCzIVH0R4gn+2fDHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758483518; c=relaxed/simple;
	bh=rz8cSsbJ1ENnW9XkFfFnDi0ojgwYEiBrnbPEUoeNqF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAkaSPfUIhWp+MB/SAmdKFnhz5Ai5CE6KfUvfgPFW2/lBsbgo5PZg9fDOwSXN9I2bfjEaXp+3YxcRPFXrBp3/qrQoeaqAnAwlVeNHYYIj1nvEiM6OhyXGi9YCu5gSC7gxv6xZ3mQSKChW0Hsn9cj/5Xik9mPOhD7+9slfZA15M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbSY3YmP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbSY3YmP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fce8b75a3so3640306a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Sep 2025 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483515; x=1759088315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz8cSsbJ1ENnW9XkFfFnDi0ojgwYEiBrnbPEUoeNqF4=;
        b=lbSY3YmPk+N1vMBtbrmP5a4xSaow7KEb22UbZ3c0j/EfoiGvdiY+6FOjgyrxWVRcI7
         zcU90un+P8rRvTr91cQo1HE3Uv6q20/eNhx6BmVhLZfn0Pj9PZivUQWBtH+krF1qEJpE
         u+Tg4puc6/mGdcleJC3x5aEApvRXw6qqyRpDGlIiBbayqWwxroeWYGKeqdu8i7qJZm7H
         Y9DBshQ/6lk3M+WRLi1l3cZgdjNhdfmY56dxeJ5Dsq9d2JQUsOHj0PPK+eKWO3VwCySC
         +CsC3I7fvZYm5USZultoKS3EO9HyAKBF6r/9Hn+X9LZIINyece4X2eAfLE0yRpYekkMF
         qrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483515; x=1759088315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz8cSsbJ1ENnW9XkFfFnDi0ojgwYEiBrnbPEUoeNqF4=;
        b=jODdLFCVGM5JZ7scuVbO908hDngGv3uZ/cvWYf6w+D9KEAVH/CHO6+URvOrSjYJp2T
         b3RDk7KBKvtzCJb8ewa2PXayMVYQTVBgOV9xbtHmn/W5wnhIp2Lfk4hJ+Mxv9YEGIcY/
         MjWb8lhpeU/OMCMaOAgBUzCqeLHgC1IFI65tRIk/n8/NewcCBZBCT1EjM9VWweU5bv52
         5fe2XV3kXDoU8wLI3cZmiiX0DcJFhW751Vb5H0DHttjNEFSvW7RjNEb0nfY2BBVWc2sF
         80V01BqzM09NSMCJKRxwX1BB4f0Pr5J6Pux4gNERFZ94Y1G7Xzq1ozzf/06QMHNprFzj
         BiYA==
X-Forwarded-Encrypted: i=1; AJvYcCViLaYSjnj6iQ9bkMurb2o5ckbGTWCEc6Ts0ImupRQ4LZHY4f1UtjlClmKGjmXUK7iZ3JVFu7OOM9NAAG1sk8IESNd+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6ggRvpk2PCWkMNImrXTb34NNRSg6a8UZfjs5O9Eca+l7vY0G
	CoiLnTdn3rAT5wBAxPIe6JcNqae6D9/tRX0Baf6jjjlx7nAvDSkOaRwcAajAsjudUB9YyDoctp3
	z19ugTkUQXxBodN/K/a/CcOIrd2qaZR5HHN5M
X-Gm-Gg: ASbGnctTFSxfumsYCwC68NBi6zERJqxeDDJjP+FPM6Q2k9PJqvwka/eX9wFotU/d5vj
	rjDfGrRexzzMRNxWMH60KVQNm7tS/unywFPYhseobKLg5viFkUyY1DpR/UXF+JCpB/Zf2t7CLmr
	0x3RNyLJ1Etizd6CkX8Iya+JieGZ8373jELlr871tkoLDMNhpyt66Wu8Y9qrTTel+eDF1yMcVs1
	mPYbIo=
X-Google-Smtp-Source: AGHT+IEU4BfxPaC1bnsApF6GLuLgh/hAOVRzCxnBKJF+dLwRdfA4k5/FBZAcsuXJW2MmGbWDc7H2QFkT3IEcx/OZMVI=
X-Received: by 2002:a17:906:7954:b0:b04:6546:347e with SMTP id
 a640c23a62f3a-b24f4ebffdbmr1039434866b.51.1758483515141; Sun, 21 Sep 2025
 12:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-15-hansg@kernel.org>
In-Reply-To: <20250920200713.20193-15-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 21 Sep 2025 22:37:58 +0300
X-Gm-Features: AS18NWARx_r6Kdtw7NfV0U233SC6kqZ8wnS7Ugr4S_5zRPcBdABh401uOodN97s
Message-ID: <CAHp75Veu5z2q0-dm84dEQ4=TUk1wvZ0_2QkQhiwdee-K5VTXFQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/20] platform/x86: x86-android-tablets: Simplify
 node-group [un]registration
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 11:07=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> software_node_register_node_group() / software_node_unregister_node_group=
()
> both accept a NULL node-group as argument.
>
> So there is no need to check for the node-group being NULL before calling
> these functions, remove the checks to simplify the code.
>
> Note the "if (gpio_button_swnodes)" check for registering is kept because
> that also guards the creation of a gpio-button platform-device.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
