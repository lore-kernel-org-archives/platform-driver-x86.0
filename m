From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 16:33:14 +0300
Message-ID: <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75Vez0ZbBQ_uK1=Q7C3azwBQWerZiio0c2p4WEutXK1NhPg@mail.gmail.com> <201705271517.30111@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:33063 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756588AbdE0NdP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 09:33:15 -0400
In-Reply-To: <201705271517.30111@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 27, 2017 at 4:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Saturday 27 May 2017 15:07:09 Andy Shevchenko wrote:
>> On Sat, May 27, 2017 at 2:51 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> wrote:

>> > Remove
>> > also reserved member as it does not have any defined meaning or
>> > type yet.

>> > -       pr_info("\treserved: %02X\n", g->reserved);
>>
>> Do we need this? Commit message doesn't clarify.
>
> I wrote to commit message that reserved does not have defined meaning
> nor type. Also reserved overlap with object_id[1] so for non-event
> should not be print at all. And as it is reserved, I removed it.

Oh, indeed.

>> > +               pr_info("\tobject_id: %c%c\n", g->object_id[0],
>> > g->object_id[1]);
>>
>> If this can still contain non-printable characters the %*pE can help
>> instead.
>
> Those are printable ASCII. object_id contains two characters which are
> suffix for ACPI method.
>
> Problem was only for events when we tried to print notify_id as
> object_id. notify_id is binary and overlaps with object_id.

Okay, got it. But on your opinion does it make sense to do

pr_info("\tobject_id: %2pE\n", g->object_id);

instead?

For ASCII it will go as is previously, otherwise escaping would be done.

--=20
With Best Regards,
Andy Shevchenko
