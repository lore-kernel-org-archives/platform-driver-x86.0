From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/2] fujitsu-laptop: acpi_fujitsu_bl_notify() cleanup
Date: Mon, 13 Mar 2017 18:01:17 +0200
Message-ID: <CAHp75Vdfk7un7iS1OvQw-qDmv=LGWahTY9nr7hdHD1OV=RTH_g@mail.gmail.com>
References: <20170301064254.1311-1-kernel@kempniu.pl> <20170305225721.GF28473@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35173 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdCMQBT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 12:01:19 -0400
In-Reply-To: <20170305225721.GF28473@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 6, 2017 at 12:57 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> On Wed, Mar 01, 2017 at 07:42:52AM +0100, Micha?? K??pie?? wrote:
>> Here are two minor cleanups for acpi_fujitsu_bl_notify() that I came up
>> with while preparing the sparse keymap migration.
>>
>> Changes from v1:
>>
>>   - Rebase on top of reworked Alan Jenkins' cleanup patch series.
>>
>>   - Join integer variable declarations into a single line in patch 2/2.
>>
>>  drivers/platform/x86/fujitsu-laptop.c | 64 +++++++++++++++--------------------
>>  1 file changed, 28 insertions(+), 36 deletions(-)
>
> These two clean ups, as their descriptions indicate, improve the clarity of
> the driver code and permit some minor optimisations.  No regressions are
> evident when tested on S7020 hardware.  Please apply.
>
> Tested-by: Jonathan Woithe <jwoithe@just42.net>
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Pushed to testing, thanks!

-- 
With Best Regards,
Andy Shevchenko
