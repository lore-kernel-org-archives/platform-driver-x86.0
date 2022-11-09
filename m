Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3713C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 20:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiKIUBJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiKIUBB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 15:01:01 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409712F01F
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 12:00:57 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id k8so27585959wrh.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ozu7FnchFLIMl3eeDy2boQ+HdE5HZdue5yX2LXH4CI=;
        b=K/rlj2NdRGIYQQgZxbckv49p1fJOyCMwj9lKGpXc0xmfcaSfovKP8Amic6VMkgS9Me
         anzzsUEFy41yadh0jreO1Q3MCBT41nSh+qzOjpu4pLMLhSGcH6n3JOHPGfQzxTo7vsSy
         y2pzU1ivTr0j/awZQY/CB401DxiGMQj1q6of9lkzAZEUlhqfs9Ce8a1Osm71Sty2j4g3
         PN1FZ68WIv4XBNeTlQZ1UDTyHUlUnFSwVnaP/bUp9hanZ/uPvFh12DXMDCfZKLLLAw4I
         1gvYn9IVAnkdcYyKI5BU6l1Y76EBpng3j1quPPdOUzCosMzg6xwjl8ADOv/foHvxy6/H
         l6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ozu7FnchFLIMl3eeDy2boQ+HdE5HZdue5yX2LXH4CI=;
        b=xSvwQsfSvU8SV9YvGk2ZW8hlu6D7/DnJov9KM+Va6OJlS1zjCyTGo3tMCLzM+cWzZY
         qoAP/SmiZ3d3jTYIz5myJFQfHnGl6QPm6IMupTczp6f22pvaq0YVhXOpkyk7c1L8C9ro
         KPoI4JDVdTYjPLP+THEpOqgj3Dz0FLbxN2qLSpSNNEtPVVW/MVMzQzTZjyaNLPbJ07Ch
         G546Q1asgZMD9qvgAi9gBNR8LZJBjqXTHpiGrqgK7oNNW2vKYVyZfl4tJN7xjmqZRctK
         2kN95FLFqam1ALjR1nmQ5SE8F0wcU1Ozoii+88vssgHVzTrqIRZx+vDKR8Dxncp8VtCP
         lFAg==
X-Gm-Message-State: ACrzQf2bPOjbwc5QvEQAmXbRoEHnW4uGDo1b+sD5vQ2phLT8Ww0MxP0V
        Hn0BN7ao8m9vw/qNDuqOcdeNdij8YIb4L3qauXnI0OpA
X-Google-Smtp-Source: AMsMyM7AOglvzpCNqB6TklUFfrUuwXwO5/+f8YQPXS+6EdyMNUQgSeivi2ht3AnS2kH4sDuXkeeo+eLPx8nRZeGsxRc=
X-Received: by 2002:adf:f547:0:b0:23a:239b:7e6a with SMTP id
 j7-20020adff547000000b0023a239b7e6amr19814580wrp.667.1668024055287; Wed, 09
 Nov 2022 12:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com> <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
 <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com>
