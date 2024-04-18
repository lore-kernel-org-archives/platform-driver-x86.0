Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48C2576F
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422423; cv=none; b=X5QN8lmCXXAbgl/xIZJK+sxJKrP4/VCIi+7QbkFZzejQFduG64SxJnQddhYauwDFCnJzvV4cntXnnmcWI6gCmTqqPeVQKMEXzsOtF6Xdmy2VbuE9jY+ZyNkRodgW7N+CQRU2H0VWnUFr+hafDr7V/s8CicTMyB7MI5JKmGFxnOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422423; c=relaxed/simple;
	bh=EH03m7eOfHhtp/BcJ5vnIqquDs8mG7Y94m4YaqVAYs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yi97x7NKhbg9pDrz9VlyG4UMhRXwIuWN0EvvzSccmMurVM6yN5WGDWeSIhDSWkxUzPmcm5tqKGLMJfUqxhmLlF0ClSTONjsD2IM9CwxUJHuDqwgX2ZYM8YortaKdrQVMcbhyc6R3DZ7rSA6DHylO7Iw2mhe+uL5D4EhMEWLh36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U9/1ulFU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U9/1ulFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713422420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNvjTCc6FwOgFUSAbxLYa6iTeIgRgSjn22Bb0lwJRLg=;
	b=U9/1ulFUBzqd6S2PbUKeGYTv/zUsnalOvMDqvorK1XjMuZ1yO0vKzI/mbBokQD4Mooi+A/
	U5EdJJVtaICPTgJ6OCyQlQb8cMXyYtAM+zwiAX2UXBTdbilwtJxmJqyxaDQfERFcf2e3vo
	LDEpLwK3TXi/fo/uarMOupUOwlXkDNg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-s99E__0gNgaXqMse3XGGMA-1; Thu, 18 Apr 2024 02:40:19 -0400
X-MC-Unique: s99E__0gNgaXqMse3XGGMA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a4b48d7a19so562512a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Apr 2024 23:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422418; x=1714027218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNvjTCc6FwOgFUSAbxLYa6iTeIgRgSjn22Bb0lwJRLg=;
        b=PJzwFSi6ZSAHKAnbrftOfHEPZDBW5Hnm/52BP/OlJGqy8BUzf+vjKB7K3Qre/tLEMj
         zea/lYsTaQeIrgIPUEevcy7EVSVttyk+VWtUj9ezPNSjPRRvuzhy+GVh5V8RcwnQSb57
         XQp6nJv8VXoBq7YN7D+UN38pM4WcX2b6YtPotBBEphaoC9/0+N+xKPtZ5fWgJw4T9UCQ
         xc3RfnAbdsDsSppnj1PhKNeWrJpZyg81fbeU5iD/tW44FlLB585Fy5Zc4JGWXtH75UVH
         mLaFPfx3mlZzn9Phm8lyB+/1r69qosy4tNzYV3INdsi+AYMmsHNjY83c87UTQniQnpqO
         tV1w==
X-Forwarded-Encrypted: i=1; AJvYcCX9sz2Mut8awnTrumUMuARxishRSVQmJYzAARXkRQyQhh1wkiRwi2MSnsUK2wMiXLDsltv/UL3B3Bvm6absMhsMp6ZsPq/WDUposl0tTulBVUrLPg==
X-Gm-Message-State: AOJu0Yy4IQ3hxslKUK4+tF4bEXkooMT9GizS/cMyL68j9pS7+kPiIPgQ
	UG0TA2alfcX7F+sSoa6v2+G4FPDLls79YmCeXe4u1W7JCK90OY5CXIc5LnLgE5aMlWYz0o/VrIn
	OHbUuizVGsDDf9eHg8s+vWiqKV25zcEdYA8SzALmeeMz43OjqY/72P25C1wsAVBO2RjckkmSCIo
	fOEM4L1Q+vHpxdUs7UhP8JM4q20M5YO14sC+7WCFyJzCf54A==
X-Received: by 2002:a17:90a:f298:b0:2a4:6ce7:37ad with SMTP id fs24-20020a17090af29800b002a46ce737admr2168445pjb.5.1713422417933;
        Wed, 17 Apr 2024 23:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Nqu/T3TcMgalwb0fgZz/LJ+EbTdQaBlb847ZkHwH6OthK4zjz68lfXhfvPUEvk2KNoUUWyOlK+WujobCKuY=
X-Received: by 2002:a17:90a:f298:b0:2a4:6ce7:37ad with SMTP id
 fs24-20020a17090af29800b002a46ce737admr2168419pjb.5.1713422417577; Wed, 17
 Apr 2024 23:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-5-hpa@redhat.com> <202404170023.1zEGO9ja-lkp@intel.com>
 <CAHp75VeKCGSZTb5bGU4YNr9r-z+gXmk4GC5HOZCFcoRQRN37CA@mail.gmail.com>
In-Reply-To: <CAHp75VeKCGSZTb5bGU4YNr9r-z+gXmk4GC5HOZCFcoRQRN37CA@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 14:40:06 +0800
Message-ID: <CAEth8oF8rXABQqhM89QH4dR=Gqjv-ZkwPHWMEfy434jN6eOtbg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] power: supply: power-supply-leds: Add
 charging_orange_full_green trigger for RGB LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 17, 2024 at 1:34=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:03=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Kate,
> >
> > kernel test robot noticed the following build errors:
>
> > All errors (new ones prefixed by >>):
> >
> >    drivers/power/supply/power_supply_leds.c: In function 'power_supply_=
update_bat_leds':
> > >> drivers/power/supply/power_supply_leds.c:42:17: error: implicit decl=
aration of function 'led_mc_trigger_event'; did you mean 'led_trigger_event=
'? [-Werror=3Dimplicit-function-declaration]
> >       42 |                 led_mc_trigger_event(psy->charging_orange_fu=
ll_green_trig,
> >          |                 ^~~~~~~~~~~~~~~~~~~~
> >          |                 led_trigger_event
> >    cc1: some warnings being treated as errors
>
> Probably you need a new dependency or so.

I will include Hans' two patches for led_mc_trigger_event() in v7 patch.

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate

