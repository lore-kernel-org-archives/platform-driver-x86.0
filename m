Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A41AC6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 14:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCAObN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 09:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjCAObM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 09:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECA23E623
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677681018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=crF8XByLME6Oz5ax0NL9uo9XZ2FPpW9WriSpFlfxP+w=;
        b=Fxm9ycDo5mEbnD1axcp1pL+/LrYt6/7LCIjJUBgzmN4lGxuJCW56ZmcC8c9yxN83wK+zaD
        TeJZU0du6iCKHqalnXPbp0re8PbVxRYcISAjgzLB3IMxKsUjlvwLr5GZhFOTY32mXGkHno
        bsA4zNwUKSH6hBvfDC4LgkodnwGGK3o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-gf9nybyHMhSicmtS6QVcSA-1; Wed, 01 Mar 2023 09:30:17 -0500
X-MC-Unique: gf9nybyHMhSicmtS6QVcSA-1
Received: by mail-ed1-f69.google.com with SMTP id dn8-20020a05640222e800b004bd35dd76a9so2182322edb.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 06:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crF8XByLME6Oz5ax0NL9uo9XZ2FPpW9WriSpFlfxP+w=;
        b=vcC3/xLKoKFO4I8X1YPJB47e9P7eyd4fJhbOUMYBITlEa8BXD1+zcNk3wEvRoxG+NV
         qPBQa0yqmPm4pluleqmHh5NPL8h1fsJClpyxYRgkfXMP9F66ZAB/7kLfeHrY0jnkSVuc
         DS12tM5WY9KS3k0uwqeAD4UZjeIkvPO9Q/cMBi0snPWMe3yqD9lBEacCXMn5lGjOX9gy
         o81jWXk94+rWgSBHN9nZZrchcVSpsPXl2bmjpAY0qiSPpnIodtds+yfV/xiBAN2Py/mt
         o6cxsiIKTcslvEAA8+o0XtTPNJWBCrncxy99VNdyDkNxVQmkdWgC1ePxjySJKCe7cTWz
         oh1A==
X-Gm-Message-State: AO0yUKUnKQ2jPeDRFAEonOd0YCLUh8PoJk3Mt0PExV0WCedi2y4mQUBX
        5NkbylAwQj/K3KQene56RPb4EINK5mTo1WrhUiT4spg4ViUBs6bP+q/ioP92ia0JFqJQQKSN7F/
        symqt/2UWn5LvGWVumpJDR9PD0SKs0sWygA==
X-Received: by 2002:a17:906:3c05:b0:8aa:f2f2:7543 with SMTP id h5-20020a1709063c0500b008aaf2f27543mr6914748ejg.29.1677681007773;
        Wed, 01 Mar 2023 06:30:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+DPgiaMvQjaj3MeqkogFb0loBT+0IQcOnbzahl0FOP9I7rMFxaMkLWFJc+P0+RhN3PTABwlQ==
X-Received: by 2002:a17:906:3c05:b0:8aa:f2f2:7543 with SMTP id h5-20020a1709063c0500b008aaf2f27543mr6914723ejg.29.1677681007480;
        Wed, 01 Mar 2023 06:30:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906824300b008b17eb06282sm5852567ejx.213.2023.03.01.06.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 06:30:06 -0800 (PST)
Message-ID: <1950741c-b5a9-6883-0c16-391001540a25@redhat.com>
Date:   Wed, 1 Mar 2023 15:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/12] platform/x86: ISST: Add support for MSR 0x54
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
 <20230211063257.311746-6-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230211063257.311746-6-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/23 07:32, Srinivas Pandruvada wrote:
> To map Linux CPU numbering scheme to hardware CPU numbering scheme
> MSR 0x53 is getting used. But for new generation of CPUs, this MSR
> is not valid. Since this is model specific MSR, this is possible.
> 
> A new MSR 0x54 is defined. Use this MSR and convert the IOCTL format
> to match existing MSR 0x53, in this case user spaces don't need to
> be aware of this change.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

I am not a fan of this. I expect that users of these new CPUs will
very likely also need a new intel-speed-select userspace tool regardless
of doing this MSR munging/shuffling in the kernel. So why not fix
the tool to teach it about the MSR instead ?

