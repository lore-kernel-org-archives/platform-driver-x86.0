From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 09/14] platform/x86: dell-smbios: rename to
 dell-wmi-smbios
Date: Wed, 27 Sep 2017 15:30:23 -0700
Message-ID: <20170927223023.GR23572@fury>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <746fb34ff44824808e7892f81247436f80c7ab83.1506451187.git.mario.limonciello@dell.com>
 <201709262206.13177@pali>
 <cdc310f9f2d347ba83930cab5fef8efa@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51866 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbdI0WaZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 18:30:25 -0400
Content-Disposition: inline
In-Reply-To: <cdc310f9f2d347ba83930cab5fef8efa@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Tue, Sep 26, 2017 at 08:18:54PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Tuesday, September 26, 2017 4:06 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > quasisec@google.com
> > Subject: Re: [PATCH v2 09/14] platform/x86: dell-smbios: rename to dell-wmi-
> > smbios
> > 
> > On Tuesday 26 September 2017 20:50:07 Mario Limonciello wrote:
> > > This follows the style of the rest of the platform x86 WMI drivers.
> > >
> > > Renaming the driver requires adjusting the other drivers using
> > > dell-smbios to pick up the newly named includes.
> > >
> > > While renaming, I noticed that this driver was missing from
> > > MAINTAINERS. Add it to that and myself to the list of people
> > > maintaing it.
> > >
> > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > 
> > Now when driver supports both old and new WMI call interface, I think
> > that renaming is not needed...
> > 
> 
> So all other drivers that use WMI have "WMI" in the name, this would be
> breaking previously set precedence.  Daren, Andy, what would you like
> me to do?

I'm leaning toward Pali's point of view here. In fact, I think the driver name
should reflect WHAT it does as opposed to HOW it does it. vendor-hotkeys is a
much better name than vendor-wmi. We have a lot of drivers that are not nicely
granular and use more generic terms like -acpi or -laptop, but those shouldn't
be the first choice in my opinion. Now, is SMBIOS any better than WMI? :-) Not
really, but it is at least as good as, and less change makes it the winner IMO.

-- 
Darren Hart
VMware Open Source Technology Center
