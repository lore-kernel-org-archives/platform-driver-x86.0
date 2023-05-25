Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7C0C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 10:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbjEYKoR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 06:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjEYKoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 06:44:17 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B65139
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685011455; x=1716547455;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+5+25iLs7xWyMKvBvggnJNRId9dfj3Y3w/nJJCRvs5k=;
  b=IaRMsfbvDiV4ppoLALHV+GulvE6V/75cvdMVo1WIyOqL4nWoZwEiPUgM
   2no95HE3qF0V+ZGbfTIUaCzuU6IenWm0F3K2il6xh/u+jR9RcUcLquKeo
   MT5lI8Y3uY1vOHIksWu9xsTn8/iZYlvGHx4XL9Bm7OFMmzT3/IbiSz9Ph
   M0ljnKBQrQQg7TYxDWWgXgvY+U5vc7iTQNEa0QKtnfveouPKdwpyjOpB7
   GriI+hqoqwLe0tvHL3QWWl6x5LJjibn9CWESdYJFNXq8hxcIG1O0HkUKc
   SBCtmhxk7h8pzAC2pkTL1GrVaNE6Jy+nDrx+SaNpOTVDUioKTFB8R31MM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="419572963"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="419572963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 03:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="735503759"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="735503759"
Received: from aghiriba-mobl.ger.corp.intel.com ([10.249.40.17])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 03:44:11 -0700
Date:   Thu, 25 May 2023 13:44:09 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
In-Reply-To: <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com>
Message-ID: <4651d798-886-9144-7bac-4a87d73fd48@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com> <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com> <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com> <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
 <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-721331926-1685011453=:1738"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-721331926-1685011453=:1738
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 25 May 2023, Shyam Sundar S K wrote:
> On 5/25/2023 3:29 PM, Ilpo Järvinen wrote:
> > On Thu, 25 May 2023, Shyam Sundar S K wrote:
> >> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
> >>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
> >>>
> >>>> Add a helper routine to check the underlying cpu id, that can be used
> >>>> across the PMC driver to remove the duplicate code.
> >>>>
> >>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>> ---
> >>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
> >>>>  1 file changed, 14 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> >>>> index e2439fda5c02..7e5e6afb3410 100644
> >>>> --- a/drivers/platform/x86/amd/pmc.c
> >>>> +++ b/drivers/platform/x86/amd/pmc.c
> >>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> >>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
> >>>>  }
> >>>>  
> >>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
> >>>
> >>> Does sup refer to "supported" or some other acronym? If the latter,
> >>
> >> Yes, please read that as "supported"
> >>
> >>> you should mention/open it in the changelog and/or in a comment. If the 
> >>> former, the function naming seems too generic (an observation entirely 
> >>> based on how/where the function is used, you're not exactly verbose on 
> >>> what this actually checks for other than what looks like a set of CPU 
> >>> IDs but clearly there's more behind it).
> >>
> >> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?
> > 
> > This makes things odder, it gets used in two places:
> > 
> > 	if (enable_stb) {
> > 		if (amd_pmc_check_sup_cpuid(dev))
> > 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
> > 		else
> > 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
> > 	}
> > 
> > What about that else branch (PMC is not supported so who does that make 
> > sense when the file is called pmc.c)? And here:
> 
> I did not understand the actual concern.

The file is cammed pmc.c and states "AMD SoC Power Management Controller 
Driver", so PMC, right?

You propose adding function called amd_pmc_is_cpu_supported() which to me 
reads "is PMC supported on this CPU?" since you don't have anything else 
in the function name to quality a sub-feature that would be be tested for 
supported or not.

It begs a question, why probe doesn't always return error when PMC is not 
supported by the CPU? Can you see the problem now?

> STB is an on-demand debug
> feature and that can only be enabled when enable_stb module param is set.
> 
> The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
> (with the right PMFW support) supported is pre-Rembrandt, then Spill to
> DRAM is not supported. So reading the STB buffer is a different
> mechanism and that has been handled in the amd_pmc_stb_debugfs_fops().
> But the platforms after Rmebrandt, supports spilling to DRAM, and that
> has been handled in amd_pmc_stb_debugfs_fops_v2().

This kind of information should be stated the changelog up front.

So is that function testing support for Spill to DRAM? Clearly, 
Spill-to-DRAM != PMC, that's the second problem here related to function 
naming.

> What am I missing in your comments?
> 
> 
> > 
> > static int amd_pmc_probe(...)
> > {
> > 	...
> > 	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
> > 		err = amd_pmc_s2d_init(dev);
> > 		if (err)
> > 			...goto + returns error
> > 	}
> > 
> > 
> > If enable_stb is not set, pmc not being supported is not going to return 
> > error?
> > 
> > 
> 
> here we return only whne there is failure in s2d_init() - right?
> 
> And yes, if enable_stb is not set, there is no need to init the s2d path.

s2d is short for Spill to DRAM I guess?

So in both occassions amd_pmc_check_sup_cpuid() testing support for s2d 
rather than PMC (it certainly looks that way)? If so, name the function 
accordingly (I suggest amd_pmc_s2d_supported()) and put a little bit more 
explanation into the changelog and we're done here.


-- 
 i.

--8323329-721331926-1685011453=:1738--
