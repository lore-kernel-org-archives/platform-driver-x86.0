Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605F2C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 22:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380411AbiFGWXn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 18:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385089AbiFGWU7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 18:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AE99265F8F
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654629656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xyuedXK3zI0mUY/8MpxtOLyyv17PDOQaMKoisQRVY3I=;
        b=PbDXmh5r1UJV3HLRqiZYZj1SK51N+yEnLCLPoz/V3WjqDKQPRZ9g6Jxe4PNTKDRmiM7+3b
        LFZoc9VDNNAVa6WjNZVHPzX5O275pLreu+XOfUjqAI95538FtlAF4uH3tHn5m/sEpx8djn
        UkRkhqS1dHvCy1fx55iK+8HBmvCVVlk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-md7lwvzbPMOlzm2Izj7R6g-1; Tue, 07 Jun 2022 15:20:54 -0400
X-MC-Unique: md7lwvzbPMOlzm2Izj7R6g-1
Received: by mail-ej1-f69.google.com with SMTP id p10-20020a170906b20a00b0070c21a6d378so6197799ejz.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xyuedXK3zI0mUY/8MpxtOLyyv17PDOQaMKoisQRVY3I=;
        b=mPvkQOkU6aY2gF+sn7alvhNMgcnLuVCh8/xtC2nxDUSSyWuUj1wtycAAMfDlxLRdNA
         CXvKGGYfZUNepuSGdt6bjvv1o8fT/NGRINDvZO585bZ8pGILMFr5pe459UedZYXM9ZNP
         SAZdtclfCElayUl0QjfOfcQya1b+h8VWz5aFNTvdeSGTC8vGfjZiUKISM/lhxgkOvIEh
         xQ1F+aipJk+ggaEC8CCTLINLwzEQHDBqcZ0d2cymyU2Xgseuk+OA5u6JcuNIA7WGTckq
         45e1HuZZ+HLJctw7kuK+gl/RmYIhvN/KlnJJKjG02xDRS7LCQ+dhrbi+5j67QymcB4UR
         XMnQ==
X-Gm-Message-State: AOAM530wawnq/n4A5SIZN+cnJY0D/GD29w/Z+KRaFTsFXbA9AIUHeFFr
        swu8juOfZxSnUoZJgVQ4LyLQKbT2cWkMGLp3HSXrj0BFaHdpIrmU/4lZvSgoLfXRdrY3MnYfaX/
        6biHjYJbhoEwrTq2MPwyJA5dP51k22NkIZg==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id et11-20020a056402378b00b0042aad8c628fmr35236767edb.90.1654629653598;
        Tue, 07 Jun 2022 12:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxayvfhzEvdkC9uxxWNCQbc1aZfzRIakiBBN8SeM2azGWbsGJJs4A3dxTmfIleFLZonxozF9Q==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id et11-20020a056402378b00b0042aad8c628fmr35236738edb.90.1654629653203;
        Tue, 07 Jun 2022 12:20:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q1-20020a1709066ac100b006feed212f50sm8022068ejs.184.2022.06.07.12.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 12:20:52 -0700 (PDT)
Message-ID: <2f1aba80-6fdc-e7c7-9d9f-dad80cf2b705@redhat.com>
Date:   Tue, 7 Jun 2022 21:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Bedant Patnaik <bedant.patnaik@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
 <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
 <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
 <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
 <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/7/22 20:11, Jorge Lopez wrote:
