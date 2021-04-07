Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7788C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 16:31:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84A2A611CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 16:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344822AbhDGQb6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 12:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41996 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232103AbhDGQb6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 12:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617813108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5mVVl+fL6TScHUbVo11wdSW6OBMF7FzXxPqhYZhkxe4=;
        b=We/JkIf0I/Jq/iVc65nSv7HLEJHjWt89WjQxipMJnxJdwX6ZiwiD+Bwnkz6jV01BG9vk7m
        h5PdF+j9jcLLaLnMBE20EjJdzmoW+Bge+rzX7d0ukFNic7wEqJkzynRjwlSTaWpQaGUzeE
        oITEHUVLh+wm7y6YaAU4PmOcujt1QxA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-gxxQ1bEGPUqeD1RcU0g-SA-1; Wed, 07 Apr 2021 12:31:46 -0400
X-MC-Unique: gxxQ1bEGPUqeD1RcU0g-SA-1
Received: by mail-ej1-f71.google.com with SMTP id n21so3573720ejl.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 09:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5mVVl+fL6TScHUbVo11wdSW6OBMF7FzXxPqhYZhkxe4=;
        b=Nxa5MdlQp/hUE0dQGsnvPQ4fwix+36Acifujt5N+sre9HABT7s4W805o1hh7Kfmv/S
         rljttyfd0SspFPtgUKm4nV3rUIaboEnI/kWD2CGgWZyZmxX6leXkLEaUwfgWH9fG3BID
         YM/89Zz0v89ZnjtZ+XTDeZXv5PqERfJs6CNcmVuDkaj+kIbFtxzm2J1/aZuxhpPN812T
         eVuNbIJigy7Dnz+12b0MQUC3tHS1kyTOk/SZ0LfzKD0ku1O/g2gBS26EV23xXVQ+LLEk
         1Y4CmbAgPS6O7Dr8FdUHCgInkuSDU6g/Z1M0SVlQrebNyjzo0Px/iF8yCr0y1FSJU69k
         Iw/g==
X-Gm-Message-State: AOAM531WMKPvQo1RQR0tK5ZShvzNx3shYIylAQ4g4uh6Orc1S2zaAP6K
        whXx0WeYsh53cVLOd/NFmzVNghfISkHB6tC0s6v2+AGaFM2NhImNQZ6njWpiWZb5lx0N4+sKOy6
        JL4XhQFNchWw2VYYn3NdjVtUWq3N52Up850WFKPBj7vWs++KihHQGyIS4amRCHbqQyTPK0AMl+7
        0yviI9ecGFew==
X-Received: by 2002:aa7:d997:: with SMTP id u23mr5489980eds.285.1617813105002;
        Wed, 07 Apr 2021 09:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaujWOFOweRs/1w9FSs24psRNAmQ/B9jBPrIm+5oPL0ZGs6t2vFLKr72I5NWulpuzJ81Xv9A==
X-Received: by 2002:aa7:d997:: with SMTP id u23mr5489949eds.285.1617813104790;
        Wed, 07 Apr 2021 09:31:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t7sm1179007edq.42.2021.04.07.09.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 09:31:44 -0700 (PDT)
Subject: Re: [PATCH v2] Add support for DYTC MMC_GET BIOS API.
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210406233203.232860-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc6e93ad-e064-ba03-0c40-d9a95c5cb496@redhat.com>
Date:   Wed, 7 Apr 2021 18:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210406233203.232860-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/7/21 1:32 AM, Mark Pearson wrote:
> The BIOS team have added a new API that allows us to retrieve the
> current performance profile without having to disable/enable CQL
> mode. Adding the changes to use this API.
> 
> Tested on P15 and X1C8
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> Changes in v2:
>  - remove unwanted debug code
> 
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0d9e2ddbf..07de21941 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10050,6 +10050,7 @@ static struct ibm_struct proxsensor_driver_data = {
>   */
>  
>  #define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
> +#define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>  #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>  
>  #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
> @@ -10066,6 +10067,10 @@ static struct ibm_struct proxsensor_driver_data = {
>  #define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
>  #define DYTC_MODE_LOWPOWER    3  /* Low power mode */
>  #define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
> +#define DYTC_MODE_MMC_BALANCE 0  /* Default mode from MMC_GET, aka balanced */
> +
> +#define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
> +#define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
>  
>  #define DYTC_SET_COMMAND(function, mode, on) \
>  	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
> @@ -10080,6 +10085,7 @@ static bool dytc_profile_available;
>  static enum platform_profile_option dytc_current_profile;
>  static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
>  static DEFINE_MUTEX(dytc_mutex);
> +static bool dytc_mmc_get_available;
>  
>  static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
>  {
> @@ -10088,6 +10094,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
>  		*profile = PLATFORM_PROFILE_LOW_POWER;
>  		break;
>  	case DYTC_MODE_BALANCE:
> +	case DYTC_MODE_MMC_BALANCE:
>  		*profile =  PLATFORM_PROFILE_BALANCED;
>  		break;
>  	case DYTC_MODE_PERFORM:
> @@ -10165,7 +10172,6 @@ static int dytc_cql_command(int command, int *output)
>  		if (err)
>  			return err;
>  	}
> -
>  	return cmd_err;
>  }
>  
> @@ -10222,7 +10228,10 @@ static void dytc_profile_refresh(void)
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);
> -	err = dytc_cql_command(DYTC_CMD_GET, &output);
> +	if (dytc_mmc_get_available)
> +		err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +	else
> +		err = dytc_cql_command(DYTC_CMD_GET, &output);
>  	mutex_unlock(&dytc_mutex);
>  	if (err)
>  		return;
> @@ -10271,6 +10280,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (dytc_version >= 5) {
>  		dbg_printk(TPACPI_DBG_INIT,
>  				"DYTC version %d: thermal mode available\n", dytc_version);
> +		/*
> +		 * Check if MMC_GET functionality available
> +		 * Version > 6 and return success from MMC_GET command
> +		 */
> +		dytc_mmc_get_available = false;
> +		if (dytc_version >= 6) {
> +			err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
> +				dytc_mmc_get_available = true;
> +		}
>  		/* Create platform_profile structure and register */
>  		err = platform_profile_register(&dytc_profile);
>  		/*
> 

