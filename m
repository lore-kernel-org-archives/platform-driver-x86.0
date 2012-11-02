From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 1/1] Platform: x86: Add Chrome OS Laptop driver
Date: Fri, 2 Nov 2012 13:45:26 +0100
Message-ID: <CAOesGMj3urrhy83o1aD4q3K0CqOL6ZrchknmdvgHDWkahavQQA@mail.gmail.com>
References: <1341961393-17728-1-git-send-email-bleung@chromium.org>
	<1351200081-19349-1-git-send-email-bleung@chromium.org>
	<1351200081-19349-2-git-send-email-bleung@chromium.org>
	<CAHR064jAfmmpf-p5Yh=SZWW31kr0JxcA3VNQrCTV=T9U48HQtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:53827 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796Ab2KBMp1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Nov 2012 08:45:27 -0400
Received: by mail-ie0-f174.google.com with SMTP id k13so4939715iea.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Nov 2012 05:45:27 -0700 (PDT)
In-Reply-To: <CAHR064jAfmmpf-p5Yh=SZWW31kr0JxcA3VNQrCTV=T9U48HQtw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, olofj@chromium.org

On Fri, Oct 26, 2012 at 10:30 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:

> Looks better, but I'm curious, what is the final purpose of this driver ?
> What ABI will be exposed, who will use it ?
>
> If it is going to be bigger, it may be a good idea to convert it to a
> real platform driver (platform_drivers/platform_device stuff).

It's not a driver per se. It's platform glue that, based on the DMI
table, registers platform and i2c devices (at this time only i2c
devices).

Unfortunately there's no way to do this nicely from userspace after
boot, since there's limits to how much data you can provide with the
simpler userspace-driven i2c probing protocol.

So, there's no user-facing ABI on this, and no one is expected to use
it from userspace. It's just there to make sure that the un-probably
devices on this kind of hardware gets bound to drivers properly.

If it's converted to a platform_driver, how do you expect that to
probe, where would the platform_device be registered?


-Olof
