Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45033812D1
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788096468; cv=pass; b=J2gImeBcxUKZJv9jqJwY0CCigl7rYNOHMdXy3JeidmPthPD/M9Yuia5bdGEzhwxBKy3oGaX4SpY+Ayo6Sgn9Dlv+t/iNmuDolC+08tp6wT80M0OBlp9fyDXy13i1vgCIvV6m3UC/Wbt8ey+Dq0jcD744ftl/vAOdwCIxhnG/eSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788096468; c=relaxed/simple;
	bh=YPKz5OqBk9usb2e2pk4uZojEfnktwmodxCOMK6glqFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPVjh/lvmF01Hx7PnZCBNbKModkJjAgWF4kgxujr49cyQnaRCt+B8h+v9B36LR5pyhjHIlercGRyu8v5ZRTjRyJu4wv0bjxO05wiiZYkWMtEyPBgYAYwStVxyKG2Aud3gVJtFBJXgNlxmQWHaY6AM75axj3bB3yT+H6+dKMejZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leXjO4jK; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leXjO4jK"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52b6543169fso17210631cf.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788096466; cv=none;
        d=google.com; s=arc-20260327;
        b=B/f7bVkC/9Mi9HaIW0AQeP0XZWaQHyvFWur/yRuycjSv96VtpVU+QS3jahHldaTev2
         SEt6pL4PgXzfPg49qPLAEThwwKcbNrPAax7vGepT2W6pr2U3ahVu4dp+FxcT0NOM3pvB
         Yb4anra2OMXNWfmoYFUT/lyz/JB7U5BPKZ2Q0HCXobePHi/ttEChs+7518ohJEM3sC4l
         4jTi/cL2hgw3diTkXYsTWDtxk4i46evEJ7Ihe/n16VWmrIsBvVUXJz2rpiR34NyCMR2G
         dhGhO5tcelBCRR0RSbbplTkxeePGN5LGqGWsVEtDxtUYrpFcAr3AXbqbR4JoM4hyGY23
         6aZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPKz5OqBk9usb2e2pk4uZojEfnktwmodxCOMK6glqFg=;
        fh=TD4sZqhsH/iv/OLydsm3bSXE3Wyk5I4GJvr3NZ5gMnc=;
        b=bxsSb0uEQ8xNXWhXiaAoCszvChpC4rFahaRvTcX0n9DSJPNed0eEQ/fvbKrzjDKiSD
         UVK55maEu38Yflzzzor6D4u4KCvN8OJEX7spUz4fmMo+ZVHnv0RaC5YRvfYXXrsKpdng
         bx/2l2J0Ii1XfEK7Mn689QrqH/CLlv+632JpetHAYdQQurwBSjrEJdTsbu8/MknOcBCY
         ZZa19Xo8NQo9MHG7OLQdcalNLVjkxeDJE2eSUmTzyVzQGUG6qHaqYhT94Sz6hVTDGX+v
         dvb2HA1aY9KYTX9CWIHlWQR97lOuNKtXhzsviqIFybQtVDwW16e1HBUH8j5fLRGNzoPJ
         24eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788096466; x=1788701266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPKz5OqBk9usb2e2pk4uZojEfnktwmodxCOMK6glqFg=;
        b=leXjO4jKHQ6Cbc1JBzxk9ScLlNkd2tSoW/JxG9XGbNjYAJgN/tLQk1c+Pjo2swnjaX
         kr/Zqhrh+VKlDVTTVGdsEhWjarXnqp9TXQtl06ZHkqVnXYpuEPLLYcPUrWKclGHt0umx
         ZnOrbWD2c3Wq82atVwLXdM5JPJMzw4yQHBIkkVMPhFm4lHmLhnLZKicTsf8FRQFyL+AR
         Wn1m6u7snZLjIFIeHGqAY5j5dSRe053VJyPU5S5JZWAleIWrNcYPa1+xBeDO3u12rLOx
         DR7Y/fxNNX/3WhbYhWdV0RuPmMovAsx4E7vp+olaYmGjLa3y6WWYF5rYtOJkvoe3C2VU
         Bgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788096466; x=1788701266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPKz5OqBk9usb2e2pk4uZojEfnktwmodxCOMK6glqFg=;
        b=CYuBxI+C1s2G3R7pZqSuJM/IMAuThj7r78w9DuU+YipCtBz2eJsDdb6ENCeAIb+aeo
         p4iZersWYtBi4igZg4DMTV+VTqNnqQS+J9Oi/L7dwSQKvLWk0owjn9RvyQPHjk8NM7qj
         Z+WF6TJryQJBCYsLnBmaOwYy7ISvEK7nTdmk7T8nRszwOGIN6CqC5PPGg1/61iDUom2Q
         cFaR1UxP8RaTbCvmgr5zf22YwidOY4jdkYM/mSvpIysGPj4o8WdMc8Z+nsq/j6zYGvwG
         BmSJm2gubNbnzyFkRl7jZ+sEVgCWiMajSPZUyCzR2UX8yQ0HMw5Id7j39XtXTqCWaKEw
         o8og==
