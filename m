Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A56C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 15:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbjA3Pgp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbjA3Pgm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 10:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695D6C165
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675092958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J22bQo7ekUFPlpddDChM1+4GkBeFMomcqAM4Usr4RF8=;
        b=H9fHISDmoMNrw+A9amdFlUHIRARuoqigdrFxb8Jhv0Yo/9DlXWQ1RC9r14wJ9QQNiaFwpj
        9/o3PYTqzvxgyJNCski5BW643zr+7dZdl+nX29uTNCM2G7hO9lY6sY6ipZNgTKoY9YBuTm
        VieOI92Pkds0aJ6hKBpT6BSk74WozPU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-QT-xGc6ZOiWwZXQteuUvRQ-1; Mon, 30 Jan 2023 10:35:57 -0500
X-MC-Unique: QT-xGc6ZOiWwZXQteuUvRQ-1
Received: by mail-ej1-f69.google.com with SMTP id bj15-20020a170906b04f00b0088ac85a6fc1so913011ejb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J22bQo7ekUFPlpddDChM1+4GkBeFMomcqAM4Usr4RF8=;
        b=FDdGG/+wgjoDS8v806HJNpFsjFiHw80oq2jnYoAri+umS81e5yhlYJSCEtinkXqmED
         cg5gqiL6zovHztR+USxEWJHPF3NPCEr7tNOioNEi+4jV6bMvfY3AtUIdFE0wk8EPhXxv
         GzyLHDXoxIAh3w6OXVFTHJZXEV8xsCbm5/pd6+9GCpSUm6qkBsHBJDHZILxQIjX6FydB
         5qxaCYM+YpbojIYUQ85YrP5nBXHE50TgRjJ9bQoAh/CcpAVXP0Wugpud1FeZTNqjfhSn
         bk/qC+AmSoUAdWuKcEPnd+Kd0HSzJ8yQ7UguMCHpn8cNSJhzL+vEf+5CgHJlZ61kJb8V
         J7kA==
X-Gm-Message-State: AO0yUKVug6otvALdi23xISHMtfQ/Nwzi8TLCyBnnZDjQ6VrdLhyJLvZV
        AeNuT7KE2CdIYjKgyFYzBplg+DmjrEa7uhFCWsqQ9OfJSR+u8pt05BzLL6JdKv+YtmRj1yy3b1I
        QzaHwrzlzP0UxJo7An1vpWEkGfZaojV/7fg==
X-Received: by 2002:a17:906:6a01:b0:889:58bd:88a3 with SMTP id qw1-20020a1709066a0100b0088958bd88a3mr3959179ejc.68.1675092956013;
        Mon, 30 Jan 2023 07:35:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+vuk6aVI6Hzanw0RfJOx1sp1qcgF6NUmFvNme5r/+ylv8ryvmrDHuz1qarimzBs7muJ2+gog==
X-Received: by 2002:a17:906:6a01:b0:889:58bd:88a3 with SMTP id qw1-20020a1709066a0100b0088958bd88a3mr3959166ejc.68.1675092955791;
        Mon, 30 Jan 2023 07:35:55 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lj8-20020a170906f9c800b007c14ae38a80sm3288560ejb.122.2023.01.30.07.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:35:55 -0800 (PST)
Message-ID: <c78060ae-1fac-acd3-1963-9b1382cf6fd6@redhat.com>
Date:   Mon, 30 Jan 2023 16:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: think-lmi: Use min_t() for comparison and
 assignment
Content-Language: en-US
To:     Deepak R Varma <drv@mailo.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>
References: <Y9QupEMPFoZpWIiM@ubun2204.myguest.virtualbox.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9QupEMPFoZpWIiM@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/27/23 21:05, Deepak R Varma wrote:
> Simplify code by using min_t helper macro for logical evaluation
> and value assignment. Use the _t variant of min macro since the
> variable types are not same.
> This issue is identified by coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

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
>  drivers/platform/x86/think-lmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index a01a92769c1a..caa862506ed3 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -317,8 +317,8 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
>  		return -EIO;
>  	}
>  
> -	copy_size = obj->buffer.length < sizeof(struct tlmi_pwdcfg) ?
> -		obj->buffer.length : sizeof(struct tlmi_pwdcfg);
> +	copy_size = min_t(size_t, obj->buffer.length, sizeof(struct tlmi_pwdcfg));
> +
>  	memcpy(pwdcfg, obj->buffer.pointer, copy_size);
>  	kfree(obj);
>  

