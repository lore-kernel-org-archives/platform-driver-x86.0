From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/2] Asus Wireless Radio Control driver
Date: Tue, 5 Jan 2016 15:58:46 +0200
Message-ID: <CAHp75VeFvqvWNcNtOLnzoxsW+MRk8G__QQjZ73H4S-vz9oR9og@mail.gmail.com>
References: <1452000361-13640-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:33780 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbcAEN6r convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 08:58:47 -0500
In-Reply-To: <1452000361-13640-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Tue, Jan 5, 2016 at 3:25 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com> wrote:
> This series implements the driver for the "Asus Wireless Radio Contro=
l" device,
> as named on the vendor website, which handles notifications from the =
airplane
> mode hotkey and drives the airplane mode indicator LED. This device a=
ppears in
> the DSDT as "ASHS".
>
> I decided to split the series and move the commits that drive the LED=
 to a
> separate series, so this part can be merged without waiting for feedb=
ack on the
> new airplane mode RFKill LED trigger.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

(I'm fine with current version but please take into consideration
comments to the first patch, most important 'default m' thing)

>
> Regards,
>
> Joao Paulo
>
> Jo=C3=A3o Paulo Rechi Vita (2):
>   platform/x86: Add Asus Wireless Radio Control driver
>   asus-wireless: Add ACPI HID ATK4001
>
>  MAINTAINERS                          |  6 +++
>  drivers/platform/x86/Kconfig         | 15 +++++++
>  drivers/platform/x86/Makefile        |  1 +
>  drivers/platform/x86/asus-wireless.c | 84 ++++++++++++++++++++++++++=
++++++++++
>  4 files changed, 106 insertions(+)
>  create mode 100644 drivers/platform/x86/asus-wireless.c
>
> --
> 2.5.0
>



--=20
With Best Regards,
Andy Shevchenko
