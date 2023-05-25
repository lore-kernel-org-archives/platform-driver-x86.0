Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F17C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjEYL6h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240649AbjEYL6P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:58:15 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FAC9C
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685015894; x=1716551894;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Kbrz+cld/+oedLHKkygbf6h9aTHM3LtVnqymOn9h3xM=;
  b=RXHvoxKoNh32275aWwXWRsZAWWCw7pLcWaVULC3C6WjfydFOUkfWj95g
   bKqN2NIt02ea07umeap/quLvWVT/tbsl/0GrT5SSDpIZVHrtbBFU9spoC
   ARja7ccCmdIkGabCHHfD32M3kqRqtEj8DEeJifUAIXtQrqK4eUUGBk3JR
   qq1wRieeDpQlGf2V+THd5LetxsJ/HHiX5237KHYAlyWb2QCWDVxGqHV8v
   HnXvKvtW/SCT6m0o3dsNlZfsSZkntiLWmjpq2hIRFKsrVa44AoAiKW4Vm
   ZT1vpkjrvyj0gT/H7E14HhZCtIGLg6HyB1sLxPPOFs/+KUZdvvB5yL7G4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343337569"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="scan'208";a="343337569"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 04:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="794617998"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="scan'208";a="794617998"
Received: from aghiriba-mobl.ger.corp.intel.com ([10.249.40.17])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 04:58:11 -0700
Date:   Thu, 25 May 2023 14:58:09 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
In-Reply-To: <f929738d-a46c-2298-d552-4ff6d5e2eeb1@amd.com>
Message-ID: <82b55d8f-f3ca-a2d-5e57-5610d94812c@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com> <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com> <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com> <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
 <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com> <4651d798-886-9144-7bac-4a87d73fd48@linux.intel.com> <f929738d-a46c-2298-d552-4ff6d5e2eeb1@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-100326301-1685014768=:1738"
Content-ID: <c9d9c2ec-d669-6e8c-c7fd-7f918acef5f@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-100326301-1685014768=:1738
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <2ff394a-1145-f0e3-d939-807f8a2def53@linux.intel.com>