> Dropped other participants by accident.  Please see my comments below.
> 
> The original code created an insize buffer size of 128 bytes
> regardless if the WMI call required a smaller buffer or not.  This
> particular behavior occurs in older BIOS and reproduced in OMEN
> laptops.  Newer BIOS handles  buffer sizes properly and meets the
> latest specification requirements.  This is the reason why testing
> with a dynamically allocated buffer did not uncover any failures with
> the test systems at hand.
> One additional point was considered.  The purpose for introducing
> dynamically allocated buffers was primarily to support WMI calls that
> required buffers size bigger than 128 bytes.  The decision  was made
> to separate those WMI calls to a separate driver and implement the new
> firmware-attribute framework.
> 
> The current review request title is  "[PATCH] Revert "platform/x86:
> hp-wmi: Changing bios_args.data to be dynamically allocated"
> 
> I am testing a cleaner solution to submit instead of  reverting the
> changes to hp_wmi_perform_query method.  The changes were made and
> tested on business notebooks without any issues.  I will submit a new
> patch as soon as I get the test results from a  community member who
> owns an Omen 15 system.
> 
> The proposed patch which I am pending test results, it is as follows
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0e9a25b56e0e..7bcfa07cc6ab 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum
> hp_wmi_command command,
>   struct bios_args *args = NULL;
>   int mid, actual_outsize, ret;
>   size_t bios_args_size;
> + int actual_insize;
> 
>   mid = encode_outsize_for_pvsz(outsize);
>   if (WARN_ON(mid < 0))
>   return mid;
> 
> - bios_args_size = struct_size(args, data, insize);
> + actual_insize = max(insize, 128);
> + bios_args_size = struct_size(args, data, actual_insize);
>   args = kmalloc(bios_args_size, GFP_KERNEL);
>   if (!args)
>   return -ENOMEM;
> -----
> 
> This code eliminates the 0x05 error codes across the other WMI calls.
> Unfortunately, I do not have an Omen system to complete the tests.

This in essence is the same as the RFC from Bedant, which was
already tested on an Omen, so I believe that it is safe to
say that this variant (which is a bit cleaner) will also
work on Bedant's Omen model.

> zero_insize_support() seems ok for Omen platforms but don't know if it
> may cause errors on newer notebooks.  I will run the patch locally and
> will update the results.

Thanks in advance for testing the zero_insize_support().

Regards,

Hans


