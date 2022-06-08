Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8974BC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 11:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbiFHLHY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 07:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236707AbiFHLHX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 07:07:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C93A195910
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 04:07:22 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b8so9895272edj.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7TKNFnuLQgNZmbfpsLPq04QgicTySb3NKPuhUkYYSk=;
        b=ptYojN9mmrqT12hgSCuKFa8CPH4dqnDGUg4QCKsHbKcJut8tiAbRrASOApcI0x07Me
         lmtthkNmKA3XevlojZA8MOHpi+OkWU1+8y80LYjj/CNtrVd3zXbvsna/dYeUm/mGZv/X
         ySNANvOuz7JB3qL7ecz3JSKH5XiJoa3fdGmu3MqMmoO6tWpHjCg67MWlrka9RwcxKgUG
         9C8iyBlIByvgoBaMsAK71rx8Tg6doDjfUiXywQMJK/FdEltDb4o4dEBtufTU793QverG
         CiT/BFjHsu0zOg1q4HKpFSvckqKpNI63IjUWPzuSerT1o1sWufBr2hzlE1gLuPce5SuN
         sPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7TKNFnuLQgNZmbfpsLPq04QgicTySb3NKPuhUkYYSk=;
        b=jYJrxSRzNyaG3mNQUNONq2UxfeFweFk+2FSbMWEegzJiECvBCmhEShx4Ue75AHp/CE
         CXoUT2K+qQ1vwv+xipGAiW5Mx+NJUtLwIgTIF7Hw8o56ttO/oqu9Q2mtXwPbF5exD+FG
         LvPTaeyjkAA/BhoeeB4+IyT2l4lqLBUZx5XYmF0pQ8iC2jF0Np0VhBybyVKr4pPz3C0W
         8LvAaAm1SlJJzRDHR1cSaTOJRGvCWqT3Ecx/LJlVBZirCsy3XetnwIn8aMO+rmqdfRzk
         9MFfwMNUVzjPshIKV+VTDg/eCEHyeQFs8NcRUlr9qCeKCe9q3X5NDxmso7Ikl5R13gzr
         FnfA==
X-Gm-Message-State: AOAM531Qsq52WiVrexD6Yj4bdwVt/hNtpj8UC7q8WSmuxPOYbL10JQ3/
        W9OBEQwnZ6YdJ1mRAwUdY1hFXea4A2CioHQZXTU=
X-Google-Smtp-Source: ABdhPJxXyvBqPl9Vi0cgwRyWthEQkDnR7+s1dluHegKQZmrcp67hCPH8+HfZ3WdJWpOh64tBzMVdEOo5cGrRAsIbfKw=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr39150350edq.178.1654686440989; Wed, 08
 Jun 2022 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220607204313.5374-1-jorge.lopez2@hp.com> <CAHp75VeB4vg_rHw4S_xWiUn=yhT8DyTjKt1=jOM41ceQA1JzVw@mail.gmail.com>
In-Reply-To: <CAHp75VeB4vg_rHw4S_xWiUn=yhT8DyTjKt1=jOM41ceQA1JzVw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 13:06:44 +0200
Message-ID: <CAHp75Vd7V6b7ujhfK0zQz=2Dmy2ff916uHH+KHeNwfu7Dcs=Jg@mail.gmail.com>
Subject: Re: [PATCH] Resolve WMI query failures on some devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 1:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 8, 2022 at 8:06 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote:

...

> I am in general fine with the change, only a nit-pick below.
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...and do not forget to include maintainers and other parties who
might be interested in this change. I can recommend to utilize my
"smart" [1] script for that.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko
