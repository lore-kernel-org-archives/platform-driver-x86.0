Return-Path: <SRS0=Q59L=DT=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E13C433E7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 14:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF2E20870
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Oct 2020 14:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVxIyWCn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgJLOe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Oct 2020 10:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgJLOe6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Oct 2020 10:34:58 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09C7C0613D0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2020 07:34:58 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q21so3226116pgi.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2020 07:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pU8op+aZFHU0HmvcRZrAn/iPq4oRm10+1moFcSn13OQ=;
        b=HVxIyWCnSG6OFN6uHHuZMv4pcQHb9tDCT0evHqkUPXUgNktRj8iKzNXXk7Kc23O1HS
         68haNLdOXXiMYqM2HmISaZZmsZmpb5x77hlcydmlT2shwHsJY/7PsIzCj+irRtUJsj1i
         xVI9vP3zZn1pbo43Kony8YM254ggAfRhXDvLK43CvyDKbhgLmDrHWlBwQtNNQzhQwuxM
         CeZtSYw+O9tlHBUrUwAMiJod90k81t77ETa3R9zLM9QrzBwjnc30buDq8k38xv066ScI
         /Mdqon8VBGlkxvm4fDzuxFahXDpKCAq0N42HPVSnkqjYYDSiMO+ORqedyJbUonulfRKJ
         cALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pU8op+aZFHU0HmvcRZrAn/iPq4oRm10+1moFcSn13OQ=;
        b=nMJkZuksTMWA9GMKgi6CQh1VKzyejFya1UjxI/Xeh7+kvMBDKPywFyAbaiuYnKMbUU
         OEg1fzxOWar/5pM0UwOcK/MmQ81eTGNZZzePh94IjkDHh8o+XjGBR/7gYdPfvrMZrmtk
         3Uc6aUtCHUaz63psmM6RZiu9FY4Z1GbhKecUyaEWMbsxeGx/Lp/f1nVw0sh99uh/yHaJ
         YexJ5+EhT/9Ugodx7QF9WsOau1YOh122rGDvzqJeB5EDyb7wFXHb4EHun7WCoOjtyOOF
         5l4o8ZO1c4kyZzDClWHpFMUT1IyG0q5XTpQltslg6MhzThFXDq0hDDhTNKVMkJ3Jubjo
         BqXQ==
X-Gm-Message-State: AOAM531TpLv7DsRREIQGFggaNY1Uijy8K104AWfYAuj54iOlb5o09Vlc
        Ny5nP0vxeaC7C4RVpOITF4bvCiyvNRtebidzdQU=
X-Google-Smtp-Source: ABdhPJxfsbIZOEXgc/WDmpp3ZdNWGc8rkDdgFcEG2XT/r3smtuVcsrLENcH3xmEe7SuR5bQeFxeZebyXQdSLMQaxgJo=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr20379310pjb.129.1602513298392;
 Mon, 12 Oct 2020 07:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <bug-196819-6418@https.bugzilla.kernel.org/> <bug-196819-6418-Ze8OWcGS0v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-196819-6418-Ze8OWcGS0v@https.bugzilla.kernel.org/>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 17:35:47 +0300
Message-ID: <CAHp75VcEkCGm=Vi==t1T6b0MYHyyk8yvVyJe3NZhFXX7h8NVvQ@mail.gmail.com>
Subject: Re: [Bug 196819] ASUS X SERIES X553MA-BING-SX451B does not boot anymore
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 12, 2020 at 5:32 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=196819
>
> Andy Shevchenko (andy.shevchenko@gmail.com) changed:
>
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>              Status|NEEDINFO                    |RESOLVED
>          Resolution|---                         |CODE_FIX
>
> --- Comment #5 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
> Closing now, thanks!

This bug is simply an example of one registered to Platform_x86 component.
Should PDx86 ask bugzilla admin to default the assignee to this
mailing list, for example?


-- 
With Best Regards,
Andy Shevchenko
