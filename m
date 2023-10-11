Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED4ECD6E64
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 13:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjJKNAi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 09:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbjJKNAi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 09:00:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA39D93
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697029237; x=1728565237;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b0zvwvukaGTMomUOdMr+F++Rg7WgHCFWKMdJJtr4Bv0=;
  b=I7Djk026HVsFmVJnhzNC9GyeXVqWRYsQZvNEAHoj+OiztgUqCrV+Fvc7
   65mtcUJQY7ZX6jW3XfZnJcPg+VBIdDeJtFe8cGD8LZLbdB+CPDhk3uK9r
   E0fnzShbG2tf64jpBTnqTqkW4+//mmbObyvVnZc/D8hBCNoEz4PN1EpZp
   3TR0vVYpUvgYtmiJjxkwHFsSghT4lm5fDZFGRUoM/sGOBw5ke8lG3Kwaj
   JSVOKztSEjoARadYMpYax9SxbG/OlB/InFtB1uGd3llSGu3mw/sYEcQ6j
   UkgZ5lZxji5D0yZH76GbJRmQl4l4e77JQTpcFG+C3Ig75hn3dld2tM/xF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3243402"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="3243402"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819687585"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="819687585"
Received: from opipikin-mobl2.ger.corp.intel.com ([10.252.57.154])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 06:00:34 -0700
Date:   Wed, 11 Oct 2023 16:00:32 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 1/5] platform/x86: msi-ec: Register a platform driver
In-Reply-To: <20231010172037.611063-5-teackot@gmail.com>
Message-ID: <24cc4f6c-f94a-6d66-2476-da317c5b63a4@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-5-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Nikita Kravets wrote:

> Register a platform driver for the future features.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 44 +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f26a3121092f..12c559c9eac4 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -818,6 +818,30 @@ static struct acpi_battery_hook battery_hook = {
>  	.name = MSI_EC_DRIVER_NAME,
>  };
>  
> +/*
> + * Sysfs platform driver
> + */
> +
> +static int msi_platform_probe(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static int msi_platform_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

No need to provide empty .probe() or .remove().

> +static struct platform_device *msi_platform_device;
> +
> +static struct platform_driver msi_platform_driver = {
> +	.driver = {
> +		.name = MSI_EC_DRIVER_NAME,
> +	},
> +	.probe = msi_platform_probe,
> +	.remove = msi_platform_remove,
> +};
> +
>  /*
>   * Module load/unload
>   */
> @@ -878,6 +902,23 @@ static int __init msi_ec_init(void)
>  	if (result < 0)
>  		return result;
>  
> +	result = platform_driver_register(&msi_platform_driver);
> +	if (result < 0)
> +		return result;
> +
> +	msi_platform_device = platform_device_alloc(MSI_EC_DRIVER_NAME, -1);
> +	if (msi_platform_device == NULL) {
> +		platform_driver_unregister(&msi_platform_driver);
> +		return -ENOMEM;
> +	}
> +
> +	result = platform_device_add(msi_platform_device);
> +	if (result < 0) {
> +		platform_device_del(msi_platform_device);
> +		platform_driver_unregister(&msi_platform_driver);
> +		return result;

Instead of duplicating error handling, make a proper rollback with goto 
and labels, or better yet, use the cleanup.h if you know how it works.

> +	}
> +
>  	battery_hook_register(&battery_hook);
>  	return 0;
>  }
> @@ -885,6 +926,9 @@ static int __init msi_ec_init(void)
>  static void __exit msi_ec_exit(void)
>  {
>  	battery_hook_unregister(&battery_hook);
> +
> +	platform_driver_unregister(&msi_platform_driver);
> +	platform_device_del(msi_platform_device);
>  }
>  
>  MODULE_LICENSE("GPL");
> 

-- 
 i.

