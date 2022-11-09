Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E32C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 20:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiKIUwS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiKIUwS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 15:52:18 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC4B27B37
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 12:52:15 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id k8so27745936wrh.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5yUdbqrjuAvzkm+IXD5hXDGJv7vfYB8K4RXKJiWbCM=;
        b=HP2I4qZjTJ8xPg9iZCU29kSFY8M42TJYj+gtuuRVjQIuS1WphwDzJ5HAFdUL81JqSd
         fsUUKbgvqCZdchcrdE0Q2GJcU55h8h9FQ96pIZu1kDY8Jo6aihBdKJvFyqOwM5N5EBlt
         SU6rxeZGu4ETpeKnfL4zTbfOidSO+jshhOl94rEYcycYHMgOABM7HDq4kx+u50qL/vDH
         ueImZmSCeF/iSoFfSl8VZ+YxeQb851Pe9cSXz2AratYSHw0UaAyGtLqTBYNzIVNwvDhM
         6XhvtMhSNh1iGMZKq3JTe89/XsWyqDvsfkB4yATTgucv4x3wluvP1Nus4GFHXG1x4d4y
         GYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5yUdbqrjuAvzkm+IXD5hXDGJv7vfYB8K4RXKJiWbCM=;
        b=kkZFrIjEWXjvs+vm0zD/TCM9HfXQNojYASNM81DVbsTgrYCvgkilE9+Yq4T6bfqUVl
         t8Q+c7OJ4AOoU4yi5FM8gpToZ+g0d6S6K97ImqBB8+9KxfMbjK4UzRnJPIeEG70+cb7z
         NrcCtvYUzvpGsXzoZb5MyF7X4rxuCsZaXvrxvj0k7A4VeF5Ni8NPhtO00LfQLbMHz6nJ
         aLNfTQzDm/kAYuDJpdLQFib63jfpSXrMx9dXDpk3cJ4weybKfHCha7mOFK9EDeOGG+HT
         Pazsuotrj6BYIk/oJqE+aZ1BFyLQ9jm7qZv3h8VPwdQQ7pay3p3956EAluxAah6KM+GR
         6/TQ==
X-Gm-Message-State: ACrzQf0JjocA3SXgf0VQ3Tbc8rD0Dhf8m/XDHjlWVOz8EaPSUi+oGcdg
        yt8htw7LQr3F4XflaPVFo/vGvlEgL0FC9zgXReQ3DsKF
X-Google-Smtp-Source: AMsMyM4SnmIgow1UFdRpvRLqCXHRc8uqSdiUUjT4rXvpLmOtDw0Pzlp6/nhZQ+UX636Wuv40r3j1IVvcfgnMqH/ivPg=
X-Received: by 2002:a5d:6942:0:b0:23a:4e9d:c72c with SMTP id
 r2-20020a5d6942000000b0023a4e9dc72cmr20211319wrw.404.1668027133823; Wed, 09
 Nov 2022 12:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com> <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
 <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com> <CAOOmCE9m5OO=Kou1RLpSANK9HYotrjSFojOF6_7gVcBUKOvO9A@mail.gmail.com>
 <5905b561-5686-07eb-e7d1-f1d6203561c6@redhat.com>
In-Reply-To: <5905b561-5686-07eb-e7d1-f1d6203561c6@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 9 Nov 2022 14:52:02 -0600
Message-ID: <CAOOmCE9vdVnoMzePAzVrAHvhiur9J+o=VFxRRs=Yg8pxUjezag@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 9, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/9/22 21:00, Jorge Lopez wrote:
> > Hi Hans,
> >
> > On Wed, Nov 9, 2022 at 12:10 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >>
> >> Hi,
> >>
> >> On 11/9/22 18:24, Jorge Lopez wrote:
> >>> HI Hans,
> >>>
> >>> Please see questions and comments below.
> >>>
> >>> On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >>>>
> >>>> Hi Jorge,
> >>>>
> >>>> Review comments inline.
> >>>>
> >>>> On 10/20/22 22:10, Jorge Lopez wrote:
> >>>>> The purpose for this patch is submit HP BIOSCFG driver to be list o=
f
> >>>>> HP Linux kernel drivers.  The driver include a total of 12 files
> >>>>> broken in several patches.  This is set 1 of 4.
> >>>>>
> >>>>> HP BIOS Configuration driver purpose is to provide a driver support=
ing
> >>>>> the latest sysfs class firmware attributes framework allowing the u=
ser
> >>>>> to change BIOS settings and security solutions on HP Inc.=E2=80=99s=
 commercial
