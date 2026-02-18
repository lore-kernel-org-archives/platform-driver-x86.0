Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC990283FF9
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443386; cv=none; b=Wq/1+HExdCZJuRa/QopoTn273WtFBebn+DK873DnteH4L0hJP5Edfkk3EBKLDSzI08hRnVReoeFFWwZAwkmUmYgDN5arWiJrz5KGaQYZNH7Pa0Sd6gotBJEUVjFhYIIE5hgjLwHUXlxsaQfG+8P7+YwraQ+tPn6HoOvk3OqFycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443386; c=relaxed/simple;
	bh=+CtuGYT6Sg1WNQEtRKr7GqHmMBnylBtXYzJIVIagKYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyu7vs8CtqUqXjXlJ7STdoYqnA2PuiKAoxqToDhqqqj7bU7krkrbcjTD+JNkxonquE3tYL7oL9nvldRPxzILYUuacuXRyCHRsDv3UWk5x2O9tCcXgVgF5oe1yDQxooFkOrJUT4yV+Me6UdtEBbQlTnm6nNfhNpqVEpMLzbTHVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNm6npkM; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNm6npkM"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1275910b930so208883c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 11:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771443384; x=1772048184; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+mfQLOuIU2kFHmUpP3xm/8OymOnBtLT3na01fMd7Is=;
        b=TNm6npkMbzBuxjUMxa3SfRnqJM4KG+PPSVOCYssR/WnjbrkP+3Hf6Ghk6oi++LVR3n
         X9zbay0d9k5BmRI82cj0lqD0ohzdGpAH1YiAqxW+aOhl01iltrfSxhUuLpELgkl3cNow
         /S6/o4BPmYiKWE0zMk1E5P/9IdfOXjhpSk+GsPeAl+qLkCJmmQuXlXSa9vQ34/IAjFG+
         T0/jQFzc0d3bFJCI5NC2l68mBY4wdVKYAA0EkHH8Vibhkjk85AzX+g+bXRJ7XDGk2bcX
         RQ/udCr99sErcgYLR37tYWOUCH4MWxaSc+mAaijh1UIm0m0JwOtnl94wuVMXRNwmcELJ
         AiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771443384; x=1772048184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+mfQLOuIU2kFHmUpP3xm/8OymOnBtLT3na01fMd7Is=;
        b=ZuziEtTxAHNXfWcrnSmfUZ2SqPai2E8cpQykD+OhweCdMoTeUarrrh5aXsoqq5AD1H
         JnNtzyWwGDUdzc8yURRPqK2HgzQ1MdApEr5eDtlvPVodl/8fgbZwmM4hYNrmW7VSsck7
         WbdfVIKs7/0Si5fZQB+V3/J2vPthrTnCkk7uGX2I6cNosqf2CWRQf/M4yEgQPDfIcjf8
         /JvRTZ5cN8RacRCGPy0nIpFUdj+fF5oF5va/usqMWG35A/W5Vfv3t9eUzWr7waRLuTIo
         MZSyUa0XfqjNh/MePFVQwVZ8KQWQDod1tmHY6EXvdG/xiBGoZU7CCmbwciyDFfKQum1P
         l+kg==
X-Forwarded-Encrypted: i=1; AJvYcCVO9gdP0kU/jOzh6W1GAxhW34ghYzTWdwJN8gEoDWHp8+qHujov+HVKqG6iqp8VSv1BO3ghG08Hayz2MM6owpSjVu4L@vger.kernel.org
X-Gm-Message-State: AOJu0YytcS78TCfY+yHHD5fHndXYeVw5ptmqKq0L0JPIU8zQdl3o+2p5
	YEJ+5sSAhR8/TH4UNOatPCr1ORkenr0vRFYpDx+jWwDv8jnunvJq+nXX