If you have good arguments for doing this in the kernel please
add them the commit message for the next version, but my initial
reaction to this is that it is wrong to do this in the kernel
and that the tool should be fixed instead. So my preference
would be for this patch to be dropped from the next version of
the patch-set.

Regards,

Hans







> ---
>  .../intel/speed_select_if/isst_if_common.c    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 60e58b0b3835..97d1b4566535 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -19,9 +19,13 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/isst_if.h>
>  
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
>  #include "isst_if_common.h"
>  
>  #define MSR_THREAD_ID_INFO	0x53
> +#define MSR_PM_LOGICAL_ID	0x54
>  #define MSR_CPU_BUS_NUMBER	0x128
>  
>  static struct isst_if_cmd_cb punit_callbacks[ISST_IF_DEV_MAX];
> @@ -31,6 +35,7 @@ static int punit_msr_white_list[] = {
>  	MSR_CONFIG_TDP_CONTROL,
>  	MSR_TURBO_RATIO_LIMIT1,
>  	MSR_TURBO_RATIO_LIMIT2,
> +	MSR_PM_LOGICAL_ID,
>  };
>  
>  struct isst_valid_cmd_ranges {
> @@ -73,6 +78,8 @@ struct isst_cmd {
>  	u32 param;
>  };
>  
> +static bool isst_hpm_support;
> +
>  static DECLARE_HASHTABLE(isst_hash, 8);
>  static DEFINE_MUTEX(isst_hash_lock);
>  
> @@ -411,11 +418,43 @@ static int isst_if_cpu_online(unsigned int cpu)
>  		isst_cpu_info[cpu].pci_dev[1] = _isst_if_get_pci_dev(cpu, 1, 30, 1);
>  	}
>  
> +	if (isst_hpm_support) {
> +		u64 raw_data;
> +
> +		ret = rdmsrl_safe(MSR_PM_LOGICAL_ID, &raw_data);
> +		if (!ret) {
> +			/*
> +			 * Use the same format as MSR 53, for user space harmony
> +			 *  Format
> +			 *	Bit 0 – thread ID
> +			 *	Bit 8:1 – core ID
> +			 *	Bit 13:9 – Compute domain ID (aka die ID)
> +			 * From the MSR 0x54 format
> +			 *	[15:11] PM_DOMAIN_ID
> +			 *	[10:3] MODULE_ID (aka IDI_AGENT_ID)
> +			 *	[2:0] LP_ID (We don't care about these bits we only
> +			 *			care die and core id
> +			 *	For Atom:
> +			 *		[2] Always 0
> +			 *		[1:0] core ID within module
> +			 *	For Core
> +			 *		[2:1] Always 0
> +			 *		[0] thread ID
> +			 */
> +			data = (raw_data >> 11) & 0x1f;
> +			data <<= 9;
> +			data |= (((raw_data >> 3) & 0xff) << 1);
> +			goto set_punit_id;
> +		}
> +	}
> +
>  	ret = rdmsrl_safe(MSR_THREAD_ID_INFO, &data);
>  	if (ret) {
>  		isst_cpu_info[cpu].punit_cpu_id = -1;
>  		return ret;
>  	}
> +
> +set_punit_id:
>  	isst_cpu_info[cpu].punit_cpu_id = data;
>  
>  	isst_restore_msr_local(cpu);
> @@ -704,6 +743,12 @@ static struct miscdevice isst_if_char_driver = {
>  	.fops		= &isst_if_char_driver_ops,
>  };
>  
> +static const struct x86_cpu_id hpm_cpu_ids[] = {
> +	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_X,	NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(SIERRAFOREST_X,	NULL),
> +	{}
> +};
> +
>  static int isst_misc_reg(void)
>  {
>  	mutex_lock(&punit_misc_dev_reg_lock);
> @@ -711,6 +756,12 @@ static int isst_misc_reg(void)
>  		goto unlock_exit;
>  
>  	if (!misc_usage_count) {
> +		const struct x86_cpu_id *id;
> +
> +		id = x86_match_cpu(hpm_cpu_ids);
> +		if (id)
> +			isst_hpm_support = true;
> +
>  		misc_device_ret = isst_if_cpu_info_init();
>  		if (misc_device_ret)
>  			goto unlock_exit;

