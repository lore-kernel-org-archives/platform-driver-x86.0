From: Bhumika Goyal <bhumirks@gmail.com>
Subject: Re: [PATCH 10/15] platform/x86: wmi: make device_type const
Date: Thu, 31 Aug 2017 11:19:57 +0530
Message-ID: <CAOH+1jFrLhWb3KM9-O5-44m0tgZ3aKmr_BW0+zEtwcWJGD5OdA@mail.gmail.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
 <1503130946-2854-11-git-send-email-bhumirks@gmail.com> <CAHp75VfGrHiEO_J69UCxfTAbqwjE_AUzUCv3pvtz6Xjcx0i3Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:37141 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750781AbdHaFt6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 31 Aug 2017 01:49:58 -0400
In-Reply-To: <CAHp75VfGrHiEO_J69UCxfTAbqwjE_AUzUCv3pvtz6Xjcx0i3Pg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 31, 2017 at 12:53 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Aug 19, 2017 at 11:22 AM, Bhumika Goyal <bhumirks@gmail.com> wrote:
>> Make these const as they are only stored in the type field of a device
>> structure, which is const.
>> Done using Coccinelle.
>>
>
> Please, stop spamming so many people and MLs with no relation to the subsystem!
>

Sorry, for the inconvenience.

> Now, resend with reduced Cc (see headers) and don't forget to include
> Andy Lutomirski
>

Yes.

Thanks,
Bhumika

>
> --
> With Best Regards,
> Andy Shevchenko
