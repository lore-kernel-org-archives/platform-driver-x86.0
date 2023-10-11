Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4F0CD6E64
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 12:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjJKM7p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 08:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbjJKM7o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 08:59:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9687D93
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697029182; x=1728565182;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G1O0n34XIfGQkRSWpiJqbVcjiRNcpGR0qCzP70RcFE4=;
  b=GBVHJvZ7DZytll7PKKIdATQKnjE3IhzQzOFHAIrQebDJg0BjVR5JRqhz
   2HU5Qsa117CK+mW8VTz9CcxgIlIE7NdwdiGZJBxYI1w/W4Ci0IRDBZzl2
   IekC1M8TdtC6RRVWVH2sVMUa+uDd34KqrRaujp5SXqx0ltgB/IZ84xPLt
   2Ay+jb4JM0+ZE/EMJtYzLPYeXrwwAX+4t/J7/qPmP/bjxIQuExprsr5mZ
   WZ1hefu6irN9yDTPCfr/g8lIINIqH0SA1TXOy0Sb8w5Yvkbm0XKzrJORD
   8mq2BXNgVF6XEfs/kHMlJAGRk2aRhthiM+aZR8LHDdrJ8CzylbcKQH3Ol
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415701835"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="415701835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085219361"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="1085219361"
Received: from opipikin-mobl2.ger.corp.intel.com ([10.252.57.154])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:59:40 -0700
Date:   Wed, 11 Oct 2023 15:59:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Nikita Kravets <teackot@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: Re: [PATCH 4/5] platform/x86: msi-ec: Add EC bit operation
 functions
In-Reply-To: <20231010172037.611063-11-teackot@gmail.com>
Message-ID: <9ea4b836-38d8-8abd-4222-3acb22ee287@linux.intel.com>
References: <20231010172037.611063-3-teackot@gmail.com> <20231010172037.611063-11-teackot@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 10 Oct 2023, Nikita Kravets wrote:

> The EC of MSI laptops supports several features represented by a single
> bit. Add ec_set_bit and ec_check_bit functions to operate on these bits.
> 
> Cc: Aakash Singh <mail@singhaakash.dev>
> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
> Signed-off-by: Nikita Kravets <teackot@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index 09472b21e093..ae73dcf01d09 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -699,6 +699,34 @@ static int ec_read_seq(u8 addr, u8 *buf, u8 len)
>  	return 0;
>  }
>  
> +static int ec_set_bit(u8 addr, u8 bit, bool value)
> +{
> +	int result;
> +	u8 stored;
> +
> +	result = ec_read(addr, &stored);
> +	if (result < 0)
> +		return result;
> +
> +	stored ^= (-(u8) value ^ stored) & (1 << bit);

So first you case bool to u8 and then take negation of that unsigned 
number? ...My head is already hurting even without all the other logic.

This has to be rewritten to something that mere mortals can understand 
which doesn't explore all those odd corners of C spec. :-)

I didn't try to parse that logic through but I assuming it's the usual 
construct perhaps this could be simplified with (please be sure to check 
this throughoutly as I didn't try to understand what the original really 
does):

	bit = 1 << bit;
	stored &= ~bit;
	stored |= value ? bit : 0;

> +
> +	return ec_write(addr, stored);
> +}
> +
> +static int ec_check_bit(u8 addr, u8 bit, bool *output)
> +{
> +	int result;
> +	u8 stored;
> +
> +	result = ec_read(addr, &stored);
> +	if (result < 0)
> +		return result;
> +
> +	*output = (stored >> bit) & 1;
> +
> +	return 0;
> +}
> +
>  static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
>  {
>  	int result;
> 

-- 
 i.

