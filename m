Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378D26FD93
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231893; cv=none; b=O1e4S4UnhP+eZZMx9L8WaBLnRaSCROh/+u/7MTZTHTHFhurh/DSUiBMwk8bsD3eEpVxZwQNRFNiZH6UFCv6zu2MhDS0f68piNruYxwx1DOeiR1/ckM8o5Js4fPWUcDFOy7BNmgnvjK+Yo/uTihwk1kOwn0VYbew3MBWq9pWPpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231893; c=relaxed/simple;
	bh=95BSoRLY2EGuYIFg9tft4LiQpwsyprVI5w8pWhacX10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCk51i4Iu3eW/CXeMV0oOC7cS9a/3gQa2BD4QEWeFN1kgPusju2LzeFZu6DM5JA/46eDdXTAZ6FizAaYbof7zh4x1CMFguKUto9qGJFDCT+I6H35/wKNGaTnHJqs8m7Zon4FwYfNohywbXlfW4Nw6ZVewSw2x0FW18mOem8F+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlJsV2V0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlJsV2V0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA7FC2BC9E
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771231892;
	bh=95BSoRLY2EGuYIFg9tft4LiQpwsyprVI5w8pWhacX10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nlJsV2V0zA5b1xB5ICDKCbGUx5Njascw8G40H/po5QA/kGj6NkKzC0/sv41bjz5t1
	 qos+DGMNipt7bfldvq3tmMR6QIfb/wvpl7ydOYaNumwuhbf+0KdnM798p/20OIZctz
	 4nRmo/qltskQC4LrSkVU3NJHov153RWSyIrzl6tYIgy6d6/bFAkacWBZatxRlIxdCX
	 XiAil/XOsxGL6UZzACvUBxJwCFFrz1QjyQyfom5DqLTMBdYQaCMkruPsRIB7fS3QlR
	 qTg3jmesF9r1lfpQ8PiDGNEeY2l9CgjVYzvsmHoaF9lZSSQE6bHq+xS9wnGJKWA8md
	 YGPID/bYWwpnA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e6253b16bso3071977e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 00:51:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqxEtShUT2/zfGdD/pTAtcaV6ZtwmhUxSdM56UFKWOj3tyZfDGw+HVcpd+8FkP6ozO89uvs/gtL837gtmULOOhgIVE@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHz/+kdBBJgSsCxX/ODfJQGI6bSCRSvMrBMl2VZLwf0Z+ZjA+
	89QGa2OySMCIqQYI5KlgCnFBsA7GMwIPp/mZbgyhbdcruThDVYhf2+LdSiSs3/SSWzijtBKwaLo
	aNJi31LyG4KRD6EzxmcZ7JUxBeV+WOGI3duExUM0o4Q==
X-Received: by 2002:a05:6512:3349:b0:59e:1663:941 with SMTP id
 2adb3069b0e04-59ef97e8962mr4431369e87.3.1771231891364; Mon, 16 Feb 2026
 00:51:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
 <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com> <aY7r9qr-ngFSw7MC@smile.fi.intel.com>
In-Reply-To: <aY7r9qr-ngFSw7MC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Feb 2026 09:51:18 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
X-Gm-Features: AaiRm510_XxM7l2zcP7qLr82EYQRK-5-nrIaw3kGqxxz5TcMb4JW506DQB-PKsU
Message-ID: <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Peter Tyser <ptyser@xes-inc.com>, 
	Lee Jones <lee@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:16=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 13, 2026 at 09:25:24AM +0100, Bartosz Golaszewski wrote:
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
>
> ...
>
> > +const struct software_node lpc_ich_gpio_swnode =3D {
> > +     .name =3D "gpio_ich",
> > +};
> > +EXPORT_SYMBOL(lpc_ich_gpio_swnode);
>
> Can we export in a dedicated namespace? Perhaps "LPC_ICH"?
>

I can't test it so I would prefer to reduce the amount of runtime risk
introduced by this change. We can do it separately later.

Bartosz
