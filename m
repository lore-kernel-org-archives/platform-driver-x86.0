From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Mon, 13 Feb 2017 12:43:12 +0100
Message-ID: <20170213114312.GB1188@ozzy.nask.waw.pl>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain>
 <CAJ=jquadR0-H0hjhqPCzj2QS=uv_zGKj=H2XenRJNp_x+Hc44A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36019 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751483AbdBMLnQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 06:43:16 -0500
Received: by mail-lf0-f66.google.com with SMTP id h65so8181534lfi.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2017 03:43:15 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAJ=jquadR0-H0hjhqPCzj2QS=uv_zGKj=H2XenRJNp_x+Hc44A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> > Thanks Alex, I've queued this to testing and it will go to for-next unless the
> > CI, Pali, or a user reports a problem. Appreciate all your effort on this one.
> 
> Thanks for the review. I will send another patch to address all comments later.

Alex, I have only just now noticed one more really trivial issue: a
space is missing in each keymap entry before the first right curly
bracket:

> +/* 5 button array notification value. */
> +static const struct key_entry intel_array_keymap[] = {
> +       { KE_KEY,    0xC2, { KEY_LEFTMETA} },                /* Press */

{ KE_KEY,    0xC2, { KEY_LEFTMETA } },
                                 ^
etc.

> +       { KE_IGNORE, 0xC3, { KEY_LEFTMETA} },                /* Release */
> +       { KE_KEY,    0xC4, { KEY_VOLUMEUP} },                /* Press */
> +       { KE_IGNORE, 0xC5, { KEY_VOLUMEUP} },                /* Release */
> +       { KE_KEY,    0xC6, { KEY_VOLUMEDOWN} },              /* Press */
> +       { KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN} },              /* Release */
> +       { KE_SW,     0xC8, { .sw = {SW_ROTATE_LOCK, 1} } },   /* Press */
> +       { KE_SW,     0xC9, { .sw = {SW_ROTATE_LOCK, 0} } },   /* Release */

For these two lines, I would personally insert a space next to each of
the innermost curly brackets, like this:

{ KE_SW,     0xC9, { .sw = { SW_ROTATE_LOCK, 0 } } },

> +       { KE_KEY,    0xCE, { KEY_POWER} },                   /* Press */
> +       { KE_IGNORE, 0xCF, { KEY_POWER} },                   /* Release */
> +       { KE_END },
> +};

To avoid churn, perhaps the maintainers could do this for you while
moving this patch to for-next?  Or we can simply ignore this, as I said
this is just a minor annoyance.

-- 
Best regards,
Michał Kępień
