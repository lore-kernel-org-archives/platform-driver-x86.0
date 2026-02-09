Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE782BDC3D
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655570; cv=none; b=W/r3VgCQgWqzOQ1K5GY/qH2wxyEQOJTUPOhIQMjvx3Um6pGRrSTu/tb9e2lFI+WP1qv3RxILPbGY4+dgqcfsI5tL1TKZOH01wBRaMsIWZcYribyA2Gv++LHVPCHpD4AXRJA5wKlWJmstlwg1D0pFFsexDTNwYtrO02SyuEv/aaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655570; c=relaxed/simple;
	bh=imrbpu9aOhmr0CilQUjpAjEwHWweBAdH//o7OBeBl8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+NI7P0/8ahMH6kwH3Q33y4NlBHLzE9220qrawvZc7kFKta2ZycNqbDhbIDPMA7XLa6m/LDOH3Qk0CMu4hcll86jlAwU78CRO79AjmDpqAF6fhUsUOmsvJHgSC74DH99eRTty3sEp+6R3rGFpJLLTY6/jNN5Q+qLhN6VKjdzMIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luEylsID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luEylsID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B906C4AF09
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770655569;
	bh=imrbpu9aOhmr0CilQUjpAjEwHWweBAdH//o7OBeBl8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=luEylsID+JzPp4GoyaX0mRZtFrcyW0Wd6Z5+beEEXhxijR5IPmAhqB3zQouHi7P8A
	 U8SEO7TtQIcmWmQ+YcQFLdwAVi2uNhscKvyCoXAL35FFSCwclOvbqczRR5KKawmplQ
	 esfsfsLjrxOuMNyaswLtkY6UdNDo7nuWqJIHIXRmJj2toIOkF+ZPbf9urM6myMn2IL
	 lg6Jotr/QNSr7+/z8Xr4oXxU8G7lON9aiDQ0LSOZq2zZd+IghmllQzYoSzWUitIp9o
	 q075EBroZ5BCc1E9VNeVr00i6MVjks6ZPa959OPTSEtYNz1X+/JYhNKgnbMyCIRlfV
	 tQqiXI7hA/hkQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382f0732612so17750261fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 08:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJDO1OVdLsuxdHLri3yy+rDDTKxtl901TPaJ/nuFyJNEbUIz9CSdmDSVLNxKp5YhG0eczQeUMI6xjH8Y4rcnwX8qoe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HKN0pbwaNeeKDNNndoJtbfLNHb5TnD6LYau8LJH8oF+HbI57
	oPxYYwBftvu3hAujMIK+IfYmqzu1v55Ud1rUpyPzosK3LAiys7HlrOB9VsUq6erFLEXDo5z6fyL
	wfTQITL3LKCuihE2udnpxgflEN7C6kJy7ufz0gV8FQA==
X-Received: by 2002:a05:651c:1542:b0:386:e7a5:e26d with SMTP id
 38308e7fff4ca-386e7a5e46bmr4471031fa.2.1770655568220; Mon, 09 Feb 2026
 08:46:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
 <aYnycxR8nxu85Ivd@google.com> <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>
 <aYoNUn8i1avcZLst@google.com>
In-Reply-To: <aYoNUn8i1avcZLst@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Feb 2026 17:45:55 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeQyTJ4wsiU-xkQr+wh_w2JPCz6-e6Koy46cCLsngET_A@mail.gmail.com>
X-Gm-Features: AZwV_QhxTCYsS6EbZxTRmfztwQBJuTZ6HDdQeC3W6tjON45--cqtzv6I95tJAUU
Message-ID: <CAMRc=MeQyTJ4wsiU-xkQr+wh_w2JPCz6-e6Koy46cCLsngET_A@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 5:40=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> > >
> > > How do you do that when your code happens to run first, before the
> > > controller is instantiated? gpio_device_find_by_label() will not
> > > find it, so what will you use as fwnode in that case?
> > >
> >
> > The device that calls gpio_device_find_by_label() (most likely a "real"
> > device with an OF or ACPI node) should return -EPROBE_DEFER if that's t=
he
> > case and not create children with software nodes.
>
> There is no real OF or ACPI node in case of old legacy boards that have
> not been converted to device tree. In many cases there is not even a
> device that you can defer a probe for, and returning random errors
> will likely cause the boot to fail.
>

Then I believe such board files should have never been converted to
(fake) software nodes because what is the advantage of them over
time-proven and well tested lookup tables if all we're doing is
comparing strings?

Bartosz
