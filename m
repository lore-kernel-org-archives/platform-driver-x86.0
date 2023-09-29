Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C221E728C3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Sep 2023 16:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbjI2QID (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Sep 2023 12:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbjI2QIC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2023 12:08:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B53195
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Sep 2023 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696003680; x=1727539680;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4PeJ/HqUAzB8NVa3Ue5RXRBZG8KX7h66UYPaOWhE+XQ=;
  b=B8SgzF9cGc0rUP+C6BJTmDWWOfWGSITp0kbFl87G0er5D2ZAjnYjmZWD
   OsMxyszR3wbaVEQOXQoeDaRSs8kjmOZoXJV6JcjMPxhQtd3B/1v0TIXD4
   ezxd+ARhYmp7jy4qRMtiB6Xl+mPF2XuorKW17nYI9XHXnXky/OQIGod7u
   HdpU6HIX3G0xXhQ7xBvcBLidlam6wmQTmns16kH1FJcVxexwH/v6APeoS
   CC4kHoeTFlACiwmDNBo4nL0phrWo/hTTuvWUFeynP1GYNoe8X2B1+S/ik
   HUj/EtTEyyaM8q9td0GkoIUQPE5cSoO1Otbh37h9PryCqOlqtoWlrwdG2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367385929"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="367385929"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 09:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="749986563"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="749986563"
Received: from smorozov-mobl1.ger.corp.intel.com ([10.252.52.167])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 09:07:36 -0700
Date:   Fri, 29 Sep 2023 19:07:33 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 1/2] platform/x86: msi-ec: Fix the 3rd config
In-Reply-To: <20230929113149.587436-3-teackot@gmail.com>
Message-ID: <b7bfc6a9-1dcc-89a8-c8a8-515d56faf35@linux.intel.com>
References: <20230929113149.587436-1-teackot@gmail.com> <20230929113149.587436-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On Fri, 29 Sep 2023, Nikita Kravets wrote:

> Fix the charge control address of CONF3 and remove an incorrect firmware
> version which turned out to be a BIOS firmware and not an EC firmware.

Should there be a Fixes tag?

> This patch also renames fn_super_swap to fn_win_swap for consistency
> with the downstream version of the driver.

Please don't mix changes like this.

Hans, what do you think about the rename in this patch? (To me "super" 
sounds the normal terminology in Linux world so it feels a step 
backwards.)

-- 
 i.

> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 19 +++++++++----------
>  drivers/platform/x86/msi-ec.h |  4 ++--
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f26a3121092f..3074aee878c1 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -58,7 +58,7 @@ static struct msi_ec_conf CONF0 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xbf,
>  		.bit     = 4,
>  	},
> @@ -138,7 +138,7 @@ static struct msi_ec_conf CONF1 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xbf,
>  		.bit     = 4,
>  	},
> @@ -215,7 +215,7 @@ static struct msi_ec_conf CONF2 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xe8,
>  		.bit     = 4,
>  	},
> @@ -276,14 +276,13 @@ static struct msi_ec_conf CONF2 __initdata = {
>  
>  static const char * const ALLOWED_FW_3[] __initconst = {
>  	"1592EMS1.111",
> -	"E1592IMS.10C",
>  	NULL
>  };
>  
>  static struct msi_ec_conf CONF3 __initdata = {
>  	.allowed_fw = ALLOWED_FW_3,
>  	.charge_control = {
> -		.address      = 0xef,
> +		.address      = 0xd7,
>  		.offset_start = 0x8a,
>  		.offset_end   = 0x80,
>  		.range_min    = 0x8a,
> @@ -294,7 +293,7 @@ static struct msi_ec_conf CONF3 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xe8,
>  		.bit     = 4,
>  	},
> @@ -372,7 +371,7 @@ static struct msi_ec_conf CONF4 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = MSI_EC_ADDR_UNKNOWN, // supported, but unknown
>  		.bit     = 4,
>  	},
> @@ -451,7 +450,7 @@ static struct msi_ec_conf CONF5 __initdata = {
>  		.block_address = 0x2f,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = { // todo: reverse
> +	.fn_win_swap = { // todo: reverse
>  		.address = 0xbf,
>  		.bit     = 4,
>  	},
> @@ -529,7 +528,7 @@ static struct msi_ec_conf CONF6 __initdata = {
>  		.block_address = MSI_EC_ADDR_UNSUPP,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xbf, // todo: reverse
>  		.bit     = 4,
>  	},
> @@ -609,7 +608,7 @@ static struct msi_ec_conf CONF7 __initdata = {
>  		.block_address = MSI_EC_ADDR_UNSUPP,
>  		.bit           = 1,
>  	},
> -	.fn_super_swap = {
> +	.fn_win_swap = {
>  		.address = 0xbf, // needs testing
>  		.bit     = 4,
>  	},
> diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
> index be3533dc9cc6..086351217505 100644
> --- a/drivers/platform/x86/msi-ec.h
> +++ b/drivers/platform/x86/msi-ec.h
> @@ -40,7 +40,7 @@ struct msi_ec_webcam_conf {
>  	int bit;
>  };
>  
> -struct msi_ec_fn_super_swap_conf {
> +struct msi_ec_fn_win_swap_conf {
>  	int address;
>  	int bit;
>  };
> @@ -108,7 +108,7 @@ struct msi_ec_conf {
>  
>  	struct msi_ec_charge_control_conf charge_control;
>  	struct msi_ec_webcam_conf         webcam;
> -	struct msi_ec_fn_super_swap_conf  fn_super_swap;
> +	struct msi_ec_fn_win_swap_conf    fn_win_swap;
>  	struct msi_ec_cooler_boost_conf   cooler_boost;
>  	struct msi_ec_shift_mode_conf     shift_mode;
>  	struct msi_ec_super_battery_conf  super_battery;
> 
