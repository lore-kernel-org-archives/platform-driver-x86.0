Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E05ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Sat, 10 Sep 2022 12:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiIJMQG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 10 Sep 2022 08:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIJMQF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Sep 2022 08:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B73C4DF3D
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662812157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C3XG3bWpOKNJM325R8EQqcV36GlCcyEuoSsBI2lwREM=;
        b=ZSTlrWcA6wk0DPt6g3acczxdkEArlsiThXJrVJBm/uG2EP3ncAjCRuUvJhuNw3Q4BWx8y4
        BtqaZVtSGmoCNqZAkHe1bNTmmGW/nQi3fRc6Ko04XTMF09nskECXKah6c29ISVz3qheQfZ
        0DSZL5ZbSi3q0sLT/bEsAyaDJJ0p0Y0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-7ABC3RzMPNq7ihVKZqwxgw-1; Sat, 10 Sep 2022 08:15:56 -0400
X-MC-Unique: 7ABC3RzMPNq7ihVKZqwxgw-1
Received: by mail-ed1-f70.google.com with SMTP id m3-20020a056402430300b004512f6268dbso1962261edc.23
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Sep 2022 05:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C3XG3bWpOKNJM325R8EQqcV36GlCcyEuoSsBI2lwREM=;
        b=i1C43E6C4b05Y5yZZkkMkR7zS41y1fnn0EFXrPfF8QyD8+7AuYY+aUs9oZdCNw2aux
         HVRhoR/Mp1onsIePru3+k/tDEmPwRvX6tKmAmVQQjYvtHKyFioYQiEMo0h1y8r7Vj8ol
         hDDhjcGEiPmJA29ggwKP6TBuRcO5lrEbVrOPVXo+8aCVrSwBQWU91/Pf7UPAySl4WTtG
         NRVHVPilnKe319WlWYjvB+VEmXc1UEDTEpRHQHWyoIveuKv431+KdA+ws1PyZJy8FWkw
         W5Tffh5n5+RTR8tM7oxiJV3MzYeaq9C//4noZThhzOvRt9nDIbWH2LFWKQcnUXSGpSRC
         8k4A==
X-Gm-Message-State: ACgBeo3bE8zhYu/yUAlWZMSoRr8/ZJCf0wsD3hFc3CStMwGy1xwIp2WR
        3LfpnLPox0CEj7BMJjqL7Z0/soBk/hLeOz1iD1jyOiGuCgtiK/HH3CKx+8qVBjjFzEr81uhARPm
        r2Tx1OJgOkdYH0WVKSDHLRBieAPiL7QYiQA==
X-Received: by 2002:a17:907:eaa:b0:772:b571:bd7c with SMTP id ho42-20020a1709070eaa00b00772b571bd7cmr9847993ejc.563.1662812155325;
        Sat, 10 Sep 2022 05:15:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4WSBP4WWW4oWowtBpuEMrXyobLfkfNIYvUXetarUBWVfMRio+J7qTQ4j3F4i7toj4q1TDRjw==
X-Received: by 2002:a17:907:eaa:b0:772:b571:bd7c with SMTP id ho42-20020a1709070eaa00b00772b571bd7cmr9847985ejc.563.1662812155175;
        Sat, 10 Sep 2022 05:15:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709064f8900b0073d84a321c8sm1596601eju.166.2022.09.10.05.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 05:15:54 -0700 (PDT)
Message-ID: <feaddc04-7274-24d2-57ef-850c502ba9eb@redhat.com>
Date:   Sat, 10 Sep 2022 14:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Make kbd_rgb_mode_groups statis
Content-Language: en-US
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220909210950.385398-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220909210950.385398-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 9/9/22 23:09, Hans de Goede wrote:
> kbd_rgb_mode_groups is only used inside asus-wmi.c, make it static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index d95170b7dba0..ae46af731de9 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -835,7 +835,7 @@ static const struct attribute_group kbd_rgb_state_group = {
>  	.attrs = kbd_rgb_state_attrs,
>  };
>  
> -const struct attribute_group *kbd_rgb_mode_groups[] = {
> +static const struct attribute_group *kbd_rgb_mode_groups[] = {
>  	NULL,
>  	NULL,
>  	NULL,

