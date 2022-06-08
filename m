Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26BAC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiFHSp7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiFHSp6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:45:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5E713E2B
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:45:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h19so28342163edj.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zt1kCcynRpaqL9Yx6hLSOVY/NT8LSaNBUN0ocitNwUo=;
        b=OD8AvxxjH8SuAB032aL15mSmKKUPqF/SQ53OtAmOW5m4o8LAyIWu1JATE1X8y0ybxi
         7eyEqXHQ96ppYORWgZf7K5aznRP40heOkZsVhNpa6DRrjJJub7nQiUtCqrf1YpLUSrO6
         Gupxqyw9RE5yT6hiK+q4HW/4/+G2sQBX+AalJ8iBlOnv3NeWzj4KTQ4Ks36+a9O6rz3z
         deqH2Q3eWhbTXZJWsPtU5iD2bSqYUq2TGP15Fn9h9sZVXuBq7OxyN3/YAw3v4vGn3iLJ
         2wOBOJotEfv3Hl5MDkxJfdJX74c3u+BACrt7XA5jCkrEA3kTWuZEas+mIRV7J1HlL4Dd
         7KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zt1kCcynRpaqL9Yx6hLSOVY/NT8LSaNBUN0ocitNwUo=;
        b=AZnRhSRBmOVqT/oLLnWRJHjNJobmUkcsirNKjUpL6WWhbIrvSsXVHMSQzhLZ0YuFdg
         9IIVhH3OF8MYXPRnkQfCno50YzetvoLyZH/+vdkXebc+N2MQAz5ADVAPhAePpNMvwgmd
         6nIw0tOqAVIrTyTpsNhPrnzDP0DQ2crSC8v0Da8ZAGnZ4Dduh7EAnfViP1WI1Um2OTOF
         XWqXaRh0kQeqMpywdLZSqy8+TfOzI7R8BpSpbKCFL0BQTgU4chdxp0sX8E4Fy59NL40c
         NZcAB8G9LQP001k5XLJ09jOmKCx81dQLlMw+G952mU83yoca1chCXfxZg/lV1XHUq5YX
         aoYw==
X-Gm-Message-State: AOAM532LH7dk60WYK0oVcWwGHEubPeay4JJhnExOOrsnwEpeJbkT0WU+
        0J758rcb5B0vOa8ar1prvV8LiXzfRxzdQpCAatk=
X-Google-Smtp-Source: ABdhPJwlpp5xSCh1tM6WZUVYkAVzFCReje1LQuMqm/DiUgK0BYSAqoibqWJNR3Q87dBKDbWWFt6Vdl7WNNeEoHgAAeM=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr41013413edr.209.1654713954519; Wed, 08
 Jun 2022 11:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-3-jorge.lopez2@hp.com>
In-Reply-To: <20220608170220.5751-3-jorge.lopez2@hp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 20:45:18 +0200
Message-ID: <CAHp75VdcnNkomj5125QRmo20LKX0CzCVo8R=qUsEHaNspviFYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Organize declaration variables
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 7:20 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> This patch organizes declaration variables in method
> hp_wmi_perform_query as requested.

Ah, I see now. Please squash these changes in one patch.

-- 
With Best Regards,
Andy Shevchenko
