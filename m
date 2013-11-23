From: Calum Lind <calumlind@gmail.com>
Subject: Re: [PATCH 02/10] dell-laptop: Only enable rfkill on Latitudes
Date: Sat, 23 Nov 2013 23:32:03 +0000
Message-ID: <CAEsKfCr1pAauBYR8OKc3qoBfBE2R_YQFkWzh9ukGzMgFAGOJpg@mail.gmail.com>
References: <CAEsKfCpX1mPL4Kg5E4fXAAijdmnRKXs8k5uVQT-+23zfRO+G-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:58474 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756226Ab3KWXcU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Nov 2013 18:32:20 -0500
Received: by mail-we0-f171.google.com with SMTP id q58so2467311wes.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Nov 2013 15:32:18 -0800 (PST)
In-Reply-To: <CAEsKfCpX1mPL4Kg5E4fXAAijdmnRKXs8k5uVQT-+23zfRO+G-g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

An update; After a bit of struggle I finally managed to build and test
the linux next branch, and by replacing "Latitude" product string with
"Precision" it fixed the annoying Bluetooth LED issue[1] I have been
experiencing since Ubuntu 12.10.

Hope this helps.

Calum

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1254138

On 23 November 2013 17:55, Calum Lind <calumlind@gmail.com> wrote:
> Hi Hans
>
> I just noticed this commit upstream and thought it would be pertinent
> that Dell Precisions are based on Latitude hardware so I really think
> should be also included in this new whitelist.
>
> I have a Dell Precision M4300 with a hardware switch so obviously have
> an interest in this. :)
>
> Thanks
>
> Calum
