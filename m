From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: PROBLEM: NULL pointer dereference in dell_set_arguments() in 4.15
Date: Sun, 4 Feb 2018 16:25:47 +0200
Message-ID: <CAHp75VeBoqp2ohQ7+o9oD1Wv5p6qFjFMwJCF_oiOMx5wpQ2Bjg@mail.gmail.com>
References: <20180203162021.GA4571@localhost.localdomain> <e489f5ee-34e5-4777-afe7-38d31d2ad3fd@Dell.com>
 <20180204092333.GA2010@localhost.localdomain> <20180204121530.sl3h77mxbwusp2ul@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:39989 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeBDOZs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Feb 2018 09:25:48 -0500
In-Reply-To: <20180204121530.sl3h77mxbwusp2ul@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Alexander Sergeyev <sergeev917@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Sun, Feb 4, 2018 at 2:15 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> On Sunday 04 February 2018 12:23:33 Alexander Sergeyev wrote:

>> Is there any estimates on when the patch will be merged into mainline? I
>> want to put something into my distribution bug tracker, but it's unlikel=
y
>> they will use this patch before its stabilization.
>
> It should go in next round of merging into linus tree and after that
> with proper commit message tags it should included in next stable
> versions.

Next week in Linus' tree, after that through couple more weeks in
stable releases.

--=20
With Best Regards,
Andy Shevchenko
