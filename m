Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2A3C4320A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 07:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EFF36101E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 07:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbhHLHm1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 03:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45938 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234838AbhHLHm1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 03:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628754122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u4TpO8iJibyPxP/Isv1KfPXChojva1yiR6ZPzSTMnXo=;
        b=O5dcDwe1DGeEaP+rFgQjVkCAwglR+FZkwD3A/Kengp0OUaVDhmye2EPezERNcvZl3w5nHw
        S72sv5bJG4MicpC2bHgDR/L4YW6L+G0HiWebZ5pn/PRjXXdPO+OrvUfylOxeg/2UyXMPQN
        D6hOcEJS5CaI8adcqFgYI+rNt6MwGvY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-s4hCJR01NdihY_P0v1xKcg-1; Thu, 12 Aug 2021 03:41:55 -0400
X-MC-Unique: s4hCJR01NdihY_P0v1xKcg-1
Received: by mail-ed1-f71.google.com with SMTP id cm18-20020a0564020c92b02903bc7f21d540so2623873edb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2021 00:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u4TpO8iJibyPxP/Isv1KfPXChojva1yiR6ZPzSTMnXo=;
        b=P6QMBj3WwYmBN5CtBQJaAVvJfX7DYJ0BMVfj5Nynxw6N2Ct3/imfqhOE33tXXlH4++
         YDC/gIA2vRl8Mumf3wA2aT6z6zRT4Y9451uXQ2Ac8Cke/180qG4Czn3m48sQQvVcinGC
         9JPtBurmKFptcmpOuCBlJEf3RI43y1D8WS+Jicpvqn4vBVYv6arUZXptAGFrrTtVl6LN
         4KjvjBTvTlHIvg5lDq4QxY1kb3xBq26Hp+7YmUlLEuYcQ/40oemQdoDHX04nuMrBpwdg
         y4d3vbiMYgkpP5m7anahxnjGIQCvMixlILYDGEyrzvEotOOz6ueULj5bDl7XdRrNt7sG
         YiZw==
X-Gm-Message-State: AOAM533LY305XxqH+Vgr0CjabdiZMAh6gs3Vwiq/INiQAAx9gbICnjlH
        AYzQc7IX/cdzFCjjwp1lR/I/5Z5vQZOoqinNflMzbEOxpoZre8IpArIpGlGUnI7oMAW5OhOpqrj
        STRNwBI5uWPCraV/SCLp4IIofJ7H4sC6wcw==
X-Received: by 2002:a17:906:551:: with SMTP id k17mr2361850eja.391.1628754114682;
        Thu, 12 Aug 2021 00:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv5hHff6uRU/Ik2WW3csB/wvz4oYxpyyIYPf+uZAO6Be3jJaOO0j0iG3axT0YOjaZHnHVFqA==
X-Received: by 2002:a17:906:551:: with SMTP id k17mr2361838eja.391.1628754114537;
        Thu, 12 Aug 2021 00:41:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f8sm737462edy.57.2021.08.12.00.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 00:41:54 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: ISST: Fix optimization with use of numa
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        sfr@canb.auug.org.au
References: <20210811033633.1204567-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <119ab09f-9aab-9980-c1d3-72decff43488@redhat.com>
Date:   Thu, 12 Aug 2021 09:41:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811033633.1204567-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/11/21 5:36 AM, Srinivas Pandruvada wrote:
> When numa is used to map CPU to PCI device, the optimized path to read
> from cached data is not working and still calls _isst_if_get_pci_dev().
> 
> The reason is that when caching the mapping, numa information is not
> available as it is read later. So move the assignment of
> isst_cpu_info[cpu].numa_node before calling _isst_if_get_pci_dev().
> 
> Fixes: aa2ddd242572 ("platform/x86: ISST: Use numa node id for cpu pci dev mapping")
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> v2:
> Fixed "Fixes tag" as suggested by Stephen Rothwell

Thanks, but I just fixed this myself in the pdx86/for-next tree and I've
done a forced-push of for-next with the fixed Fixes tag.

Either way this is resolved now :)

Regards,

Hans




> 
> Update:
> 	The fixes tag was wrong
> This patch can wait for next merge window as these systems are not
> shipped.
> 
>  drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> index 6f0cc679c8e5..8a4d52a9028d 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
> @@ -379,6 +379,8 @@ static int isst_if_cpu_online(unsigned int cpu)
>  	u64 data;
>  	int ret;
>  
> +	isst_cpu_info[cpu].numa_node = cpu_to_node(cpu);
> +
>  	ret = rdmsrl_safe(MSR_CPU_BUS_NUMBER, &data);
>  	if (ret) {
>  		/* This is not a fatal error on MSR mailbox only I/F */
> @@ -397,7 +399,6 @@ static int isst_if_cpu_online(unsigned int cpu)
>  		return ret;
>  	}
>  	isst_cpu_info[cpu].punit_cpu_id = data;
> -	isst_cpu_info[cpu].numa_node = cpu_to_node(cpu);
>  
>  	isst_restore_msr_local(cpu);
>  
> 

