Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942A302176
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435521; cv=none; b=Q7UEtHIoo8onqXy3amjdFK9gXK/qJ9Exqprk952yjPaBJnsjOtKOFfA5owcE13m5wSt30Z1biZKWM/4KHpQdb4zXqqWLRLBCB2d0l+dOVG38r6VSylv8gHsCaKu6ZjUvVFYovpJ5M8TAzYco9L7XKhmR3G9sf8LOFfwVoC2pSt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435521; c=relaxed/simple;
	bh=/ZuD4jXFgPnmvP0kOEwzE5Qdgr3xj3cbCh/p5qaR4mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xnm5gsJlg1hbKRkNCCyCmYatg9IZMzncmeeh+EcUF1T1FoHBTEPa/8/AGREKGI2YlrMML8XHRu5yNfFjumdrnvvOLhGvqWTSEWk/mwsxJkjUB6KJCyNbN7OoIaiwsLMOgSCGHTATWqcA70x8hONz+iW+yWJrjp06eb0Udmb6prI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lkvu7jAk; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lkvu7jAk"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba895adfeaso39513eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 09:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771435519; x=1772040319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCh7CycHx1DBnAh4OHYl+x4N1ZQcgViXIdRa19JPnVg=;
        b=Lkvu7jAkd7PAiS06Q/jA0XJDaOvhU9NK3FE6aAYs6rr7fL+NwXQlXGCzr7qYWj22aA
         NRAUXBCyJ22J8NxNwUivF+AXUUFREaaqf8x9g7KqxjqLLvSBl1SBI9MjBCF2jzf/2fig
         fwCXLjlwwdG8m3YGDtp8WsBKExFqGerZZ5meORvKs27wiYiyM58RNdBdDJGF7ODHLcyX
         D0ZayNeyTBYQw/GxpzDQ+sG02apy/dA+e2fOi+hJrhZkbXyfBVvwTQvSY1ZE5P5czhaq
         o9gNZPh5YDmnHH28VWXW0Of5v4e1XnHrlakhdLJzYKwy8pm5082YfZWtcgCpErI8C+eN
         kpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435519; x=1772040319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCh7CycHx1DBnAh4OHYl+x4N1ZQcgViXIdRa19JPnVg=;
        b=EMmLU8V/ZdAeuwndcugOsk2vbiEYEUJ/xaCvyfbgYmgRw90KslSq+9sHuboPklQRt6
         YTllfNnC9wqnA61NGCsOA2qTrf6yrfVlwm5UZJ+qWnHtM0vq3ek2CtdFk3CDIi2DCfHi
         zhpEfQwQp0q/kizJ/LMBU5sXGhaQIPB/0HkwfNpotzu9OT5bz2vJ+1hcHqVwBMg8uoQu
         UOmJqQdBPhvItoQ1ECRZxed2RZKs+FZ1R7UBNjVFohwy75hEJPD+1BjOBdNWPKCTADMv
         2Vvw1AYkcGEWcdJCkw4nSKkesHmkKATLY4qeJ6OioKbhLqjk60NQP0rjRK+G7nV63Oez
         sKRA==
X-Forwarded-Encrypted: i=1; AJvYcCXn0miihKltVYrLxP47qv8h8cHn3XJ0gDa7xZfoZDgr4IJmA6qlC7rnnSUXK8kkpW06W7jUh+K+62DdSiPiaJmwf8oQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfttygn27HWFcf1vJJ4B2Jru/3BVt3nU7aX4CZF6qDjV/lXC9n
	XdRmjNAJeAc3alETpuzHCfZzSxX4QgvWB2GR7y2unNqBNFJdvIbcgj19
X-Gm-Gg: AZuq6aLCJPbnJIaGdNTJF34f1i3R+wPJwSjGfZGa6XB7c94lZWz9yZfpbkv0M63xdTq
	d7iOxddr3YkQmfhjN/BV95B3dZJORaSkKt6JWOZp7m3xzpJgSyQk1wVICFs96xjgKmle/wX5Rlo
	x6oIsojpkHpmNI5CYEG36PkuwO3h4HzYFCPVY4ewDyAA0aN8gut4QG4bEC5oihoPtnLLgozGwQn
	Z/i0t9f6WEpY9JUnRcLFhZW2cKeeSRzy70RobcYog+YCHnvuKPophuvJE1A/HhKagQbtvkCsbea
	jyOxjMxtcBy182mCimMTpBThuLoQ1gRGe+vRddRRmMZzsK2z/L3T3KuBAOLVg81919ShnBkOfZY
	nC8g2uf+SngO0gBEkTFFSiL+ABg1kdHR8nMF72H2nmPlp14I54eExMt8nyWu12Z7uuffYKdxmLE
	EWxxZ8bsB/d2SyZGxqkjAILnfj+PQmGg7oR7nI2ERXCNsalh4dMLOgQa2QfwRB5s8B
X-Received: by 2002:a05:7301:128a:b0:2ba:a075:5422 with SMTP id 5a478bee46e88-2bd502a884fmr1332060eec.34.1771435518511;
        Wed, 18 Feb 2026 09:25:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d40sm23139898eec.2.2026.02.18.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:25:18 -0800 (PST)
