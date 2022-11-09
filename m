Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97BFC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 17:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiKIRYX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 12:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiKIRYW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 12:24:22 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9049D222B8
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 09:24:18 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bk15so26736842wrb.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 09:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LiemFOaf8nHk5fzEG5YN8Vv4JOi1n3WdbXNxI6WGkI=;
        b=kL/PLJdU1A/C6GqupT/OJAfOeYyBfb3jgzcah8BKqBgqOqTGUVyWzQ945cLb/TnLYL
         mNyiHkOtK0Xtco30vrV5/MRYqYGSgfkFancUlc26G6ISU64C+a83ml2wiX1fMbknpcAZ
         n9BqwbFNvdMbkVDssBPhFDmstmuzoSTrbx6BT/Ps6Qt9RqtSYwNPtUaLDLgvxeqzteps
         LBd2WY00Hp+ByrYPECTjT/CbJlg1chiAlaSMECGW+87V0Ve0a8ib8cV/CXwh5p+TILwg
         tpqfTskLvqDUhBVaPXAWL1Ko0sbifcG2GzFJ8OfuIcLTiX9Nhbe69dzR/gOsPha80Cm2
         Itjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LiemFOaf8nHk5fzEG5YN8Vv4JOi1n3WdbXNxI6WGkI=;
        b=CBNIW7O4xxzukqkpnJ0EsvEUI+TakodHFS1PU6OJGNa360saAbk9PMh85J9p5mPtnp
         BVD9KLcFvDGaVzIhQGlQvIfrehg/aMZwu4+9OLBInXq2VgEobJ9NkKuLi1RK48Jyg6Z/
         z/itf2H7/yQOCoSkeDxbTvJT7GnkqWFffhN1+fOc4hyGrKE7qCrKG0y/lQVSXSIdYAMT
         8rfK5VumeIUPg1pz33pg+Vksb7hu/lAEU5iHXHh750BOOrjmT3Rh9XYb38mFYzBZobE0
         c/v5wYw++2U46SIqU0469VVeovQDcvZh/AWG1EDfDAmj4DwmV6Z041MdhzFakOrIuHU+
         oM5Q==
X-Gm-Message-State: ACrzQf3uVCc91mCN52bCkYHbvQWrlqwkg5UsA8moduORb33QzCmG+4lR
        ktBoD109PbehQorBcQqwCrmDcAZiWtBrEOK9b5iGpVvE
X-Google-Smtp-Source: AMsMyM5hVIY03/UA1igVKsqpcUskZXgjs2CoIf37WDsxSO1P7fYT6lutlOOGbE771GEmyW/VyMf9JqTnTuakBkmxd7Q=
X-Received: by 2002:adf:f547:0:b0:23a:239b:7e6a with SMTP id
 j7-20020adff547000000b0023a239b7e6amr19501092wrp.667.1668014656702; Wed, 09
 Nov 2022 09:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
In-Reply-To: <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 9 Nov 2022 11:24:04 -0600
Message-ID: <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI Hans,

Please see questions and comments below.

On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jorge,
>
> Review comments inline.
>
> On 10/20/22 22:10, Jorge Lopez wrote:
> > The purpose for this patch is submit HP BIOSCFG driver to be list of
> > HP Linux kernel drivers.  The driver include a total of 12 files
> > broken in several patches.  This is set 1 of 4.
> >
> > HP BIOS Configuration driver purpose is to provide a driver supporting
> > the latest sysfs class firmware attributes framework allowing the user
> > to change BIOS settings and security solutions on HP Inc.=E2=80=99s com=
mercial
> > notebooks.
> >
> > Many features of HP Commercial PC=E2=80=99s can be managed using Window=
s
> > Management Instrumentation (WMI). WMI is an implementation of Web-Based
> > Enterprise Management (WBEM) that provides a standards-based interface
> > for changing and monitoring system settings.  HP BISOCFG driver provide=
s
> > a native Linux solution and the exposed features facilitates the
> > migration to Linux environments.
> >
> > The Linux security features to be provided in hp-bioscfg driver enables
> > managing the BIOS settings and security solutions via sysfs, a virtual
> > filesystem that can be used by user-mode applications.   The new
> > documentation cover features such Secure Platform Management, Sure
> > Admin, and Sure Start.  Each section provides security feature
> > description and identifies sysfs directories and files exposed by
> > the driver.
> >
> > Many HP Commercial PC=E2=80=99s include a feature called Secure Platfor=
m
> > Management (SPM), which replaces older password-based BIOS settings
> > management with public key cryptography. PC secure product management
> > begins when a target system is provisioned with cryptographic keys
> > that are used to ensure the integrity of communications between system
> > management utilities and the BIOS.
> >
> > HP Commercial PC=E2=80=99s have several BIOS settings that control its =
behaviour
> > and capabilities, many of which are related to security. To prevent
> > unauthorized changes to these settings, the system can be configured
> > to use a Sure Admin cryptographic signature-based authorization string
> > that the BIOS will use to verify authorization to modify the setting.
> >
> > Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >
> > ---
> > Based on the latest platform-drivers-x86.git/for-next
> > ---
> >  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++++++++
> >  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++++
> >  3 files changed, 1477 insertions(+)
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interfa=
ce.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.=
c
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/=
drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> > new file mode 100644
> > index 000000000000..f0c919bf3ab0
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> > @@ -0,0 +1,285 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Functions corresponding to methods under BIOS interface GUID
> > + * for use with hp-bioscfg driver.
> > + *
> > + *  Copyright (c) 2022 Hewlett-Packard Inc.
> > + */
> > +
> > +#include <linux/wmi.h>
> > +#include "bioscfg.h"
> > +
> > +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> > +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> > +#define SET_ATTRIBUTE_METHOD_ID              0x04
> > +
> > +/*
> > + * set_attribute() - Update an attribute value
> > + * @a_name: The attribute name
> > + * @a_value: The attribute value
> > + *
> > + * Sets an attribute to new value
> > + */
> > +int hp_set_attribute(const char *a_name, const char *a_value)
> > +{
> > +     size_t security_area_size;
> > +     size_t a_name_size, a_value_size;
> > +     u16 *buffer =3D NULL;
> > +     u16 *start =3D NULL;
> > +     int  buffer_size;
>
> You have 2 spaces between int and buffer_size here, please drop
> one.
>
>
> > +     int ret;
> > +     int instance;
> > +     char *auth_empty_value =3D " ";
> > +
> > +     mutex_lock(&bioscfg_drv.mutex);
> > +     if (!bioscfg_drv.bios_attr_wdev) {
> > +             ret =3D -ENODEV;
> > +             goto out_set_attribute;
> > +     }
> > +
> > +     instance =3D get_password_instance_for_type(SETUP_PASSWD);
> > +     if (instance < 0)
> > +             goto out_set_attribute;
> > +
> > +     if (strlen(bioscfg_drv.password_data[instance].current_password) =
=3D=3D 0)
> > +             strncpy(bioscfg_drv.password_data[instance].current_passw=
ord,
> > +                     auth_empty_value,
> > +                     sizeof(bioscfg_drv.password_data[instance].curren=
t_password));
>
> strncpy does not guarantee 0 termination of the destination buffer,
> please use strscpy.
>
> > +
> > +     a_name_size =3D calculate_string_buffer(a_name);
> > +     a_value_size =3D calculate_string_buffer(a_value);
> > +     security_area_size =3D calculate_security_buffer(bioscfg_drv.pass=
word_data[instance].current_password);
> > +     buffer_size =3D a_name_size + a_value_size + security_area_size;
> > +
> > +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> > +     if (!buffer) {
> > +             ret =3D -ENOMEM;
> > +             goto out_set_attribute;
> > +     }
> > +
> > +     /* build variables to set */
> > +     start =3D buffer;
> > +     start =3D ascii_to_utf16_unicode(start, a_name);
> > +     if (!start)
> > +             goto out_set_attribute;
> > +
> > +     start =3D ascii_to_utf16_unicode(start, a_value);
> > +     if (!start)
> > +             goto out_set_attribute;
> > +
> > +     populate_security_buffer(start, bioscfg_drv.password_data[instanc=
e].current_password);
> > +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> > +
> > +
> > +out_set_attribute:
> > +     kfree(buffer);
> > +     mutex_unlock(&bioscfg_drv.mutex);
> > +     return ret;
> > +}
> > +
> > +/*
> > + * hp_wmi_perform_query
> > + *
> > + * query:    The commandtype (enum hp_wmi_commandtype)
> > + * write:    The command (enum hp_wmi_command)
> > + * buffer:   Buffer used as input and/or output
> > + * insize:   Size of input buffer
> > + * outsize:  Size of output buffer
> > + *
> > + * returns zero on success
> > + *         an HP WMI query specific error code (which is positive)
> > + *         -EINVAL if the query was not successful at all
> > + *         -EINVAL if the output buffer size exceeds buffersize
> > + *
> > + * Note: The buffersize must at least be the maximum of the input and =
output
> > + *       size. E.g. Battery info query is defined to have 1 byte input
> > + *       and 128 byte output. The caller would do:
> > + *       buffer =3D kzalloc(128, GFP_KERNEL);
> > + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ,=
 buffer, 1, 128)
> > + */
> > +int hp_wmi_perform_query(int query, enum hp_wmi_command command, void =
*buffer, int insize, int outsize)
> > +{
> > +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFFER, NULL=
 };
