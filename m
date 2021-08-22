Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAF6C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 19:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1101461250
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 19:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhHVTK7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Aug 2021 15:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhHVTK7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 15:10:59 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5539C061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 12:10:17 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso30164774oth.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/3FHObKkH83LXf35bmHOLaZmbUGC56EEKzLGF0jVq/E=;
        b=KbCWl9MB/12zuQ+EyDOsj1LQ8F9haids25gDp928JaH4wOqCteRqPivmv2SazhCijh
         i3NhnFz+SuUJFTjYxULr4Y27PFnTVRGuixp7vvEMBmsnDn0Ty4Xy2k2lhpnHXh8ITgE5
         cftNJ77sL4Xf+4AKXIdT1oCn9B9QH/TuZC8c0oV7yzVUBNZXsG1Hkrvd3OGi4K67gZ6I
         HCsjt73HC57wMvSMWvfmrQrv/dyIZuSD79HgDyxf0Dfff21dDlFRWDXDFw8RsI9PFl9q
         LdJj5D7PPx9IhonjbLGfHQnpa2au3ROrUgIGGoDensIP2puBX5KB50ZyfVLym4Fn0QlK
         XuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/3FHObKkH83LXf35bmHOLaZmbUGC56EEKzLGF0jVq/E=;
        b=t639jeOnJEnZsnFuRMk+4Pi/Xr8HXuNJTjAKG+pRUb2XlBtkhEtTD5QgdPeuRW/WcA
         YXRP90W3l551LinUud/4DYN8moNe39HMbx3H6ALiPtFQ38KdnVYp1OgbIqOBTUfIM+xh
         HFO6QEEAVCRxCoTGD87Dl0C5Rb2n9DEQsd0MTy+FczifOzX4+yXcx0Da1N7y/RW73Nxn
         ivhrskIBS7fZdtB1+SENdRKDH12waGlnXZ+876jDFcobiEydxVeuKyfibcVcUaJhqx+z
         L0ikIozNGs3pDq1dz9luvRM9egQvnr+sXCYFQ57DhUx26JXQ/zGTHvRY4zX6x+TH6V3c
         JGJQ==
X-Gm-Message-State: AOAM532IuZ0lg01UIhUHskU3s6kkOPm21IUuNdYlnZ8StAA/UWZmpnWp
        FXurnN7J85ErPn8kfBhVPa8=
X-Google-Smtp-Source: ABdhPJxguOkz7L1etmaCk+pCUEWIUL7hiQavoU3E+fiQeOd709KJ4++hbiJUXzeX0d5+bCEHinfNqA==
X-Received: by 2002:a05:6830:236d:: with SMTP id r13mr24973167oth.130.1629659417231;
        Sun, 22 Aug 2021 12:10:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9sm3208482otp.18.2021.08.22.12.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 12:10:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for omen laptops
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
References: <20210822163143.jutjs7un5d547ehr@omen.localdomain>
 <dmlqFeCj95CYJBSHp58FRsLPWQqI-Kh_O82mUrhHsBbnCNKSwlWd9ynWz2JQAdWwaGMvagH5LOQlz0r5_5yerwCZRXIJLbU4lmTOu03ZQnU=@protonmail.com>
 <f79cf69c-e050-5008-f01f-344257d66c45@roeck-us.net>
 <20210822181051.jefthtoelu5kujcg@omen.localdomain>
 <QE1CIdLSloSwQQSm0WtOvLS4FokfcOI98asGDxe9ou4lNhblbatRDH1zhlPj6zMukG36Z2vNrJnnoIMhKEHsbhp4iqb3Xg9zDi_bua-Js8w=@protonmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <41e102ad-6ec2-9a60-c8d8-25317e68dee1@roeck-us.net>
