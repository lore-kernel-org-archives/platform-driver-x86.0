Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37B1C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 19:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDLTiU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 15:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjDLTiT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 15:38:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5781738
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 12:38:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m4so15929160lfj.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681328287; x=1683920287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXugMrjabeNnR/Qpwn6yySLwWHI+631Z1rMlgb7Um70=;
        b=ZhyDwub6t0vimOrxcYQlfVopuiumDCPD5LX+miXmCw+1cyKGeOQJCcSf19NdJJHESn
         EywqoWxLjCrZOZaRuFuEGifM4NNc3RgSgamUN1/sd18h3gllQvP2Z064ZPuc3cUmQbPt
         okPvZzcMXilQ8TIpWxboJ/KCr6y0vCij8I2k15jecuo6pK+0MQJ151GmHLw+sOkZ2LAf
         0jyNh2qARJ8Kwt+kR3JSpeq4kx2pUw7HWjoVr2S3h9zc/R0pyjmf7NvfXOvd54RK8i7I
         ywSDLzrIrRMiMNVZ5L6pS3SGWQk8aN7saz/i2Nv96pRDNdIKt0sazy4n/j8AqSCqiLWD
         t8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681328287; x=1683920287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXugMrjabeNnR/Qpwn6yySLwWHI+631Z1rMlgb7Um70=;
        b=ER+hwWz2Wns0JDlphqFo6nsYHQtemCeCzO36CkzStoYDQMYT/p2rydQzO4g4NeWvuz
         7nBN8CgcEQl5Vjz7G58CH5ihNcUWt4HhG2Uzn+RZomNFnlZFd3AjoVliNAfc84XK8m0/
         onx+9unG5XHU/OwtVtRvOU9QnZ1jK7IDlhoKALGOn3gaM95qmF5enkWGKYmh61S1I1z7
         Jf/ZTWPDcUtfMdQbzIuGBbwlcETlvzuN1zj2dnLynBrit4xcROgvyqa1qcesVhHxSTSM
         otHijav90WGRTcJml4q4RCr/oM/XkFn5PCMET/K/d6fbO3J+r5NMuBuFVnYWaP+8tKJN
         VJ0w==
X-Gm-Message-State: AAQBX9c8SWNg8yG3QB+A02q3Na3uByeiowcYHLV/2oRGhNGm1IqzHaqG
        Z2GslDBoBXcTpxpBVNbzuunFgjMjCg3qGpexCzQ=
X-Google-Smtp-Source: AKy350azqyhrrqx1PiCurjontmk6V6o84obQ4C+9CYgn5j25JUbPAPGisEcuk39fSYTSzn46H6wY3rWx4RkTkmiSnV8=
X-Received: by 2002:ac2:482d:0:b0:4ec:85f6:5bec with SMTP id
 13-20020ac2482d000000b004ec85f65becmr22236lft.2.1681328286479; Wed, 12 Apr
 2023 12:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230309201022.9502-1-jorge.lopez2@hp.com> <20230309201022.9502-2-jorge.lopez2@hp.com>
 <dbf97220-03d6-4815-8f14-55ee477b8afb@t-8ch.de>
In-Reply-To: <dbf97220-03d6-4815-8f14-55ee477b8afb@t-8ch.de>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 12 Apr 2023 14:37:45 -0500
Message-ID: <CAOOmCE-=cprrpzEz5EOs00K7B=bp1rnrnZY7Ee0a245piioiJQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] Introduction of HP-BIOSCFG driver
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Thomas,

Please see my comments below.

On Sun, Apr 2, 2023 at 11:28=E2=80=AFAM Thomas Wei=C3=9Fschuh <thomas@t-8ch=
.de> wrote:
>
> Hi Jorge,
>
> below a few stylistic comments.
> These are very general and do not only affect the commented locations
> but the whole driver.
>
> That said these are not critical.
>
> First focus on removing dead code and nailing down the userspace API.
> Then it depends on your motivation.
>
> As said before I would focus on reducing the driver to the bare minimum
> that makes it usable, get it merged / clean it up and then re-add pieces
> bit-by-bit.

