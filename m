From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/14] platform/x86: remove sparse_keymap_free() calls
Date: Mon, 13 Mar 2017 18:11:45 +0200
Message-ID: <CAHp75VckmaCmEyimWq23MeUjpg2jMhfZVoTRYVxFCoSRJoSSZg@mail.gmail.com>
References: <20170309121150.10553-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34382 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751568AbdCMQLr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2017 12:11:47 -0400
In-Reply-To: <20170309121150.10553-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Andy Shevchenko <andy@infradead.org>, Azael Avalos <coproscefalo@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Harald Welte <laforge@gnumonks.org>, Herton Ronaldo Krzesinski <herton@canonical.com>, Ike Panhc <ike.pan@canonical.com>, "Lee, Chun-Yi" <jlee@suse.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 9, 2017 at 2:11 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:
> Hi everyone,
>
> This patch series removes all uses of sparse_keymap_free() in the x86
> platform driver subsystem due to an upcoming change in
> sparse_keymap_setup() behavior wrt memory management.  Specifically,
> sparse_keymap_setup() will use managed memory for the keymap copy it
> creates, which enables it to be automatically freed upon input device
> removal, without the need to explicitly call sparse_keymap_free().
>
> I thought it makes sense to post all these patches as a single series.
> To minimize spamming, only this cover letter is addressed to all the
> maintainers whose drivers are affected by this series, while each of the
> subsequent patches will only be sent to the relevant recipients, plus
> the platform-driver-x86 mailing list and subsystem maintainers.
>
> Darren, Andy, all these patches should only be applied after merging an
> immutable branch called ib/4.10-sparse-keymap-managed from Dmitry
> Torokhov's git tree.

Pushed to testing.

If anyone has objections, please tell me as soon as possible (though
we have still time to remove / revert changes which I hope not the
case here).

>  drivers/platform/x86/acer-wmi.c         |  5 +----
>  drivers/platform/x86/asus-laptop.c      |  8 ++------
>  drivers/platform/x86/asus-wmi.c         |  8 ++------
>  drivers/platform/x86/dell-wmi-aio.c     |  6 +-----
>  drivers/platform/x86/dell-wmi.c         | 16 ++++------------
>  drivers/platform/x86/eeepc-laptop.c     |  8 ++------
>  drivers/platform/x86/hp-wmi.c           |  5 +----
>  drivers/platform/x86/ideapad-laptop.c   |  5 +----
>  drivers/platform/x86/msi-laptop.c       | 14 +++-----------
>  drivers/platform/x86/msi-wmi.c          |  9 ++-------
>  drivers/platform/x86/panasonic-laptop.c | 18 +++---------------
>  drivers/platform/x86/topstar-laptop.c   |  5 +----
>  drivers/platform/x86/toshiba-wmi.c      |  5 +----
>  drivers/platform/x86/toshiba_acpi.c     |  8 ++------
>  14 files changed, 26 insertions(+), 94 deletions(-)
>
> --
> 2.12.0
>



--=20
With Best Regards,
Andy Shevchenko
