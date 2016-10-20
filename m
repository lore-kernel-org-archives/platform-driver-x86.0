From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] ideapad-laptop: Add another DMI entry for Yoga 900
Date: Thu, 20 Oct 2016 10:37:01 +0300
Message-ID: <20161020073701.GS1722@lahna.fi.intel.com>
References: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
 <20161019201043.GA78689@f23x64.localdomain>
 <e7efc31b-7410-8386-e98e-f65762f07e40@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:14629 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932277AbcJTHno (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2016 03:43:44 -0400
Content-Disposition: inline
In-Reply-To: <e7efc31b-7410-8386-e98e-f65762f07e40@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Thu, Oct 20, 2016 at 08:56:30AM +0800, Ike Panhc wrote:
> On 10/20/2016 04:10 AM, Darren Hart wrote:
> > On Wed, Oct 19, 2016 at 01:27:40PM +0300, Mika Westerberg wrote:
> >> This particular laptop has its motherboard replaced and after that, even
> >> with the latest BIOS, some DMI identification strings have become
> >> "INVALID". This includes DMI_PRODUCT_VERSION which results Wifi being
> >> blocked.
> >>
> >> It seems that DMI_BOARD_NAME is still valid so use that as an
> >> alternative for Lenovo Yoga 900.
> > 
> > Well, that stinks. We have a similar split for the Yoga 2 11/13/Pro.
> > 
> > Applied.
> > 
> 
> Hi Mika,
> 
> Could you post output of acpidump and `cat /sys/class/dmi/id/modalias` for record please?
> 

Here it is:

dmi:bvnLENOVO:bvrC6CN37WW:bd03/01/2016:svnLENOVO:pnINVALID:pvrINVALID:rvnLENOVO:rnVIUU4:rvrSDK0K17763WIN:cvnLENOVO:ct10:cvrINVALID:
