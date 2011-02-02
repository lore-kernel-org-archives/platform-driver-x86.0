From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel_mid_powerbtn: add power button driver for Medfield
 platform (#3)
Date: Wed, 2 Feb 2011 09:00:09 -0800
Message-ID: <20110202170009.GC3178@core.coreip.homeip.net>
References: <20110127134812.6753.22203.stgit@bob.linux.org.uk>
 <20110130203950.GA20142@core.coreip.homeip.net>
 <20110202101745.647e9db2@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:49323 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754491Ab1BBRAS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Feb 2011 12:00:18 -0500
Received: by iwn9 with SMTP id 9so162771iwn.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Feb 2011 09:00:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20110202101745.647e9db2@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Wed, Feb 02, 2011 at 10:17:45AM +0000, Alan Cox wrote:
> On Sun, 30 Jan 2011 12:39:50 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > On Thu, Jan 27, 2011 at 01:52:13PM +0000, Alan Cox wrote:
> > > From: Hong Liu <hong.liu@intel.com>
> > > 
> > > The power button is connected to MSIC on Medfield, we will get two
> > > interrupts from IOAPIC when pressing or releasing the power button.
> > > 
> > > Signed-off-by: Hong Liu <hong.liu@intel.com>
> > > [Minor fixes as noted by Dmitry]
> > > Signed-off-by: Alan Cox <alan@linux.intel.com>
> > 
> > Acked-by: Dmitry Torokhov <dtor@mail.ru>
> > 
> > Input parts look good to me but you might want to fold in the following
> > patch.
> 
> Ok I wouldn't move the module_init/exit around like that but no big deal
> 8)

Yeah, I can't myself decide which style I like better :)

Well, anyway, aside from MODULE_ALIAS() anything else can be cut from
that patch so I'll leave it to Matthew to decide what he likes best.

Thanks.

-- 
Dmitry