In-Reply-To: <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 9 Nov 2022 14:00:43 -0600
Message-ID: <CAOOmCE9m5OO=Kou1RLpSANK9HYotrjSFojOF6_7gVcBUKOvO9A@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Wed, Nov 9, 2022 at 12:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/9/22 18:24, Jorge Lopez wrote:
> > HI Hans,
> >
> > Please see questions and comments below.
> >
> > On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com> wrot=
e:
> >>
> >> Hi Jorge,
> >>
> >> Review comments inline.
> >>
> >> On 10/20/22 22:10, Jorge Lopez wrote:
> >>> The purpose for this patch is submit HP BIOSCFG driver to be list of
> >>> HP Linux kernel drivers.  The driver include a total of 12 files
> >>> broken in several patches.  This is set 1 of 4.
> >>>
> >>> HP BIOS Configuration driver purpose is to provide a driver supportin=
g
> >>> the latest sysfs class firmware attributes framework allowing the use=
r
> >>> to change BIOS settings and security solutions on HP Inc.=E2=80=99s c=
ommercial
> >>> notebooks.
> >>>
> >>> Many features of HP Commercial PC=E2=80=99s can be managed using Wind=
ows
> >>> Management Instrumentation (WMI). WMI is an implementation of Web-Bas=
ed
> >>> Enterprise Management (WBEM) that provides a standards-based interfac=
e
> >>> for changing and monitoring system settings.  HP BISOCFG driver provi=
des
> >>> a native Linux solution and the exposed features facilitates the
> >>> migration to Linux environments.
> >>>
> >>> The Linux security features to be provided in hp-bioscfg driver enabl=
es
> >>> managing the BIOS settings and security solutions via sysfs, a virtua=
l
> >>> filesystem that can be used by user-mode applications.   The new
> >>> documentation cover features such Secure Platform Management, Sure
> >>> Admin, and Sure Start.  Each section provides security feature
> >>> description and identifies sysfs directories and files exposed by
> >>> the driver.
> >>>
> >>> Many HP Commercial PC=E2=80=99s include a feature called Secure Platf=
orm
> >>> Management (SPM), which replaces older password-based BIOS settings
> >>> management with public key cryptography. PC secure product management
> >>> begins when a target system is provisioned with cryptographic keys
> >>> that are used to ensure the integrity of communications between syste=
m
> >>> management utilities and the BIOS.
> >>>
> >>> HP Commercial PC=E2=80=99s have several BIOS settings that control it=
s behaviour
> >>> and capabilities, many of which are related to security. To prevent
> >>> unauthorized changes to these settings, the system can be configured
> >>> to use a Sure Admin cryptographic signature-based authorization strin=
g
> >>> that the BIOS will use to verify authorization to modify the setting.
> >>>
> >>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >>>
> >>> ---
> >>> Based on the latest platform-drivers-x86.git/for-next
> >>> ---
> >>>  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
> >>>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++++++=
++
> >>>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++++
> >>>  3 files changed, 1477 insertions(+)
> >>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-inter=
face.c
> >>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> >>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attribute=
s.c
> >>>
> >>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c =
b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>> new file mode 100644
> >>> index 000000000000..f0c919bf3ab0
> >>> --- /dev/null
> >>> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>> @@ -0,0 +1,285 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Functions corresponding to methods under BIOS interface GUID
> >>> + * for use with hp-bioscfg driver.
> >>> + *
> >>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> >>> + */
> >>> +
> >>> +#include <linux/wmi.h>
> >>> +#include "bioscfg.h"
> >>> +
> >>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> >>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> >>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
> >>> +
> >>> +/*
> >>> + * set_attribute() - Update an attribute value
> >>> + * @a_name: The attribute name
> >>> + * @a_value: The attribute value
> >>> + *
> >>> + * Sets an attribute to new value
> >>> + */
> >>> +int hp_set_attribute(const char *a_name, const char *a_value)
> >>> +{
> >>> +     size_t security_area_size;
> >>> +     size_t a_name_size, a_value_size;
> >>> +     u16 *buffer =3D NULL;
> >>> +     u16 *start =3D NULL;
> >>> +     int  buffer_size;
> >>
> >> You have 2 spaces between int and buffer_size here, please drop
> >> one.
> >>
> >>
> >>> +     int ret;
> >>> +     int instance;
> >>> +     char *auth_empty_value =3D " ";
> >>> +
> >>> +     mutex_lock(&bioscfg_drv.mutex);
> >>> +     if (!bioscfg_drv.bios_attr_wdev) {
> >>> +             ret =3D -ENODEV;
> >>> +             goto out_set_attribute;
> >>> +     }
> >>> +
> >>> +     instance =3D get_password_instance_for_type(SETUP_PASSWD);
> >>> +     if (instance < 0)
> >>> +             goto out_set_attribute;
> >>> +
> >>> +     if (strlen(bioscfg_drv.password_data[instance].current_password=
) =3D=3D 0)
> >>> +             strncpy(bioscfg_drv.password_data[instance].current_pas=
sword,
> >>> +                     auth_empty_value,
> >>> +                     sizeof(bioscfg_drv.password_data[instance].curr=
ent_password));
> >>
> >> strncpy does not guarantee 0 termination of the destination buffer,
> >> please use strscpy.
> >>
> >>> +
> >>> +     a_name_size =3D calculate_string_buffer(a_name);
> >>> +     a_value_size =3D calculate_string_buffer(a_value);
> >>> +     security_area_size =3D calculate_security_buffer(bioscfg_drv.pa=
ssword_data[instance].current_password);
> >>> +     buffer_size =3D a_name_size + a_value_size + security_area_size=
;
> >>> +
> >>> +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> >>> +     if (!buffer) {
> >>> +             ret =3D -ENOMEM;
> >>> +             goto out_set_attribute;
> >>> +     }
> >>> +
> >>> +     /* build variables to set */
> >>> +     start =3D buffer;
> >>> +     start =3D ascii_to_utf16_unicode(start, a_name);
> >>> +     if (!start)
> >>> +             goto out_set_attribute;
> >>> +
> >>> +     start =3D ascii_to_utf16_unicode(start, a_value);
> >>> +     if (!start)
> >>> +             goto out_set_attribute;
> >>> +
> >>> +     populate_security_buffer(start, bioscfg_drv.password_data[insta=
nce].current_password);
> >>> +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> >>> +
> >>> +
> >>> +out_set_attribute:
> >>> +     kfree(buffer);
> >>> +     mutex_unlock(&bioscfg_drv.mutex);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * hp_wmi_perform_query
> >>> + *
> >>> + * query:    The commandtype (enum hp_wmi_commandtype)
> >>> + * write:    The command (enum hp_wmi_command)
> >>> + * buffer:   Buffer used as input and/or output
> >>> + * insize:   Size of input buffer
> >>> + * outsize:  Size of output buffer
> >>> + *
> >>> + * returns zero on success
> >>> + *         an HP WMI query specific error code (which is positive)
> >>> + *         -EINVAL if the query was not successful at all
> >>> + *         -EINVAL if the output buffer size exceeds buffersize
> >>> + *
> >>> + * Note: The buffersize must at least be the maximum of the input an=
d output
> >>> + *       size. E.g. Battery info query is defined to have 1 byte inp=
ut
> >>> + *       and 128 byte output. The caller would do:
> >>> + *       buffer =3D kzalloc(128, GFP_KERNEL);
> >>> + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_REA=
D, buffer, 1, 128)
> >>> + */
> >>> +int hp_wmi_perform_query(int query, enum hp_wmi_command command, voi=
d *buffer, int insize, int outsize)
> >>> +{
> >>> +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFFER, NU=
LL };
> >>> +     struct bios_return *bios_return;
> >>> +     union acpi_object *obj =3D NULL;
> >>> +     struct bios_args *args =3D NULL;
> >>> +     int mid, actual_insize, actual_outsize;
> >>> +     size_t bios_args_size;
> >>> +     int ret;
> >>> +
> >>> +     mid =3D encode_outsize_for_pvsz(outsize);
> >>> +     if (WARN_ON(mid < 0))
> >>> +             return mid;
> >>> +
> >>> +     actual_insize =3D insize;
> >>> +     bios_args_size =3D struct_size(args, data, insize);
> >>> +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> >>> +     if (!args)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     input.length =3D bios_args_size;
> >>> +     input.pointer =3D args;
> >>> +
> >>> +     args->signature =3D 0x55434553;
> >>> +     args->command =3D command;
> >>> +     args->commandtype =3D query;
> >>> +     args->datasize =3D insize;
> >>> +     memcpy(args->data, buffer, flex_array_size(args, data, insize))=
;
> >>> +
> >>> +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &=
output);
> >>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>> +     if (ret)
> >>> +             goto out_free;
> >>> +
> >>> +     obj =3D output.pointer;
> >>> +     if (!obj) {
> >>> +             ret =3D -EINVAL;
> >>> +             goto out_free;
> >>> +     }
> >>> +
> >>
> >> You need to check the type of obj here before dereferencing
> >> obj as if it is a buffer.
> >>
> >>> +     bios_return =3D (struct bios_return *)obj->buffer.pointer;
> >>> +     ret =3D bios_return->return_code;
> >>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>> +     if (ret) {
> >>> +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> >>> +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> >>> +                     pr_warn("query 0x%x returned error 0x%x\n", que=
ry, ret);
> >>> +             goto out_free;
> >>> +     }
> >>> +
> >>> +     /* Ignore output data of zero size */
> >>> +     if (!outsize)
> >>> +             goto out_free;
> >>> +
> >>> +     actual_outsize =3D min(outsize, (int)(obj->buffer.length - size=
of(*bios_return)));
> >>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actu=
al_outsize);
> >>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> >>> +
> >>> +out_free:
> >>> +     kfree(obj);
> >>> +     kfree(args);
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
> >>> + *
> >>> + * @p:   Unicode buffer address
> >>> + * @str: string to convert to unicode
> >>> + *
> >>> + * Returns a void pointer to the buffer containing unicode string
> >>> + */
> >>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> >>> +{
> >>> +     int len =3D strlen(str);
> >>> +     int ret;
> >>> +
> >>> +     /*
> >>> +      * Add null character when reading an empty string
> >>> +      */
> >>> +     if (len =3D=3D 0) {
> >>> +             *p++ =3D 2;
> >>> +             *p++ =3D (u8)0x00;
> >>> +             return p;
> >>
> >> This does not match with calculate_string_buffer() which will
> >> return 2 for a 0 length string while you are using 4 bytes here.
> >>
> >> I guess this may also be why you need to use " " for
> >> auth_empty_value above, so as to avoid this bug.
> >>
> > HP BIOS expects 2 characters when an empty string is being converted
> > to u16 hence the reason for returning 2 instead of zero.  This is an
> > intended behavior and needed when  allocating a buffer and writing to
> > BIOS.
>
> Right I understand that, it wants 2 characters for the 16 bit length
> word, but why not write 0 to that 16 bit length word. Why actually
> say the string-buffer length is 2 bytes long / and then write
> a 16-bit word with value 0?
>
> What you are doing now creates a 4 byte buffer like this:
>
> u8 buf[4] =3D { 0x02, 0x00, 0x00, 0x00 }
>
> Why not just create a 2 byte buffer like this:
>
> u8 buf[2] =3D { 0x00, 0x00 }
>
> ?
>
>
> Also I'm wondering why the empty auth string is " " and
> not "" ?
>
>

The string returned for an empty string is 4 bytes.  The returned
string includes two bytes for the string size in bytes and the
remaining bytes are the string.
Size =3D  0x02, 0x00
String =3D 0x00, 0x00

All strings return include the string size in bytes followed by the u16 str=
ing


> >
> >>
> >>> +     }
> >>> +     *p++ =3D len * 2;
> >>> +     ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p,=
 len);
