From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: panasonic-laptop: remove unused code
Date: Wed, 7 Jun 2017 17:41:52 +0300
Message-ID: <CAHp75VcXAst7cumYNRbkmpems66WWjyyPSYiu-vkXnHRDvQ2bw@mail.gmail.com>
References: <1496272668-25875-1-git-send-email-alex.hung@canonical.com> <20170601061110.qcbjhstxsysbncry@nataraja>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36704 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbdFGOly (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2017 10:41:54 -0400
Received: by mail-qk0-f195.google.com with SMTP id r62so1565026qkf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Jun 2017 07:41:53 -0700 (PDT)
In-Reply-To: <20170601061110.qcbjhstxsysbncry@nataraja>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harald Welte <laforge@gnumonks.org>
Cc: Alex Hung <alex.hung@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Thu, Jun 1, 2017 at 9:11 AM, Harald Welte <laforge@gnumonks.org> wrote:
> On Wed, May 31, 2017 at 04:17:48PM -0700, Alex Hung wrote:
>> The struct pcc_keyinput is not used in panasonic-laptop and in
>> anywhere in kernel, and it can be removed.
>>
>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>
> Acked-by: Harald Welte <laforge@gnumonks.org>

Pushed to testing, thanks!

> --
> - Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
> ============================================================================
> "Privacy in residential applications is a desirable marketing option."
>                                                   (ETSI EN 300 175-7 Ch. A6)



-- 
With Best Regards,
Andy Shevchenko
