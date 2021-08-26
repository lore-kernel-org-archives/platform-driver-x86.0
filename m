Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4D1C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 13:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE15E608FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 13:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242620AbhHZNgf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 09:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242365AbhHZNge (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 09:36:34 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A95C061757
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 06:35:47 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 18so2774426pfh.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JWxSK3rJZPcK90pz+n7DII0TfHVc/yO72volx9irCM=;
        b=jVy+UpQP9Dg7tMaSO4Fjjw4vM4pLTurHifk982CvdEZSM5WFUyn6PmEDqqrJq39efi
         oymArMYa2yiaqXPOMW2+tXV0ZxjKv18k1Jn+29WyMuiRx49Fld3YG9vtm+eWpc7OuzB3
         CvNDlezKTM9T9mzBNnVUL9eN2WDpIqJTshYA8wnyv9D03bcZ0ClYwButVUE0Low3LHJo
         FuzJSGfM2ZcU4HazxpUfyhYxHqUR6YTz0Ttl83bTTRxkK8dIgObN0ugH61EFP+l1ZUgL
         c/pXRMa3YOqzDlYB6gz/TLbEcynpUnD7IDtVBtIp5oidzhj7ahgartq97dZdIew7TFW/
         SeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JWxSK3rJZPcK90pz+n7DII0TfHVc/yO72volx9irCM=;
        b=Zu6UHL2Xzd3TvzL4Aoko4oOLSs6/cKUqIln+V1TzpfXSfefJYemWlL5AlvGksGu0iu
         BwuL52+i7+37dVq/QNDo+mljnXg7DngNPWl6UO692Tva7cB8YaB9KhHTSaDFwy5eidbh
         KdilU511goOmQMBQw791g0RK0L0Ll8K/OrZzvvAYeW8rkkENhL5w9Zy/nqOKlt4/MuuA
         VdK5wWBr8pc3uBHYM5lKdKNoM0cLGbErVHLz/xZD+ybf6LAsAi0nGew/Qex/k3nS+Pjq
         YsJqiSybKjPm/mQBKg50AyAZJMnpM5E1r1dR8Am/hLu5cRXf0wj+MCPyPDDIpszzzo71
         uHMA==
X-Gm-Message-State: AOAM532hLQvbCfo4tb59tI5hEqLS7qU/bhQrxe3RUp/niQq5ciGa4pIR
        v6V78wT7P08/oMWeYebCc95E+cDOV50XNz+TsjY0H8ZJ5IM=
X-Google-Smtp-Source: ABdhPJzg3wAhwD6bOsJwE8FomlBEmiNPnb7+/3w2j07TMuBrUFv0hBS6CIEe4IwYV2mN53h6w3CFF5a28rK982YIpIY=
X-Received: by 2002:a62:8887:0:b0:3f1:c4c8:5f0d with SMTP id
 l129-20020a628887000000b003f1c4c85f0dmr3861709pfd.40.1629984946764; Thu, 26
 Aug 2021 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com> <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
 <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
In-Reply-To: <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 26 Aug 2021 16:35:07 +0300
Message-ID: <CAHp75Vc91V=HU22cih_p3vy3o_2nbyrqQb25_TP5a+YigFsfbQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com, pobrn@protonmail.org,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Aug 25, 2021 at 7:48 PM Daniel Dadap <ddadap@nvidia.com> wrote:
> On 8/25/21 4:05 AM, Andy Shevchenko wrote:
> > On Wed, Aug 25, 2021 at 1:09 AM Daniel Dadap <ddadap@nvidia.com> wrote:

...

> >> +struct wmaa_args {
> >> +       u32 set;
> >> +       u32 val;
> >> +       u32 ret;
> >> +       u32 ignored[3];
> >> +};
> > I guess this structure deserves a kernel doc.
>
> Do you have a recommended location? From a quick skim I didn't see any
> document in Documentation/ that seemed most appropriate to add this to.

It's in a form of the comment on top of the data structure

/**
 * struct wmaa_args ....
 * ...
 */

...

> >> +       WARN_ON(ret != 0);
> > Why?
>
> To differentiate a 0 because the level is actually 0 versus a 0 because
> there was an error. The backlight device API doesn't seem to have a way
> to report errors.

I meant why do you need WARN_ON() here? This kind of stuff must be justified.

--
With Best Regards,
Andy Shevchenko
