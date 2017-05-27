From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 23:49:22 +0300
Message-ID: <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <201705271517.30111@pali> <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
 <201705272248.13257@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36371 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750743AbdE0UtX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 16:49:23 -0400
In-Reply-To: <201705272248.13257@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 27, 2017 at 11:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
>> On Sat, May 27, 2017 at 4:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> wrote:

>> Okay, got it. But on your opinion does it make sense to do
>>
>> pr_info("\tobject_id: %2pE\n", g->object_id);
>>
>> instead?
>>
>> For ASCII it will go as is previously, otherwise escaping would be
>> done.
>
> Both is OK for me. Do you want to send a new patch with %2pE?

To me it looks slightly cleaner.

--=20
With Best Regards,
Andy Shevchenko
