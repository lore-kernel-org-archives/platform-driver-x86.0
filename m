From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: intel_pmc_ipc: fix io mem mapping
 size
Date: Fri, 17 Mar 2017 00:50:03 +0530
Message-ID: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
References: <1ab8d18dd7f5428869e6e77026ac4206863eea08.1489634924.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170316145203.GA23198@rajaneesh-OptiPlex-9010>
 <d72e4ad6-cd64-dccf-afb8-ae8644a8dd73@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48553 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752751AbdCPTUP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2017 15:20:15 -0400
Content-Disposition: inline
In-Reply-To: <d72e4ad6-cd64-dccf-afb8-ae8644a8dd73@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sathyanarayanan kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 16, 2017 at 11:50:16AM -0700, sathyanarayanan kuppuswamy wrote:
> Hi,
> 
> 
> On 03/16/2017 07:52 AM, Rajneesh Bhardwaj wrote:
> >On Wed, Mar 15, 2017 at 08:32:53PM -0700, Kuppuswamy Sathyanarayanan wrote:
> >>Mapping entire GCR mem region in this driver creates
> >>mem region request conflict in sub devices that depend
> >>on PMC. This creates driver probe failure in devices like
> >>iTC0_wdt and telemetry device.
> >While this patch might fix the issue for now but IMHO its not taking the
> >right approch. I guess we need some guidance here from the maintainers but
> Agreed. I thought about this problem and I know this solution does not
> scale well. Other way is to expose an API for GCR access and use it on
> PMC dependent drivers. In this case, we should also add GCR register
> address macros to PMC header file and this might need change to PMC header
> file each time when some one wants to add access new register address.
> 
> Since S0ix counter access is only GCR access use case in PMC driver, I
> thought  both solutions has some pros and cons.
> >please do consider the below explaination for why we shoud not take this
> >approch to fix WDT issue. Telemetry driver has no issues while loading since
> >its not using any register in the GCR region.
> >PMC on BXT/APL platforms has contiguous IPC and GCR regions. PMC_IPC driver
> >maps the entire IPC and GCR region. It would be inefficient to map and unmap
> >each time we want to use another register present in IPC or GCR spaces.
> But I am wondering whether there will be any future GCR access
> changes in PMC driver?

You never know!

> If its going to be just S0ix counter access then I don't think we
> need to worry about performance here.

Ditto, its not about performance.

> >
> >iTCO_WDT driver needs to check the BIT4 (NO_REBOOT) of PMC_CFG register
> >(Offset: 0x1008) and this falls in GCR space. The iTCO_WDT driver fails to
> >load because it can't request mem region for the resources already claimed
> >by PMC_IPC driver. However, ioremap would still work here and WDT driver
> >would load just fine.
> >
> >So, IMHO the problem lies elsewhere and we should find a way to handle this
> >better in iTCO_WDT driver.
> >
> >The IPC and GCR resources belong to PMC and should be claimed by the PMC
> >driver rightfully and should not be reclaimed by iTCO_WDT or any other
> >driver.
> iTCO_WDT , Telemtry and Punit are PMC dependent devices right ? And they
> share the resources among them right ?

Resources belong to PMC and hence it should own them, others share. Other
drivers request and map those resources only when PMC driver does not
already do so.

> >
> >
> >>Currently this driver only need memory mapping for
> >>s0ix counter registers. So this patch fixes this issue
> >>by requesting memory mapping for only the s0ix counter mem
> >>region.
> >How about exposing a new API in PMC_IPC driver which can be used for reading
> >the desired GCR register and it can be used by iTCO_WDT instead of
> >requesting mem regions and remapping?
> If you think in future if we might need access to more GCR space in
> PMC driver, then we need to change this solution. 
>
> Please let me know. If yes, I will add an API as you mentioned.

Yes, I think so. Hope Andy and Darren are fine with that?


> >

-- 
Best Regards,
Rajneesh
