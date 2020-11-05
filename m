Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2AFC4741F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 16:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAF402080D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 16:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMgb9Ivv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgKEQoh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKEQoh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 11:44:37 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4625DC0613CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2020 08:44:37 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id w20so358565pjh.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2020 08:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oS5EUsfHgWoq6GLge54Nb6T5KTurCFqU+5Altbu2Iik=;
        b=QMgb9IvvhRgLl5GW/0eQOxZcCtFfxXHi8byjLjzkMLceQ/Slvy947PUPYpBpCoUBrY
         BzhmGKHadRkr1aVj51HPF8ql9yh64RmVVr4Se/T4dylhNXFbeIXO+OWIYTrlsC8cze1C
         rgLwVw0qsJkeTFis27ggvWqFTbWW5CsQAhB5A1frztJdh5xMl7y4Q4zv7Gtj2SK1rD4C
         X4/Ksyo+HkxaG19f8KWQHRPCO537e5m8pZov5HvqTaTaneQsUT3zUKVQI5CmnzD4r98S
         A0+Pie2KjBgWO4PhRIwRcpZaFdPQqRdeIzT32wO5BhGIBtyptezPDXeuL3ufvGS35FZT
         Yehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oS5EUsfHgWoq6GLge54Nb6T5KTurCFqU+5Altbu2Iik=;
        b=Uw8o9a86Z2zcUkGm7aUVpCHzCsEexSPW9+VoZXzafx31XqvkUZ+ec0uaZmXbm5laFj
         EIc2eSwZ8BlfC26yJd9Gmo3hW71BIJyinRT3KLlLP80VKUwUc31tkWLCnWnJ8nJJeuKG
         7zNFCiBaNyY/CTv/9j21c8VBP5FrMZXkvFtRqvuHdOgZecFGYXJHKsGwqH8CUgW5tMXx
         bOIvC5/Z95SasaFjrUw+OyMETyMyNB+ikDSImVSVfjDM7366B3xmSr9WQ6xm90aNwQz7
         iwo8jipU37Ff5d3rx11y2AYVKw+dwwmDwoYufm9f8cyJgOjNrvvtB/7Hc/yfKAb3PJRy
         N68w==
X-Gm-Message-State: AOAM530DUafZHdmzzLhk6e3XUER8fbUOAY9q0+P7EQD77kQnEihqst7D
        o3uGl3zK94F+PTDKfIXT4XWJzGtFd6tM6B7oBMA=
X-Google-Smtp-Source: ABdhPJxDeSduWAGFXkQHKw75nIOl8CMzLMnKQs622C3QR7kc4YDQzzinCyRqEFjWU9rfe0UywvPDkpEpR2knFXtGrVY=
X-Received: by 2002:a17:90b:3446:: with SMTP id lj6mr3377487pjb.228.1604594676826;
 Thu, 05 Nov 2020 08:44:36 -0800 (PST)
MIME-Version: 1.0
References: <2UUF9Q.RGK6EP27Y6W73@gmail.com>
In-Reply-To: <2UUF9Q.RGK6EP27Y6W73@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 18:45:25 +0200
Message-ID: <CAHp75VdKMsPuDOappFTqY6FqX+7zcQqrvdYMGSZZo1ZG6-cM+g@mail.gmail.com>
Subject: Re: Brightness hotkeys on HP laptop
To:     Gmail <rhysperry111@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: subsystem maintainers

On Mon, Apr 27, 2020 at 11:44 AM Gmail <rhysperry111@gmail.com> wrote:
>
> Hi, I am using a HP Pavillion 15-cx0598na.
>
> I am having trouble getting my brightness keys to be registered. It
> should also be noted that my wireless toggle key does not work either -
> I assume that is a seperate issue as it is handled by a different
> module.
>
> Nothing is detected through acpi_listen, xev or showkey. However, in
> the journal I get this error (same when pressing both keys):
> ```
> Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Unknown key
> pressed (translated set 2, code 0xab on isa0060/serio0).
> Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Use 'setkeycodes
> e02b <keycode>' to make it known.
> ```
> Here is a link to acpidump: https://termbin.com/2l2x
>
> I have already tried to contact the author of `hp_wmi` (the module for
> handling some hotkeys) but he could not solve the issue so suggested
> contacting this email.
>
> Yours Sincerely,
> Rhys Perry
>
>
>


-- 
With Best Regards,
Andy Shevchenko
