Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E88E95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 11:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346207AbjJILlB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346204AbjJILk7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 07:40:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B86B99
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696851658; x=1728387658;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Mk1Rq6xHp3rGgPZe2M6rjdJ5rcu2dfKQlUftce4ef+U=;
  b=aF4HIPAj7bxtixcFWM067Igx/YPUy2ZhIP95cN541i2jfsCUDx32nJfa
   vCTXuiG4A/Mo8u+GU20DOYiej/yOQilZtwHHTZXDL+CEsnYCEaTqOHdN8
   W2R+uog2sqUMrW2J4kSZUrWerX2Rnd9MfFfaMzY8q67aSTfinA0R62+Vi
   Aq4XE+/5JVW9M1uoUyNbHhx+XV1CF6UpVDA/TejB2x0L/O8wR6BU+RZns
   sm+bG6Deft501GcW/usCQlos1xXkyp3IIGIyDHyv+clDYI67rcEVQSghE
   PQMIOy+G4EEABO3l+Ko8C44jhhPcmUy7C0n8Rcg2LmaZWYPhy9fH2+ZL7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="374451540"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="374451540"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="818826558"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="818826558"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:40:56 -0700
Date:   Mon, 9 Oct 2023 14:40:53 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
In-Reply-To: <20231006175352.1753017-9-teackot@gmail.com>
Message-ID: <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com>
References: <20231006175352.1753017-3-teackot@gmail.com> <20231006175352.1753017-9-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 6 Oct 2023, Nikita Kravets wrote:

> This patch adds configurations for new EC firmware from the downstream
> version of the driver.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 467 ++++++++++++++++++++++++++++++++++
>  1 file changed, 467 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index 3074aee878c1..f19504dbf164 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -667,6 +667,467 @@ static struct msi_ec_conf CONF7 __initdata = {
>  	},
>  };
>  
> +static const char * const ALLOWED_FW_8[] __initconst = {
> +	"14F1EMS1.115",
> +	NULL
> +};
> +
> +static struct msi_ec_conf CONF8 __initdata = {
> +	.allowed_fw = ALLOWED_FW_8,
> +	.charge_control = {
> +		.address      = 0xd7,
> +		.offset_start = 0x8a,
> +		.offset_end   = 0x80,
> +		.range_min    = 0x8a,
> +		.range_max    = 0xe4,
> +	},
> +	.webcam = {
> +		.address       = 0x2e,
> +		.block_address = MSI_EC_ADDR_UNSUPP,
> +		.bit           = 1,
> +	},
> +	.fn_win_swap = {
> +		.address = 0xe8,
> +		.bit     = 4,
> +	},
> +	.cooler_boost = {
> +		.address = 0x98,
> +		.bit     = 7,
> +	},
> +	.shift_mode = {
> +		.address = 0xd2,
> +		.modes = {
> +			{ SM_ECO_NAME,     0xc2 },
> +			{ SM_COMFORT_NAME, 0xc1 },
> +			{ SM_SPORT_NAME,   0xc0 },
> +			MSI_EC_MODE_NULL
> +		},
> +	},
> +	.super_battery = {
> +		.address = 0xeb,
> +		.mask    = 0x0f,
> +	},
> +	.fan_mode = {
> +		.address = 0xd4,
> +		.modes = {
> +			{ FM_AUTO_NAME,     0x0d },
> +			{ FM_SILENT_NAME,   0x1d },
> +			{ FM_BASIC_NAME,    0x4d },
> +			MSI_EC_MODE_NULL
> +		},
> +	},
> +	.cpu = {
> +		.rt_temp_address       = 0x68,
> +		.rt_fan_speed_address  = 0x71,
> +		.rt_fan_speed_base_min = 0x19,
> +		.rt_fan_speed_base_max = 0x37,
> +		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
> +		.bs_fan_speed_base_min = 0x00,
> +		.bs_fan_speed_base_max = 0x0f,
> +	},
> +	.gpu = {
> +		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
> +		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
> +	},
> +	.leds = {
> +		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
> +		.mute_led_address    = 0x2d,
> +		.bit                 = 1,
> +	},
> +	.kbd_bl = {
> +		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
> +		.bl_modes         = { 0x00, 0x08 }, // ?
> +		.max_mode         = 1, // ?
> +		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional

I only too patch 2/3 becase there seems to be some configuration option 
which causes // comments to trigger warning (that can be made errors 
with another config option) so please use only /* */ comments.

-- 
 i.

