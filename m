From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 12:21:24 +0200
Message-ID: <20160912102124.GA3809@kroah.com>
References: <20160912061237.GB11230@kroah.com>
 <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912070457.GA4590@kroah.com>
 <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912074059.GA19325@kroah.com>
 <AM5PR0501MB2097A0B071880E64FB157816A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912081712.GA27368@kroah.com>
 <AM5PR0501MB20970321C4308E2DB45D59D2A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912083436.GA9490@kroah.com>
 <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33894 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbcILKVU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 06:21:20 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Mon, Sep 12, 2016 at 11:14:26AM +0200, Geert Uytterhoeven wrote:
> On Mon, Sep 12, 2016 at 10:34 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> >> This is LPC to I2C bridge.
> >
> > "LPC"?
> 
> https://en.wikipedia.org/wiki/Low_Pin_Count
> 
> "Modern ISA"

So my original point stands, 1990's technology being used for brand new
devices today, ugh :(

Someone needs to go kick some hardware designers...

greg k-h
