Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A73333F384
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684397; cv=pass; b=N0uWzgbk4zO/StpRHDb+eeBXxuopDcrHycwGGQ4NDa9C+cO349MJMBKHFu0oQWshWKQAN6kRoMEFq87jnP15QI36nFvhcuwg/ah8WxN+2kLTECelvHLE0pOzfBwQuA9lQKhU896cRZqYFZAUX/W//by2jhmlFqruWjedo5pEB4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684397; c=relaxed/simple;
	bh=biEuRqbQlZGtWmjNmziN102BJYMjVdXB3oP8nk9hqwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4wlosnZ+EnplLin3F5Z93di3JwWbzoss+IXb1zKiTV1X8vJTeNv/ewnXg+bjAQLNdhAgIg//ZQymxqwv/Ccz2Alkq+wGYAEbDqmhnasosjhCFDiP+cwsmD7I/PxfZhoN4V3ofdWQ6zPpCHtDupS9WSe2DPFYUDk4TTLcDF2nnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CslTZ8E8; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CslTZ8E8"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so4831139d50.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 11:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773684394; cv=none;
        d=google.com; s=arc-20240605;
        b=c2PL3bq80H5Pe5WjKOAQDvd7PAiUcvUDqFjge4Bft7Jlmk3trBd57OU4G50nh6BAEy
         eJh+4qDL+XWPxkbiB9sNuyz/AJjjD2LNVHw43kBogffC1T6+t7SbMXV1siRzZ238TDLs
         ScTc/NZsnc+vhnqd4SsW1S6AlvNjHd2l3qCZ881BebM18juu+iJydlrecwSZ2ojD54tB
         EhZP/ZeJ3wHdz9Ko2b5L24BKexdh/uhcgZo6cNeFI9mayr6OaCRphzV0RsVzsBniYcDw
         J1X+Wji6YyOpCo+jjIJn1O9WLd7MJmhOzt/3lpTJah1umsJ3t2Cbo25YDRssOZjRXaeq
         93NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=biEuRqbQlZGtWmjNmziN102BJYMjVdXB3oP8nk9hqwg=;
        fh=0w7LRutbGDgnAV81WncBjz9RaeBmgdHCwi0mMrsg70M=;
        b=btwjbKsVe40OcqxLtTdyOd6e1vnpI/ZYIHK0YF0syHhDeBYoyjKmQ86qE3yMznbywA
         J6G8fmwVJ2LOtOl2/+oDTbgi0kizHdbTwjxJELdh8W5cpxbmwxTlON/cdq5QjgxqVFiy
         3Ff6nMwrirmQw0pyTeOBvQw3db9oYz2lRhdDncFOe/0LV8FYS0r6ilm2q2oIa7tjU6cU
         /rAtmGs5EwL9IbZTaliCfV0qSBAT9834l3zRdiRrrUx0SalkMFEsv4blfbcuOZmbvYgi
         Uix4+ObAJ5oz5+NR3lOX3tvYZ4Fmw7MJ3abSJwpw+8uWx65wTZOfpTHa/eIWXV5JyUDL
         ZJsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1773684394; x=1774289194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=biEuRqbQlZGtWmjNmziN102BJYMjVdXB3oP8nk9hqwg=;
        b=CslTZ8E8LFhQ6ELt79J9mQJh9jkSGe5EIJrXGEkhQ6KccEksgczRuC5PnGnUNNKUCX
         uhTI/Bz3/JfkKNhTwLkUZ0R8ZdxK/kOpboV7saGhEc9hhClHHiu15gzVkGH43pIIvGB5
         DroDlnYzuevjWNOVFLDssf9GzAE9CekSFrR8jKYOtis7gezB+KiMoGK4RZOCOVR59kOd
         OeV1TidDwd5ZgiPeSLgsDP4WbGt4O8LcvFZcSRKyR2cBx0jhcgGeI5Bc2QpBN2wBlgbG
         mcK8iq/0K+bH02UkKe9TdgcEWDfiD6GRUc+kC2Uhu6LVdXmUNgZika5D7GxlQCMyZnYh
         bRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684394; x=1774289194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biEuRqbQlZGtWmjNmziN102BJYMjVdXB3oP8nk9hqwg=;
        b=lBLriSCOjOELB08DQmLdRfJwVNJLhcD6flgP5+ZCHbtZfJ/akB5lEgEdonVhL14WOD
         83sIobrZlMpnjZwvlbKZDuQHLr25cWZ7lS9vGi8r4SSgPsGvf19cdpfBHlITq3q/YW0L
         BNMPbupoUikWyV/D6kAt8hZWQwIx7S7kq5ERNC+MP356eTyY66vYoYvt+ox/QDJm6o7y
         c4N+B6YnTRM12DNhTzY5vEVjauo6RkN4BLzUERZg3JeuCtZhEvcdteI+gpUbpqY2vVY7
         FKxEZs1SPbg8EqBypqHZSdje6xFAmplpOjLnLvZdly4C+bvVdNonbHN6kWQ56HbJ2cep
         FaQw==
