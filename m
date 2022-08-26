Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0639FECAAA3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242754AbiHZLSE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238911AbiHZLSB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B8ADABBE
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661512679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/nReW7MFi4tAPYyF4Dftuh5gkRVr0q08S+Kfw0vVOvs=;
        b=SnSgkjz2UP/aYuYSpSYBednYd0Zv7h8pQ6tXpjsVO/G00VmblmkT9BOCy7Utn9wsIhjC7P
        n5H/Vg2GtRf9v5Nuk35b0EU88agZ1W0t6K53HB0jEWVfgyr8F31GKffiONElOHd3hYwjmt
        j+U+gMsqig6Ih6sm8rYStIYnVMd7slA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-narbuC6AMhmdrR0jnACfOQ-1; Fri, 26 Aug 2022 07:17:58 -0400
X-MC-Unique: narbuC6AMhmdrR0jnACfOQ-1
Received: by mail-ej1-f71.google.com with SMTP id js11-20020a17090797cb00b00730d73eac83so492348ejc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/nReW7MFi4tAPYyF4Dftuh5gkRVr0q08S+Kfw0vVOvs=;
        b=Jeg2U0WkD09UF0StYXlMLFLIVhkj+7UxUmq55jnXFqzz7SGiibUHMCBTWqJ1O1s8vG
         eUtYkawJE2Vwg1g3Da10bu7EiKE18luvClQ4/4ZwHuCMB6pn/c4yk/SIBJXEeP2hwnLJ
         7IRjOyECe1OrRiuVXDRD9uZRuIf7+ymjsOkARfTjOUzDLaCGgmVMhCxIPjc74JCaN+p0
         5zqpahVXL6PkTVJEyfcWxyS84G16f+02i2VES6BUHyPlJZhUGIrUJd2PE5yc2T/sgixs
         aSr5NCISmLio26ly4c7N8PkarJoBcShllVupa8jj2fobMUlEiBqvLt8it7RqgZaBtf5x
         5h8g==
X-Gm-Message-State: ACgBeo0cOosoGAZUo+WmzVz8zPxAh8of/mDwBNXpZ3sR+GlNvQlmBqbt
        UP0XiPaC8fq8sD21QU38rUXZmevGvJUUx9mkHrx9mQUFdyxggUMSiD4WBeKKmV7emyePBTxGXMg
        DyBA9TX1J5Td/IkE5lcQy06pY1QoAyYX5WA==
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id sb19-20020a1709076d9300b0073d85939608mr5328932ejc.203.1661512677191;
        Fri, 26 Aug 2022 04:17:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58wjduTukqfovhxwv4LJwlwW+/W5xp47cPOM2p+hI5C0QP+Sg6JWYM5dzJf80wM7CP9ArZCA==
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id sb19-20020a1709076d9300b0073d85939608mr5328921ejc.203.1661512676929;
        Fri, 26 Aug 2022 04:17:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id og5-20020a1709071dc500b0073dd7e3947csm779396ejc.98.2022.08.26.04.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:17:55 -0700 (PDT)
Message-ID: <56ab953d-523e-8048-6e9c-aebce0ce4b67@redhat.com>
Date:   Fri, 26 Aug 2022 13:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] platform/x86: msi-laptop: Add msi_scm_model_exit()
 helper
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220826111453.178962-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220826111453.178962-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/26/22 13:14, Hans de Goede wrote:
> The probe-error-exit and remove paths both duplicate the exact same code
> to undo load_scm_model_init(). Add a helper for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/msi-laptop.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 5d4b10b8d771..74829f766b88 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -1014,9 +1014,19 @@ static int __init load_scm_model_init(struct platform_device *sdev)
>  	rfkill_cleanup();
>  
>  fail_rfkill:
> -
>  	return result;
> +}
> +
> +static void msi_scm_model_exit(void)
> +{
> +	if (!quirks->load_scm_model)
> +		return;
>  
> +	i8042_remove_filter(msi_laptop_i8042_filter);
> +	cancel_delayed_work_sync(&msi_touchpad_dwork);
> +	input_unregister_device(msi_laptop_input_dev);
> +	cancel_delayed_work_sync(&msi_rfkill_dwork);
> +	rfkill_cleanup();
>  }
>  
>  static int __init msi_init(void)
> @@ -1104,13 +1114,7 @@ static int __init msi_init(void)
>  fail_create_attr:
>  	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
>  fail_create_group:
> -	if (quirks->load_scm_model) {
> -		i8042_remove_filter(msi_laptop_i8042_filter);
> -		cancel_delayed_work_sync(&msi_touchpad_dwork);
> -		input_unregister_device(msi_laptop_input_dev);
> -		cancel_delayed_work_sync(&msi_rfkill_dwork);
> -		rfkill_cleanup();
> -	}
> +	msi_scm_model_exit();
>  fail_scm_model_init:
>  	platform_device_del(msipf_device);
>  fail_device_add:
> @@ -1125,14 +1129,7 @@ static int __init msi_init(void)
>  
>  static void __exit msi_cleanup(void)
>  {
> -	if (quirks->load_scm_model) {
> -		i8042_remove_filter(msi_laptop_i8042_filter);
> -		cancel_delayed_work_sync(&msi_touchpad_dwork);
> -		input_unregister_device(msi_laptop_input_dev);
> -		cancel_delayed_work_sync(&msi_rfkill_dwork);
> -		rfkill_cleanup();
> -	}
> -
> +	msi_scm_model_exit();
>  	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
>  	if (!quirks->old_ec_model && threeg_exists)
>  		device_remove_file(&msipf_device->dev, &dev_attr_threeg);

