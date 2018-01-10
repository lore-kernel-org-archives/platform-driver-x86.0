From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Problem with a notebook keyboard after plug into dock station
Date: Wed, 10 Jan 2018 20:39:21 +0200
Message-ID: <CAHp75VdgFTv7TzqDVDbdcv4RT-CZim7XLB1XTg2NWBxNFEuzgQ@mail.gmail.com>
References: <op.zaijxpd8dqmfw5@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:46125 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751787AbeAJSjW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Jan 2018 13:39:22 -0500
In-Reply-To: <op.zaijxpd8dqmfw5@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kapica@fel.cvut.cz
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 30, 2017 at 1:09 PM, Ale=C5=A1 Kapica <kapica@fel.cvut.cz> wrot=
e:
> After the last  dist upgrade my system (I use Debian unstable amd64), was
> encountered a problem, that begined from the kernel 4.13 and probably
> concerns the wmi module. Kernel version 4.12 and lower is ok.
>
> I have a HP ProBook 6475b notebook. When I plug-in it in the 'HP 230W
> Advanced Docking Station', the keyboard will stop working in the X server
> environment.
>
> Accepted only a code keys from external USB keyboard. But on the text
> console  works the notebook keyboard seamlessly too.
>
> acpi_listen:
> =E2=80=A6
> 95F24279-4D7B-43 00000080 00000000
> video/tabletmode TBLT 0000008A 00000001
> ac_adapter ACPI0003:00 00000080 00000001
> =E2=80=A6
>
> When unplug notebook from dock station, it work again normal.
>
> I don't know if is the bug or feature, but it is very uncomfortable becau=
se
> external keyboard occupied place on my table.
>
> If it should be feature, please advise mee how to turn it off.

Big sorry for missed answer.

Is it possible to you to
1) check if latest vanilla still has the issue;
2) do git bisect to find a culprit commit?

--=20
With Best Regards,
Andy Shevchenko
