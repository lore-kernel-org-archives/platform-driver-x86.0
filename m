Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9063CCA47B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Jun 2022 15:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344299AbiFIPJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Jun 2022 11:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344246AbiFIPJ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 11:09:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D913F3B171B
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 08:09:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id d14so6064530eda.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XazGrsjYhIp+Q+5OjU7HgzFEjeWfHP2+JgE6hgQW/gQ=;
        b=ZQ2AJNL+BkXUWc8bXemykRZZ1BDcR9c6g7koPdvTcPLxm9XN5buziq9g2MECuh9mcr
         Ccin2S69j8bqTHzFzarfxMQN8yokblPC2J4x9yW/QuFPCfSy14FT/Njwx/85z92VF/TN
         RMtuMITMpVMgJaj+wBlltlO9r2M0vvrSfHBo+dHiBdH9Fdja92T51SdI3A2yrzjz5Bui
         LcDj3SsKpjLGwJ6qoMLPW7eS9TkgF2n964cDe+GI3BHRU5h+Is2VPWM5Kt4jr8FAXm6k
         8igf1USvh09CN3pLPUMlmKHXhholBC/K7PWCYRSHyJNIY/NxUEDj19fdLINFiS+u8FxX
         tb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XazGrsjYhIp+Q+5OjU7HgzFEjeWfHP2+JgE6hgQW/gQ=;
        b=A64G+kfRdeDOfsJ3GcVn1IzbYOdGUYnhwDoeTrXtdbMH3lzSnpRGmxyoBXQ+gNTcYD
         t8q8tkTOd3mDi8eH9HkeK/QWElkqrmZuEqkLln/T/xCnDnrs+jAP3oGO3vcBWIyoIJGI
         APiIoAdTuCXicjlAi59+GpLhgz2hT1p+Ulq+q824cornYiyyftnt/W9macz3g5/xwFZM
         x+USrhFeGpqELc4hIR+9GjqkALrWVMLp+H4wdQffDzhiZZ3CPGzurUEJlQTb++310+U/
         m/aPbJmYFiJ6UgkKtfG7kU2Rm9yIetA6oSMauJMuiU6+IJGAJtDDNoqgWaJE6JRXYPhj
         Dx4w==
X-Gm-Message-State: AOAM532/pWz5HOTCIZos2frVzxrxlWb7EkV53nTHHycWqn7sthMmJHdu
        WzUhdfLLsUucxVnVstcZ6Vslr59rN1ngFuh3aQs=
X-Google-Smtp-Source: ABdhPJw5LtPjDFIZTphYT9LTVWqirZvZ9N5RVgVUJZi8eeCQMA9reWFb4YH0ENeTcBfYElriC+YQ8oCH5XKWn/xeVDE=
X-Received: by 2002:aa7:d303:0:b0:42d:d192:4c41 with SMTP id
 p3-20020aa7d303000000b0042dd1924c41mr46385753edq.178.1654787389347; Thu, 09
 Jun 2022 08:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
 <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com> <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
 <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com> <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
 <ca2bb15600cd7d101153eb4ee4a62ef5d8f0df72.camel@gmail.com>
 <CAOOmCE8LO5ns8pf4fhXWrDiBwYUHsvEtmqcSfEiw5nsKYKhSNw@mail.gmail.com>
 <41be46743d21c78741232a47bbb5f1cdbcc3d21e.camel@gmail.com>
 <acafed286e86158cec3ad5f0ddf9e52b912db996.camel@gmail.com> <CAOOmCE-N+cZtv95yjtMgWcY_Nrth_9BLu5uzDJWBM9STR9QLyA@mail.gmail.com>
In-Reply-To: <CAOOmCE-N+cZtv95yjtMgWcY_Nrth_9BLu5uzDJWBM9STR9QLyA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jun 2022 17:09:12 +0200
Message-ID: <CAHp75Vc+9tXyEZMEUJcBxVrQfoGES5ykkJJvyfXGgH0e5rbsUQ@mail.gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Bedant Patnaik <bedant.patnaik@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jun 9, 2022 at 3:50 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> On Wed, Jun 8, 2022 at 2:42 PM Bedant Patnaik <bedant.patnaik@gmail.com> wrote:

> > I have sent the zero_if_supp() patch that can be applied over Jorge's buffer size patch in the mail that I'm replying to.
> > This *should* be enough as the final patch. Please let me know if anything needs to be rectified.
>
> The patch looks good to me.  It matches the one tested earlier.  Thank you

If you wish a bit of advance process, you may do the following:
1) squash your patches (as I mentioned in the other thread);
2) apply this patch on top;
3) send two patches as a v3 of your series.

Git should preserve authorship correctly.

-- 
With Best Regards,
Andy Shevchenko
