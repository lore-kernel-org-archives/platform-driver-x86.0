Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC22C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 21:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiKIV0Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiKIV0X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 16:26:23 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0B72F025
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 13:26:21 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bs21so27815142wrb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 13:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjv8I5UcdDAS4IXPJJE4i46dzBepvmTCwf6xmnXyfc0=;
        b=SYWl8/VOkKi6Fjuc6p/9V+/gxZTeyXWj8vpZXkVMRJKjndfg8OgTN7xme1CgSs5gJM
         PfUkKaQctF1wpk5Rt0/AbGexZXZ2k6jq+Dwl5ferwKXo/Bn5VrkcdrfP/8QRsFj+4S9c
         K2VJLIXyo+6WVCjZ+8GqIbOTBadzLWwC8lPiDAA7LRkhK0c+c3nQa8w5ZQ/Xrh336G/R
         8BcbfqcPFBQ3deA91h6w6moSjKeBM5VrFr7JPWVI/f2+gSPF+74jdXUuFMaHV25rHwnT
         sPyWIURiPnH352N7vhFqmmoeMI4TYjiGlLLGBWnrCtgXKWUr4USHxXRUFDFh7I/QRxeZ
         B1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjv8I5UcdDAS4IXPJJE4i46dzBepvmTCwf6xmnXyfc0=;
        b=2mTMWcdKe4nn0X6M8WeAhqlLfM+4ppsdyACU6yvu22IbMjpC4Zxre5x+EVST4Ver8q
         dyARK2F7LBqJJJQ1sB8XMxt26TIeT9akCD0SpJeHsSXNFV0Va3So/21HqL6DouoKs84q
         kzSLfGdjeXQkjpxD95MYi7tfCIl32G2CmC1DcdCfYXVIq+xgjTvrKfiHr/BOXkkcgvy9
         bqSywG8AhM0atH+A3ebXOlf5c0PpdaesXSg7hv/sz5s4WIfboEKQVPPSiGOu1bsTOl/h
         GQWCCTFWcSrUikv9xTM3k4MOzPjFvw+TwVtJQl9c38YtJ1k+OjQtu9F3KqFMkhfG0XHM
         NbBQ==
X-Gm-Message-State: ACrzQf3bHGU8qZy4dIHVP2G15ZAFuQUyWG539NVb424SA/9e/rfrFWsY
        JLQXl28qz76Vt4mwxF0p9Ip7wFNCusV4qqsX+EI=
X-Google-Smtp-Source: AMsMyM47Qf6XsE3yGp6EbIGZ71PIgbmImuiPfvX6iVZcsP5Z4ESy+BHw49uqEE7sLyzICBbwLeLRF29IVxD5+JNmDqQ=
X-Received: by 2002:adf:f547:0:b0:23a:239b:7e6a with SMTP id
 j7-20020adff547000000b0023a239b7e6amr19959244wrp.667.1668029179514; Wed, 09
 Nov 2022 13:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com> <CAOOmCE9uwo_wiaYwanDAAS39JYe3WuLNsBWg=dZczekd0JHVow@mail.gmail.com>
 <97019281-05bc-66c8-1eac-ff081e3b0ac3@redhat.com> <CAOOmCE9m5OO=Kou1RLpSANK9HYotrjSFojOF6_7gVcBUKOvO9A@mail.gmail.com>
 <5905b561-5686-07eb-e7d1-f1d6203561c6@redhat.com> <CAOOmCE9vdVnoMzePAzVrAHvhiur9J+o=VFxRRs=Yg8pxUjezag@mail.gmail.com>
 <4867796d-c400-aa6e-4740-cfa8f213eda8@redhat.com> <CAOOmCE_3m5gNKcPg+jRJRHGwUBNTsthWtDkHhhzGra+=RZdZLQ@mail.gmail.com>
 <42bfc56c-a32a-168d-74ae-a7458ad7b63b@redhat.com>
