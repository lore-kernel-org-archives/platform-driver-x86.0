From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 0/7] asus-wireless: LED control
Date: Sun, 19 Jun 2016 09:19:03 +0200
Message-ID: <CAHR064g-4Hi_7YQ2=D0x9+W+ka8ofRZW8NrWfC3N4id0vAtMqg@mail.gmail.com>
References: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33384 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751471AbcFSHTF convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 03:19:05 -0400
In-Reply-To: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Mon, Jun 13, 2016 at 10:57 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> This series adds support for controlling the airplane-mode indicator =
LED
> present in some Asus laptops. It also creates a quirk in asus-wmi so =
it does not
> create RFKill devices for platforms that use asus-wireless and where =
there is a
> competition for the LED control (see "asus-wmi: Create quirk for airp=
lane_mode
> LED" for more details).
>
> Jo=C3=A3o Paulo Rechi Vita (7):
>   asus-wireless: Toggle airplane mode LED
>   asus-wmi: Create quirk for airplane_mode LED
>   asus-wmi: Add quirk_no_rfkill for the Asus N552VW
>   asus-wmi: Add quirk_no_rfkill for the Asus U303LB
>   asus-wmi: Add quirk_no_rfkill for the Asus Z550MA
>   asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF
>   asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA
>
>  drivers/platform/x86/Kconfig         |  2 +
>  drivers/platform/x86/asus-nb-wmi.c   | 49 ++++++++++++++++++-
>  drivers/platform/x86/asus-wireless.c | 91 ++++++++++++++++++++++++++=
+++++++++-
>  drivers/platform/x86/asus-wmi.c      |  8 ++--
>  drivers/platform/x86/asus-wmi.h      |  1 +
>  5 files changed, 145 insertions(+), 6 deletions(-)
>
> --
> 2.5.0
>

Looks good to me. I hope that we can get rid of all these quirks in
the near future.

Reviewed-by: Corentin Chary <corentin.chary@gmail.com>

--=20
Corentin Chary
http://xf.iksaif.net
