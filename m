From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCHv2 0/2] platform/x86: asus-wmi: Substitute quirk_no_rfkill
 with a generic fix
Date: Fri, 24 Feb 2017 22:32:31 +0200
Message-ID: <CAHp75Vf76kTqvKwW6S=ACt_QwwNm6P10QDrgv-VafcfhwLKULA@mail.gmail.com>
References: <20170220195023.17775-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:32807 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdBXUci (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 15:32:38 -0500
In-Reply-To: <20170220195023.17775-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Mon, Feb 20, 2017 at 9:50 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> The quirk avoids the conflicting usage of ASUS_WMI_DEVID_WLAN_LED (0x0001=
0002)
> by both asus-wireless and asus-wmi on machines where the BIOS can't set a=
nd
> record the wlan status (wlan_ctrl_by_user in asus-wmi.c). At the moment w=
e have
> six models quirked upstream, but another fifteen downstream, and we expec=
t this
> list to continue growing.
>
> This series makes use of ASUS_WMI_DSTS_USER_BIT plus the status of the AS=
HS
> device to skip asus_wmi_rfkill_init(), instead of static DMI-based quirks=
.
>

Thanks, applied for testing.

> Jo=C3=A3o Paulo Rechi Vita (2):
>   platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
>   platform/x86: asus-wmi: Remove quirk_no_rfkill
>
>  drivers/platform/x86/asus-nb-wmi.c | 49 ++------------------------------=
------
>  drivers/platform/x86/asus-wmi.c    | 22 +++++++++++++----
>  drivers/platform/x86/asus-wmi.h    |  1 -
>  3 files changed, 19 insertions(+), 53 deletions(-)
>
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
