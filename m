Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C762C00140
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Aug 2022 22:48:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243121AbiHRWsA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Aug 2022 18:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239270AbiHRWr7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Aug 2022 18:47:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256D2D21E5
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2022 15:47:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7395761713
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2022 22:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C832C433D6;
        Thu, 18 Aug 2022 22:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660862876;
        bh=4xLrzJT+0OJbxEwjAhIOtKSTYFq3Rbx2yNrXJxhtCNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tLZBF8B4RXR3jLRTMZANn2UtYV4KuHUBGWQYPwcb5RfxSoMX1Rmiz0fCf4xb3sEbs
         oEqAKnim1WsmyiAXzys537CjY3cmODb8LuzWhnlEyKD6qybhhsHJzn/sArtTIKnIEH
         T68I7wz22AscY9Fbr7c5NHvI31nDjteDi6M+X7TEOQkP01nyCin9CEYxuT7T93EzWZ
         FRXbSLI070FcsKa+yyCTNspY+ZyOKY0l8LToMGDOdna8Xu4KjPH7v50Ewtl+AGsgO8
         o2bIGc4LDJ7G/jEvE9BKDU0YoQ7agQBBA1BEX+uZsuq3tNwAehwIWfkGbh3zeqNBt/
         +Wsn7Ufli9+Ig==
Date:   Thu, 18 Aug 2022 15:47:54 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        llvm@lists.linux.dev
Subject: Re: [PATCH v4 03/11] platform/x86/amd/pmf: Add support SPS PMF
 feature
Message-ID: <Yv7BmjjLtA3RaKju@thelio-3990X>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802151149.2123699-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On Tue, Aug 02, 2022 at 08:41:41PM +0530, Shyam Sundar S K wrote:
> SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
> power slider for the Linux users, where the user selects a certain
> mode (like "balanced", "low-power" or "performance") and the thermals
> associated with each selected mode gets applied from the silicon
> side via the mailboxes defined through PMFW.
> 
> PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
> see if the support is being advertised by ACPI interface.
> 
> If supported, the PMF driver reacts to platform_profile selection choices
> made by the user and adjust the system thermal behavior.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

<snip>

> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> new file mode 100644
> index 000000000000..ef4df3fd774b
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/sps.c

<snip>

> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
> +{
> +	u8 mode;
> +
> +	switch (pmf->current_profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		mode = POWER_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode = POWER_MODE_BALANCED_POWER;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode = POWER_MODE_POWER_SAVER;
> +		break;
> +	default:
> +		dev_err(pmf->dev, "Unknown Platform Profile.\n");
> +		break;
> +	}
> +
> +	return mode;
> +}

This patch is now in -next as commit 4c71ae414474
("platform/x86/amd/pmf: Add support SPS PMF feature"), where it causes
the following clang warning:

  drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
          return mode;
                 ^~~~
  drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
          u8 mode;
                 ^
                  = '\0'
  1 error generated.

As far as I can tell, the default case cannot actually happen due to the
advertising of choices in amd_pmf_init_sps() and the check against those
choices in platform_profile_store() but it would be good to avoid this
warning, especially given that it is fatal with CONFIG_WERROR.

I do not mind sending a patch for this but I am a little unclear what
the best fix would be. Removing the default case would cause -Wswitch
warnings because current_profile is an enum (plus it would make finding
invalid profiles harder if there was ever a change in the core). Perhaps
changing the return type to be an int, returning an error code in the
default case, then updating the call sites to check for an error? I am
open to other suggestions (or if you want to sent a fix yourself, just
consider this a report).

Cheers,
Nathan
