From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller power
 status
Date: Fri, 8 Sep 2017 21:14:52 -0700
Message-ID: <20170909041452.GA1084@fury>
References: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
 <20170908080729.GT2477@lahna.fi.intel.com>
 <339f06ce8efd42409bf5f91dfd064e7a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44711 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbdIIEO4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Sep 2017 00:14:56 -0400
Content-Disposition: inline
In-Reply-To: <339f06ce8efd42409bf5f91dfd064e7a@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

On Fri, Sep 08, 2017 at 03:15:10PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> > Sent: Friday, September 8, 2017 3:07 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-driver-
> > x86@vger.kernel.org; Richard Hughes <hughsient@gmail.com>; Yehezkel Bernat
> > <yehezkelshb@gmail.com>
> > Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller power
> > status
> > 
> > On Thu, Sep 07, 2017 at 01:47:22PM -0500, Mario Limonciello wrote:
> > 
> > I have a small comment which you might want to consider.
> > 
> > > +static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev)
> > > +{
> > > +	return sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
> > > +}
> > > +
> > > +static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> > > +{
> > > +	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
> > > +	return 0;
> > > +}
> > 
> > In order to notify userspace about this, what if you send KOBJ_CHANGE
> > for the wdev when you add/remove this attribute?
> 
> Sure, makes sense to me.   I'll send a follow up patch.

Hrm, what am I missing.... the reason I recommended Mario add the attribute
group was so this would be automatically taken care of prior to the KOBJ_ADD
event, per the device documentation:

driver-model/device.txt

-- 
Darren Hart
VMware Open Source Technology Center