X-Forwarded-Encrypted: i=1; AJvYcCUv7UXAkSePpMIijod4eSJCwR3crhDHjpqLPZwNUHNpCIaMtZfHtUoqNaSQ2q0SKQGDpQ6NzSFHoNHkb/z7jJGCk1jU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4zAOHg0vRkDMlbqFiEeWnG/9k+Hz3FjIWcnAOlSqUdk4rlfTe
	YuejJcolUWYDPxVbLmL/+dk+rHWxcfaTJZfrK5rX5C99y1rufNxLZYDPWmS9UISfvuhaHDoQig2
	yum0jFEwMxMEipUq50jUoVAGfuzVzvA==
X-Gm-Gg: ATEYQzz4H4UiFnFM/WTMWdoEvEVV1xi8SsYm2xELRf0x7TvxRKhKVMNPpLdIxZ0duG8
	Ux+rKHFvDnswNjmkjAqNR2h7TL/HTLwRz5LFuWTo9EAk0rGKNunAwtfG1IV6u57c07lHCCA1pgT
	AvHR+jO+lO2m361zYgkKZ9nK/w1NRtnbH0RCrSxzO0E9A4ER8MqEltq6tmPTcvjiFAC5jA8xDWA
	f0d/ANmzToPVhf/tKFnl6ISk0p+bumgKNpg58XYT+vr7cJkATH9G3zSfbtvB1iKMVj59d9TnmGw
	HfmLZBSbXIKuJI3xIc7/+R1GuhWlsgtfVYyiCnwBP11L14YKcQ==
X-Received: by 2002:a53:c58a:0:b0:64c:f4fa:4030 with SMTP id
 956f58d0204a3-64e62fa0da1mr11320229d50.25.1773684394339; Mon, 16 Mar 2026
 11:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314142236.74514-1-pithenrich2d@gmail.com>
 <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com> <080e0cbe-d8d0-48af-abe3-f10f5797333a@kernel.org>
In-Reply-To: <080e0cbe-d8d0-48af-abe3-f10f5797333a@kernel.org>
From: Pit Henrich <pithenrich2d@googlemail.com>
Date: Mon, 16 Mar 2026 19:06:23 +0100
X-Gm-Features: AaiRm53HViHDZkPPl4liFsHwxNtbShLGV1YDMo3VkL2qQsRl2WhwkH3ELFJljzg
Message-ID: <CAMBPg2c7rev33ZcF+5v=6AmCTPROBePL4Yotb-QskXdtCkP4vg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
To: Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Mar 2026 at 14:24, Hans de Goede <hansg@kernel.org> wrote:
> Looking at pictures of the Fold 16 gen 1, I assume this sysfs attr will return 1 when the keyboard
> is clicked on one half of the foldable screen, covering that half so that the laptop resembles
> a classic clamshell design in this mode. Since this is actually covering half the screen I think
> that keyboard_attached_on_screen actually is a good name :)

Yes, exactly right :)

The keyboard can also be used when it is not attached, via Bluetooth.
And there is actually another way that Lenovo intended the keyboard
to be attached, but that way is not detectable (and wouldn't affect
any functional behavior anyway).

The intended userspace use case for this sysfs attr is to detect when
the keyboard is attached on the lower half of the display, so that UI
elements can be moved up and only the top half of the screen is used.
It's a very unique use case for sure.

Greetings
Pit
