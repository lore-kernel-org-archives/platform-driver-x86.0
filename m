Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A66339866
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356919; cv=none; b=NPyFWZ5E88VT6Bg/XXJb9GOBj/0dHr9BBF0aFhG2EF7q2yHL1kHyvpZWdPJTqB7lhPA9rOoiRoNgya4xBZh8/5/sOAxsbv7XgBMykhzFhDjTfeTprvmWWjtXAKp2ZDZn0sn8wXr/fPZbhLSIwGEwerglTgxPe3NAtiiDBnapudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356919; c=relaxed/simple;
	bh=ZltLO/GI5Z7wMtPjpUxq6iHauTkBgUe/juFlz14hY6c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofakLPdpvvU1W432O7vAO5rXrSpznCR7zdqOEiwAbQeEhRThv6T3EXIk2ETIN2KpP/C3PSvLF9ba7yh2XtYtgtVzQ8IBuwZPsULu8BfiiDgnkdlNUnXo3OHolRj1pn5TEhU8kcn5Hc2UgQYJn57xfm7G1nrVpgICeCZQzNwsaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XVxI6Jtn; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XVxI6Jtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771356902; x=1771616102;
	bh=aREtzqrKK6NOGP3/eHIpv84T4xBD8O8Qv1V4XNSVvZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XVxI6JtnMdP0iZ6hrYy8IXXJEjjAea2vTJM8fwIPu/R9oyMQ3dWwdNSDnHj1KbEx+
	 oy4wm3HK4IkaGKpi0PYIFrxMWlV7ICgzNdlnA7b6+Mvsjz+WGG3knWoidTl/PoRazn
	 js7+gg0T8Qiz27VjMDMkfKNhMaTRbY0exU/BMq8JPix5M0pmsj5iVxyzv7dgoAOFEC
	 UFIQEt76Q46CKO8bowzAg4eEa1wgeGFMxiqUwOsBRwrQf+6V0WBlukPFYT5wzuAjlY
	 J4mT9TiRsMmB2IzOwhTPiQh67EEheKSxaNdjZIz2U6DSoHGK6d9HZW6ZyNh0Sx9Ax+
	 wyt47MWWF9cbg==
