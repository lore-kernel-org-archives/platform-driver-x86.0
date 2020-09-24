Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE20C4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6579B2137B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:36:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKTdvs74"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgIXIgy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40569 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727235AbgIXIgx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iZNeQQkWMSjSkwFoVtDuBZUk/FFdCatXApryDcsJ2zQ=;
        b=dKTdvs74Zss/bG/UwO8h/D3IkiFavWeJjiu57JFBB6PWw4BcytK2rG7U/KMMejvbdQw650
        Z0PIuP+BhlpGrFONS8CbQ7GM3/oI9kA1kynFmqeG+3PDW1xWYeqNnf6g6EhA3TM2eEqhWs
        kcOCnvtYa/lYxE9siCCfQ9aBLhqmjiQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-4qmyFmtFMyWQabWaOucVEA-1; Thu, 24 Sep 2020 04:36:50 -0400
X-MC-Unique: 4qmyFmtFMyWQabWaOucVEA-1
Received: by mail-ed1-f69.google.com with SMTP id y15so916029edq.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iZNeQQkWMSjSkwFoVtDuBZUk/FFdCatXApryDcsJ2zQ=;
        b=Fgn4phYR3GESV/aQTBRquue+b51qts34rhgXxn2E/SbYc1sexCy5PM82DYK5d1AS82
         mk0TXdVRaxMk3UCfGb/WnAMqwVIg53EZm6CoG4ZNhvukiz7mKLta7i4yP1GvQBe4EMdF
         Zq+lRcw8az6w2+1W4f3L8mAcW5lMt3a7aAgaGOuYkFpkdvttsoWOQPIXJ4jA6IONIyhq
         zCDeMyDUG42kNpS0o1iuUC+dk/v5dbsjcy8tWC4/TCqBVJTMBmlTx5C/PsEuWe1EjLTa
         zM07w78IoCPmKKu908DssOgw3I1GBbLCSIO0jXIqOZiySQw2YwtzY8L+rf6hSsnXP2M4
         gTXQ==
X-Gm-Message-State: AOAM531Qp05lJHYzF2LYc/ZNP3r49aIzsOcMkrVbONeuFf8kWGDUEriZ
        knz/9b/xGJxyuOGmEJHuaMY9p9C8BTE4l6T2Goa62y70chZioxHJVVZsYwfKAOylE+z7F4cqhhc
        z5L2W/dpESOoEmshTpEwWolOnEOl6tMFOVw==
X-Received: by 2002:a17:906:4a19:: with SMTP id w25mr3307350eju.199.1600936609410;
        Thu, 24 Sep 2020 01:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjb0omZ31jPeREiR6W4l4xl9FwdMdhgPEFYHXwRPAp4qgP+ulhM2DY6kAgOiWVM/RvCjET3A==
X-Received: by 2002:a17:906:4a19:: with SMTP id w25mr3307333eju.199.1600936609221;
        Thu, 24 Sep 2020 01:36:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dt8sm1625197ejc.113.2020.09.24.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:36:48 -0700 (PDT)
Subject: Re: [PATCH platform-next 4/5] platform_data/mlxreg: Extend core
 platform structure
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
 <20200923172053.26296-5-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3de874a2-c26a-18ce-0d3f-1a852afcdb65@redhat.com>
Date:   Thu, 24 Sep 2020 10:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-5-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> Add 'capability' field to structure 'mlxreg_core_platform_data'.
> The purpose of this filed to indicate  the actual number of the
> components within the particular group. Such components could be,
> for example the number of the FAN drawers. Some systems are equipped
> with FAN drawers with one tachometer inside, others with FAN drawers
> with several tachometers inside.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   include/linux/platform_data/mlxreg.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index 0a727d405a7a..101333fe2b8d 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -109,6 +109,7 @@ struct mlxreg_core_item {
>    * @features: supported features of device;
>    * @version: implementation version;
>    * @identity: device identity name;
> + * @capability: device capability register;
>    */
>   struct mlxreg_core_platform_data {
>   	struct mlxreg_core_data *data;
> @@ -117,6 +118,7 @@ struct mlxreg_core_platform_data {
>   	u32 features;
>   	u32 version;
>   	char identity[MLXREG_CORE_LABEL_MAX_SIZE];
> +	u32 capability;
>   };
>   
>   /**
> 

