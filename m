Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F25CCA482
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 20:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359785AbiFGUnO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 16:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376550AbiFGUjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 16:39:13 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CAF18316B
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 11:38:22 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id g205so16235993pfb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bz+zyKZj5HYmjJxg8eut/1Su71o+iJ2sxrA1L4SJK+o=;
        b=h+bUU34iISmNoLy6tZEF8i8Ph7hoVuR7gcZ3zIQrqRex4TP2e+lcXfcNZIxAAPH8Y6
         41n2VunNmqEu28griEVXPS4thO7FMXvRgjQHzERnbm9squqm13jdwV+q4ULGTbQg3wmq
         p/6R39421N6MVhaGbYnyVZDPgEqtazlz/L/29LIq+XV1KNv1SlI8sICXVhcaZNdYcHRO
         43WU1d4GnpJuKn67srwRePIn3MrByX01exkLgYr/rRIrH2Z33XhILkg1tk3pMOBRx96C
         OmzFjvvlZYQYNddXUAHi8dMHogYlQYaQF32TWfC3C2NEgmriJBj+rMNffE1XEam58wmb
         +VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bz+zyKZj5HYmjJxg8eut/1Su71o+iJ2sxrA1L4SJK+o=;
        b=J4CSd7LcatDYCi4tqz4N5lsQ1mkPHQya7OW+CF57IYwmXjh0N6yi9mZHLXJNIJVY9s
         fWF5Jevdrcv0HFoO3f6gtPMD+BUfQCylACCDkOnljr7W4tPqRIxoGE/GN6pENAmGm/Yi
         zecQxxOtl/a10POBPIOAtp99eTm0t8HC/hrAm4OJBbydey/nz7c996/uhIKrDEY6AMOx
         cGHARqQuOJxPLk3W7n6UfsD1lFXUHKC2qIe/sj+JqCgRzb9L6DEQrujR5dTw/1xBrkFT
         i0zzcHSlz4KsJiMsDrvwxhDWKyatoy8X1TDJgGi1G5B8OJy5FPAeGQS98kqV4tkYOzdM
         Kw9w==
X-Gm-Message-State: AOAM5321hUIibfRvMIquZWLAMm4H3DFD6T4YDCznfoz9nRSzUVr7QyTi
        8IcBUhUR42x7lt88MJlj7T8=
X-Google-Smtp-Source: ABdhPJxaYyC3uH58+JCKY5vVCQx2HaDFprQ3JJ/PDwjwzzydQot32DEd39WP1RWaVNC+5+LRwk2k0g==
X-Received: by 2002:a63:8648:0:b0:3fd:980d:8de4 with SMTP id x69-20020a638648000000b003fd980d8de4mr12638319pgd.198.1654627096321;
        Tue, 07 Jun 2022 11:38:16 -0700 (PDT)
Received: from ?IPv6:2405:201:a007:e183:aa6d:fbda:3c70:a6e9? ([2405:201:a007:e183:aa6d:fbda:3c70:a6e9])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b00163b65c9de2sm12911498plo.170.2022.06.07.11.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:38:15 -0700 (PDT)
Message-ID: <ca2bb15600cd7d101153eb4ee4a62ef5d8f0df72.camel@gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work
 with certain devices
From:   Bedant Patnaik <bedant.patnaik@gmail.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Wed, 08 Jun 2022 00:07:45 +0530
In-Reply-To: <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
         <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
         <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
         <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
         <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Jorge,

The patch you provided fixes the insize buffer issue on an Omen 15 2020
AMD.

The zero sized Field creation issue however, still persists. I could
not think of a better way of handling it than to check if the BIOS
throws an error if the insize parameter !=3D 0 and to use insize =3D 0 only
if it did.

