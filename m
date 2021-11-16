Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9814FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 09:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CDDE63222
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 09:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhKPKBO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 05:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25849 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233434AbhKPKBL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 05:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637056694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=umA4f+vJW0zyTGsWrJBUN9j1q7sKdThBrgx1FzBDGv0=;
        b=hOf7u6MNgs6VmDUlOdAxVdmuP/RJGARmLuqd7VLExI4WpwkkM7RYA1CyAfDYJk4PAe6XzJ
        Cc20eHoOr32w7r+ONzcdOPQ9dNDmLFb1y8WpkO1vPUSmO7oTrXbtMPtryupRNgXWQhZrk3
        yYy+OVXfTLnthIY8Z6zoPttZ7u64Qno=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-CG0aqg-VM-aWP80N1D0-GQ-1; Tue, 16 Nov 2021 04:58:12 -0500
X-MC-Unique: CG0aqg-VM-aWP80N1D0-GQ-1
Received: by mail-ed1-f72.google.com with SMTP id v22-20020a50a456000000b003e7cbfe3dfeso4540389edb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 01:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=umA4f+vJW0zyTGsWrJBUN9j1q7sKdThBrgx1FzBDGv0=;
        b=IfksMCIkKLfV8GQC+gyht506RfTspxnYxjib9DdYc4aMOU1GXGNrbTlcNL4Y4fAmTi
         GELGf/PPiSVuXqS84aaGPyF0I4pgYHL+rLVxZaVCa+JdvXofCO360lbCyyELS23rjrbs
         ss7TCHJrXlFoAs7kUIzghyjy5LLABY1CCVSEoySa9CFvpBK+iDWXXFnaA7Qh4G1aKLIC
         wWm1j3vWIid7xleLjI1QFlRGRpmQBUTScbxrpsGukVzfMVTzVYgbv0iuAbFYAbvSOSAO
         mB13s/S0zcgrboiF/uCGUltJ/xQl6RBall6QNf3FGbB5XHpaZz5ewsMsEhHOgbJQl6M2
         zDQA==
X-Gm-Message-State: AOAM530D1oTa+owjKpot2hD3x17p0NYvkX5vvklMxmY4Sm+TEcNDIh2e
        GRgLgWZsssE88Teqz3raTCktMNhsBJsZ8VoG+KsAil+7xF/I6aG9X8jIyz4hWcYiUxz813K9ovc
        gpFlAxzN072fPg32zVPDtctn1LnMlNGyd9A==
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr8126323ejy.127.1637056691205;
        Tue, 16 Nov 2021 01:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze1x4oh8Tr55x5uOf6rXfHjA4u3JukbOVstW3waT/M4djmyJB4ls5QQXUf666jJk02I+nw4Q==
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr8126300ejy.127.1637056691067;
        Tue, 16 Nov 2021 01:58:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f17sm4156745edq.39.2021.11.16.01.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 01:58:10 -0800 (PST)
Message-ID: <ca1cd8a1-f584-854e-23a5-546392c92d5a@redhat.com>
Date:   Tue, 16 Nov 2021 10:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: samsung-laptop: Fix typo in a comment
Content-Language: en-US
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211113054827.199517-1-wangborong@cdjrlc.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211113054827.199517-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/13/21 06:48, Jason Wang wrote:
> The double `it' is repeated in a comment, therefore one of them
> is removed.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

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
>  drivers/platform/x86/samsung-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 7ee010aa740a..c1d9ed9b7b67 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -152,7 +152,7 @@ struct sabi_config {
>  
>  static const struct sabi_config sabi_configs[] = {
>  	{
> -		/* I don't know if it is really 2, but it it is
> +		/* I don't know if it is really 2, but it is
>  		 * less than 3 anyway */
>  		.sabi_version = 2,
>  
> 

