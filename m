Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD0CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 12:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57D6A60EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 12:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbhKIMfl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 07:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236039AbhKIMfl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 07:35:41 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133A4C061764
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 04:32:55 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id b12so32720746wrh.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vZ6aUIeCJbBlIO0Lv+WQYFDNRnVtb+GSHZa0RcE2rc=;
        b=zjefnNTa5dG2lLyDyFwcYr3GkGFdRiMW0BfUjt11dHS7twn/Wx415BTEVSo+UwPmc3
         RN0qNqol2NwaZG3z4qUFCf1L+MjGfPc8B1g6HqAgGHReiyj4nQRf4VEk71Zh7keJgcML
         4JitDL82G2/YrG2OQThFdBv9TDmcUQL6KHLjy4E7fNVv9WPjDRDmc6fVQ0O18jau0P8d
         zGB+NKmzP65RSpSB6dKXEHYDzNm02RKiLbMGIoaOZw9z7lkhR5+v4FhcMFbB20iMBayp
         o5cdVdLyh28b7gsRtDoHuVB0JzR2jSOeY946ws55eUYej9prMz3GG0QpEeC8obCx5Dkk
         aF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vZ6aUIeCJbBlIO0Lv+WQYFDNRnVtb+GSHZa0RcE2rc=;
        b=sFPDN+m+IdjCNQripv5+Md09YKeqtHKqr86gV7iNaGL77vX9KQ/2uukOwP2TppyzF1
         AYx0kj20Alm8Cr9yFJMLKgVY61qDsS6jfQSeIzOiClTL7kFNSg5m3CAI6rv7iskNXcEG
         PNUHlgSBjMZVwkKceVVy18CXfG9r2TC20D9KVjIwVmH//+XIGXtLzNpKZixbML/nNi2a
         PeqEAcjkceUBQfTduqO59Pod4ECu8I2RtPgXNpuUdZllCGso93MadrmNUEgWAfoLm9Wb
         uYxxJCqY1m5aNN9BOr//WqD361i99obSHtBTGJdxGai/3cNz2ZCdSWXGXg1UtCsDaf2X
         uaKw==
X-Gm-Message-State: AOAM5321ALoUUh1yji40s7BZZinSxO4+4hslpOr5EMAi05DHFxlgmxDq
        y5crwvZJ9yFpy6Z4j93E1TbHxyQHOwUMo/mtkdc5aQ==
X-Google-Smtp-Source: ABdhPJxBVGq3/twpZtrzbiJORWrfHffp4rl1UwLaiG27C8lDBzeYC7fhbtt4/m1JVkrSQn260BYhdO/Q3ZlAgtSOg5Q=
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr8800449wrz.231.1636461173687;
 Tue, 09 Nov 2021 04:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20211109000130.42361-1-hans-gert.dahmen@immu.ne>
 <YYoSPjF3M05dR0PX@kroah.com> <42cea157-55a2-bd12-335b-6348f0ff6525@immu.ne> <YYpNOMtp7Kwf0fho@kroah.com>
In-Reply-To: <YYpNOMtp7Kwf0fho@kroah.com>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Tue, 9 Nov 2021 13:32:48 +0100
Message-ID: <CAHifhD4f676jiQ52siiKQTjUFXFm6Sto8pQjF07w5y+gqrUvFQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        Mauro Lima <mauro.lima@eclypsium.com>,
        Richard Hughes <hughsient@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 9 Nov 2021, 11:28 Greg KH, <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 09, 2021 at 09:52:53AM +0100, Hans-Gert Dahmen wrote:
> > On 09.11.21 07:16, Greg KH wrote:
> > > On Tue, Nov 09, 2021 at 01:01:30AM +0100, Hans-Gert Dahmen wrote:
> > > > Make the 16MiB long memory-mapped BIOS region of the platform SPI flash
> > > > on X86_64 system available via /sys/kernel/firmware/flash_mmap/bios_region
> > > > for pen-testing, security analysis and malware detection on kernels
> > > > which restrict module loading and/or access to /dev/mem.
> > >
> > > That feels like a big security hole we would be opening up for no good
> > > reason.
> > >
> > > > It will be used by the open source Converged Security Suite.
> > > > https://github.com/9elements/converged-security-suite
> > >
> > > What is the reason for this, and what use is this new interface?
> > Because it is very hard to access the SPI flash to read the BIOS contents
> > for (security) analysis and this works without the more complex and
> > unfinished SPI drivers and it does so on a system where we may not access
> > the full /dev/mem.
>
> Why not fix the spi drivers to do this properly?  What is preventing you
> from doing that instead of adding a new user/kernel api that you will
> have to support for the next 20+ years?
>

Because this interface we want to use is inherently tied to the
workings of x86_64 CPUs. It is very stable and easy to use. The SPI
drivers in contrast have a history of being complex, buggy and in
general not reliable. This module will require very little maintenance
and will probably work in the future without needing modification for
newer platforms. It generally is meant as a fallback to the real SPI
flash drivers so that userspace programs are able to provide essential
functionality.

> > > > +static int __init flash_mmap_init(void)
> > > > +{
> > > > + int ret;
> > > > +
> > > > + pdev = platform_device_register_simple("flash_mmap", -1, NULL, 0);
> > > > + if (IS_ERR(pdev))
> > > > +         return PTR_ERR(pdev);
> > > > +
> > > > + ret = sysfs_create_group(&pdev->dev.kobj, &flash_mmap_group);
> > >
> > > You just raced with userspace and lost  >
> > > Please set the attribute to the platform driver before you create the
> > > device.
> > >
> >
> > Sorry, but I went through tons of code and could not find a single instance
> > where I can use a default group for creation without using a probe function
> > that does the magic for me. Please help me find the correct way of doing
> > this without manually creating and adding kobjects.
>
> The problem here is that you are abusing the platform driver code and
> making a "fake" device that is not attached to anything real, and
> without a driver.  That should not be done, as you do not know what
> hardware this driver is going to be run on.
>
> Bind to the real hardware resource please.

In a previous mail in June you suggested this is some sort of platform
device, that is why I rewrote it as such. The hardware resource here
is the south bridge for x86_64 CPUs and the module dependencies will
compile it only for these platforms. The situation is like, if you
have that CPU, you have the hardware, so it is implicitly bound or it
just will not execute on a machine code level. I feel like your
requirement is somewhat impossible to satisfy and I really don't know
what to do. Please, can anyone help me by pointing out a proper
example elsewhere in the kernel?

Hans-Gert
