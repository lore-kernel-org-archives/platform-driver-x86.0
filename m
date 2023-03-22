Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2C1C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 14:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbjCVOX6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 10:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjCVOXx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 10:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C606D64B28
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679494955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b4HCh/exYa+rKzQkTBGQGYfL/u/z6TimwZcfkWX/lMc=;
        b=LpB0TJPtNFCR6fZMH69rhCXSTenRY8E+5xvTk9YzKKn5Xf+IDet8eKJhUOElS8g9j8asEO
        2ojdZdt1PICNre6A3rOU7mXWhXPoUIff11r2YyZB1vpRz4hPh5NW1nmPk0ZHEMLkfjqp4y
        xvGbpUcdGxg8C45zIoCejW3luHA3A1Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-uzMzw7aWMI2Y8smS17TllQ-1; Wed, 22 Mar 2023 10:22:33 -0400
X-MC-Unique: uzMzw7aWMI2Y8smS17TllQ-1
Received: by mail-ed1-f69.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so27176718eda.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4HCh/exYa+rKzQkTBGQGYfL/u/z6TimwZcfkWX/lMc=;
        b=1Am3esoGRpBXKtqn1qOzPps1Plp/9daNX8yViSzuz/lm3Ro2gffnmKCL+nZZ9M///8
         FK5oDEAAc7ZrO2phA4tpprd5hQKaOU0Z6Qmv+RBqJIeCKxe+q9FRiJ7s41/wwvYZpJN5
         ba16AIXMHy8puoW26r0QULWzic2OrjLnI9SNTbtr/SeXPAqUH48KapldUTO0Ap3+ZJFY
         8Zx8kzwHAfwf/8quxidrPicECSTwhhNmQA4Tihh13zhhuNI9R3xli2mYZlCaeIfE0Mck
         OEyhja0NxdSPVPP5V2TrZ52irhrTTOwEVwiKL74y+rR53/bk/Atyru1skOlbt770QNr/
         YmMA==
X-Gm-Message-State: AO0yUKUtMZqi2IrGN3oPoVFjPMo5P0tfVyPMYI7bc0ChPLI6UEIKc+7I
        FDh/T9MCVJdVGrKxjVqPIc+/XJH/ciqyyl9F9Z8+eboWA0UzZ4Mpz+ywYmFo+DAxO4/GQBhCk+0
        QgNqjDf2fKywTyjvuae3Br0eORDxRv1sK8Q==
X-Received: by 2002:aa7:d315:0:b0:4fa:c04f:66c9 with SMTP id p21-20020aa7d315000000b004fac04f66c9mr6790616edq.2.1679494951999;
        Wed, 22 Mar 2023 07:22:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set8tPbw1d+9aFeZ/Xv+0uAxFanWjbe7gCcBBQDF4e49+dIXgrJSGBl1WaHQIDNehQJqJ1FyJrg==
X-Received: by 2002:aa7:d315:0:b0:4fa:c04f:66c9 with SMTP id p21-20020aa7d315000000b004fac04f66c9mr6790602edq.2.1679494951752;
        Wed, 22 Mar 2023 07:22:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u23-20020a170906409700b009334a6ef3e8sm5230824ejj.141.2023.03.22.07.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 07:22:30 -0700 (PDT)
Message-ID: <c887dd18-7a65-36f8-a585-db71f9faec72@redhat.com>
Date:   Wed, 22 Mar 2023 15:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/4] platform/x86: think-lmi: use correct
 possible_values delimiters
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, markpearson@lenovo.com, pobrn@protonmail.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230320003221.561750-1-mpearson-lenovo@squebb.ca>
 <20230320003221.561750-2-mpearson-lenovo@squebb.ca>
 <3df8ca69-e2a4-49d1-9c5c-8e6ff8bb0f96@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3df8ca69-e2a4-49d1-9c5c-8e6ff8bb0f96@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/20/23 16:22, Thomas Weißschuh wrote:
> Hi Mark,
> 
> Thanks for the series!
> For all of it:
> 
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> If you decide to reroll it, one more nitpick below.

Mark, thank you for the series. Thomas, thank you
for the reviews.

I've applied this series to the fixes branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> On Sun, Mar 19, 2023 at 08:32:19PM -0400, Mark Pearson wrote:
>> firmware-attributes class requires that possible values are delimited
>> using ';' but the Lenovo firmware uses ',' instead.
>> Parse string and replace where appropriate.
>>
>> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
>> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Changes in v4
>>  - Moved earlier in the series as recommended
>>  - used strreplace function as recommended
>> Changes in v3: 
>>  - New patch added to the series. No v1 & v2.
>>
>>  drivers/platform/x86/think-lmi.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index a765bf8c27d8..53f34b1adb8c 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -954,7 +954,7 @@ static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>  
>>  	if (setting->possible_values) {
>>  		/* Figure out what setting type is as BIOS does not return this */
>> -		if (strchr(setting->possible_values, ','))
>> +		if (strchr(setting->possible_values, ';'))
>>  			return sysfs_emit(buf, "enumeration\n");
> 
> If you make this patch the first on of the series it would
> * make the hunk above unnecessary.
> * make it easier to backport if somebody wants do do so.
> * make the then second patch easier to read as it would not introduce
>   "incorrect" code that needs a fix-up in the following commit.
> 
>>  	}
>>  	/* Anything else is going to be a string */
>> @@ -1413,6 +1413,13 @@ static int tlmi_analyze(void)
>>  				pr_info("Error retrieving possible values for %d : %s\n",
>>  						i, setting->display_name);
>>  		}
>> +		/*
>> +		 * firmware-attributes requires that possible_values are separated by ';' but
>> +		 * Lenovo FW uses ','. Replace appropriately.
>> +		 */
>> +		if (setting->possible_values)
>> +			strreplace(setting->possible_values, ',', ';');
>> +
>>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>>  		tlmi_priv.setting[i] = setting;
>>  		kfree(item);
>> -- 
>> 2.39.2
>>
> 

