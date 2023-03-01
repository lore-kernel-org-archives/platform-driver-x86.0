Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941EAC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 10:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjCAKfH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 05:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjCAKfD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:35:03 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0110B3B0FF
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:34:49 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id op8so8866260qvb.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AFMZXsY9wMGXXCS0euDUm+sjisyp5PYYxh+uCzSNR8=;
        b=djr3VWVuAxEvUrVqDOi+/z80ccu9V+iL88WMZlJB2oPc54WZwJn51qGUyPh2yhvPkL
         hvztqny3gewxPcRxZLd1kjptO/rC1Pxqegn+tme2TEX0IG1hqa/X0LynKo8UzSleGf/1
         3OXidjQ9bv5YMw9EGRDhufY3LAJ57p/qwqUT16FgCOc93SMfniOvxM75mNbF4tW67qGu
         VFG6NiReo+fjB8GbbLYxzbdrVLfXaFh3ko2yvhlXVL5+8jAxboACi75fwQWf6O5GY27P
         1Glwxs4fJC+Q/JI8EiaZcMTm6e3a57W2bHF7EvyeehzKp/8/DJPz7esF1JDnh7xguyVm
         Q2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AFMZXsY9wMGXXCS0euDUm+sjisyp5PYYxh+uCzSNR8=;
        b=pFvIonhk8lG5xFsffpNm4w8WCaF75q9IiX9gI/TL1dz/5ztxaFVx/OJljt5WcxtChD
         s2SBNUx4ZGRFZdSVojnDi1+NDD4hkerFMXezeF8SX4fFk18tXppaijv28w3xsbD9Do2/
         PwQM1qNcbSwc9mnhcRo5NMszEPTJBapyeSAd1r2qeYFstAiXlDdt6DYCWvvdfEPQcLJu
         obdsDBxWq/D8IS1TmSBYuJE2lCrnfNA7U7C98kV3nGAgP4MXSCXGDI/W0YhBBJhNMVvo
         Deksz/ceU0l3FFGxbGHGLe3k+Ht8OQgymnOftoOiU32izWX1rZIJ/Wt/iiHoNfKLtiwj
         AvCA==
X-Gm-Message-State: AO0yUKWyCujnC7cBB+oSQYPQGrlcsExx9IwTpZzLBV5IXRSk7SHcz6aT
        8lbpoINuRFGDtBoD2fKkof9TdNYIGmpFnqMTSzWia9T0ka9qJw==
X-Google-Smtp-Source: AK7set+Ul4B+qXY4V/7yxhTCzXiHG3vr9QGsixUAqEuX4hETltAIYyrd37rnWmqfLmgV24xmqtgE7Rh5nVZHt7rFYUE=
X-Received: by 2002:a05:6214:3903:b0:56f:378:951 with SMTP id
 nh3-20020a056214390300b0056f03780951mr2175622qvb.1.1677666889049; Wed, 01 Mar
 2023 02:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-7-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-7-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:34:13 +0200
Message-ID: <CAHp75VfGs65=CC++PAdJ88YqXbMxf+PFormuwq-N5govkPAmjw@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] platform/x86: x86-android-tablets: Move Asus
 tablets to their own file
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 11:23=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Move the info for the Asus tablets to their own asus.c file.

...

> +static int __init asus_me176c_tf103c_init(void)
> +{
> +       struct gpio_desc *gpiod;
> +       int ret;
> +
> +       ret =3D x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
> +       if (ret < 0)
> +               return ret;
> +       asus_me176c_tf103c_lid.gpio =3D desc_to_gpio(gpiod);

> +

I would expect this blank line to be after return ret;, but it's not a big =
deal.

> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko
