Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5825AC0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 13:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGYNd2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 09:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjGYNd1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 09:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56161BE9
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690291953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6mJcweRxAGjMIv21AfvYfBxHuO/KykVgbwGUpkQfNek=;
        b=b2ao0MiFX0nAiKQadMsL0JEBLn+ZzODbGAnCogvyzW8nLBz/CBfqqkHiIV/FZx+ddqvHtl
        js2NvMURV924MwNpaoe4LR4LOcJ9Q/26PESwYaXO+rVr4vbRHJKNfC5DSme7gHwb4WR6y0
        Lg+KvbKCDVUtFe6z0pt63DA+iX8M+D8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-nfz30MKiOCC7i3iF1jdrBQ-1; Tue, 25 Jul 2023 09:32:32 -0400
X-MC-Unique: nfz30MKiOCC7i3iF1jdrBQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9932e8e76b9so471681166b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291951; x=1690896751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mJcweRxAGjMIv21AfvYfBxHuO/KykVgbwGUpkQfNek=;
        b=c/A19XTCUDqsdY6sjwbdfvup8xy4pDnlXqVQ3oqojh05O98hTNFYvaO4xvKhMujws8
         V4YOX/OXUrK8El7T7o8zSeFxWK5MLsZlzbYAXav2JO3xmtPH+n8RaS91jsNqpPLYidd2
         ShLm/piWLYT5R51OEd0dloxqbDmGpGOIrKiSivEXB1Hq7MhEo5nR6jiDrWASe46Ys1YP
         Hl3Fp7CShSeO22bRKd8s2vg3cjLrUp1rVVOnvtJ1RF1/ksDGpHiETAo92e0r30EuRmMt
         xgKOJ8EUuXTs4HtxZvCahokzXg9CIkmjooegUzY6zc9wOCVQFmAX06397qGXppfGlJBv
         gFKg==
X-Gm-Message-State: ABy/qLYn/UnjnkOUevglrD2AMYMVlASMsAee97x+yQpP4TtvQcpuO2y3
        VhIyENCQ2Ghn7YNTxPwhHDpRpZ9qh9dSkTDOMTK6+IuLcrgUl5wxBH6aWbDbpIkHqBddl7dZFGx
        F3otIeIoEyVqNWlKRyO1KMMUWLZlDy6Kcpg==
X-Received: by 2002:a05:6402:388:b0:522:4505:85db with SMTP id o8-20020a056402038800b00522450585dbmr2300683edv.4.1690291950953;
        Tue, 25 Jul 2023 06:32:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGGOp+OYCUd3KakOEB29dRVn82/XzbgbOYkXcBp1EreCJwFIm+Hb+JBShYYNQQ1tDMaRTaktA==
X-Received: by 2002:a05:6402:388:b0:522:4505:85db with SMTP id o8-20020a056402038800b00522450585dbmr2300668edv.4.1690291950688;
        Tue, 25 Jul 2023 06:32:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d19-20020a056402079300b0051ff2b6139esm1329027edy.5.2023.07.25.06.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:32:30 -0700 (PDT)
Message-ID: <19f2c248-155b-2501-f2db-27f0f9a21332@redhat.com>
Date:   Tue, 25 Jul 2023 15:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] platform: x86: Use kfree_sensitive instead of kfree
Content-Language: en-US, nl
To:     Wang Ming <machel@vivo.com>, Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
References: <20230717101114.18966-1-machel@vivo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230717101114.18966-1-machel@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/23 12:11, Wang Ming wrote:
> key might contain private part of the key, so better use
> kfree_sensitive to free it.
> 
> Signed-off-by: Wang Ming <machel@vivo.com>

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
>  drivers/platform/x86/think-lmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 52d1ce8dfe44..79346881cadb 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -719,12 +719,12 @@ static ssize_t cert_to_password_store(struct kobject *kobj,
>  	/* Format: 'Password,Signature' */
>  	auth_str = kasprintf(GFP_KERNEL, "%s,%s", passwd, setting->signature);
>  	if (!auth_str) {
> -		kfree(passwd);
> +		kfree_sensitive(passwd);
>  		return -ENOMEM;
>  	}
>  	ret = tlmi_simple_call(LENOVO_CERT_TO_PASSWORD_GUID, auth_str);
>  	kfree(auth_str);
> -	kfree(passwd);
> +	kfree_sensitive(passwd);
>  
>  	return ret ?: count;
>  }

