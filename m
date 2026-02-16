Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020FD2FF161
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236962; cv=none; b=B3toiFhuzi4sbyFvhmUpA7Y53D9eBB+MqF5WWkxI/v25/P/jwWVcG6/0Ch2/mv+OYkVd/lpuVCe8R112eVWEG+ul4YHfkY+PBuM26yDUZ9bJPymxm1Trpxs7E81eomfcQdQZKEPTShL97Nk03CnKW+BpWGPnfOd8/PIKpLoGZjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236962; c=relaxed/simple;
	bh=b7P+koRaNwzLg61m3UPiIh2MJkt6Q5Lh3Mxdyril/NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsMrILW4n+GrclJCqjZ9XMST29SIlvCtAIxw/awP/uFQS/V6YLPfMnjNbdZpNY9Q58TneZJE8mnnbGRsQ3ofxH9M4XrJpNJeHf8HDYQfDJfW2yGdRD2uatUv3++edoI2s20UBgB8+fi1Dzv8AW+srkQtbvAn3sKjA58kVCWFG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbkdHrFE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbkdHrFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D698FC2BC86
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771236961;
	bh=b7P+koRaNwzLg61m3UPiIh2MJkt6Q5Lh3Mxdyril/NY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbkdHrFEh2WA55dFb6keTKvEkvdeuKg3L+2EmlCi9R6kYDZ7jgpw83hviVXrHzw2e
	 HXDXXyYq614KWYAHT4r+AVySSHTZHO0gDKpnWAwwsnoxILvw9Vf6eZo64OjTgdTWnO
	 u2lyhFdPiYG0AT+gom3C3VapZFc6TLV2OhKxqOC8MxRsQjyZjZGevXZzNHO2zBcft+
	 hTGdzFkzVoTXW+cU9hQg9VMG7m8l3VD7f+c+w7+qO1BPadfFBWpqe/4vE80WpATg+M
	 w9sNKBKGxfOvvMvfLjpdQItPlL8dmdMMsfUAX8LfJNqKIKOQTwbahxmsoyICV4etnj
	 8asS9hbRISrLw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso4205808e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 02:16:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvAzl2b5n1a7yxG/nIKOTTptvoEPJIfJLQwsdtmqDClS0h5XBhu1bmPPpIwCYREf2LlLDBG3fvBJahgXEzETKWXvYR@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkvnpoh2L3duyylM5jRLVQ2tZufNFxtLIaRmAa6bT1ubLYRJ1
	249BtxgfIEaqMROHYgybc7rxCcCi5bEgK9gtOFod29o7BJSjo2LoRRyZz/a2f2GQ76mWatjp7Fq
	DHkroN5ugjAQjoOhg4gKC4N5Ngd/OhwmcErBzZvlLrw==
X-Received: by 2002:a05:6512:3992:b0:59f:6edb:b7ea with SMTP id
 2adb3069b0e04-59f6edbb86bmr1682243e87.42.1771236960502; Mon, 16 Feb 2026
 02:16:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
 <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
 <aY7r9qr-ngFSw7MC@smile.fi.intel.com> <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
 <aZLgxEZzn_USmlkE@smile.fi.intel.com>
In-Reply-To: <aZLgxEZzn_USmlkE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Feb 2026 11:15:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf1X0dq2TxeWET3kgiZEg+h0Rnd8OwWGFWEy+tv_AVPQQ@mail.gmail.com>
X-Gm-Features: AaiRm51HaTePBneaEI-j6wg_yC5GVrHWDbi_-XmVFdnnROfwVdgexJFD5BdEn5Y
Message-ID: <CAMRc=Mf1X0dq2TxeWET3kgiZEg+h0Rnd8OwWGFWEy+tv_AVPQQ@mail.gmail.com>
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

On Mon, Feb 16, 2026 at 10:18=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 16, 2026 at 09:51:18AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Feb 13, 2026 at 10:16=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Feb 13, 2026 at 09:25:24AM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +const struct software_node lpc_ich_gpio_swnode =3D {
> > > > +     .name =3D "gpio_ich",
> > > > +};
> > > > +EXPORT_SYMBOL(lpc_ich_gpio_swnode);
> > >
> > > Can we export in a dedicated namespace? Perhaps "LPC_ICH"?
> >
> > I can't test it so I would prefer to reduce the amount of runtime risk
> > introduced by this change. We can do it separately later.
>
> I didn't get this, In this patch you use _NS (And in any case this should=
 be _GPL).
> In the other you need to add MODULE_IMPORT_NS(). There is nothing which n=
eeds a HW
> to test.
>

We're adding surface for an import failure but whatever, I don't mind addin=
g it.

Bart
