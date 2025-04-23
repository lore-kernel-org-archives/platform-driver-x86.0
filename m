Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724E27815A
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397510; cv=none; b=FbsrWNWY/NP4XVezG5NQ5urtCCOXGHXI3kHz49HRogCZNqMaRE/8p0elCGQU29DqJuJDJKUx5+9qPnhQQ3tQ9k7J42LggkLTgCtnns370nbxHeGTmwMVjl9GEoJs1Hr8QaGjM3z79FDnxiGf2S1BngBsrBqd24dxGJGQGGwmVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397510; c=relaxed/simple;
	bh=qBj3z1T7rwn3ux+C+eO3W5yXwh6jAnKUWzTTH12y0wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DN9Y2ztgQM6N4hJ5CM+If7oRsbdvR4b+PGn++EVepFBuoU3nmAeQfP6kVREqSMZU6trw5odytGiyt8saNBzhp72cto0bUPWGdCCEu0YUUbIgyX73iVfKrBJTvKbk3xRspPMyyMsnt6IFnk1CgQet1eL6bMzu+bKOSLfKqAvkr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxM94OvQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxM94OvQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5865697e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397505; x=1746002305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=GxM94OvQC4I9HSK2KjtMN3KM5El3+HIV6zBJJ/20o4NWKjVnnU44pH5Yhx0VrLL3f8
         NMV1HFXVXZjBD6ilOxRE+2UmeynopJK7V/cG+hBqdWErXemanc2pw5uqvI27lY9QQBF5
         0HlZEZrUy9iWQ5nIVHyxvUrclhU5e/P0J47nId9AnEqZaiKYYJEBjMbQ2y9BeOqWUN8D
         X+TtiM2u4nolK/b1WZ9NgkEhp3rsQPlazW8u4NknmQVGtHMEIu399h9h8CMbOscCq1TG
         6Tyes5Z9d1PN3dlwuSiohvm/fjW7h0gVLyV2eY5sDzeREivCJKZz7bRb+uaWbHBduhMe
         ORyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397505; x=1746002305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSDycrf39wnAyWpIWRB4jBBrGHgujqLhxop3dNMcnqc=;
        b=tl5v2hwR3R27q7NIjoSQ/UpCq0TQAk7CBqcJHKtN2dSOEPqVdYymIz474Tltp/U81x
         1rf8xpaD6+4C05o9eghhuLmPRkgNYY7rMYM1cVIKyYXIi+dEkLLsAhqMB6CfrZVHoATr
         KXs/Rw46tdnHffhGTidaZliMTomEs3X+wstFxMebO82hU99643k/Zu4iaukKk9bFrSGA
         G7j+Yf4SXRllB8ZYNIAVLKE3W+AD5sWNdTLLa1tAOW5fLV2rYB0nabIW+Nc7og5RFGKW
         w42w3m6inJtHeptqRr+6Wh/79qdU/GCXs93ta4rb/smBMEUNyRe5G3GPznqx9lPyB5VZ
         MEcw==
X-Forwarded-Encrypted: i=1; AJvYcCWvJHW5q0RFjOx3/VJwsOWfFIrxs6Osn26mVX6U6+1KAY0OPEQzzQL/yvD2Mi2X9MrvYPwXF5TmTkRHJZVUwf0jCA6g@vger.kernel.org
X-Gm-Message-State: AOJu0YxtskmglyrrxRbRyh1I59nJKMArcwR5LECVBfg0BPtBZqt7CW1T
	FGx802gBQpIh4KOTNHlVbvSkGBzDYJESlC48xk6bn6QZ7w1WaAsQ0NAPotVd3XVUl0vzgokD4yo
	K/jT1BGCF0syfGK+973Yfh5KwjCn/VrnucMpanQ==
X-Gm-Gg: ASbGnct4qyA5K62MrLnJwFdKGPjvbTzk09Nl5/Q6wMWsIxKyBiRDpHAsrYY3u9DcAKq
	NYzS4SzOdUQFIS5e/jdN6oGOtC2VknaY7n6A9knVWwAeNe2iEawbep0I3HAmw3yKnj9eg/ul4mH
	pYoWl3k4gBjWODkasSYazXkw==
X-Google-Smtp-Source: AGHT+IF2teZ+utBk3nbrptOE1OwOQHV13ZcYzWp4JC8Rks36uJd/7V0CNyiI6xhWlLjjle8y5+kVGlRVXioIPF4arc0=
X-Received: by 2002:a05:6512:108b:b0:54d:653c:351a with SMTP id
 2adb3069b0e04-54d6e631790mr6082193e87.31.1745397505326; Wed, 23 Apr 2025
 01:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
In-Reply-To: <3fc723de-c7e9-4a03-852b-93d5538847d7@portwell.com.tw>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:38:13 +0200
X-Gm-Features: ATxdqUGxmUFjZwr7eCepx2PgXtnPDoeuvGQPnxU2bfQ5F1M995XyX7ukEGxVZ7A
Message-ID: <CACRpkdZKuiR7jaa-gsVTc=w64yhXv_Pny9u_zOkHDjcyXaXSeA@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, brgl@bgdev.pl, 
	wim@linux-watchdog.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, jay.chen@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yen-Chi,

thanks for your patch!

On Fri, Apr 18, 2025 at 10:24=E2=80=AFAM Yen-Chi Huang
<jesse.huang@portwell.com.tw> wrote:

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
>
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
>
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
>
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
(...)

> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0=
;

I would use BIT(offset) instead of open-coding (1 << offset) in all of thes=
e
instances.

The main reason we use it is that the BIT() macro hardwires U (unsigned)
to the parameter so no mistakes can be made (even if you have
no mistakes here obviously, it's a good habit).

Either way this is not a big deal so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