X-Gm-Gg: AZuq6aI98UWjrkFLW4j6OX3WQRLL8w70288pfTxcSomCRMouvAHctAtVWRujNDwLPz1
	6GcJpSO6t7e53YIr+8CL4/LGk249se5Gb5CtX2ya5rzQegC5hh953aPpc0oVR3X1kuwWPIdN0wu
	ohATKU50R9wUVl8rzxtooG8TIcfEObG+rJpdFqLHSx478fVO10Vnu43y0sGu+QZRrBUxQyC+eA7
	7wscbI5VX+Q25nlJna1ysc414PVojvN3c9raJt8h2t6nP3uQcbPCzqb3J0qDXXW8P28E1ODsEP5
	Jhn7N3MHU1L+nnCsipVtbfFVfpAguAbD0broqBEdBC0Wm3xamYLOi69ehcPmi1F3ebs+y/stiNb
	92pIRGfv1nqbSOiKQB7UyrzSMPIol+97Ntx6HpLE22xU0iycaXrfHCVToT2Qknbbf/HMAFHX7Kr
	xxCNJvlfm0FJcAVPWgYmLd3YO98BHpOvHbi72bVUH81taQ91XXxr5Wg7dIQzvJvP8J
X-Received: by 2002:a05:7022:1284:b0:11e:3e9:3e91 with SMTP id a92af1059eb24-12759909e20mr1559994c88.26.1771443383864;
        Wed, 18 Feb 2026 11:36:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cadb25sm24833058c88.10.2026.02.18.11.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:36:23 -0800 (PST)
Date: Wed, 18 Feb 2026 11:36:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Cc: Tj <tj.iam.tj@proton.me>, Hans de Goede <hansg@kernel.org>, 
	metux IT consult <info@metux.net>, platform-driver-x86@vger.kernel.org
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <aZYUj0dUL5bZtwSF@google.com>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
 <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
 <aZSkqGTqMp_57qC7@google.com>
 <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
 <aZX0EynAKvqXWzq2@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZX0EynAKvqXWzq2@google.com>

