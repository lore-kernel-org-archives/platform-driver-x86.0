Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 21:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiKIVEy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiKIVEx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 16:04:53 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0138919016
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 13:04:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id y16so27669450wrt.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 13:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpDTv+JIuIhNizddHqvfs+rGWcUW3da70b1mp8O9eqY=;
        b=cRE6L6ae6epAwAGP5FSKh26Jw5+sUfy7xKXAyfL2Nxa+NC2C8kRxUCCwajsGc6wRb4
         8svzecciiAMU39V0yPPRCY8SRwYfDRD3uKjRx7BCaQ37K/ybTneyMY+ANmeywlpwlXCM
         jQ03MNteX4dTR5mDjh6LvUawAK2VntFAqq4nEmeIYJ3SOzOQbbqhW3IZ7snUyxddVH8g
         KF+3UWCJdqQXLuWrx1Zr1ds7tRAN500nCWxWDQ5X5IfA9KtusIwuY77RZmbcWeAm3uUq
         f2A/UZI+MlM4qUH5ArDKSOND/uwMl3V0KaHQaM2FYn8KuX9fQ43aT5g9HQkLFo90BAPV
         7pLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpDTv+JIuIhNizddHqvfs+rGWcUW3da70b1mp8O9eqY=;
        b=axPSXYrJdRgShJNki877SjFM4e6ThkmSI1I1+B3Pww1l+HVWfEyfnvEyghCC1YdE1c
         u/zD8YSEJ/XdxLtaLTDKzPWKLwGuqEdRm+mbdPFzYwQWh0F0KWNKOSOuMNw3NIvDkqDu
         XU+4YdL5XzypF9IW0swISMwvot4r3JIXdk7UpKTImTbsOx+Unbc4Z8FgoXEyI+BDq5T6
         QWBfsDFfrY0qv5DkkOS0aeSC0npSKCygBfloKB5qjW+V+Bp7fG1Y9ADbz+E5/YSndSPD
         3H5/SbXADb3GAVflDGCQksDO/KWLZhKTs4PHf293NOju7ruMsgWItIyRAKk8SZTH3DXd
         SDWA==
X-Gm-Message-State: ACrzQf12qfRJV75D9KLYWmwPXPwdnrx2Q9O8Rv5ndY9Y03FyhtVXaTSV
        DCSIhMmGfelfz1RCdAfKgYr9KsA0EZz4ha7VQBVO8PvC
X-Google-Smtp-Source: AMsMyM6wcLmPgNIpQevdyTzr1TZ3eX1BKGuWI8tGe6iwICJXNEJI7PxIDokLq4xKA+1vV4XlA+pqyin1HJd5iRlTjxs=
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id
 f15-20020a5d50cf000000b0023686df257fmr40200097wrt.374.1668027889344; Wed, 09
 Nov 2022 13:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com> <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
 <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com> <CAOOmCE9m5OO=Kou1RLpSANK9HYotrjSFojOF6_7gVcBUKOvO9A@mail.gmail.com>
 <5905b561-5686-07eb-e7d1-f1d6203561c6@redhat.com> <CAOOmCE9vdVnoMzePAzVrAHvhiur9J+o=VFxRRs=Yg8pxUjezag@mail.gmail.com>
 <4867796d-c400-aa6e-4740-cfa8f213eda8@redhat.com>
