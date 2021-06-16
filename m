Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305C3C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C76F61057
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhFPRQA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhFPRP7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 13:15:59 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A6CC061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 10:13:53 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w22-20020a0568304116b02904060c6415c7so3263900ott.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huy802k3eHhNcFBpWBevRLcdbeGLBUEAma94cn8XjJo=;
        b=j0ieDbxuuvEQIS65y1VhtPaSERMdd3WT6tmSmcpuUHFoemaL9eH8O683T6LTDI0oY4
         K/eNNXBCzQ+/UB7oD5OZmIqdK5XTJ01hxMn/g5qnKlN18bm0cc4rRIebsdq7ryVdDIz7
         yPVo187FhMVDBYrJ8bf52Y9jTl22rDo+kKnRQphyA9hGp32pHVYVD0HHMRgOkfC5dUeN
         faGOvYsQ83rh5go45u5GpXa6fZa8NU7GItSrsZFs8LPBwC6Jq6F044myjthSVKJOp35r
         v8BgZeZSJepOftnAgWz3vm0nMXVqm41dYx9zaK8tQZukStusa30TbQvxJSi3Tk+wB1WY
         ayWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huy802k3eHhNcFBpWBevRLcdbeGLBUEAma94cn8XjJo=;
        b=k2Kok1udcu4+i6yrIyemPvoPOz6Xpvc0djhPxo3noL08+dSapvuLATBppyB/yh/7Yq
         L8ffBuWRrazRGacCqSWHQE/UpNfooco0aLwLBu8w9vTmeEZtDAbWgz1zVbsaxp0P5Snq
         iNWRGfnqlALBc7wQg2s84ogZdkaSiBgmtYVBuMQZkgKNB6U/10/ei76n3k6t+ba3Xkec
         XbV7m16TxPWhF1FmKiyKArdK24pgBDFvk2XjkO9t2Yipj/wyjnqGcSoiZP61+xbUsaaa
         TrBmpZeAf/B8FpJkevPujD+pBI8HQhsEoToXyjlgbshhsLpmrBR59dHniJqCvfMA9p7O
         /NSg==
X-Gm-Message-State: AOAM5319tlXUPRZCwx26oLcumhqE5Hl0HqaUtwz8en3GdR99uY6Sg9Wk
        qXIu/wYNfiDsD5IYYBWb22aWThMIDBg9QcTgAe4MjqB6at3/cg==
X-Google-Smtp-Source: ABdhPJwh6n0SJyrIDXFVC16qTTlqRnNuOg0g2vb4qtNd7AdmwBPMyC+r4VIOgZ3nGM/2TRMmzoBSbB2JNHtpSs9y/Js=
X-Received: by 2002:a9d:7682:: with SMTP id j2mr755703otl.299.1623863633048;
 Wed, 16 Jun 2021 10:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210615221931.18148-1-leo@60228.dev> <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
In-Reply-To: <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
From:   Jafar Akhondali <jafar.akhoondali@gmail.com>
Date:   Wed, 16 Jun 2021 21:43:42 +0430
Message-ID: <CAMW3L+0VZFvZ7WD=XoPBXdBTmr203AMWCgaxjrEjVf7Q49n9ow@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
Thanks for adding me.

Since the WMI GUID is used for gaming functions, which
controlling LED is one of them, I think it's also better to use
a generic name like "acer-gaming.c" instead of "acer-led.c".

I look forward to possible co-operations with Leo too.

On Wed, Jun 16, 2021 at 8:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 6/16/21 12:19 AM, leo60228 wrote:
> > The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.
> >
> > This driver allows them to be controlled from Linux.
> >
> > Signed-off-by: leo60228 <leo@60228.dev>
>
> We only accept contributions under real-names, so you need to
> use your real first + lastname here.
>
> Also the GUID you are using:
>
> #define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
>
> Is the same one as used by another recent patch for adding
> keyboard LED zones support for Acer laptops:
>
> https://lore.kernel.org/platform-driver-x86/CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com/
>
> I've added Jafar to the Cc here.
>
> So it looks like we have 2 people working on the same driver,
> please coordinate between the 2 of you to submit a single driver.
>
> FWIW I do believe that this submission, which adds this as a new
> driver for the new UUID, rather then adding extra code to acer-wmi.c
> is the better approach. Jafar's version does have the benefit of
> also adding support for some of the special effect modes, but
> there is still a discussion ongoing on how the userspace API should
> look for those, so starting with a clean driver like this, which does
> not support the effects might be best for now.
>
> <snip>
>
> I've not done anything close to a full review, but one thing stood
> out on a quick scan of the driver:
>
> > +static int __init acer_led_init(void)
> > +{
> > +     return wmi_driver_register(&acer_led_driver);
> > +}
> > +late_initcall(acer_led_init);
> > +
> > +static void __exit acer_led_exit(void)
> > +{
> > +     wmi_driver_unregister(&acer_led_driver);
> > +}
> > +module_exit(acer_led_exit);
>
> All these lines can be replaced by a single:
>
> module_wmi_driver(acer_led_driver);
>
> statement.
>
> Regards,
>
> Hans
>
