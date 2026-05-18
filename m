Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145E3E1693
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089463; cv=none; b=XvQ0AgYEeeI+ye3BUSnKk0vdPXRPRLAsvgEqfBgrYsEVc+6ahVGkz/wHAs1BJWTi4dr944ZeCBc/JMn6eL3q45TNcCDnDRk4cfSe+KKAGEzWTQIFbQv4qET8n7tJWUZU+XvaS2QN6d8pA2X1TeFA4GnGAjIHiRn8W5p89FE3b3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089463; c=relaxed/simple;
	bh=itnAfD5lI75WoCA5V2Lw6o3uvx0+Wp+BLneLjuOhUZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brls/KKmnaMOuojupgiJx3HA+mudoCOjZkUOnhBXP+2WdZGMG+OyvnS84MGWb/CgDfdAo9O2UlZCLVnw2tzCzfSSpj95ET7Zb8lVi3VJwRGSRjrnTlKlqb2AvtNFfuFyCaffocwbk1eV9N3i7drQ9mC4UMir7O401HIe8fHx0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8354461da74so775469b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089461; x=1779694261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAX9hMXPiheaabgyT1lZXM8onJqkgfJ6l93xnHwfAq4=;
        b=LX0ijipU0eCGIpRqe+lf8Izsqv2zkrBlraAnRurZtGSMVbBDBREUiD9E5EA1Qvr7rn
         jV28/JViNwHMH50Xig9ZoeTS9tnRexy3o5bwjFRgPb1S6PESmq8kFwFhnUm/FH5GrRte
         8tUyI93AbyAhVopVKxpwVNX9iLGWC+zJeUyENTeyuVg8MUtPDflLriNVjfPEuXhwzg9i
         ePB01u2TV7XOFLPsn4QfsdMLX5ksbGnu/6VIYLL2QN9sS01iPEIIL625Qmz0D5YYobFw
         7Ezlmgnm8COJozGTUM85TtOyRbhBn64o5HxxlUUSyq6vvvMaHbNB/nLSqHcd635k0mU4
         mpig==
X-Forwarded-Encrypted: i=1; AFNElJ//2Kw/hDZX5KCnprN1XvR0RDBulVbdkWi05HKakEghlsZxSuKIi+iKiHObN2X7D+bnLFlSctiNFUPR30LRw+M3wXUQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BqBwQnISVxlbgpeMNMcVUxOmPEe1JJo7LVPz5zswO0G/uyzj
	Zf3EiYZUpxfydPAPppZF7eyvV/oMHZ9iG81wpcPPfaxmewa8zoG2l9foUfEyMuBY
X-Gm-Gg: Acq92OGTedjdHh5nW05KUZVk9yUgeZ9jZO/flbELmN75eNasQQJM1eTfAlN7gA6A0Za
	1H/xlsSYe8mbv4mkBmAg5JUZVCTVizME/No9PinvQW4S+akA9/To7d6w9CrpKgiTC7yTqP7sJ1H
	VuAPbqJZy9U5EDmSPRLjj25arRloQ3GwG0nmWJI4rnwuiTeA1ghoZ6gs/FY7zkE2+FgZgyNgAls
	XJ0sAV3LHmcXyE7Kkmdii0ScTXwt+jXp+e5IiBtx8ejmtFHwm709hCp3AhYxQMQzue1hoLQjxv3
	SMarJJnZ86Ur0OWVkG4+FyUlWI6gjdoumXZpuo5JJ5Rum52ITUdu/AAX4I8AsrnYUH1tPPeEyjz
	p4dIjyyxWSeu1yNMfmyc/TmIpPsokzWwj0dBXbNgE6hA5qM00u6XfyYoVICCXII82QZzyIv45En
	Uxv5DvY6wGVDdB90nO5jHpcX1aN5dv7PhFaJz35sz/qsaPlJ4g2hxsQcL0Pe8=
X-Received: by 2002:a05:6a00:4397:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-83f33d97b1cmr13380087b3a.35.1779089461377;
        Mon, 18 May 2026 00:31:01 -0700 (PDT)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com. [74.125.82.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm13784142b3a.12.2026.05.18.00.31.01
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:31:01 -0700 (PDT)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-133466cf955so8263690c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 00:31:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Lbo8Yym+0238WDsri0d2le11A5LmyW6ttDfsLQP84crJbJgMZP3S09S7gHt08z3DA2GhnAdQwSyX5PqLlbpbi8dIS@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-63a3cc0c2d3mr7561944137.3.1779089086695; Mon, 18 May 2026
 00:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
X-Gm-Features: AVHnY4KCtTIyMp1YT9qrsNOPXjoXEF7LJA_Isl-7-vM7CDKMV110o1b879bzndY
Message-ID: <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, 
	Hans de Goede <hansg@kernel.org>, Job Noorman <job@noorman.info>, 
	=?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Oleh Kuzhylnyi <kuzhylol@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Xichao Zhao <zhao.xichao@vivo.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Fri, 15 May 2026 at 18:48, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> My additional motivation for this effort is CHERI[1]. This is a hardware

Nice!

> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.

Good luck fixing all implicit assumptions about this in the kernel!
Also, good luck convincing people to use uintptr_t instead ;-)

https://lore.kernel.org/all/CAHk-=3Dwj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe=
7A1d-g@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
