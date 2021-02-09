Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0906C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 00:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77AD664E76
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 00:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhBJAJu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Feb 2021 19:09:50 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.114]:52440 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234396AbhBIX5f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Feb 2021 18:57:35 -0500
Received: from [100.112.133.249] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id FD/F5-22828-E1023206; Tue, 09 Feb 2021 23:51:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsWSLveKXVdOQTn
  BYOJ6YYs3x6czWaz/vZLF4sipk2wWUw/UWHzumMxisXrPC2aLtV/msTmwe8xq6GXzeHdqC5vH
  7wOMHvNOBnr0tG1i8ni/7yqbx+dNcgHsUayZeUn5FQmsGX+nfWEr2BxccefrTqYGxnfOXYxcH
  EIC/xklnr2Zzt7FyAnkPGeUmPNYrYuRg0NYoEZi6/ZkkBoRgTVMEus/rGGEqMmS2LF6GzOIzS
  agLbFlyy82EJtXwFZi+qbDTCA2i4CKxNs/f8HqRQXCJV5v+swIUSMocXLmExYQm1PAWuJ503J
  mkF3MApoS63fpg4SZBcQlbj2ZzwRhy0s0b50NtkpCQEFi9YodTBB2gkTPv0dsExgFZiGZOgth
  0iwkk2YhmbSAkWUVo1lSUWZ6RkluYmaOrqGBga6hoZGuobGRroVeYpVukl5psW55anGJrpFeY
  nmxXnFlbnJOil5easkmRmD8pBS0cOxgPPz6g94hRkkOJiVR3j+CyglCfEn5KZUZicUZ8UWlOa
  nFhxhlODiUJHh/ygDlBItS01Mr0jJzgLEMk5bg4FES4f0sB5TmLS5IzC3OTIdInWLU5Ti5ask
  iZiGWvPy8VClx3iaQIgGQoozSPLgRsLRyiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr488
  0BSezLwSuE2vgI5gAjqic4oSyBEliQgpqQYmv41/t18PmrmJ9bvzj8DutZsVeR2VXCx6DJ+l+
  V9bxbUw9kKMUsaNfRLxgaomHBvFP/YJXZPbkWAmHNJjcfLGyfh2WZO25Q+mXO4pSPs5M+sVSy
  irlhJznKL5vmDPI1c2slzvObG5w7jYdqHAAh7Win8dzFvOsS16fs646fjST4V8axPmL2TIXlZ
  8X7jxc9q853N/HRR6e/S++K7OPLELmhtm96hKc7+tOqV+W3Rq3YodU2sX+znHGN19fMU58KrW
  afZzPM1yf22jFPeqznZYLP9msdD7ZUZMxd082/etlgn+MWX126VHnRITMgPvsJS2TvSyOX7U4
  33xMw+/FNYHlyqKjlzzTDObu/ZwY6O9EktxRqKhFnNRcSIANQyKwKYDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-356.messagelabs.com!1612914716!23716!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2762 invoked from network); 9 Feb 2021 23:51:57 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-14.tower-356.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Feb 2021 23:51:57 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 23B073E3C66AD8D8ECEB;
        Wed, 10 Feb 2021 07:51:53 +0800 (CST)
Received: from localhost.localdomain (10.46.54.100) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Tue, 9 Feb 2021
 18:51:18 -0500
Subject: Re: [External] [RFC PATCH 2/2] platform/x86:
 thinkpad_acpi/ideapad-laptop: extract common DYTC constants/functions
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210204203933.559752-1-pobrn@protonmail.com>
 <20210204203933.559752-3-pobrn@protonmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <7a5fc29a-5944-d004-9904-35b86bf21918@lenovo.com>
Date:   Tue, 9 Feb 2021 18:51:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204203933.559752-3-pobrn@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.54.100]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for doing this Barnabas - feel like I should have contributed to
this exercise :)

Looks excellent

Mark

