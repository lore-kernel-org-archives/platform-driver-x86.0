Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C76EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 11:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjGKLNO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 07:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjGKLNN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 07:13:13 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFEE98
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 04:13:12 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363455247"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="363455247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 04:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="895134442"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="895134442"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2023 04:13:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qJBIr-001pJT-0s;
        Tue, 11 Jul 2023 14:13:09 +0300
Date:   Tue, 11 Jul 2023 14:13:09 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] platform/x86/amd: pmc: Use release_mem_region() to undo
 request_mem_region_muxed()
Message-ID: <ZK05ReBRqbrggq/C@smile.fi.intel.com>
References: <20230711095920.264308-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711095920.264308-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 11, 2023 at 11:59:20AM +0200, Hans de Goede wrote:
> Muxed (mem) regions will wait in request_mem_region_muxed() if the region
> is busy (in use by another consumer) during the call.
> 
> In order to wake-up possibly waiting other consumers of the region,
> it must be released by a release_mem_region() call, which will actually
> wake up any waiters.
> 
> release_mem_region() also frees the resource created by
> request_mem_region_muxed(), avoiding the need for the unmatched kfree().

Seems reasonable to me.
Do we need to have a Fixes tag?
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Mario, can you ask one of the reporters with a machine which needs the quirk
> to test this ?
> ---
>  drivers/platform/x86/amd/pmc-quirks.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc-quirks.c
> index 362e7c0097d7..ad702463a65d 100644
> --- a/drivers/platform/x86/amd/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc-quirks.c
> @@ -11,7 +11,6 @@
>  #include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> -#include <linux/slab.h>
>  
>  #include "pmc.h"
>  
> @@ -135,12 +134,10 @@ static const struct dmi_system_id fwbug_list[] = {
>   */
>  static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>  {
> -	struct resource *res;
>  	void __iomem *addr;
>  	u8 val;
>  
> -	res = request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80");
> -	if (!res)
> +	if (!request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80"))
>  		return;
>  
>  	addr = ioremap(s2idle_bug_mmio, 1);
> @@ -152,8 +149,7 @@ static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
>  
>  	iounmap(addr);
>  cleanup_resource:
> -	release_resource(res);
> -	kfree(res);
> +	release_mem_region(s2idle_bug_mmio, 1);
>  }
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
> -- 
> 2.41.0
> 

-- 
With Best Regards,
Andy Shevchenko


