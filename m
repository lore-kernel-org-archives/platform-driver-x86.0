Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3479C55178
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 16:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 985012071A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 16:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+CCUv/s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731602AbgKEQqW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731120AbgKEQqV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 11:46:21 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3A8C0613CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2020 08:46:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h4so361023pjk.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2020 08:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aZ4P//AiVvwrJK78ZuQFitFQblbi3+oDIp3K92pS53Q=;
        b=r+CCUv/s7oa3d2HpFE9PkVFfXXvos4faJBFeS7zVIeOjTb1ZRjdFfi78h2gE0trX/O
         OzrHtO5o53QC9DSFnO+z2gNl+p/CvuexHJYGh7qJnnqhazkiVR8/J2RUFc4ya8bWFT2w
         WgKNk0KrliGUxMAGM+ErhyNutUstKpyGvL2o6B/4BgpWIuWBRFMg3Uv+S3So2fYBnaw5
         vUehFu6/WapAfcwcjC4NTuNrcJ+DLgVi8UviLSW1RLxYLufpu3bmVGuuwhz3llD742cR
         PU8SeoZU0ymoIM8i+X3Zh3ZCLDsL4JvUNHQ6hXnk9Bhw6io4PxrgF7gkuV3tfsBU5u/Q
         ZuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aZ4P//AiVvwrJK78ZuQFitFQblbi3+oDIp3K92pS53Q=;
        b=D+YxNe9gMe1CmQHv1VMeSEs2y1ZWS+kK+HeEX3JkwZ0dHmq1Lv5sNhwvunSV0GElOr
         6mWfSv0AP8PUP2Eg0bqLMoW/cEJ2+apeEJ4lnZ7INyIqN8srE8kATBeqstGk3VpoZKal
         EZ5ub19m2eJ/6p6zheGh2A/aAOVwHhOkowBavj+RN/KbGyvCKp2CiHSImhi6XNmi52PN
         q3ucSlzZsqzWurW6qc8Ni5mb0NeezU55sVRdfHrB+6Tqh9i01dNowqONpW9fOJR8r9S+
         M0Ijyc63TXICMc99OQhiVyQeJDfBib3g3f9ui+hHXHd7ar2KxQIAZZsdAfJ47UGWi7X9
         0ExQ==
X-Gm-Message-State: AOAM533/iGAwlElgijT9LNNY8DX5pcEeeCNg4nFSt71BQjzDcKI+aUaa
        utr5czQiNgX9kT8qBAnWAcOXUG82SXfHQACWMN1z7h4hVjM=
X-Google-Smtp-Source: ABdhPJyn3yk4EEHncF+w9l9W1ZRvAtQa64T90sQul80IHRa7fFqulCk2lD4Ajt7VtPmG6HPVGV4cGJgQeCX59CIGQoE=
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr3192182pjb.181.1604594780446;
 Thu, 05 Nov 2020 08:46:20 -0800 (PST)
MIME-Version: 1.0
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
In-Reply-To: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 18:47:09 +0200
Message-ID: <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same scancode
To:     thestroyer@cock.li
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: subsystem maintainers

On Sun, May 17, 2020 at 2:24 PM <thestroyer@cock.li> wrote:
>
> Hi,
> On my HP Zbook studio G5 a few keys on my keyboard give the same
> scancodes. Most notably, the brightness and mute function keys all give
> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
> --scancodes. It only produces a scancode when pressed, not when
> released. I found another very similar issue in this mailing list found
> in https://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
> issue in that mail was solved by a bios update. I'm running the latest
> bios, but I still have the issue.
> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
> 5.4.39-1
> I also tried a few other distributions, but they all have the same
> issue.
> I'm happy to provide more information about this issue if needed.
>
> Thanks,
>
> Friso



-- 
With Best Regards,
Andy Shevchenko
