Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C02CA0ECB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243725AbjIKWA4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbjIKLP1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79F65CEB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694430877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZHlUfn/17CG9PV8K2nMC6g5yBMLaeUVhPgQcvBVUcM=;
        b=bNnUpEut8zXwGSe2I91jR0vIFHwZK7WP3e8/AGvvlKxX0sAH4SJM2rqh7DlsS+Nrv8p6KP
        alYGdB3N71M7cO77dS7U7Lk1Giru1ePugrBJwAKZY6wKF9wStXO9XWbhVe/wrMHxcQs3sH
        n+pYnT0FNqSR6gYjUlZ4lp/jgNxLTIc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306--d8f2ql5N66ajGIOIxx0Lw-1; Mon, 11 Sep 2023 07:14:36 -0400
X-MC-Unique: -d8f2ql5N66ajGIOIxx0Lw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a647551b7dso615787766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430875; x=1695035675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZHlUfn/17CG9PV8K2nMC6g5yBMLaeUVhPgQcvBVUcM=;
        b=eOHTOg07dCIlNfnpO1V1o1pcZk11m1t0ah9FtSCbb5/Ij0Q3S8wBMAz6qnjWPBe2Yw
         BWzt1cPitgSQNvx7mpPqcSdLG38vyXojov444/LfAQljFXZDGk7dOnaXm4WLKIr7YhvG
         nL9SmMcwKMuIdouAwLcSp+M4Zh563S3y90a6abCtPTQbZJRlRl24y+k13LcwXHZDRvBs
         QzueMWrgLl0gNXNuyvj7KDOwkHwxLJ87pM9xKucWwcTWuvQFf4vqt6yVTzdrCTNm8oqj
         T3Exan5iDVhGMSvWzYftpxcFzl3eH9LtP/cIeBi7G2qQFWh2SUps/Pcfho6QAuOIoaqe
         YnJA==
X-Gm-Message-State: AOJu0YyL6rCyhpWJwPT4t/wn84LKTGOO0+SelgaQmjBx4jd9RPdFXHby
        Y0uMMgvJnaY66U8QDz+qYMNJUEe60W8ly9sS7W0E/JRo2QuOvIIGL4BvE5RDenvUVlac9KXEZDX
        NGQ64alwSP7oOvvvV9e2ujE/JNeX8iy4Ezw==
X-Received: by 2002:a17:906:58cd:b0:9a1:c35b:9e09 with SMTP id e13-20020a17090658cd00b009a1c35b9e09mr18980887ejs.8.1694430875052;
        Mon, 11 Sep 2023 04:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc1yQRo/edO3xM+hTUpURKygC1fRP+bgKUURdgH3b7p2xbJeY1EngsA/BV5BKgyZZEYBdGdg==
X-Received: by 2002:a17:906:58cd:b0:9a1:c35b:9e09 with SMTP id e13-20020a17090658cd00b009a1c35b9e09mr18980867ejs.8.1694430874770;
        Mon, 11 Sep 2023 04:14:34 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709062b0700b009a1dbf55665sm5199607ejg.161.2023.09.11.04.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:14:34 -0700 (PDT)
Message-ID: <97f90ed6-e857-8b66-a4b8-8ed580bb18c7@redhat.com>
Date:   Mon, 11 Sep 2023 13:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] platform/mellanox: mlxbf-pmc: Fix potential buffer
 overflows
Content-Language: en-US
To:     Shravan Kumar Ramani <shravankr@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1693917738.git.shravankr@nvidia.com>
 <bef39ef32319a31b32f999065911f61b0d3b17c3.1693917738.git.shravankr@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bef39ef32319a31b32f999065911f61b0d3b17c3.1693917738.git.shravankr@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/23 14:49, Shravan Kumar Ramani wrote:
> Replace sprintf with sysfs_emit where possible.
> Size check in mlxbf_pmc_event_list_show should account for "\0".
> 
> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index be967d797c28..95afcae7b9fa 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1008,7 +1008,7 @@ static ssize_t mlxbf_pmc_counter_show(struct device *dev,
>  	} else
>  		return -EINVAL;
>  
> -	return sprintf(buf, "0x%llx\n", value);
> +	return sysfs_emit(buf, "0x%llx\n", value);
>  }
>  
>  /* Store function for "counter" sysfs files */
> @@ -1078,13 +1078,13 @@ static ssize_t mlxbf_pmc_event_show(struct device *dev,
>  
>  	err = mlxbf_pmc_read_event(blk_num, cnt_num, is_l3, &evt_num);
>  	if (err)
> -		return sprintf(buf, "No event being monitored\n");
> +		return sysfs_emit(buf, "No event being monitored\n");
>  
>  	evt_name = mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num);
>  	if (!evt_name)
>  		return -EINVAL;
>  
> -	return sprintf(buf, "0x%llx: %s\n", evt_num, evt_name);
> +	return sysfs_emit(buf, "0x%llx: %s\n", evt_num, evt_name);
>  }
>  
>  /* Store function for "event" sysfs files */
> @@ -1139,9 +1139,9 @@ static ssize_t mlxbf_pmc_event_list_show(struct device *dev,
>  		return -EINVAL;
>  
>  	for (i = 0, buf[0] = '\0'; i < size; ++i) {
> -		len += sprintf(e_info, "0x%x: %s\n", events[i].evt_num,
> -			       events[i].evt_name);
> -		if (len > PAGE_SIZE)
> +		len += snprintf(e_info, sizeof(e_info), "0x%x: %s\n",
> +				events[i].evt_num, events[i].evt_name);
> +		if (len >= PAGE_SIZE)
>  			break;
>  		strcat(buf, e_info);
>  		ret = len;
> @@ -1168,7 +1168,7 @@ static ssize_t mlxbf_pmc_enable_show(struct device *dev,
>  
>  	value = FIELD_GET(MLXBF_PMC_L3C_PERF_CNT_CFG_EN, perfcnt_cfg);
>  
> -	return sprintf(buf, "%d\n", value);
> +	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  /* Store function for "enable" sysfs files - only for l3cache */