X-Forwarded-Encrypted: i=1; AHgh+Rpp84PAGtwjXc2rdQKaNcFJH9rkyt53vIVeFIhG5FwSD2s/2WEBlzoS5F3GgQcwBPFgJ0KVLQd6lfBG1C4lB3NU6OHq@vger.kernel.org
X-Gm-Message-State: AFuF++na7VcIYkbfPyO0xyPjYs7e+It1FWZHUrGkc9rW0fB3VrGYIjM+
	GaipA5eKXcwKfn7zRa3YHbJJYwaDWBW0gxTIwow+znGirqdOirRsv8Sysho8qwV2WlCsli69Fl0
	0ptXfokxqgVuMzxZI6vXu5evAZUONE5E=
X-Gm-Gg: AR+sD12ZWyhBWyOF6eGuoH/+pOJUmH6OObkFtRl27Wn3gdl8BAzk1howmuyYibi9DCq
	evjfj7r71Jth8by5DjHgn5HcfjsJspxHWPZTA6Sz88j6hNqaTaWFPXXONPUMbDa21VNkFuysf0l
	JXahX4WN0u/9SEWTX3KTeJ42MY2zsWFo2qaTdoRvHVgg8+3sY4+FNEOJYqUzBaQfGWBVVJdPUw8
	AP8oMxaNdij3U6KbpKQEarDw29fk83tl0K95/gvb6+x0H3dw9UapSoEMsMyiu8bhnhwTBVS0wq8
	ihX9b0XPVeprLGqq4XokOkHoIZ6J7E55ZukPzNassrydirV7FJ+nKA==
X-Received: by 2002:a05:622a:608:b0:52f:b37f:35c7 with SMTP id
 d75a77b69052e-52fb963ff45mr228736891cf.23.1788096465724; Sun, 30 Aug 2026
 06:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan> <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
In-Reply-To: <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
From: Mo Jun <royclark086@gmail.com>
Date: Sun, 30 Aug 2026 21:26:00 +0800
X-Gm-Features: AcwNN1V7T-iwBuAmO8RzAd8_9s0H2yuoPxXxuECbkRKPOz2U3ZJQLvpqb0mJ0WY
Message-ID: <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler directly")
To: Armin Wolf <W_Armin@gmx.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Denis Benato <denis.benato@linux.dev>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin Wolf,

