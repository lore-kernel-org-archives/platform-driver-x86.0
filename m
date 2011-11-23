From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [PATCH 10/15] samsung-laptop: cleanup KConfig
Date: Wed, 23 Nov 2011 17:19:40 +0100
Message-ID: <CANq1E4TwHt8RhW2nn_7W0MqiLd5d6VEw1c7QUP7JYniA2yZK=Q@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-11-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1321999366-23784-11-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02 PM, Corentin Chary <corentincj@iksaif.net=
> wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
> =A0drivers/platform/x86/Kconfig | =A0 11 +++++++----
> =A01 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 7f43cf8..2f7a9a7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -744,13 +744,16 @@ config XO15_EBOOK
>
> =A0config SAMSUNG_LAPTOP
> =A0 =A0 =A0 =A0tristate "Samsung Laptop driver"
> - =A0 =A0 =A0 depends on RFKILL && BACKLIGHT_CLASS_DEVICE && X86
> + =A0 =A0 =A0 depends on X86
> + =A0 =A0 =A0 depends on RFKILL || RFKILL =3D n
> + =A0 =A0 =A0 depends on BACKLIGHT_CLASS_DEVICE
> =A0 =A0 =A0 =A0---help---
> =A0 =A0 =A0 =A0 =A0This module implements a driver for a wide range o=
f different
> =A0 =A0 =A0 =A0 =A0Samsung laptops. =A0It offers control over the dif=
ferent
> - =A0 =A0 =A0 =A0 function keys, wireless LED, LCD backlight level, a=
nd
> - =A0 =A0 =A0 =A0 sometimes provides a "performance_control" sysfs fi=
le to allow
> - =A0 =A0 =A0 =A0 the performance level of the laptop to be changed.
> + =A0 =A0 =A0 =A0 function keys, wireless LED, LCD backlight level.
> +
> + =A0 =A0 =A0 =A0 It may also provides some sysfs files described in

If you are resending this anyway:
"provide"

> + =A0 =A0 =A0 =A0 <file:Documentation/ABI/testing/sysfs-platform-sams=
ung-laptop>
>
> =A0 =A0 =A0 =A0 =A0To compile this driver as a module, choose M here:=
 the module
> =A0 =A0 =A0 =A0 =A0will be called samsung-laptop.
> --
> 1.7.5.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>

Cheers
David