Date: Wed, 18 Feb 2026 09:25:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Cc: Tj <tj.iam.tj@proton.me>, Hans de Goede <hansg@kernel.org>, 
	metux IT consult <info@metux.net>, platform-driver-x86@vger.kernel.org
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <aZX0EynAKvqXWzq2@google.com>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
 <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
 <aZSkqGTqMp_57qC7@google.com>
 <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>

On Wed, Feb 18, 2026 at 10:55:46AM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 17, 2026 at 6:29 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Tue, Feb 17, 2026 at 03:25:01PM +0000, Tj wrote:
> > > On 17/02/2026 11:42, Hans de Goede wrote:
> > > > On 16-Feb-26 20:01, Tj wrote:
> > > >> Installed v6.19 recently and realised the heartbeat/network LED
> > > >> configuration I'd set wasn't working. Checking the log I see:
> > > >>
> > > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > > >> gpio-keys-polled: failed to get gpio
> > > >> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to
> > > >> get GPIO 'apu2-leds/led-1'
> > > >>
> > > >> Looking through commits I found b8754092dfed4fc2fc
> > > >>
> > > >> platform/x86: pcengines-apuv2: Use static device properties
> > > >>
> > > >> After reverting it the LEDs operate as expected. This entered in v6.18
> > > >> so will affect it as well.
> > > >>
> > > >> In v6.17 I see:
> > > >>
> > > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > > >> gpio-keys-polled: unable to claim gpio 0
> > > >>
> > > >> that is a slight variation on the v6.19 report. I've not pin-pointed the
> > > >> cause yet.
> > > > This should be fixed by this patch:
> > > >
> > > > https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com/
> > > >
> > > > If possible, please give a kernel with that patch added a spin
> > > > and confirm if it fixes things.
> > >
> > > It fixes the LED issue but causes massive log spamming (10's per second)
> > > related to the gpio-keys-polled:
> > >
> > > [    0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (gcc
> > > (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404
> > > SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
> > > ...
> > > [    0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31/2023
> > > ...
> > > [    6.025741] input: gpio-keys-polled as
> > > /devices/platform/gpio-keys-polled/input/input0
> > > [    6.035231] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > state: -52
> > > ...
> > > [   19.545273] input: Power Button as
> > > /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> > > ...
> > > [   21.742226] input: PC Speaker as /devices/platform/pcspkr/input/input2
> > > ...
> > > [  OK  ] Started dbus.service - D-Bus System Message Bus.
> > > [  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check
> > > Snapshots.
> > > [  OK  ] Started virtlockd.service - libvirt locking daemon.
> > > [  OK  ] Started 819142] gpio   32.-keys-polled gpio  32.-keys-polled:
> > > failed to get gpio   32. state: -52
> > > 1;39msystemd-machined.service -…and Container Registration Service.
> > > [  OK  ] Started systemd-logind.service - User Login Management.
> > > [   32.930711] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > state: -52
> > > [  OK  ] Finished grub2-common.service - Record successful boot for GRUB.
> > > [   33.050784] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > state: -52
> > > [  OK  ] Started polkit.service - Authorization Manager.
> > >           Starting ModemManager.service - Modem Manager...
> > > [  OK  ] Started virtlogd.service - libvirt logging daemon.
> > > [   33.158927] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > state: -52
> >
> > I think the patch below should fix it.
> >
> > Bartosz, I think you should revert
> > 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> > existing gpio drivers. Breakign the kernel like that is not great.
> >
> 
> Hi Dmitry!
> 
> This change has been upstream for close to a year - it first appeared
> in v6.15-rc1. There have been very few reports (I think a couple
> initially and then none for months) and fixing this is typically
> trivial. It addressed an actual problem where these retvals would be
> propagated to user-space and misinterpreted. I think we should fix
> this driver and keep this change. "Auditing" typically means never
> fixing things entirely.

[+LinusW as co-maintainer]

That's ... an interesting stance. You couldn't even bother going
through your own subsystem before applying a change that could break
user's systems.

Here is your first approximation from gemini:

Based on my analysis of the drivers in kernel/linux-next/drivers/gpio/, the following drivers have GPIO line getters that return values outside
  the expected [0, 1] range (when they should return normalized boolean values) or a negative error code:


   1. `gpio-bd9571mwv.c`: bd9571mwv_gpio_get() returns val & BIT(offset), which can be any power of 2 depending on the offset.
   2. `gpio-cgbc.c`: cgbc_gpio_get() returns (int)(val & (u8)BIT(offset)), which is not normalized to 0 or 1.
   3. `gpio-da9055.c`: da9055_gpio_get() returns ret & (1 << offset), which is not normalized.
   4. `gpio-lp873x.c`: lp873x_gpio_get() returns val & BIT(offset * BITS_PER_GPO), which is not normalized.
   5. `gpio-stp-xway.c`: xway_stp_get() returns (xway_stp_r32(chip->virt, XWAY_STP_CPU0) & BIT(gpio)), which is not normalized.
   6. `gpio-tps65086.c`: tps65086_gpio_get() returns val & BIT(4 + offset), which is not normalized.
   7. `gpio-viperboard.c`: vprbrd_gpiob_get() returns gpio->gpiob_val & (1 << offset) in the branch where the GPIO is configured as an output.

Thanks.

-- 
Dmitry
