Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF03C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07DC32078B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAPT70 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 14:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbhAPT70 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 14:59:26 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D21C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:58:45 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id e9so2285698plh.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C1fN2jGqz5cyyHEwZItInp1LHgCvNEJv8EF5nIYD5Jc=;
        b=fGRSNetSJaZehv8G7oRM1TWs7dU43ov3TXPlqwHBqGVzi0oa84mJg4RVmcwjuOh4Cu
         sLvfw4Ih/ze8iI2mW+0/PTCG0Wx3WlSm3a9WbhCn3nmZCx8beEyaw0f3Io1qolLEtshI
         8w5ncr8lWw/8GVDdsDHM5crOhUOmOFS65KRgg3Z1i4+7qzPsgiyt6Agkll3zl36TEzYq
         MLV1K2aehP0mME9HQ9aNxD+NSOPHY7MnAWN9G+YwHrZBOLHo8L3tZ4YrVvk9KSOnKN1q
         9aiECU7vRn2gQ0fj3778XNR0FAGb1FzEw/FtJe/bBRlZZhYsDw06k1hR4QiwaoiCY2Ad
         fYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C1fN2jGqz5cyyHEwZItInp1LHgCvNEJv8EF5nIYD5Jc=;
        b=IFdIVUHbqZ6gZA6CTscjKZpakt8xrkwX85Q+8ybi/wLo+zjmIh5uXFkuKFwqVrRrER
         x2JbFQrPFmRHxNGhJy1CiRxu7mJa/jvstD654QCWs9f8fRJ9X0Fb6HWr47Qw5VFBWlUg
         1STW1AbA2235hoOlWmqnG4XAeLfeXDubg/Rf6h9xCOv5FjvXq8jDTfVhBOitxzYGCdzJ
         k2fPs82JjO4lQzfZMHGuCwudWfatS1tOfOF7Dl8bXTpYQO9tITtTiiBMNtUyiLmYxL1+
         bXTnL0EzdhGwvzac6+ldYjbhbbJ2NbPYetq8MgpJxzr7Wf6NfFenQO0pYB/107G+jPyt
         trLQ==
X-Gm-Message-State: AOAM531C77zRS4XjeGLyPGI4ijs+w2+oGYI++3s/Kmii6UtI4YHvbKnl
        GmvXJe2++NMiHWcfOO9h736WDziv9lHcMZJTTi4=
X-Google-Smtp-Source: ABdhPJzzwmcgWtpooxhwu9U8mLtXceTXLxq1B/VAYXctyyyLfFbCWHSbTiEYPgqe4KX1cbawsNY8vpP+622FU8RPLCg=
X-Received: by 2002:a17:90a:4d83:: with SMTP id m3mr17455353pjh.228.1610827125231;
 Sat, 16 Jan 2021 11:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-14-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-14-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 21:58:29 +0200
Message-ID: <CAHp75VdfTjwN_5CusbzFExPxm=--ePoS7+YrUVSWzP=OqkE6+g@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] platform/x86: ideapad-laptop: rework
 is_visible() logic
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Store the supported features in the driver private data, and modify the
> is_visible() callback to use it, and create ideapad_check_features() to
> populate it.

...

> +       struct {
> +               bool hw_rfkill_switch     : 1,

Does it make sense? Not to me.
Why not put all of them (I don't like comma and single occurrence of
the type, it may be problematic in the future) as unsigned int, or
something like that?
Also, is it okay to have bit fields (I mean from synchronization p.o.v.)?

> +                    fan_mode             : 1,
> +                    touchpad_ctrl_via_ec : 1,
> +                    conservation_mode    : 1,
> +                    fn_lock              : 1;
> +       } features;
>  };

--=20
With Best Regards,
Andy Shevchenko
