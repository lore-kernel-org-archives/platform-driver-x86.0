Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11A2C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 11:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CAE7611C9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 11:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239160AbhHYLDl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 07:03:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:57546 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237584AbhHYLDl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 07:03:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217220823"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="217220823"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 04:02:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="516067135"
Received: from vsharm4-mobl.gar.corp.intel.com ([10.213.67.41])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 04:02:52 -0700
Message-ID: <805eaf49531f38c28f0caf12cc9d0afafd98f7a5.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: use semi-colons instead of commas
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Wed, 25 Aug 2021 04:02:48 -0700
In-Reply-To: <20210825072357.GA12957@kili>
References: <20210825072357.GA12957@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 2021-08-25 at 10:23 +0300, Dan Carpenter wrote:
> The code works the same either way, but it's better to use semi-
> colons
> to separate statements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git
> a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> index 8a4d52a9028d..c9a85eb2e860 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> @@ -265,9 +265,9 @@ static int isst_if_get_platform_info(void __user
> *argp)
>  {
>         struct isst_if_platform_info info;
>  
> -       info.api_version = ISST_IF_API_VERSION,
> -       info.driver_version = ISST_IF_DRIVER_VERSION,
> -       info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT,
> +       info.api_version = ISST_IF_API_VERSION;
> +       info.driver_version = ISST_IF_DRIVER_VERSION;
> +       info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT;
>         info.mbox_supported =
> punit_callbacks[ISST_IF_DEV_MBOX].registered;
>         info.mmio_supported =
> punit_callbacks[ISST_IF_DEV_MMIO].registered;
>  


