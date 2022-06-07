Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205FEC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 19:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352678AbiFGTcO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 15:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355732AbiFGTam (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 15:30:42 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEBF1A4481
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 11:12:02 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id p13so32470789ybm.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsbEm+zr69uZvX+jkHIXNNq9iObyIOQ2PPoqyu/Xk8o=;
        b=fuwSJ2DnxgOnr/+gOK4GY4SZg/GgOHgpm6qczrvyATPQXMB4kCpY4EExfq7keaEEE0
         3bFMhb7hvT6TxhpWy2/fm2MXknyhQwtnNWwOWy1mN++Y3F+Fz6jsOczianmRT3pQ1vdN
         q9nIS1vhTCEA1Nk9fuHDNESU1SOvWvGKoZzWbggevxH9YUQUbXMXibig0llNp0h96CvH
         Fq2Qec6bEdX/dPBvbX6pKsSNwsIdmOTqf4CfPoZurOBnXw1BmvWePrEYIgVSeKrE2SQ3
         yz6kn5VYrdVK3qpWvAhhFJN5cXFp8iXBVpub3RD/qlhXS1YOTw3Nf6XqO/qR4zw0W3Nz
         iabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsbEm+zr69uZvX+jkHIXNNq9iObyIOQ2PPoqyu/Xk8o=;
        b=ugE3mcS6hJOQg0/Caeaix+AjyK+bU2mEmI5oVUMN+PF9hkZT0mL/NhCErVirGq7OUc
         InHE8CNH8w+33L0v58kDxujASea5fcE8r22Nr4RIdrTyquYaLGpN/sKzHYB1rStXQWCs
         8MK82E86keqB41bila8ymhuqUCIzMRFnQS6p2s32xn6iV6sfz3NGTaQ5gR0e3bJ9cxYV
         cg34oiM804gfWN7mwgqe/cu5tJoHJPz3m5uwzbXxxKCC+HhDYPwK0jkejDfM5ejYR08Z
         QE3RsmKj/IcfiKhK55HbAqOikbuP8mmiqeEapCJneEtRn2on+P69hCYPQCKkvoH7hH8h
         b58A==
X-Gm-Message-State: AOAM531c6XD4TsIVji/zeCCqdUpZEqrlffxuR8rUCkgjIry6Q8stc1en
        UVc9lWhF1AiOSP0K2bYJufcwlqmufqVlTMnStZo=
X-Google-Smtp-Source: ABdhPJyrDvkw8k0vsOEhmOLV/9lQ5PD4xPJ9Kz3ouHLNX+XZ4oEd1yebsu+RcOjeXz9xE2+OFiu92PKmokBDe2Z1q7o=
X-Received: by 2002:a25:ac56:0:b0:663:dbe6:b784 with SMTP id
 r22-20020a25ac56000000b00663dbe6b784mr4982521ybd.546.1654625518673; Tue, 07
 Jun 2022 11:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
 <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com> <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
 <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
In-Reply-To: <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 7 Jun 2022 13:11:47 -0500
Message-ID: <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bedant Patnaik <bedant.patnaik@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dropped other participants by accident.  Please see my comments below.

The original code created an insize buffer size of 128 bytes
regardless if the WMI call required a smaller buffer or not.  This
particular behavior occurs in older BIOS and reproduced in OMEN
laptops.  Newer BIOS handles  buffer sizes properly and meets the
latest specification requirements.  This is the reason why testing
with a dynamically allocated buffer did not uncover any failures with
the test systems at hand.
One additional point was considered.  The purpose for introducing
dynamically allocated buffers was primarily to support WMI calls that
required buffers size bigger than 128 bytes.  The decision  was made
to separate those WMI calls to a separate driver and implement the new
firmware-attribute framework.

The current review request title is  "[PATCH] Revert "platform/x86:
hp-wmi: Changing bios_args.data to be dynamically allocated"

I am testing a cleaner solution to submit instead of  reverting the
changes to hp_wmi_perform_query method.  The changes were made and
tested on business notebooks without any issues.  I will submit a new
patch as soon as I get the test results from a  community member who
owns an Omen 15 system.

The proposed patch which I am pending test results, it is as follows

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..7bcfa07cc6ab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum
hp_wmi_command command,
  struct bios_args *args = NULL;
  int mid, actual_outsize, ret;
  size_t bios_args_size;
+ int actual_insize;

  mid = encode_outsize_for_pvsz(outsize);
  if (WARN_ON(mid < 0))
  return mid;

- bios_args_size = struct_size(args, data, insize);
+ actual_insize = max(insize, 128);
+ bios_args_size = struct_size(args, data, actual_insize);
  args = kmalloc(bios_args_size, GFP_KERNEL);
  if (!args)
  return -ENOMEM;
-----

This code eliminates the 0x05 error codes across the other WMI calls.
Unfortunately, I do not have an Omen system to complete the tests.

zero_insize_support() seems ok for Omen platforms but don't know if it
may cause errors on newer notebooks.  I will run the patch locally and
will update the results.
Bedant if it possible, can you apply the changes described earlier and
let me know if it fixes Omen notebook issues?


Regards,

Jorge.

On Tue, Jun 7, 2022 at 12:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> It looks like you accidentally dropped all the other folks on the Cc,
> please use reply-to-all. I've re-added those folks now.
>
> On 6/7/22 18:00, Jorge Lopez wrote:
> > Hi Hans
> >
> >
> > On Tue, Jun 7, 2022 at 8:35 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >>
> >> Hi Bedant,
> >>
> >> Adding Jorge from HP to the To: list.
> >>
> >> On 6/7/22 15:24, Bedant Patnaik wrote:
> >>> 4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically...")
> >>> broke WMI queries on some devices where the ACPI method HWMC unconditionally attempts to create Fields beyond the buffer
> >>> if the buffer is too small, this breaks essential features such as power profiles:
> >>>         CreateByteField (Arg1, 0x10, D008)
> >>>         CreateByteField (Arg1, 0x11, D009)
> >>>         CreateByteField (Arg1, 0x12, D010)
> >>>         CreateDWordField (Arg1, 0x10, D032)
> >>>         CreateField (Arg1, 0x80, 0x0400, D128)
> >>> In cases where args->data had zero length, ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
> >>> offset/length 128/8 exceeds size of target Buffer (128 bits) (20211217/dsopcode-198) was obtained.
> >>> Fix: allocate at least 128 bytes for args->data
> >>>
> >>> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
> >>> and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
> >>> caused ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
> >>> method HWMC, which unconditionally creates a Field of size (insize*8) bits:
> >>>       CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
> >>> In cases where args->insize = 0, the Field size is 0, resulting in an error.
> >>> Fix: use zero insize only if 0x5 error code is returned
> >>>
> >>> Tested on Omen 15 AMD (2020) board ID: 8786.
> >>
> >> Thank you for looking into this. The alloc at least
> >> 128 bytes part for args->data looks good and likely is a better
> >> fix then the revert of 4b4967cbd2685f3 which Jorge has submitted.
> >>
> >> I'm not 100% sure about the zero_insize_support() thingie though.
> >>
> >> Looking at the original fix and then trying to get things
> >> to work on all models with some requiring insize==0 and
> >> otheres requiring insize!=0 I guess this also makes sense...
> >>
> >> Jorge, any remarks on this patch?
> >>
> >
> > The original code created an insize buffer size of 128 bytes
> > regardless if the WMI call required a smaller buffer or not.  This
> > particular behavior occurs in older BIOS and reproduced in OMEN
> > laptops.  Newer BIOS handles  buffer sizes properly and meets the
> > latest specification requirements.  This is the reason why testing
> > with a dynamically allocated buffer did not uncover any failures with
> > the test systems at hand.
> > One additional point was considered.  The purpose for introducing
> > dynamically allocated buffers was primarily to support WMI calls that
> > required buffers size bigger than 128 bytes.  The decision  was made
> > to separate those WMI calls to a separate driver and implement the new
> > firmware-attribute framework.
> >
> > The current review request title is  "[PATCH] Revert "platform/x86:
> > hp-wmi: Changing bios_args.data to be dynamically allocated"
> >
> > I am testing a cleaner solution to submit instead of  reverting the
> > changes to hp_wmi_perform_query method.  The changes were made and
> > tested on business notebooks without any issues.  I will submit a new
> > patch as soon as I get the test results from a  community member who
> > owns an Omen 15 system.
>
> Right, notice the RFC this thread is a reply to already contains
> a cleaner version and has been tested on a HP Omen laptop already.
>
> The already tested cleaner fix from this RFC is:
>
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -297,8 +299,8 @@  static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>         if (WARN_ON(mid < 0))
>                 return mid;
>
> -       bios_args_size = struct_size(args, data, insize);
> -       args = kmalloc(bios_args_size, GFP_KERNEL);
> +       bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
> +       args = kzalloc(bios_args_size, GFP_KERNEL);
>         if (!args)
>                 return -ENOMEM;
>
>
> Which seems a better (more future proof) solution then your revert.
>
> Jorge, my main question from my previous email really is what you
> make of the zero_if_sup() changes / part of this RFC. Which are
> necessary because some older ACPI tables don't like it when
> args->insize is set to 0, which it is after your:
>
> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
> 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
>
> commits. For details see the original commit msg from this RFC:
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20220607132428.7221-1-bedant.patnaik@gmail.com/
>
> Even if we go with the revert you submitted that only fixes
> the passing buffers < 128 bytes issue and not this other issue.
>
> I had to take a good look at it, but after doing that I do believe
> that the proposed zero_if_sup() changes make sense.
>
> Bedant, can you split your original RFC into 2 patches please,
> one for each separate of the two (128 bytes buf-size,
> resp. zero_if_sup()) fixes which you are doing ?
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
> >
> > Regards,
> >
> > Jorge.
> >
> >
> >
> >> Regards,
> >>
> >> Hans
> >>
> >>>
> >>> Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
> >>> Cc: markgross@kernel.org
> >>> Cc: platform-driver-x86@vger.kernel.org
> >>>
> >>> ---
> >>>  drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++++-----------
> >>>  1 file changed, 18 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> >>> index 667f94bba..3ef385f14 100644
> >>> --- a/drivers/platform/x86/hp-wmi.c
> >>> +++ b/drivers/platform/x86/hp-wmi.c
> >>> @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
> >>>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> >>>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> >>>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> >>> +#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> >>>
> >>>  /* DMI board names of devices that should use the omen specific path for
> >>>   * thermal profiles.
> >>> @@ -175,7 +176,7 @@ enum hp_thermal_profile_omen_v1 {
> >>>  enum hp_thermal_profile {
> >>>       HP_THERMAL_PROFILE_PERFORMANCE  = 0x00,
> >>>       HP_THERMAL_PROFILE_DEFAULT              = 0x01,
> >>> -     HP_THERMAL_PROFILE_COOL                 = 0x02
> >>> +     HP_THERMAL_PROFILE_COOL                 = 0x02,
> >>>  };
> >>>
> >>>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> >>> @@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
> >>>  static struct platform_device *hp_wmi_platform_dev;
> >>>  static struct platform_profile_handler platform_profile_handler;
> >>>  static bool platform_profile_support;
> >>> +static bool zero_insize_support;
> >>>
> >>>  static struct rfkill *wifi_rfkill;
> >>>  static struct rfkill *bluetooth_rfkill;
> >>> @@ -297,8 +299,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> >>>       if (WARN_ON(mid < 0))
> >>>               return mid;
> >>>
> >>> -     bios_args_size = struct_size(args, data, insize);
> >>> -     args = kmalloc(bios_args_size, GFP_KERNEL);
> >>> +     bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
> >>> +     args = kzalloc(bios_args_size, GFP_KERNEL);
> >>>       if (!args)
> >>>               return -ENOMEM;
> >>>
> >>> @@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
> >>>       int val = 0, ret;
> >>>
> >>>       ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> >>> -                                0, sizeof(val));
> >>> +                                zero_if_sup(val), sizeof(val));
> >>>
> >>>       if (ret)
> >>>               return ret < 0 ? ret : -EINVAL;
> >>> @@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
> >>>               return -ENODEV;
> >>>
> >>>       ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> >>> -                                system_device_mode, 0, sizeof(system_device_mode));
> >>> +                                system_device_mode, zero_if_sup(system_device_mode),
> >>> +                                sizeof(system_device_mode));
> >>>       if (ret < 0)
> >>>               return ret;
> >>>
> >>> @@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
> >>>       int val = 0, ret;
> >>>
> >>>       ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> >>> -                                &val, 0, sizeof(val));
> >>> +                                &val, zero_if_sup(val), sizeof(val));
> >>>
> >>>       if (ret)
> >>>               return ret < 0 ? ret : -EINVAL;
> >>> @@ -509,7 +512,7 @@ static int __init hp_wmi_bios_2008_later(void)
> >>>  {
> >>>       int state = 0;
> >>>       int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> >>> -                                    0, sizeof(state));
> >>> +                                    zero_if_sup(state), sizeof(state));
> >>>       if (!ret)
> >>>               return 1;
> >>>
> >>> @@ -520,7 +523,7 @@ static int __init hp_wmi_bios_2009_later(void)
> >>>  {
> >>>       u8 state[128];
> >>>       int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> >>> -                                    0, sizeof(state));
> >>> +                                    zero_if_sup(state), sizeof(state));
> >>>       if (!ret)
> >>>               return 1;
> >>>
> >>> @@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
> >>>       int err, i;
> >>>
> >>>       err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> >>> -                                0, sizeof(state));
> >>> +                                zero_if_sup(state), sizeof(state));
> >>>       if (err)
> >>>               return err;
> >>>
> >>> @@ -1007,7 +1010,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> >>>       int err, i;
> >>>
> >>>       err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> >>> -                                0, sizeof(state));
> >>> +                                zero_if_sup(state), sizeof(state));
> >>>       if (err)
> >>>               return err < 0 ? err : -EINVAL;
> >>>
> >>> @@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
> >>>  {
> >>>       int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
> >>>       int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
> >>> -     int err;
> >>> +     int err, tmp = 0;
> >>>
> >>>       if (!bios_capable && !event_capable)
> >>>               return -ENODEV;
> >>>
> >>> +     if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
> >>> +                              sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
> >>> +             zero_insize_support = true;
> >>> +
> >>>       if (event_capable) {
> >>>               err = hp_wmi_input_setup();
> >>>               if (err)
> >>
> >
>
