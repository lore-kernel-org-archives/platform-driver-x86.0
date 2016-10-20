From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 910-13IKB to
 no_hw_rfkill dmi list
Date: Thu, 20 Oct 2016 18:46:14 +0300
Message-ID: <20161020154614.GQ24289@lahna.fi.intel.com>
References: <1476228482-2823-1-git-send-email-masneyb@onstation.org>
 <20161012081739.GB4411@f23x64.localdomain>
 <a848d067-25af-26a8-7f4c-d785b73232c3@canonical.com>
 <20161020011814.GA11359@basecamp.onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:14187 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754241AbcJTPqT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2016 11:46:19 -0400
Content-Disposition: inline
In-Reply-To: <20161020011814.GA11359@basecamp.onstation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Brian Masney <masneyb@onstation.org>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 19, 2016 at 09:18:14PM -0400, Brian Masney wrote:
> On Thu, Oct 20, 2016 at 08:58:53AM +0800, Ike Panhc wrote:
> > On 10/12/2016 04:17 PM, Darren Hart wrote:
> > > On Tue, Oct 11, 2016 at 07:28:02PM -0400, Brian Masney wrote:
> > >> The Lenovo Yoga 910-13IKB does not have a hw rfkill switch, and trying
> > >> to read the hw rfkill switch through the ideapad module causes it to
> > >> always report as blocked.
> > >>
> > >> This commit adds the Lenovo Yoga 910-13IKB to the no_hw_rfkill dmi list,
> > >> fixing the WiFI breakage.
> > >>
> > >> Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > 
> > > Thanks Brian,
> > > 
> > > Queued to testing.
> > > 
> > 
> > Hi Brian,
> > 
> > Could you post output of acpidump and `cat /sys/class/dmi/id/modalias` for record please?
> > 
> > I would like to see if there is anyway to short the growing blacklist.
> 
> Hi Ike,
>    I attached the compressed output from acpidump. Here is the contents
> of my /sys/class/dmi/id/modalias:
> 
> dmi:bvnLENOVO:bvr2JCN28WW:bd09/09/2016:svnLENOVO:pn80VF:pvrLenovoYOGA910-13IKB:rvnLENOVO:rnVIUU4:rvrSDK0J40709WIN:cvnLENOVO:ct10:cvrLenovoYOGA910-13IKB:

Hmm, comparing that to my Yoga 900:

dmi:bvnLENOVO:bvr2JCN28WW:bd09/09/2016:svnLENOVO:pn80VF:pvrLenovoYOGA910-13IKB:rvnLENOVO:rnVIUU4:rvrSDK0J40709WIN:cvnLENOVO:ct10:cvrLenovoYOGA910-13IKB:
dmi:bvnLENOVO:bvrC6CN37WW:bd03/01/2016:svnLENOVO:pnINVALID:pvrINVALID:rvnLENOVO:rnVIUU4:rvrSDK0K17763WIN:cvnLENOVO:ct10:cvrINVALID:

The DMI_BOARD_NAME==VIIU4 seems to be in both (I hope it is limited to
only such Lenovo Yoga laptops without physical rfkill switch ;-))
