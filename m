Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80676C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 15:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240346AbiCDPeJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 10:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236638AbiCDPeJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 10:34:09 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C35AD1089;
        Fri,  4 Mar 2022 07:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646408001; x=1677944001;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AC+sn40Z+k5l1FB0jWe8IhHFK44Toly0dffZXkZtlDc=;
  b=YG81gtEtFW30ptRiO1qIfhu6nNkxzyvMgSbO/20Q+Mpm6sbVTr2pWxQ/
   kU68i6VoYG6aC73DLU/zf/tXju9xiBWqD3DoKwSxDfmDTdekp+Z+HcWXy
   yEHej7FqT9z66u/Sn6ejf5tgAd32ZYfPAGPg9Y6H4ZwJGP8NF9u4NQPLx
   QjrOwYVb7ltFbTS1OBxyxtjZw+hVqU+w5ygq+oXQGHpSwwDnH2nwlT6xM
   F/+hkMKb/rFntGXdXRouN4RvjOs3CvaqmlbcYutfWfTNF+SjL2//yi2ub
   AVkOpBjpuvGMObYNtcrA/RiDf6/g/AodjcnLV4Mc59B0jxJjGIhirE9lx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254189793"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="254189793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 07:33:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="552259505"
Received: from qiantong-mobl1.amr.corp.intel.com (HELO spandruv-desk1.amr.corp.intel.com) ([10.212.225.201])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 07:33:21 -0800
Message-ID: <d51cfdfb53e5aaf723c025d79d0422e75b75a814.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix
 uncore_freq_common_init() error codes
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Fri, 04 Mar 2022 07:33:12 -0800
In-Reply-To: <20220304131925.GG28739@kili>
References: <20220304131925.GG28739@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 2022-03-04 at 16:19 +0300, Dan Carpenter wrote:
> Currently the uncore_freq_common_init() return one on success and
> zero on failure.  There is only one caller and it has a "forgot to
> set
> the error code" bug.  Change uncore_freq_common_init() to return
> negative error codes which makes the code simpler and avoids this
> kind
> of bug in the future.
> 
> Fixes: dbce412a7733 ("platform/x86/intel-uncore-freq: Split common
> and enumeration part")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c        | 2
> +-
>  drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c  | 2
> +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.c b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.c
> index e4d5a7960234..84eabd6156bb 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> @@ -231,7 +231,7 @@ int uncore_freq_common_init(int
> (*read_control_freq)(struct uncore_data *data, u
>                 ++uncore_instance_count;
>         mutex_unlock(&uncore_lock);
>  
> -       return (!!uncore_root_kobj);
> +       return uncore_root_kobj ? 0 : -ENOMEM;
>  }
>  EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init,
> INTEL_UNCORE_FREQUENCY);
>  
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency.c
> index 791af0e287e4..c61f804dd44e 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -225,7 +225,7 @@ static int __init intel_uncore_init(void)
>  
>         ret = uncore_freq_common_init(uncore_read_control_freq,
> uncore_write_control_freq,
>                                       uncore_read_freq);
> -       if (!ret)
> +       if (ret)
>                 goto err_free;
>  
>         ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,

