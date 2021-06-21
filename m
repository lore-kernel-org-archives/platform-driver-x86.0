Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DBEC4743C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 13:58:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF74161042
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 13:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFUOBH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhFUOBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 10:01:07 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6105CC061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 06:58:52 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so58023pji.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3A1VusKl6uX5GDoa6CBzjWStucuaSh9zBU2efKSA4M=;
        b=jmhGkTlQPswKDP1sWz/jSx4qs8MD2RTWzs0MPwAaMF6xGp20sZnTQyqkFi8eqpn1xO
         qyLmUK5Rpla9H7zx/vPmcvQAq/cwt9pUA19W8DN0TTlk45XLmmD4/DnRaAqTj0KEACYR
         HGMNj7SzN4ySGRWa7YVKj4nIXiFXCM5M70cys++iTTDSCMcu6rYm90ePOynGl9gyxZVD
         5CXTS3CfCmwzTYKcciB9Vj2WomIgKU/Mgva76Is5KQ81LOmzMKJDxz8XHkXwcpPl3+DU
         JYCAipj3uXCXnBCfGUtMM4NbWZggn6VQGQvK5Hrrd4yNSZMUrPyM34y4HG1ld7pH5R+r
         TlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3A1VusKl6uX5GDoa6CBzjWStucuaSh9zBU2efKSA4M=;
        b=DPnd/aFdKeLWZx48uUhRcF4oQLgcx6IQgCG143eksbxJXqnPmD/xbV+zZm761IUtsh
         31dRWcyan7aSnS0HxULybxsBZknHS0jnYXfgHv40uqWBIh2E7/JhOsbk0f7vRgtFeDhj
         e6aK2aL78OUNp5pjBgYxv5a64SarGHjngbhLEtvGmCERFle0RxffOElUcvYyhQe/PJPD
         9Xqya7t9d2XyZjPro6udENxuhRhdFYidcaYlNxeS8Ug5qDdxz5h3Leoew2cNoDhYVHNY
         RbgOeGiv+a72Lqo7dz04hIIHRemz0x/HaNEqEuMUrV/nxv2/zX3xWbL8JVp8ROm7FoBa
         CtQw==
X-Gm-Message-State: AOAM5336EAx6OfmWISd/xYkG4GjY4d0HZ3p7U9KoDg6LahmLKUcyBSFF
        eOpAtxMFDWSg3utdt8kAC9uZrMNM/m7Am2vaiNA=
X-Google-Smtp-Source: ABdhPJzaqN4ilINnJWZPW2RprNE4aqQ0lJojT5IMQKrOduUIehXVZa3fFT0+yAo9L0DNv1On6mYkUptZXDyfc9v5V6I=
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr27628788pjr.228.1624283931949;
 Mon, 21 Jun 2021 06:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621132354.57127-1-hdegoede@redhat.com>
In-Reply-To: <20210621132354.57127-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Jun 2021 16:58:15 +0300
Message-ID: <CAHp75Veh-t0KO4To8gbZej1bifJbrc3ppxnLzun0BcbsOBqZnA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: think-lmi: Return EINVAL when kbdlang gets
 set to a 0 length string
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 21, 2021 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
> start of the buffer") moved the lengt == 0 up to before stripping the '\n'

length

> which typically gets added when users echo a value to a sysfs-attribute
> from the shell.
>
> This avoids a potential buffer-underrun, but it also causes a behavioral
> change, prior to this change "echo > kbdlang", iow writing just a single
> '\n' would result in an EINVAL error, but after the change this gets
> accepted setting kbdlang to an empty string.

And why is it a problem?

I mean since we haven't yet released this in any of the kernels, the
ABIU can be adjusted one way or another.

> Re-add the length != 0 check after stripping the '\n' to reject this
> again, as before the change.

-- 
With Best Regards,
Andy Shevchenko
