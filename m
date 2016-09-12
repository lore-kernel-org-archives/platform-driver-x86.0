From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 11:14:26 +0200
Message-ID: <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
 <20160912061237.GB11230@kroah.com> <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912070457.GA4590@kroah.com> <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912074059.GA19325@kroah.com> <AM5PR0501MB2097A0B071880E64FB157816A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912081712.GA27368@kroah.com> <AM5PR0501MB20970321C4308E2DB45D59D2A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912083436.GA9490@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:32910 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756844AbcILJO2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 05:14:28 -0400
In-Reply-To: <20160912083436.GA9490@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Mon, Sep 12, 2016 at 10:34 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>> This is LPC to I2C bridge.
>
> "LPC"?

https://en.wikipedia.org/wiki/Low_Pin_Count

"Modern ISA"

>> Controller logic is implemented in Lattice CPLD. CPLD itself is attached to LPC.
>
> And how is the CPLD attached to the CPU?

Via LPC, I guess.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