On Thu, 25 May 2023, Shyam Sundar S K wrote:
> On 5/25/2023 4:14 PM, Ilpo Järvinen wrote:
> > On Thu, 25 May 2023, Shyam Sundar S K wrote:
> >> On 5/25/2023 3:29 PM, Ilpo Järvinen wrote:
> >>> On Thu, 25 May 2023, Shyam Sundar S K wrote:
> >>>> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
> >>>>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
> >>>>>
> >>>>>> Add a helper routine to check the underlying cpu id, that can be used
> >>>>>> across the PMC driver to remove the duplicate code.
> >>>>>>
> >>>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>>>> ---
> >>>>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
> >>>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> >>>>>> index e2439fda5c02..7e5e6afb3410 100644
> >>>>>> --- a/drivers/platform/x86/amd/pmc.c
> >>>>>> +++ b/drivers/platform/x86/amd/pmc.c
> >>>>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> >>>>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
> >>>>>>  }
> >>>>>>  
> >>>>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
> >>>>>
> >>>>> Does sup refer to "supported" or some other acronym? If the latter,
> >>>>
> >>>> Yes, please read that as "supported"
> >>>>
> >>>>> you should mention/open it in the changelog and/or in a comment. If the 
> >>>>> former, the function naming seems too generic (an observation entirely 
> >>>>> based on how/where the function is used, you're not exactly verbose on 
> >>>>> what this actually checks for other than what looks like a set of CPU 
> >>>>> IDs but clearly there's more behind it).
> >>>>
> >>>> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?
> >>>
> >>> This makes things odder, it gets used in two places:
> >>>
> >>> 	if (enable_stb) {
> >>> 		if (amd_pmc_check_sup_cpuid(dev))
> >>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
> >>> 		else
> >>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
> >>> 	}
> >>>
> >>> What about that else branch (PMC is not supported so who does that make 
> >>> sense when the file is called pmc.c)? And here:
> >>
> >> I did not understand the actual concern.
> > 
> > The file is cammed pmc.c and states "AMD SoC Power Management Controller 
> > Driver", so PMC, right?
> 
> Yes.
> 
> > 
> > You propose adding function called amd_pmc_is_cpu_supported() which to me 
> > reads "is PMC supported on this CPU?" since you don't have anything else 
> > in the function name to quality a sub-feature that would be be tested for 
> > supported or not.
> 
> The function naming convention across this file is amd_pmc_*. So would
> like to have it as "amd_pmc_is_cpu_supported()". And yes, this should be
> generic helper function that should be used across the PMC and STB
> functions interchangeably, as the underlying CPU where it runs remains
> the same.

Okay, so I read this as stating that its testing for a larger set of 
features than what can be read from the code.

> > It begs a question, why probe doesn't always return error when PMC is not 
> > supported by the CPU? Can you see the problem now?
> 
> PMC driver probe happens based on the _HID amd_pmc_acpi_ids[] and probe
> failures are handled.
> 
> The only intention to look for CPU ID's through the PCI root port is
> handle the Firmware changes across CPU generations.
>
> Hope this clears the question.
> 
> > 
> >> STB is an on-demand debug
> >> feature and that can only be enabled when enable_stb module param is set.
> >>
> >> The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
> >> (with the right PMFW support) supported is pre-Rembrandt, then Spill to
> >> DRAM is not supported. So reading the STB buffer is a different
> >> mechanism and that has been handled in the amd_pmc_stb_debugfs_fops().
> >> But the platforms after Rmebrandt, supports spilling to DRAM, and that
> >> has been handled in amd_pmc_stb_debugfs_fops_v2().
> > 
> > This kind of information should be stated the changelog up front.
> 
> I don't think I am touching that part of the code to explain this stuff
> in the changelog.
> 
> Let us purely keep this as a helper function to check the underlying CPU
> that can be used across the entire pmc.c file. Makes sense?
> 
> > 
> > So is that function testing support for Spill to DRAM? Clearly, 
> > Spill-to-DRAM != PMC, that's the second problem here related to function 
> > naming.
> 
> PMC driver is a FW assisted driver for S2Idle path on AMD platforms. But
> for whatever reason if the Supend/resume fails to happen, we need to
> have a debug mechanims to address the field issues.
> 
> Since it's FW assisted, the FW also provides a way to know what happened
> behind the scenes and that debug mechanism is called STB (Smart Trace
> Buffer).
> 
> Intially when we started the STB was supposed to be a small interface
> and it has evolved a lot over time. And maybe at times you will see that
> PMC and STB are used in conjunction.
> 
> If its becoming confusing for the community, maybe I will come up with a
> way to decouple PMC and STB sometime soon.
> 
> Thoughts?

This kinda digressed and didn't answer my question at all (you mentioned 
Spill to DRAM zero times in your reply but went to something called STB). 
But it could just that I'm not familiar enough with all the details here.

My question boiled down to if this (your own words) is true or not:

"The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
(with the right PMFW support) supported is pre-Rembrandt, then Spill 
to DRAM is not supported. ... But the platforms after Rmebrandt, supports 
spilling to DRAM, ..."

If the code is solely used for testing whether Spill to DRAM is supported 
or not, it feels odd to name it something more generic than that. But 
given what you said above, I guess the answer here is that it can be used 
to test Spill to DRAM among other things, and this particular patch 
just doesn't do those other things so it looks odd but is okay still.
Is that the correct interpretation here?

> >>> static int amd_pmc_probe(...)
> >>> {
> >>> 	...
> >>> 	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
> >>> 		err = amd_pmc_s2d_init(dev);
> >>> 		if (err)
> >>> 			...goto + returns error
> >>> 	}
> >>>
> >>>
> >>> If enable_stb is not set, pmc not being supported is not going to return 
> >>> error?
> >>>
> >>>
> >>
> >> here we return only whne there is failure in s2d_init() - right?
> >>
> >> And yes, if enable_stb is not set, there is no need to init the s2d path.
> > 
> > s2d is short for Spill to DRAM I guess?
> 
> Yes.
> 
> > 
> > So in both occassions amd_pmc_check_sup_cpuid() testing support for s2d 
> > rather than PMC (it certainly looks that way)? If so, name the function 
> > accordingly (I suggest amd_pmc_s2d_supported()) and put a little bit more 
> > explanation into the changelog and we're done here.
> > 
> > 
> 
> IMHO. Based on the above details, amd_pmc_is_cpu_supported() should be
> generic name. Do you still see a concern?

Given you seem to be certain there's no error or some detail missing, I 
won't object it being the way you want to put it.


-- 
 i.
--8323329-100326301-1685014768=:1738--
