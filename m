From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-laptop: Allocate buffer on heap
 rather than globally
Date: Sun, 4 Feb 2018 16:27:55 +0200
Message-ID: <CAHp75VcnDKP=kNPh7pU1v_f0+oP64ByKAOmkZzXNUVaXg=wDSg@mail.gmail.com>
References: <1517420855-19374-1-git-send-email-mario.limonciello@dell.com> <20180204120922.fds52i22griw2h6e@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:38452 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbeBDO15 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Feb 2018 09:27:57 -0500
In-Reply-To: <20180204120922.fds52i22griw2h6e@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Sun, Feb 4, 2018 at 2:09 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> On Wednesday 31 January 2018 11:47:35 Mario Limonciello wrote:
>> There is no longer a need for the buffer to be defined in
>> first 4GB physical address space.
>>
>> Furthermore there may be race conditions with multiple different functio=
ns
>> working on a module wide buffer causing incorrect results.
>>
>> Fixes: 549b4930f057658dc50d8010e66219233119a4d8

He-h, I had to notice this earlier...

> Ok, you can add my:
> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

Thanks and sorry, Pali, it's in for-next already, can't rebase.

--=20
With Best Regards,
Andy Shevchenko
