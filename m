Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337053EE1E3
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146432; cv=none; b=bRRyPaOByTPxVdd9LsEtTLkqIkMySgvINHwq0JYgBmPGdssi7jroWm3elRzl+fGXJRgxN6uSvCVwvk1MoZzdUmC9KAArgXOwe5Yhzu5kLRtygIRufGv+PMYvdiPzI7mvknT2msG4uu4PgKBGUQ21L/AHXWlrf0b6ljgVfEo5SpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146432; c=relaxed/simple;
	bh=bpaXyBJBrSPrLBRgiqnTKWHLNSU7a6K1w3cRWPI1mpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESriRXtivKhIDODqxEn/bz/r75OcOKuWBxqpSqZME2NITT/86phw4OYWwmklKKNFVv/HX2V3yk89Iu9UfXIHemrOSk04XRm3e4yelXD0DUMqTmVUHR2oiLpkZiKYvHnRy05HHlB6zWXDjn/45e5Q5j41CDyUoGuH+S8rDr5MAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zgbbpb20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zgbbpb20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F43C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775146432;
	bh=bpaXyBJBrSPrLBRgiqnTKWHLNSU7a6K1w3cRWPI1mpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zgbbpb20N6UZM8jgygkDFOLuCRpl+me8yiX1OCcVF5NRmuH+87qCoDC+MA+SpCz0R
	 ocu/S/OdTW9ICvWREgnnva145QNKcoviRCaxt2sS9dPVUTzvGT8qQ0xuborXepjKMH
	 BmKNUrm4xvZpyi+7EEWyPu0CLklMURGODeR1Yu7JzndlgrIYr49ltNxFYgYtIHtlz7
	 C7SJDo68DaHEfYhufP7G4ZzCESDOMKTsHYIPWTREFkpeUyKiatkmsUONcOZ0WHvnOa
	 JjVMQG+fOQOuwOdap8mg7jqOHpOhtGWfm3F8XAww3MVIStaciK96r/6HorGcWJYmcN
	 gT3lAa4J/xDOA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so734560e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 09:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZO/0JM44hX9azip6k9yjcc5ybkjv4STRuDLg1EdhZF5VuMyaYvdeklBWjvL44rLqgAm47Tjj7/gO0AQOhGjIdhEwm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oKmCWGK0oM943eKy9bItTEONXZPvysP33Msn0zCOBJyZXRpF
	nvMZNpD/iRx3Lo8ml5zdy49d1csD70/yCmzKX2hbN9L7+K6grcp/INxm8wNfiqxwKU9+54Y1ap+
	6QVgpPXxm+QKjGT3mqPMqxQzcHprGqeeklAAvodsX1g==
X-Received: by 2002:a05:6512:2245:b0:5a2:aa9e:514a with SMTP id
 2adb3069b0e04-5a2c765207dmr1397100e87.17.1775146430480; Thu, 02 Apr 2026
 09:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <ac5t5XozmzN9oq96@ashevche-desk.local> <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
 <ac5zhZAyiwbUwzWo@ashevche-desk.local> <CAMRc=McJFNp15jnrehGLHsmFRfBpRQoppmdB_51whzJUQ-5ZLw@mail.gmail.com>
 <ac6TwAL3fQrlpef2@ashevche-desk.local>
In-Reply-To: <ac6TwAL3fQrlpef2@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:13:38 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
X-Gm-Features: AQROBzDN--nJ03boWyopMUzSWNi-MrmE5jIFWCIeUFh6oEYVAABzLEK7KpFiZoA
Message-ID: <CAMRc=MdPfOB+xbHxP5rRfLmQ7Ue++Kb8iWaMU5hMZ6OvFqa01w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 6:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 02, 2026 at 05:03:10PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 2, 2026 at 3:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Apr 02, 2026 at 03:35:24PM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Apr 2, 2026 at 3:23=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > > 3. Export the acpi_bus_type symbol. It's already available in t=
he
> > > > > > acpi_bus.h header but it's not available to loadable modules.
> > > > >
> > > > > Nowadays we don't do that but export the dev_is_acpi() or somethi=
ng similar if
> > > > > it's not yet available and to_acpi_dev(). (Names are derived from=
 the existing
> > > > > pattern, they might be need to be adjusted, dunno.) See how PNP d=
oes that.
> > > > > Note, I haven't read the patches yet, just a quick comment.
> > > >
> > > > Maybe I should have said why I do it. It's to register a notifier c=
all
> > > > on ACPI bus events. Is there a better way to do this?
> > >
> > > AFAIU there shouldn't be pure ACPI devices, they are companions to th=
e real
> > > ones. Can we simply attach to the normal device notifier and check if=
 the
> > > companion is what we are looking for? Also since it's specific to tha=
t driver
> > > and you know what the platforms you are looking for, why can't we hoo=
k
> > > something into drivers/acpi/x86/lpss.c?
> >
> > The ACPI companions seem to only ever be added once and never removed
> > - unlike platform devices. This is why I prefer to check the ACPI bus.
> >
> > As for lpss.c - what do you sugest exactly because at first glance I'm
> > not quite sure what's there to hook up?
>
> Can't we create / submit the software node of the given device (GPIO)
> when it's get created (as platform device)? That driver uses a notificati=
on
> when ACPI bus is scanned, that's what may trigger the software node creat=
ion
> and the other end will eventually see it.
>

Yeah that would be awesome but you still need to export these software
nodes to the x86-android-tablets driver. I think it's better to keep
them in the driver as it's the only user and it's unlikely there'll be
more similar cases.

Bart
