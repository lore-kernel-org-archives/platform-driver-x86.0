Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DBA29A30E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990103; cv=none; b=kHcp5nqgHwi1+IzYsu6Nfc1QUAoTepu3HHosw03t9NmTghoo3YgYGqxOrVC3oIDSpcl+Yc+MgOdoNN1T+/7NND9tnAvRYCykbpEtGphRRNiPr17z+X1PveI5HCbyb9wVv3akA0AmpqZiqgymXm5OAuwYHO/nY9uRJszEEXVvYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990103; c=relaxed/simple;
	bh=QNbip2clQRw7IHVEsV/Z5tsdq/znJheMAv/OOzA0yoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oz0R9vyeEQwYaDl1mES4QLVJ2qjMMKbaiU+SVRHWxwGfwa/tUl/E/BY0hHyOGmmS6usM4FF+blyo53BZH+yZxiOsZUPYWslQgBY/kJZ4smmh3QgT7KdFwq3nqxIlzKedokzG4zOjOWaxjS5q+VskIBSnabpLVb/wZroYN1Ys5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTR5SNSj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTR5SNSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC0C4AF0B
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770990103;
	bh=QNbip2clQRw7IHVEsV/Z5tsdq/znJheMAv/OOzA0yoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tTR5SNSj8KZ6YbViKLbJ+HDVN1FclzeZFIVXJ+UjUJkEgIDjY3IIvazUQipxBtnP+
	 3p5y/IdKjrr620N67oCwNW9CY/igK/JHIwRyH1AHTdcyUByhImRIOFJr1+C/hF2mlv
	 sLQP5BPxOsDicm9hPJ47jeGii0c11tTO5bIXF04KuB+CE37XGMf0r8kegr93IRiP69
	 Od4PeyZPK1zQJw3j/HpohIIgBMIh+rvDQF2sPogeXOZQGZ5l+inTsArqRKyNnAVH9n
	 ZV7XnxktC6GW9KLjyccD2LJBpd3a0psPH58nAp6NJZHgO4xyKOwMeioXApnvfBKH55
	 VuLaCjlYEy6iA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870902760cso6773221fa.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 05:41:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgqPjCxHfMyxRuoi1EMm9XFbox6PnLg3+q0Xft2n1JEnkaINIUR/Gs1o2Iva6P7NW9DZXKqz5R4tHqcuhvQcsMDy8p@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbknEo6Hx0N5kRK0cOS6QjfneFRLwkIv/NmCnX1EoXg53tIc1
	xTqp3T7BDhQAWut24dYVZc1KknSa6psQR8J0aOIVlzPZbffJS6gDwM/svDfHq1/3VjkWvYbgkt7
	31mkcm/hoTn34yv+0RX/dyCdGNM2VecoDi2nZKGKTUw==
X-Received: by 2002:a2e:b8c5:0:b0:37b:970f:d33f with SMTP id
 38308e7fff4ca-387ed8c7b1fmr6575001fa.21.1770990101932; Fri, 13 Feb 2026
 05:41:41 -0800 (PST)
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
 <aY4K2qbxNmsotwu3@google.com>
In-Reply-To: <aY4K2qbxNmsotwu3@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Feb 2026 14:41:29 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
X-Gm-Features: AZwV_QjiCFLWtWBe3s66j91OAqQhEz8ZFMRryqmsrUluGYpdvq9Ce4b9RlIFQKo
Message-ID: <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 6:19=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > OTOH, if there are more than one of a such controllers in the syste=
m...
> > > > And it can be found by reading the links that one of them related t=
o
> > > > a certain GPIO device. So no insisting on this.
> > >
> > > If there are multiple such controllers we cannot use a static softwar=
e
> > > node anyway as it should not be shared between them.
> > >
> >
> > In such case they should do what OF nodes do (and I'm sure ACPI too):
> > use some ID to tell them apart.
>
> You are missing the point. You will not be able to use a static node and
> export it. You will need to create a dedicated software node per
> instance and the provide a lookup mechanism for whoever wants to use
> them to locate the right one.
>

That depends on whether you know the number of instances, doesn't it?
If that number is static, you create an equivalent number of software
nodes.

> That is inherent weakness in identity matching - the rigid coupling -
> and that is why I originally implemented name matching which allows for
> weak references.
>

How does this name matching work for multiple instances? You still
need to have the number of software nodes correspond with the number
of devices and their names need to match the labels.

Anyway, that's purely theoretical for now, let's cross that bridge
when we get there.

Bartosz