In-Reply-To: <4867796d-c400-aa6e-4740-cfa8f213eda8@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 9 Nov 2022 15:04:37 -0600
Message-ID: <CAOOmCE_3m5gNKcPg+jRJRHGwUBNTsthWtDkHhhzGra+=RZdZLQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 9, 2022 at 2:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/9/22 21:52, Jorge Lopez wrote:
> > On Wed, Nov 9, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrot=
e:
> >>
> >> Hi,
> >>
> >> On 11/9/22 21:00, Jorge Lopez wrote:
> >>> Hi Hans,
> >>>
> >>> On Wed, Nov 9, 2022 at 12:10 PM Hans de Goede <hdegoede@redhat.com> w=
rote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 11/9/22 18:24, Jorge Lopez wrote:
> >>>>> HI Hans,
> >>>>>
> >>>>> Please see questions and comments below.
> >>>>>
> >>>>> On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com> =
wrote:
> >>>>>>
> >>>>>> Hi Jorge,
> >>>>>>
> >>>>>> Review comments inline.
> >>>>>>
> >>>>>> On 10/20/22 22:10, Jorge Lopez wrote:
> >>>>>>> The purpose for this patch is submit HP BIOSCFG driver to be list=
 of
> >>>>>>> HP Linux kernel drivers.  The driver include a total of 12 files
> >>>>>>> broken in several patches.  This is set 1 of 4.
> >>>>>>>
> >>>>>>> HP BIOS Configuration driver purpose is to provide a driver suppo=
rting
> >>>>>>> the latest sysfs class firmware attributes framework allowing the=
 user
