Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E57C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jul 2022 16:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiGEQkO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Jul 2022 12:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbiGEQkL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 12:40:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC67D1CFE5
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 09:40:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z41so16053665ede.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Jul 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3+rlbyTOoNwQ/Ko9kU7HMBJWDAO4G26gh8EPsTC8+Ac=;
        b=CvJYEDjw33xcq9ffWI0Sh15l7ERobmRboSVWdG6w9CZXTAeudaN/kxmUbccG1863JG
         id2ETpVcfm3xuTTJoM7sw5Lr+vrEbFzbq4SAkfTxjME3FBLk4HsQDDvfjqNGShuqJtY2
         TRqdin+RuMoqbjxeMII8hxm3j+AdQWvNZczxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3+rlbyTOoNwQ/Ko9kU7HMBJWDAO4G26gh8EPsTC8+Ac=;
        b=AX2TvXQTyGv96qeGY/M153UFLJxJREf9S0xaF/PhZSIC7TII9sNnW1qKyjcrfEgQNO
         OhLv88awzUueMN2f36TZLsR4UfQ7NMHlVlgAp0X+NKdY9nmRGYW561fZERRgHfKfImIn
         uuviff0Wvswr9d9fx7UanhsUN/EIXjyCMxK++nGJY4PlriCiUkKajR/cjd8Z8PnBoay8
         Z9ATeh/EfbrDo1LZ0o1a6SLbAIwQo+BZ5GlEDu+wW/PiibjP+QSvApW1xv+Ps9e7cEqa
         MNPxs9ZK567hfFiITUouN+ygpx+3L7XqvIy4Y64ne+3pdfN+alxvbiUJbXnLu4QlF4nl
         SZWw==
X-Gm-Message-State: AJIora/Zz9PsWHBUmMrvoYMvp3GsdOZJhU1MYENvuInKVwtmIN0RsSl2
        Br1ZZxNWYfsQyN4thbCnxrNMcEcWGKi2MoK0LPc=
X-Google-Smtp-Source: AGRyM1tAhKBok+UvtrDNrZawnmMqqEUWqIKV9ZpWIM9bSXPrYrHHGYNLh8B5Ba5KAg4g7un34hLIDw==
X-Received: by 2002:aa7:d389:0:b0:43a:56c0:c863 with SMTP id x9-20020aa7d389000000b0043a56c0c863mr15534051edq.373.1657039209181;
        Tue, 05 Jul 2022 09:40:09 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id s11-20020aa7cb0b000000b00438ac12d6b9sm11920020edt.52.2022.07.05.09.40.08
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 09:40:08 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id j7so7388839wmp.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Jul 2022 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:600c:15d5:b0:3a1:7bf2:124a with SMTP id
 v21-20020a05600c15d500b003a17bf2124amr32099371wmf.38.1657039207726; Tue, 05
 Jul 2022 09:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <272584304.305738.1657029005216@office.mailbox.org>
In-Reply-To: <272584304.305738.1657029005216@office.mailbox.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 5 Jul 2022 09:39:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivGGgs9K_TfQYTW4RzH_C-JVfLZKNA5+hKQU0eNFBeiw@mail.gmail.com>
Message-ID: <CAHk-=wivGGgs9K_TfQYTW4RzH_C-JVfLZKNA5+hKQU0eNFBeiw@mail.gmail.com>
Subject: Re: [Regression?] Linux 5.19-rc5 gets stuck on boot, not rc4
To:     Tor Vic <torvic9@mailbox.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 5, 2022 at 6:50 AM <torvic9@mailbox.org> wrote:
>
> Linux 5.19-rc5 does not boot on my Kaby Lake Thinkpad.
> rc3 and rc4 were still fine, so I guess something between rc4 and rc5
> introduced a regression.

Sounds that way.

> Unfortunately, there are no errors or warning messages.
> It gets stuck quite early on boot, about the time USB is initialized,
> so less than 1 second into post-bootloader boot.
> It then just sits there doing nothing - SysRq still works though.

There aren't all that many changes in rc5, and your hardware looks
*very* standard (all intel chipset, and a Samsung SM961 SSD).

And with the lack of details, we'll either need a bisect:

> I don't have time for a bisect, but I thought I'll let you know about
> this issue, and maybe someone already has an idea.

or we'll need more reports..

> Some system information below. Root filesystem is f2fs.

Ok, f2fs is certainly unusual, but there are no f2fs changes in rc5.

There's some PM changes for i915 ("drm/i915/dgfx: Disable d3cold at
gfx root port") and a couple of thinkpad-acpi platform driver updates,
so I'm adding a few random people to the cc in case somebody goes
"ahh..."

But otherwise I think we'll just need more reports or info to even
start guessing.

              Linus
