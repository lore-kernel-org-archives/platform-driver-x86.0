Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5602C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 17:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240743AbhLURzU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 12:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240738AbhLURzT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 12:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640109318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3YXqeevPDP+1UBV9Ug2JRSO8S/GdwQP1zLi0i9nvgv4=;
        b=G5O5jfUvVEaX12qPZzX0C20hqpUvD6hQMjm/KaffHH1arcnvBzdk0Arm+uHML4QFrnPlB6
        pehNABdPVxqdCwnKzoCI+LbsEDAmaiFYowGp6UVCZksveAZA6TGWldndpp7YvCNGt2M+pz
        8SjDInbg/ykno6EkDIisxJsZ14eoSRQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-aQ8QW0qbM0u1hD-y_4ZCIw-1; Tue, 21 Dec 2021 12:55:17 -0500
X-MC-Unique: aQ8QW0qbM0u1hD-y_4ZCIw-1
Received: by mail-ed1-f69.google.com with SMTP id ay24-20020a056402203800b003f8491e499eso6344795edb.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 09:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3YXqeevPDP+1UBV9Ug2JRSO8S/GdwQP1zLi0i9nvgv4=;
        b=p0Jxr7wOwFFfc9Q4CXSE7e/Cy5NfMPbT3mjwYk4r8AWe/oCDqnlBb+5xbCgl/kk5dC
         PCzv0704ORP93w456cQ2Sbj1TeexTGcRc3o+w9ce+tcEGWPYJGIHu1UpnmiyztoIrDsW
         LQs+oVS93d1uXsaXQTXEz4fJ9wrXEGtMoRgsBnd2h86PwsXYrRAXkYfx/Kkep5wIMkGs
         U8A1sxdCU52AQCbuiTRU8wVUbJAir7u31wisLhTWIEjJBeZJLn4YT0gnsnQ9ISqSkmiz
         8rTFAUMvsoXpPmxD/qIa8MkJeicrcJshYK7CkrLgN5kyQAw0tejFEmhUYzquPT3ow0HV
         IQvA==
X-Gm-Message-State: AOAM533L8J/QpJc+O6CIUavmGKNIEWPhVsPqFeoB0aOogceVZIB2KnLq
        lb1tsgawrEshHdnvHlduRYTqnVvaez4Jfh337MjEgeelWnSLG4VzNOjlDKCFDDnw2hQVUljtegC
        10oFKxcJ4ev5FUsCyDiE+Y5gNnOOsb7SvoA==
X-Received: by 2002:a17:906:4791:: with SMTP id cw17mr3628954ejc.493.1640109316431;
        Tue, 21 Dec 2021 09:55:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhnjbZGpEfw35mdVtyznmcec6Y6z3XDoARgDffbwJy9dlBGOtX35DazYuz05u65b4NohlByw==
X-Received: by 2002:a17:906:4791:: with SMTP id cw17mr3628948ejc.493.1640109316280;
        Tue, 21 Dec 2021 09:55:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c30sm956098ejj.190.2021.12.21.09.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 09:55:15 -0800 (PST)
Message-ID: <3d99e6ad-bf81-43b4-9970-b91aa78b44e6@redhat.com>
Date:   Tue, 21 Dec 2021 18:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform: x86: use resource_size() with res
Content-Language: en-US
To:     Qing Wang <wangqing@vivo.com>, Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1639484316-75873-1-git-send-email-wangqing@vivo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1639484316-75873-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/14/21 13:18, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> This should be (res->end - res->start + 1) here actually,
> use resource_size() derectly.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 9aae45a..57553f9
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -625,7 +625,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	}
>  
>  	gmux_data->iostart = res->start;
> -	gmux_data->iolen = res->end - res->start;
> +	gmux_data->iolen = resource_size(res);
>  
>  	if (gmux_data->iolen < GMUX_MIN_IO_LEN) {
>  		pr_err("gmux I/O region too small (%lu < %u)\n",
> 

