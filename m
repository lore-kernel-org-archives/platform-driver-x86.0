Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647C0381AD
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Sep 2024 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589264; cv=none; b=fczOG7yVYIlQKIPcRLfg10C++su+IHrRREal7NVMnH+PfwdK3fsX02vSD4B4fVJOhBGV0OB9+cgb144nCFOJXXZBZ2u1WzMsoAEST6sVY2HNnKB0o1JdfyFfw1XCamqbs376+K0Xz91/QLmMFNL8jE/7J7sflRW5IJIyz82ROac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589264; c=relaxed/simple;
	bh=JIQNcd0t1lA3YwGxvO9W/1yWR64K8A/Szr46CY6CL6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut4p3ThcA2FUayVVf9e0Gkrp+alFQ8oM70ZUHRdYftVCziG1MtdI8FsRXGm5zq5tsnuIKBnhYy0So8mrDK65cYik/zQVErsW1Dwilz1dbkk6H//ptx5o+9q0A3BCG6IVNgNf5lEQlvnvPRLAJimY6Ea2QlD8CDNvywiDslLVVow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZIxrw+aN; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZIxrw+aN"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E4DC53F5AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Sep 2024 02:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725589253;
	bh=WQPEUq7feoIG55GGUqRCXiORPRpQ+XnJ3+6Byz4Q+m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZIxrw+aNjywyQqLYs8zCOWQaJa4q5MIxGfG+SZj43IuPVYdhC+MgHxefTmYmOLslK
	 tCkED+MeJo7xn2u86KbIbi9KEzZ9Kbr6+5ZSXjgL7dJFYz48B8kTBJuJuSBG9UcsTT
	 SL0OOXtD+7RtL6hgWdNXdWn4iMm+xhLR1vuMnznkWhTbqK93NVeddfMZuLKX34LVaw
	 hR0sBohZ4yLc3YoniFuxXm0mG7TsNE9wvKysyvtcmAUPfpRtR+pmyWXhjatY+O3Te5
	 cRUiHhFjUs11atRaGA1IZJN+qsfRrPrAw0XfKVPMTSXNYt1Di2r+XxTmzQXQi47E04
	 mGJ2GgotpY5kQ==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c24cd1e1bdso1144346a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Sep 2024 19:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589252; x=1726194052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQPEUq7feoIG55GGUqRCXiORPRpQ+XnJ3+6Byz4Q+m0=;
        b=sR2sic1tHsZpWAIM5FK+F2sV91SCLcctc7B6KX5gkZxeUDOtoFs5rKv9fsMOuDIMbU
         tmq0F53zyyov1A2zl2qH0skS4w8KsLhzlOiXxiKMVGiirBIUWbI9wGg8D855QCZd1KqY
         tGSVOsE4LF98zGJDCrH9R0UXGChgs1pbieLnEnR6PcVGtc7oPNoN4/j/7ZxNE8wrLQlY
         68ezGQYkIcar9lp4RSIAG8b2/dANL1XlD785n5vFe+TgHltVC9zrTecuKQ9H6KMwVx/m
         zBph8eJQZnBFuiIjzs7dl8xCZvjr+DjoDb8DTQPoKA0FcbISLiXFov85vFrNHRFyLTwO
         4emw==
X-Forwarded-Encrypted: i=1; AJvYcCWoLjP3Nmf0Cwmhn+RsgajkZkt/I2AM+g31vuWC34uRR2orMvm2IvGCd449rhks7yid0+3oe0bBx+jT7pKrpLFBIfas@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbD1adSD9fsQwQSk7GwtdPSkEkW3yo2KcXSBRgx1WBK/37BA8
	Y5s+TCI+zg2NXOvwkU8Xawg1HNOFtL11N3uJSUoX3YI97E+ffQQioQK8JI2C2D5o3XaCSIqEnQB
	tBc+vOwdQo9Plw4YmvII+jkCis1bgmjWA8/k2uPBIgF7YXRisMJgW8KZKQ1NU8fu8L1Ez9mOA6O
	tGT7Bsvg678myh/GAjKKGLORFahUAyY1/6S4JZCpyJI3VqlPDo8R8F7xUAwCu36w==
X-Received: by 2002:a05:6402:d08:b0:5be:f295:a1a5 with SMTP id 4fb4d7f45d1cf-5c3dc78a59amr445860a12.10.1725589252400;
        Thu, 05 Sep 2024 19:20:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKvx68TjuIu907/2i3MdI5p9PE5yWLsu+o9PcDePGulmT7vZH7GmhLiWUwz4CIkWnGkqtXwJFCCP3aJ1iGl4Y=
X-Received: by 2002:a05:6402:d08:b0:5be:f295:a1a5 with SMTP id
 4fb4d7f45d1cf-5c3dc78a59amr445846a12.10.1725589251889; Thu, 05 Sep 2024
 19:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905042447.418662-1-kai.heng.feng@canonical.com>
 <2024090516-battering-prompter-3f53@gregkh> <CAAd53p5tGvTh_zP8BdBu1o0t5=s_uBQuctKQcwCNwyHo6Fx7oQ@mail.gmail.com>
 <2024090522-suggest-overpay-9fba@gregkh>
In-Reply-To: <2024090522-suggest-overpay-9fba@gregkh>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 6 Sep 2024 10:20:40 +0800
Message-ID: <CAAd53p6D73t7o8g+9zMYg=c78fGBZCMEnf55XgPQB=jjVY+Y2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: linux/usb.h: Move USB port definition to usb.h
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jorge.lopez2@hp.com, 
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Sep 05, 2024 at 02:24:31PM +0800, Kai-Heng Feng wrote:
> > On Thu, Sep 5, 2024 at 1:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Thu, Sep 05, 2024 at 12:24:46PM +0800, Kai-Heng Feng wrote:
> > > > Move struct usb_port to linux/usb.h so other subsystems can use it =
too.
> > >
> > > These really are "internal to the usb core" functions and variables, =
I
> > > am loath to export them as it requires that you "know" what the devic=
e
> > > type is of something without any recorse if you get it wrong.  I
> > > commented on patch 2/2 about that.
> > >
> > > Could we provide a usb core function for you instead to help out?  Wh=
at
> > > exactly are you trying to get access to on the USB bus that you need =
to
> > > use here, the port or the device?
> >
> > The device so the quirk can check its vendor and product id.
> >
> > That means a function or helper that can return USB port/device from
> > an ACPI path.
>
> So you don't want the port, only the device.  Why not just search the
> bus for a device, you don't care where in the acpi path it lives, right?
> Or better yet, do this in the driver for the device itself, that's when
> you know you have the right device.

The crucial part of the quirk is the device links between VGA and USB
controller to enforce suspend order, it can be hard to create and
maintain the links when the USB device can disappear at any moment.

Kai-Heng

>
> thanks,
>
> greg k-h
