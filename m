Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F5ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiHZLPe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344318AbiHZLPc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678B7D86EC
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661512527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ndEnXn9hKIZNqomCfZzqEW1B4vzzluR0TyiraykxJIo=;
        b=X7CtQHfPcIGD3NZb4i+4YtzrWXBRutDPIMiGHZyy7VUZXXiQXA70ZpXzE9nj0LILczf6ym
        oXbybiGMUDHx9OY0JMnJm9AMkzTRRnmuf6SVhHxPyFAaWA46NxVO75AiWDE6MyjuRp8WuE
        IEFPqFtlZjuz/wkR7tIECXa/sQFa9SI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-Wfai_WmVNqip6w1GThhjTw-1; Fri, 26 Aug 2022 07:15:26 -0400
X-MC-Unique: Wfai_WmVNqip6w1GThhjTw-1
Received: by mail-ej1-f71.google.com with SMTP id sd6-20020a1709076e0600b0073315809fb5so493684ejc.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ndEnXn9hKIZNqomCfZzqEW1B4vzzluR0TyiraykxJIo=;
        b=KtLkE66JwOK6E86GjgE7iFnPVOHfNbhO0RevxiKjK7Bg07vkYq8/ojqEv6mZ/Txgcy
         UOpqkokQmSim+Fjq5jRnHjoSUVRZmrE6Y1pbBujMt39s5nQas599/jaNME4xeuWWJzxW
         NCGKFet483WASexJnvLnxS27esnrdf7niWYfiYlOFNoY54IypajooOWHqiUAFlHy5czw
         Z5Zz/sM7YVY/4E3zWR60p8RNKib9bm1n1LZysA6pQSDCJeOufxh05AL/7fOyivVTdZOU
         iBJ5/Ye8U7PIp4QdA9D1b1Gtb+KhA0LHLuAEesUUJqLA4ZwTJ7mediRNR5YoFmeDYV4Q
         UNlg==
X-Gm-Message-State: ACgBeo11W/K87WhALL4nZ0ajuJAk9dOqQD7OtCCCei+J6FKxovDy7+Fx
        pIrqsPo6joCuM1zKaS0inNc4k46b9Tmjlj/meZxR2FJzUBsPWKXdaNVxPz/vSRWicyxWrgaWtED
        L6aiwRSkDxU17LkyDo6AUU0sb9t+DbeH6hQ==
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id ww10-20020a170907084a00b0073307352b1amr5082567ejb.290.1661512524609;
        Fri, 26 Aug 2022 04:15:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6w3tZquXyIaMdW6NITygFFwKRfQ2P+uBjCf5tIRwE1caO2dR8zZTUquQDLuojl3Yp6trLk2g==
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id ww10-20020a170907084a00b0073307352b1amr5082554ejb.290.1661512524364;
        Fri, 26 Aug 2022 04:15:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b00731745a7e62sm779559ejg.28.2022.08.26.04.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:15:18 -0700 (PDT)
Message-ID: <8e484dd1-5286-acfb-d5ed-bdf53b60e551@redhat.com>
Date:   Fri, 26 Aug 2022 13:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] platform/x86: msi-laptop: Use MODULE_DEVICE_TABLE()
Content-Language: en-US
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220822150818.45765-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220822150818.45765-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/22 17:08, Hans de Goede wrote:
> Use MODULE_DEVICE_TABLE() instead of manually adding a bunch of
> MODULE_ALIAS() statements.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/msi-laptop.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 24ffc8e2d2d1..843f72200cfc 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -705,6 +705,7 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(dmi, msi_dmi_table);
>  
>  static int rfkill_bluetooth_set(void *data, bool blocked)
>  {
> @@ -1166,14 +1167,3 @@ MODULE_AUTHOR("Lennart Poettering");
>  MODULE_DESCRIPTION("MSI Laptop Support");
>  MODULE_VERSION(MSI_DRIVER_VERSION);
>  MODULE_LICENSE("GPL");
> -
> -MODULE_ALIAS("dmi:*:svnMICRO-STARINT'LCO.,LTD:pnMS-1013:pvr0131*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
> -MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1058:pvr0581:rvnMSI:rnMS-1058:*:ct10:*");
> -MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1412:*:rvnMSI:rnMS-1412:*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
> -MODULE_ALIAS("dmi:*:svnNOTEBOOK:pnSAM2000:pvr0131*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
> -MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N034:*");
> -MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
> -MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
> -MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
> -MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
> -MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnU90/U100:*");