In-Reply-To: <42bfc56c-a32a-168d-74ae-a7458ad7b63b@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 9 Nov 2022 15:26:07 -0600
Message-ID: <CAOOmCE_k1bLRPjKp26EcO+1Z=N98JtGx8ixHQ30U3dVwrhUMWg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 9, 2022 at 3:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/9/22 22:04, Jorge Lopez wrote:
> > On Wed, Nov 9, 2022 at 2:55 PM Hans de Goede <hdegoede@redhat.com> wrot=
e:
> >>
> >> Hi,
> >>
> >> On 11/9/22 21:52, Jorge Lopez wrote:
> >>> On Wed, Nov 9, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 11/9/22 21:00, Jorge Lopez wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Wed, Nov 9, 2022 at 12:10 PM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 11/9/22 18:24, Jorge Lopez wrote:
> >>>>>>> HI Hans,
> >>>>>>>
> >>>>>>> Please see questions and comments below.
> >>>>>>>
> >>>>>>> On Tue, Nov 8, 2022 at 8:51 AM Hans de Goede <hdegoede@redhat.com=
> wrote:
> >>>>>>>>
> >>>>>>>> Hi Jorge,
> >>>>>>>>
> >>>>>>>> Review comments inline.
> >>>>>>>>
> >>>>>>>> On 10/20/22 22:10, Jorge Lopez wrote:
> >>>>>>>>> The purpose for this patch is submit HP BIOSCFG driver to be li=
st of
> >>>>>>>>> HP Linux kernel drivers.  The driver include a total of 12 file=
s
> >>>>>>>>> broken in several patches.  This is set 1 of 4.
> >>>>>>>>>
> >>>>>>>>> HP BIOS Configuration driver purpose is to provide a driver sup=
porting
> >>>>>>>>> the latest sysfs class firmware attributes framework allowing t=
he user
> >>>>>>>>> to change BIOS settings and security solutions on HP Inc.=E2=80=
=99s commercial
> >>>>>>>>> notebooks.
> >>>>>>>>>
> >>>>>>>>> Many features of HP Commercial PC=E2=80=99s can be managed usin=
g Windows
> >>>>>>>>> Management Instrumentation (WMI). WMI is an implementation of W=
eb-Based
> >>>>>>>>> Enterprise Management (WBEM) that provides a standards-based in=
terface
> >>>>>>>>> for changing and monitoring system settings.  HP BISOCFG driver=
 provides
> >>>>>>>>> a native Linux solution and the exposed features facilitates th=
e
> >>>>>>>>> migration to Linux environments.
> >>>>>>>>>
> >>>>>>>>> The Linux security features to be provided in hp-bioscfg driver=
 enables
> >>>>>>>>> managing the BIOS settings and security solutions via sysfs, a =
virtual
> >>>>>>>>> filesystem that can be used by user-mode applications.   The ne=
w
> >>>>>>>>> documentation cover features such Secure Platform Management, S=
ure
> >>>>>>>>> Admin, and Sure Start.  Each section provides security feature
> >>>>>>>>> description and identifies sysfs directories and files exposed =
by
> >>>>>>>>> the driver.
> >>>>>>>>>
> >>>>>>>>> Many HP Commercial PC=E2=80=99s include a feature called Secure=
 Platform
> >>>>>>>>> Management (SPM), which replaces older password-based BIOS sett=
ings
> >>>>>>>>> management with public key cryptography. PC secure product mana=
gement
> >>>>>>>>> begins when a target system is provisioned with cryptographic k=
eys
> >>>>>>>>> that are used to ensure the integrity of communications between=
 system
> >>>>>>>>> management utilities and the BIOS.
> >>>>>>>>>
> >>>>>>>>> HP Commercial PC=E2=80=99s have several BIOS settings that cont=
rol its behaviour
> >>>>>>>>> and capabilities, many of which are related to security. To pre=
vent
> >>>>>>>>> unauthorized changes to these settings, the system can be confi=
gured
> >>>>>>>>> to use a Sure Admin cryptographic signature-based authorization=
 string
