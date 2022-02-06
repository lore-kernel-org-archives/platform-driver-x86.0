Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6A9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 19:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiBFTRQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 14:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbiBFTRO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 14:17:14 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 11:17:13 PST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78506C043185
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 11:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644175032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yTCmG7U1pOis5moCRYXn9g7xRYiDY9ccJQ7ulp+zM9U=;
        b=HPAxZQjqXd5IMuq30ffwt+UN75GWIZDbQXDMPLS1K51kTuQZfUh85uaQI34F2vOIcLLP20
        fHgG9KNbyDFLFl4COvX6sWNFOK+Qfg+C6PLe1GOW9yEZL9OXwbpbhyYJesVTjvDz9yLP6H
        kmJdmHrQUBQiVc5YCHuOWoYiqNEil2I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-LIrjftA1OB-HA9_UoRCheg-1; Sun, 06 Feb 2022 14:10:39 -0500
X-MC-Unique: LIrjftA1OB-HA9_UoRCheg-1
Received: by mail-ed1-f71.google.com with SMTP id m4-20020a50cc04000000b0040edb9d147cso5579282edi.15
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Feb 2022 11:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yTCmG7U1pOis5moCRYXn9g7xRYiDY9ccJQ7ulp+zM9U=;
        b=zWffZxPJdoObenZL+Yu5dLVgww5SC+7jKHpdSnb0+F64JnJCxBalGu86Wb7x1MVXja
         9DJdPrlKcDMlnOGaAV+GcVVeBtqS3ICYrb7Rl44DJ21xPJWwf65FCnfOhwono9FeOlr4
         GaOuN+Nk5ifM6LdjhJPpThE38JI42kfyVq8XsM1t5JBTaXALW73nvXCmNOxTmogtNbzL
         lVOTPFgn2bK9XniZET+l0t3kvvx/75Z5ZRLQOUs6ofF4AfmwDt5HDU6lJ8Gu0SCbxA9H
         1Eqlws7P5tsm7+ubgRHM4alXoFHIoU5IZZSW0VlNXFTLUj14DiB/+Xt/ixOM6iWhAWyr
         Jnlw==
X-Gm-Message-State: AOAM532ZhR+ePaT8lGGrpq6LAG7wlzNfZEbOj40CEGJ/sbi6/twb2TTX
        NzWyErRSBpPzryOmygoySJErT1gtN8SBgOoHYVmx9/YkhuIIyxquTC/KvAltbzWWhIe3y+TMhoU
        E62HUdCss2FXYt0x44i/CAQ2JFhq+8XkgpA==
X-Received: by 2002:a17:907:97d0:: with SMTP id js16mr7104710ejc.345.1644174637640;
        Sun, 06 Feb 2022 11:10:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoUAG3ATst/LDefnrIGjV5hmPGVTJmv5nXt60vVyjb11IALsFz2VQDuxJLnksW5iCaS+e3sQ==
X-Received: by 2002:a17:907:97d0:: with SMTP id js16mr7104700ejc.345.1644174637450;
        Sun, 06 Feb 2022 11:10:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id u18sm2887013eje.37.2022.02.06.11.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 11:10:37 -0800 (PST)
Message-ID: <b4dd20bc-eefe-a794-ab67-e242388451b1@redhat.com>
Date:   Sun, 6 Feb 2022 20:10:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/6] platform/x86: x86-android-tablets: Add battery swnode
 support
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220205191356.225505-1-hdegoede@redhat.com>
 <CAHp75Vep66axJzXAdBQa4qzxRZG-Nzf=YeVSZHAg7enkwDLTAw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vep66axJzXAdBQa4qzxRZG-Nzf=YeVSZHAg7enkwDLTAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 21:41, Andy Shevchenko wrote:
> On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> power_supply_get_battery_info() which is used by charger and fuel-gauge
>> drivers on x86-android-tablets, expects the battery properties to be
>> described in a stand-alone battery fwnode which is then referenced
>> from both the charger and fuel-gauge device's fwnodes.
>>
>> Add support for registering + unregistering a swnode for this.
> 
> All non-commented looks good to me,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Just to be clear, you mean that I may add your Reviewed-by
tag to all patches in this series to which you did not comment,
correct ?

Regards,

Hans


> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/x86-android-tablets.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
>> index 3120acf9837c..80d113c41623 100644
>> --- a/drivers/platform/x86/x86-android-tablets.c
>> +++ b/drivers/platform/x86/x86-android-tablets.c
>> @@ -146,6 +146,7 @@ struct x86_serdev_info {
>>  struct x86_dev_info {
>>         char *invalid_aei_gpiochip;
>>         const char * const *modules;
>> +       const struct software_node *bat_swnode;
>>         struct gpiod_lookup_table * const *gpiod_lookup_tables;
>>         const struct x86_i2c_client_info *i2c_client_info;
>>         const struct platform_device_info *pdev_info;
>> @@ -727,6 +728,7 @@ static struct i2c_client **i2c_clients;
>>  static struct platform_device **pdevs;
>>  static struct serdev_device **serdevs;
>>  static struct gpiod_lookup_table * const *gpiod_lookup_tables;
>> +static const struct software_node *bat_swnode;
>>  static void (*exit_handler)(void);
>>
>>  static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
>> @@ -850,6 +852,8 @@ static void x86_android_tablet_cleanup(void)
>>
>>         for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>>                 gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
>> +
>> +       software_node_unregister(bat_swnode);
>>  }
>>
>>  static __init int x86_android_tablet_init(void)
>> @@ -886,6 +890,13 @@ static __init int x86_android_tablet_init(void)
>>         for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
>>                 request_module(dev_info->modules[i]);
>>
>> +       bat_swnode = dev_info->bat_swnode;
>> +       if (bat_swnode) {
>> +               ret = software_node_register(bat_swnode);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>>         gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
>>         for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>>                 gpiod_add_lookup_table(gpiod_lookup_tables[i]);
>> --
>> 2.33.1
>>
> 
> 

