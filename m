From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Thu, 25 Jun 2015 13:00:16 -0700
Message-ID: <20150625200016.GB61540@vmdeb7>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
 <1435215484.4528.96.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52498 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752189AbbFYUAW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Jun 2015 16:00:22 -0400
Content-Disposition: inline
In-Reply-To: <1435215484.4528.96.camel@tiscali.nl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Alex Hung <alex.hung@canonical.com>, corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Thu, Jun 25, 2015 at 08:58:04AM +0200, Paul Bolle wrote:
> On Wed, 2015-06-24 at 10:57 +0800, Alex Hung wrote:
> > --- /dev/null
> > +++ b/drivers/platform/x86/asus-rbtn.c
> 
> > +MODULE_ALIAS("acpi*:ATK4001:*");
> 
> This looked odd. It turned out this is the pattern that
> scripts/mod/file2alias.c::do_acpi_entry() creates. 
> 
> > +static const struct acpi_device_id asusrb_ids[] = {
> > +	{"ATK4001", 0},
> > +	{"", 0},
> > +};
> 
> I think you should just put
>     MODULE_DEVICE_TABLE(acpi, asusrb_ids);
> 
> here, like all other drivers do, and drop the odd looking alias.
> 
> All others drivers except drivers/platform/x86/hp-wireless.c, that is.
> (I noticed that you also wrote that driver.) It should just use
> MODULE_DEVICE_TABLE() too

Thanks for digging in to that, it raised an eyebrow for me as well, but I didn't
dig into it after finding at least one other instance of it.... :-)

-- 
Darren Hart
Intel Open Source Technology Center