> >>>>> notebooks.
> >>>>>
> >>>>> Many features of HP Commercial PC=E2=80=99s can be managed using Wi=
ndows
> >>>>> Management Instrumentation (WMI). WMI is an implementation of Web-B=
ased
> >>>>> Enterprise Management (WBEM) that provides a standards-based interf=
ace
> >>>>> for changing and monitoring system settings.  HP BISOCFG driver pro=
vides
> >>>>> a native Linux solution and the exposed features facilitates the
> >>>>> migration to Linux environments.
> >>>>>
> >>>>> The Linux security features to be provided in hp-bioscfg driver ena=
bles
> >>>>> managing the BIOS settings and security solutions via sysfs, a virt=
ual
> >>>>> filesystem that can be used by user-mode applications.   The new
> >>>>> documentation cover features such Secure Platform Management, Sure
> >>>>> Admin, and Sure Start.  Each section provides security feature
> >>>>> description and identifies sysfs directories and files exposed by
> >>>>> the driver.
> >>>>>
> >>>>> Many HP Commercial PC=E2=80=99s include a feature called Secure Pla=
tform
> >>>>> Management (SPM), which replaces older password-based BIOS settings
> >>>>> management with public key cryptography. PC secure product manageme=
nt
> >>>>> begins when a target system is provisioned with cryptographic keys
> >>>>> that are used to ensure the integrity of communications between sys=
tem
> >>>>> management utilities and the BIOS.
> >>>>>
> >>>>> HP Commercial PC=E2=80=99s have several BIOS settings that control =
its behaviour
> >>>>> and capabilities, many of which are related to security. To prevent
> >>>>> unauthorized changes to these settings, the system can be configure=
d
> >>>>> to use a Sure Admin cryptographic signature-based authorization str=
ing
> >>>>> that the BIOS will use to verify authorization to modify the settin=
g.
> >>>>>
> >>>>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >>>>>
> >>>>> ---
> >>>>> Based on the latest platform-drivers-x86.git/for-next
> >>>>> ---
> >>>>>  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
> >>>>>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++++=
++++
> >>>>>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++++
> >>>>>  3 files changed, 1477 insertions(+)
> >>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-int=
erface.c
> >>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> >>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attribu=
tes.c
> >>>>>
> >>>>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.=
c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>> new file mode 100644
> >>>>> index 000000000000..f0c919bf3ab0
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>> @@ -0,0 +1,285 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>> +/*
> >>>>> + * Functions corresponding to methods under BIOS interface GUID
> >>>>> + * for use with hp-bioscfg driver.
> >>>>> + *
> >>>>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> >>>>> + */
> >>>>> +
> >>>>> +#include <linux/wmi.h>
> >>>>> +#include "bioscfg.h"
> >>>>> +
> >>>>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> >>>>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> >>>>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
> >>>>> +
> >>>>> +/*
> >>>>> + * set_attribute() - Update an attribute value
> >>>>> + * @a_name: The attribute name
> >>>>> + * @a_value: The attribute value
> >>>>> + *
> >>>>> + * Sets an attribute to new value
> >>>>> + */
> >>>>> +int hp_set_attribute(const char *a_name, const char *a_value)
> >>>>> +{
> >>>>> +     size_t security_area_size;
> >>>>> +     size_t a_name_size, a_value_size;
> >>>>> +     u16 *buffer =3D NULL;
> >>>>> +     u16 *start =3D NULL;
> >>>>> +     int  buffer_size;
> >>>>
> >>>> You have 2 spaces between int and buffer_size here, please drop
> >>>> one.
> >>>>
> >>>>
> >>>>> +     int ret;
> >>>>> +     int instance;
> >>>>> +     char *auth_empty_value =3D " ";
> >>>>> +
> >>>>> +     mutex_lock(&bioscfg_drv.mutex);
> >>>>> +     if (!bioscfg_drv.bios_attr_wdev) {
> >>>>> +             ret =3D -ENODEV;
> >>>>> +             goto out_set_attribute;
> >>>>> +     }
> >>>>> +
> >>>>> +     instance =3D get_password_instance_for_type(SETUP_PASSWD);
> >>>>> +     if (instance < 0)
> >>>>> +             goto out_set_attribute;
> >>>>> +
> >>>>> +     if (strlen(bioscfg_drv.password_data[instance].current_passwo=
rd) =3D=3D 0)
> >>>>> +             strncpy(bioscfg_drv.password_data[instance].current_p=
assword,
> >>>>> +                     auth_empty_value,
> >>>>> +                     sizeof(bioscfg_drv.password_data[instance].cu=
rrent_password));
> >>>>
> >>>> strncpy does not guarantee 0 termination of the destination buffer,
> >>>> please use strscpy.
> >>>>
> >>>>> +
> >>>>> +     a_name_size =3D calculate_string_buffer(a_name);
> >>>>> +     a_value_size =3D calculate_string_buffer(a_value);
> >>>>> +     security_area_size =3D calculate_security_buffer(bioscfg_drv.=
password_data[instance].current_password);
> >>>>> +     buffer_size =3D a_name_size + a_value_size + security_area_si=
ze;
> >>>>> +
> >>>>> +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> >>>>> +     if (!buffer) {
> >>>>> +             ret =3D -ENOMEM;
> >>>>> +             goto out_set_attribute;
> >>>>> +     }
> >>>>> +
> >>>>> +     /* build variables to set */
> >>>>> +     start =3D buffer;
> >>>>> +     start =3D ascii_to_utf16_unicode(start, a_name);
> >>>>> +     if (!start)
> >>>>> +             goto out_set_attribute;
> >>>>> +
> >>>>> +     start =3D ascii_to_utf16_unicode(start, a_value);
> >>>>> +     if (!start)
> >>>>> +             goto out_set_attribute;
> >>>>> +
> >>>>> +     populate_security_buffer(start, bioscfg_drv.password_data[ins=
tance].current_password);
> >>>>> +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> >>>>> +
> >>>>> +
> >>>>> +out_set_attribute:
> >>>>> +     kfree(buffer);
> >>>>> +     mutex_unlock(&bioscfg_drv.mutex);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * hp_wmi_perform_query
> >>>>> + *
> >>>>> + * query:    The commandtype (enum hp_wmi_commandtype)
> >>>>> + * write:    The command (enum hp_wmi_command)
> >>>>> + * buffer:   Buffer used as input and/or output
> >>>>> + * insize:   Size of input buffer
> >>>>> + * outsize:  Size of output buffer
> >>>>> + *
> >>>>> + * returns zero on success
> >>>>> + *         an HP WMI query specific error code (which is positive)
> >>>>> + *         -EINVAL if the query was not successful at all
> >>>>> + *         -EINVAL if the output buffer size exceeds buffersize
> >>>>> + *
> >>>>> + * Note: The buffersize must at least be the maximum of the input =
and output
> >>>>> + *       size. E.g. Battery info query is defined to have 1 byte i=
nput
> >>>>> + *       and 128 byte output. The caller would do:
> >>>>> + *       buffer =3D kzalloc(128, GFP_KERNEL);
> >>>>> + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_R=
EAD, buffer, 1, 128)
> >>>>> + */
> >>>>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command, v=
oid *buffer, int insize, int outsize)
> >>>>> +{
> >>>>> +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFFER, =
NULL };
> >>>>> +     struct bios_return *bios_return;
> >>>>> +     union acpi_object *obj =3D NULL;
> >>>>> +     struct bios_args *args =3D NULL;
> >>>>> +     int mid, actual_insize, actual_outsize;
> >>>>> +     size_t bios_args_size;
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     mid =3D encode_outsize_for_pvsz(outsize);
> >>>>> +     if (WARN_ON(mid < 0))
> >>>>> +             return mid;
> >>>>> +
> >>>>> +     actual_insize =3D insize;
> >>>>> +     bios_args_size =3D struct_size(args, data, insize);
> >>>>> +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> >>>>> +     if (!args)
> >>>>> +             return -ENOMEM;
> >>>>> +
> >>>>> +     input.length =3D bios_args_size;
> >>>>> +     input.pointer =3D args;
> >>>>> +
> >>>>> +     args->signature =3D 0x55434553;
> >>>>> +     args->command =3D command;
> >>>>> +     args->commandtype =3D query;
> >>>>> +     args->datasize =3D insize;
> >>>>> +     memcpy(args->data, buffer, flex_array_size(args, data, insize=
));
> >>>>> +
> >>>>> +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input,=
 &output);
