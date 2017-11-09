From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] platform/x86: dell-*wmi*: Relay failed initial probe
 to dependent drivers
Date: Thu, 9 Nov 2017 09:52:41 -0800
Message-ID: <20171109175241.GD21449@fury>
References: <cover.1509725778.git.mario.limonciello@dell.com>
 <6312b76d08d3b6b5562c773fce8e13d85036ddd5.1509725778.git.mario.limonciello@dell.com>
 <20171109160249.jjiros7c4z6f76wr@pali>
 <8746e7178fb84a1b9309a6b228af604f@ausx13mpc120.AMER.DELL.COM>
 <20171109172834.wi3udtnuxkqolbzm@pali>
 <2ee7e355941f4ef5a244f152d4953753@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43109 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750984AbdKIRwn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 12:52:43 -0500
Content-Disposition: inline
In-Reply-To: <2ee7e355941f4ef5a244f152d4953753@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Thu, Nov 09, 2017 at 05:34:39PM +0000, Mario.Limonciello@dell.com wrote:
> > > > >  static int dell_wmi_probe(struct wmi_device *wdev)
> > > > >  {
> > > > >  	struct dell_wmi_priv *priv;
> > > > > +	int ret;
> > > > >
> > > > >  	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
> > > > >  		return -ENODEV;
> > > >
> > > > Just one suggestion, is above check still needed in dell-wmi.c code?
> > > > I think that now it should be job of dell_wmi_get_descriptor_valid()
> > > > function to fully validate if dell wmi descriptor driver is able to
> > > > provide all needed information for dell-wmi driver.
> > > >
> > >
> > > Yes, I believe it's still needed because if the GUID isn't on the bus the probe
> > > routine for dell-wmi-descriptor won't run and dell_wmi_get_descriptor_valid()
> > > will continually return -EPROBE_DEFER.
> > >
> > > That's the exact problem this patch exists for (preventing infinite deferred
> > > probing).
> > >
> > > Perhaps a "cleaner" solution is to have the init routine of dell-wmi-descriptor
> > > do this wmi_has_guid check and set the descriptor_valid variable to -ENODEV
> > > so that "dependent" drivers don't need to.
> > 
> > I understand. But I mean, if function dell_wmi_get_descriptor_valid()
> > should not do that check for DELL_WMI_DESCRIPTOR_GUID itself.
> > 
> > Because every driver which would use dell-wmi-descriptor needs to
> > do that check.
> 
> I'll move the check to dell_wmi_descriptor_valid().  That actually does remove
> the need for even including the GUID #define in a header file.  All use will be
> contained now directly in dell-wmi-descriptor.c.

This is a worthwhile improvement.

-- 
Darren Hart
VMware Open Source Technology Center