On 04/02/2021 15:40, Barnabás Pőcze wrote:
> Extract common DYTC constants/functions into a dedicated header file
> to avoid code duplication. Rename DYTC_MODE_BALANCE to DYTC_MODE_BALANCED
> and DYTC_MODE_PERFORM to DYTC_MODE_PERFORMANCE to be consistent
> with the platform_profile_option enum.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
> 
>  create mode 100644 drivers/platform/x86/lenovo/dytc.h
> 
> diff --git a/drivers/platform/x86/lenovo/dytc.h b/drivers/platform/x86/lenovo/dytc.h
> new file mode 100644
> index 000000000000..9ec341bdef70
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/dytc.h
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#ifndef _LENOVO_DYTC_H_
> +#define _LENOVO_DYTC_H_
> +
> +#include <linux/platform_profile.h>
> +
> +#define DYTC_CMD_QUERY         0 /* To get DYTC status - enable/revision */
> +#define DYTC_CMD_SET           1 /* To enable/disable IC function mode */
> +#define DYTC_CMD_GET           2 /* To get current IC function and mode */
> +#define DYTC_CMD_RESET       511 /* To reset back to default */
> +
> +#define DYTC_QUERY_ENABLE_BIT  8 /* Bit        8 - 0 = disabled, 1 = enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> +
> +#define DYTC_GET_FUNCTION_BIT  8 /* Bits  8 - 11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12 - 15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit       17 - set when in lapmode */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12 - 15 - function setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16 - 19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit       20 - 1 = on, 0 = off */
> +
> +#define DYTC_FUNCTION_STD      0 /* Function =  0, standard mode */
> +#define DYTC_FUNCTION_CQL      1 /* Function =  1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> +
> +#define DYTC_MODE_PERFORMANCE  2 /* High power mode aka performance */
> +#define DYTC_MODE_LOW_POWER    3 /* Low power mode aka quiet */
> +#define DYTC_MODE_BALANCED    15 /* Default mode aka balanced */
> +
> +#define DYTC_SET_COMMAND(function, mode, on) \
> +	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
> +	 (mode) << DYTC_SET_MODE_BIT | \
> +	 (on) << DYTC_SET_VALID_BIT)
> +
> +#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCED, 0)
> +
> +#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCED, 1)
> +
> +static int inline convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
> +{
> +	switch (dytcmode) {
> +	case DYTC_MODE_LOW_POWER:
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case DYTC_MODE_BALANCED:
> +		*profile =  PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case DYTC_MODE_PERFORMANCE:
> +		*profile =  PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	default: /* Unknown mode */
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline int convert_profile_to_dytc(enum platform_profile_option profile, int *dytcmode)
> +{
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		*dytcmode = DYTC_MODE_LOW_POWER;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		*dytcmode = DYTC_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		*dytcmode = DYTC_MODE_PERFORMANCE;
> +		break;
> +	default: /* Unknown profile */
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +#endif /* _LENOVO_DYTC_H_ */
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 6cb5ad4be231..387c8c86b8bb 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -35,6 +35,8 @@
>  
>  #include <dt-bindings/leds/common.h>
>  
> +#include "dytc.h"
> +
>  #define IDEAPAD_RFKILL_DEV_NUM	3
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -676,76 +678,6 @@ static const struct attribute_group ideapad_attribute_group = {
>  /*
>   * DYTC Platform profile
>   */
> -#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
> -#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
> -#define DYTC_CMD_GET          2 /* To get current IC function and mode */
> -#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> -
> -#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
> -#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
> -#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> -
> -#define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
> -#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> -
> -#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - function setting */
> -#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> -#define DYTC_SET_VALID_BIT    20 /* Bit     20 - 1 = on, 0 = off */
> -
> -#define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
> -#define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
> -#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> -
> -#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> -#define DYTC_MODE_LOW_POWER       3  /* Low power mode aka quiet */
> -#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
> -
> -#define DYTC_SET_COMMAND(function, mode, on) \
> -	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
> -	 (mode) << DYTC_SET_MODE_BIT | \
> -	 (on) << DYTC_SET_VALID_BIT)
> -
> -#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 0)
> -
> -#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 1)
> -
> -static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
> -{
> -	switch (dytcmode) {
> -	case DYTC_MODE_LOW_POWER:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case DYTC_MODE_BALANCE:
> -		*profile =  PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case DYTC_MODE_PERFORM:
> -		*profile =  PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default: /* Unknown mode */
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int convert_profile_to_dytc(enum platform_profile_option profile, int *perfmode)
> -{
> -	switch (profile) {
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		*perfmode = DYTC_MODE_LOW_POWER;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		*perfmode = DYTC_MODE_BALANCE;
> -		break;
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		*perfmode = DYTC_MODE_PERFORM;
> -		break;
> -	default: /* Unknown profile */
> -		return -EOPNOTSUPP;
> -	}
> -
> -	return 0;
> -}
>  
>  /*
>   * dytc_profile_get: Function to register with platform_profile
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index b881044b31b0..61990fc9870c 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -74,6 +74,8 @@
>  #include <acpi/battery.h>
>  #include <acpi/video.h>
>  
> +#include "dytc.h"
> +
>  /* ThinkPad CMOS commands */
>  #define TP_CMOS_VOLUME_DOWN	0
>  #define TP_CMOS_VOLUME_UP	1
> @@ -9845,9 +9847,6 @@ static struct ibm_struct lcdshadow_driver_data = {
>   * Thinkpad sensor interfaces
>   */
>  
> -#define DYTC_CMD_GET          2 /* To get current IC function and mode */
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> -
>  #define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
>  #define PALMSENSOR_ON_BIT      1 /* psensor status */
>  
> @@ -9999,79 +9998,11 @@ static struct ibm_struct proxsensor_driver_data = {
>   * DYTC Platform Profile interface
>   */
>  
> -#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
> -#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
> -#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> -
> -#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
> -#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
> -#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> -
> -#define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
> -#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> -
> -#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - function setting */
> -#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> -#define DYTC_SET_VALID_BIT    20 /* Bit     20 - 1 = on, 0 = off */
> -
> -#define DYTC_FUNCTION_STD     0  /* Function = 0, standard mode */
> -#define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
> -#define DYTC_FUNCTION_MMC     11 /* Function = 11, desk mode */
> -
> -#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> -#define DYTC_MODE_LOWPOWER    3  /* Low power mode */
> -#define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
> -
> -#define DYTC_SET_COMMAND(function, mode, on) \
> -	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
> -	 (mode) << DYTC_SET_MODE_BIT | \
> -	 (on) << DYTC_SET_VALID_BIT)
> -
> -#define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 0)
> -
> -#define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 1)
> -
>  static bool dytc_profile_available;
>  static enum platform_profile_option dytc_current_profile;
>  static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
>  static DEFINE_MUTEX(dytc_mutex);
>  
> -static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
> -{
> -	switch (dytcmode) {
> -	case DYTC_MODE_LOWPOWER:
> -		*profile = PLATFORM_PROFILE_LOW_POWER;
> -		break;
> -	case DYTC_MODE_BALANCE:
> -		*profile =  PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case DYTC_MODE_PERFORM:
> -		*profile =  PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	default: /* Unknown mode */
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -static int convert_profile_to_dytc(enum platform_profile_option profile, int *perfmode)
> -{
> -	switch (profile) {
> -	case PLATFORM_PROFILE_LOW_POWER:
> -		*perfmode = DYTC_MODE_LOWPOWER;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		*perfmode = DYTC_MODE_BALANCE;
> -		break;
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		*perfmode = DYTC_MODE_PERFORM;
> -		break;
> -	default: /* Unknown profile */
> -		return -EOPNOTSUPP;
> -	}
> -	return 0;
> -}
> -
>  /*
>   * dytc_profile_get: Function to register with platform_profile
>   * handler. Returns current platform profile.
> 
