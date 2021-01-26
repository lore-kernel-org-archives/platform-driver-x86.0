Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB711C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 16:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAC532229C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 16:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391561AbhAZQMZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 11:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49826 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391399AbhAZQFY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 11:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611677030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C+5lHhljS2t3XXLIGk8RJ3OMMCfTE6pLWrrd/cm5GYo=;
        b=UHDrt6QcBAijgh/V1OD/nHqv5usVgkeYlpGfSSiFW0NSk7tu13BXR8JUQ59OrclAcH2e/5
        SSuomYrcMTjcVbIQNfvOP9FD1Ty1h7q56H4XaxeMPA+GjboAY8d3OX0UxTpnCSlGjYOpjS
        kBGujUZFroMvAu/RY6GYVUmA5AmCVOU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-kL_0_pDoN9eX6VwDgDxTMA-1; Tue, 26 Jan 2021 11:03:47 -0500
X-MC-Unique: kL_0_pDoN9eX6VwDgDxTMA-1
Received: by mail-ed1-f70.google.com with SMTP id j12so9565410edq.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 08:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C+5lHhljS2t3XXLIGk8RJ3OMMCfTE6pLWrrd/cm5GYo=;
        b=qiON/8dU8Kd4w/HV96YwC+3Yke8pUeZgG57SLwO4Klrhqt2x4LMF4IeyWmkfTbe+Rm
         XGOjAxaQtW8C3VUN8sldX6Egb66MxzE5aH9v8Z6u8tcgEb+0Al1IcnSNBzmuNB/wc7xg
         AygrbzTlxu7XtulrrLLrMAmEDlH3Zlq+WSOTN47ZXC3as583S1ExSBC88STPfj6jwBAH
         UEe1IZNsyqp3iaCppT5QY/65jWM0TXiV5RQ351AkmxzPiBGywxqK/jczaS53/U1Gen+6
         YGSw3CgjuqaO8J7u0w2glr1wVUsASVP9008wyw99XckGjktRZRsklNp3t8tqJEedZHXZ
         XlCw==
X-Gm-Message-State: AOAM533Ohoh7OVeoI8v9KXKucEotkqZOwp+Bg0FkUBUUlYm/Rcu6GnIe
        09+2IK9QZ0G2cNCh48M07hiRN2Xx+bVfxEu+Waka5nw5eHMfsXNqTZqFji+T0cEkTw4VbEgQ52T
        3p4nwZKWU7NK3GJhuisa36sTLFWgRydn4DoUmDRgn+/3sRZO1B9mRYDh5BoEMS03Yg1ao7FEZMY
        /7gp1mc1jzNQ==
X-Received: by 2002:aa7:c7d8:: with SMTP id o24mr5282744eds.328.1611677026025;
        Tue, 26 Jan 2021 08:03:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKC7fYmadBICb6dgAIdPf2Z0ybHOzqnI5aJwNx1J1uRxF01viLS0ccSt+d13MVEqv+cyN6HQ==
X-Received: by 2002:aa7:c7d8:: with SMTP id o24mr5282716eds.328.1611677025833;
        Tue, 26 Jan 2021 08:03:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id f13sm9944402ejf.42.2021.01.26.08.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 08:03:45 -0800 (PST)
Subject: Re: [External] Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set
 keyboard language
To:     Nitin Joshi1 <njoshi1@lenovo.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        "peter.hutterer@redhat.com" <peter.hutterer@redhat.com>,
        Tomoki Maruichi <maruichit@lenovo.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210125025916.180831-1-nitjoshi@gmail.com>
 <CAHp75VddS69zFvfWem9ZkzAkTFG2yxPKzT7OpH1GAcNiqAZJkA@mail.gmail.com>
 <SG2PR03MB27186C2289B137A914B9F0D28CBC0@SG2PR03MB2718.apcprd03.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <95a75688-2834-8a20-4fcb-036f5dab7478@redhat.com>
