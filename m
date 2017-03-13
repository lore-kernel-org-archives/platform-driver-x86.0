From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-hid: do not set parents of input
 devices explicitly
Date: Mon, 13 Mar 2017 18:17:06 +0200
Message-ID: <CAHp75Ven0CeXNBajX63DrQgupGeUkEZLJYb04g_JkwwUcDVO1w@mail.gmail.com>
References: <20170309093651.7824-1-kernel@kempniu.pl> <2e954caa-d531-3c82-023c-afb8aaf9f3d9@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36027 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752358AbdCMQRI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 12:17:08 -0400
In-Reply-To: <2e954caa-d531-3c82-023c-afb8aaf9f3d9@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 13, 2017 at 12:37 PM, Alex Hung <alex.hung@canonical.com> wrote=
:
> On 2017-03-09 05:36 PM, Micha=C5=82 K=C4=99pie=C5=84 wrote:
>>
>> devm_input_allocate_device() already causes the supplied struct device
>> to be set as the parent of the input device, so doing it again is
>> redundant.
>>
>> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

Pushed to testing, thanks.

>
> The patch, on top of previous patches, is tested on Latitude 7480
>
> Reviewed-and-tested-by: Alex Hung <alex.hung@canonical.com>

Alex, this tag is not recognized by patchwork :-(, It would be nice to
use separate tags.

I would join them if needed (usually when they sent against cover letter).

--=20
With Best Regards,
Andy Shevchenko
