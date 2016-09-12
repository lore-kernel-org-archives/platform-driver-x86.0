From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 12:55:28 +0200
Message-ID: <CAMuHMdWYhdRbeMgC7j-MNvzqVKeip6bk+9=xewqGMyiDnUarNQ@mail.gmail.com>
References: <20160912061237.GB11230@kroah.com> <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912070457.GA4590@kroah.com> <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912074059.GA19325@kroah.com> <AM5PR0501MB2097A0B071880E64FB157816A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912081712.GA27368@kroah.com> <AM5PR0501MB20970321C4308E2DB45D59D2A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912083436.GA9490@kroah.com> <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
 <20160912102124.GA3809@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36514 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbcILKza (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 06:55:30 -0400
In-Reply-To: <20160912102124.GA3809@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Mon, Sep 12, 2016 at 12:21 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Sep 12, 2016 at 11:14:26AM +0200, Geert Uytterhoeven wrote:
>> On Mon, Sep 12, 2016 at 10:34 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
>> >> This is LPC to I2C bridge.
>> >
>> > "LPC"?
>>
>> https://en.wikipedia.org/wiki/Low_Pin_Count
>>
>> "Modern ISA"
>
> So my original point stands, 1990's technology being used for brand new
> devices today, ugh :(
>
> Someone needs to go kick some hardware designers...

Non-discoverable buses are everywhere these days.

If only we had some machine-readable language to describe hardware topology.
Oh wait...

http://lmgtfy.com/?q=return+of+the+non-discoverable+buses

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
