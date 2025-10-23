Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650F279DC9
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202623; cv=none; b=dKgD+HC8h7NZXZ22ddsIsUE4iDRGa/4ILmSNxczjeRwgbHUoADuxERk9VEvpkI05D3EefzCsD+Fl0PqdwwHrTdp6U3NONNP7MEX+NartAH+eF9dRXkL7eTmRAgB61MrdcYg4KyxZwxxLorPtQ+YiFBfI91Fz2lKppU4b0VjtY3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202623; c=relaxed/simple;
	bh=gSjnScR02V4S8DYfAOXlQG7AHQ0VZOuy0vgD6CF7/Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIgLb0xKEaVCvGnmRVNlgY/A1M/arxE7U0/vAt4GNJc1V7es0trwzUxZwGhdsRSlgbZYZra0KgYOg8+nO/v0qYpcX3HLszcHoFewSb/5lL8ldlFZt1Y55xXgkxIUf78DzWnFORhWaxDlYP5CzUHLy6L6wFSVwm3Pqko8Cwa53zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=KWRsOWgH; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="KWRsOWgH"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 3D37FC2D78
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 09:56:52 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 62777C2D96
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 09:56:51 +0300 (EEST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A218E201B71
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 09:56:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761202611;
	bh=778AAfPAeLmP3Ine3jLlCZ7+L5aBSPJLRaC3Bdozzpg=;
	h=Received:From:Subject:To;
	b=KWRsOWgHoAIIMPhOo8ru4wJb04ZiTL3voUNYn9CrWXxtobeHBZk3ZMx0tcmxIPJ15
	 DFlmkD8dVy1omM/+TfYf3sr5Rg4+XxLQSeG/CFXME69TZCmI1NIdCUBDJsfZ4fc2dv
	 jZKwGEZ4WKh2ljAs0mGGiQBWfu7IRxaDlDxTQ5V9rhN7C9ZVDbWhB4J1/W5VAOVXh6
	 ZMwyiAr5A0h18xbvskUJGOyEqADaNjnLAnGn0lpUhBje+Tk2NbclKZzANSjHb9qqVA
	 SZVOUtQvDR//XWncCmXY48lCnHmkY+BfFZfW4dOmEEawfpXwWqfU0Drr/IyxR2Hoft
	 8p/RkylXxCeaA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.54) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f54.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-57992ba129eso594939e87.3
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 22 Oct 2025 23:56:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YwRB8r7dUTlmI0Xh5U28RxodvSD9Fphn5AAaIcQKQyTlr42P2zQ
	6Y6SpV/Wa7NfaFN7kXyiFnmmGJ4VD4s9pvIlU8mZGtKw5r28P4vSG2S9iZt3FVgX6MaVvdcFbLK
	1+AUkJs4RPKTPMtPJKS4+IoY0tU2M/7A=
X-Google-Smtp-Source: 
 AGHT+IFO/7PZLoDhDWs+FcqHXfC/yTXf9/+SGznP7sA2dRey8Da8zaXRQEhBHak9pTbVneTzKO0CtYnoUah1FtRNe3U=
X-Received: by 2002:a05:651c:507:b0:372:9d94:8697 with SMTP id
 38308e7fff4ca-378d6f8729bmr3510971fa.44.1761202610101; Wed, 22 Oct 2025
 23:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-6-lkml@antheas.dev>
 <202510222013.EBLC609m-lkp@intel.com>
In-Reply-To: <202510222013.EBLC609m-lkp@intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 23 Oct 2025 08:56:37 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
X-Gm-Features: AS18NWDd23NLIOTVOY058aR91_4SrQH2cNUKcz3swTq1pi3O6MGGrLrEkyO9gzg
Message-ID: 
 <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: kernel test robot <lkp@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176120261100.2780965.17691084348559215280@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 22 Oct 2025 at 15:38, kernel test robot <lkp@intel.com> wrote:
>
> Hi Antheas,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/HID-asus-simplify-RGB-init-sequence/20251018-182410
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251018101759.4089-6-lkml%40antheas.dev
> patch subject: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
> config: i386-randconfig-141-20251020 (https://download.01.org/0day-ci/archive/20251022/202510222013.EBLC609m-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510222013.EBLC609m-lkp@intel.com/
>
> New smatch warnings:
> drivers/platform/x86/asus-wmi.c:1623 kbd_led_update_all() warn: always true condition '(value >= 0) => (0-u32max >= 0)'
>
> Old smatch warnings:
> drivers/platform/x86/asus-wmi.c:2288 asus_new_rfkill() warn: '*rfkill' is an error pointer or valid
>
> vim +1623 drivers/platform/x86/asus-wmi.c
>
>   1589
>   1590  static void kbd_led_update_all(struct work_struct *work)
>   1591  {
>   1592          enum led_brightness value;
>   1593          struct asus_wmi *asus;
>   1594          bool registered, notify;
>   1595          int ret;
                              /\ value should have been an int and
placed here. It can take the value -1 hence the check

Are there any other comments on the series?

The only issue I am aware of is that Denis identified a bug in asusd
(asusctl userspace program daemon) in certain Asus G14/G16 laptops
that cause laptop keys to become sticky, I have had users also report
that bug in previous versions of the series. WIthout asusd running,
keyboards work fine incl. with brightness control (did not work
before). Given it will take two months for this to reach mainline, I
think it is a fair amount of time to address the bug.

Antheas

>   1596
>   1597          asus = container_of(work, struct asus_wmi, kbd_led_work);
>   1598
>   1599          scoped_guard(spinlock_irqsave, &asus_ref.lock) {
>   1600                  registered = asus->kbd_led_registered;
>   1601                  value = asus->kbd_led_wk;
>   1602                  notify = asus->kbd_led_notify;
>   1603          }
>   1604
>   1605          if (!registered) {
>   1606                  /*
>   1607                   * This workqueue runs under asus-wmi, which means probe has
>   1608                   * completed and asus-wmi will keep running until it finishes.
>   1609                   * Therefore, we can safely register the LED without holding
>   1610                   * a spinlock.
>   1611                   */
>   1612                  ret = devm_led_classdev_register(&asus->platform_device->dev,
>   1613                                              &asus->kbd_led);
>   1614                  if (!ret) {
>   1615                          scoped_guard(spinlock_irqsave, &asus_ref.lock)
>   1616                                  asus->kbd_led_registered = true;
>   1617                  } else {
>   1618                          pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
>   1619                          return;
>   1620                  }
>   1621          }
>   1622
> > 1623          if (value >= 0)
>   1624                  do_kbd_led_set(&asus->kbd_led, value);
>   1625          if (notify) {
>   1626                  scoped_guard(spinlock_irqsave, &asus_ref.lock)
>   1627                          asus->kbd_led_notify = false;
>   1628                  led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
>   1629          }
>   1630  }
>   1631
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

