Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794F7C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 14:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbjA3OoV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbjA3OoR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A361D938
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675089810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fioux6GuiKSW7YRyyrBF84E85/YeT+Z+a4lGGk3rKx0=;
        b=C+qyrsg3CP9JR0EFdSuohVCiyDALvNXwNwnhpMQ0SPwD1fR9tCVSACS1/+d7MRyLJMBv92
        ui+vZVpIh5+jQjsPdcSt5vweZTdBy7DTz0MPSqQjU1aQ/iRTa5zO0ojEGQFROPCBqR10e2
        p0dSHRySAWKTjZ3/ulkviwLNej0hVo8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-4c2FAC0OMLexn0aNbDc6Mg-1; Mon, 30 Jan 2023 09:43:28 -0500
X-MC-Unique: 4c2FAC0OMLexn0aNbDc6Mg-1
Received: by mail-ed1-f72.google.com with SMTP id w16-20020a056402129000b004a1f1a2e79dso6178779edv.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fioux6GuiKSW7YRyyrBF84E85/YeT+Z+a4lGGk3rKx0=;
        b=sp9AxpSfeOnM7qyinLzACrG2mYMOLePfI2Y08Q7Zxuxe2kdISXMcg0PB8OcM1tIWBG
         /igg15CIle9/qNIPGdk5Cr+kp6h7vMK6fN2FaeQXH/ONTQtpLCKOPjERmoMqg9pMvvYR
         yfez0MiyGPlatUesPN44btKTLVaZ0Pnz82wvRDz3sxmzxTdlyTiy7I0+mzAe8LlWHlHk
         KAsv3KRZ2ZFypcqXXo/Oyyh8PshMdA4gOnoHXyZwKOZXSfTDw7bN39ew7ATlf/2/RDU0
         3HTNYq1U/zyCO5t4ME1kuVOotT99/VkcH+Jrhf3iLUwYakN9E/YJdw9swAC2q2YQahqj
         bT4w==
X-Gm-Message-State: AO0yUKXywb3hNDwhsLGju0zhpnZLEfnth6qxKVkoAo9e3jmtxS9Fpu0G
        bzGZD4CmHZ7tze2HrKajInu2GKmWCx1w1uDrIn4XRO9uUknIYFZVYQKPwrYviwI7R2GcalcxskE
        b4/YoKcYkyQq1P/U9LjZMWa34ARxX4QbO2Q==
X-Received: by 2002:a17:906:7310:b0:881:f2f:6633 with SMTP id di16-20020a170906731000b008810f2f6633mr12797190ejc.50.1675089807529;
        Mon, 30 Jan 2023 06:43:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+gkWlwvAW3lH6l+OfAI1tf1IsTRYkuYAcnn0CACtKgUo9G8b5E1tfmcIpEr2CfhbbqibGOqQ==
X-Received: by 2002:a17:906:7310:b0:881:f2f:6633 with SMTP id di16-20020a170906731000b008810f2f6633mr12797169ejc.50.1675089807328;
        Mon, 30 Jan 2023 06:43:27 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906010b00b0088272bac7c5sm4000997eje.121.2023.01.30.06.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 06:43:26 -0800 (PST)
Message-ID: <8e139e6d-5ad1-d1b1-038c-0ee8393dd4c9@redhat.com>
Date:   Mon, 30 Jan 2023 15:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/4] platform/x86/amd: pmc: Add line break for readability
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-5-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125113127.3862898-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 12:31, Shyam Sundar S K wrote:
> Add a line break for the code readability.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 467b80ad01a1..8afe77e443cb 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -105,6 +105,7 @@
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
>  #define FIFO_SIZE		4096
> +
>  enum amd_pmc_def {
>  	MSG_TEST = 0x01,
>  	MSG_OS_HINT_PCO,

