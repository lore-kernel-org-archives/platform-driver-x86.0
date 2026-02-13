Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E3F9E8
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999495; cv=none; b=NykGnUSU3tjYJ03tW03h6O4nGrRRd2OKrFQogvGCUTdWi16/dyjQ8xY22xcIkITQJPoxlAGpye2esvxpdB2AhUdudr9NNzHgN4PhHo89nGJgb9asiQhg/fBjTowAwqJ+JT28icKNStw+kPuKh9jU3V8JR5wYTSE/Wygfbb8l8kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999495; c=relaxed/simple;
	bh=0dHOmqwsxqsqgPXwvhq8yK9acGIcgN5JS5x51kVo+hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9H6kbSqyEFuogNBWGBrRoboSpEJqjiUCoNgNfS8UZutmoU2VMneG63M0ajO8qEh7OCARMxfds8/tt7gK7OnvTcyMYo7I0J3lxg++qsJm25y4zzK3HRyeU+BXrPHttzPEurhhN0nDPo5OM9E1qMsleFKdAz9q23i6lysApOHzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvcXIfgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvcXIfgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C0FC19421
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770999494;
	bh=0dHOmqwsxqsqgPXwvhq8yK9acGIcgN5JS5x51kVo+hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hvcXIfgYlGH3Aftk+/6D6CAPzmcbL/2mxrEjdTTgAmObjwcCRPPsXH3e+2vlL/e3b
	 bXksCmRJTMLwg4f26a8R08KSN14A0L2x0lxRinOP7ZB1OXXOGtJwPBLJCyTKU/Gn8v
	 dYpSI0NvxPLI5BoJ3ID1Mwnc5BJpixh68szsckJs2WtQEh0xTeaENknvgTUrT79t3s
	 a6S9Am9DpSbf0AtxFNRc62yeSPwmQ0Rt+WrucpKWx0Qvx98wW/sAxiX1yl3Tkagywa
	 JLzhEKqDQkZ27nP8OELcF9X4Cnb6NdAEbBa4MIzVAri9j/Y2zP6ec2LneU6P++lCEf
	 UkLhE+OUI2nCA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e699310a8so1598014e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:18:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrukMBfEDPfgL525ae5yJjlt7zjEGj7RHQhtAcH/iDYUFhhg/our9DTLY0XbPhyvbIMGkZbyIOel4g3EYyysCty6xy@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLqn6SMIOYwR1W4LnjZikaTRlJpYrgGbTmmE9FGagLeMNdgKT
	EW1WWERiBQPBjdOQbsqqCbLDiNbwniNkWGFoU8kvKg59CUQrDTkNHgr2anyJWVRh0K5MBnX+kG2
	xyzsYTHfQXIkeTqsuUyxXdKCmIfarJJgnA8fke8Kvew==
X-Received: by 2002:a05:6512:6189:b0:59e:5f52:7b5a with SMTP id
 2adb3069b0e04-59f6cff3969mr153267e87.17.1770999493311; Fri, 13 Feb 2026
 08:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYpC_XWNXiRmEdzo@google.com> <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com> <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com> <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com> <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
 <aY4EqvRduJnlg3iC@google.com> <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
 <aY4K2qbxNmsotwu3@google.com> <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
 <4db8b222-c80b-4333-bacc-25c1422c8e94@kernel.org>
In-Reply-To: <4db8b222-c80b-4333-bacc-25c1422c8e94@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Feb 2026 17:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=McEN=7FiaOA2gUifAAe8=cyh9fpJVQs7skqg6Wb4HAd_A@mail.gmail.com>
X-Gm-Features: AZwV_QgsadIceltVqWXj9Xo5ugnV8U-VQYFkMIx4l_FCAz2T2I4TS2K5DT18ZUI
Message-ID: <CAMRc=McEN=7FiaOA2gUifAAe8=cyh9fpJVQs7skqg6Wb4HAd_A@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Hans de Goede <hansg@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 5:05=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 13-Feb-26 14:41, Bartosz Golaszewski wrote:
> > On Thu, Feb 12, 2026 at 6:19=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >>>>>
> >>>>> OTOH, if there are more than one of a such controllers in the syste=
m...
> >>>>> And it can be found by reading the links that one of them related t=
o
> >>>>> a certain GPIO device. So no insisting on this.
> >>>>
> >>>> If there are multiple such controllers we cannot use a static softwa=
re
> >>>> node anyway as it should not be shared between them.
> >>>>
> >>>
> >>> In such case they should do what OF nodes do (and I'm sure ACPI too):
> >>> use some ID to tell them apart.
> >>
> >> You are missing the point. You will not be able to use a static node a=
nd
> >> export it. You will need to create a dedicated software node per
> >> instance and the provide a lookup mechanism for whoever wants to use
> >> them to locate the right one.
> >>
> >
> > That depends on whether you know the number of instances, doesn't it?
> > If that number is static, you create an equivalent number of software
> > nodes.
>
> I think there is some miscommunication happening here.
>
> I _believe_ the troublesome case Dmitry is trying to point out
> is the following:
>
> 1. A single GPIO controller
>
> 2. 2 different drivers which need to manually add GPIO info
> using a swnode with a properties array with  PROPERTY_ENTRY_GPIO()
> entries
>
> A (so far theoretical) example of this might be both the infamous
> x86-android-tablets code referring to this single GPIO controller
> as well as some ASoC board file under sound/soc/intel/boards/
> referring to it. In that case having them both declare a swnode
> for the GPIO controller and then both have them attach that
> to the GPIO controller themselves (*) will lead to a problem
> because only 1 swnode can be attach to the GPIO controller.
>

In case I didn't make myself clear before this point but let me
rephrase: It's wrong for consumers to create software nodes *for*
their providers (GPIO or otherwise). I hope we all agree on this. The
situation you're describing should not be happening and we should work
towards fixing existing examples.

> The obvious solution is to have the GPIO controller driver
> create and attach a swnode and have it export that swnode
> so that it can be used in PROPERTY_ENTRY_GPIO() declerations
> in multiple drivers consuming GPIOs from that controller.
>

Yes, like the meraki series I sent earlier today.

Bartosz

> Note, I'm not entirely sure this is what Dmitry is trying
> to say but I think it is. Regardless this is a case which
> I've been thinking about how to handle myself :)
>
