Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C952F9998
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Mar 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804097; cv=none; b=KcDECpgCR0OcMbjYFhQFewu+07EvBtUvSlSj8i+6wlYt7DhE6Rmo6i4hXEwgmNTG2hIyZJiMzXKiuMcwM9ua10xQT69sSEZiYAr7CtdVuUefWismxZ7pzcrs1qy/4OGFWpXiiDvIIAH1e6o7zwVleSnMvlUDRib34NXBr9o47Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804097; c=relaxed/simple;
	bh=r15JQ3Eygwr/qXyOT6iqh1zhmee9f7yo6zjRX92AcoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9ARh1HNmMq3h3F55bOy+aQRGmcCgj/kw/Ud2Bp+4D2mVUzxfUlPbdg2HSN3V9LsnktEC9z8gWRT2vQuwJT4ytkBlHgA3BKw1PzWTgC/26zyiibhYVqZuDuTS8az+p3qUUE/PxYGRvBe1gjl+lOtaRCzpwJg12An+pPlFe2QwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMQIUwZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMQIUwZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A5C2BC86
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Mar 2026 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804096;
	bh=r15JQ3Eygwr/qXyOT6iqh1zhmee9f7yo6zjRX92AcoA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sMQIUwZ+TJ3zMOddsWrVRRsT16kZu1Z4RvOMEB8iQdA2O0ZhMIzCuXZeuT4XjTiz2
	 T0r4fVaI0Z9tGTExizQLSlyJ3rSEeQyT6UE2rsRpfuU+A7LrHLmJM8HE+X0jtZXIhL
	 Ilpt/6zOuJvYFUMrvP1DXgD5AGwKL+MEQpocku5wD8nC9bYTWmPLQu6mefjke2j03r
	 n5MUCJcu5eyQW2oTyrWxHpdR+bXj+aeEnh4hy7kqAotL5Ca39VywfQBdQeMnloaub6
	 cLhGnIEwe/k1XKuwE7A3FHQaVqHIc+11jl2sUSHizK574IIFFhTYUF+VyqJswhFEP9
	 x0Ma33YPZAEwg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so4327179e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Mar 2026 05:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRQkC5syjHZOjCQ7+hXujfHIY2JPAn2tRzol9YNBVvI0eNsWHsiXD79dpy7gwe5LGhb9TfQUFNFSo7i2ZUu92W8EPZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7qodjWcZhL8h1XAVL0oTAgXzOvdT+xGC0ILtnXSWI3N6K2LF
	IwzCn22RrEKUcv3pYTkK5TLaX5kyav8qpK0cBYGRpMCgOs2b+l/ASWW4NAqbvZqRZjH/5LhEWfm
	p18aO7wJKZmDNhNaguIDxfd+ZB0pVBNQkuslOw3moEQ==
X-Received: by 2002:a05:6512:63da:20b0:5a1:2c0b:bd7 with SMTP id
 2adb3069b0e04-5a13cd0034dmr602084e87.35.1772804095455; Fri, 06 Mar 2026
 05:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com> <177280162204.1002992.12499935361323933725.b4-ty@kernel.org>
In-Reply-To: <177280162204.1002992.12499935361323933725.b4-ty@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 14:34:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=McqOD6FTQ9OGWUatL1NHHiW_O0YUZZK=CSHxOJNadhqEw@mail.gmail.com>
X-Gm-Features: AaiRm531t8GNPqRJpktqeh98EGYDeRwxZnKzOu7MwSNf5_LlvKv0PbCCUz0atNQ
Message-ID: <CAMRc=McqOD6FTQ9OGWUatL1NHHiW_O0YUZZK=CSHxOJNadhqEw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] mfd: lpc_ich: expose the GPIO controller
 cell's software node
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 1:53=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 18 Feb 2026 11:48:01 +0100, Bartosz Golaszewski wrote:
> > One of the users of this driver - meraki-mx100 - abuses the software
> > node API by setting up a dummy software node without any logical link t=
o
> > this GPIO controller and uses the fact that the GPIO core matches the
> > controller's label against the swnode's name to make the lookup work.
> >
> > We want to remove this behavior from GPIOLIB in favor of actual matchin=
g
> > of firmware nodes but that would break this user. To facilitate that:
> > create a software node for the GPIO controller cell and expose its
> > address in the provided MFD header.
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] mfd: lpc_ich: expose the GPIO controller cell's software node
>       commit: a64ee7d8ddd6e04d82c06238a238b7877cbc35fc
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

Hi Lee!

Can you pick up patch 2/2 as well as per Ilpo's response and Ack?

Bart