> >>>>>>> to change BIOS settings and security solutions on HP Inc.=E2=80=
=99s commercial
> >>>>>>> notebooks.
> >>>>>>>
> >>>>>>> Many features of HP Commercial PC=E2=80=99s can be managed using =
Windows
> >>>>>>> Management Instrumentation (WMI). WMI is an implementation of Web=
-Based
> >>>>>>> Enterprise Management (WBEM) that provides a standards-based inte=
rface
> >>>>>>> for changing and monitoring system settings.  HP BISOCFG driver p=
rovides
> >>>>>>> a native Linux solution and the exposed features facilitates the
> >>>>>>> migration to Linux environments.
> >>>>>>>
> >>>>>>> The Linux security features to be provided in hp-bioscfg driver e=
nables
> >>>>>>> managing the BIOS settings and security solutions via sysfs, a vi=
rtual
> >>>>>>> filesystem that can be used by user-mode applications.   The new
> >>>>>>> documentation cover features such Secure Platform Management, Sur=
e
> >>>>>>> Admin, and Sure Start.  Each section provides security feature
> >>>>>>> description and identifies sysfs directories and files exposed by
> >>>>>>> the driver.
> >>>>>>>
> >>>>>>> Many HP Commercial PC=E2=80=99s include a feature called Secure P=
latform
> >>>>>>> Management (SPM), which replaces older password-based BIOS settin=
gs
> >>>>>>> management with public key cryptography. PC secure product manage=
ment
> >>>>>>> begins when a target system is provisioned with cryptographic key=
s
> >>>>>>> that are used to ensure the integrity of communications between s=
ystem
> >>>>>>> management utilities and the BIOS.
> >>>>>>>
> >>>>>>> HP Commercial PC=E2=80=99s have several BIOS settings that contro=
l its behaviour
> >>>>>>> and capabilities, many of which are related to security. To preve=
nt
> >>>>>>> unauthorized changes to these settings, the system can be configu=
red
> >>>>>>> to use a Sure Admin cryptographic signature-based authorization s=
tring
> >>>>>>> that the BIOS will use to verify authorization to modify the sett=
ing.
> >>>>>>>
> >>>>>>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >>>>>>>
> >>>>>>> ---
> >>>>>>> Based on the latest platform-drivers-x86.git/for-next
> >>>>>>> ---
> >>>>>>>  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
> >>>>>>>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++=
++++++
> >>>>>>>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++=
++
> >>>>>>>  3 files changed, 1477 insertions(+)
> >>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-i=
nterface.c
> >>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> >>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attri=
butes.c
> >>>>>>>
> >>>>>>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interfac=
e.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..f0c919bf3ab0
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>>>> @@ -0,0 +1,285 @@
> >>>>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>>>> +/*
> >>>>>>> + * Functions corresponding to methods under BIOS interface GUID
> >>>>>>> + * for use with hp-bioscfg driver.
> >>>>>>> + *
> >>>>>>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +#include <linux/wmi.h>
> >>>>>>> +#include "bioscfg.h"
> >>>>>>> +
> >>>>>>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> >>>>>>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> >>>>>>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
> >>>>>>> +
> >>>>>>> +/*
> >>>>>>> + * set_attribute() - Update an attribute value
> >>>>>>> + * @a_name: The attribute name
> >>>>>>> + * @a_value: The attribute value
> >>>>>>> + *
> >>>>>>> + * Sets an attribute to new value
> >>>>>>> + */
> >>>>>>> +int hp_set_attribute(const char *a_name, const char *a_value)
> >>>>>>> +{
> >>>>>>> +     size_t security_area_size;
> >>>>>>> +     size_t a_name_size, a_value_size;
> >>>>>>> +     u16 *buffer =3D NULL;
> >>>>>>> +     u16 *start =3D NULL;
> >>>>>>> +     int  buffer_size;
> >>>>>>
> >>>>>> You have 2 spaces between int and buffer_size here, please drop
> >>>>>> one.
> >>>>>>
> >>>>>>
> >>>>>>> +     int ret;
> >>>>>>> +     int instance;
> >>>>>>> +     char *auth_empty_value =3D " ";
> >>>>>>> +
> >>>>>>> +     mutex_lock(&bioscfg_drv.mutex);
> >>>>>>> +     if (!bioscfg_drv.bios_attr_wdev) {
> >>>>>>> +             ret =3D -ENODEV;
> >>>>>>> +             goto out_set_attribute;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     instance =3D get_password_instance_for_type(SETUP_PASSWD);
> >>>>>>> +     if (instance < 0)
> >>>>>>> +             goto out_set_attribute;
> >>>>>>> +
> >>>>>>> +     if (strlen(bioscfg_drv.password_data[instance].current_pass=
word) =3D=3D 0)
> >>>>>>> +             strncpy(bioscfg_drv.password_data[instance].current=
_password,
> >>>>>>> +                     auth_empty_value,
> >>>>>>> +                     sizeof(bioscfg_drv.password_data[instance].=
current_password));
> >>>>>>
> >>>>>> strncpy does not guarantee 0 termination of the destination buffer=
,
> >>>>>> please use strscpy.
> >>>>>>
> >>>>>>> +
> >>>>>>> +     a_name_size =3D calculate_string_buffer(a_name);
> >>>>>>> +     a_value_size =3D calculate_string_buffer(a_value);
> >>>>>>> +     security_area_size =3D calculate_security_buffer(bioscfg_dr=
v.password_data[instance].current_password);
> >>>>>>> +     buffer_size =3D a_name_size + a_value_size + security_area_=
size;
> >>>>>>> +
> >>>>>>> +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> >>>>>>> +     if (!buffer) {
> >>>>>>> +             ret =3D -ENOMEM;
> >>>>>>> +             goto out_set_attribute;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     /* build variables to set */
> >>>>>>> +     start =3D buffer;
> >>>>>>> +     start =3D ascii_to_utf16_unicode(start, a_name);
> >>>>>>> +     if (!start)
> >>>>>>> +             goto out_set_attribute;
> >>>>>>> +
> >>>>>>> +     start =3D ascii_to_utf16_unicode(start, a_value);
> >>>>>>> +     if (!start)
> >>>>>>> +             goto out_set_attribute;
> >>>>>>> +
> >>>>>>> +     populate_security_buffer(start, bioscfg_drv.password_data[i=
nstance].current_password);
> >>>>>>> +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> >>>>>>> +
> >>>>>>> +
> >>>>>>> +out_set_attribute:
> >>>>>>> +     kfree(buffer);
> >>>>>>> +     mutex_unlock(&bioscfg_drv.mutex);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/*
> >>>>>>> + * hp_wmi_perform_query
> >>>>>>> + *
> >>>>>>> + * query:    The commandtype (enum hp_wmi_commandtype)
> >>>>>>> + * write:    The command (enum hp_wmi_command)
> >>>>>>> + * buffer:   Buffer used as input and/or output
> >>>>>>> + * insize:   Size of input buffer
> >>>>>>> + * outsize:  Size of output buffer
> >>>>>>> + *
> >>>>>>> + * returns zero on success
> >>>>>>> + *         an HP WMI query specific error code (which is positiv=
e)
> >>>>>>> + *         -EINVAL if the query was not successful at all
> >>>>>>> + *         -EINVAL if the output buffer size exceeds buffersize
> >>>>>>> + *
> >>>>>>> + * Note: The buffersize must at least be the maximum of the inpu=
t and output
> >>>>>>> + *       size. E.g. Battery info query is defined to have 1 byte=
 input
> >>>>>>> + *       and 128 byte output. The caller would do:
> >>>>>>> + *       buffer =3D kzalloc(128, GFP_KERNEL);
> >>>>>>> + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI=
_READ, buffer, 1, 128)
> >>>>>>> + */
> >>>>>>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command,=
 void *buffer, int insize, int outsize)
> >>>>>>> +{
> >>>>>>> +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFFER=
, NULL };
> >>>>>>> +     struct bios_return *bios_return;
> >>>>>>> +     union acpi_object *obj =3D NULL;
> >>>>>>> +     struct bios_args *args =3D NULL;
> >>>>>>> +     int mid, actual_insize, actual_outsize;
> >>>>>>> +     size_t bios_args_size;
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     mid =3D encode_outsize_for_pvsz(outsize);
> >>>>>>> +     if (WARN_ON(mid < 0))
> >>>>>>> +             return mid;
> >>>>>>> +
> >>>>>>> +     actual_insize =3D insize;
> >>>>>>> +     bios_args_size =3D struct_size(args, data, insize);
> >>>>>>> +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> >>>>>>> +     if (!args)
> >>>>>>> +             return -ENOMEM;
> >>>>>>> +
> >>>>>>> +     input.length =3D bios_args_size;
> >>>>>>> +     input.pointer =3D args;
> >>>>>>> +
> >>>>>>> +     args->signature =3D 0x55434553;
> >>>>>>> +     args->command =3D command;
> >>>>>>> +     args->commandtype =3D query;
> >>>>>>> +     args->datasize =3D insize;
> >>>>>>> +     memcpy(args->data, buffer, flex_array_size(args, data, insi=
ze));
> >>>>>>> +
> >>>>>>> +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &inpu=
t, &output);
> >>>>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>>>> +     if (ret)
> >>>>>>> +             goto out_free;
> >>>>>>> +
> >>>>>>> +     obj =3D output.pointer;
> >>>>>>> +     if (!obj) {
> >>>>>>> +             ret =3D -EINVAL;
> >>>>>>> +             goto out_free;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>
> >>>>>> You need to check the type of obj here before dereferencing
> >>>>>> obj as if it is a buffer.
> >>>>>>
> >>>>>>> +     bios_return =3D (struct bios_return *)obj->buffer.pointer;
> >>>>>>> +     ret =3D bios_return->return_code;
> >>>>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>>>> +     if (ret) {
> >>>>>>> +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> >>>>>>> +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> >>>>>>> +                     pr_warn("query 0x%x returned error 0x%x\n",=
 query, ret);
> >>>>>>> +             goto out_free;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     /* Ignore output data of zero size */
> >>>>>>> +     if (!outsize)
> >>>>>>> +             goto out_free;
> >>>>>>> +
> >>>>>>> +     actual_outsize =3D min(outsize, (int)(obj->buffer.length - =
sizeof(*bios_return)));
> >>>>>>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), =
actual_outsize);
> >>>>>>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsize=
);
> >>>>>>> +
> >>>>>>> +out_free:
> >>>>>>> +     kfree(obj);
> >>>>>>> +     kfree(args);
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +/*
> >>>>>>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unic=
ode
> >>>>>>> + *
> >>>>>>> + * @p:   Unicode buffer address
> >>>>>>> + * @str: string to convert to unicode
> >>>>>>> + *
> >>>>>>> + * Returns a void pointer to the buffer containing unicode strin=
g
> >>>>>>> + */
> >>>>>>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> >>>>>>> +{
> >>>>>>> +     int len =3D strlen(str);
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     /*
> >>>>>>> +      * Add null character when reading an empty string
> >>>>>>> +      */
> >>>>>>> +     if (len =3D=3D 0) {
> >>>>>>> +             *p++ =3D 2;
> >>>>>>> +             *p++ =3D (u8)0x00;
> >>>>>>> +             return p;
> >>>>>>
> >>>>>> This does not match with calculate_string_buffer() which will
> >>>>>> return 2 for a 0 length string while you are using 4 bytes here.
> >>>>>>
> >>>>>> I guess this may also be why you need to use " " for
> >>>>>> auth_empty_value above, so as to avoid this bug.
> >>>>>>
> >>>>> HP BIOS expects 2 characters when an empty string is being converte=
d
> >>>>> to u16 hence the reason for returning 2 instead of zero.  This is a=
n
> >>>>> intended behavior and needed when  allocating a buffer and writing =
to
> >>>>> BIOS.
> >>>>
> >>>> Right I understand that, it wants 2 characters for the 16 bit length
> >>>> word, but why not write 0 to that 16 bit length word. Why actually
> >>>> say the string-buffer length is 2 bytes long / and then write
> >>>> a 16-bit word with value 0?
> >>>>
> >>>> What you are doing now creates a 4 byte buffer like this:
> >>>>
> >>>> u8 buf[4] =3D { 0x02, 0x00, 0x00, 0x00 }
> >>>>
> >>>> Why not just create a 2 byte buffer like this:
> >>>>
> >>>> u8 buf[2] =3D { 0x00, 0x00 }
> >>>>
> >>>> ?
> >>>>
> >>>>
> >>>> Also I'm wondering why the empty auth string is " " and
> >>>> not "" ?
> >>>>
> >>>>
> >>>
> >>> The string returned for an empty string is 4 bytes.  The returned
> >>> string includes two bytes for the string size in bytes and the
> >>> remaining bytes are the string.
> >>> Size =3D  0x02, 0x00
> >>> String =3D 0x00, 0x00
> >>>
> >>> All strings return include the string size in bytes followed by the u=
16 string
> >>
> >> Right I understand that, but why is the "String =3D 0x00, 0x00"
> >> there ? All the non-0-length strings are not 0 terminated,
> >> why does the zero length string needs to be specified as length 2
> >> (1 u16) and then have that u16 be a 0 terminator ?
> >>
> > It is a specific format required by BIOS for any zero-length strings.
> > I don't know the reason why BIOS wants that format.
> >
> >
> >> Have you tried just using Size[2] =3D  0x00, 0x00 and String[0] for
> >> an empty string?
> >>
> >
> > I tried during the development process and each time the data is
> > rejected by BIOS.
>
> Ok, well in that case you are going to need your own
> ascii_to_utf16_unicode() to handle the weird case for the
> 0 sized string, so no need to move the dell-wmi-sysman versions
> to the shared wmi code.
>
> But please do start with a copy of the Dell function and then
> add the special case for the 0 len string, since the original
> version above does not properly handle errors.
>
> Also this means you need to update the hp calculate_string_buffer()
> copy to properly return 4 rather then 2 for the bufsize for
> a 0 length string.
>

I will do so. Thanks.
BTW, changes requested for sysman.c will require changes to two other
DELL source files;
biosattr-interface.c and passwordattr-interface.c.
All I can do is to verify it compiles ok.

> Regards,
>
> Hans
>
>
