Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2221C16A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916066; cv=none; b=ZAM+Jo7qO6UDhPF2PDyjfWqBgF0npgs3tJvVIV1ULsRpLsIBZ4axwgcLH/fo/S/gRQgNd+FzccxlnQoEDQBZN1rhxy44jstljkxT7kJ7/Si3Ni0mWPEgk0kMUVXkw6g0xlJwaSlHMXnV6a5HuhtkwQmn2L2x4v4mvTuqaJc36UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916066; c=relaxed/simple;
	bh=BqPI7Q+BS5GwFW+AlLOvxwUaFxYu6CMbtX/MaLdXWZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDJJP7dMVWBBTc8eoBhvJFN2dbtNfjbkrfmAoVZzNthRSOZ7v/CRvhXfpnSdpUEHaew2YtraADoGYFw8qQu5WOLj2crD7eYKF7WhvJlwRiuqrskyt/S2IcCZKQ0QWs2Ipmt9pMMjr0pzPnFykGPDjPFM4TQ6fE8EoaPkOMGBFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omEaaPwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omEaaPwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7494DC4AF09
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916066;
	bh=BqPI7Q+BS5GwFW+AlLOvxwUaFxYu6CMbtX/MaLdXWZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=omEaaPwUmfK5jW56TVg9p5iekan8eDI3QJG5TowzixfZgITuL+OSa5+k6vy/SCr2k
	 XCUrgppdaiJTcD96G7WzT29VuiVkiZlA7LB69qODp6eVtMQ80tH3ui/DY0bPaSpFQ3
	 2w45Fj7Ys+KPhrZ6YiV55nKcUkVgcdXJo8+XZMEtgCNyAn2LLCJa6/4mqbDQ4WGYJn
	 zmlc2/P7CnUttwSjQTxuxA3JOCDv1kB6MiuRYnb8UoRZwrtdZpBD/9kcUcGbWWsruT
	 WJNDVyGAAabJW+WQt5AuYHgl9bDmc/uDg4Tc4a0TCki0qlzeZxQPKln51ZYbjerD+Z
	 06yEhff5if3wg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dcdf60427so3419429e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 09:07:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXXzWSVgdS6mZ63dBMIn4m5zvhUF+p4uy4TChAs8atlJ7wKcYB46KQ9LO/880ACpMUwKwVzqIF+SZuqJYssGVKDiIg@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMq6B5fWHb6ksl7HO6DvSflcFl9BAEWLjdst4Rvwta9J1cboW
	TE9D7TWBV+THu6YuVmFfhImBjKMHpfjaCUyGjXi+/ssEmzZ53JDYf9LiW7oEhOKGP5EZtu6o+vN
	a3OcAjcoMbc3FWmhN1gPdTjrbb6NkwOJz7of9SRGQRQ==
X-Received: by 2002:a05:6512:144c:20b0:59e:6256:4d9d with SMTP id
 2adb3069b0e04-59e64f241b4mr774598e87.5.1770916065076; Thu, 12 Feb 2026
 09:07:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYoOKBMAsTuwHKK0@google.com> <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com> <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com> <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com> <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com> <aY38ZBTfbf9a7Unw@smile.fi.intel.com> <aY4EqvRduJnlg3iC@google.com>
In-Reply-To: <aY4EqvRduJnlg3iC@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 12 Feb 2026 18:07:32 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
X-Gm-Features: AZwV_QgMRUAuViM3QMHu49-pnh3VozSPVEC0E9cm3BatKrQX7js0G_W4f6AKD-o
Message-ID: <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 5:50=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Feb 12, 2026 at 06:14:28PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 12, 2026 at 06:12:56PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 12, 2026 at 07:49:31AM -0800, Dmitry Torokhov wrote:
> > > > On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > > > > > <dmitry.torokhov@gmail.com> said:
> >
> > ...
> >
> > > > > > +const struct software_node lpc_ich_gpio_swnode =3D { };
> > > > >
> > > > > (With name, please!)
> > > >
> > > > That we could match against... /duck
> > >
> > > :-)
> > > No, it's for the /sys/kernel/software_nodes/ to help with debugging, =
et cetera.
> >
> > OTOH, if there are more than one of a such controllers in the system...
> > And it can be found by reading the links that one of them related to
> > a certain GPIO device. So no insisting on this.
>
> If there are multiple such controllers we cannot use a static software
> node anyway as it should not be shared between them.
>

In such case they should do what OF nodes do (and I'm sure ACPI too):
use some ID to tell them apart.

Bart
