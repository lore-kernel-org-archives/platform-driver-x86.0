Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53A6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 21:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiKIVMb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiKIVMb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 16:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573C1317FE
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 13:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668028290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TNMMO2xb77R//7ctbncUbs6F2Se3CBkOcvBB7SwCfAg=;
        b=Uf28PlJNfLDd2M6enpeJmF8iRgK0Pfw/PW5Ul1qfXbFJhhXkl7t5/xkyEb3t8D5pUEX5Vi
        skDjl4w29VNXDD+Z5SiVFU4IFif6mcUBYdV/SWode5nbPE21Qj6VwpE7/FMvJndWNi5N8D
        C2L6QgMTaGzSINpGgcQoh1M5JlyNwog=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-5yhlToxFN-eso1sD15K8zA-1; Wed, 09 Nov 2022 16:11:28 -0500
X-MC-Unique: 5yhlToxFN-eso1sD15K8zA-1
Received: by mail-ed1-f69.google.com with SMTP id h9-20020a05640250c900b00461d8ee12e2so52988edb.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 13:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMMO2xb77R//7ctbncUbs6F2Se3CBkOcvBB7SwCfAg=;
        b=yulAWd3baAPTOMCE6bMhs3TUk3hOrTdyCPTTltkFL6yqcrW78qtySJRgReaWTMMaoj
         k3IVOhRU14R8O/mwTMKwjATmNfLMeXwrZmH1P3HSmhH+T0Guxf4xQJ7DjUjdDrYgOowV
         plqQODq9VFSy8vFNnjZ4LgQi+0FJx7cPxkTqx+V+zxzBEi3iOqfcsPp8Oe9S4qbLi4Gg
         qg/rOFno7v8PuQwc2LYyKXE0TYBt5+JyPJlIpA1K7UWK7vTlN90q2wtoBRB8K04V4ASX
         U+SWuc4dIqe+lDSxbNJaofk8Zflnk4Mx/JP/IP/vZaVeYC+rKpPWxz/7Bww7Q7SsBdEs
         helg==
X-Gm-Message-State: ACrzQf2zFzuyeY/8Rrm+LOZHAmuje98D294S6YrKuItVoxqErkVIFI5Z
        SXXAp79jHi0cjn6d0/plv2z1w3n53TifnzB1cIqL7jevTU2eN9zdKcEMOG7wapLF7lKi0Yi/LOq
        IIzn183K6VB0xkYL0Q885jk8jLEIQyr2Ejg==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id x19-20020a1709064bd300b007313bdfb95cmr59411679ejv.677.1668028287189;
        Wed, 09 Nov 2022 13:11:27 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4pCYkD+oFRJjLN60vv9ifyKgHq6k+VMYFfbb6V1zj3Kq1SIgY/xsvQFUwXZq6VP75CvOrjYA==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id x19-20020a1709064bd300b007313bdfb95cmr59411669ejv.677.1668028286881;
        Wed, 09 Nov 2022 13:11:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id et19-20020a170907295300b0078df26efb7dsm6230397ejc.107.2022.11.09.13.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 13:11:26 -0800 (PST)
Message-ID: <42bfc56c-a32a-168d-74ae-a7458ad7b63b@redhat.com>
Date:   Wed, 9 Nov 2022 22:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
 <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
 <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
 <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com>
 <CAOOmCE9m5OO=Kou1RLpSANK9HYotrjSFojOF6_7gVcBUKOvO9A@mail.gmail.com>
 <5905b561-5686-07eb-e7d1-f1d6203561c6@redhat.com>
 <CAOOmCE9vdVnoMzePAzVrAHvhiur9J+o=VFxRRs=Yg8pxUjezag@mail.gmail.com>
 <4867796d-c400-aa6e-4740-cfa8f213eda8@redhat.com>
 <CAOOmCE_3m5gNKcPg+jRJRHGwUBNTsthWtDkHhhzGra+=RZdZLQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE_3m5gNKcPg+jRJRHGwUBNTsthWtDkHhhzGra+=RZdZLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/9/22 22:04, Jorge Lopez wrote:
