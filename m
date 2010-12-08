From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for December 8
 (drivers/platform/x86/Kconfig:422:error: recursive dependency detected!)
Date: Wed, 08 Dec 2010 23:35:08 +0000
Message-ID: <1291851309.5992.150.camel@i7.infradead.org>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
	 <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
	 <1291801990.5992.105.camel@i7.infradead.org>
	 <20101208174603.GA7107@core.coreip.homeip.net>
	 <20101208135105.a8482d46.randy.dunlap@oracle.com>
	 <1291849721.5992.145.camel@i7.infradead.org>
	 <20101208233101.GA15294@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101208233101.GA15294@core.coreip.homeip.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Corentin Chary <corentin.chary@gmail.com>, sedat.dilek@gmail.com, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2010-12-08 at 15:31 -0800, Dmitry Torokhov wrote:
> Even better tool would allow selecting the needed optios right there,
> without the need of moving away from teh current option.

That's exactly what the Nemesis version of xconfig did, almost 15 years
ago.

>  And yet better tool would not even ask user and enable them on its
> own. Hey, but we have it! It's called "select".

The tools could do that with 'depends on' too. Why make a distinction?

> Seriously, select is dangerous. I wonder if a rule like "One can only
> select a symbol whose dependencies are all satisfied by the current
> symbol and/or its parents and the symbols they select or depend on"
> would not make select safe enough. 

"One can only select a symbol which isn't otherwise presented to the
user as a choice".

So things like CONFIG_REED_SOLOMON are fine to be selected, because the
user would never see it anyway.

Otherwise, just use depends. And if that's a problem for you, fix the
damn tools.
 
-- 
dwmw2