> > +     struct bios_return *bios_return;
> > +     union acpi_object *obj =3D NULL;
> > +     struct bios_args *args =3D NULL;
> > +     int mid, actual_insize, actual_outsize;
> > +     size_t bios_args_size;
> > +     int ret;
> > +
> > +     mid =3D encode_outsize_for_pvsz(outsize);
> > +     if (WARN_ON(mid < 0))
> > +             return mid;
> > +
> > +     actual_insize =3D insize;
> > +     bios_args_size =3D struct_size(args, data, insize);
> > +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> > +     if (!args)
> > +             return -ENOMEM;
> > +
> > +     input.length =3D bios_args_size;
> > +     input.pointer =3D args;
> > +
> > +     args->signature =3D 0x55434553;
> > +     args->command =3D command;
> > +     args->commandtype =3D query;
> > +     args->datasize =3D insize;
> > +     memcpy(args->data, buffer, flex_array_size(args, data, insize));
> > +
> > +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &ou=
tput);
> > +     bioscfg_drv.last_wmi_status =3D ret;
> > +     if (ret)
> > +             goto out_free;
> > +
> > +     obj =3D output.pointer;
> > +     if (!obj) {
> > +             ret =3D -EINVAL;
> > +             goto out_free;
> > +     }
> > +
>
> You need to check the type of obj here before dereferencing
> obj as if it is a buffer.
>
> > +     bios_return =3D (struct bios_return *)obj->buffer.pointer;
> > +     ret =3D bios_return->return_code;
> > +     bioscfg_drv.last_wmi_status =3D ret;
> > +     if (ret) {
> > +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> > +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> > +                     pr_warn("query 0x%x returned error 0x%x\n", query=
, ret);
> > +             goto out_free;
> > +     }
> > +
> > +     /* Ignore output data of zero size */
> > +     if (!outsize)
> > +             goto out_free;
> > +
> > +     actual_outsize =3D min(outsize, (int)(obj->buffer.length - sizeof=
(*bios_return)));
> > +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual=
_outsize);
> > +     memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> > +
> > +out_free:
> > +     kfree(obj);
> > +     kfree(args);
> > +     return ret;
> > +}
> > +
> > +/*
> > + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
> > + *
> > + * @p:   Unicode buffer address
> > + * @str: string to convert to unicode
> > + *
> > + * Returns a void pointer to the buffer containing unicode string
> > + */
> > +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> > +{
> > +     int len =3D strlen(str);
> > +     int ret;
> > +
> > +     /*
> > +      * Add null character when reading an empty string
> > +      */
> > +     if (len =3D=3D 0) {
> > +             *p++ =3D 2;
> > +             *p++ =3D (u8)0x00;
> > +             return p;
>
> This does not match with calculate_string_buffer() which will
> return 2 for a 0 length string while you are using 4 bytes here.
>
> I guess this may also be why you need to use " " for
> auth_empty_value above, so as to avoid this bug.
>
HP BIOS expects 2 characters when an empty string is being converted
to u16 hence the reason for returning 2 instead of zero.  This is an
intended behavior and needed when  allocating a buffer and writing to
BIOS.

>
> > +     }
> > +     *p++ =3D len * 2;
> > +     ret =3D utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, l=
en);
> > +
> > +     if (ret < 0) {
> > +             dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n=
");
> > +             goto ascii_to_utf16_unicode_out;
>
> You have an error here, but you don't return an error at the end of
> this function.
>
> Please for version 5 do the following:
>
> 1. Add a preparation patch which moves populate_string_buffer()
> and calculate_string_buffer() from
> drivers/platform/x86/dell/dell-wmi-sysman/sysman.c to
> drivers/platform/x86/wmi.c
>
Are you asking  to change sysman.c which is a DELL specific driver?
I don't have a DELL platform to validate the changes and I will be
doing the work on HP workday.   Sorry but I cannot do that.

> Renaming them to:
>
> size_t wmi_utf16_str_size(const char *str);
> ssize_t wmi_str_to_utf16_str(u16 *buffer, size_t buffer_len, const char *=
str);
>
> (adding these prototypes to include/linux/wmi.h)
>

I will make the changes requested but I'll wait for your response to
the previous comments regarding calculate_string_buffer()

> and make the dell-wmi-sysman code use these new helpers
>
> 2. Also use these new helpers in your own code instead
> of your own ascii_to_utf16_unicode() function
>
> > +     }
> > +
> > +     if ((ret * sizeof(u16)) > U16_MAX) {
> > +             dev_err(bioscfg_drv.class_dev, "Error string too long\n")=
;
> > +             goto ascii_to_utf16_unicode_out;
> > +     }
> > +
> > +ascii_to_utf16_unicode_out:
> > +     p +=3D len;
> > +     return p;
> > +}
> > +
> > +/*
> > + * hp_wmi_set_bios_setting - Set setting's value in BIOS
> > + *
> > + * @input_buffer: Input buffer address
> > + * @input_size:   Input buffer size
> > + *
> > + * Returns: Count of unicode characters written to BIOS if successful,=
 otherwise
> > + *           -ENOMEM unable to allocate memory
> > + *           -EINVAL buffer not allocated or too small
> > + */
> > +int hp_wmi_set_bios_setting(void *input_buffer, int input_size)
> > +{
> > +     union acpi_object *obj;
> > +     struct acpi_buffer input =3D {input_size, input_buffer};
> > +     struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > +     int ret =3D 0;
> > +
> > +     ret =3D wmi_evaluate_method(HP_WMI_SET_BIOS_SETTING_GUID, 0, 1, &=
input, &output);
> > +
> > +     obj =3D output.pointer;
> > +     if (!obj)
> > +             return -EINVAL;
> > +
> > +     if (obj->type !=3D ACPI_TYPE_INTEGER)
> > +             ret =3D -EINVAL;
> > +
> > +     ret =3D obj->integer.value;
> > +
> > +     kfree(obj);
> > +     return ret;
> > +}
> > +
> > +/*
> > + * set_bios_defaults() - Resets BIOS defaults
> > + *
> > + * @deftype: the type of BIOS value reset to issue.
> > + *
> > + * Resets BIOS defaults
> > + */
> > +int set_bios_defaults(u8 deftype)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
>
> This function is not used anywhere, please drop it.
>
> > +
> > +static int bios_attr_set_interface_probe(struct wmi_device *wdev, cons=
t void *context)
> > +{
> > +     mutex_lock(&bioscfg_drv.mutex);
> > +     bioscfg_drv.bios_attr_wdev =3D wdev;
> > +     mutex_unlock(&bioscfg_drv.mutex);
> > +     return 0;
> > +}
> > +
> > +static void bios_attr_set_interface_remove(struct wmi_device *wdev)
> > +{
> > +     mutex_lock(&bioscfg_drv.mutex);
> > +     bioscfg_drv.bios_attr_wdev =3D NULL;
> > +     mutex_unlock(&bioscfg_drv.mutex);
> > +}
> > +
> > +static const struct wmi_device_id bios_attr_set_interface_id_table[] =
=3D {
> > +     { .guid_string =3D HP_WMI_BIOS_GUID},
> > +     { },
> > +};
> > +static struct wmi_driver bios_attr_set_interface_driver =3D {
> > +     .driver =3D {
> > +             .name =3D DRIVER_NAME
> > +     },
> > +     .probe =3D bios_attr_set_interface_probe,
> > +     .remove =3D bios_attr_set_interface_remove,
> > +     .id_table =3D bios_attr_set_interface_id_table,
> > +};
> > +
> > +int init_bios_attr_set_interface(void)
> > +{
> > +     return wmi_driver_register(&bios_attr_set_interface_driver);
> > +}
> > +
> > +void exit_bios_attr_set_interface(void)
> > +{
> > +     wmi_driver_unregister(&bios_attr_set_interface_driver);
> > +}
> > +
> > +MODULE_DEVICE_TABLE(wmi, bios_attr_set_interface_id_table);
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.h
> > new file mode 100644
> > index 000000000000..4409481f84f2
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> > @@ -0,0 +1,671 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Definitions for kernel modules using hp_bioscfg driver
> > + *
> > + *  Copyright (c) 2022 HP Development Company, L.P.
> > + */
> > +
> > +#ifndef _HP_BIOSCFG_H_
> > +#define _HP_BIOSCFG_H_
> > +
> > +#include <linux/wmi.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/capability.h>
> > +#include <linux/nls.h>
> > +
> > +
> > +#define DRIVER_NAME  "hp-bioscfg"
> > +
> > +#define MAX_BUFF             512
> > +#define MAX_KEY_MOD          256
> > +#define MAX_PASSWD_SIZE              64
> > +#define MAX_MESSAGE_SIZE        256
> > +
> > +#define SPM_STR_DESC "Secure Platform Management"
> > +#define SPM_STR              "SPM"
> > +#define SURE_START_DESC "Sure Start"
> > +#define SURE_START_STR  "Sure_Start"
> > +#define SURE_ADMIN_DESC "Sure Admin"
> > +#define SURE_ADMIN_STR  "Sure_Admin"
> > +#define SETUP_PASSWD "Setup Password"
> > +#define POWER_ON_PASSWD      "Power-On Password"
> > +
> > +#define LANG_CODE_STR                "en_US.UTF-8"
> > +#define SCHEDULE_POWER_ON    "Scheduled Power-On"
> > +
> > +/* Sure Admin Functions */
> > +
> > +#define UTF_PREFIX   ((unsigned char *)"<utf-16/>")
> > +#define BEAM_PREFIX  ((unsigned char *)"<BEAM/>")
> > +
> > +/* mechanism - Authentication attribute */
> > +
> > +#define MAX_MECHANISM_TYPES 3
> > +
> > +enum mechanism_values {
> > +     PASSWORD        =3D 0x00,
> > +     NOT_PROVISION   =3D 0x00,
> > +     SIGNING_KEY     =3D 0x01,
> > +     ENDORSEMENT_KEY =3D 0x02
> > +};
> > +
> > +static const char * const spm_mechanism_types[] =3D {
> > +     "not provision",
> > +     "signing-key",
> > +     "endorsement-key"
> > +};
> > +
> > +static const char * const passwd_mechanism_types[] =3D {
> > +     "password",
> > +};
> > +
> > +/* roles - Authentication attribute */
> > +enum role_values {
> > +     BIOS_ADMIN      =3D 0x00,
> > +     POWER_ON        =3D 0x01,
> > +     BIOS_SPM        =3D 0x02
> > +};
> > +
> > +static const char * const role_type[] =3D {
> > +     "bios-admin",
> > +     "power-on",
> > +     "enhanced-bios-auth"
> > +};
> > +
> > +
> > +#define HP_WMI_BIOS_GUID             "5FB7F034-2C63-45e9-BE91-3D44E2C7=
07E4"
> > +
> > +#define HP_WMI_BIOS_STRING_GUID              "988D08E3-68F4-4c35-AF3E-=
6A1B8106F83C"
> > +#define HP_WMI_BIOS_INTEGER_GUID     "8232DE3D-663D-4327-A8F4-E293ADB9=
BF05"
> > +#define HP_WMI_BIOS_ENUMERATION_GUID "2D114B49-2DFB-4130-B8FE-4A3C09E7=
5133"
> > +#define HP_WMI_BIOS_ORDERED_LIST_GUID        "14EA9746-CE1F-4098-A0E0-=
7045CB4DA745"
> > +#define HP_WMI_BIOS_PASSWORD_GUID    "322F2028-0F84-4901-988E-01517604=
9E2D"
> > +#define HP_WMI_SET_BIOS_SETTING_GUID "1F4C91EB-DC5C-460b-951D-C7CB9B4B=
8D5E"
> > +
> > +enum hp_wmi_spm_commandtype {
> > +     HPWMI_SECUREPLATFORM_GET_STATE  =3D 0x10,
> > +     HPWMI_SECUREPLATFORM_SET_KEK    =3D 0x11,
> > +     HPWMI_SECUREPLATFORM_SET_SK     =3D 0x12,
> > +};
> > +
> > +enum hp_wmi_surestart_commandtype {
> > +     HPWMI_SURESTART_GET_LOG_COUNT   =3D 0x01,
> > +     HPWMI_SURESTART_GET_LOG         =3D 0x02,
> > +};
> > +
> > +enum hp_wmi_command {
> > +     HPWMI_READ              =3D 0x01,
> > +     HPWMI_WRITE             =3D 0x02,
> > +     HPWMI_ODM               =3D 0x03,
> > +     HPWMI_SURESTART         =3D 0x20006,
> > +     HPWMI_GM                =3D 0x20008,
> > +     HPWMI_SECUREPLATFORM    =3D 0x20010,
> > +};
> > +
> > +struct bios_return {
> > +     u32 sigpass;
> > +     u32 return_code;
> > +};
> > +
> > +enum hp_return_value {
> > +     HPWMI_RET_WRONG_SIGNATURE       =3D 0x02,
> > +     HPWMI_RET_UNKNOWN_COMMAND       =3D 0x03,
> > +     HPWMI_RET_UNKNOWN_CMDTYPE       =3D 0x04,
> > +     HPWMI_RET_INVALID_PARAMETERS    =3D 0x05,
> > +};
> > +
> > +enum wmi_error_values {
> > +     SUCCESS                 =3D 0x00,
> > +     CMD_FAILED                      =3D 0x01,
> > +     INVALID_SIGN                    =3D 0x02,
> > +     INVALID_CMD_VALUE               =3D 0x03,
> > +     INVALID_CMD_TYPE                =3D 0x04,
> > +     INVALID_DATA_SIZE               =3D 0x05,
> > +     INVALID_CMD_PARAM               =3D 0x06,
> > +     ENCRYP_CMD_REQUIRED             =3D 0x07,
> > +     NO_SECURE_SESSION               =3D 0x08,
> > +     SECURE_SESSION_FOUND            =3D 0x09,
> > +     SECURE_SESSION_FAILED           =3D 0x0A,
> > +     AUTH_FAILED                     =3D 0x0B,
> > +     INVALID_BIOS_AUTH               =3D 0x0E,
> > +     NONCE_DID_NOT_MATCH             =3D 0x18,
> > +     GENERIC_ERROR                   =3D 0x1C,
> > +     BIOS_ADMIN_POLICY_NOT_MET       =3D 0x28,
> > +     BIOS_ADMIN_NOT_SET              =3D 0x38,
> > +     P21_NO_PROVISIONED              =3D 0x1000,
> > +     P21_PROVISION_IN_PROGRESS       =3D 0x1001,
> > +     P21_IN_USE                      =3D 0x1002,
> > +     HEP_NOT_ACTIVE                  =3D 0x1004,
> > +     HEP_ALREADY_SET         =3D 0x1006,
> > +     HEP_CHECK_STATE         =3D 0x1007
> > +};
> > +
> > +enum spm_features {
> > +     HEP_ENABLED             =3D 0x01,
> > +     PLATFORM_RECOVERY       =3D 0x02,
> > +     ENHANCED_BIOS_AUTH_MODE =3D 0x04
> > +};
> > +
> > +
> > +/*
> > + * struct bios_args buffer is dynamically allocated.  New WMI command =
types
> > + * were introduced that exceeds 128-byte data size.  Changes to handle
> > + * the data size allocation scheme were kept in hp_wmi_perform_qurey f=
unction.
> > + */
> > +struct bios_args {
> > +     u32 signature;
> > +     u32 command;
> > +     u32 commandtype;
> > +     u32 datasize;
> > +     u8 data[];
> > +};
> > +
> > +
> > +#pragma pack(1)
> > +struct secureplatform_provisioning_data {
> > +     u8 state;
> > +     u8 version[2];
> > +     u8 reserved1;
> > +     u32 features;
> > +     u32 nonce;
> > +     u8 reserved2[28];
> > +     u8 sk_mod[MAX_KEY_MOD];
> > +     u8 kek_mod[MAX_KEY_MOD];
> > +};
> > +
> > +#pragma pack()
> > +
> > +
> > +struct string_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +     u8 current_value[MAX_BUFF];
> > +     u8 new_value[MAX_BUFF];
> > +     u8 path[MAX_BUFF];
> > +     u32 is_readonly;
> > +     u32 display_in_ui;
> > +     u32 requires_physical_presence;
> > +     u32 sequence;
> > +     u32 prerequisitesize;
> > +     u8 prerequisites[MAX_BUFF];
> > +     u32 security_level;
> > +     u32 min_length;
> > +     u32 max_length;
> > +     u8 display_name_language_code[MAX_BUFF];
> > +     u32 type;
> > +};
> > +
> > +struct integer_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +     u32 current_value;
> > +     u32 new_value;
> > +     u8 path[MAX_BUFF];
> > +     u32 is_readonly;
> > +     u32 display_in_ui;
> > +     u32 requires_physical_presence;
> > +     u32 sequence;
> > +     u32 prerequisitesize;
> > +     u8 prerequisites[MAX_BUFF];
> > +     u32 security_level;
> > +     u32 lower_bound;
> > +     u32 upper_bound;
> > +     u32 scalar_increment;
> > +     u8 display_name_language_code[MAX_BUFF];
> > +     u32 type;
> > +};
> > +
> > +struct enumeration_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +     u8 path[MAX_BUFF];
> > +     u32 is_readonly;
> > +     u32 display_in_ui;
> > +     u32 requires_physical_presence;
> > +     u32 sequence;
> > +     u32 prerequisitesize;
> > +     u8 prerequisites[MAX_BUFF];
> > +     u32 security_level;
> > +     u8 current_value[MAX_BUFF];
> > +     u8 new_value[MAX_BUFF];
> > +     u32 size;
> > +     u8 possible_values[MAX_BUFF];
> > +     u8 display_name_language_code[MAX_BUFF];
> > +     u32 type;
> > +};
> > +
> > +struct ordered_list_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +     u8 current_value[MAX_BUFF];
> > +     u8 new_value[MAX_BUFF];
> > +     u8 path[MAX_BUFF];
> > +     u32 is_readonly;
> > +     u32 display_in_ui;
> > +     u32 requires_physical_presence;
> > +     u32 sequence;
> > +     u32 prerequisitesize;
> > +     u8 prerequisites[MAX_BUFF];
> > +     u32 security_level;
> > +     u32 size;
> > +     u8 elements[MAX_BUFF];
> > +     u8 display_name_language_code[MAX_BUFF];
> > +     u32 type;
> > +};
> > +
> > +struct password_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +     u8 current_password[MAX_PASSWD_SIZE];
> > +     u8 new_password[MAX_PASSWD_SIZE];
> > +     u8 path[MAX_BUFF];
> > +     u32 is_readonly;
> > +     u32 display_in_ui;
> > +     u32 requires_physical_presence;
> > +     u32 sequence;
> > +     u32 prerequisitesize;
> > +     u8 prerequisites[MAX_BUFF];
> > +     u32 security_level;
> > +     u32 min_password_length;
> > +     u32 max_password_length;
> > +     u32 encoding_size;
> > +     u8 supported_encoding[MAX_BUFF];
> > +     u8 display_name_language_code[MAX_BUFF];
> > +     u32 is_enabled;
> > +
> > +     // 'bios-admin' 'power-on'
> > +     u32 role;
> > +
> > +     //'password'
> > +     u32 mechanism;
> > +     u32 type;
> > +};
> > +
> > +struct secure_platform_data {
> > +     struct kobject *attr_name_kobj;
> > +     u8 attribute_name[MAX_BUFF];
> > +     u8 display_name[MAX_BUFF];
> > +
> > +     u8 *endorsement_key;
> > +     u8 *signing_key;
> > +
> > +     u32 is_enabled;
> > +     u32 mechanism;
> > +     u32 type;
> > +};
> > +
> > +struct bioscfg_priv {
> > +     struct wmi_device *password_attr_wdev;
> > +     struct wmi_device *bios_attr_wdev;
> > +     struct kset *authentication_dir_kset;
> > +     struct kset *main_dir_kset;
> > +     struct device *class_dev;
> > +     struct string_data *string_data;
> > +     u32 string_instances_count;
> > +     struct integer_data *integer_data;
> > +     u32 integer_instances_count;
> > +     struct enumeration_data *enumeration_data;
> > +     u32 enumeration_instances_count;
> > +     struct ordered_list_data *ordered_list_data;
> > +     u32 ordered_list_instances_count;
> > +     struct password_data *password_data;
> > +     u32 password_instances_count;
> > +
> > +     struct kobject *sure_start_attr_kobj;
> > +     struct kobject *sure_admin_attr_kobj;
> > +     struct secure_platform_data spm_data;
> > +
> > +     int  last_wmi_status;
> > +     bool pending_reboot;
> > +     struct mutex mutex;
> > +};
> > +
> > +/* global structure used by multiple WMI interfaces */
> > +extern struct bioscfg_priv bioscfg_drv;
> > +
> > +enum hp_wmi_data_type {
> > +     HPWMI_STRING_TYPE               =3D 0x00,
> > +     HPWMI_INTEGER_TYPE              =3D 0x01,
> > +     HPWMI_ENUMERATION_TYPE          =3D 0x02,
> > +     HPWMI_ORDERED_LIST_TYPE         =3D 0x03,
> > +     HPWMI_PASSWORD_TYPE             =3D 0x04,
> > +     HPWMI_SECURE_PLATFORM_TYPE      =3D 0x05,
> > +     HPWMI_SURE_START_TYPE           =3D 0x06,
> > +     HPWMI_SURE_ADMIN_TYPE           =3D 0x07,
> > +};
> > +
> > +enum hp_wmi_data_elements {
> > +
> > +     /* Common elements */
> > +     NAME =3D 0,
> > +     VALUE =3D 1,
> > +     PATH =3D 2,
> > +     IS_READONLY =3D 3,
> > +     DISPLAY_IN_UI =3D 4,
> > +     REQUIRES_PHYSICAL_PRESENCE =3D 5,
> > +     SEQUENCE =3D 6,
> > +     PREREQUISITE_SIZE =3D 7,
> > +     PREREQUISITES =3D 8,
> > +     SECURITY_LEVEL =3D 9,
> > +
> > +     /* String elements */
> > +     STR_MIN_LENGTH =3D 10,
> > +     STR_MAX_LENGTH =3D 11,
> > +
> > +     /* Integer elements */
> > +     INT_LOWER_BOUND =3D 10,
> > +     INT_UPPER_BOUND =3D 11,
> > +     INT_SCALAR_INCREMENT =3D 12,
> > +
> > +     /* Enumeration elements */
> > +     ENUM_CURRENT_VALUE =3D 10,
> > +     ENUM_SIZE =3D 11,
> > +     ENUM_POSSIBLE_VALUES =3D 12,
> > +
> > +     /* Ordered list elements */
> > +     ORD_LIST_SIZE =3D 10,
> > +     ORD_LIST_ELEMENTS =3D 11,
> > +
> > +     /* Password elements */
> > +     PSWD_MIN_LENGTH =3D 10,
> > +     PSWD_MAX_LENGTH =3D 11,
> > +     PSWD_SIZE =3D 12,
> > +     PSWD_SUPPORTED_ENCODING =3D 13,
> > +     PSWD_IS_SET =3D 14
> > +};
> > +
> > +
> > +static const int hp_wmi_elements_count[] =3D {
> > +     12,   // string
> > +     13,   // integer
> > +     13,   // enumeration
> > +     12,   // ordered list
> > +     15    // password
> > +};
> > +
> > +#define get_instance_id(type)                                         =
               \