> On Wed, Nov 9, 2022 at 2:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/9/22 21:52, Jorge Lopez wrote:
>>> On Wed, Nov 9, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 11/9/22 21:00, Jorge Lopez wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Wed, Nov 9, 2022 at 12:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 11/9/22 18:24, Jorge Lopez wrote:
>>>>>>> HI Hans,
>>>>>>>
>>>>>>> Please see questions and comments below.
>>>>>>>
>>>>>>> On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>
>>>>>>>> Hi Jorge,
>>>>>>>>
>>>>>>>> Review comments inline.
>>>>>>>>
>>>>>>>> On 10/20/22 22:10, Jorge Lopez wrote:
>>>>>>>>> The purpose for this patch is submit HP BIOSCFG driver to be list of
>>>>>>>>> HP Linux kernel drivers.  The driver include a total of 12 files
>>>>>>>>> broken in several patches.  This is set 1 of 4.
>>>>>>>>>
>>>>>>>>> HP BIOS Configuration driver purpose is to provide a driver supporting
>>>>>>>>> the latest sysfs class firmware attributes framework allowing the user
>>>>>>>>> to change BIOS settings and security solutions on HP Inc.’s commercial
>>>>>>>>> notebooks.
>>>>>>>>>
>>>>>>>>> Many features of HP Commercial PC’s can be managed using Windows
>>>>>>>>> Management Instrumentation (WMI). WMI is an implementation of Web-Based
>>>>>>>>> Enterprise Management (WBEM) that provides a standards-based interface
>>>>>>>>> for changing and monitoring system settings.  HP BISOCFG driver provides
>>>>>>>>> a native Linux solution and the exposed features facilitates the
>>>>>>>>> migration to Linux environments.
>>>>>>>>>
>>>>>>>>> The Linux security features to be provided in hp-bioscfg driver enables
>>>>>>>>> managing the BIOS settings and security solutions via sysfs, a virtual
>>>>>>>>> filesystem that can be used by user-mode applications.   The new
>>>>>>>>> documentation cover features such Secure Platform Management, Sure
>>>>>>>>> Admin, and Sure Start.  Each section provides security feature
>>>>>>>>> description and identifies sysfs directories and files exposed by
>>>>>>>>> the driver.
>>>>>>>>>
>>>>>>>>> Many HP Commercial PC’s include a feature called Secure Platform
>>>>>>>>> Management (SPM), which replaces older password-based BIOS settings
>>>>>>>>> management with public key cryptography. PC secure product management
>>>>>>>>> begins when a target system is provisioned with cryptographic keys
>>>>>>>>> that are used to ensure the integrity of communications between system
>>>>>>>>> management utilities and the BIOS.
>>>>>>>>>
>>>>>>>>> HP Commercial PC’s have several BIOS settings that control its behaviour
>>>>>>>>> and capabilities, many of which are related to security. To prevent
>>>>>>>>> unauthorized changes to these settings, the system can be configured
>>>>>>>>> to use a Sure Admin cryptographic signature-based authorization string
>>>>>>>>> that the BIOS will use to verify authorization to modify the setting.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>> Based on the latest platform-drivers-x86.git/for-next
>>>>>>>>> ---
>>>>>>>>>  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
>>>>>>>>>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++++++++
>>>>>>>>>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++++
>>>>>>>>>  3 files changed, 1477 insertions(+)
>>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
>>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
>>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..f0c919bf3ab0
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
>>>>>>>>> @@ -0,0 +1,285 @@
>>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>>> +/*
>>>>>>>>> + * Functions corresponding to methods under BIOS interface GUID
>>>>>>>>> + * for use with hp-bioscfg driver.
>>>>>>>>> + *
>>>>>>>>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
>>>>>>>>> + */
>>>>>>>>> +
>>>>>>>>> +#include <linux/wmi.h>
>>>>>>>>> +#include "bioscfg.h"
>>>>>>>>> +
>>>>>>>>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
>>>>>>>>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
>>>>>>>>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * set_attribute() - Update an attribute value
>>>>>>>>> + * @a_name: The attribute name
>>>>>>>>> + * @a_value: The attribute value
>>>>>>>>> + *
>>>>>>>>> + * Sets an attribute to new value
>>>>>>>>> + */
>>>>>>>>> +int hp_set_attribute(const char *a_name, const char *a_value)
>>>>>>>>> +{
>>>>>>>>> +     size_t security_area_size;
>>>>>>>>> +     size_t a_name_size, a_value_size;
>>>>>>>>> +     u16 *buffer = NULL;
>>>>>>>>> +     u16 *start = NULL;
>>>>>>>>> +     int  buffer_size;
>>>>>>>>
>>>>>>>> You have 2 spaces between int and buffer_size here, please drop
>>>>>>>> one.
>>>>>>>>
>>>>>>>>
>>>>>>>>> +     int ret;
>>>>>>>>> +     int instance;
>>>>>>>>> +     char *auth_empty_value = " ";
>>>>>>>>> +
>>>>>>>>> +     mutex_lock(&bioscfg_drv.mutex);
>>>>>>>>> +     if (!bioscfg_drv.bios_attr_wdev) {
>>>>>>>>> +             ret = -ENODEV;
>>>>>>>>> +             goto out_set_attribute;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     instance = get_password_instance_for_type(SETUP_PASSWD);
>>>>>>>>> +     if (instance < 0)
>>>>>>>>> +             goto out_set_attribute;
>>>>>>>>> +
>>>>>>>>> +     if (strlen(bioscfg_drv.password_data[instance].current_password) == 0)
>>>>>>>>> +             strncpy(bioscfg_drv.password_data[instance].current_password,
>>>>>>>>> +                     auth_empty_value,
>>>>>>>>> +                     sizeof(bioscfg_drv.password_data[instance].current_password));
>>>>>>>>
>>>>>>>> strncpy does not guarantee 0 termination of the destination buffer,
>>>>>>>> please use strscpy.
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +     a_name_size = calculate_string_buffer(a_name);
>>>>>>>>> +     a_value_size = calculate_string_buffer(a_value);
>>>>>>>>> +     security_area_size = calculate_security_buffer(bioscfg_drv.password_data[instance].current_password);
>>>>>>>>> +     buffer_size = a_name_size + a_value_size + security_area_size;
>>>>>>>>> +
>>>>>>>>> +     buffer = kzalloc(buffer_size, GFP_KERNEL);
>>>>>>>>> +     if (!buffer) {
>>>>>>>>> +             ret = -ENOMEM;
>>>>>>>>> +             goto out_set_attribute;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /* build variables to set */
>>>>>>>>> +     start = buffer;
>>>>>>>>> +     start = ascii_to_utf16_unicode(start, a_name);
>>>>>>>>> +     if (!start)
>>>>>>>>> +             goto out_set_attribute;
>>>>>>>>> +
>>>>>>>>> +     start = ascii_to_utf16_unicode(start, a_value);
>>>>>>>>> +     if (!start)
>>>>>>>>> +             goto out_set_attribute;
>>>>>>>>> +
>>>>>>>>> +     populate_security_buffer(start, bioscfg_drv.password_data[instance].current_password);
>>>>>>>>> +     ret = hp_wmi_set_bios_setting(buffer, buffer_size);
>>>>>>>>> +
>>>>>>>>> +
>>>>>>>>> +out_set_attribute:
>>>>>>>>> +     kfree(buffer);
>>>>>>>>> +     mutex_unlock(&bioscfg_drv.mutex);
>>>>>>>>> +     return ret;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * hp_wmi_perform_query
>>>>>>>>> + *
>>>>>>>>> + * query:    The commandtype (enum hp_wmi_commandtype)
>>>>>>>>> + * write:    The command (enum hp_wmi_command)
>>>>>>>>> + * buffer:   Buffer used as input and/or output
>>>>>>>>> + * insize:   Size of input buffer
>>>>>>>>> + * outsize:  Size of output buffer
>>>>>>>>> + *
>>>>>>>>> + * returns zero on success
>>>>>>>>> + *         an HP WMI query specific error code (which is positive)
>>>>>>>>> + *         -EINVAL if the query was not successful at all
>>>>>>>>> + *         -EINVAL if the output buffer size exceeds buffersize
>>>>>>>>> + *
>>>>>>>>> + * Note: The buffersize must at least be the maximum of the input and output
>>>>>>>>> + *       size. E.g. Battery info query is defined to have 1 byte input
>>>>>>>>> + *       and 128 byte output. The caller would do:
>>>>>>>>> + *       buffer = kzalloc(128, GFP_KERNEL);
>>>>>>>>> + *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
>>>>>>>>> + */
>>>>>>>>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer, int insize, int outsize)
>>>>>>>>> +{
>>>>>>>>> +     struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>>>>>>> +     struct bios_return *bios_return;
>>>>>>>>> +     union acpi_object *obj = NULL;
>>>>>>>>> +     struct bios_args *args = NULL;
>>>>>>>>> +     int mid, actual_insize, actual_outsize;
>>>>>>>>> +     size_t bios_args_size;
>>>>>>>>> +     int ret;
>>>>>>>>> +
>>>>>>>>> +     mid = encode_outsize_for_pvsz(outsize);
>>>>>>>>> +     if (WARN_ON(mid < 0))
>>>>>>>>> +             return mid;
>>>>>>>>> +
>>>>>>>>> +     actual_insize = insize;
>>>>>>>>> +     bios_args_size = struct_size(args, data, insize);
>>>>>>>>> +     args = kmalloc(bios_args_size, GFP_KERNEL);
>>>>>>>>> +     if (!args)
>>>>>>>>> +             return -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +     input.length = bios_args_size;
>>>>>>>>> +     input.pointer = args;
>>>>>>>>> +
>>>>>>>>> +     args->signature = 0x55434553;
>>>>>>>>> +     args->command = command;
>>>>>>>>> +     args->commandtype = query;
>>>>>>>>> +     args->datasize = insize;
>>>>>>>>> +     memcpy(args->data, buffer, flex_array_size(args, data, insize));
>>>>>>>>> +
>>>>>>>>> +     ret = wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &output);
>>>>>>>>> +     bioscfg_drv.last_wmi_status = ret;
>>>>>>>>> +     if (ret)
>>>>>>>>> +             goto out_free;
>>>>>>>>> +
>>>>>>>>> +     obj = output.pointer;
>>>>>>>>> +     if (!obj) {
>>>>>>>>> +             ret = -EINVAL;
>>>>>>>>> +             goto out_free;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>
>>>>>>>> You need to check the type of obj here before dereferencing
>>>>>>>> obj as if it is a buffer.
>>>>>>>>
>>>>>>>>> +     bios_return = (struct bios_return *)obj->buffer.pointer;
>>>>>>>>> +     ret = bios_return->return_code;
>>>>>>>>> +     bioscfg_drv.last_wmi_status = ret;
>>>>>>>>> +     if (ret) {
>>>>>>>>> +             if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
>>>>>>>>> +                 ret != HPWMI_RET_UNKNOWN_CMDTYPE)
>>>>>>>>> +                     pr_warn("query 0x%x returned error 0x%x\n", query, ret);
>>>>>>>>> +             goto out_free;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /* Ignore output data of zero size */
>>>>>>>>> +     if (!outsize)
>>>>>>>>> +             goto out_free;
>>>>>>>>> +
>>>>>>>>> +     actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
>>>>>>>>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
>>>>>>>>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsize);
>>>>>>>>> +
>>>>>>>>> +out_free:
>>>>>>>>> +     kfree(obj);
>>>>>>>>> +     kfree(args);
>>>>>>>>> +     return ret;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
>>>>>>>>> + *
>>>>>>>>> + * @p:   Unicode buffer address
>>>>>>>>> + * @str: string to convert to unicode
>>>>>>>>> + *
>>>>>>>>> + * Returns a void pointer to the buffer containing unicode string
>>>>>>>>> + */
>>>>>>>>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
>>>>>>>>> +{
>>>>>>>>> +     int len = strlen(str);
>>>>>>>>> +     int ret;
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * Add null character when reading an empty string
>>>>>>>>> +      */
>>>>>>>>> +     if (len == 0) {
>>>>>>>>> +             *p++ = 2;
>>>>>>>>> +             *p++ = (u8)0x00;
>>>>>>>>> +             return p;
>>>>>>>>
>>>>>>>> This does not match with calculate_string_buffer() which will
>>>>>>>> return 2 for a 0 length string while you are using 4 bytes here.
>>>>>>>>
>>>>>>>> I guess this may also be why you need to use " " for
>>>>>>>> auth_empty_value above, so as to avoid this bug.
>>>>>>>>
>>>>>>> HP BIOS expects 2 characters when an empty string is being converted
>>>>>>> to u16 hence the reason for returning 2 instead of zero.  This is an
>>>>>>> intended behavior and needed when  allocating a buffer and writing to
>>>>>>> BIOS.
>>>>>>
>>>>>> Right I understand that, it wants 2 characters for the 16 bit length
>>>>>> word, but why not write 0 to that 16 bit length word. Why actually
>>>>>> say the string-buffer length is 2 bytes long / and then write
>>>>>> a 16-bit word with value 0?
>>>>>>
>>>>>> What you are doing now creates a 4 byte buffer like this:
>>>>>>
>>>>>> u8 buf[4] = { 0x02, 0x00, 0x00, 0x00 }
>>>>>>
>>>>>> Why not just create a 2 byte buffer like this:
>>>>>>
>>>>>> u8 buf[2] = { 0x00, 0x00 }
>>>>>>
>>>>>> ?
>>>>>>
>>>>>>
>>>>>> Also I'm wondering why the empty auth string is " " and
>>>>>> not "" ?
>>>>>>
>>>>>>
>>>>>
>>>>> The string returned for an empty string is 4 bytes.  The returned
>>>>> string includes two bytes for the string size in bytes and the
>>>>> remaining bytes are the string.
>>>>> Size =  0x02, 0x00
>>>>> String = 0x00, 0x00
>>>>>
>>>>> All strings return include the string size in bytes followed by the u16 string
>>>>
>>>> Right I understand that, but why is the "String = 0x00, 0x00"
>>>> there ? All the non-0-length strings are not 0 terminated,
>>>> why does the zero length string needs to be specified as length 2
>>>> (1 u16) and then have that u16 be a 0 terminator ?
>>>>
>>> It is a specific format required by BIOS for any zero-length strings.
>>> I don't know the reason why BIOS wants that format.
>>>
>>>
>>>> Have you tried just using Size[2] =  0x00, 0x00 and String[0] for
>>>> an empty string?
>>>>
>>>
>>> I tried during the development process and each time the data is
>>> rejected by BIOS.
>>
>> Ok, well in that case you are going to need your own
>> ascii_to_utf16_unicode() to handle the weird case for the
>> 0 sized string, so no need to move the dell-wmi-sysman versions
>> to the shared wmi code.
>>
>> But please do start with a copy of the Dell function and then
>> add the special case for the 0 len string, since the original
>> version above does not properly handle errors.
>>
>> Also this means you need to update the hp calculate_string_buffer()
>> copy to properly return 4 rather then 2 for the bufsize for
>> a 0 length string.
>>
> 
> I will do so. Thanks.
> BTW, changes requested for sysman.c will require changes to two other
> DELL source files;
> biosattr-interface.c and passwordattr-interface.c.
> All I can do is to verify it compiles ok.

Note that since you now need a special version to deal
with the 0 length string weirdness, you can just make
a private copy of the dell functions into the hp code
and then modify that to add the special case for the
0 length strings.

So there is no longer a need to move the dell versions
out into wmi.c since the hp code will need a modified
version anyways (so the code cannot be shared).

Regards,

Hans

