From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2] eeepc-wmi: add cpufv sysfs documentation
Date: Tue, 26 Oct 2010 09:12:05 +0200
Message-ID: <AANLkTi=Y2eZaQ3hmnhCP0HB3OBm8GjWTPMCuVQQU3eiA@mail.gmail.com>
References: <1288058919-21216-1-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:34093 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756819Ab0JZHMI convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Oct 2010 03:12:08 -0400
Received: by eye27 with SMTP id 27so4980855eye.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2010 00:12:06 -0700 (PDT)
In-Reply-To: <1288058919-21216-1-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Tue, Oct 26, 2010 at 4:08 AM,  <chris@cnpbagwell.com> wrote:
> From: Chris Bagwell <chris@cnpbagwell.com>
>
> Based on cpufv text from sysfs-platform-eeepc-laptop that
> has almost same behavior.
> ---
> =C2=A0Documentation/ABI/testing/sysfs-platform-eeepc-wmi | =C2=A0 10 =
++++++++++
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-platform-eee=
pc-wmi
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-eeepc-wmi b/Doc=
umentation/ABI/testing/sysfs-platform-eeepc-wmi
> new file mode 100644
> index 0000000..e4b5fef
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
> @@ -0,0 +1,10 @@
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/eeepc-=
wmi/cpufv
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Oct 2010
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Corentin Chary" <corentincj@iksaif.ne=
t>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Change CPU clock c=
onfiguration (write-only).
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 There are three av=
ailable clock configuration:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0 =
-> Super Performance Mode
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 =
-> High Performance Mode
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2 =
-> Power Saving Mode
> --
> 1.7.3.1
>
>

Acked-by: Corentin Chary <corentincj@iksaif.net>

Matthew, if it's still possible, please queue this for 2.6.37.
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
