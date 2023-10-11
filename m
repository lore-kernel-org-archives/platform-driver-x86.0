Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D16CD6E66
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 12:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjJKMq5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 08:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbjJKMq4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 08:46:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F00A4
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697028415; x=1728564415;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=c/DQCDLu3S6Vki3zFy33fz2/HD0mc3H0sKJWYhWoM84=;
  b=i9KjZW5/D0gB/sQwDpVN87VSOPIud2l9rxX/jDXYvONcMccSCmHJqv0N
   dXAcbBaLkzObprLJ+dNJ6ctqjB5FCpAzXLzODPe94RpnhgIPyDdQqkf1w
   sK/JJB9IkVH1LKDvF9HWhRQWkDzUjazdPSnuV5XW0cgCZC1KWI+oCHqJs
   OMz2ExhFWjLgke9bqR6UVbWXfsFXnSYvf91v40/C4jTlwoV7aUKnfm6ZC
   JMIK0254+p/hNqTuE/4WZ2+x/cTj31eqCElJrh7KjTxaH4cb5TZs0W1NR
   yttPinfhTg6aX8NLY2Dk+aADU26I6Y5pf3t1DRicdFTwDBbIqujLQKqZP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369716496"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="369716496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757553767"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="757553767"
Received: from opipikin-mobl2.ger.corp.intel.com ([10.252.57.154])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:46:52 -0700
Date:   Wed, 11 Oct 2023 15:46:50 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 3/5] platform/x86: msi-ec: Filter out unsupported
 attributes
In-Reply-To: <20231010172037.611063-9-teackot@gmail.com>
Message-ID: <bbf14945-c10-f7e5-cc46-51c590be2cb5@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-9-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Nikita Kravets wrote:

> Filter the attributes and only create those which are supported by the
> currently loaded configuration. The filtered attributes are saved in an
> attribute group to be easily created and removed.
> root_attrs_support is an array of all attributes and their support
> conditions. fw_version and fw_release_date are supported on all models
> so their condition is always true.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 40 +++++++++++++++++++++++++++--------
>  drivers/platform/x86/msi-ec.h |  5 +++++
>  2 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index 772b230fb47e..09472b21e093 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -872,22 +872,44 @@ static ssize_t fw_release_date_show(struct device *device,
>  static DEVICE_ATTR_RO(fw_version);
>  static DEVICE_ATTR_RO(fw_release_date);
>  
> -static struct attribute *msi_root_attrs[] = {
> -	&dev_attr_fw_version.attr,
> -	&dev_attr_fw_release_date.attr,
> -	NULL
> -};
> -
> -static struct attribute_group msi_root_group = {
> -	.attrs = msi_root_attrs,
> -};
> +static struct attribute_group msi_root_group;
>  
>  /*
>   * Sysfs platform driver
>   */
>  
> +/*
> + * Copies supported attributes from `attributes` to `filtered`
> + */
> +static void filter_attributes(struct attribute_support *attributes,
> +			      struct attribute **filtered,
> +			      size_t size)
> +{
> +	for (int i = 0, j = 0; i < size; i++) {
> +		if (attributes[i].supported)
> +			filtered[j++] = attributes[i].attribute;
> +	}

Use .is_visible in the attribute group to toggle visibility.

> +}
> +
>  static int msi_platform_probe(struct platform_device *pdev)
>  {
> +	struct attribute_support root_attrs_support[] = {
> +		{
> +			&dev_attr_fw_version.attr,
> +			true,
> +		},
> +		{
> +			&dev_attr_fw_release_date.attr,
> +			true,
> +		},
> +	};
> +
> +	/* +1 to null-terminate the array */
> +	static struct attribute *root_attrs[ARRAY_SIZE(root_attrs_support) + 1] = {0};
> +
> +	filter_attributes(root_attrs_support, root_attrs, ARRAY_SIZE(root_attrs_support));
> +	msi_root_group.attrs = root_attrs;
> +
>  	return sysfs_create_group(&pdev->dev.kobj, &msi_root_group);
>  }
>  
> diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
> index be3533dc9cc6..f4198f0df5d9 100644
> --- a/drivers/platform/x86/msi-ec.h
> +++ b/drivers/platform/x86/msi-ec.h
> @@ -119,4 +119,9 @@ struct msi_ec_conf {
>  	struct msi_ec_kbd_bl_conf         kbd_bl;
>  };
>  
> +struct attribute_support {
> +	struct attribute *attribute;
> +	bool supported;
> +};
> +
>  #endif // _MSI_EC_H_
> 

-- 
 i.