> Bedant if it possible, can you apply the changes described earlier and
> let me know if it fixes Omen notebook issues?
> 
> 
> Regards,
> 
> Jorge.
> 
> On Tue, Jun 7, 2022 at 12:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> It looks like you accidentally dropped all the other folks on the Cc,
>> please use reply-to-all. I've re-added those folks now.
>>
>> On 6/7/22 18:00, Jorge Lopez wrote:
>>> Hi Hans
>>>
>>>
>>> On Tue, Jun 7, 2022 at 8:35 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>>
>>>> Hi Bedant,
>>>>
>>>> Adding Jorge from HP to the To: list.
>>>>
>>>> On 6/7/22 15:24, Bedant Patnaik wrote:
>>>>> 4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically...")
>>>>> broke WMI queries on some devices where the ACPI method HWMC unconditionally attempts to create Fields beyond the buffer
>>>>> if the buffer is too small, this breaks essential features such as power profiles:
>>>>>         CreateByteField (Arg1, 0x10, D008)
>>>>>         CreateByteField (Arg1, 0x11, D009)
>>>>>         CreateByteField (Arg1, 0x12, D010)
>>>>>         CreateDWordField (Arg1, 0x10, D032)
>>>>>         CreateField (Arg1, 0x80, 0x0400, D128)
>>>>> In cases where args->data had zero length, ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
>>>>> offset/length 128/8 exceeds size of target Buffer (128 bits) (20211217/dsopcode-198) was obtained.
>>>>> Fix: allocate at least 128 bytes for args->data
>>>>>
>>>>> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
>>>>> and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
>>>>> caused ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
>>>>> method HWMC, which unconditionally creates a Field of size (insize*8) bits:
>>>>>       CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
>>>>> In cases where args->insize = 0, the Field size is 0, resulting in an error.
>>>>> Fix: use zero insize only if 0x5 error code is returned
>>>>>
>>>>> Tested on Omen 15 AMD (2020) board ID: 8786.
>>>>
>>>> Thank you for looking into this. The alloc at least
>>>> 128 bytes part for args->data looks good and likely is a better
>>>> fix then the revert of 4b4967cbd2685f3 which Jorge has submitted.
>>>>
>>>> I'm not 100% sure about the zero_insize_support() thingie though.
>>>>
>>>> Looking at the original fix and then trying to get things
>>>> to work on all models with some requiring insize==0 and
>>>> otheres requiring insize!=0 I guess this also makes sense...
>>>>
>>>> Jorge, any remarks on this patch?
>>>>
>>>
>>> The original code created an insize buffer size of 128 bytes
>>> regardless if the WMI call required a smaller buffer or not.  This
>>> particular behavior occurs in older BIOS and reproduced in OMEN
>>> laptops.  Newer BIOS handles  buffer sizes properly and meets the
>>> latest specification requirements.  This is the reason why testing
>>> with a dynamically allocated buffer did not uncover any failures with
>>> the test systems at hand.
>>> One additional point was considered.  The purpose for introducing
>>> dynamically allocated buffers was primarily to support WMI calls that
>>> required buffers size bigger than 128 bytes.  The decision  was made
>>> to separate those WMI calls to a separate driver and implement the new
>>> firmware-attribute framework.
>>>
>>> The current review request title is  "[PATCH] Revert "platform/x86:
>>> hp-wmi: Changing bios_args.data to be dynamically allocated"
>>>
>>> I am testing a cleaner solution to submit instead of  reverting the
>>> changes to hp_wmi_perform_query method.  The changes were made and
>>> tested on business notebooks without any issues.  I will submit a new
>>> patch as soon as I get the test results from a  community member who
>>> owns an Omen 15 system.
>>
>> Right, notice the RFC this thread is a reply to already contains
>> a cleaner version and has been tested on a HP Omen laptop already.
>>
>> The already tested cleaner fix from this RFC is:
>>
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -297,8 +299,8 @@  static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>>         if (WARN_ON(mid < 0))
>>                 return mid;
>>
>> -       bios_args_size = struct_size(args, data, insize);
>> -       args = kmalloc(bios_args_size, GFP_KERNEL);
>> +       bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
>> +       args = kzalloc(bios_args_size, GFP_KERNEL);
>>         if (!args)
>>                 return -ENOMEM;
>>
>>
>> Which seems a better (more future proof) solution then your revert.
>>
>> Jorge, my main question from my previous email really is what you
>> make of the zero_if_sup() changes / part of this RFC. Which are
>> necessary because some older ACPI tables don't like it when
>> args->insize is set to 0, which it is after your:
>>
>> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
>> 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
>>
>> commits. For details see the original commit msg from this RFC:
>> https://patchwork.kernel.org/project/platform-driver-x86/patch/20220607132428.7221-1-bedant.patnaik@gmail.com/
>>
>> Even if we go with the revert you submitted that only fixes
>> the passing buffers < 128 bytes issue and not this other issue.
>>
>> I had to take a good look at it, but after doing that I do believe
>> that the proposed zero_if_sup() changes make sense.
>>
>> Bedant, can you split your original RFC into 2 patches please,
>> one for each separate of the two (128 bytes buf-size,
>> resp. zero_if_sup()) fixes which you are doing ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>
>>
>>>
>>> Regards,
>>>
>>> Jorge.
>>>
>>>
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>>
>>>>> Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
>>>>> Cc: markgross@kernel.org
>>>>> Cc: platform-driver-x86@vger.kernel.org
>>>>>
>>>>> ---
>>>>>  drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++++-----------
>>>>>  1 file changed, 18 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>>>>> index 667f94bba..3ef385f14 100644
>>>>> --- a/drivers/platform/x86/hp-wmi.c
>>>>> +++ b/drivers/platform/x86/hp-wmi.c
>>>>> @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>>>>>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>>>>>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>>>>>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>>>>> +#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
>>>>>
>>>>>  /* DMI board names of devices that should use the omen specific path for
>>>>>   * thermal profiles.
>>>>> @@ -175,7 +176,7 @@ enum hp_thermal_profile_omen_v1 {
>>>>>  enum hp_thermal_profile {
>>>>>       HP_THERMAL_PROFILE_PERFORMANCE  = 0x00,
>>>>>       HP_THERMAL_PROFILE_DEFAULT              = 0x01,
>>>>> -     HP_THERMAL_PROFILE_COOL                 = 0x02
>>>>> +     HP_THERMAL_PROFILE_COOL                 = 0x02,
>>>>>  };
>>>>>
>>>>>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
>>>>> @@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
>>>>>  static struct platform_device *hp_wmi_platform_dev;
>>>>>  static struct platform_profile_handler platform_profile_handler;
>>>>>  static bool platform_profile_support;
>>>>> +static bool zero_insize_support;
>>>>>
>>>>>  static struct rfkill *wifi_rfkill;
>>>>>  static struct rfkill *bluetooth_rfkill;
>>>>> @@ -297,8 +299,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>>>>>       if (WARN_ON(mid < 0))
>>>>>               return mid;
>>>>>
>>>>> -     bios_args_size = struct_size(args, data, insize);
>>>>> -     args = kmalloc(bios_args_size, GFP_KERNEL);
>>>>> +     bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
>>>>> +     args = kzalloc(bios_args_size, GFP_KERNEL);
>>>>>       if (!args)
>>>>>               return -ENOMEM;
>>>>>
>>>>> @@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
>>>>>       int val = 0, ret;
>>>>>
>>>>>       ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
>>>>> -                                0, sizeof(val));
>>>>> +                                zero_if_sup(val), sizeof(val));
>>>>>
>>>>>       if (ret)
>>>>>               return ret < 0 ? ret : -EINVAL;
>>>>> @@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
>>>>>               return -ENODEV;
>>>>>
>>>>>       ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
>>>>> -                                system_device_mode, 0, sizeof(system_device_mode));
>>>>> +                                system_device_mode, zero_if_sup(system_device_mode),
>>>>> +                                sizeof(system_device_mode));
>>>>>       if (ret < 0)
>>>>>               return ret;
>>>>>
>>>>> @@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
>>>>>       int val = 0, ret;
>>>>>
>>>>>       ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
>>>>> -                                &val, 0, sizeof(val));
>>>>> +                                &val, zero_if_sup(val), sizeof(val));
>>>>>
>>>>>       if (ret)
>>>>>               return ret < 0 ? ret : -EINVAL;
>>>>> @@ -509,7 +512,7 @@ static int __init hp_wmi_bios_2008_later(void)
>>>>>  {
>>>>>       int state = 0;
>>>>>       int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
>>>>> -                                    0, sizeof(state));
>>>>> +                                    zero_if_sup(state), sizeof(state));
>>>>>       if (!ret)
>>>>>               return 1;
>>>>>
>>>>> @@ -520,7 +523,7 @@ static int __init hp_wmi_bios_2009_later(void)
>>>>>  {
>>>>>       u8 state[128];
>>>>>       int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
>>>>> -                                    0, sizeof(state));
>>>>> +                                    zero_if_sup(state), sizeof(state));
>>>>>       if (!ret)
>>>>>               return 1;
>>>>>
>>>>> @@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
>>>>>       int err, i;
>>>>>
>>>>>       err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
>>>>> -                                0, sizeof(state));
>>>>> +                                zero_if_sup(state), sizeof(state));
>>>>>       if (err)
>>>>>               return err;
>>>>>
>>>>> @@ -1007,7 +1010,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>>>>>       int err, i;
>>>>>
>>>>>       err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
>>>>> -                                0, sizeof(state));
>>>>> +                                zero_if_sup(state), sizeof(state));
>>>>>       if (err)
>>>>>               return err < 0 ? err : -EINVAL;
>>>>>
>>>>> @@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
>>>>>  {
>>>>>       int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
>>>>>       int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
>>>>> -     int err;
>>>>> +     int err, tmp = 0;
>>>>>
>>>>>       if (!bios_capable && !event_capable)
>>>>>               return -ENODEV;
>>>>>
>>>>> +     if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
>>>>> +                              sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
>>>>> +             zero_insize_support = true;
>>>>> +
>>>>>       if (event_capable) {
>>>>>               err = hp_wmi_input_setup();
>>>>>               if (err)
>>>>
>>>
>>
> 

