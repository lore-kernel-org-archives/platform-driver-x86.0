Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E2CEAC0
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 00:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8iK+Y8n"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-67ff241c2bcso54588936d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jan 2024 16:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704153729; x=1704758529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKS1hPsFODJoYdIdxOzHB6xufFjtVAy4FtW2eMAxiIA=;
        b=M8iK+Y8nD6SmsNweyAfOyBsvplELZaAoeDsQ9j8X2AjCg8aaS36rY8bo+tWa4C41BF
         vSpZaTGqbq/qRJbSgP+Bxt/HpUWUJazAIfEV0WsjoPNnNvDCtKjN3KPFStQk9kcAn3Jz
         Effdnb0bNHYGKC5U5v53CDD/LyI+rfAIQmzJ2NvTYPTFjz+WqipKLX+e2adxszzlYAke
         b6P5eaqU5EqRTU0ER+xO5vOOvQxKA+Pkr+w3BnFkTCbL/d1HfdB/g2jw6BgXLz4iI7d4
         JKCYelvAVFybEYgf/Q5V9vIBLNJZa3RW4s/5r2AJ/kXVLxDmQDqczgEtLOBKpC5jGiVt
         aOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704153729; x=1704758529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKS1hPsFODJoYdIdxOzHB6xufFjtVAy4FtW2eMAxiIA=;
        b=u0LyBRuY4VlOIBkAOvvsMJopSzpOTPXjspyCQl0I26EDqGmtrwsDXhdNammqEsueGo
         L684T2IrmseK7QcHno7kGELWvC1yOKXOVgw+hppGZf94QBVqc6jG7/0ghs4HlqurtsZv
         JzPcV/YiKiRPrJRtObs3V9wnIphW+qGuAfJWOd/XYQNVnFZ81dJfoHi4Z3Vz6+zRT0ze
         3LiOLSW5F0W0zPmfbojMLmJ+bNjc4H9rGdZ6+dLFncq9SCdGPyuHgImspAbetpqzXFlp
         8Agc3JstNlLCq/SzdM8bdT6PH1+HjhzGDQAeskpZG4K6BonhrTIEfAxJg7mH9/qdVLal
         sl1Q==
X-Gm-Message-State: AOJu0Yy4+pnLLVF4GdXNwyVTeCmj6hVPV5mWnSQDSOtOXcncKc2EmTam
	oJlPerea3Z+DBmJPY/VnPXdFQtlJYWRXi4+GvQo=
X-Google-Smtp-Source: AGHT+IGB6WRlt+CqDioTaRWxn7ki1oyGASr5VqPZ51Hn3Gwu1hDaHZWV1AEneK9FbivyiPJA6sBpKmSCAvHdzrUSThY=
X-Received: by 2002:a0c:efc1:0:b0:67f:ae18:5e55 with SMTP id
 a1-20020a0cefc1000000b0067fae185e55mr16065757qvt.93.1704153729410; Mon, 01
 Jan 2024 16:02:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231163322.9492-1-hdegoede@redhat.com> <20231231163322.9492-4-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:01:33 +0200
Message-ID: <CAHp75VdOUO9+xxfMJ2qZ_Eye3cK4S9JLDPqGN3ZXkDRNFuLs3Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
To: Hans de Goede <hdegoede@redhat.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 6:33=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Extend the s2idle check with checking that none of the PMC clocks
> is in the forced on state. If one of the clocks is in forced on

Perhaps "forced-on state"?

> state then S0i3 cannot be reached.

...

> +#define PMC_CLK_CTL_OFFSET             0x60
> +#define PMC_CLK_NUM                    6
> +#define PMC_CLK_CTL_GATED_ON_D3                0x0
> +#define PMC_CLK_CTL_FORCE_ON           0x1
> +#define PMC_CLK_CTL_FORCE_OFF          0x2
> +#define PMC_CLK_CTL_RESERVED           0x3
> +#define PMC_MASK_CLK_CTL               GENMASK(1, 0)

Please, move these to include/linux/platform_data/x86/clk-pmc-atom.h
from drivers/clk/x86/clk-pmc-atom.c and use the former. Otherwise it's
a big dup of the existing stuff.

...

> +               pr_err("pmc_atom: clk %d is ON prior to freeze (ctl %08x)=
\n", i, ctl);

No prefix.

--=20
With Best Regards,
Andy Shevchenko
