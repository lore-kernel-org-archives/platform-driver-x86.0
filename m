Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328293B42F2
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969105; cv=none; b=FN9CaFvAivYovo5WPFcBKboMVPzoZ15tGCxOYnB+x+/uZ2baDhQJDQV0A5bIVpByuHMFyjhpk98t5tjn27jKkOlRXxTSGWCkmxUn+IpYcBVfyFAvhv+wDJR88dbSEEpwd+GE8CKjPHS3wymu7v33tv054lHIO+9X8tlxlU4c3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969105; c=relaxed/simple;
	bh=kAeJX9Uec/6XKxjU9aI3iiCC/zao+WP5C5A6QEo6DTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgmKFc0ii/wfJ9TmrhdTk77hyWLwVLpxRgN1GnZLqCgJ0hBmlg3eZqbQqjnbzjfecqEhDY13JJvLVPWTZO8EeR9oSiFrzSduwV2zCxSWNpWdds6YYYAuZq2vSAAKgbaZL4PaEPbl2jOSQbsNhdcvN9YF7kDf2ov669SQNR+bjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eze0YQB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eze0YQB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC23E1F000E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969104;
	bh=kAeJX9Uec/6XKxjU9aI3iiCC/zao+WP5C5A6QEo6DTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eze0YQB5lPfNlDWjUjrTgwsxG0+3M1FksHBXLa0UTw3rTEgl/fP3wsXcAGO4ykciq
	 P1b8d49T0pvav5ShnI6SSy1CrkXC5hH2Wge83IoZCfcVpgkv3bGeIIySwNMvYAe8xb
	 YQt6NHAhxSmVRjJ37NqPl0JP5DBwgRm0lxWJzCJQtNatB1T3vcC5YFlS4x4gvGg3y5
	 8+WZe+K8O72Tu/ZTYuU7SjwKSY6svTe30hl5f5Bd3D9M/u+FniSC8Q6xAXNabFMUMV
	 tbSK8pigs+1XIhOcJ2R6WRwehU329/ED39tyd1Dn8XkpVHGgi/Ls4hg4QT+HO/jzZX
	 KTa1fKVXsPi2g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso3016060e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 05:18:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDdTGwswteSTVZHBsn2iUP/R8L5S6mSTObCWmfe7zSBbCB7Lq3VpemUk4fyC/WmEzqv+sZ7HSevvXydd1I5e0uVIcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvD9Xg4h5MRNLmKpPvgCin1bQKItpEUn86EKx4VwJ5m2qFHP0K
	d1hVFs1X8n/3lXkf8GG/gDrQiQzqQALyWVsV60w5Pl2rg2jDNKEkSnaASLtcR2N/ZaKFlzS+v9u
	4NktfPkS71Unl8o3S+6Oxp0FVLYhSlzU=
X-Received: by 2002:a05:6512:3985:b0:5b2:a55f:2ce1 with SMTP id
 2adb3069b0e04-5b45918bfbcmr2928871e87.37.1786968767385; Mon, 17 Aug 2026
 05:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816060648.4030-1-farbere@amazon.com> <20260816060648.4030-12-farbere@amazon.com>
In-Reply-To: <20260816060648.4030-12-farbere@amazon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:12:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=AXgHSR7TGFeAQv=7yu9VhSznQy99MKDTgM2rJjv5HNw@mail.gmail.com>
X-Gm-Features: AcwNN1UtCvrDpVC9uuvoUfBmhVJEvfMufMk34D8Z0GoJ1ENEbtfx026qmqKhJwc
Message-ID: <CAD++jL=AXgHSR7TGFeAQv=7yu9VhSznQy99MKDTgM2rJjv5HNw@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] gpio: eic-sprd: use devm_atomic_notifier_chain_register()
To: Eliav Farber <farbere@amazon.com>
Cc: rafael@kernel.org, tony.luck@intel.com, bp@alien8.de, guohanjun@huawei.com, 
	mchehab@kernel.org, xueshuai@linux.alibaba.com, lenb@kernel.org, 
	laurent.pinchart@ideasonboard.com, brgl@kernel.org, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	dmitry.torokhov@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	W_Armin@gmx.de, ukleinek@kernel.org, fabio.m.de.francesco@linux.intel.com, 
	kaihengf@nvidia.com, ankita@nvidia.com, leitao@debian.org, pedro.pbg@usp.br, 
	paulmck@kernel.org, frederic@kernel.org, kees@kernel.org, 
	saket.dumbre@intel.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 8:09=E2=80=AFAM Eliav Farber <farbere@amazon.com> w=
rote:

> Replace the atomic_notifier_chain_register() +
> devm_add_action_or_reset() pattern with a single call to
> devm_atomic_notifier_chain_register(), removing the
> sprd_eic_unregister_notifier() callback.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
