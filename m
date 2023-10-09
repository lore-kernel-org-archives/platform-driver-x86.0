Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BDAE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 12:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346570AbjJIMex (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 08:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346610AbjJIMen (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 08:34:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5589C
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696854881; x=1728390881;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W3OR6Bg7pBIst6e5g37975h+XQRYocwGXD25CWTkHVw=;
  b=XOY7Xbaa/SOqOmKbkWG1/CVF+QDGRmQwL9A6U1XvzXkrhoNTePF6/9GF
   ZsnD7UsVAVJue6XuLd3CAz6x9eVx74l1gCGDS0ytAOb5IJyea5XOXH32h
   yAZxB+ESfPrcRC6D7eFROQDv9cx6ChM0YoWofE2zrGOuctb3O4Gqh5TJi
   EvVZc0LArLp2lzCfVMdL+VyaswglBKh83d3rl7pElYJ6OwbndvM+2BRIM
   wk5eAP4+kmB5o574Z2YSytCKp2Owvtr0SVQ2CpK145Tbwp4RSEDpi44UU
   merocWgspghecB+OwjFQf1+x2uGi/d+rzJcQyzrhHZ5GgAE9qf71XjmmO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450630531"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="450630531"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="753002917"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="753002917"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 05:34:39 -0700
Date:   Mon, 9 Oct 2023 15:34:36 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Nikita Kravets <teackot@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
In-Reply-To: <d15fcb9b-0d4f-b874-7066-03aae78e160c@redhat.com>
Message-ID: <5635e2f-e169-9858-1034-5607d9cfde@linux.intel.com>
References: <20231006175352.1753017-3-teackot@gmail.com> <20231006175352.1753017-9-teackot@gmail.com> <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com> <d15fcb9b-0d4f-b874-7066-03aae78e160c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1037429983-1696854880=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1037429983-1696854880=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Hans de Goede wrote:
> On 10/9/23 13:40, Ilpo Järvinen wrote:
> > On Fri, 6 Oct 2023, Nikita Kravets wrote:
> > 
> >> This patch adds configurations for new EC firmware from the downstream
> >> version of the driver.
> >>
> >> Cc: Aakash Singh <mail@singhaakash.dev>
> >> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> >> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> >> ---
> >>  drivers/platform/x86/msi-ec.c | 467 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 467 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> >> index 3074aee878c1..f19504dbf164 100644
> >> --- a/drivers/platform/x86/msi-ec.c
> >> +++ b/drivers/platform/x86/msi-ec.c
> >> @@ -667,6 +667,467 @@ static struct msi_ec_conf CONF7 __initdata = {
> >>  	},
> >>  };
> >>  
> >> +static const char * const ALLOWED_FW_8[] __initconst = {
> >> +	"14F1EMS1.115",
> >> +	NULL
> >> +};
> >> +
> >> +static struct msi_ec_conf CONF8 __initdata = {
> >> +	.allowed_fw = ALLOWED_FW_8,
> >> +	.charge_control = {
> >> +		.address      = 0xd7,
> >> +		.offset_start = 0x8a,
> >> +		.offset_end   = 0x80,
> >> +		.range_min    = 0x8a,
> >> +		.range_max    = 0xe4,
> >> +	},
> >> +	.webcam = {
> >> +		.address       = 0x2e,
> >> +		.block_address = MSI_EC_ADDR_UNSUPP,
> >> +		.bit           = 1,
> >> +	},
> >> +	.fn_win_swap = {
> >> +		.address = 0xe8,
> >> +		.bit     = 4,
> >> +	},
> >> +	.cooler_boost = {
> >> +		.address = 0x98,
> >> +		.bit     = 7,
> >> +	},
> >> +	.shift_mode = {
> >> +		.address = 0xd2,
> >> +		.modes = {
> >> +			{ SM_ECO_NAME,     0xc2 },
> >> +			{ SM_COMFORT_NAME, 0xc1 },
> >> +			{ SM_SPORT_NAME,   0xc0 },
> >> +			MSI_EC_MODE_NULL
> >> +		},
> >> +	},
> >> +	.super_battery = {
> >> +		.address = 0xeb,
> >> +		.mask    = 0x0f,
> >> +	},
> >> +	.fan_mode = {
> >> +		.address = 0xd4,
> >> +		.modes = {
> >> +			{ FM_AUTO_NAME,     0x0d },
> >> +			{ FM_SILENT_NAME,   0x1d },
> >> +			{ FM_BASIC_NAME,    0x4d },
> >> +			MSI_EC_MODE_NULL
> >> +		},
> >> +	},
> >> +	.cpu = {
> >> +		.rt_temp_address       = 0x68,
> >> +		.rt_fan_speed_address  = 0x71,
> >> +		.rt_fan_speed_base_min = 0x19,
> >> +		.rt_fan_speed_base_max = 0x37,
> >> +		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
> >> +		.bs_fan_speed_base_min = 0x00,
> >> +		.bs_fan_speed_base_max = 0x0f,
> >> +	},
> >> +	.gpu = {
> >> +		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
> >> +		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
> >> +	},
> >> +	.leds = {
> >> +		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
> >> +		.mute_led_address    = 0x2d,
> >> +		.bit                 = 1,
> >> +	},
> >> +	.kbd_bl = {
> >> +		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
> >> +		.bl_modes         = { 0x00, 0x08 }, // ?
> >> +		.max_mode         = 1, // ?
> >> +		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional
> > 
> > I only too patch 2/3 becase there seems to be some configuration option 
> > which causes // comments to trigger warning (that can be made errors 
> > with another config option) so please use only /* */ comments.
> 
> Hmm, that is very weird all the:
> 
> // SPDX-License-Identifier ...
> 
> comments at the top of many of our .c files are c++ style comments.

I know there are those already which is why I didn't think there would 
have been any problem with them until I got burned.

If // comments are okay, what's the explanation for this then:

  https://lore.kernel.org/oe-kbuild-all/202309270535.g9nOUvFb-lkp@intel.com/

It's from randconfig build so it's a bit hard to know from the report 
itself which CONFIG combination exactly triggers the issue.

I can think of two potential ones:
  a) Only problems for changed lines are reported by LKP
  b) Header files have different rules than .c files (uapi ones in 
     particular, I'd guess, if that's the case)

Any ideas?


-- 
 i.

--8323329-1037429983-1696854880=:1721--
