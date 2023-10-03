Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B1BE75458
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Oct 2023 13:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbjJCNKX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Oct 2023 09:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjJCNKW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2023 09:10:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2AFA1;
        Tue,  3 Oct 2023 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696338619; x=1727874619;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sJ1wI9sackoBCbiYI9JY9yIefb7w0Ym5PLbqs6h94l4=;
  b=BLDXq5/5o4BlzUq98EPtD0VtloKIGfQY+0IVivbGuqDaNhUZ4x7LuRFU
   ydZqerJfeeE5CaxZjlBxk3G673v8+EL5fYoZKxOXRPY88XYu5rUqNws5Z
   53RsKyWX7E/oHMn2OS5Dn2++c57oV4+MqynRYC9/Xu9j6pHVJKNaWJwcC
   mmOSGYaC0LpzlZsr4CIkkLztk9mnGZyJqUfhXYtqhxiT2N6fXXZ4voZwT
   QWiw/KDh9wrTW8cAQ0sdsHjoL/+5MZbkBpGgCp3lwfwLwt7y6BfvicTqZ
   rA+jrIlJ1G1jAybn/Isqod3V/GMDUmlIEOHv5Z3QAFkC8BVnFgkUnOrVp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447027709"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="447027709"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 06:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998018510"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="998018510"
Received: from tciutacu-mobl.ger.corp.intel.com ([10.252.40.114])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 06:10:15 -0700
Date:   Tue, 3 Oct 2023 16:10:13 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [UPDATE][PATCH] platform/x86/intel-uncore-freq: Conditionally
 create attribute for read frequency
In-Reply-To: <20231002131817.1590966-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <6c59be5-1ff1-d0b1-5960-3789fe10c692@linux.intel.com>
References: <20231002131817.1590966-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2 Oct 2023, Srinivas Pandruvada wrote:

> When the current uncore frequency can't be read, don't create attribute
> "current_freq_khz" as any read will fail later. Some user space
> applications like turbostat fail to continue with the failure. So, check
> error during attribute creation.
> 
> Fixes: 8a54e2253e4c ("platform/x86/intel-uncore-freq: Uncore frequency control via TPMI")

Hi,

Thanks for the update but that commit id looks bogus, or where the value 
is used w/o error check?

-- 
 i.


> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> update
> - Added Fixes tag
> 
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 1152deaa0078..33ab207493e3 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -176,7 +176,7 @@ show_uncore_data(initial_max_freq_khz);
>  
>  static int create_attr_group(struct uncore_data *data, char *name)
>  {
> -	int ret, index = 0;
> +	int ret, freq, index = 0;
>  
>  	init_attribute_rw(max_freq_khz);
>  	init_attribute_rw(min_freq_khz);
> @@ -197,7 +197,11 @@ static int create_attr_group(struct uncore_data *data, char *name)
>  	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
>  	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
>  	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
> -	data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
> +
> +	ret = uncore_read_freq(data, &freq);
> +	if (!ret)
> +		data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
> +
>  	data->uncore_attrs[index] = NULL;
>  
>  	data->uncore_attr_group.name = name;
> 
