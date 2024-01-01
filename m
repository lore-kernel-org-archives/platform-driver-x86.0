Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD6F9C4
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jan 2024 23:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Amp6UpVZ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-680b12e5d42so9601276d6.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jan 2024 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704153442; x=1704758242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDPSc3k2HLkFfegImTUZnxuuy2yetzmRn3gttDz7UDk=;
        b=Amp6UpVZpZxZmrQlgfnSosACgpA8GlH7D0zMOlxHcZt6IKaGIhTxTSbLY9fCP248Fe
         25S8Q/Dcn3UcUTMTcx3ERmMUjb98SAyRiDE7BPq8pkfkqxi6DSepW6LGJjR+JyHHmynz
         34K/w3TCWX5RFCHaWevh/PWnWU96ZN3AhcgmillrMrL5Ql+RCDV0eSL5dhL20hrIuBFM
         533to28Mb5tIpGaDZIFEyGYhPEo6BaoLLdZ07JNPC2hk0xyzR6wX1Nai7XhfOqCNssLz
         7zIfJXl4AqwQxx6MKllCXUwohSyoOidREC+8PXlvobJ+0BF6MXMi8jsbyyCbmdghwj+5
         cHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704153442; x=1704758242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDPSc3k2HLkFfegImTUZnxuuy2yetzmRn3gttDz7UDk=;
        b=dwHqWvNElINVTPhzPVK7Xy08imArsVCTiBP500YO1wdF1zd18hjaVOX1UmBXS0axIb
         r7055Z+kHtZu6ez4rg1nj8XxAUKUewWr2ToWY0MCTKDwFfLVtLId7YPb5xVrHziF4j5y
         sxReYBFX8Ufqqgp8SDK/JUmdAVCEW1PjT0ryHF8Smai4iLxHDg070oliWJUWLYMySNPe
         ELxPrK2b7DLbSVuHcrMPf4teIQnJEqTgYElAPIQ590GwUztgrtVk8N+ePZ1mhmmrDfeR
         X4H/ZFcOyFBAaA+BBVk74iTVReLECm447aV5BV8Zq/0EysvVgo465AewNI0fC9DUQ2Vc
         HDSA==
X-Gm-Message-State: AOJu0Yx8tJZlYpojrnD1k/86DufEHBH+cr+Aim9KJ7kxi5C8jDJdRcam
	SZQ7uqrcFSQdHqwS1yROEy1+uh3kfoMTgPLiy8jz8LCdaRE=
X-Google-Smtp-Source: AGHT+IEMd5WzfL5tQ65GkgCzCj0nyt9YzeaPlhW3IAACpmnC8LHhaTQN/jgQl07fpzpltI3xkzgWKwY8FG+bTr7mpMo=
X-Received: by 2002:a05:6214:258d:b0:67f:7599:84ad with SMTP id
 fq13-20020a056214258d00b0067f759984admr26845650qvb.84.1704153442309; Mon, 01
 Jan 2024 15:57:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231163322.9492-1-hdegoede@redhat.com> <20231231163322.9492-3-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 01:56:45 +0200
Message-ID: <CAHp75Vd-KE9+TpY8S02s=fO2wv5W6-M+xdMQ6AqsNfrMerGwOw@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86: pmc_atom: Check state of PMC managed
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
> This is a port of "pm: Add pm suspend debug notifier for South IPs"
> from the latte-l-oss branch of:
> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss
>
> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
> functionality this can now finally be ported to the mainline kernel
> without requiring adding non-upstreamable hooks into the cpu_idle
> driver mechanism.
>
> This adds a check that all hardware blocks in the South complex
> (controlled by PMC) are in a state that allows the SoC to enter S0i3
> and prints an error message for any device in D0.
>
> Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
> already depends on ACPI.

...

> +static void pmc_dev_state_check(u32 sts, const struct pmc_bit_map *sts_m=
ap,
> +                               u32 fd, const struct pmc_bit_map *fd_map,
> +                               u32 sts_possible_false_pos)
> +{
> +       int index;
> +
> +       for (index =3D 0; sts_map[index].name; index++) {
> +               if (!(fd_map[index].bit_mask & fd) &&
> +                   !(sts_map[index].bit_mask & sts)) {
> +                       if (sts_map[index].bit_mask & sts_possible_false_=
pos)
> +                               pm_pr_dbg("pmc_atom: %s is in D0 prior to=
 s2idle\n",
> +                                         sts_map[index].name);

Please, drop the prefix, we have pr_fmt() for this already defined.

> +                       else
> +                               pr_err("pmc_atom: %s is in D0 prior to s2=
idle\n",
> +                                      sts_map[index].name);

Ditto.

> +               }
> +       }
> +}

...

> +       /*
> +        * Some blocks are not used on lower-featured versions of the SoC=
 and
> +        * always report D0, add these to false_pos mask to log at debug =
lvl.

lvl --> level

> +        */

--=20
With Best Regards,
Andy Shevchenko