Date:   Sun, 22 Aug 2021 12:10:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <QE1CIdLSloSwQQSm0WtOvLS4FokfcOI98asGDxe9ou4lNhblbatRDH1zhlPj6zMukG36Z2vNrJnnoIMhKEHsbhp4iqb3Xg9zDi_bua-Js8w=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/22/21 11:53 AM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. augusztus 22., vasárnap 20:10 keltezéssel, Enver Balalic írta:
>> [...]
>>>>> +static int hp_wmi_hwmon_init(void)
>>>>> +{
>>>>> +	struct device *dev = &hp_wmi_platform_dev->dev;
>>>>> +	struct device *hwmon;
>>>>> +
>>>>> +	hwmon = devm_hwmon_device_register_with_groups(dev, "hp", &hp_wmi_driver,
>>>>> +			hwmon_attribute_groups);
>>>>
>>>> I think you should use
>>>>
>>>>     [devm_]hwmon_device_register_with_info()
>>>>
>>>> as it creates sysfs attributes for you, etc. You wouldn't need to manually
>>>> create device attributes, and you wouldn't need fan{1,2}_show() at all.
>>>>
>>>
>>> Correct. Also, the code as written doesn't really make sense as hwmon driver
>>> because all its attributes are non-standard. The "sensors" command will show
>>> nothing.
>>>
>>
>> I failed to take a look at the documentation instead i just looked at a
>> different laptop's WMI driver as a reference. My bad.
>>
>>> If you don't want to use standard hwmon ABI attributes, please don't register
>>> a hwmon driver. The non-standard attributes can reside in the platform
>>> sysfs directory. There is already the non-standard "hddtemp", so that would
>>> not make much of a difference anyway. On top of that, "max_fan" is added as
>>> non-hwmon attribute, making the hwmon registration even more pointless.
>>>
>>> Guenter
>>
>> I would like to expose these fan speeds properly, and hwmon seemed like
>> the way to do it. I'll redo this part to match how it should be done in the
>> documentation.
>>
>> The questions I have are:
>>
>> The only value I have is the current fan speed in RPM, I don't have
>> the rest of the values like min,max,pulses,target. Is it ok to implement this
>> in hwmon if I don't have those values? Can I use default values in place of
>> the ones I don't have, or should i omit those fields entirely.
>> I can assume min speed to be 0 since it does turn off the fans at light load
>> but in the case of the max speed property, I don't know what it is. Do I omit
>> that field entirely or ?
>>
> 
> I think you can simply omit what you don't have. In your case,
> I imagine you'll have something like this:
> 
>    static const struct hwmon_channel_info *info[] = {
>      HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
>      HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>      NULL
>    };
> 
>    static const struct hwmon_ops ops = {
>      .is_visible = ...,
>      .read       = ...,
>      .write      = ...,
>    };
> 
>    static const struct hwmon_chip_info chip_info = {
>      .ops  = &ops,
>      .info = info,
>    };
> 
> 
>> The "max_fan" that I added is not a RPM value, it's a simple toggle in WMI
>> that either sets the fans to blow at their max speed (1), or it sets them
>> to auto (0), this matches what the windows omen command center does.
>> I don't know of a way to expose this "properly" so i just added a simple
>> attribute. Is there a proper way to expose this behaviour ?
>>
> 
> I believe the proper way to expose that is via a pwmN_enable attribute on the
> hwmon device, this should be created by the hwmon subsystem when it sees the
> 
>    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
> 
> channel in the info struct.
> 
> If both fans are controlled by one switch, I think it's fine to just have a
> single pwmN_enable attribute. But Guenter can probably tell you more.
> 
> For this attribute the value 2 means automatic, 1 means manual, 0 means full speed
> as far as I'm aware (at least this is what thinkpad_acpi does). If manual fan
> control is not available, returning -EOPNOTSUPP is probably fine.
> 
That, or -EINVAL.

I would also suggest to create temp1_input for the HD temperature. We can not drop
the existing attribute for backwards compatibility reasons, but it would make sense
to expose the HD temperature as standard attribute (possibly with an associated
_name attribute).

Guenter