Date:   Tue, 26 Jan 2021 17:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <SG2PR03MB27186C2289B137A914B9F0D28CBC0@SG2PR03MB2718.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 4:58 PM, Nitin Joshi1 wrote:
> Hello Andy ,
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Sent: Tuesday, January 26, 2021 6:31 AM
>> To: Nitin Joshi <nitjoshi@gmail.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>; Benjamin Berg
>> <bberg@redhat.com>; peter.hutterer@redhat.com; Tomoki Maruichi
>> <maruichit@lenovo.com>; Mark Pearson <mpearson@lenovo.com>; Platform
>> Driver <platform-driver-x86@vger.kernel.org>; Nitin Joshi1
>> <njoshi1@lenovo.com>
>> Subject: [External] Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set keyboard
>> language
>>
>> On Mon, Jan 25, 2021 at 5:03 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
>>>
>>> From: Nitin Joshi <njoshi1@lenovo.com>
>>>
>>
>> Maybe it's a bit late, but... nevertheless my comments below.
>>
> Thank you for comments . It was my mistake , I should have put mailing list before . 
> 
>>> This patch is to create sysfs entry for setting keyboard language
>>
>> create a sysfs
>>
>>> using ASL method. Some thinkpads models like T580 , T590 , T15 Gen 1
>>> etc. has "=", "(',")" numeric keys, which are not displaying
>>> correctly, when keyboard language is other than "english".
>>> This patch fixes this issue by setting keyboard language to ECFW.
>>
>>> +This feature is used to set keyboard language to ECFW using ASL interface.
>>> +Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=",
>>> +"(', ")" numeric keys, which are not displaying correctly, when
>>> +keyboard language is other than "english". This is because of default
>>> +keyboard language in ECFW
>>
>> because the default
> 
> Ack . I will correct it.
> 
>>
>>> +is set as "english". Hence using this sysfs, user can set correct
>>> +keyboard
>>
>> the user can set the correct
> 
> Ack . I will correct it .
> 
>>
>>> +language to ECFW and then these key's will work correctly .
>>> +
>>> +Example of command to set keyboard language is mentioned below::
>>> +
>>> +        echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
>>> +
>>> +Text corresponding to keyboard layout to be set in sysfs are : jp
>>> +(Japan), be(Belgian), cz(Czech), en(English), da(Danish), de(German),
>>> +es(Spain) , et(Estonian),
>>> +fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian),
>>> +hu (Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden),
>>> +pt(portugese)
>>
>> Can we keep this sorted?
> Ack . I will make this sorted.
> 
>> Also see below.
>>
>> ...
>>
>>> +struct keyboard_lang_data keyboard_lang_data[] = {
>>> +       {"en", 0},
>>
>> 0x0000 ?
> Ack . yes , I will update it.

While at it can you also please mark the table static const ?

> 
>>
>>> +       {"be", 0x080c},
>>> +       {"cz", 0x0405},
>>> +       {"da", 0x0406},
>>> +       {"de", 0x0c07},
>>> +       {"es", 0x2c0a},
>>> +       {"et", 0x0425},
>>> +       {"fr", 0x040c},
>>> +       {"fr-ch", 0x100c},
>>> +       {"hu", 0x040e},
>>> +       {"it", 0x0410},
>>> +       {"jp", 0x0411},
>>> +       {"nl", 0x0413},
>>> +       {"nn", 0x0414},
>>> +       {"pl", 0x0415},
>>> +       {"pt", 0x0816},
>>> +       {"sl", 0x041b},
>>> +       {"sv", 0x081d},
>>> +       {"tr", 0x041f},
>>> +};
>>
>> So, the above definitely has a meaning of the second byte as bit field. I believe
>> that be is something like be-be and so on.
> 
> Language Id is based on Language and Location . 
> You can refer attached pdf file for example 0x0411 is for Japanese layout but 0x04 is not basic 
> Currently , Lenovo ECFW  can change keyboard layout for only few language id by "SSKL" ASL method to fix 
> "=", "(', ")" numeric keys issue . hence , I have added only few language id (Actually I have received language id supported list from ECFW team).
> 
>> We have 0x04,0x08, 0x0c, 0x2c, and 0x10. 0x04 seems like a basic variant,
> By seeing the attached pdf , it seems not a basic variant.
> 
>> what about the rest?
> As per my understanding , ECFW is either not supporting rest or keyboard layout of others is similar to "English".
> If in future , ECFW supports any other keyboard layout then we can add it .
> 
>>
>> ...
>>
>>> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSKL",
>> &gskl_handle))) {
>>> +               /* Platform doesn't support GSKL */
>>> +               return -ENODEV;
>>
>> Perhaps EOPNOTSUPP is better?
> Ack . 
> How about keeping ENODEV  and changing only text as below :
> /* Platform doesn't have GSKL method */
> As per my understanding , in this case we will get ACPI failue only when GSKL method doesn’t exists in BIOS .
> So , I think its better to keep ENODEV.
> 
> Please correct me , if I am wrong.

I think we should keep -ENODEV here, since this path is hit on devices
which do not have the kbd-lang feature and returning -ENODEV from the
getter in this case is how this is handled in most other getters in
thinkpad_acpi.

>>
>>> +       }
>>
>> ...
>>
>>> +       char select_lang[80] = "";
>>> +       char lang[8] = "";
>>
>> I don't think we need assignments and moreover, we need these variables.
>> See below for the details.
>>
> Ack . 
> 
>>> +
>>> +       err = get_keyboard_lang(&output);
>>> +       if (err)
>>> +               return err;
>>> +
>>> +       for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
>>> +               if (i)
>>> +                       strcat(select_lang, " ");
>>> +
>>> +               if (output == keyboard_lang_data[i].lang_code) {
>>> +                       strcat(lang, "[");
>>> +                       strcat(lang, keyboard_lang_data[i].lang_str);
>>> +                       strcat(lang, "]");
>>> +                       strcat(select_lang, lang);
>>> +               } else {
>>> +                       strcat(select_lang, keyboard_lang_data[i].lang_str);
>>> +               }
>>> +       }
>>> +
>>> +       return sysfs_emit(buf, "%s\n", select_lang);
>>
>> We have sysfs_emit_at(), please use it instead of these ugly str*() calls.
> Ack . I will check about sysfs_emit_at() and get back on this .
> Thanks for suggestion.  
> 
>>
>>> +}
>>> +
>>> +static ssize_t keyboard_lang_store(struct device *dev,
>>> +                               struct device_attribute *attr,
>>> +                               const char *buf, size_t count) {
>>> +       int err, i;
>>
>>> +       bool lang_found = false;
>>
>> Redundant variable.
> 
> Ack . I think if we use sysfs_match_string()  then it will be redundant .
> But , I need to check it .

sysfs_match_string() only works on arrays of strings, in this case we have an array
of struct keyboard_lang_data, so using it here will not work.

>   
>>
>>> +       int lang_code = 0;
>>> +
>>> +       for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
>>> +               if (sysfs_streq(buf, keyboard_lang_data[i].lang_str)) {
>>> +                       lang_code = keyboard_lang_data[i].lang_code;
>>> +                       lang_found = true;
>>> +                       break;
>>> +               }
>>> +       }
>>
>> Don't we have sysfs_match_string() ?
> Ack . I will check it and get back .
> 
>>
>>> +       if (lang_found) {
>>
>> Use traditional pattern, like
>>
>> ret = sysfs_match_string(...);
>> if (ret < 0)
>>  return ret;
>>
> Noted 
> 
>>> +               lang_code = lang_code | 1 << 24;
>>> +
>>> +               /* Set language code */
>>> +               err = set_keyboard_lang_command(lang_code);
>>> +               if (err)
>>> +                       return err;
>>> +       } else {
>>
>>> +               pr_err("Unknown Keyboard language. Ignoring\n");
>>
>> Why not dev_err() ?
> 
> Ack . I will change it . The reason for using dev_err will only to provide better message to userspace . is it correct ?
>>
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       tpacpi_disclose_usertask(attr->attr.name,
>>> +                       "keyboard language is set to  %s\n", buf);
>>> +
>>> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "keyboard_lang");
>>> +
>>> +       return count;
>>> +}
>>
>>> +
>>
>> Redundant blank line.
>>
> Ack. I will correct it.
> 
>>> +static DEVICE_ATTR_RW(keyboard_lang);
>>
>> ...
>>
>>> +       /*
>>> +        * If support isn't available (ENODEV) then don't return an error
>>> +        * just don't create the sysfs group
>>
>> Missed period.
>>
> Ack . I will correct it.
> 
>>> +        */
>>
>> ...
>>
>>> +       /* Platform supports this feature - create the sysfs file */
>>> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj,
>>> + &kbdlang_attr_group);
>>> +
>>> +       return err;
>>
>> return sysfs_create_group();
>>
> 
> Ack . I will correct it .
> 
>>> +}
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
> 
> I will update patch on top of my last patch and send it for review  by next week .
> Please correct me , if I am missing something as I have just started pushing patch for upstream. 

Sounds good, thank you.

Regards,

Hans