> > +static int get_##type##_instance_id(struct kobject *kobj)             =
       \
> > +{                                                                     =
       \
> > +     int i; \
> > +                                                             \
> > +     for (i =3D 0; i <=3D bioscfg_drv.type##_instances_count; i++) { \
> > +             if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].attri=
bute_name))) \
> > +                     return i;                                        =
       \
> > +     }                                                                =
       \
> > +     return -EIO;                                                     =
       \
> > +}
> > +
> > +#define get_instance_id_for_attribute(type)                  \
> > +static int get_instance_id_for_##type(char *attr_name)               \
> > +{                                                                     =
       \
> > +     int i;                                                           =
       \
> > +                                                                      =
       \
> > +     for (i =3D 0; i < bioscfg_drv.type##_instances_count; i++) {     =
         \
> > +             if (strcmp(bioscfg_drv.type##_data[i].attribute_name, att=
r_name) =3D=3D 0)                                          \
> > +                     return i;                                        =
       \
> > +     }                                                                =
       \
> > +     return -EIO;                                                     =
       \
> > +}
> > +
> > +#define attribute_s_property_show(name, type)                         =
               \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr,        \
> > +                        char *buf)                                    =
       \
> > +{                                                                     =
       \
> > +     int i =3D get_##type##_instance_id(kobj);                        =
         \
> > +     if (i >=3D 0)                                                    =
         \
> > +             return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].na=
me);   \
>
> Please use sysfs_emit instead of sprintf for this and all the other _show=
() functions.
>
> > +     return 0;                                                        =
       \