> >>>>>>>>> that the BIOS will use to verify authorization to modify the se=
tting.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >>>>>>>>>
> >>>>>>>>> ---
> >>>>>>>>> Based on the latest platform-drivers-x86.git/for-next
> >>>>>>>>> ---
> >>>>>>>>>  .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
> >>>>>>>>>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++=
++++++++
> >>>>>>>>>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++=
++++
> >>>>>>>>>  3 files changed, 1477 insertions(+)
> >>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr=
-interface.c
> >>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.=
h
> >>>>>>>>>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-att=
ributes.c
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interf=
ace.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>>>>>> new file mode 100644
> >>>>>>>>> index 000000000000..f0c919bf3ab0
> >>>>>>>>> --- /dev/null
> >>>>>>>>> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >>>>>>>>> @@ -0,0 +1,285 @@
> >>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>>>>>> +/*
> >>>>>>>>> + * Functions corresponding to methods under BIOS interface GUI=
D
> >>>>>>>>> + * for use with hp-bioscfg driver.
> >>>>>>>>> + *
> >>>>>>>>> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> >>>>>>>>> + */
> >>>>>>>>> +
> >>>>>>>>> +#include <linux/wmi.h>
> >>>>>>>>> +#include "bioscfg.h"
> >>>>>>>>> +
> >>>>>>>>> +#define SET_DEFAULT_VALUES_METHOD_ID 0x02
> >>>>>>>>> +#define SET_BIOS_DEFAULTS_METHOD_ID  0x03
> >>>>>>>>> +#define SET_ATTRIBUTE_METHOD_ID              0x04
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * set_attribute() - Update an attribute value
> >>>>>>>>> + * @a_name: The attribute name
> >>>>>>>>> + * @a_value: The attribute value
> >>>>>>>>> + *
> >>>>>>>>> + * Sets an attribute to new value
> >>>>>>>>> + */
> >>>>>>>>> +int hp_set_attribute(const char *a_name, const char *a_value)
> >>>>>>>>> +{
> >>>>>>>>> +     size_t security_area_size;
> >>>>>>>>> +     size_t a_name_size, a_value_size;
> >>>>>>>>> +     u16 *buffer =3D NULL;
> >>>>>>>>> +     u16 *start =3D NULL;
> >>>>>>>>> +     int  buffer_size;
> >>>>>>>>
> >>>>>>>> You have 2 spaces between int and buffer_size here, please drop
> >>>>>>>> one.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> +     int ret;
> >>>>>>>>> +     int instance;
> >>>>>>>>> +     char *auth_empty_value =3D " ";
> >>>>>>>>> +
> >>>>>>>>> +     mutex_lock(&bioscfg_drv.mutex);
> >>>>>>>>> +     if (!bioscfg_drv.bios_attr_wdev) {
> >>>>>>>>> +             ret =3D -ENODEV;
> >>>>>>>>> +             goto out_set_attribute;
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     instance =3D get_password_instance_for_type(SETUP_PASSWD)=
;
> >>>>>>>>> +     if (instance < 0)
> >>>>>>>>> +             goto out_set_attribute;
> >>>>>>>>> +
> >>>>>>>>> +     if (strlen(bioscfg_drv.password_data[instance].current_pa=
ssword) =3D=3D 0)
> >>>>>>>>> +             strncpy(bioscfg_drv.password_data[instance].curre=
nt_password,
> >>>>>>>>> +                     auth_empty_value,
> >>>>>>>>> +                     sizeof(bioscfg_drv.password_data[instance=
].current_password));
> >>>>>>>>
> >>>>>>>> strncpy does not guarantee 0 termination of the destination buff=
er,
> >>>>>>>> please use strscpy.
> >>>>>>>>
> >>>>>>>>> +
> >>>>>>>>> +     a_name_size =3D calculate_string_buffer(a_name);
> >>>>>>>>> +     a_value_size =3D calculate_string_buffer(a_value);
> >>>>>>>>> +     security_area_size =3D calculate_security_buffer(bioscfg_=
drv.password_data[instance].current_password);
> >>>>>>>>> +     buffer_size =3D a_name_size + a_value_size + security_are=
a_size;
> >>>>>>>>> +
> >>>>>>>>> +     buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> >>>>>>>>> +     if (!buffer) {
> >>>>>>>>> +             ret =3D -ENOMEM;
> >>>>>>>>> +             goto out_set_attribute;
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     /* build variables to set */
> >>>>>>>>> +     start =3D buffer;
> >>>>>>>>> +     start =3D ascii_to_utf16_unicode(start, a_name);
> >>>>>>>>> +     if (!start)
> >>>>>>>>> +             goto out_set_attribute;
> >>>>>>>>> +
> >>>>>>>>> +     start =3D ascii_to_utf16_unicode(start, a_value);
> >>>>>>>>> +     if (!start)
> >>>>>>>>> +             goto out_set_attribute;
> >>>>>>>>> +
> >>>>>>>>> +     populate_security_buffer(start, bioscfg_drv.password_data=
[instance].current_password);
> >>>>>>>>> +     ret =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> >>>>>>>>> +
> >>>>>>>>> +
> >>>>>>>>> +out_set_attribute:
> >>>>>>>>> +     kfree(buffer);
> >>>>>>>>> +     mutex_unlock(&bioscfg_drv.mutex);
> >>>>>>>>> +     return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * hp_wmi_perform_query
> >>>>>>>>> + *
> >>>>>>>>> + * query:    The commandtype (enum hp_wmi_commandtype)
> >>>>>>>>> + * write:    The command (enum hp_wmi_command)
> >>>>>>>>> + * buffer:   Buffer used as input and/or output
> >>>>>>>>> + * insize:   Size of input buffer
> >>>>>>>>> + * outsize:  Size of output buffer
> >>>>>>>>> + *
> >>>>>>>>> + * returns zero on success
> >>>>>>>>> + *         an HP WMI query specific error code (which is posit=
ive)
> >>>>>>>>> + *         -EINVAL if the query was not successful at all
> >>>>>>>>> + *         -EINVAL if the output buffer size exceeds buffersiz=
e
> >>>>>>>>> + *
> >>>>>>>>> + * Note: The buffersize must at least be the maximum of the in=
put and output
> >>>>>>>>> + *       size. E.g. Battery info query is defined to have 1 by=
te input
> >>>>>>>>> + *       and 128 byte output. The caller would do:
> >>>>>>>>> + *       buffer =3D kzalloc(128, GFP_KERNEL);
> >>>>>>>>> + *       ret =3D hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPW=
MI_READ, buffer, 1, 128)
> >>>>>>>>> + */
> >>>>>>>>> +int hp_wmi_perform_query(int query, enum hp_wmi_command comman=
d, void *buffer, int insize, int outsize)
> >>>>>>>>> +{
> >>>>>>>>> +     struct acpi_buffer input, output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
> >>>>>>>>> +     struct bios_return *bios_return;
> >>>>>>>>> +     union acpi_object *obj =3D NULL;
> >>>>>>>>> +     struct bios_args *args =3D NULL;
> >>>>>>>>> +     int mid, actual_insize, actual_outsize;
> >>>>>>>>> +     size_t bios_args_size;
> >>>>>>>>> +     int ret;
> >>>>>>>>> +
> >>>>>>>>> +     mid =3D encode_outsize_for_pvsz(outsize);
> >>>>>>>>> +     if (WARN_ON(mid < 0))
> >>>>>>>>> +             return mid;
> >>>>>>>>> +
> >>>>>>>>> +     actual_insize =3D insize;
> >>>>>>>>> +     bios_args_size =3D struct_size(args, data, insize);
> >>>>>>>>> +     args =3D kmalloc(bios_args_size, GFP_KERNEL);
> >>>>>>>>> +     if (!args)
> >>>>>>>>> +             return -ENOMEM;
> >>>>>>>>> +
> >>>>>>>>> +     input.length =3D bios_args_size;
> >>>>>>>>> +     input.pointer =3D args;
> >>>>>>>>> +
> >>>>>>>>> +     args->signature =3D 0x55434553;
> >>>>>>>>> +     args->command =3D command;
> >>>>>>>>> +     args->commandtype =3D query;
> >>>>>>>>> +     args->datasize =3D insize;
> >>>>>>>>> +     memcpy(args->data, buffer, flex_array_size(args, data, in=
size));
> >>>>>>>>> +
> >>>>>>>>> +     ret =3D wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &in=
put, &output);
> >>>>>>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>>>>>> +     if (ret)
> >>>>>>>>> +             goto out_free;
> >>>>>>>>> +
> >>>>>>>>> +     obj =3D output.pointer;
> >>>>>>>>> +     if (!obj) {
> >>>>>>>>> +             ret =3D -EINVAL;
> >>>>>>>>> +             goto out_free;
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>
> >>>>>>>> You need to check the type of obj here before dereferencing
> >>>>>>>> obj as if it is a buffer.
> >>>>>>>>
> >>>>>>>>> +     bios_return =3D (struct bios_return *)obj->buffer.pointer=
;
> >>>>>>>>> +     ret =3D bios_return->return_code;
> >>>>>>>>> +     bioscfg_drv.last_wmi_status =3D ret;
> >>>>>>>>> +     if (ret) {
> >>>>>>>>> +             if (ret !=3D HPWMI_RET_UNKNOWN_COMMAND &&
> >>>>>>>>> +                 ret !=3D HPWMI_RET_UNKNOWN_CMDTYPE)
> >>>>>>>>> +                     pr_warn("query 0x%x returned error 0x%x\n=
", query, ret);
> >>>>>>>>> +             goto out_free;
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     /* Ignore output data of zero size */
> >>>>>>>>> +     if (!outsize)
> >>>>>>>>> +             goto out_free;
> >>>>>>>>> +
> >>>>>>>>> +     actual_outsize =3D min(outsize, (int)(obj->buffer.length =
- sizeof(*bios_return)));
> >>>>>>>>> +     memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return)=
, actual_outsize);
> >>>>>>>>> +     memset(buffer + actual_outsize, 0, outsize - actual_outsi=
ze);
> >>>>>>>>> +
> >>>>>>>>> +out_free:
> >>>>>>>>> +     kfree(obj);
> >>>>>>>>> +     kfree(args);
> >>>>>>>>> +     return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +/*
> >>>>>>>>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 un=
icode
> >>>>>>>>> + *
> >>>>>>>>> + * @p:   Unicode buffer address
> >>>>>>>>> + * @str: string to convert to unicode
> >>>>>>>>> + *
> >>>>>>>>> + * Returns a void pointer to the buffer containing unicode str=
ing
> >>>>>>>>> + */
> >>>>>>>>> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> >>>>>>>>> +{
> >>>>>>>>> +     int len =3D strlen(str);
> >>>>>>>>> +     int ret;
> >>>>>>>>> +
> >>>>>>>>> +     /*
> >>>>>>>>> +      * Add null character when reading an empty string
> >>>>>>>>> +      */
> >>>>>>>>> +     if (len =3D=3D 0) {
> >>>>>>>>> +             *p++ =3D 2;
> >>>>>>>>> +             *p++ =3D (u8)0x00;
> >>>>>>>>> +             return p;
> >>>>>>>>
> >>>>>>>> This does not match with calculate_string_buffer() which will
> >>>>>>>> return 2 for a 0 length string while you are using 4 bytes here.
> >>>>>>>>
> >>>>>>>> I guess this may also be why you need to use " " for
> >>>>>>>> auth_empty_value above, so as to avoid this bug.
> >>>>>>>>
> >>>>>>> HP BIOS expects 2 characters when an empty string is being conver=
ted
> >>>>>>> to u16 hence the reason for returning 2 instead of zero.  This is=
 an
> >>>>>>> intended behavior and needed when  allocating a buffer and writin=
g to
> >>>>>>> BIOS.
> >>>>>>
> >>>>>> Right I understand that, it wants 2 characters for the 16 bit leng=
th
> >>>>>> word, but why not write 0 to that 16 bit length word. Why actually
> >>>>>> say the string-buffer length is 2 bytes long / and then write
> >>>>>> a 16-bit word with value 0?
> >>>>>>
> >>>>>> What you are doing now creates a 4 byte buffer like this:
> >>>>>>
> >>>>>> u8 buf[4] =3D { 0x02, 0x00, 0x00, 0x00 }
> >>>>>>
> >>>>>> Why not just create a 2 byte buffer like this:
> >>>>>>
> >>>>>> u8 buf[2] =3D { 0x00, 0x00 }
> >>>>>>
> >>>>>> ?
> >>>>>>
> >>>>>>
> >>>>>> Also I'm wondering why the empty auth string is " " and
> >>>>>> not "" ?
> >>>>>>
> >>>>>>
> >>>>>
> >>>>> The string returned for an empty string is 4 bytes.  The returned
> >>>>> string includes two bytes for the string size in bytes and the
> >>>>> remaining bytes are the string.
> >>>>> Size =3D  0x02, 0x00
> >>>>> String =3D 0x00, 0x00
> >>>>>
> >>>>> All strings return include the string size in bytes followed by the=
 u16 string
> >>>>
> >>>> Right I understand that, but why is the "String =3D 0x00, 0x00"
> >>>> there ? All the non-0-length strings are not 0 terminated,
> >>>> why does the zero length string needs to be specified as length 2
> >>>> (1 u16) and then have that u16 be a 0 terminator ?
> >>>>
> >>> It is a specific format required by BIOS for any zero-length strings.
> >>> I don't know the reason why BIOS wants that format.
> >>>
> >>>
> >>>> Have you tried just using Size[2] =3D  0x00, 0x00 and String[0] for
> >>>> an empty string?
> >>>>
> >>>
> >>> I tried during the development process and each time the data is
> >>> rejected by BIOS.
> >>
> >> Ok, well in that case you are going to need your own
> >> ascii_to_utf16_unicode() to handle the weird case for the
> >> 0 sized string, so no need to move the dell-wmi-sysman versions
> >> to the shared wmi code.
> >>
> >> But please do start with a copy of the Dell function and then
> >> add the special case for the 0 len string, since the original
> >> version above does not properly handle errors.
> >>
> >> Also this means you need to update the hp calculate_string_buffer()
> >> copy to properly return 4 rather then 2 for the bufsize for
> >> a 0 length string.
> >>
> >
> > I will do so. Thanks.
> > BTW, changes requested for sysman.c will require changes to two other
> > DELL source files;
> > biosattr-interface.c and passwordattr-interface.c.
> > All I can do is to verify it compiles ok.
>
> Note that since you now need a special version to deal
> with the 0 length string weirdness, you can just make
> a private copy of the dell functions into the hp code
> and then modify that to add the special case for the
> 0 length strings.
>
> So there is no longer a need to move the dell versions
> out into wmi.c since the hp code will need a modified
> version anyways (so the code cannot be shared).
>

Understood.  I just wanted to make sure.
Thanks

> Regards,
>
> Hans
>
