From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Tue, 5 Jun 2012 15:06:04 +0200
Message-ID: <201206051506.04677.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <201206041914.00536.marex@denx.de> <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:46840 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752757Ab2FENGL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jun 2012 09:06:11 -0400
In-Reply-To: <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, "Zhang, Rui" <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>

Dear Corentin Chary,

> On Mon, Jun 4, 2012 at 7:14 PM, Marek Vasut <marex@denx.de> wrote:
> > Dear Corentin Chary,
> > 
> >> On Fri, Jun 1, 2012 at 7:11 PM, Marek Vasut <marex@denx.de> wrote:
> >> > This is the ambient light sensor found on Iconia W500.
> >> > 
> >> > Signed-off-by: Marek Vasut <marex@denx.de>
> >> > Cc: joeyli <jlee@suse.com>
> >> > ---
> > 
> > [...]
> > 
> >> > +static int __init acer_wmi_alsd_setup(void)
> >> > +{
> >> > +       int err;
> >> > +
> >> > +       err = acer_wmi_get_handle("ALSD", "ACPI0008", &alsd_handle);
> >> > +       if (err)
> >> > +               return err;
> >> 
> >> NACK !
> > 
> > What are you trying to achieve with such attitude? Are you trying to show
> > off how much you can scream at someone new? I'd tell you some really
> > harsh words and would turn my back on all this linux stuff if I wasn't
> > used to people in kernel mailing lists having quite weird manners
> > sometimes.
> 
> Sorry, that really wasn't what I meant. ACK / NACK are traditionnaly
> written like this arround here, but the "!" was probably too much.

Ok, don't worry :-) Sorry about my jab above.

> >> This is a generic device, and should be handled by ACPI core
> >> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.
> > 
> > Saying this would be enough. Lee explained to me what this ACPI0008
> > means, I'm quite new to the ACPI land so pardon my ignorance here. But
> > it then boils down to Lee's question, why wasn't the patch for ACPI ALS
> > that was already proposed accepted? And what can be done to get it in?
> 
> Yep, I've seen Lee's message latter. Regarding ACPI ALS status, it was
> forgotten for a long time, and recently Zhang Rui told that he will
> take another look at it, but nothing sure. If you want to know more
> about the status, you can do a quick search on gmane using "ACPI ALS"
> query on linux.acpi

Will do, but I have an exam on 20th so I'll either poke into it if I need some 
rest or afterwards.

Best regards,
Marek Vasut
