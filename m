From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 15:16:33 -0700
Message-ID: <20171013221543.GA4550@fury>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
 <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
 <20171013161936.430f7a02@alans-desktop>
 <dcf35817f6234dac99b51e9eea2c7c78@ausx13mpc124.AMER.DELL.COM>
 <20171013204611.7487f55c@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013204611.7487f55c@alans-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Mario.Limonciello@dell.com, greg@kroah.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 13, 2017 at 08:46:11PM +0100, One Thousand Gnomes wrote:
> > I think I'd actually like to meld this with your other ideas and what I've 
> > currently got.  What do you think of this approach:
> > 
> > 	/* kernel community doesn't feel userspace should have access at all
> > 	  * or other kernel drivers use this
> > 	  */
> > 	if (blacklisted)
> > 		return NO;
> > 
> > 	/* unprivileged access allowed */
> >  	if (whitelisted & (capabilities && whitelist->capability_need) ==
> >  	whitelist->capability_need))
> >  		return ALLOWED;
> >  
> > 	/* not yet in whitelist, or need privs to do */
> >  	if (capable(CAP_SYS_RAWIO))
> >  		return ALLOWED;
> >  
> >  	return NO
> > 
> 
> This looks sensible to me. Note that the middle case isn't necessarily
> 'unprviliged'. If the entyr is whitelisted and the capability_need is 0
> then it means 'anyone' but you can also set any other appropriate
> capability (eg CAP_NET_ADMIN for a WMI call that does stuff to the wifi).

Thank you Alan. This model appears consistent in intent with some of the higher
level WMI access privileges in the Windows OS, and translate fairly well to
Linux.

This seems like a good model at least for the dell smbios driver in this thread.

I do have some concerns about the ability to audit the buffer in the general
case. Dell uses a sensible buffer format with 'command' and 'class' fields, but
the WMI spec explicitly makes no requirement on the format of the buffer. This
may prove much harder to implement for other vendors depending on their format -
but perhaps we accept that and deal with that as it comes up.

-- 
Darren Hart
VMware Open Source Technology Center