> > +}
> > +/* There is no need to keep track of default and current values
> > + * separately
> > + */
> > +#define attribute_s_default_property_show(name, type, new_name)       =
               \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr,        \
> > +                        char *buf)                                    =
       \
> > +{                                                                     =
       \
> > +     int i =3D get_##type##_instance_id(kobj);                        =
         \
> > +     if (i >=3D 0)                                                    =
         \
> > +             return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].ne=
w_name);       \
> > +     return 0;                                                        =
       \
> > +}
> > +
> > +#define attribute_n_default_property_show(name, type, new_name)       =
               \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr,        \
> > +                        char *buf)                                    =
       \
> > +{                                                                     =
       \
> > +     int i =3D get_##type##_instance_id(kobj);                        =
         \
> > +     if (i >=3D 0)                                                    =
         \
> > +             return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].ne=
w_name); \
> > +     return 0;                                                        =
       \
> > +}
> > +
> > +#define attribute_n_property_show(name, type)                         =
               \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr,        \
> > +                        char *buf)                                    =
       \
> > +{                                                                     =
       \
> > +     int i =3D get_##type##_instance_id(kobj);                        =
         \
> > +     if (i >=3D 0)                                                    =
         \
> > +             return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].na=
me);   \
> > +     return 0;                                                        =
       \
> > +}
> > +
> > +
> > +#define attribute_property_store(curr_val, type)                      =
       \
> > +static ssize_t curr_val##_store(struct kobject *kobj,                 =
               \
> > +                             struct kobj_attribute *attr,             =
       \
> > +                             const char *buf, size_t count)           =
       \
