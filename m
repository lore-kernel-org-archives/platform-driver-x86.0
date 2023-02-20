Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3990C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 14:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbjBTOiv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 09:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjBTOiu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 09:38:50 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB93AD00
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 06:38:50 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="359881442"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="359881442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 06:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671323192"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="671323192"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2023 06:38:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pU7JU-009XzI-1h;
        Mon, 20 Feb 2023 16:38:44 +0200
Date:   Mon, 20 Feb 2023 16:38:44 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: int3472/discrete: Drop unnecessary
 obj->type == string check
Message-ID: <Y/OF9DOO8yRIh2S3@smile.fi.intel.com>
References: <20230204110223.54625-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204110223.54625-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Feb 04, 2023 at 12:02:23PM +0100, Hans de Goede wrote:
> acpi_evaluate_dsm_typed() already verifies the type is the requested type,
> so this error check is a no-op, drop it.

Not sure if it's not late...

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 96963e30ab6c..f064da74f50a 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -78,14 +78,6 @@ skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	if (obj->string.type != ACPI_TYPE_STRING) {
> -		dev_err(int3472->dev,
> -			"Sensor _DSM returned a non-string value\n");
> -
> -		ACPI_FREE(obj);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
>  		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
>  			    obj->string.pointer))
> -- 
> 2.39.1
> 

-- 
With Best Regards,
Andy Shevchenko