On Wed, Feb 18, 2026 at 09:25:15AM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 18, 2026 at 10:55:46AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 17, 2026 at 6:29 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 03:25:01PM +0000, Tj wrote:
> > > > On 17/02/2026 11:42, Hans de Goede wrote:
> > > > > On 16-Feb-26 20:01, Tj wrote:
> > > > >> Installed v6.19 recently and realised the heartbeat/network LED
> > > > >> configuration I'd set wasn't working. Checking the log I see:
> > > > >>
> > > > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > > > >> gpio-keys-polled: failed to get gpio
> > > > >> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to
> > > > >> get GPIO 'apu2-leds/led-1'
> > > > >>
> > > > >> Looking through commits I found b8754092dfed4fc2fc
> > > > >>
> > > > >> platform/x86: pcengines-apuv2: Use static device properties
> > > > >>
> > > > >> After reverting it the LEDs operate as expected. This entered in v6.18
> > > > >> so will affect it as well.
> > > > >>
> > > > >> In v6.17 I see:
> > > > >>
> > > > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > > > >> gpio-keys-polled: unable to claim gpio 0
> > > > >>
> > > > >> that is a slight variation on the v6.19 report. I've not pin-pointed the
> > > > >> cause yet.
> > > > > This should be fixed by this patch:
> > > > >
> > > > > https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com/
> > > > >
> > > > > If possible, please give a kernel with that patch added a spin
> > > > > and confirm if it fixes things.
> > > >
> > > > It fixes the LED issue but causes massive log spamming (10's per second)
> > > > related to the gpio-keys-polled:
> > > >
> > > > [    0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (gcc
> > > > (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404
> > > > SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
> > > > ...
> > > > [    0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31/2023
> > > > ...
> > > > [    6.025741] input: gpio-keys-polled as
> > > > /devices/platform/gpio-keys-polled/input/input0
> > > > [    6.035231] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > > state: -52
> > > > ...
> > > > [   19.545273] input: Power Button as
> > > > /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> > > > ...
> > > > [   21.742226] input: PC Speaker as /devices/platform/pcspkr/input/input2
> > > > ...
> > > > [  OK  ] Started dbus.service - D-Bus System Message Bus.
> > > > [  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check
> > > > Snapshots.
> > > > [  OK  ] Started virtlockd.service - libvirt locking daemon.
> > > > [  OK  ] Started 819142] gpio   32.-keys-polled gpio  32.-keys-polled:
> > > > failed to get gpio   32. state: -52
> > > > 1;39msystemd-machined.service -…and Container Registration Service.
> > > > [  OK  ] Started systemd-logind.service - User Login Management.
> > > > [   32.930711] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > > state: -52
> > > > [  OK  ] Finished grub2-common.service - Record successful boot for GRUB.
> > > > [   33.050784] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > > state: -52
> > > > [  OK  ] Started polkit.service - Authorization Manager.
> > > >           Starting ModemManager.service - Modem Manager...
> > > > [  OK  ] Started virtlogd.service - libvirt logging daemon.
> > > > [   33.158927] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > > > state: -52
> > >
> > > I think the patch below should fix it.
> > >
> > > Bartosz, I think you should revert
> > > 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> > > existing gpio drivers. Breakign the kernel like that is not great.
> > >
> > 
> > Hi Dmitry!
> > 
> > This change has been upstream for close to a year - it first appeared
> > in v6.15-rc1. There have been very few reports (I think a couple
> > initially and then none for months) and fixing this is typically
> > trivial. It addressed an actual problem where these retvals would be
> > propagated to user-space and misinterpreted. I think we should fix
> > this driver and keep this change. "Auditing" typically means never
> > fixing things entirely.
> 
> [+LinusW as co-maintainer]
> 
> That's ... an interesting stance. You couldn't even bother going
> through your own subsystem before applying a change that could break
> user's systems.
> 
> Here is your first approximation from gemini:
> 
> Based on my analysis of the drivers in kernel/linux-next/drivers/gpio/, the following drivers have GPIO line getters that return values outside
>   the expected [0, 1] range (when they should return normalized boolean values) or a negative error code:
> 
> 
>    1. `gpio-bd9571mwv.c`: bd9571mwv_gpio_get() returns val & BIT(offset), which can be any power of 2 depending on the offset.
>    2. `gpio-cgbc.c`: cgbc_gpio_get() returns (int)(val & (u8)BIT(offset)), which is not normalized to 0 or 1.
>    3. `gpio-da9055.c`: da9055_gpio_get() returns ret & (1 << offset), which is not normalized.
>    4. `gpio-lp873x.c`: lp873x_gpio_get() returns val & BIT(offset * BITS_PER_GPO), which is not normalized.
>    5. `gpio-stp-xway.c`: xway_stp_get() returns (xway_stp_r32(chip->virt, XWAY_STP_CPU0) & BIT(gpio)), which is not normalized.
>    6. `gpio-tps65086.c`: tps65086_gpio_get() returns val & BIT(4 + offset), which is not normalized.
>    7. `gpio-viperboard.c`: vprbrd_gpiob_get() returns gpio->gpiob_val & (1 << offset) in the branch where the GPIO is configured as an output.

And more to consider:

✦ The following drivers have GPIO get methods that return non-normalized values (values other than 0, 1, or a negative error code):


   * `drivers/iio/adc/ti-ads7950.c`: ti_ads7950_get() returns a bitmask for output pins.
   * `drivers/media/i2c/max9286.c`: max9286_gpiochip_get() returns a bitmask.
   * `drivers/net/phy/qcom/qca807x.c`: qca807x_gpio_get() returns a 2-bit field (0–3).
   * `drivers/pinctrl/renesas/pinctrl-rza1.c`: rza1_gpio_get() returns a bitmask.
   * `drivers/platform/x86/barco-p50-gpio.c`: p50_gpio_get() returns a raw register byte.
   * `drivers/power/supply/sbs-manager.c`: sbsm_gpio_get_value() returns a bitmask.

Thanks.

-- 
Dmitry