> > +{                                                                     =
       \
> > +     char *p =3D NULL;                                                =
         \
> > +     char *attr_value =3D NULL;                                       =
         \
> > +     char *attr_name =3D NULL;                                        =
         \
> > +     int i;                                                           =
       \
> > +     int ret =3D -EIO;                                                =
         \
> > +                                                                      =
       \
> > +     attr_name =3D kstrdup(kobj->name, GFP_KERNEL);                   =
         \
> > +     if (!attr_name)                                                  =
       \
> > +             return -ENOMEM;                                          =
       \
>
> Since you don't modify attr_name (unlike attr_value) there is no need
> to make a local copy, just use kobj->name directly instead of
> the copy stored in attr_name.
>
> > +     attr_value =3D kstrdup(buf, GFP_KERNEL);                         =
         \
> > +     if (!attr_value)                                                 =
       \
> > +             return -ENOMEM;                                          =
       \
> > +                                                                      =
       \
> > +     p =3D memchr(attr_value, '\n', count);                           =
         \
> > +     if (p !=3D NULL)                                                 =
         \
> > +             *p =3D '\0';                                             =
         \
> > +                                                                      =
       \
> > +     i =3D get_##type##_instance_id(kobj);                            =
         \
> > +     if (i >=3D 0)                                                    =
         \
> > +             ret =3D validate_##type##_input(i, attr_value);          =
         \
> > +     if (!ret)                                                        =
       \
> > +             ret =3D hp_set_attribute(attr_name, attr_value);         =
         \
> > +     if (!ret)                                                        =
       \
> > +             update_##type##_value(i);                                =
       \
> > +                                                                      =
       \
> > +     clear_all_passwords();                                           =
       \
>
> Why ?
>
> At a minimum add a comment explaining this.
>
> > +     kfree(attr_name);                                                =
       \
> > +     kfree(attr_value);                                               =
       \
> > +                                                                      =
       \
> > +     return ret ? ret : count;                                        =
       \
> > +}
> > +
> > +#define attribute_spm_n_property_show(name, type)                     =
       \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr, char *buf) \
> > +{                                                                    \
> > +     return sprintf(buf, "%d\n", bioscfg_drv.type##_data.name);\
> > +}
> > +
> > +#define attribute_spm_s_property_show(name, type)                     =
       \
> > +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute=
 *attr, char *buf) \