> >>> +
> >>> +     if (ret < 0) {
> >>> +             dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed=
\n");
> >>> +             goto ascii_to_utf16_unicode_out;
> >>
> >> You have an error here, but you don't return an error at the end of
> >> this function.
> >>
> >> Please for version 5 do the following:
> >>
> >> 1. Add a preparation patch which moves populate_string_buffer()
> >> and calculate_string_buffer() from
> >> drivers/platform/x86/dell/dell-wmi-sysman/sysman.c to
> >> drivers/platform/x86/wmi.c
> >>
> > Are you asking  to change sysman.c which is a DELL specific driver?
> > I don't have a DELL platform to validate the changes and I will be
> > doing the work on HP workday.   Sorry but I cannot do that.
>
> I'm asking you to move the functions to drivers/platform/x86/wmi.c,
> rename them and check they still compile. So that these functions
> can be shared. You won't be changing the code at all, just the function
> names.
>
> And I have a Dell Latitude laptop where I can verify that
> dell-wmi-sysman still works.
>
>
>
> >
> >> Renaming them to:
> >>
> >> size_t wmi_utf16_str_size(const char *str);
> >> ssize_t wmi_str_to_utf16_str(u16 *buffer, size_t buffer_len, const cha=
r *str);
> >>
> >> (adding these prototypes to include/linux/wmi.h)
> >>
> >
> > I will make the changes requested but I'll wait for your response to
> > the previous comments regarding calculate_string_buffer()
>
> Ok.
>
>
> Regards,
>
> Hans
>
>
> p.s.
>
> Next time if you are replying to a really long email like my previous
> one, please remove any not relevant quoted text from the reply, to
> make it easier to find the parts where you actually reply.
>
ok.
>
