Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6A3E0C4C
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138468; cv=none; b=ZoPzBrroYnA8L2j3owcj5VzO8MZUeNDRV+nGNPjOACyAmVYGmJ4O5sQ7GY3bBSTm70xwY8u7sqQ7AAr+xGqJamgFnGHxQkDRSQoJL9iObGFHfEd0wlTldoIa/q5Y4y8fAt+9dWcRzcVefwG4hRqav7Rnxf18FyoAvM6DT89ac1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138468; c=relaxed/simple;
	bh=JvxUq/iYUDkBFhAJpNpfuCTuKCodr+3K1ReumsuOTW0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuBccXMsW/zFMedbgo5e93V5E9zVn0Wrjjo3O419pqXabpTnuieWgX5DRnvWEDsaDSGyliT8pQmtxj7inisPjXKkK1QLT12YJnT9UCvX2R96FYZeIoQOjMKr0hnfM+ApGI0nSOh4Bv4TRmt4aIGr8SxUEU3c0u2/uP7RqNCFJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Us/mk17p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Us/mk17p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7AB1F01559
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138466;
	bh=LMdxTbEBC7qZA8RQ+1HVgfF515tY7oL1xF/DhlIoUos=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Us/mk17pVkhDMx0imCnsR1/FdtpGBdBr5EmUo+4q/epDMSC7W/btrpK9pjt8V9aST
	 p7WukUWMZvs0i3uErF8fp85fRYDt+Bw2RTch+g50/U3EvoFsGLFQa+ngHhBauHZDnM
	 9hXmKph8cFZcqF14pCY8lqoaXj5XFOBkh0J1aD+PVOx2SpwM/OYtWvSLcgVtiX2byY
	 HUvqZcg0cBbNBuNRdd85ez67E+mDKUuzzlIltzw2zHw4h2ElwVLxO0wGdc4sLcjdef
	 yWexROKJuXWE74MNxbukUV9VLryzaYWhpjxs8lqMKAoKcFb+355pbUrfBAjFJJJURs
	 OP2OSaucWDKEg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b021916bd3so2589794e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 00:47:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwkTjMe0GkyUvlr8rpkLuBiROAuMjhSsU7iV1FpIKLD8jS1UGYvwSkU9A5bkp8Jm44b3wUBssk/MvqLeYY4L0hF70f@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMX8o6sge9LGs08V4Zbm/Jw6DwpfrOAdjpWxT9WhZffet4MRl
	zb/hLX2OB2MwT+11gEyQKBNF3ExzkrYWXdbZI+9Bza6W1t9wcGJH7ciX8SmlREVnmpQxnIvSEDJ
	NWsIZSIDoSVLVRrvG53ImAVGe248YWMplb4Qg/AlhiA==
X-Received: by 2002:a05:6512:1191:b0:5b2:8a6a:1dca with SMTP id
 2adb3069b0e04-5b2c1b297b1mr1336942e87.36.1785138464623; Mon, 27 Jul 2026
 00:47:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 00:47:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 00:47:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260726141029.GAamYVVeVnJfH5ebH5@fat_crate.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101739.33170-1-farbere@amazon.com> <20260726141029.GAamYVVeVnJfH5ebH5@fat_crate.local>
Date: Mon, 27 Jul 2026 00:47:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=McOT6m1CsmheePCxpZnB+GJmrqYa+D77Dz76Ovy0FPadg@mail.gmail.com>
X-Gm-Features: AUfX_mwvXfjV5Db7FPNy2PNZM2AvQmMoXAOyTg5q8xJTdsDrQvC7kqKotPet8MQ
Message-ID: <CAMRc=McOT6m1CsmheePCxpZnB+GJmrqYa+D77Dz76Ovy0FPadg@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] notifier: add device-managed registration APIs
 and convert drivers
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, tony.luck@intel.com, guohanjun@huawei.com, 
	mchehab@kernel.org, xueshuai@linux.alibaba.com, lenb@kernel.org, 
	laurent.pinchart@ideasonboard.com, linusw@kernel.org, brgl@kernel.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	dmitry.torokhov@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	W_Armin@gmx.de, ukleinek@kernel.org, fabio.m.de.francesco@linux.intel.com, 
	kaihengf@nvidia.com, ankita@nvidia.com, leitao@debian.org, pedro.pbg@usp.br, 
	paulmck@kernel.org, frederic@kernel.org, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Eliav Farber <farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jul 2026 16:10:29 +0200, Borislav Petkov <bp@alien8.de> said:
> On Sun, Jul 26, 2026 at 10:17:26AM +0000, Eliav Farber wrote:
>> Many drivers repeat the same boilerplate when registering notifiers with
>> device lifetime:
>
> From: Documentation/process/submitting-patches.rst
>
> Don't get discouraged - or impatient
> ------------------------------------
>
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
>
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> busy times like merge windows.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

If the above snippet is not clear enough: *do not send three different versions
of a series on a Sunday*.

Thanks,
Bartosz
