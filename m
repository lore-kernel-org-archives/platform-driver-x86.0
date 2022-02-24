Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D273C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 11:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiBXLBP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 06:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbiBXLBP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 06:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F2F727AA31
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645700444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HEbgdP8SBpti0ToL4OcogL8slIzWCB56e0s2/AEsTZc=;
        b=ZtAXAlM/uC6k2Bz5a2YZuLENxjkiLWhNhW7EFa+zBISvBYPi9r3mSdkCpiljt5Xwy0dbah
        FKffkYQW1OuK9dvSJUbCikTBelxeaTJqMBzN2t+ivIM/donaJFV/lro1+pIz4pydh1RFIy
        Uz/1KvX9ofgL6fGw8ECrmeCRYOKtkHo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-a4Ajm4N5Og6m0_HLgUtvQA-1; Thu, 24 Feb 2022 06:00:43 -0500
X-MC-Unique: a4Ajm4N5Og6m0_HLgUtvQA-1
Received: by mail-pj1-f72.google.com with SMTP id z4-20020a17090ad78400b001bc8d98be2aso1228706pju.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 03:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HEbgdP8SBpti0ToL4OcogL8slIzWCB56e0s2/AEsTZc=;
        b=nKLJZr83sTEF6ciWpVy3Juk+3DjKJGQT2evA15UaMl+KISDjy/qQBy+znpmDj65caj
         GD9+zn8fjieDhFrWtLU6eJi0S6Bhq0FtfiIYZ7Gm2k+pnFsRk/D+SxGjTIrpSgx0MUiH
         8q2s3H1sOUWLnmKlvfL13BtpTYgNeBO5p3WJjBdpDPKkpKpGdBqhKW5+ObFtAVm4KNlV
         ji6AmFTlLDq9g8vqCnVn/wVYidY064k2ioXhw+9WVuFd/1YZLYSv6ZHcR9pyM5Hgo3rI
         cFA+4HTVO6SRrZVnXdlTY3An2LqaOhyvs8ovl43YTpVJ+9WMsQayIiF8aF/wJPKOiKbg
         /X/g==
X-Gm-Message-State: AOAM530f9BCSMlZdqL4aBaFEjRTpFxFofRAJ/fL4uvXC9tqblqInhGXE
        i59BZ6tBzNav9kqfYFxb/C2JIvYeapOwZVqxKWatWlehc5NSNHMuAQ6AdvVXZO/JSGtOM+TTozz
        7AxfJjE69eU6wvtLHw4Zphhm5Ouh+031PRd0vfsNzfQtc7HXcGw==
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id bc8-20020a170902930800b0014edef5e6b5mr2148819plb.73.1645700442116;
        Thu, 24 Feb 2022 03:00:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHwR5/Vg2RxxvWQizleYnZyPym7fttsV2jTjC7MMKgE2RMS6YYIYzVfZw8WIAzfA6qY9F9FTtAW+OJKukHulc=
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id
 bc8-20020a170902930800b0014edef5e6b5mr2148799plb.73.1645700441819; Thu, 24
 Feb 2022 03:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20220224101848.7219-1-hdegoede@redhat.com> <CAO-hwJ+MAjqnBXOWruEoEduxMwoTkJtDFoBc9FRsmZoG+WZfiQ@mail.gmail.com>
 <a6968627-687c-9627-acdb-bc2ff4841b76@redhat.com>
In-Reply-To: <a6968627-687c-9627-acdb-bc2ff4841b76@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 24 Feb 2022 12:00:30 +0100
Message-ID: <CAO-hwJKaJPuqk_T4CMWjCqD1dWhMWQa2=ExCGiV9wFhVTg6tnw@mail.gmail.com>
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 24, 2022 at 11:57 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/24/22 11:55, Benjamin Tissoires wrote:
> > On Thu, Feb 24, 2022 at 11:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> The battery on the 2nd hand Surface 3 which I recently bought appears to
> >> not have a serial no programmed in. This results in any I2C reads from
> >> the registers containing the serial no failing with an I2C NACK.
> >>
> >> This was causing mshw0011_bix() to fail causing the battery readings to
> >> not work at all.
> >>
> >> Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
> >> continue with an empty serial no to fix this.
> >>
> >> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > LGTM, (and scratching this off my list):
>
> Ah, so I guess this was already a known issue also hit by others ?
>
> Do you have a buglink which I can add to the commit message ?

Oh, no, sorry. The email popped up, and instead of adding it at the
end of the TODO list, I spent a few minutes checking it and answering.
Sorry for the confusion.

The problem in itself is entirely new to me.

Cheers,
Benjamin

>
>
> > Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Thanks.
>
> Regards,
>
> Hans
>
>
> >> ---
> >>  drivers/platform/surface/surface3_power.c | 13 ++++++++++---
> >>  1 file changed, 10 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> >> index abac3eec565e..b283bc9bb5fd 100644
> >> --- a/drivers/platform/surface/surface3_power.c
> >> +++ b/drivers/platform/surface/surface3_power.c
> >> @@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
> >>         }
> >>         bix->last_full_charg_capacity = ret;
> >>
> >> -       /* get serial number */
> >> +       /*
> >> +        * get serial number, on some devices (with unofficial replacement
> >> +        * battery?) reading any of the serial no range addresses gets nacked
> >> +        * in this case just leave the serial no empty.
> >> +        */
> >>         ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
> >>                                             sizeof(buf), buf);
> >> -       if (ret != sizeof(buf)) {
> >> +       if (ret == -EREMOTEIO) {
> >> +               /* no serial number available */
> >> +       } else if (ret != sizeof(buf)) {
> >>                 dev_err(&client->dev, "Error reading serial no: %d\n", ret);
> >>                 return ret;
> >> +       } else {
> >> +               snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
> >>         }
> >> -       snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
> >>
> >>         /* get cycle count */
> >>         ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
> >> --
> >> 2.35.1
> >>
> >
>

