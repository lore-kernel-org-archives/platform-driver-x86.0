Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765CBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbiDKODD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346853AbiDKOCc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:02:32 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEE331372
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:00:16 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id x200so3925061ybe.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpxnhZcBxsbjxpzh0nDQb5QFg803+Nsugrw8GgXzo3Y=;
        b=in8BgyS/WQHHv7p539xP09o+9sagxNCCbiyqAwYREj/Q1v4k0NES0HMqTrEGtrmRjO
         Ehq0f16SU0O+xKEDH/nmnzg7xKb8/ek7pDnDl+4KdYzRQl/SBrJ2CaNMhEKndS5Rpy/b
         y8XAdFdr2MAfNi/vBDvjs3yVqENm89ZGYhq/MVAqWFlBJ10htxOKCFzf/Cy55irqlY6h
         xqx8vj6BQoraXs8CUe1PD0hvkc/CPiNxdfzY9tUqDD+MhgOQoRbPSTf2hDpPpMZfXpAV
         Qr26QwC6f00FD9kIwVn7HfFZnDdQ8ShDmaqB1+aAsuMNdlMQEzOiuFaqeL8OfkSD5/SU
         IQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpxnhZcBxsbjxpzh0nDQb5QFg803+Nsugrw8GgXzo3Y=;
        b=MEClNSSjewjbNCHA4FKWmDp0k1ufkcdnKBxG9gkj9i7MgBOefRSx31dNPPgEEn8tET
         HgiDBZXOJdySL7n2ohC0HSZaqyuUWQdfr8jkEK8QlQzyOQwzQegbzg3a/1MtENeX7iZZ
         UBUXyJHGup3d7KQwTsjsgmFj34s70CO8x0PTyMvZMkAL58yDtFFN639gwUNdRWO6rJRL
         YKi9NvKdZvrkJ7K6WxiIJUutFCNiwyRS8VIWYLdPMALzXpKtDE6iqZBzvD7YdZHto7kg
         ShtO9dsO8xfLm674PeLNE09sAm2u64DCi63uVXgu7lsTkYMAjlj0EHhWSS/a3DUhDBN0
         COWw==
X-Gm-Message-State: AOAM53306N5slkQfsKigxkteQ4BG/xLs/cuYBZswckQ70JiHJ343p2NE
        n+Je1zeF0q1n8SS5p+lKh9av0L7oukDd/LXjQer2w+RS
X-Google-Smtp-Source: ABdhPJy4C9WIKvmoJvvt7s+If7tW+vp+5tM5IcEL4lC4K7WusRzMyEHJ1wQw6/LEdUOtEvGSk7D3fWkgUGih9vqi/FM=
X-Received: by 2002:a5b:483:0:b0:634:dd7:9569 with SMTP id n3-20020a5b0483000000b006340dd79569mr22404297ybp.214.1649685615625;
 Mon, 11 Apr 2022 07:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220404203626.4311-1-jorge.lopez2@hp.com> <20220404203626.4311-2-jorge.lopez2@hp.com>
 <337981fc-3041-fd18-5d22-62584233e730@redhat.com>
In-Reply-To: <337981fc-3041-fd18-5d22-62584233e730@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 11 Apr 2022 09:00:04 -0500
Message-ID: <CAOOmCE_N99NnKFKts02e8NsdWmpyM6pts=FJaOPNGwst7S-0Rg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] Correct code style related issues in hp-wmi
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 11, 2022 at 7:47 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/4/22 22:36, Jorge Lopez wrote:
> > Update hp-wmi driver to address all code style issues reported
> > by checkpatch.pl script.
> >
> > All changes were validated on a HP ZBook Workstation,
> > HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
> >
> > Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
>
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>
> Regards,
>
> Hans
>
> p.s.
>
> Note I've decided to not merge the "Update hp_wmi_group to simplify
> feature addition" patch for now, since this may turn out to not
> be necessary when you change things to use the firmware-atrributes
> class.
>

Thank you.   I will reach out if I have questions about some of the
fields and possible backwards compatibility issues.
>
>
> > ---
> > Based on the latest platform-drivers-x86.git/for-next
> >
> > v1-0001-Update-hp_wmi_group-to-simplify-feature-addition patch was
> > broken in two separate patches.  This patch is patch 1 of 2
> > ---
> >  drivers/platform/x86/hp-wmi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > index 0e9a25b56e0e..667f94bba905 100644
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -605,6 +605,7 @@ static int hp_wmi_rfkill2_refresh(void)
> >       for (i = 0; i < rfkill2_count; i++) {
> >               int num = rfkill2[i].num;
> >               struct bios_rfkill2_device_state *devstate;
> > +
> >               devstate = &state.device[num];
> >
> >               if (num >= state.count ||
> > @@ -625,6 +626,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
> >                           char *buf)
> >  {
> >       int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "%d\n", value);
> > @@ -634,6 +636,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
> >                           char *buf)
> >  {
> >       int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "%d\n", value);
> > @@ -643,6 +646,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
> >                       char *buf)
> >  {
> >       int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "%d\n", value);
> > @@ -652,6 +656,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
> >                        char *buf)
> >  {
> >       int value = hp_wmi_get_dock_state();
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "%d\n", value);
> > @@ -661,6 +666,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
> >                          char *buf)
> >  {
> >       int value = hp_wmi_get_tablet_mode();
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "%d\n", value);
> > @@ -671,6 +677,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
> >  {
> >       /* Get the POST error code of previous boot failure. */
> >       int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
> > +
> >       if (value < 0)
> >               return value;
> >       return sprintf(buf, "0x%x\n", value);
> > @@ -1013,6 +1020,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> >               struct rfkill *rfkill;
> >               enum rfkill_type type;
> >               char *name;
> > +
> >               switch (state.device[i].radio_type) {
> >               case HPWMI_WIFI:
> >                       type = RFKILL_TYPE_WLAN;
>
