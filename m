Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06A6C54E76
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 08:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjKTID1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 03:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjKTID0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 03:03:26 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B60BC0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 00:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700467403; x=1732003403;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=0SqRL0VegtYZlKqTsjA1tKidVnwi0IJRMCUIZUqHCE0=;
  b=mOfMuAU3+u4yJZydN5pjg3mqW4Hm/tksdbjRYkJolJ0nA6JH45J1dYON
   YhoMJDKHQIIYx+NB+Ylxd6oWWFuui6sErg3oW76T2l2K/hPJPXUzBknt8
   yM1N4nfIkrNqji5fC4lqPuyUCYlG2tYwuxBbmiuAtBNXXJ5YhgAtGxfd9
   UN06iLlv3dSp5D3p9xZ5i8oZN68/XjV9tcGdwnbEkg73OD7YYXdbXp1D8
   vD3zwbzpZ8w7c+oH59Aw+Z97wMtOGBEY7bGYKEX5gGvoU1goG4gjg+ZFj
   5S7Ble6qUbjwOSQpEmFyk7YAULZ0Vab68A48cis8onCYjfMgH7iCmnVnY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="391356313"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="391356313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 00:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889849243"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="889849243"
Received: from akeren-mobl.ger.corp.intel.com ([10.252.40.26])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 00:03:19 -0800
Date:   Mon, 20 Nov 2023 10:03:13 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
Subject: Re: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
In-Reply-To: <1405ce97-f1c4-4c56-abff-385554f9efe9@amd.com>
Message-ID: <d5b83819-8384-1acf-cd1c-1a52ba982939@linux.intel.com>
References: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com> <282b53e9-8247-a4cc-307c-7d4f1a924683@linux.intel.com> <1405ce97-f1c4-4c56-abff-385554f9efe9@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-592770997-1700466800=:2032"
Content-ID: <ba61c1f1-4f28-fa24-e032-3e63b6583383@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-592770997-1700466800=:2032
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <744dd62f-e5ff-6843-febc-f991e3c7db9d@linux.intel.com>

On Mon, 20 Nov 2023, Shyam Sundar S K wrote:
> On 11/17/2023 3:41 PM, Ilpo Järvinen wrote:
> > On Thu, 16 Nov 2023, Shyam Sundar S K wrote:
> > 
> >> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> >> the current code, mailbox command to get the DRAM size info is sent based
> >> on the values of dev->major and dev->minor.
> >>
> >> But dev->major and dev->minor will have either junk or zero assigned to
> >> them until at least once a call to amd_pmc_get_smu_version() is made which
> >> ideally populates dev->major and dev->minor.
> >>
> >> Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
> >> amd_pmc_get_dram_size() would solve, but that has a downside of elevating
> >> the boot times.
> >>
> >> After talking to the PMFW team, its understood that the "get dram size"
> >> mbox command would only be supported on specific platforms (like Mendocino)
> >> and not all. So, adjust getting DRAM size behavior such that,
> >>
> >> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> >> to execute the "get dram size" command it shall give the custom dram size.
> >>
> >> - if the underlying FW does not report the dram size, we just proceed
> >> further and assign the default dram size.
> >>
> >> Simplest way to address this is to remove amd_pmc_get_dram_size() function
> >> and directly call the "get dram size" command in the amd_pmc_s2d_init().
> >>
> >> Reported-by: Mark Hasemeyer <markhas@chromium.org>
> >> Closes: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> >> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> >> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> v4:
> >> - Based on review-ilpo branch (tip commit: 94ace9eda882)
> >> - Add Mark as "Reported-by:"
> >> - Add more commit log notes.
> > 
> > Thank, applied now to review-ilpo branch. I had to reflow your commit 
> > message because the lines were too long (try to remain within 72 
> > characters in the future). I also made other minor adjustments to the 
> > commit message.
> 
> Thank you for the rewords :-)
> 
> on the commit message part, you prefer 72 or 75 characters?
> Because I did use, checkpatch with "--strict" and did not find it
> complaining.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?h=v6.7-rc2#n3275

I'd have said 72 characters but since you now pointed out checkpatch seems 
to have only a slightly higher limit we can go along with that 75 
characters. I think that 72 char limit is derived from 80-2*4 (4 char wide 
margins on both sides on 80 char wide terminal). Be aware though some 
other maintainers do require 72 chars.

And obviously for URLs (or other stuff) that should be kept on a single 
line, you have the license to break that limit even if checkpatch would 
complain but I guess you knew that :-).

-- 
 i.
--8323329-592770997-1700466800=:2032--
