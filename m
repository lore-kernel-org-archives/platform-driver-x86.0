Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E0F331235
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 23:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766895; cv=none; b=pmyHXop5Nf5i5/gRG1XfNMeCAzb8wpcCoC2aBq633rSh7M0QiHrtGdP0gUjnH53Vt369rqdHp1ygNPF8ID3nKcFiJE1JWTpVAYZ0tUrlKtlLQFC77lzi/ierigCi3MURJK1OOaFj0Y+gZ/q8BIwaGLwDLl6UziDxj6bg0JOXPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766895; c=relaxed/simple;
	bh=8360BltJ4wvWHQi12GKFktHnv7rdgK7Komivd6LiLpQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=mkMID2J7AWiHKQCkkK6u6sLCUpLYTthomIfYNuu3nWu7JUFqS/RRIup054YKK4qQislY7623LtZ0xaYZTZZkO0QefUilMLLVWR4TzlUszRaVdtIb2m6Bs5P3gnofc6lTKnvC4Za/wer8XQZklyNSx1KOe5q9bh/oDflz1CIIpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njB/XW2R; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njB/XW2R"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-948bf40406bso1154061241.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770766893; x=1771371693; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4i24zGumZwhs3aN4XhWcM5JIakmfne3dk/NI+W0jM8=;
        b=njB/XW2RYriijFY/q1dnjZG0of39Vvma5UQaA/JbAL3VzPCT7W/7kip/+GWXXtpZjw
         0EUQENTb7lM7/doNC5ukk/z7cxzfjnzLCv4lQGTUxRcbGFCQHEoC2b4gPIsPD00nNAwR
         NSghJn1vrAfDTTg1TidUANHvvULCp2hcwqGWPAqYQgjkqQ6cUh4vGPwtL3YuVRxoGaYq
         cwRK4oS1r9rtEpiWh0rS072YT0u8svCPs+JycOsBgiSCDc4PkmiAcWOaWPKiwahFyNEw
         N3UEcJNseOi4U6GyvlgKvyYW/HE1xVQrwU6OR2rMeHJq0JThD6QmhnzM0KoTR+IocLJF
         pAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770766893; x=1771371693;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4i24zGumZwhs3aN4XhWcM5JIakmfne3dk/NI+W0jM8=;
        b=m6LGvFwiC8IB4x8kKEtpoWQLZUUe0V7vYOVRpCo7KONYt2+Rh40qhnX0m9++vexMfV
         lReS9PACo0TEMB9l6B11Bk1dHHKs7FdsQua+9Ho5ZoGGlrEwhHwbiXDiYEG6RKHuufXn
         F/W3NC+0EVGNMV7cPym7NEjSxEBCI+VsGCc73GXTQAwazl1Hc14+Y/gY9fqJ1QqM0jr/
         eElDEvkSZUsI+Uab7KDo6bHsC30Z5xQWLnEr5BaPx8yR4tX+tMNd9jD20CYUEPj0FiPK
         IUYiSdRNpYQtbEEXs17dSx0eQ+HIxzQcNuKnVOEgIqLSaUsIoOShNxy+23KIh71FjxES
         Yarg==
X-Forwarded-Encrypted: i=1; AJvYcCVh8kNq3LR5UkR9Z2YrwVlnBts9jEw/4jstIMKIP9i91QdYFdbEMkYP0b411+SmZcQ2up7wfSxZ0nszpdHjCcma96Jk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywph1Disea5czirKZpnGFgQwl+Zid+fswJUkNtAyQAU429J9jWA
	0Z0x/wz8ldwrDxKUExfxFoukRCFNoLPmmFCD18i4YsXhWohhx3RxPVb3
X-Gm-Gg: AZuq6aLIcO7yYvOCe/NFPAYXJpmsmrUdlBMsw5mCBqjoZ37IWaUz1hAVOgRaPP1twQG
	NMXA//lFlv5OAAZJAmwfhpovVoKHjpW1TVxyhDS8AYSghPC4q1CdjPa2lOdsd4azmB+zyhqcTX0
	t6dcXwc61mF2zTIQ1piIw8JKP3Nm6HdfBHxzoA17Ubeda3t+5YABFndDOx7ZdUT6dLfkW5vQGAr
	uo3ftL/bGPwMufvdYNZtFN0VG2LJXK1hgg78yLIv5Ugf5T0H1dYW15olyYvTWE6/zAUrioQ8v71
	3ZFe8PIqwYImC5JgtoX3Ao2ELv/CqUZoEp5yrHl+muIrJMCXcSmkFidn+bNER9WpHfJislcoE/3
	+R5beRFgFJ0GEQF61rN+iF2jaK1e5ymo2m+iAfksiWNZYQc5KAskFWfMvIXwm2cydltYh/xWnOA
	nbqRcvJN9w0cwCl4UNPZg=
X-Received: by 2002:a05:6102:26d5:b0:5f5:3c38:c4bc with SMTP id ada2fe7eead31-5fde43590d3mr219625137.23.1770766893151;
        Tue, 10 Feb 2026 15:41:33 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde87fb7f5sm60350137.2.2026.02.10.15.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:41:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 18:41:31 -0500
Message-Id: <DGBOH3NPCWFS.5SUAX6FZNZZ8@gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210191938.137234-1-i@rong.moe>
In-Reply-To: <20260210191938.137234-1-i@rong.moe>

On Tue Feb 10, 2026 at 2:19 PM -05, Rong Zhang wrote:
> The Lenovo GameZone/Other interfaces have some delicate divergences
> among different devices. When making a bug report or adding support for
> new devices/interfaces, capdata is the most important information to
> cross-check with.
>
> Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
> dump capdata and include it in their reports.
>
> The output is like:
>
>   LENOVO_CAPABILITY_DATA_00[0]:
>     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0]
>     supported:      0x00000007 [ RWV]
>     default_value:  0
>
>   LENOVO_CAPABILITY_DATA_01[0]:
>     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0]
>     supported:      0x00000000 [    ]
>     default_value:  0
>     step:           0
>     min_value:      0
>     max_value:      0
>
>   LENOVO_FAN_TEST_DATA[0]:
>     id:             1
>     min_rpm:        2200
>     max_rpm:        5000
>
> A helper function for creating per-devcie debugfs directories is also
> introduced into lenovo-wmi-helpers in order that we can maintain a tidy
> directory structure in debugfs.
>
> The series is based on platform-drivers-x86/review-ilpo-next since it
> depends on a commit there. I am OK to wait until the next cycle.
>
> Rong Zhang (2):
>   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
>     debugfs dir
>   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
>
>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
>  drivers/platform/x86/lenovo/wmi-helpers.c |  34 ++++++
>  drivers/platform/x86/lenovo/wmi-helpers.h |   2 +
>  5 files changed, 159 insertions(+), 3 deletions(-)
>
>
> base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c

Hi Rong,

This is indeed very useful debug information.

Once you and Derek agree on the approach for this series, I'll add my
Tested-by tag.

One more thing though. Can you please explain the "supported" byte? What
is `+` and `V` supposed to mean?

--=20
Thanks,
 ~ Kurt
