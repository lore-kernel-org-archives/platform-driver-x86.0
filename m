Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9159FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 19:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiFHTbP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 15:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiFHTbO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 15:31:14 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D360A1E734A
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 12:31:13 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3137c877092so19786097b3.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ETpLC3cy51Fj5+hyz5IIgCxtJmcDgr2Kfn962MlmfOQ=;
        b=UA16HsDRORGXNGF3XVvUm5CTyMZ6qheiG7w9rptlVWi5bNCEk865lzbJ37W3tzdqTH
         vHKkgnRASJxVmBtIJj5UsZSjAnVDOaTdNjvw8qliVJV0tg51QYyFztraM9img8Eded35
         uKyrO1GBwxnzrV5dxl5pi9A52Ntl+KDulS9N1ChlbLL4D9WrPs8R8kXlH3I2QAJ5BGXp
         iDNgezc/Ij6zCX6cBZHDE7J6EliWKRWW0SDSlVe6iqUr/trD3S0ZDhaZXXXDTj1JenRs
         XpEIfzHWi3XvWdrl5hKgh1dIE82JglWjOxQgcGcXnrWOBd2l1YFyRkQjxrDafpksTPmS
         D7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ETpLC3cy51Fj5+hyz5IIgCxtJmcDgr2Kfn962MlmfOQ=;
        b=4Hp1Ul1vO+S62BYoK/H1Zd7TJTRfkAXrO/ir/2IBSLnWaHbJ9zzAQYP6Jag6+I1nCR
         2Gq4RLOEqMiaoRKaQgRg3FDU+VFeUaMb0Y7gqhX9kn9m0ymtX/Wjm6GO/24IncEy5SL9
         pGrZRB31jDhWorrXkORMyTYcwNawj+FLY8oY+6inOw18DQuHWDDg/rZC1TBNN9y7MlgJ
         hbbFzQYDnJwc3zv8jaOiJFz1sbjU08KfjXdIFaAZT5EnMy537jcK76vaPnbhMO1HxclV
         5HaB/GYCDfR3nEzW2GZEFMNztTnmSYCIZqubI9mpODhr4f4dRdm2P2/jTbvWc454BBcB
         O6Sw==
X-Gm-Message-State: AOAM531rH4kBvUXodAfNBWBFXgZl/N3jHdwNC5aaXYWpIcFU2waUf3vj
        M7jOJWtkREikhczdWw+LoXrO7tbD+szbWtE0Y/M=
X-Google-Smtp-Source: ABdhPJwhdsCMG9rL/GjiMTMklH3Kuwbnrhn2qTA98for/Hi1qALI/CuCzpg+27Cu/fqtB/oAEBp8Y5g15x11J9kqVkY=
X-Received: by 2002:a0d:d90e:0:b0:30c:bcae:ac17 with SMTP id
 b14-20020a0dd90e000000b0030cbcaeac17mr38394556ywe.446.1654716672951; Wed, 08
 Jun 2022 12:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-3-jorge.lopez2@hp.com>
 <CAHp75VdcnNkomj5125QRmo20LKX0CzCVo8R=qUsEHaNspviFYg@mail.gmail.com>
In-Reply-To: <CAHp75VdcnNkomj5125QRmo20LKX0CzCVo8R=qUsEHaNspviFYg@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 8 Jun 2022 14:31:02 -0500
Message-ID: <CAOOmCE9_vM45V5+QKWGQz+SzzC5BoYvxV2Vk5eYm3Krb9_LGog@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Organize declaration variables
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Will do. Thank you

On Wed, Jun 8, 2022 at 1:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 7:20 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> >
> > This patch organizes declaration variables in method
> > hp_wmi_perform_query as requested.
>
> Ah, I see now. Please squash these changes in one patch.
>
> --
> With Best Regards,
> Andy Shevchenko
