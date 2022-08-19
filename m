Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F31C32771
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 21:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbiHSVqq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiHSVqn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 17:46:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24ED109A0B
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 14:46:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49119B82964
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 21:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924EFC433D7;
        Fri, 19 Aug 2022 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945599;
        bh=Ui0S4mtdVjywSkJgdIpWR2/qLcfYesVdDI1yPwEcS+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uMvXIU20/Z0zAjAhtpuV9KjbhYUT+hGI5JzJUNrRgNcR1wgAhc29/FOQLi0/a6wAo
         0GUA4mbF/3InuHy8tFyU+i5TAea6rslBjEciWLzcP3Vb1CP5KIHNgjJCdWOlJXiQIS
         iDfiTkCn5EBQqhH1bpFRj9Icuz2iXZkxnsPrMvMTo1n0Cb4gxK+L/e9pavy0c9KmIO
         dJjWkGC9myndww9o39kDKi/oz5TAcxx3VwGEUERp33RR/SndPpmfOGVthfml/lLU3u
         OJNo1zygAZsfbl/ibyCWpzWs777MIUFf6pHILOgdzXn2AtxnONgIiv6R37kKFmPpAD
         7HLg80mQPxB5w==
Date:   Fri, 19 Aug 2022 14:46:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix clang unused variable warning
Message-ID: <YwAEvbHW/UwwIYbt@dev-arch.thelio-3990X>
References: <20220819174559.4029855-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819174559.4029855-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On Fri, Aug 19, 2022 at 11:15:58PM +0530, Shyam Sundar S K wrote:
> variable 'mode' is used uninitialized whenever switch default is taken
> in sps.c which leads to the following clang warning.
> 
> ---
> drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
>           return mode;
>                  ^~~~
>   drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
>           u8 mode;
>                  ^
>                   = '\0'
>   1 error generated.
> ---
> 
> Fix it by returning -EOPNOTSUPP in default case and also change the return
> type of the function amd_pmf_get_pprof_modes() to keep it similar like
> other drivers which implement platform_profile.
> 
> Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h |  2 +-
>  drivers/platform/x86/amd/pmf/sps.c | 11 +++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 7613ed2ef6e3..172610f93bd1 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  
>  /* SPS Layer */
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>  			   struct amd_pmf_static_slider_granular *table);
>  int amd_pmf_init_sps(struct amd_pmf_dev *dev);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 8923e29cc6ca..dba7e36962dc 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  {
> -	u8 mode;
> +	int mode;
>  
>  	switch (pmf->current_profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> @@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  		break;
>  	default:
>  		dev_err(pmf->dev, "Unknown Platform Profile.\n");
> -		break;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	return mode;
> @@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
>  			       enum platform_profile_option profile)
>  {
>  	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
> -	u8 mode;
> +	int mode;
>  
>  	pmf->current_profile = profile;
>  	mode = amd_pmf_get_pprof_modes(pmf);

I see a few other places where amd_pmf_get_pprof_modes() is called.
Should they be updated in this same way to handle a negative return
code?

Regardless, the change is what I envisioned so looks good to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

> +	if (mode < 0)
> +		return mode;
> +
>  	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
>  	return 0;
>  }
> -- 
> 2.25.1
> 
