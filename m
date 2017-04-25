From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] dell-laptop: Adds support for keyboard backlight timeout
 AC settings
Date: Tue, 25 Apr 2017 16:32:36 +0300
Message-ID: <CAHp75VdjZ4Ti1YPZVq8_fjUh0xuDbQ-EtZQQjaWQf2fhZs2mRw@mail.gmail.com>
References: <1492976447-10339-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75VfCiqeddWu9xfMud4sEWAvk+CDXTkgO5zbb++QhiTL=Bw@mail.gmail.com> <20170425125453.GK30553@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34974 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1431174AbdDYNci (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 09:32:38 -0400
In-Reply-To: <20170425125453.GK30553@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Arcadiy Ivanov <arcadiy@ivanov.biz>, Mario Limonciello <mario.limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 25, 2017 at 3:54 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 25 April 2017 15:36:56 Andy Shevchenko wrote:
>> On Sun, Apr 23, 2017 at 10:40 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:

>> This patch misses few others that were applied to our testing / for-next=
.
>
> Ah... sorry for that :-( And I was in impression that there were fixes
> for that code which use mutexes... Now I know why I have not seen them!
>
>> I have applied it to testing with corrected conflict (easy to fix),
>> though check if everything still as supposed to be.
>
> Can you send a link to your fix?

Sure, here it is:
http://git.infradead.org/linux-platform-drivers-x86.git/commit/bcf7d8a30e28=
88f78a19778a16d3dd8c10b4b0ad

--=20
With Best Regards,
Andy Shevchenko
