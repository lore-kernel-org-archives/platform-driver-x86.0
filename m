From: Samuel Xu <samuel.xu.tech@gmail.com>
Subject: Re: How to read time stamp from HPET timer from device driver?
Date: Tue, 13 Jul 2010 17:39:11 +0800
Message-ID: <AANLkTimRXZqDDcIsPEbgNdAEk3ZzEXzp2MXMcLgl1UnS@mail.gmail.com>
References: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:50150 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231Ab0GMJjM convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 05:39:12 -0400
Received: by vws5 with SMTP id 5so5572948vws.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jul 2010 02:39:11 -0700 (PDT)
In-Reply-To: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I tried hpet_readl() from my driver code, while hit compiling error.
is it a correct API for kernel driver to invoke? any more hint?

2010/7/13 Samuel Xu <samuel.xu.tech@gmail.com>:
> HI:
> I am a freshman for HPET timer. Previously, I use TSC counter, to use
> rdtsc to get the time stamp. elapsed cycle can be counter from 2 time
> stamps.
> As a advanced replacement of TSC, I suppose HPET timer can be
> conveniently to read time stamp from both kernel mode user =A0and use=
r
> mode apps.
> While I failed to find a way to get time stamp value of HPET in Linux
> kenerl (I am doing a driver and want to know elapsed cycle from drive=
r
> code).
>
> Anyone can help me?
>
> Thanks!
>
> Samuel
>