> >>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>> +     if (ret)
> >>>>> +             goto out_free;
> >>>>> +
> >>>>> +     obj =3D output.pointer;
> >>>>> +     if (!obj) {
> >>>>> +             ret =3D -EINVAL;
> >>>>> +             goto out_free;
> >>>>> +     }
> >>>>> +
> >>>>
> >>>> You need to check the type of obj here before dereferencing
> >>>> obj as if it is a buffer.
> >>>>
> >>>>> +     bios_return =3D (struct bios_return *)obj->buffer.pointer;
> >>>>> +     ret =3D bios_return->return_code;
> >>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>> +     if (ret) {
> >>>>> +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> >>>>> +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> >>>>> +                     pr_warn("query 0x%x returned error 0x%x\n", q=
uery, ret);
> >>>>> +             goto out_free;
> >>>>> +     }
> >>>>> +
> >>>>> +     /* Ignore output data of zero size */
> >>>>> +     if (!outsize)
> >>>>> +             goto out_free;
> >>>>> +
> >>>>> +     actual_outsize =3D min(outsize, (int)(obj->buffer.length - si=
zeof(*bios_return)));
> >>>>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), ac=
tual_outsize);
> >>>>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> >>>>> +
> >>>>> +out_free:
> >>>>> +     kfree(obj);
> >>>>> +     kfree(args);
> >>>>> +     return ret;
> >>>>> +}
> >>>>> +
> >>>>> +/*
> >>>>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicod=
e
> >>>>> + *
> >>>>> + * @p:   Unicode buffer address
> >>>>> + * @str: string to convert to unicode
> >>>>> + *
> >>>>> + * Returns a void pointer to the buffer containing unicode string
> >>>>> + */
> >>>>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> >>>>> +{
> >>>>> +     int len =3D strlen(str);
> >>>>> +     int ret;
> >>>>> +
> >>>>> +     /*
> >>>>> +      * Add null character when reading an empty string
> >>>>> +      */
> >>>>> +     if (len =3D=3D 0) {
> >>>>> +             *p++ =3D 2;
> >>>>> +             *p++ =3D (u8)0x00;
> >>>>> +             return p;
> >>>>
> >>>> This does not match with calculate_string_buffer() which will
> >>>> return 2 for a 0 length string while you are using 4 bytes here.
> >>>>
> >>>> I guess this may also be why you need to use " " for
> >>>> auth_empty_value above, so as to avoid this bug.
> >>>>
> >>> HP BIOS expects 2 characters when an empty string is being converted
> >>> to u16 hence the reason for returning 2 instead of zero.  This is an
> >>> intended behavior and needed when  allocating a buffer and writing to
> >>> BIOS.
> >>
> >> Right I understand that, it wants 2 characters for the 16 bit length
> >> word, but why not write 0 to that 16 bit length word. Why actually
> >> say the string-buffer length is 2 bytes long / and then write
> >> a 16-bit word with value 0?
> >>
> >> What you are doing now creates a 4 byte buffer like this:
> >>
> >> u8 buf[4] =3D { 0x02, 0x00, 0x00, 0x00 }
> >>
> >> Why not just create a 2 byte buffer like this:
> >>
> >> u8 buf[2] =3D { 0x00, 0x00 }
> >>
> >> ?
> >>
> >>
> >> Also I'm wondering why the empty auth string is " " and
> >> not "" ?
> >>
> >>
> >
> > The string returned for an empty string is 4 bytes.  The returned
> > string includes two bytes for the string size in bytes and the
> > remaining bytes are the string.
> > Size =3D  0x02, 0x00
> > String =3D 0x00, 0x00
> >
> > All strings return include the string size in bytes followed by the u16=
 string
>
> Right I understand that, but why is the "String =3D 0x00, 0x00"
> there ? All the non-0-length strings are not 0 terminated,
> why does the zero length string needs to be specified as length 2
> (1 u16) and then have that u16 be a 0 terminator ?
>
It is a specific format required by BIOS for any zero-length strings.
I don't know the reason why BIOS wants that format.


> Have you tried just using Size[2] =3D  0x00, 0x00 and String[0] for
> an empty string?
>

I tried during the development process and each time the data is
rejected by BIOS.

> ###
>
> Also you did not answer this separate question:
>
> I'm wondering why the empty auth string is " " and not "" ?
>
That was an oversight.  It should be '""'.  I will make the change
>
> Regards,
>
> Hans
>
>
