Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B5CECAAD2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 09:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245345AbiHZJvS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 05:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241772AbiHZJvQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 05:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CE64C606
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661507473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=clhTuc9t28E+2xMN5jNCjU/ZujbGZlfTKXxTNC9SamA=;
        b=YMY+5nNbpsVvaG/3CzSldIAwgcyrMyIJeKsS6Nx5vRXNYiH3QNVIyt30nnXvSkX9VF8eNl
        JvGV5Ta+3zZ+r99VHamRRZEKqPYkDkkShe/eMVyt21MJEKdAdo3C5tpbh/cR04gbCfIhJD
        Bq90XXHeMxnyge2YcX8bkcpxLeFwt6M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-1LAfINh9O7KTSkol7frxmQ-1; Fri, 26 Aug 2022 05:51:09 -0400
X-MC-Unique: 1LAfINh9O7KTSkol7frxmQ-1
Received: by mail-ej1-f69.google.com with SMTP id hp36-20020a1709073e2400b0073d6bee146aso428151ejc.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 02:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=clhTuc9t28E+2xMN5jNCjU/ZujbGZlfTKXxTNC9SamA=;
        b=Wr//ePRIjMu/VGq2NmK3B0v7cZkRf9njP8rsSYL5ox7bkoGYQMwCiDkrdT+q8biY+V
         ffPcvkWsnejX1NxOXlaAhne/C8FmlyPa+yanOgqLkhBkEaELo8pk7rcwJa0+ALzBeauj
         SPQysERHm9Sj5kASjNfy7Kb0KekxrcZC6q1B2jGxQ2nE2RPWyG3QNcqYXH0AAduIsVpH
         J2Sn17Pf/lnlc4g+VQwsSnq0AQG1vxfR9UK/CH4t1MxCDhOCOOziG3VknBliY/MxRJob
         hsv1rarzpRYfcKgDeG/GAI2sy+/4/bjApo+/UvoR7DnRRxnZ3Hma/CFBEGaNCADt+u+T
         XlFg==
X-Gm-Message-State: ACgBeo0k0e1GviKb+gzpp8DzODqjbPtHAO7VsgZ6D4egzw4xegqj0TuK
        HyF45VLsxVu2otNsaVGlb1YEGcnDXLivrDfVMmO9jwSh8PFxQySknxoWZRtuZbLfxzlgW4ATQVa
        EzpQhGYdIBxxOPM1fKEbMUCKWxamcq2vbow==
X-Received: by 2002:a17:907:7e8a:b0:732:ff29:d1d6 with SMTP id qb10-20020a1709077e8a00b00732ff29d1d6mr5068878ejc.175.1661507468414;
        Fri, 26 Aug 2022 02:51:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VzbN0czDqNFrUGmTRLjqrW+P4L2RP3zbBiqw3RVEkx1FLM/yqqpdNhjk99INEHHl5T+0K7g==
X-Received: by 2002:a17:907:7e8a:b0:732:ff29:d1d6 with SMTP id qb10-20020a1709077e8a00b00732ff29d1d6mr5068862ejc.175.1661507468159;
        Fri, 26 Aug 2022 02:51:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906170f00b00722e603c39asm698532eje.31.2022.08.26.02.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:51:07 -0700 (PDT)
Message-ID: <1e74a75e-26f7-4ebb-6757-274722a40614@redhat.com>
Date:   Fri, 26 Aug 2022 11:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/1] platform/x86: asus-wmi: Fix name of mic-mute LED
 classdev
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        PaddyKP_Yao <ispaddy@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        paddykp_yao@asus.com
References: <20220825004305.709539-1-PaddyKP_Yao@asus.com>
 <CAHp75VfM9zwUrzPk2w5g5J4wEh5KLc_ij5Ai+S=NbZ0SYQThjw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfM9zwUrzPk2w5g5J4wEh5KLc_ij5Ai+S=NbZ0SYQThjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/22 10:20, Andy Shevchenko wrote:
> On Thu, Aug 25, 2022 at 3:48 AM PaddyKP_Yao <ispaddy@gmail.com> wrote:
>>
>> According to well-known-leds.txt, we sould use "platform::micmute"
> 
> should
> 
>> instead of "asus::micmute" for name of mic-mute LED classdev. This patch
> 
> the name
> 
>> fix it into good name.
> 
> a good
> 
> With typos fixed,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks, I've fixed up the typos while applying this:

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




> 
>> Signed-off-by: PaddyKP_Yao <PaddyKP_Yao@asus.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 89b604e04d7f..3acc75c24c79 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1118,7 +1118,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>         }
>>
>>         if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
>> -               asus->micmute_led.name = "asus::micmute";
>> +               asus->micmute_led.name = "platform::micmute";
>>                 asus->micmute_led.max_brightness = 1;
>>                 asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>                 asus->micmute_led.brightness_set_blocking = micmute_led_set;
>> --
>> 2.34.1
>>
> 
> 

