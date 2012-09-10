From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: samsung-laptop: light sensor?
Date: Mon, 10 Sep 2012 10:27:52 +0100
Message-ID: <CAHR064iz1BTP71FMVb_3vYpx0+Jg9v56oZqMfJnu7K__mFO4Ng@mail.gmail.com>
References: <504CEE8B.9070905@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:33750 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab2IJJ1w (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Sep 2012 05:27:52 -0400
Received: by qaas11 with SMTP id s11so759549qaa.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Sep 2012 02:27:52 -0700 (PDT)
In-Reply-To: <504CEE8B.9070905@ahsoftware.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alexander Holler <holler@ahsoftware.de>
Cc: platform-driver-x86@vger.kernel.org

On Sun, Sep 9, 2012 at 8:31 PM, Alexander Holler <holler@ahsoftware.de> wrote:
> Hello,
>
> I'm searching some information about how to read the values from the
> light sensor found on some Samsung laptops.
>
> Does anyone have any information about how to access the light sensor?
> If I would find such information, I would (try) to write a driver (or
> enhance samsung-laptop), at least to read the values and maybe something
> to adjust the keyboard- and/or the lcd-backlight (on startup and maybe
> dynamically at runtime).
>
> Regards,
>
> Alexander

Hello Alexander,
The light sensor can be used (on mine at least), but nobody had the
time to write (rebase) the driver for it.
Check these discussions:
http://search.gmane.org/?query=ACPI+light+sensor&group=gmane.linux.acpi.devel

Basically, it's a standard ACPI light sensor, there was a driver for
it, but it should use another subsystem, and nobody did the work so
far :). I'll happy to review if you have the time to do that.



-- 
Corentin Chary
http://xf.iksaif.net
