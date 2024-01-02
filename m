Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D936A
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI9LOO92"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-781bbb1f61fso117698685a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jan 2024 16:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154074; x=1704758874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUD7dyobeLEHPll+GnD93Z4vBzGgw70bO3OiZp8Jmxg=;
        b=CI9LOO92qJ09vFuOal5JbQ7So34zN7nYQqbX1KjkdRnMs+tzDAMQ6JPEdJhJLYFaWN
         ZYjzorQAg48WpncDp0pYWy6MNwITbA+kSGBJdVfWw/qizmKy0xifqcR8xHDoMAFm6McB
         2DcOIEWtp4UqhcSU1RfIt3aYLI0o/3m0QsSh0Gyusu1WwPf3R+2bxOIjilfUWB+EiGVO
         D8CkctmN2uPE3yxTeAXaZufRnzkvnQjzvrcmTFhDrtNxh0ICocfDpGef/6IlNGbkZmDL
         GzmJRSNjOax1hf4Sy87AukZv7Hy3qoDj0Vum++yysXV1uj34aoerXdGihTHH7jSRQJc+
         D3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154074; x=1704758874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUD7dyobeLEHPll+GnD93Z4vBzGgw70bO3OiZp8Jmxg=;
        b=v85izArMOGj2yycJq+VRFRbUZGUZ7MNmRFKtLiCiBD45yaFphJuJW7JXzQNpBZtWzs
         zPLg039U8cF5LClPtpaLW4IzCayuz0P995y50eXeyjkg7chRYMQX7sM0YferMK2bBFFt
         thbmdcs1QUNhkTVQni+hcJJar/9RTzJUcK6LoJmd/W6o1h0NZtIi0ZI+Ua+yfO+vUFCV
         +RiiOadAvvy/5FgqE+U/EsqdSFv6BRr2Tzf7Lim/L3Jm8KKuSaDZNW0VS8L28MoopUa+
         uM3QYhW44yC3fxPvddxpRq0I+uiUfjnvzL9EqFy+ULdYJfcFoAXPbSdEgxex3fCHHMbs
         2maA==
X-Gm-Message-State: AOJu0YyJgLcKNSfLwrE1QxKWb1osIGmSvov3ShWHMgEdByAcFWPDx3t5
	/rxLJtR6w+8VKJoK5SpPdCA9Cu5epe7crHpYBEE=
X-Google-Smtp-Source: AGHT+IHNe8teHg0kryHmUS4T/rHhstFbzeygfrZ0hg/8RUYkW8tE7Y7smnnvfRi6Sy5KhAaZdEPN8ZbvJbycZDyn3NA=
X-Received: by 2002:a05:6214:4244:b0:67f:a534:9adf with SMTP id
 ne4-20020a056214424400b0067fa5349adfmr16875834qvb.18.1704154074111; Mon, 01
 Jan 2024 16:07:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231163322.9492-1-hdegoede@redhat.com> <20231231163322.9492-5-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:07:18 +0200
Message-ID: <CAHp75VcLBBuVLeqEFOuj2UNX7kUniXY6h18jH2s7zRCpq28mVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/platform/atom: Check state of Punit managed
 devices on s2idle
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
> From: Johannes Stezenbach <js@sig21.net>
>
> This is a port of "pm: Add pm suspend debug notifier for North IPs"
> from the latte-l-oss branch of:
> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss
>
> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
> functionality this can now finally be ported to the mainline kernel
> without requiring adding non-upstreamable hooks into the cpu_idle
> driver mechanism.
>
> This adds a check that all hardware blocks in the North complex
> (controlled by Punit) are in a state that allows the SoC to enter S0i3
> and prints an error message for any device in D0.

...

>  static void punit_dbgfs_register(struct punit_device *punit_device)
>  {
> +       punit_dev =3D punit_device;

This is not the correct (semantically) place for this.

Instead, optionally introduce a local variable in the
punit_atom_debug_init() and assign the global one there. Also it seems
that you may move this global variable under ifdeffery (and hence its
assignment) and have less stale bytes in the object file. (With this
said, it seems that local variables are plausible to have.)

>  }

--=20
With Best Regards,
Andy Shevchenko
