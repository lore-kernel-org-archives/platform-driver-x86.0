Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3911CD5BB3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 13:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjISNBI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 09:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjISNBI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 09:01:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD41F3
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695128462; x=1726664462;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7O/sCcLgHq0OwUBWqwdTe+pMG4igeuLJhHld2qGMak4=;
  b=FsicUfstVk/PqaTyc2jQLhPoFRIjth1qvE2c0sDKZLUogAkvuY/PAT8L
   qrXd9t++getCTQs2k9zq1JaO1uBBlR/KSEb8CKGFdeAy0tFTSpuUE79pp
   VkEooXJEVkmuCo7g1p0adJIcSBIQvjKTwuTYoOMK3FocRNK6lURR8o3/8
   ru1aERscKbuFpqSHDUai4ZgNSOp/CTVlWhGADE3GKvv80lctW3P+Vdg5F
   VH4OOfvH7w7MNnwtxsHP2Fmz0q9suCqsOxNoVPqbCqWHTJYkZs6nfjQd7
   Yo3IL7o3badQX92RUxHVFOMZRUCqwEuWHSf2Ia6SkPVsw+hSknl6uVzFG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377243664"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="377243664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695888918"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="695888918"
Received: from laichele-mobl1.ger.corp.intel.com ([10.252.38.7])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:00:59 -0700
Date:   Tue, 19 Sep 2023 16:00:58 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 3/3] platform/x86/amd/hsmp: improve the error log
In-Reply-To: <20230919092057.2235437-3-suma.hegde@amd.com>
Message-ID: <5264812-64d7-a55d-90af-b92ebf566f7d@linux.intel.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com> <20230919092057.2235437-3-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-15690796-1695128462=:22803"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-15690796-1695128462=:22803
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 19 Sep 2023, Suma Hegde wrote:

> 1. Change print message during platform init to a more meaningful
>    clear message.
> 2. Return the error code returned by hsmp_test() itself, rather then
>    returning a common EOPNOTSUPP error.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v1:
> 1. changed commit message
> Changes since v2:
> No change
> 
>  drivers/platform/x86/amd/hsmp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index fc6fba18844e..c4d324436a40 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -568,10 +568,10 @@ static int __init hsmp_plt_init(void)
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {
> -			pr_err("HSMP is not supported on Fam:%x model:%x\n",
> +			pr_err("HSMP test message failed on Fam:%x model:%x\n",
>  			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Or Is HSMP disabled in BIOS ?\n");
> -			return -EOPNOTSUPP;
> +			pr_err("Is HSMP disabled in BIOS ?\n");
> +			return ret;
>  		}
>  	}
>  
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-15690796-1695128462=:22803--
