Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B16FC388F7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99E16208C3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 02:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRpjgC0p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgJ2CFo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45674 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727075AbgJ1ViJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 17:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603921087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=owogxmBr7QuhqX/b8Py2A65XM1g5vYCHcWlpezJSNeE=;
        b=SRpjgC0pyfxqJ4X5aYdY8qMSuLfIT0ZpKrVS6iSWorVYpNZ++dQSodoxz0bgm1SE4dkGFs
        OGQzS0zIR76B8B90OPSN86cwG4sPcAd0xIlcpmZWx2fywWjdpJkI8QM7Eu9AUfPjPgNIx3
        R6RkMmBh846Tf893fqZvgjm7MDum2w0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-4GuvL3mCM6eDr1IfKSON8A-1; Wed, 28 Oct 2020 07:36:20 -0400
X-MC-Unique: 4GuvL3mCM6eDr1IfKSON8A-1
Received: by mail-ej1-f71.google.com with SMTP id b17so2020945ejb.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 04:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=owogxmBr7QuhqX/b8Py2A65XM1g5vYCHcWlpezJSNeE=;
        b=tW40aYQOt9BAT9LSgqI3mVDfIMbGR9Dfdkotq5/p04pFrNfMs+j1ARxhv0TUr7QnB9
         HYbhsJrPM3t6Oxq22uxy7a/bjkZf2Uyl3lI6F5TdpXhg7XT46LfOeWiX85zch1hsj8cd
         be3ZWpJ5q57z6m6/TIneBRXH+LqIP/GaiW0iJPZS71e9dkahpetOZ8LbSUGQcH2XqbRz
         BxWcxy5wqoEucvscGQL9gVcIHDq3YgkMLy1OywWhvziiR0QB3BcYvfox2zYbHkTaPJuM
         F78oNRGkIfA5XJDuPi4RwSlSnNPqCCoxSn3+5Neq9DfUJCKxYngcYnpNkX74Yow6/21+
         DSAQ==
X-Gm-Message-State: AOAM530ftRTDQbfnmGOgtIkAX2wLuVJRMYqDhgnHj8LfvKeKo8S4RUaN
        qVY7d+yT5WHlP4wK5RbYoysdPVbCVBnYbbIBh+7/2BgfTueC0ajRk5aBEnSpNTW/SDqqKXc0c5r
        Jcxxfu76ggjNgu6U2gaTZ2YG/5Vmy6Bawvg==
X-Received: by 2002:a17:906:51d0:: with SMTP id v16mr7076091ejk.493.1603884978260;
        Wed, 28 Oct 2020 04:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn8sRv92ZDdL/G9o60WRA/8oC3PDynaDEiRvZtrwNFux+cIJi6c/LIIstqvPFWWVeIjffxnw==
X-Received: by 2002:a17:906:51d0:: with SMTP id v16mr7076046ejk.493.1603884977738;
        Wed, 28 Oct 2020 04:36:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id o11sm2821520ejd.60.2020.10.28.04.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:36:17 -0700 (PDT)
Subject: Re: [PATCH -next] platform/x86: wmi: discard unnecessary breaks
To:     Zhang Qilong <zhangqilong3@huawei.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20201027135302.72354-1-zhangqilong3@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d70fb286-889e-aec7-6ab5-371af8a5ddf2@redhat.com>
Date:   Wed, 28 Oct 2020 12:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027135302.72354-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/27/20 2:53 PM, Zhang Qilong wrote:
> The 'break' is unnecessary because of previous 'return',
> and we could discard it.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Thank you for your patch. A patch making the same changes
was already submitted a bit earlier and has been accepted:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=619821936203f0577aa88cf30d31b0202650a745

So I'm dropping this patch, as this has already been
fixed / cleaned up.

Regards,

Hans


> ---
>  drivers/platform/x86/wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index d88f388a3450..cbf38abd40be 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1260,13 +1260,13 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
>  	switch (result) {
>  	case -EINVAL:
>  		return AE_BAD_PARAMETER;
> -		break;
> +
>  	case -ENODEV:
>  		return AE_NOT_FOUND;
> -		break;
> +
>  	case -ETIME:
>  		return AE_TIME;
> -		break;
> +
>  	default:
>  		return AE_OK;
>  	}
> 