I looked through the DSDT some more. It seems that all commandtypes
(when used with the HPWMI_READ command, do not actually make use of the
Field DAIN that is created, except for the HPWMI_FAN_SPEED_GET_QUERY
commandtype (used with HPWMI_GM command), which seems to access the
created Field. Since the only call to this command uses insize =3D sizeof
(char) (meaning it is never called with insize =3D 0), I think we can get
away with setting args->insize to some arbitrary value, say 1, if 0 is
passed as insize, since the Field is never accessed anyway. This
"solution" however, relies too much on the firmware.

Your input is welcome. Thank you for your time.

On Tue, 2022-06-07 at 13:11 -0500, Jorge Lopez wrote:
> Dropped other participants by accident.=C2=A0 Please see my comments
> below.
>=20
> The original code created an insize buffer size of 128 bytes
> regardless if the WMI call required a smaller buffer or not.=C2=A0 This
> particular behavior occurs in older BIOS and reproduced in OMEN
> laptops.=C2=A0 Newer BIOS handles=C2=A0 buffer sizes properly and meets t=
he
> latest specification requirements.=C2=A0 This is the reason why testing
> with a dynamically allocated buffer did not uncover any failures with
> the test systems at hand.
> One additional point was considered.=C2=A0 The purpose for introducing
> dynamically allocated buffers was primarily to support WMI calls that
> required buffers size bigger than 128 bytes.=C2=A0 The decision=C2=A0 was=
 made
> to separate those WMI calls to a separate driver and implement the
> new
> firmware-attribute framework.
>=20
> The current review request title is=C2=A0 "[PATCH] Revert "platform/x86:
> hp-wmi: Changing bios_args.data to be dynamically allocated"
>=20
> I am testing a cleaner solution to submit instead of=C2=A0 reverting the
> changes to hp_wmi_perform_query method.=C2=A0 The changes were made and
> tested on business notebooks without any issues.=C2=A0 I will submit a ne=
w
> patch as soon as I get the test results from a=C2=A0 community member who
> owns an Omen 15 system.
>=20
> The proposed patch which I am pending test results, it is as follows
>=20
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-
> wmi.c
> index 0e9a25b56e0e..7bcfa07cc6ab 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum
> hp_wmi_command command,
> =C2=A0 struct bios_args *args =3D NULL;
> =C2=A0 int mid, actual_outsize, ret;
> =C2=A0 size_t bios_args_size;
> + int actual_insize;
>=20
> =C2=A0 mid =3D encode_outsize_for_pvsz(outsize);
> =C2=A0 if (WARN_ON(mid < 0))
> =C2=A0 return mid;
>=20
> - bios_args_size =3D struct_size(args, data, insize);
> + actual_insize =3D max(insize, 128);
> + bios_args_size =3D struct_size(args, data, actual_insize);
> =C2=A0 args =3D kmalloc(bios_args_size, GFP_KERNEL);
> =C2=A0 if (!args)
> =C2=A0 return -ENOMEM;
> -----
>=20
> This code eliminates the 0x05 error codes across the other WMI calls.
> Unfortunately, I do not have an Omen system to complete the tests.
>=20
> zero_insize_support() seems ok for Omen platforms but don't know if
> it
> may cause errors on newer notebooks.=C2=A0 I will run the patch locally
> and
> will update the results.
> Bedant if it possible, can you apply the changes described earlier
> and
> let me know if it fixes Omen notebook issues?
>=20
>=20
> Regards,
>=20
> Jorge.
>=20
> On Tue, Jun 7, 2022 at 12:25 PM Hans de Goede <hdegoede@redhat.com>
> wrote:
> >=20
> > Hi,
> >=20
> > It looks like you accidentally dropped all the other folks on the
> > Cc,
> > please use reply-to-all. I've re-added those folks now.
> >=20
> > On 6/7/22 18:00, Jorge Lopez wrote:
> > > Hi Hans
> > >=20
> > >=20
> > > On Tue, Jun 7, 2022 at 8:35 AM Hans de Goede
> > > <hdegoede@redhat.com> wrote:
> > > >=20
> > > >=20
> > > > Hi Bedant,
> > > >=20
> > > > Adding Jorge from HP to the To: list.
> > > >=20
> > > > On 6/7/22 15:24, Bedant Patnaik wrote:
> > > > > 4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-
> > > > > wmi: Changing bios_args.data to be dynamically...")
> > > > > broke WMI queries on some devices where the ACPI method HWMC
> > > > > unconditionally attempts to create Fields beyond the buffer
> > > > > if the buffer is too small, this breaks essential features
> > > > > such as power profiles:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateByteField (Arg1,=
 0x10, D008)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateByteField (Arg1,=
 0x11, D009)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateByteField (Arg1,=
 0x12, D010)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateDWordField (Arg1=
, 0x10, D032)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateField (Arg1, 0x8=
0, 0x0400, D128)
> > > > > In cases where args->data had zero length, ACPI BIOS Error
> > > > > (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
> > > > > offset/length 128/8 exceeds size of target Buffer (128 bits)
> > > > > (20211217/dsopcode-198) was obtained.
> > > > > Fix: allocate at least 128 bytes for args->data
> > > > >=20
> > > > > be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-
> > > > > wmi: Fix 0x05 error code reported by several WMI calls")
> > > > > and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86:
> > > > > hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
> > > > > caused ACPI BIOS Error (bug): Attempt to CreateField of
> > > > > length zero (20211217/dsopcode-133) because of the ACPI
> > > > > method HWMC, which unconditionally creates a Field of size
> > > > > (insize*8) bits:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CreateField (Arg1, 0x80, (Local5 *=
 0x08), DAIN)
> > > > > In cases where args->insize =3D 0, the Field size is 0,
> > > > > resulting in an error.
> > > > > Fix: use zero insize only if 0x5 error code is returned
> > > > >=20
> > > > > Tested on Omen 15 AMD (2020) board ID: 8786.
> > > >=20
> > > > Thank you for looking into this. The alloc at least
> > > > 128 bytes part for args->data looks good and likely is a better
> > > > fix then the revert of 4b4967cbd2685f3 which Jorge has
> > > > submitted.
> > > >=20
> > > > I'm not 100% sure about the zero_insize_support() thingie
> > > > though.
> > > >=20
> > > > Looking at the original fix and then trying to get things
> > > > to work on all models with some requiring insize=3D=3D0 and
> > > > otheres requiring insize!=3D0 I guess this also makes sense...
> > > >=20
> > > > Jorge, any remarks on this patch?
> > > >=20
> > >=20
> > > The original code created an insize buffer size of 128 bytes
> > > regardless if the WMI call required a smaller buffer or not.=C2=A0
> > > This
> > > particular behavior occurs in older BIOS and reproduced in OMEN
> > > laptops.=C2=A0 Newer BIOS handles=C2=A0 buffer sizes properly and mee=
ts the
> > > latest specification requirements.=C2=A0 This is the reason why
> > > testing
> > > with a dynamically allocated buffer did not uncover any failures
> > > with
> > > the test systems at hand.
> > > One additional point was considered.=C2=A0 The purpose for introducin=
g
> > > dynamically allocated buffers was primarily to support WMI calls
> > > that
> > > required buffers size bigger than 128 bytes.=C2=A0 The decision=C2=A0=
 was
> > > made
> > > to separate those WMI calls to a separate driver and implement
> > > the new
> > > firmware-attribute framework.
> > >=20
> > > The current review request title is=C2=A0 "[PATCH] Revert
> > > "platform/x86:
> > > hp-wmi: Changing bios_args.data to be dynamically allocated"
> > >=20
> > > I am testing a cleaner solution to submit instead of=C2=A0 reverting
> > > the
> > > changes to hp_wmi_perform_query method.=C2=A0 The changes were made
> > > and
> > > tested on business notebooks without any issues.=C2=A0 I will submit =
a
> > > new
> > > patch as soon as I get the test results from a=C2=A0 community member
> > > who
> > > owns an Omen 15 system.
> >=20
> > Right, notice the RFC this thread is a reply to already contains
> > a cleaner version and has been tested on a HP Omen laptop already.
> >=20
> > The already tested cleaner fix from this RFC is:
> >=20
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -297,8 +299,8 @@=C2=A0 static int hp_wmi_perform_query(int query,
> > enum hp_wmi_command command,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON(mid < 0))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return mid;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bios_args_size =3D struct_size(ar=
gs, data, insize);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args =3D kmalloc(bios_args_size, =
GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bios_args_size =3D max(struct_siz=
e(args, data, insize),
> > struct_size(args, data, 128));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args =3D kzalloc(bios_args_size, =
GFP_KERNEL);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!args)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> >=20
> >=20
> > Which seems a better (more future proof) solution then your revert.
> >=20
> > Jorge, my main question from my previous email really is what you
> > make of the zero_if_sup() changes / part of this RFC. Which are
> > necessary because some older ACPI tables don't like it when
> > args->insize is set to 0, which it is after your:
> >=20
> > be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi:
> > Fix 0x05 error code reported by several WMI calls")
> > 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi:
> > Fix hp_wmi_read_int() reporting error (0x05)")
> >=20
> > commits. For details see the original commit msg from this RFC:
> > https://patchwork.kernel.org/project/platform-driver-x86/patch/20220607=
132428.7221-1-bedant.patnaik@gmail.com/
> >=20
> > Even if we go with the revert you submitted that only fixes
> > the passing buffers < 128 bytes issue and not this other issue.
> >=20
> > I had to take a good look at it, but after doing that I do believe
> > that the proposed zero_if_sup() changes make sense.
> >=20
> > Bedant, can you split your original RFC into 2 patches please,
> > one for each separate of the two (128 bytes buf-size,
> > resp. zero_if_sup()) fixes which you are doing ?
> >=20
> > Regards,
> >=20
> > Hans
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Jorge.
> > >=20
> > >=20
> > >=20
> > > > Regards,
> > > >=20
> > > > Hans
> > > >=20
> > > > >=20
> > > > > Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
> > > > > Cc: markgross@kernel.org
> > > > > Cc: platform-driver-x86@vger.kernel.org
> > > > >=20
> > > > > ---
> > > > > =C2=A0drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++++------=
-
> > > > > ----
> > > > > =C2=A01 file changed, 18 insertions(+), 11 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/hp-wmi.c
> > > > > b/drivers/platform/x86/hp-wmi.c
> > > > > index 667f94bba..3ef385f14 100644
> > > > > --- a/drivers/platform/x86/hp-wmi.c
> > > > > +++ b/drivers/platform/x86/hp-wmi.c
> > > > > @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-
> > > > > 3D44E2C707E4");
> > > > > =C2=A0#define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-
> > > > > ACCDC67EF61C"
> > > > > =C2=A0#define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-
> > > > > 3D44E2C707E4"
> > > > > =C2=A0#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > > > > +#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp))
> > > > > // use when zero insize is required
> > > > >=20
> > > > > =C2=A0/* DMI board names of devices that should use the omen
> > > > > specific path for
> > > > > =C2=A0 * thermal profiles.
> > > > > @@ -175,7 +176,7 @@ enum hp_thermal_profile_omen_v1 {
> > > > > =C2=A0enum hp_thermal_profile {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HP_THERMAL_PROFILE_PERFORMANCE=C2=
=A0 =3D 0x00,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HP_THERMAL_PROFILE_DEFAULT=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 0x01,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 HP_THERMAL_PROFILE_COOL=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D 0x02
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 HP_THERMAL_PROFILE_COOL=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D 0x02,
> > > > > =C2=A0};
> > > > >=20
> > > > > =C2=A0#define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) !=3D
> > > > > HPWMI_POWER_FW_OR_HW)
> > > > > @@ -220,6 +221,7 @@ static struct input_dev
> > > > > *hp_wmi_input_dev;
> > > > > =C2=A0static struct platform_device *hp_wmi_platform_dev;
> > > > > =C2=A0static struct platform_profile_handler
> > > > > platform_profile_handler;
> > > > > =C2=A0static bool platform_profile_support;
> > > > > +static bool zero_insize_support;
> > > > >=20
> > > > > =C2=A0static struct rfkill *wifi_rfkill;
> > > > > =C2=A0static struct rfkill *bluetooth_rfkill;
> > > > > @@ -297,8 +299,8 @@ static int hp_wmi_perform_query(int
> > > > > query, enum hp_wmi_command command,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON(mid < 0))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return mid;
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 bios_args_size =3D struct_size(args, da=
ta, insize);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 args =3D kmalloc(bios_args_size, GFP_KE=
RNEL);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 bios_args_size =3D max(struct_size(args=
, data, insize),
> > > > > struct_size(args, data, 128));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 args =3D kzalloc(bios_args_size, GFP_KE=
RNEL);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!args)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ENOMEM;
> > > > >=20
> > > > > @@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int val =3D 0, ret;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hp_wmi_perform_query(query=
, HPWMI_READ, &val,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, sizeof(val));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zero_if_sup(val),
> > > > > sizeof(val));
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EINVAL;
> > > > > @@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ENODEV;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hp_wmi_perform_query(HPWMI=
_SYSTEM_DEVICE_MODE,
> > > > > HPWMI_READ,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 system_device_mode, 0,
> > > > > sizeof(system_device_mode));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 system_device_mode,
> > > > > zero_if_sup(system_device_mode),
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(system_device_mode)=
);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ret;
> > > > >=20
> > > > > @@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int val =3D 0, ret;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D
> > > > > hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &val, 0, sizeof(val));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &val, zero_if_sup(val),
> > > > > sizeof(val));
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ret < 0 ? ret : -EINVAL;
> > > > > @@ -509,7 +512,7 @@ static int __init
> > > > > hp_wmi_bios_2008_later(void)
> > > > > =C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int state =3D 0;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D hp_wmi_perform_query(H=
PWMI_FEATURE_QUERY,
> > > > > HPWMI_READ, &state,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,=
 sizeof(state));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ze=
ro_if_sup(state),
> > > > > sizeof(state));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 1;
> > > > >=20
> > > > > @@ -520,7 +523,7 @@ static int __init
> > > > > hp_wmi_bios_2009_later(void)
> > > > > =C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 state[128];
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D hp_wmi_perform_query(H=
PWMI_FEATURE2_QUERY,
> > > > > HPWMI_READ, &state,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,=
 sizeof(state));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ze=
ro_if_sup(state),
> > > > > sizeof(state));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 1;
> > > > >=20
> > > > > @@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, i;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D hp_wmi_perform_query(HPWMI=
_WIRELESS2_QUERY,
> > > > > HPWMI_READ, &state,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, sizeof(state));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zero_if_sup(state),
> > > > > sizeof(state));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return err;
> > > > >=20
> > > > > @@ -1007,7 +1010,7 @@ static int __init
> > > > > hp_wmi_rfkill2_setup(struct platform_device *device)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, i;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D hp_wmi_perform_query(HPWMI=
_WIRELESS2_QUERY,
> > > > > HPWMI_READ, &state,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, sizeof(state));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zero_if_sup(state),
> > > > > sizeof(state));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return err < 0 ? err : -EINVAL;
> > > > >=20
> > > > > @@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
> > > > > =C2=A0{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int event_capable =3D wmi_has_guid=
(HPWMI_EVENT_GUID);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int bios_capable =3D wmi_has_guid(=
HPWMI_BIOS_GUID);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0 int err;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 int err, tmp =3D 0;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bios_capable && !event_capabl=
e)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ENODEV;
> > > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (hp_wmi_perform_query(HPWMI_HARDWARE=
_QUERY,
> > > > > HPWMI_READ, &tmp,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(tmp), sizeof(tmp)) =3D=3D
> > > > > HPWMI_RET_INVALID_PARAMETERS)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 zero_insize_support =3D true;
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (event_capable) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 err =3D hp_wmi_input_setup();
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (err)
> > > >=20
> > >=20
> >=20