On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 30.08.26 um 10:42 schrieb Salvatore Bonaccorso:
>
> > Control: forwarded -1 https://lore.kernel.org/regressions/178807922598.=
807847.18300931641658404390@eldamar.lan
> > Control: tags -1 + upstream
> >
> > Hi
> >
> > In Debian, in https://bugs.debian.org/1146124, Jun Mo, reported the
> > following, with a bisection result:
> >
> > On Sun, Aug 30, 2026 at 12:59:45PM +0800, Jun MO wrote:
> >> Dear Maintainer,
> >>
> >> Fn hotkeys on Lenovo ThinkPad SL400, which are supported by the
> >> module asus-laptop, no longer work starting from Linux 7.1. Normally
> >> when those keys/key combinations are pressed,
> >> acpi_listen/kacpimon/"evtest
> >> /dev/input/by-path/platform-asus_laptop-event" will capture related
> >> events, for example:
> >>
> >> $ acpi_listen
> >> ^[[1;2Photkey ATK0101:00 00000032 00000000
> >> button/mute MUTE 00000080 00000000 K
> >> ^C
> >>
> >> Starting from Linux 7.1, there are not any related event captured by t=
hose command.
> >>
> >> Using snapshot.debian.org, I found out that the last working kernel ve=
rsion is 7.0.14-1 while the first not working version is 7.1~rc2-1~exp1.
> >>
> >> Following instructions in [1] and using /boot/config-7.0.14+deb14-amd6=
4, a bisect resulted in:
> >>
> >> git bisect start
> >> # status: waiting for both 'good' and 'bad' commits
> >> # good: [458c6079fc1d41d564c37679c8ace02cd83ee817] Linux 7.0.14
> >> git bisect good 458c6079fc1d41d564c37679c8ace02cd83ee817
> >> # status: waiting for 'bad' commit, 1 'good' commit known
> >> # bad: [7fd2df204f342fc17d1a0bfcd474b24232fb0f32] Linux 7.1-rc2
> >> git bisect bad 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> >> # good: [028ef9c96e96197026887c0f092424679298aae8] Linux 7.0
> >> git bisect good 028ef9c96e96197026887c0f092424679298aae8
> >> # good: [334fbe734e687404f346eba7d5d96ed2b44d35ab] Merge tag 'mm-stabl=
e-2026-04-13-21-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/m=
m
> >> git bisect good 334fbe734e687404f346eba7d5d96ed2b44d35ab
> >> # good: [cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5] Merge tag 'ntfs-for=
-7.1-rc1-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/nt=
fs
> >> git bisect good cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5
> >> # bad: [beaba8bfbb91e3bb3133eacacd62fd6fea515e34] Merge tag 'probes-v7=
.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
> >> git bisect bad beaba8bfbb91e3bb3133eacacd62fd6fea515e34
> >> # good: [bea8d77e45a8b77f2beca1affc9aa7ed28f39b17] Merge tag 'staging-=
7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> >> git bisect good bea8d77e45a8b77f2beca1affc9aa7ed28f39b17
> >> # bad: [065c4e67cc2c40e6dd94649e8e720096fbabd4ee] Merge tag 'uml-for-7=
.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
> >> git bisect bad 065c4e67cc2c40e6dd94649e8e720096fbabd4ee
> >> # good: [4b0b946019e7376752456380b67e54eea2f10a7c] Merge tag 'for-linu=
s' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> >> git bisect good 4b0b946019e7376752456380b67e54eea2f10a7c
> >> # bad: [d6116d86e58a04a9522e349c4a27145521c01ad7] platform/x86: int347=
2: Use local variable for LED struct access
> >> git bisect bad d6116d86e58a04a9522e349c4a27145521c01ad7
> >> # good: [19ebacfb442b83aa5fe75f9c6851b4edbfff3760] platform/x86: dell/=
dell-rbtn: Convert ACPI driver to a platform one
> >> git bisect good 19ebacfb442b83aa5fe75f9c6851b4edbfff3760
> >> # bad: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platform/x86: asus-l=
aptop: Register ACPI notify handler directly
> >> git bisect bad 378500dc1313e2c06a2f675bb00ab5d7880433ba
> >> # good: [03ae0a0d0973b9e584a05136aab08fee2ef8e455] platform/x86: uniwi=
ll-laptop: Implement USB-C power priority setting
> >> git bisect good 03ae0a0d0973b9e584a05136aab08fee2ef8e455
> >> # good: [b0bcf48c74cc7f72d1b6effc7cecdae871b1785e] platform/x86: toshi=
ba_acpi: Register ACPI notify handler directly
> >> git bisect good b0bcf48c74cc7f72d1b6effc7cecdae871b1785e
> >> # good: [553b2ac59fbb434330287fde0cabc64bc6f11ceb] platform/x86: toshi=
ba_bluetooth: Convert ACPI driver to a platform one
> >> git bisect good 553b2ac59fbb434330287fde0cabc64bc6f11ceb
> >> # good: [3a96c7915d93231e128df74901fe8fcb960b0ecb] platform/x86: toshi=
ba_haps: Convert ACPI driver to a platform one
> >> git bisect good 3a96c7915d93231e128df74901fe8fcb960b0ecb
> >> # first 'bad' commit: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platf=
orm/x86: asus-laptop: Register ACPI notify handler directly
> >>
> >> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1143721#15
> > #regzbot introduced: 378500dc1313e2c06a2f675bb00ab5d7880433ba
> > #regzbot link: https://bugs.debian.org/1146124
> >
> > Does this rings a bell?
>
> I think i found the culprit, could you please test the attached patch?

Build the module with the patch(only "make -C .
M=3Ddrivers/platform/x86") and load the built
drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.

Thanks!

Regards,
Jun MO

>
> Thanks,
> Armin Wolf
>
> >
> > Regards,
> > Salvatore
> >
