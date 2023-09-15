Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56065EED619
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Sep 2023 17:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjIORBX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Sep 2023 13:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235238AbjIORAw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Sep 2023 13:00:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F5F270A;
        Fri, 15 Sep 2023 10:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694797206; x=1726333206;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TkyxTjmo4j+T1tGFjWBvv1CU6NTsv9h5dOWGiYDUv3o=;
  b=AJg4kdsQOnfgtnFJDvI0mVWiLzgQTv4sNaH8D/YoLr0wE7LOnD+kSBc9
   RnAURQuoowIbVU0cYf97jytmXAjSXMOtDZq+IJ8Vij1MvKdnWXe5r9ori
   inQDJRIEKHsiHR07AcOINwEbcqCOTPjWlE2heMJG/UmQZJiLWrDG1aX1r
   0oSGjRad7SBUuu5MuY1HvDNz3CirxldC4QVdekF5RPIbjqdP0Nm1wu/qa
   3b8LV3KXDu7PhJh3RPGxDj5ATpD2NezexFEQc5o3mHPAuXrDaUHtqnSo7
   jsBSrrZyGGq1dfD1N3z+gAnpwOUn40kE3HMRk0gF8nydjFejEhyl4Vpi5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378208052"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="378208052"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 10:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="835268158"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="835268158"
Received: from srdoo-mobl1.ger.corp.intel.com ([10.252.38.99])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 10:00:01 -0700
Date:   Fri, 15 Sep 2023 19:59:59 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Jithu Joseph <jithu.joseph@intel.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        pengfei.xu@intel.com
Subject: Re: [PATCH 07/10] platform/x86/intel/ifs: Metadata validation for
 start_chunk
In-Reply-To: <20230913183348.1349409-8-jithu.joseph@intel.com>
Message-ID: <3dc5207d-37b7-52fe-954-889d5456192d@linux.intel.com>
References: <20230913183348.1349409-1-jithu.joseph@intel.com> <20230913183348.1349409-8-jithu.joseph@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 13 Sep 2023, Jithu Joseph wrote:

> Add an additional check to validate IFS image metadata field
> prior to loading the test image.
> 
> If start_chunk is not a multiple of chunks_per_stride error out.
> 
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>  drivers/platform/x86/intel/ifs/load.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index 778a3b89a24d..88630366a23c 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -292,6 +292,13 @@ static int validate_ifs_metadata(struct device *dev)
>  		return ret;
>  	}
>  
> +	if (ifs_meta->chunks_per_stride &&
> +	    (ifs_meta->starting_chunk % ifs_meta->chunks_per_stride)) {

While this is not incorrect, it would make the code easier to understand 
if you add != 0.

> +		dev_warn(dev, "Starting chunk num %d not a multiple of chunks_per_stride %d\n",
> +			 ifs_meta->starting_chunk, ifs_meta->chunks_per_stride);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> 

-- 
 i.