Date: Tue, 17 Feb 2026 19:34:59 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
From: Tj <tj.iam.tj@proton.me>
Cc: Hans de Goede <hansg@kernel.org>, "metux IT consult\"" <info@metux.net>, platform-driver-x86@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <e8c222ce-4d1e-4747-8122-bb570d423c04@proton.me>
In-Reply-To: <aZSkqGTqMp_57qC7@google.com>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me> <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org> <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me> <aZSkqGTqMp_57qC7@google.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 0f93a664bc501da17410e08b7325a1fe1510bf2b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/02/2026 17:29, Dmitry Torokhov wrote:
> On Tue, Feb 17, 2026 at 03:25:01PM +0000, Tj wrote:
>> On 17/02/2026 11:42, Hans de Goede wrote:
>>> On 16-Feb-26 20:01, Tj wrote:
>>>> Installed v6.19 recently and realised the heartbeat/network LED
>>>> configuration I'd set wasn't working. Checking the log I see:
>>>>
>>>> kernel: platform gpio-keys-polled: deferred probe pending:
>>>> gpio-keys-polled: failed to get gpio
>>>> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed =
to
>>>> get GPIO 'apu2-leds/led-1'
>>>>
>>>> Looking through commits I found b8754092dfed4fc2fc
>>>>
>>>> platform/x86: pcengines-apuv2: Use static device properties
>>>>
>>>> After reverting it the LEDs operate as expected.=C2=A0This entered in =
v6.18
>>>> so will affect it as well.
>>>>
>>>> In v6.17 I see:
>>>>
>>>> kernel: platform gpio-keys-polled: deferred probe pending:
>>>> gpio-keys-polled: unable to claim gpio 0
>>>>
>>>> that is a slight variation on the v6.19 report. I've not pin-pointed t=
he
>>>> cause yet.
>>> This should be fixed by this patch:
>>>
>>> https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golas=
zewski@oss.qualcomm.com/
>>>
>>> If possible, please give a kernel with that patch added a spin
>>> and confirm if it fixes things.
>> It fixes the LED issue but causes massive log spamming (10's per second)
>> related to the gpio-keys-polled:
>>
>> [=C2=A0 =C2=A0 0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (=
gcc
>> (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404
>> SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
>> ...
>> [=C2=A0 =C2=A0 0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31=
/2023
>> ...
>> [=C2=A0 =C2=A0 6.025741] input: gpio-keys-polled as
>> /devices/platform/gpio-keys-polled/input/input0
>> [=C2=A0 =C2=A0 6.035231] gpio-keys-polled gpio-keys-polled: failed to ge=
t gpio
>> state: -52
>> ...
>> [=C2=A0 =C2=A019.545273] input: Power Button as
>> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
>> ...
>> [=C2=A0 =C2=A021.742226] input: PC Speaker as /devices/platform/pcspkr/i=
nput/input2
>> ...
>> [=C2=A0 OK=C2=A0 ] Started dbus.service - D-Bus System Message Bus.
>> [=C2=A0 OK=C2=A0 ] Finished e2scrub_reap.service - Re=E2=80=A6line ext4 =
Metadata Check
>> Snapshots.
>> [=C2=A0 OK=C2=A0 ] Started virtlockd.service - libvirt locking daemon.
>> [=C2=A0 OK=C2=A0 ] Started 819142] gpio=C2=A0 =C2=A032.-keys-polled gpio=
 =C2=A032.-keys-polled:
>> failed to get gpio=C2=A0 =C2=A032. state: -52
>> 1;39msystemd-machined.service -=E2=80=A6and Container Registration Servi=
ce.
>> [=C2=A0 OK=C2=A0 ] Started systemd-logind.service - User Login Managemen=
t.
>> [=C2=A0 =C2=A032.930711] gpio-keys-polled gpio-keys-polled: failed to ge=
t gpio
>> state: -52
>> [=C2=A0 OK=C2=A0 ] Finished grub2-common.service - Record successful boo=
t for GRUB.
>> [=C2=A0 =C2=A033.050784] gpio-keys-polled gpio-keys-polled: failed to ge=
t gpio
>> state: -52
>> [=C2=A0 OK=C2=A0 ] Started polkit.service - Authorization Manager.
>>   =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting ModemManager.service - Mode=
m Manager...
>> [=C2=A0 OK=C2=A0 ] Started virtlogd.service - libvirt logging daemon.
>> [=C2=A0 =C2=A033.158927] gpio-keys-polled gpio-keys-polled: failed to ge=
t gpio
>> state: -52
> I think the patch below should fix it.
>
> Bartosz, I think you should revert
> 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> existing gpio drivers. Breakign the kernel like that is not great.
>
> Thanks.
>
> --
> Dmitry
>
>
> diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
> index e6c6c3ec7656..9f329938202b 100644
> --- a/drivers/gpio/gpio-amd-fch.c
> +++ b/drivers/gpio/gpio-amd-fch.c
> @@ -8,6 +8,7 @@
>    *
>    */
>
> +#include <linux/bitfield.h>
>   #include <linux/err.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> @@ -120,15 +121,15 @@ static int amd_fch_gpio_get(struct gpio_chip *gc,
>   =09=09=09    unsigned int offset)
>   {
>   =09unsigned long flags;
> -=09int ret;
> +=09u32 val;
>   =09struct amd_fch_gpio_priv *priv =3D gpiochip_get_data(gc);
>   =09void __iomem *ptr =3D amd_fch_gpio_addr(priv, offset);
>
>   =09spin_lock_irqsave(&priv->lock, flags);
> -=09ret =3D (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_READ);
> +=09val =3D readl_relaxed(ptr);
>   =09spin_unlock_irqrestore(&priv->lock, flags);
>
> -=09return ret;
> +=09return FIELD_GET(AMD_FCH_GPIO_FLAG_READ, val);
>   }
>
>   static int amd_fch_gpio_request(struct gpio_chip *chip,

Thank-you - that does appear to have cleared the errors. I've now got to=20
find the docs and remind myself what the GPIO inputs actually do!

tj@apu2:~$ journalctl --boot 0 --grep 'gpio'
Feb 17 19:28:57 apu2 kernel: input: gpio-keys-polled as=20
/devices/platform/gpio-keys-polled/input/input0
Feb 17 19:29:13 apu2 systemd-logind[821]: Watching system buttons on=20
/dev/input/event0 (gpio-keys-polled)
tj@apu2:~$ journalctl --boot 0 --grep 'input'
Feb 17 19:28:57 apu2 kernel: input: gpio-keys-polled as=20
/devices/platform/gpio-keys-polled/input/input0
Feb 17 19:29:01 apu2 kernel: input: Power Button as=20
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
Feb 17 19:29:02 apu2 kernel: input: PC Speaker as=20
/devices/platform/pcspkr/input/input2
Feb 17 19:29:13 apu2 systemd-logind[821]: Watching system buttons on=20
/dev/input/event1 (Power Button)
Feb 17 19:29:13 apu2 systemd-logind[821]: Watching system buttons on=20
/dev/input/event0 (gpio-keys-polled)
tj@apu2:~$ journalctl --boot 0 --grep 'apu2'
Feb 17 19:28:57 apu2 kernel: DMI: PC Engines apu2/apu2, BIOS v4.19.0.1=20
01/31/2023
Feb 17 19:28:57 apu2 systemd[1]: Hostname set to <apu2>.
Feb 17 19:28:58 apu2 systemd[1]: Mounting srv-NAS-Apu2-rootfs.mount -=20
/srv/NAS/Apu2/rootfs...
Feb 17 19:28:58 apu2 systemd[1]: Mounted srv-NAS-Apu2-rootfs.mount -=20
/srv/NAS/Apu2/rootfs.
Feb 17 19:28:59 apu2 systemd-resolved[436]: Using system hostname 'apu2'.
Feb 17 19:29:01 apu2 systemd[1]: Mounting=20
srv-NAS-Apu2-current\x2dcost.mount - /srv/NAS/Apu2/current-cost...
Feb 17 19:29:02 apu2 systemd[1]: Mounted=20
srv-NAS-Apu2-current\x2dcost.mount - /srv/NAS/Apu2/current-cost.
Feb 17 19:29:12 apu2 systemd[1]: Starting apu2-led-triggers.service -=20
Enable system performance feedback via the 3 front LEDs on PC Engines=20
APU2...
Feb 17 19:29:15 apu2 systemd[1]: Finished apu2-led-triggers.service -=20
Enable system performance feedback via the 3 front LEDs on PC Engines APU2.


