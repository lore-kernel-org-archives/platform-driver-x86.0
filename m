Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B396EC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Jun 2022 01:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbiFBBgq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Jun 2022 21:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbiFBBgq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Jun 2022 21:36:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0461E1DE
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jun 2022 18:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654133804; x=1685669804;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=21GT1OsXHLX3oChV6MkepquESEqv62tPRDiyYdDi/hY=;
  b=iE12Z4z7ApQVJuDWNMbAb+jmjNguOIzxYwXLjHLmHYFt2P9VNv0ld93F
   gCJzSJV+V3o4sr+EXlFbFvBexRTO5nOLkjBcyBjwubuplKa78q0wPtbM8
   TtYRVOomQFauaKGQQonLUp17Pe9+01Gc9zh1cskKiZggD3Vi3TRT5NODD
   POuwTWZCn2p2r3lOHVZ0ntTqmO03Ilvm17yxWm8PBOUlGEeWZCXtujDw1
   bR+MjXYd8jjx+n9qA0azBsAjSosKHfUeL85hWaw/eFX6Le19dFM0DIOHr
   0Xa+1/OwGTJqNTq8FZvj9gYT2YW+sRSUG3jS3BgG/tIxDVB2dBkp6pxEI
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275513199"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="275513199"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 18:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="612590101"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2022 18:36:43 -0700
Received: from alwinma-MOBL2.amr.corp.intel.com (unknown [10.209.123.116])
        by linux.intel.com (Postfix) with ESMTP id 727EC580378;
        Wed,  1 Jun 2022 18:36:43 -0700 (PDT)
Message-ID: <e66d266554132a94d2290edba52039ad257b7add.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel: pmc: Support Intel Raptorlake P
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     george.d.sworo@intel.com, david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org
Date:   Wed, 01 Jun 2022 18:36:43 -0700
In-Reply-To: <20220602012617.20100-1-george.d.sworo@intel.com>
References: <20220602012617.20100-1-george.d.sworo@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 2022-06-01 at 18:26 -0700, george.d.sworo@intel.com wrote:
> From: George D Sworo <george.d.sworo@intel.com>
> 
> Add Raptorlake P to the list of the platforms that intel_pmc_core driver
> supports for pmc_core device. Raptorlake P PCH is based on Alderlake P
> PCH.
> 
> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c
> b/drivers/platform/x86/intel/pmc/core.c
> index edaf22e5ae98..40183bda7894 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1912,6 +1912,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
>  	{}
>  };
>  

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

Thanks