> > +{                                                                    \
> > +     return sprintf(buf, "%s\n", bioscfg_drv.type##_data.name);       =
       \
> > +}
> > +
> > +#define check_property_type(attr, prop, valuetype)\
> > +     (attr##_obj[prop].type !=3D valuetype)
> > +
> > +#define HPWMI_BINATTR_RW(_group, _name, _size)       \
> > +static struct bin_attribute _group##_##_name =3D       \
> > +__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_na=
me##_write, _size)
> > +
> > +/*
> > + * Prototypes
> > + */
> > +union acpi_object *get_wmiobj_pointer(int instance_id, const char *gui=
d_string);
> > +int get_instance_count(const char *guid_string);
> > +void strlcpy_attr(char *dest, char *src);
> > +void update_attribute_permissions(u32 isReadOnly, struct kobj_attribut=
e *current_val);
> > +void friendly_user_name_update(char *path, const char *attr_name,
> > +                             char *attr_display, int attr_size);
> > +
> > +/* String attributes */
> > +int populate_string_buffer_data(union acpi_object *str_obj,
> > +                      int instance_id,
> > +                      struct kobject *attr_name_kobj);
> > +int populate_string_elements_from_buffer(union acpi_object *string_obj=
,
> > +                                      int instance_id,
> > +                                      enum hp_wmi_data_type type);
> > +int alloc_string_data(void);
> > +void exit_string_attributes(void);
> > +int populate_string_package_data(union acpi_object *str_obj,
> > +                              int instance_id,
> > +                              struct kobject *attr_name_kobj);
> > +int populate_string_elements_from_package(union acpi_object *str_obj,
> > +                                               int instance_id,
> > +                                               enum hp_wmi_data_type t=
ype);
> > +
> > +/* Integer attributes */
> > +int populate_integer_buffer_data(union acpi_object *integer_obj,
> > +                       int instance_id,
> > +                       struct kobject *attr_name_kobj);
> > +int populate_integer_elements_from_buffer(union acpi_object *integer_o=
bj,
> > +                                       int instance_id,
> > +                                       enum hp_wmi_data_type type);
> > +int alloc_integer_data(void);
> > +void exit_integer_attributes(void);
> > +int populate_integer_package_data(union acpi_object *integer_obj,
> > +                               int instance_id,
> > +                               struct kobject *attr_name_kobj);
> > +int populate_integer_elements_from_package(union acpi_object *integer_=
obj,
> > +                                               int instance_id,
> > +                                               enum hp_wmi_data_type t=
ype);
> > +
> > +/* Enumeration attributes */
> > +int populate_enumeration_buffer_data(union acpi_object *enum_obj,
> > +                           int instance_id,
> > +                           struct kobject *attr_name_kobj);
> > +int populate_enumeration_elements_from_buffer(union acpi_object *enum_=
obj,
> > +                                           int instance_id,
> > +                                           enum hp_wmi_data_type type)=
;
> > +int alloc_enumeration_data(void);
> > +void exit_enumeration_attributes(void);
> > +int populate_enumeration_package_data(union acpi_object *enum_obj,
> > +                                   int instance_id,
> > +                                   struct kobject *attr_name_kobj);
> > +int populate_enumeration_elements_from_package(union acpi_object *enum=
_obj,
> > +                                            int instance_id,
> > +                                            enum hp_wmi_data_type type=
);
> > +
> > +/* Ordered list */
> > +int populate_ordered_list_buffer_data(union acpi_object *order_obj, in=
t instance_id,
> > +                                   struct kobject *attr_name_kobj);
> > +int populate_ordered_list_elements_from_buffer(union acpi_object *orde=
r_obj,
> > +                                            int instance_id,
> > +                                            enum hp_wmi_data_type
> > +                                            type);
> > +int alloc_ordered_list_data(void);
> > +void exit_ordered_list_attributes(void);
> > +int populate_ordered_list_package_data(union acpi_object *order_obj,
> > +                                    int instance_id,
> > +                                    struct kobject *attr_name_kobj);
> > +int populate_ordered_list_elements_from_package(union acpi_object *ord=
er_obj,
> > +                                             int instance_id,
> > +                                             enum hp_wmi_data_type typ=
e);
> > +
> > +/* Password authentication attributes */
> > +int populate_password_buffer_data(union acpi_object *password_obj,
> > +                        int instance_id,
> > +                        struct kobject *attr_name_kobj);
> > +int populate_password_elements_from_buffer(union acpi_object *password=
_obj,
> > +                                        int instance_id,
> > +                                        enum hp_wmi_data_type type);
> > +int populate_password_package_data(union acpi_object *password_obj, in=
t instance_id,
> > +                                struct kobject *attr_name_kobj);
> > +int populate_password_elements_from_package(union acpi_object *passwor=
d_obj,
> > +                                        int instance_id,
> > +                                         enum hp_wmi_data_type type);
> > +int alloc_password_data(void);
> > +int alloc_secure_platform_data(void);
> > +void exit_password_attributes(void);
> > +void exit_secure_platform_attributes(void);
> > +int populate_secure_platform_data(struct kobject *attr_name_kobj);
> > +int password_is_set(const char *auth);
> > +int check_spm_is_enabled(void);
> > +int wmi_error_and_message(int error_code, char *message);
> > +int hp_wmi_set_bios_setting(void *input_buffer, int input_size);
> > +int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> > +                             void *buffer, int insize, int outsize);
> > +
> > +/* Sure Start attributes */
> > +void exit_sure_start_attributes(void);
> > +int populate_sure_start_data(struct kobject *attr_name_kobj);
> > +
> > +/* Sure Admin Attributes */
> > +void exit_sure_admin_attributes(void);
> > +int populate_sure_admin_data(struct kobject *attr_name_kobj);
> > +int hp_set_attribute(const char *a_name, const char *a_value);
> > +int hp_set_attribute_with_payload(const char *a_name,
> > +                               const char *a_value,
> > +                               const char *auth_payload);
> > +int update_attribute_value(char *attr_name, char *attr_value);
> > +int hp_bios_settings_fill_buffer(void);
> > +int hp_bios_settings_free_buffer(void);
> > +int hp_bios_settings_realloc_buffer(char **buf, int *buf_size,
> > +                                        int *alloc_size);
> > +int append_read_string_attributes(char *buf, int alloc_size,
> > +                                     int instance,
> > +                                     enum hp_wmi_data_type type);
> > +int append_read_integer_attributes(char *buf, int alloc_size,
> > +                                      int instance,
> > +                                      enum hp_wmi_data_type type);
> > +int append_read_enumeration_attributes(char *buf, int alloc_size,
> > +                                          int instance,
> > +                                          enum hp_wmi_data_type type);
> > +int append_read_ordered_list_attributes(char *buf, int alloc_size,
> > +                                           int instance,
> > +                                           enum hp_wmi_data_type type)=
;
> > +int append_read_password_attributes(char *buf, int alloc_size,
> > +                                      int instance,
> > +                                      enum hp_wmi_data_type type);
> > +int append_read_settings(enum hp_wmi_data_type type, char **buf,
> > +                           int *buf_size, int *alloc_size);
> > +int append_read_attributes(char **buf, int alloc_size,
> > +                              int instance, enum hp_wmi_data_type type=
);
> > +int set_bios_defaults(u8 defType);
> > +int get_password_instance_for_type(const char *name);
> > +int clear_all_passwords(void);
> > +int clear_passwords(const int instance);
> > +void exit_bios_attr_set_interface(void);
> > +int init_bios_attr_set_interface(void);
> > +size_t calculate_string_buffer(const char *str);
> > +size_t calculate_security_buffer(const char *authentication);
> > +void populate_security_buffer(u16 *buffer, const char *authentication)=
;
> > +ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, const c=
har *str);
> > +int set_new_password(const char *password_type, const char *new_passwo=
rd);
> > +int init_bios_attr_pass_interface(void);
> > +void exit_bios_attr_pass_interface(void);
> > +void *ascii_to_utf16_unicode(u16 *p, const u8 *str);
> > +int get_integer_from_buffer(int **buffer, int *integer);
> > +int get_string_from_buffer(u16 **buffer, char **str);
> > +int convert_hexstr_to_str(char **hex, int input_len, char **str, int *=
len);
> > +int convert_hexstr_to_int(char *str, int *int_value);
> > +inline int encode_outsize_for_pvsz(int outsize);
>
> Please drop the inline here, since this is just a function prototype it c=
annot
> be inlined.
>
> And please also drop the inline from the actual implementation, since
> that is only used in other .c files.
>
> > +
> > +#endif
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/dri=
vers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> > new file mode 100644
> > index 000000000000..e67e7c397c12
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> > @@ -0,0 +1,521 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Functions corresponding to enumeration type attributes under
> > + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> > + *
> > + *  Copyright (c) 2022 HP Development Company, L.P.
> > + */
> > +
> > +#include "bioscfg.h"
> > +
> > +get_instance_id(enumeration);
> > +
> > +static ssize_t current_value_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
> > +{
> > +     int instance_id =3D get_enumeration_instance_id(kobj);
> > +     union acpi_object *obj =3D NULL;
> > +     ssize_t ret;
> > +
> > +     if (instance_id < 0)
> > +             return -EIO;
> > +
> > +     /* need to use specific instance_id and guid combination to get r=
ight data */
> > +     obj =3D get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ENUMERATION_G=
UID);
> > +     if (!obj)
> > +             return -EIO;
>
> Why get this obj if you are not using it at all ? The attribute_property_=
store()
> macro updates bioscfg_drv.enumeration_data[instance_id].current_value on =
success,
> so I believe this function can just
>
> > +
> > +     ret =3D snprintf(buf, PAGE_SIZE, "%s\n",
> > +                    bioscfg_drv.enumeration_data[instance_id].current_=
value);
>
> please use sysfs_emit for this
>
> > +
> > +     kfree(obj);
> > +     return ret;
> > +}
> > +
> > +
> > +/*
> > + * validate_enumeration_input() -
> > + * Validate input of current_value against possible values
> > + *
> > + * @instance_id: The instance on which input is validated
> > + * @buf: Input value
> > + */
> > +static int validate_enumeration_input(int instance_id, const char *buf=
)
> > +{
> > +     char *options =3D NULL;
> > +     char *p;
> > +     int ret =3D 0;
> > +     int found =3D 0;
> > +
> > +     options =3D kstrdup(bioscfg_drv.enumeration_data[instance_id].pos=
sible_values,
> > +                       GFP_KERNEL);
> > +
> > +     if (!options) {
> > +             ret =3D -ENOMEM;
> > +             goto exit_validate_enum_input;
> > +     }
> > +
> > +     /* Is it a read only attribute */
> > +     if (bioscfg_drv.enumeration_data[instance_id].is_readonly) {
> > +             ret =3D -EIO;
> > +             goto exit_validate_enum_input;
> > +     }
>
> Please move this check to before the kstrdup and just
> directly return -EIO; instead of doing the goto.
>
> > +
> > +     while ((p =3D strsep(&options, ";")) !=3D NULL) {
> > +             if (!*p)
> > +                     continue;
> > +
> > +             if (!strcasecmp(p, buf)) {
> > +                     found =3D 1;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!found) {
> > +             ret =3D -EINVAL;
> > +             goto exit_validate_enum_input;
> > +     }
> > +
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].new_value,
> > +             buf,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].new_valu=
e));
>
> Why store a copy of buf in new_value?  This function is only called from
> the attribute_property_store() with attr_value as buf parameter.
>
> You can just also pass attr_value to update_##type##_value()
> and then have update_enumeration_value() directly store attr_value
> in current_value.
>
> Doing things this way allows removing new_value from struct enumeration_d=
ata
> all together resulting in a nice reduction in memory usage.
>
> > +     /*
> > +      * set pending reboot flag depending on
> > +      * "RequiresPhysicalPresence" value
> > +      */
> > +     if (bioscfg_drv.enumeration_data[instance_id].requires_physical_p=
resence)
> > +             bioscfg_drv.pending_reboot =3D TRUE;
> > +
> > +exit_validate_enum_input:
> > +     kfree(options);
> > +     return ret;
> > +}
> > +
> > +static void update_enumeration_value(int instance_id)
> > +{
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> > +             bioscfg_drv.enumeration_data[instance_id].new_value,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].current_=
value));
> > +}
> > +
> > +
> > +attribute_s_property_show(display_name_language_code, enumeration);
> > +static struct kobj_attribute enumeration_display_langcode =3D
> > +             __ATTR_RO(display_name_language_code);
> > +
> > +attribute_s_property_show(display_name, enumeration);
> > +static struct kobj_attribute  enumeration_display_name =3D
> > +             __ATTR_RO(display_name);
> > +
> > +attribute_property_store(current_value, enumeration);
> > +static struct kobj_attribute enumeration_current_val =3D
> > +     __ATTR_RW_MODE(current_value, 0600);
> > +
> > +attribute_s_property_show(possible_values, enumeration);
> > +static struct kobj_attribute  enumeration_poss_val =3D
> > +             __ATTR_RO(possible_values);
> > +
> > +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *=
attr,
> > +                      char *buf)
> > +{
> > +     return sprintf(buf, "enumeration\n");
> > +}
> > +static struct kobj_attribute enumeration_type =3D
> > +             __ATTR_RO(type);
> > +
> > +static struct attribute *enumeration_attrs[] =3D {
> > +     &enumeration_display_langcode.attr,
> > +     &enumeration_display_name.attr,
> > +     &enumeration_current_val.attr,
> > +     &enumeration_poss_val.attr,
> > +     &enumeration_type.attr,
> > +     NULL,
> > +};
> > +
> > +static const struct attribute_group enumeration_attr_group =3D {
> > +     .attrs =3D enumeration_attrs,
> > +};
> > +
> > +int alloc_enumeration_data(void)
> > +{
> > +     int ret =3D 0;
> > +
> > +     bioscfg_drv.enumeration_instances_count =3D
> > +             get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
> > +
> > +     bioscfg_drv.enumeration_data =3D kcalloc(bioscfg_drv.enumeration_=
instances_count,
> > +                                     sizeof(struct enumeration_data), =
GFP_KERNEL);
> > +     if (!bioscfg_drv.enumeration_data) {
> > +             bioscfg_drv.enumeration_instances_count =3D 0;
> > +             ret =3D -ENOMEM;
> > +     }
> > +     return ret;
> > +}
> > +
> > +/*
> > + * populate_enumeration_package_data() -
> > + * Populate all properties of an instance under enumeration attribute
> > + *
> > + * @enum_obj: ACPI object with enumeration data
> > + * @instance_id: The instance to enumerate
> > + * @attr_name_kobj: The parent kernel object
> > + */
> > +int populate_enumeration_package_data(union acpi_object *enum_obj, int=
 instance_id,
> > +                     struct kobject *attr_name_kobj)
> > +{
> > +     char *str_value =3D NULL;
> > +     int str_len;
> > +     int ret =3D 0;
> > +
> > +     bioscfg_drv.enumeration_data[instance_id].type =3D HPWMI_ENUMERAT=
ION_TYPE;
> > +     bioscfg_drv.enumeration_data[instance_id].attr_name_kobj =3D attr=
_name_kobj;
> > +
> > +     ret =3D convert_hexstr_to_str(&(enum_obj[NAME].string.pointer),
> > +                                 enum_obj[NAME].string.length,
> > +                                 &str_value, &str_len);
> > +     if (ACPI_FAILURE(ret)) {
> > +             pr_warn("Failed to populate enumeration package data. Err=
or [0%0x]\n", ret);
> > +             kfree(str_value);
> > +             return ret;
> > +     }
>
> You have already done this convert_hexstr_to_str call in
> hp_init_bios_attributes() and used it for the name of the passed in
> struct kobject *attr_name_kobj, so you can just use attr_name_kobj->name
> here, as you already do in the friendly_user_name_update() call below?
>
> Also you use kobj->name in the get_##type##_instance_id() macro, and the
> only reason why the enumeration_data[instance_id].attribute_name field
> is necessary is for that function.
>
> So dropping the above call and using kobj->name to intialize attribute_na=
me
> and display_name seems to make sense here ?
>
>
>
>
> > +
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
> > +             str_value,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].attribut=
e_name));
> > +
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
> > +             str_value,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].display_=
name));
> > +
> > +     kfree(str_value);
> > +     str_value =3D NULL;
>
> And then you can also drop this. Note there is no need to set str_value t=
o NULL
> here regardless since it is a local variable which will disappear when th=
e
> function ends.
>
> > +
> > +     populate_enumeration_elements_from_package(enum_obj, instance_id,=
 HPWMI_ENUMERATION_TYPE);
