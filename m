From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 20:46:11 +0100
Message-ID: <20171013204611.7487f55c@alans-desktop>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
        <20171012110903.3ab4ed5e@alans-desktop>
        <20171013004645.GB1470@fury>
        <20171013094314.GB29864@kroah.com>
        <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
        <20171013161936.430f7a02@alans-desktop>
        <dcf35817f6234dac99b51e9eea2c7c78@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:53608 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751650AbdJMTqu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 15:46:50 -0400
In-Reply-To: <dcf35817f6234dac99b51e9eea2c7c78@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> I think I'd actually like to meld this with your other ideas and what I've 
> currently got.  What do you think of this approach:
> 
> 	/* kernel community doesn't feel userspace should have access at all
> 	  * or other kernel drivers use this
> 	  */
> 	if (blacklisted)
> 		return NO;
> 
> 	/* unprivileged access allowed */
>  	if (whitelisted & (capabilities && whitelist->capability_need) ==
>  	whitelist->capability_need))
>  		return ALLOWED;
>  
> 	/* not yet in whitelist, or need privs to do */
>  	if (capable(CAP_SYS_RAWIO))
>  		return ALLOWED;
>  
>  	return NO
> 

This looks sensible to me. Note that the middle case isn't necessarily
'unprviliged'. If the entyr is whitelisted and the capability_need is 0
then it means 'anyone' but you can also set any other appropriate
capability (eg CAP_NET_ADMIN for a WMI call that does stuff to the wifi).

Alan
