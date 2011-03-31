From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Thu, 31 Mar 2011 09:23:41 +0200
Message-ID: <AANLkTikK0FTAj0MeMk4n3_V6=yDYBL4cVROWSOHDm+XG@mail.gmail.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
	<1301004130-3294-4-git-send-email-andy.ross@windriver.com>
	<AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
	<20110328054314.GC31692@core.coreip.homeip.net>
	<4D90AB00.5080800@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:35425 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753643Ab1CaHXn convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Mar 2011 03:23:43 -0400
Received: by ewy4 with SMTP id 4so641472ewy.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Mar 2011 00:23:42 -0700 (PDT)
In-Reply-To: <4D90AB00.5080800@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Ross <andy.ross@windriver.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

test platform printk

On Mon, Mar 28, 2011 at 3:36 PM, Andy Ross <andy.ross@windriver.com> wr=
ote:
> [combined responses for clarity]
>
> Corentin Chary wrote:
>> Wow :/ How long is an acpi_evaluate_integer call here ?
>
> Early on I benchmarked the per-axis ACPI calls about about 50us, whic=
h
> is shockingly high to me. =C2=A0But honestly that note there is just
> pedantry: the hi/lo race (and the fact that "errors" live in the same
> space with valid data values) is a real condition that lets me justif=
y
> the "retry on large deltas" behavior, which most definitely improves
> data quality.

Ok,

>> When is asus_platform_probe called exactly ? Because I'd say it's
>> called during asus_platform_probe(), and that doesn't fix your issue
>> right ?
>
> Admittedly this is voodoo. =C2=A0Moving the input_polldev device
> initialization to asus_laptop (originally in asus_acpi_add(), which i=
s
> called out of the ACPI framwwork) caused reliable panics on boot. =C2=
=A0I
> moved it to asus_platform_probe() to restore the structure of the
> original pega_accel module, which did it in a platform probe.
>
> I don't know enough about the platform driver model to say exactly,
> but I strongly suspect that platform probe calls are not done
> synchronously underneath the platform_{device|driver}_register()
> calls.

I'll check that this weekend.

> Dmitry Torokhov wrote:
>> This I do not quite understand... Do we bind acpi drivers to devices
>> before ACPI initialization is done? Then this should be fixed in
>> ACPI layer, but I doubt even early userspace is active at the time
>> ACPI core is being initialized. Also, input polling is done in a
>> separate thread so you not moving the poll out of ACPI binding
>> thread but delay poll execution by a few microseconds...
>
> See comments above. =C2=A0The current model in asus-laptop is to regi=
ster
> its keyboard input device underneat the .add callback in the acpi
> driver. =C2=A0That was crashing with the accelerometer.
>
> And there's definitely a userspace interaction: disabling the sensor
> daemon (the distro in question is a MeeGo tablet image) at startup
> avoided the crash (and in fact worked fine when started up manually
> later).

Just to try to fix the crash in a more cleaner way, can you (re-)tell
us more about it ? It's a kernel crash, or the hardware just start
doing stupid things ? Any traces ? Does it also happens when you load
the model *after* boot (blacklist it, then modprobe) ? Could you also
re-send me the dsdt ? I think I lost it.

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
