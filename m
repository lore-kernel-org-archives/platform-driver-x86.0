From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: add cpufv sysfs documentation
Date: Mon, 25 Oct 2010 10:15:21 +0200
Message-ID: <AANLkTinObWU504s4c21OEaoBhx4NvE2Ua2JSi17WdtMq@mail.gmail.com>
References: <1287869450-713-1-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:57072 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884Ab0JYIPW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 04:15:22 -0400
Received: by ewy7 with SMTP id 7so3977840ewy.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2010 01:15:21 -0700 (PDT)
In-Reply-To: <1287869450-713-1-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Sat, Oct 23, 2010 at 11:30 PM,  <chris@cnpbagwell.com> wrote:
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
> index 0000000..5b0201b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
> @@ -0,0 +1,10 @@
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/eeepc/=
cpufv
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

Hi Chris,
Isn't the path /sys/devices/platform/eeepc-wmi/cpufv instead of
/sys/devices/platform/eeepc/cpufv ?
--=20
Corentin Chary
http://xf.iksaif.net
