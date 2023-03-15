Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB33FC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 12:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjCOMsF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 08:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjCOMsA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 08:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E1B28850
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678884369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HAOu6GreRWRu6ba4nX0ao5vFBWbgQLRTWPfGkR3xwgk=;
        b=eqbTPirTqlSegA8Owxd5Qomlv1crJeWmoxf89PBKPFSuqPzB+mBIQJYobFL+uasdLBCDfm
        5RSa5pZrE0BkhfWD0RyIrXG07EIWSqiYkuHtrlH5gFlnrw+FkzbiLrX8C7D7NBD8tuNHzf
        FrDP6tDf0e2LnI+q9qBQhTjRV9Wll+g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-NHlQjbZoP8WGRqF8XoYUSQ-1; Wed, 15 Mar 2023 08:46:05 -0400
X-MC-Unique: NHlQjbZoP8WGRqF8XoYUSQ-1
Received: by mail-ed1-f71.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso26656125edb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678884365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAOu6GreRWRu6ba4nX0ao5vFBWbgQLRTWPfGkR3xwgk=;
        b=f+LJv2OQIqSCRkP8Sp2L1hmuHxP4ZVNvUxYZVykzX3QGD4oVWC3cQQ3esloQfWTj8h
         rDx7xiNshGUss+rILZir2yJ87tNwcsd2CQYc6Q8DnmrkbI1/u+6qIJtSHBByZTG7ydYu
         cVfOkOazWo4Y5WJE703QMwvcxmh4JUhngYSK4KU1zGFmPAVxIL03NBxj+G74DTV4wj3J
         sG2AutpAHj1+r/PqwexAUBPMCM67uI3xaXz/0fFTQmpX1r1ymFpTwTuOuO3iOZErRZwP
         R10uGfWMo8nf769qT7mge0gApj+lFA6JHJBZxZCRv5iHsN7/EBdL5x0+sse0bF6A24Vy
         Kpmw==
X-Gm-Message-State: AO0yUKXG2KyM+8OZhBUlEI8EhAPHwx+ziHnqHH1VWkY73LTj4Cr6QB/8
        zwD86bqb5RNl8qTX1YPR/ueCH7kVHVdLlZL5GBPiavPMMrm3aiRtRZa2gxh1teCYBjhO1C64tAI
        /nR/FBCgITAroxfYGeKq+94tpZBdo9U6lOQ==
X-Received: by 2002:a17:906:1b09:b0:88e:e498:109b with SMTP id o9-20020a1709061b0900b0088ee498109bmr5920011ejg.5.1678884364966;
        Wed, 15 Mar 2023 05:46:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set8OEq3BFBrcLG8/KFs1ITZCvS/IL/+Swv1Lb8TgKsXIb/7EvmChXQfebSgll4X6Ay7VUbiI8A==
X-Received: by 2002:a17:906:1b09:b0:88e:e498:109b with SMTP id o9-20020a1709061b0900b0088ee498109bmr5919998ejg.5.1678884364753;
        Wed, 15 Mar 2023 05:46:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ga31-20020a1709070c1f00b008b904cb2bcdsm2514203ejc.11.2023.03.15.05.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 05:46:04 -0700 (PDT)
Message-ID: <8dde2c71-0c79-50af-e5aa-de3c9ee2955d@redhat.com>
Date:   Wed, 15 Mar 2023 13:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/36] platform/x86: ibm_rtl: move to use
 bus_get_dev_root()
Content-Language: en-US, nl
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
 <20230313182918.1312597-4-gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230313182918.1312597-4-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/13/23 19:28, Greg Kroah-Hartman wrote:
> Direct access to the struct bus_type dev_root pointer is going away soon
> so replace that with a call to bus_get_dev_root() instead, which is what
> it is there for.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Note, this is a patch that is a prepatory cleanup as part of a larger
> series of patches that is working on resolving some old driver core
> design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
> its own, but I'd prefer if I could take it through my driver-core tree
> so that the driver core changes can be taken through there for 6.4-rc1.

Taking this upstream through the driver-core tree is fine by me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>  drivers/platform/x86/ibm_rtl.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
> index 5fc665f7d9b3..2ab7d9ac542d 100644
> --- a/drivers/platform/x86/ibm_rtl.c
> +++ b/drivers/platform/x86/ibm_rtl.c
> @@ -199,16 +199,26 @@ static int rtl_setup_sysfs(void) {
>  
>  	ret = subsys_system_register(&rtl_subsys, NULL);
>  	if (!ret) {
> -		for (i = 0; rtl_attributes[i]; i ++)
> -			device_create_file(rtl_subsys.dev_root, rtl_attributes[i]);
> +		struct device *dev_root = bus_get_dev_root(&rtl_subsys);
> +
> +		if (dev_root) {
> +			for (i = 0; rtl_attributes[i]; i ++)
> +				device_create_file(dev_root, rtl_attributes[i]);
> +			put_device(dev_root);
> +		}
>  	}
>  	return ret;
>  }
>  
>  static void rtl_teardown_sysfs(void) {
> +	struct device *dev_root = bus_get_dev_root(&rtl_subsys);
>  	int i;
> -	for (i = 0; rtl_attributes[i]; i ++)
> -		device_remove_file(rtl_subsys.dev_root, rtl_attributes[i]);
> +
> +	if (dev_root) {
> +		for (i = 0; rtl_attributes[i]; i ++)
> +			device_remove_file(dev_root, rtl_attributes[i]);
> +		put_device(dev_root);
> +	}
>  	bus_unregister(&rtl_subsys);
>  }
>  

