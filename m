Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1BDC4743D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8557E613E4
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFDT5T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 15:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39966 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229854AbhFDT5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 15:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622836532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eOQjbvHyhGd6WG9MDy2/G4j71/nqPFcmfqkuSdBKJUA=;
        b=QM0oYRkZ0T07OPr0R9tJUmgTyNzGLvzSDJNAoVNQJkrYHkEfoI2nNIMPM4Enw2P1DBejKy
        sggy7MSiwdB2cjvWKqBWCj20zTpl3VZkQkqKRvnG2UpYMTfZFgHT/ImdHFWp3KgBxJ8GcG
        f0fDOXSQ5PBAXhQE7Lx3mU58/x7TXxA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-0ROtgsPCP-ujO02vBNh65w-1; Fri, 04 Jun 2021 15:55:30 -0400
X-MC-Unique: 0ROtgsPCP-ujO02vBNh65w-1
Received: by mail-ej1-f70.google.com with SMTP id j16-20020a1709062a10b02903ba544485d0so3924618eje.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Jun 2021 12:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eOQjbvHyhGd6WG9MDy2/G4j71/nqPFcmfqkuSdBKJUA=;
        b=LTGIMK4cOjVoeXst6+oFaPEmB15XraQMfJlCr+BIU9TCM3FhV2dnqxaXugQ0qeWOOQ
         7eopNGduu1p2C+tVtH3YFpYyZI4lTx2KgHxKXJaFuCWYfhDzzpcP1DdfsGgHOwZnAT8m
         Lj+4Pyd7236D3rRoV0hwaHDyIjXHKMOevNRzExpadCwSrL9fbGG32XTmgJMQqTqvn7Np
         9ihi0f3MAZNN0ex4ud/oLDEvBtHLmffYAXOzfs0aOSrdsOUYkVKf0rS4w/6FXsuvlPQT
         8N+7XOkXabUNmdTE2tfGJDEi44HBp33PMXPRHLK47RV1utEV0cOyppQhAeej+uNPo4G/
         3LKw==
X-Gm-Message-State: AOAM532RrD+4ZVCSiXg0efrvbP3nvSRhqld4wBXTpgaabRNBXS5OayNN
        7IOTqlqn4ICMm+kliUfxEAwvGglOEXnrM8afBPjvAEMgcB+Jf/J4Aw6ShZzcRsKjiQc/5S5/EC6
        nQZJN/1qqy9iJpVDlNKy17sJChIaDmXUcKA==
X-Received: by 2002:a17:906:5f93:: with SMTP id a19mr5841429eju.18.1622836529750;
        Fri, 04 Jun 2021 12:55:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYFojd2XiYJIbqlj043otrR+6rOCaFIBRrifvbVCHI3Cm+b47tycfV1G8TtBfdrb8+yhWTUg==
X-Received: by 2002:a17:906:5f93:: with SMTP id a19mr5841423eju.18.1622836529559;
        Fri, 04 Jun 2021 12:55:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o21sm3117522ejh.57.2021.06.04.12.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 12:55:29 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_ips: remove unused val in read_mgtv
To:     yangerkun <yangerkun@huawei.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, yukuai3@huawei.com
References: <20210604081414.3701730-1-yangerkun@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bf848826-b8d3-5d1f-1ae0-8d52750d2676@redhat.com>
Date:   Fri, 4 Jun 2021 21:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604081414.3701730-1-yangerkun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/21 10:14 AM, yangerkun wrote:
> drivers/platform/x86/intel_ips.c:832:6: warning: variable â€˜retâ€™ set but
> not used [-Wunused-but-set-variable]
>   832 |  u16 ret;
>       |      ^~~
> 
> Fix it by remove the define.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  drivers/platform/x86/intel_ips.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index bffe548187ee..d40a00ba859a 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -829,19 +829,8 @@ static u16 calc_avg_temp(struct ips_driver *ips, u16 *array)
>  
>  static u16 read_mgtv(struct ips_driver *ips)
>  {
> -	u16 ret;
> -	u64 slope, offset;
> -	u64 val;
> -
> -	val = thm_readq(THM_MGTV);
> -	val = (val & TV_MASK) >> TV_SHIFT;
> -
> -	slope = offset = thm_readw(THM_MGTA);
> -	slope = (slope & MGTA_SLOPE_MASK) >> MGTA_SLOPE_SHIFT;
> -	offset = offset & MGTA_OFFSET_MASK;
> -
> -	ret = ((val * slope + 0x40) >> 7) + offset;
> -
> +	thm_readq(THM_MGTV);
> +	thm_readw(THM_MGTA);
>  	return 0; /* MCH temp reporting buggy */
>  }
>  
> 


I believe it would be good to keep the code around to document how
the temperature can be calculated.

Please submit a patch marking ret as __maybe_unused instead.

Regards,

Hans

