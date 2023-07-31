Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188BFC001DE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jul 2023 14:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjGaOKk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjGaOKf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 10:10:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30711712
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690812589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l+Mv5r6t8pSNTy6u7u7r06N3KDg61cGhEe9E1jY0jkI=;
        b=TaFaaefEG730zFiy3dqj2nfgOZnflX2i7jJHYrbg9ZHW8dM4AWB5zahFUvyp8mMVb0Oxwh
        fYa2jifriheGP7nTMNXHQJ8qMo0MYZNFmC5GYIXzYZlD5ZkzovbXS8m+Vs/L5E/ubzuyuF
        MOZchNqHsE88853zGZMZjnHvvEpiGSU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-jppR5FS5NbizDJEQwuaRMg-1; Mon, 31 Jul 2023 10:09:48 -0400
X-MC-Unique: jppR5FS5NbizDJEQwuaRMg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7623d5cb0caso465096485a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812587; x=1691417387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+Mv5r6t8pSNTy6u7u7r06N3KDg61cGhEe9E1jY0jkI=;
        b=hEZbctbKPL9Zjsa/3WnMrflzHxdmpBQf3dXhLoVTou57ELmL/bFs5y6VOMRs27rCjJ
         gpgtcMAyTpMbR/V0Qo/jC5rZfS97JDhEQbakIeCJOi3Kau1nShxUlffzKGYlqRtXj4mM
         3tLgD8ha+LthRgETYbAe1YmbAxQZG24GrwyTrhXx1TYo4Ivi0ZBV25HF2IauG/5EkRoG
         BIYKeVXmpVvE1evCvFGa9zCHjQKWKNm8p1TlVRfhHfqMTq8WMkso/iI7GDxIjI03zm0C
         JgE+um3Ghs4nZFmmIST+M6M679SvCqaj2uxoCPftA0i6aB8A0lCT+kB4Bchupz2SSiJ2
         eA7Q==
X-Gm-Message-State: ABy/qLZPNNqY3DWg2cACh/4vzRQfijqN23QImz14t3rPnVIVn8dGRT7i
        Ojm8Xsi0wWj7IlFVhw6wTos00+wqm9Ogz9XbHFu365RJUdIH29OKnHPvYqG5o4KQrypheZ8XnP0
        kRHxBwnvKLhoY7jOYKVBHwkOngps8bKtvD3lXCoT9wg==
X-Received: by 2002:a05:620a:4727:b0:765:3e81:e74c with SMTP id bs39-20020a05620a472700b007653e81e74cmr11407596qkb.21.1690812587625;
        Mon, 31 Jul 2023 07:09:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHIB/WwtEub8ysCiYcNlnMAPnvf2FYgsJFgo7Z+WgYzFftVBdtNg6b6tXRvs2eiCYRKYRnpNA==
X-Received: by 2002:a05:620a:4727:b0:765:3e81:e74c with SMTP id bs39-20020a05620a472700b007653e81e74cmr11407577qkb.21.1690812587414;
        Mon, 31 Jul 2023 07:09:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 22-20020a05620a06d600b00767ceac979asm3318877qky.42.2023.07.31.07.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:09:40 -0700 (PDT)
Message-ID: <7a28e9aa-46a1-e072-2101-5392cd21a5f0@redhat.com>
Date:   Mon, 31 Jul 2023 16:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] platform/x86: wmi-bmof: Use
 device_create_bin_file()
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org, thomas@t-8ch.de
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230730204550.3402-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230730204550.3402-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/30/23 22:45, Armin Wolf wrote:
> Use device_create_bin_file() instead of sysfs_create_bin_file()
> to avoid having to access the device kobject.
> 
> Tested on a ASUS PRIME B650-PLUS.
> 
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Changes since v1:
> - add Reviewed-by and Tested-by tags
> ---
>  drivers/platform/x86/wmi-bmof.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index 80137afb9753..d0516cacfcb5 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -75,7 +75,7 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
>  	priv->bmof_bin_attr.read = read_bmof;
>  	priv->bmof_bin_attr.size = priv->bmofdata->buffer.length;
> 
> -	ret = sysfs_create_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
> +	ret = device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);
>  	if (ret)
>  		goto err_free;
> 
> @@ -90,7 +90,7 @@ static void wmi_bmof_remove(struct wmi_device *wdev)
>  {
>  	struct bmof_priv *priv = dev_get_drvdata(&wdev->dev);
> 
> -	sysfs_remove_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
> +	device_remove_bin_file(&wdev->dev, &priv->bmof_bin_attr);
>  	kfree(priv->bmofdata);
>  }
> 
> --
> 2.39.2
> 