The driver functionality is the proposed basic functionality.  There
are plans to provide additional support for Sure Recover (Security
component) which is planned to be added in future patches.

>
> I'll probably go over all the files again when I am more familiar with
> the driver.
>
> > +             // append UTF_PREFIX to part and then convert it to unico=
de
> > +             strprefix =3D kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX,
> > +                                   authentication);
> > +             if (!strprefix)
> > +                     goto out_populate_security_buffer;
> > +
> > +             auth =3D ascii_to_utf16_unicode(auth, strprefix);
> > +     }
> > +out_populate_security_buffer:
>
> There is no need to have the name of the function in the label.
>
> Just "out" would be enough.
>
> > +
> > +     kfree(strprefix);
> > +     strprefix =3D NULL;
>
> No need to clear stack variables.

I will clear stack variables across all files.
>
> > +}
> > +
> > +ssize_t update_spm_state(void)
> > +{
> > +     int ret;
> > +     struct secureplatform_provisioning_data *data =3D NULL;
> > +
> > +     data =3D kmalloc(sizeof(struct secureplatform_provisioning_data),
> > +                    GFP_KERNEL);
>
> Use "sizeof(*data)". It's shorter and more robust.

Done!

> > +/*
> > + * statusbin - Reports SPM status in binary format
> > + *
> > + * @kobj:  Pointer to a kernel object of things that show up as
> > + *      directory in the sysfs filesystem.
> > + * @attr:  Pointer to list of attributes for the operation
> > + * @buf:   Pointer to buffer
>
> The parameters are the same for every attribute_show() function.
> No need to document them.
>
> Also if you document something use proper kerneldoc format:
> https://docs.kernel.org/doc-guide/kernel-doc.html

I will remove any unnecessary documentation.

>

> > +     ret =3D sysfs_emit(buf, "%s\n",
> > +                      spm_mechanism_types[bioscfg_drv.spm_data.mechani=
sm]);
> > +     return ret;
>
> No need for the temporary variable:

It was an oversight.  Done!

>
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/d=
rivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > new file mode 100644
> > index 000000000000..79ec007fbcee
> > --- /dev/null
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> > @@ -0,0 +1,459 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Functions corresponding to string type attributes under
> > + * HP_WMI_BIOS_STRING_GUID for use with hp-bioscfg driver.
> > + *
> > + * Copyright (c) 2022 HP Development Company, L.P.
> > + */
> > +
> > +#include "bioscfg.h"
> > +
> > +#define WMI_STRING_TYPE "HPBIOS_BIOSString"
> > +
> > +get_instance_id(string);
>
> This is weird to read. It looks like a function declaration.
> maybe use DEFINE_GET_INSTANCE_ID(string).
>

get_instance_id part of a group of functions defined in bioscfg.h.
The sample was taken from another driver which declared it in
lowercase.   I will change all functions names declared as a macro to
uppercase and update the names across all files.  The main purpose for
those functions was to avoid duplicating the same functions across all
files.

> > +
> > +static ssize_t current_value_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
> > +{
> > +     ssize_t ret;
> > +     int instance_id =3D get_string_instance_id(kobj);
> > +
> > +     if (instance_id < 0)
> > +             return -EIO;
> > +
> > +     ret =3D sysfs_emit(buf, "%s\n",
> > +                      bioscfg_drv.string_data[instance_id].current_val=
ue);
> > +
> > +     return ret;
> > +}
> > +
> > +/*
> > + * validate_string_input() -
> > + * Validate input of current_value against min and max lengths
> > + *
> > + * @instance_id: The instance on which input is validated
> > + * @buf: Input value
> > + */
> > +static int validate_string_input(int instance_id, const char *buf)
>
> Instead of passing around integer ids, that all the callees are using to
> look up some global data, it would be nicer to pass a pointer to the
> concrete instance struct to work on.
>

validate_string_input is part of the defined function
ATTRIBUTE_PROPERTY_STORE in bioscfg.h (line 457).

> This makes the code simpler and removes reference to global state all
> over the place.
>
Changing the values from int to pointer will add unnecessary overhead
since the instance ID is searched only once earlier in the process.


> > +{
> > +     int in_len =3D strlen(buf);
> > +
> > +     /* BIOS treats it as a read only attribute */
> > +     if (bioscfg_drv.string_data[instance_id].is_readonly)
> > +             return -EIO;
> > +
> > +     if ((in_len < bioscfg_drv.string_data[instance_id].min_length) ||
> > +         (in_len > bioscfg_drv.string_data[instance_id].max_length))
> > +             return -EINVAL;
>
> -ERANGE?
>

Done!

> > +
> > +     /*
> > +      * set pending reboot flag depending on
> > +      * "RequiresPhysicalPresence" value
> > +      */
> > +     if (bioscfg_drv.string_data[instance_id].requires_physical_presen=
ce)
> > +             bioscfg_drv.pending_reboot =3D TRUE;
>
> Just use "true" or "false" instead of "TRUE" and "FALSE".
>

Done!

> > +}
> > +
> > +/* Expected Values types associated with each element */
> > +static acpi_object_type expected_string_types[] =3D {
>
> Seems this can be const.

Done!
>
> > +     [NAME] =3D ACPI_TYPE_STRING,
> > +     [VALUE] =3D ACPI_TYPE_STRING,
> > +     [PATH] =3D ACPI_TYPE_STRING,
> > +     [IS_READONLY] =3D ACPI_TYPE_INTEGER,
> > +     [DISPLAY_IN_UI] =3D ACPI_TYPE_INTEGER,
> > +     [REQUIRES_PHYSICAL_PRESENCE] =3D ACPI_TYPE_INTEGER,
> > +     [SEQUENCE] =3D ACPI_TYPE_INTEGER,
> > +     [PREREQUISITES_SIZE] =3D ACPI_TYPE_INTEGER,
> > +     [PREREQUISITES] =3D ACPI_TYPE_STRING,
> > +     [SECURITY_LEVEL] =3D ACPI_TYPE_INTEGER,
> > +     [STR_MIN_LENGTH] =3D ACPI_TYPE_INTEGER,
> > +     [STR_MAX_LENGTH] =3D ACPI_TYPE_INTEGER
>
> *Do* add a trailing comma after a non end-of-list marker.
>
Done!

> > +void exit_string_attributes(void)
> > +{
> > +     int instance_id;
> > +
> > +     for (instance_id =3D 0; instance_id < bioscfg_drv.string_instance=
s_count; instance_id++) {
>
> You can declare loop variables inside the loop. This saves a bunch of
> horizontal space.
>
> > +             if (bioscfg_drv.string_data[instance_id].attr_name_kobj)
> > +                     sysfs_remove_group(bioscfg_drv.string_data[instan=
ce_id].attr_name_kobj,
> > +                                        &string_attr_group);
> > +     }
> > +     bioscfg_drv.string_instances_count =3D 0;
> > +
> > +     kfree(bioscfg_drv.string_data);
> > +     bioscfg_drv.string_data =3D NULL;
> > +}

Done!  I will keep that in mind when I review the remaining files.

> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c =
b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
> > +static struct attribute *sure_start_attrs[] =3D {
> > +     &sure_start_display_name.attr,
> > +     &sure_start_display_langcode.attr,
> > +     &sure_start_audit_log_entry_count.attr,
> > +     &sure_start_audit_log_entries.attr,
> > +     &sure_start_type.attr,
> > +     NULL,
>
> No trailing comma after end-of-array marker.

Done!
