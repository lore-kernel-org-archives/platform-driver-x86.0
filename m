From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: dell-smbios-wmi: Disable userspace
 interface if missing hotfix
Date: Mon, 20 Nov 2017 12:37:49 -0800
Message-ID: <20171120203749.GA5421@fury>
References: <1510891992-31659-1-git-send-email-mario.limonciello@dell.com>
 <20171117203922.GG22250@fury>
 <4f2192b6a6ed4764b5645efa7f6f2a54@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35972 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752405AbdKTUh5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 15:37:57 -0500
Content-Disposition: inline
In-Reply-To: <4f2192b6a6ed4764b5645efa7f6f2a54@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, Nov 20, 2017 at 04:03:53PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Friday, November 17, 2017 2:39 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> > kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH v2] platform/x86: dell-smbios-wmi: Disable userspace
> > interface if missing hotfix
> > 
> > On Thu, Nov 16, 2017 at 10:13:12PM -0600, Mario Limonciello wrote:
> > > The Dell SMBIOS WMI interface will fail for some more complex calls unless
> > > a WMI hotfix has been included.  Most platforms have this fix available in
> > > a maintenance BIOS release.  In the case the driver is loaded on a
> > > platform without this fix, disable the userspace interface.
> > >
> > > A hotfix indicator is present in the dell-wmi-descriptor that represents
> > > whether or not more complex calls will work properly.
> > >
> > > "Simple" calls such as those used by dell-laptop and dell-wmi will continue
> > > to work properly so dell-smbios-wmi should not be blocked from binding and
> > > being used as the dell-smbios dispatcher.
> > >
> > > Suggested-by: Girish Prakash <girish.prakash@dell.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > 
> > Queued up, thanks Mario.
> 
> Darren, even though this came after the merge windows opened considering this 
> restricts the SMBIOS interface from some platform/firmware combinations it 
> shouldn't be offered, do you think this can be included with a future 4.15 
> RCx PR so it can land with the rest of the series rather than targeted for 4.16?

This will make 4.15.

> 
> I'd hate to get stuck in a situation that an interface deemed "broken" gets offered
> to people it shouldn't.
> 

Agreed.

-- 
Darren Hart
VMware Open Source Technology Center