> > +     update_attribute_permissions(bioscfg_drv.enumeration_data[instanc=
e_id].is_readonly,
> > +                                 &enumeration_current_val);
> > +     friendly_user_name_update(bioscfg_drv.enumeration_data[instance_i=
d].path,
> > +                               attr_name_kobj->name,
> > +                                bioscfg_drv.enumeration_data[instance_=
id].display_name,
> > +                                sizeof(bioscfg_drv.enumeration_data[in=
stance_id].display_name));
> > +     return sysfs_create_group(attr_name_kobj, &enumeration_attr_group=
);
> > +}
> > +
> > +int populate_enumeration_elements_from_package(union acpi_object *enum=
_obj,
> > +                                        int instance_id,
> > +                                        enum hp_wmi_data_type type)
> > +{
> > +     char *str_value =3D NULL;
> > +     int value_len;
> > +     int status =3D 0;
> > +     u32 size =3D 0;
> > +     u32 int_value;
> > +     int elem =3D 0;
> > +     int reqs;
> > +     int eloc;
> > +     int pos_values;
> > +
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_la=
nguage_code,
> > +             LANG_CODE_STR,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].display_=
name_language_code));
> > +
> > +     for (elem =3D 1, eloc =3D 1; elem < hp_wmi_elements_count[type]; =
elem++, eloc++) {
> > +
> > +             switch (enum_obj[elem].type) {
> > +             case ACPI_TYPE_STRING:
> > +
> > +                     if (PREREQUISITES !=3D elem && ENUM_POSSIBLE_VALU=
ES !=3D elem) {
> > +                             status =3D convert_hexstr_to_str(&enum_ob=
j[elem].string.pointer,
> > +                                                            enum_obj[e=
lem].string.length,
> > +                                                            &str_value=
, &value_len);
> > +                             if (ACPI_FAILURE(status))
> > +                                     continue;
> > +
> > +                     }
> > +                     break;
> > +             case ACPI_TYPE_INTEGER:
> > +                     int_value =3D (u32)enum_obj[elem].integer.value;
> > +                     break;
> > +             default:
> > +                     pr_warn("Unsupported object type [%d]\n", enum_ob=
j[elem].type);
> > +                     continue;
> > +             }
> > +
> > +             /* stop if extra counter is greater than total number
> > +              * of elements for enumeration type
> > +              */
> > +             if (eloc =3D=3D hp_wmi_elements_count[type])
> > +                     goto exit_enumeration_package;
> > +
> > +             /* Assign appropriate element value to corresponding fiel=
d*/
> > +             switch (eloc) {
> > +             case VALUE:
> > +                     break;
> > +             case PATH:
> > +                     strscpy(bioscfg_drv.enumeration_data[instance_id]=
.path, str_value,
> > +                             sizeof(bioscfg_drv.enumeration_data[insta=
nce_id].path));
> > +                     break;
> > +             case IS_READONLY:
> > +                     bioscfg_drv.enumeration_data[instance_id].is_read=
only =3D int_value;
> > +                     break;
> > +             case DISPLAY_IN_UI:
> > +                     bioscfg_drv.enumeration_data[instance_id].display=
_in_ui =3D int_value;
> > +                     break;
> > +             case REQUIRES_PHYSICAL_PRESENCE:
> > +                     bioscfg_drv.enumeration_data[instance_id].require=
s_physical_presence =3D int_value;
> > +                     break;
> > +             case SEQUENCE:
> > +                     bioscfg_drv.enumeration_data[instance_id].sequenc=
e =3D int_value;
> > +                     break;
> > +             case PREREQUISITE_SIZE:
> > +                     bioscfg_drv.enumeration_data[instance_id].prerequ=
isitesize =3D int_value;
> > +                     if (int_value > 20)
> > +                             pr_warn("Prerequisites size value exceede=
d the maximum number of elements supported or data may be malformed\n");
> > +                     /*
> > +                      * prerequisites element is omitted when
> > +                      * prerequisitesSize value is zero.
> > +                      */
> > +                     if (int_value =3D=3D 0)
> > +                             eloc++;
> > +                     break;
> > +             case PREREQUISITES:
> > +                     size =3D bioscfg_drv.enumeration_data[instance_id=
].prerequisitesize;
> > +
> > +                     for (reqs =3D 0; reqs < size; reqs++) {
> > +                             status =3D convert_hexstr_to_str(&enum_ob=
j[elem].string.pointer,
> > +                                                            enum_obj[e=
lem].string.length,
> > +                                                            &str_value=
, &value_len);
> > +                             if (ACPI_FAILURE(status))
> > +                                     break;
> > +
> > +                             strlcat(bioscfg_drv.enumeration_data[inst=
ance_id].prerequisites,
> > +                                     str_value,
> > +                                     sizeof(bioscfg_drv.enumeration_da=
ta[instance_id].prerequisites));
> > +                             if (reqs !=3D (size - 1))
> > +                                     strlcat(bioscfg_drv.enumeration_d=
ata[instance_id].prerequisites, ";",
> > +                                             sizeof(bioscfg_drv.enumer=
ation_data[instance_id].prerequisites));
> > +
> > +                             kfree(str_value);
> > +                             str_value =3D NULL;
> > +                     }
> > +                     break;
> > +
> > +             case SECURITY_LEVEL:
> > +                     bioscfg_drv.enumeration_data[instance_id].securit=
y_level =3D int_value;
> > +                     break;
> > +
> > +             case ENUM_CURRENT_VALUE:
> > +                     strscpy(bioscfg_drv.enumeration_data[instance_id]=
.current_value,
> > +                             str_value, sizeof(bioscfg_drv.enumeration=
_data[instance_id].current_value));
> > +                     break;
> > +             case ENUM_SIZE:
> > +                     bioscfg_drv.enumeration_data[instance_id].size =
=3D int_value;
> > +                     break;
> > +             case ENUM_POSSIBLE_VALUES:
> > +                     size =3D bioscfg_drv.enumeration_data[instance_id=
].size;
> > +                     for (pos_values =3D 0; pos_values < size; pos_val=
ues++) {
> > +                             status =3D convert_hexstr_to_str(&enum_ob=
j[elem + pos_values].string.pointer,
> > +                                                            enum_obj[e=
lem  + pos_values].string.length,
> > +                                                            &str_value=
, &value_len);
> > +                             if (ACPI_FAILURE(status))
> > +                                     break;
> > +
> > +                             strlcat(bioscfg_drv.enumeration_data[inst=
ance_id].possible_values,
> > +                                     str_value,
> > +                                     sizeof(bioscfg_drv.enumeration_da=
ta[instance_id].possible_values));
> > +                             if (pos_values < (size - 1))
> > +                                     strlcat(bioscfg_drv.enumeration_d=
ata[instance_id].possible_values, ";",
> > +                                             sizeof(bioscfg_drv.enumer=
ation_data[instance_id].possible_values));
> > +                             kfree(str_value);
> > +                             str_value =3D NULL;
> > +                     }
> > +                     break;
> > +             default:
> > +                     pr_warn("Invalid element: %d found in Enumeration=
 attribute or data may be malformed\n", elem);
> > +                     break;
> > +             }
> > +
> > +             kfree(str_value);
> > +             str_value =3D NULL;
> > +     }
> > +
> > +exit_enumeration_package:
> > +             kfree(str_value);
> > +             str_value =3D NULL;
> > +     return 0;
> > +}
> > +
> > +/*
> > + * populate_enumeration_buffer_data() -
> > + * Populate all properties of an instance under enumeration attribute
> > + *
> > + * @enum_obj: ACPI object with enumeration data
> > + * @instance_id: The instance to enumerate
> > + * @attr_name_kobj: The parent kernel object
> > + * @enumeration_property_count: Total properties count under enumerati=
on type
> > + */
> > +int populate_enumeration_buffer_data(union acpi_object *enum_obj, int =
instance_id,
>
> Please replace:
>
> union acpi_object *enum_obj
>
> with:
>
> u16 *buffer_ptr, size_t buffer_size,
>
> for better readability, but also because actually walking obj->buffer.poi=
nter
> feels wrong. What if some other code later wants to also check the buffer=
,
> but now obj->buffer.pointer is all of a sudden pointing to the end ?
>
> Also you should pass in the (remaining) size and also pass this into
> get_string_from_buffer() and into get_integer_from_buffer() and have
> them check that they do not run pass the end of the buffer.
>
> Also please adjust hp_init_bios_attributes() for it to have local:
>
> u16 *buffer_ptr;
> size_t buffer_size;
>
> variables and for it to pass them into it's get_string_from_buffer()
> call before it passes them to populate_enumeration_buffer_data()
>
> These changes have 2 goals:
>
> 1. don't modify the contents of the acpi_object. In general for
>  things like walking pointers you should use a local variable
>  not change the members of a passed-by-reference struct, to
>  avoid surprising the caller
>
> 2. add bounds check everywhere to ensure that you don't run
>  past the end of the buffer while parsing it.
>
>
> > +                           struct kobject *attr_name_kobj)
> > +{
> > +
> > +     bioscfg_drv.enumeration_data[instance_id].type =3D HPWMI_ENUMERAT=
ION_TYPE;
> > +     bioscfg_drv.enumeration_data[instance_id].attr_name_kobj =3D attr=
_name_kobj;
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
> > +             attr_name_kobj->name,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].attribut=
e_name));
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
> > +             attr_name_kobj->name,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].display_=
name));
> > +
> > +     /* Populate enumeration elements */
> > +     populate_enumeration_elements_from_buffer(enum_obj, instance_id, =
HPWMI_ENUMERATION_TYPE);
> > +     update_attribute_permissions(bioscfg_drv.enumeration_data[instanc=
e_id].is_readonly,
> > +                                 &enumeration_current_val);
> > +     friendly_user_name_update(bioscfg_drv.enumeration_data[instance_i=
d].path,
> > +                               attr_name_kobj->name,
> > +                                bioscfg_drv.enumeration_data[instance_=
id].display_name,
> > +                                sizeof(bioscfg_drv.enumeration_data[in=
stance_id].display_name));
> > +
> > +     return sysfs_create_group(attr_name_kobj, &enumeration_attr_group=
);
> > +}
> > +
> > +int populate_enumeration_elements_from_buffer(union acpi_object *enum_=
obj,
> > +                                           int instance_id,
> > +                                           enum hp_wmi_data_type type)
> > +{
> > +     int status;
> > +     char *str =3D NULL;
> > +     int elem;
> > +     int reqs;
> > +     int integer;
> > +     int size =3D 0;
> > +     int values;
> > +
> > +     elem =3D 0;
> > +
> > +     strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_la=
nguage_code,
> > +             LANG_CODE_STR,
> > +             sizeof(bioscfg_drv.enumeration_data[instance_id].display_=
name_language_code));
> > +
> > +     for (elem =3D 1; elem < 3; elem++) {
> > +
> > +             status =3D get_string_from_buffer((u16 **)&enum_obj->buff=
er.pointer, &str);
> > +             if (ACPI_FAILURE(status))
> > +                     continue;
> > +
> > +             switch (elem) {
> > +             case VALUE:
> > +                     /* Skip 'Value' since 'CurrentValue' is reported.=
 */
> > +                     break;
> > +             case PATH:
> > +                     strscpy(bioscfg_drv.enumeration_data[instance_id]=
.path,
> > +                             str, sizeof(bioscfg_drv.enumeration_data[=
instance_id].path));
> > +                     break;
> > +             default:
> > +                     pr_warn("Invalid element: %d found in Enumeration=
 attribute or data may be malformed\n", elem);
> > +                     break;
> > +             }
> > +             kfree(str);
> > +             str =3D NULL;
> > +     }
> > +
> > +     for (elem =3D 3; elem < hp_wmi_elements_count[type]; elem++) {
> > +             if (PREREQUISITES !=3D elem && ENUM_CURRENT_VALUE !=3D el=
em && ENUM_POSSIBLE_VALUES !=3D elem)
> > +                     status =3D get_integer_from_buffer((int **)&enum_=
obj->buffer.pointer, (int *)&integer);
> > +
> > +             if (ACPI_FAILURE(status))
> > +                     continue;
> > +             switch (elem) {
> > +             case IS_READONLY:
> > +                     bioscfg_drv.enumeration_data[instance_id].is_read=
only =3D integer;
> > +                     break;
> > +             case DISPLAY_IN_UI:
> > +                     bioscfg_drv.enumeration_data[instance_id].display=
_in_ui =3D integer;
> > +                     break;
> > +             case REQUIRES_PHYSICAL_PRESENCE:
> > +                     bioscfg_drv.enumeration_data[instance_id].require=
s_physical_presence =3D integer;
> > +                     break;
> > +             case SEQUENCE:
> > +                     bioscfg_drv.enumeration_data[instance_id].sequenc=
e =3D integer;
> > +                     break;
> > +             case PREREQUISITE_SIZE:
> > +                     bioscfg_drv.enumeration_data[instance_id].prerequ=
isitesize =3D integer;
> > +                     if (integer > 20)
> > +                             pr_warn("Prerequisites size value exceede=
d the maximum number of elements supported or data may be malformed\n");
> > +                     break;
> > +             case PREREQUISITES:
> > +                     size =3D bioscfg_drv.enumeration_data[instance_id=
].prerequisitesize;
> > +                     for (reqs =3D 0; reqs < size; reqs++) {
> > +                             status =3D get_string_from_buffer((u16 **=
)&enum_obj->buffer.pointer, &str);
> > +                             if (ACPI_FAILURE(status))
> > +                                     continue;
> > +
> > +                             strlcat(bioscfg_drv.enumeration_data[inst=
ance_id].prerequisites,
> > +                                     str,
> > +                                     sizeof(bioscfg_drv.enumeration_da=
ta[instance_id].prerequisites));
> > +                             if (reqs !=3D (size - 1))
> > +                                     strlcat(bioscfg_drv.enumeration_d=
ata[instance_id].prerequisites, ";",
> > +                                             sizeof(bioscfg_drv.enumer=
ation_data[instance_id].prerequisites));
> > +                             kfree(str);
> > +                             str =3D NULL;
> > +                     }
> > +                     break;
> > +             case SECURITY_LEVEL:
> > +                     bioscfg_drv.enumeration_data[instance_id].securit=
y_level =3D integer;
> > +                     break;
> > +             case ENUM_CURRENT_VALUE:
> > +                     status =3D get_string_from_buffer((u16 **)&enum_o=
bj->buffer.pointer, &str);
> > +                     strscpy(bioscfg_drv.enumeration_data[instance_id]=
.current_value,
> > +                             str,
> > +                             sizeof(bioscfg_drv.enumeration_data[insta=
nce_id].current_value));
> > +                     break;
> > +             case ENUM_SIZE:
> > +                     bioscfg_drv.enumeration_data[instance_id].size =
=3D integer;
> > +                     break;
> > +             case ENUM_POSSIBLE_VALUES:
> > +                     size =3D bioscfg_drv.enumeration_data[instance_id=
].size;
> > +                     for (values =3D 0; values < size; values++) {
> > +                             status =3D get_string_from_buffer((u16 **=
)&enum_obj->buffer.pointer, &str);
> > +                             if (ACPI_FAILURE(status))
> > +                                     continue;
> > +
> > +                             strlcat(bioscfg_drv.enumeration_data[inst=
ance_id].possible_values,
> > +                                     str,
> > +                                     sizeof(bioscfg_drv.enumeration_da=
ta[instance_id].possible_values));
> > +                             if (values !=3D (size - 1))
> > +                                     strlcat(bioscfg_drv.enumeration_d=
ata[instance_id].possible_values, ";",
> > +                                             sizeof(bioscfg_drv.enumer=
ation_data[instance_id].possible_values));
> > +                             kfree(str);
> > +                             str =3D NULL;
> > +                     }
> > +                     break;
> > +             default:
> > +                     pr_warn("Invalid element: %d found in Enumeration=
 attribute or data may be malformed\n", elem);
> > +                     break;
> > +             }
> > +             kfree(str);
> > +             str =3D NULL;
> > +     }
> > +     kfree(str);
> > +     str =3D NULL;
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * exit_enumeration_attributes() - Clear all attribute data
> > + *
> > + * Clears all data allocated for this group of attributes
> > + */
> > +void exit_enumeration_attributes(void)
> > +{
> > +     int instance_id;
> > +
> > +     for (instance_id =3D 0; instance_id < bioscfg_drv.enumeration_ins=
tances_count; instance_id++) {
> > +             if (bioscfg_drv.enumeration_data[instance_id].attr_name_k=
obj)
> > +                     sysfs_remove_group(bioscfg_drv.enumeration_data[i=
nstance_id].attr_name_kobj,
> > +                                                             &enumerat=
ion_attr_group);
> > +     }
> > +     bioscfg_drv.enumeration_instances_count =3D 0;
> > +
> > +     kfree(bioscfg_drv.enumeration_data);
> > +     bioscfg_drv.enumeration_data =3D NULL;
> > +}
>
>
> Regards,
>
> Hans
>
