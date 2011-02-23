From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH -next] eeepc-wmi: kconfig changes to fix build errors
Date: Wed, 23 Feb 2011 08:01:12 +0100
Message-ID: <AANLkTinb4f5QLRQ8kfiSkjdx9YzZpdYk-=YD9Qmejz+g@mail.gmail.com>
References: <20110222183437.ec2807bf.sfr@canb.auug.org.au>
	<20110222134735.0bfbec8b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20110222134735.0bfbec8b.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Garrett <mjg@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 22, 2011 at 10:47 PM, Randy Dunlap <randy.dunlap@oracle.com=
> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Fix eeepc-wmi build when CONFIG_HOTPLUG_PCI is not enabled:
>
> eeepc-wmi.c:(.text+0x3bc5e9): undefined reference to `pci_hp_deregist=
er'
> eeepc-wmi.c:(.text+0x3bcca4): undefined reference to `__pci_hp_regist=
er'
>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
> =C2=A0drivers/platform/x86/Kconfig | =C2=A0 =C2=A01 +
> =C2=A01 file changed, 1 insertion(+)
>
> --- linux-next-20110222.orig/drivers/platform/x86/Kconfig
> +++ linux-next-20110222/drivers/platform/x86/Kconfig
> @@ -447,6 +447,7 @@ config EEEPC_WMI
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on EXPERIMENTAL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BACKLIGHT_CLASS_DEVICE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on RFKILL || RFKILL =3D n
> + =C2=A0 =C2=A0 =C2=A0 depends on HOTPLUG_PCI
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select INPUT_SPARSEKMAP
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select LEDS_CLASS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select NEW_LEDS
>

Sorry for that...

Acked-by: Corentin Chary <corentin.chary@gmail.com>


--=20
Corentin Chary
http://xf.iksaif.net
