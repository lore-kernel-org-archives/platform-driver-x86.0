From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Mon, 4 Apr 2011 17:16:05 +0000
Message-ID: <BANLkTimUsoc=uJbNAQvaiyfb2vYRnun2Dg@mail.gmail.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
	<1301004130-3294-4-git-send-email-andy.ross@windriver.com>
	<AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
	<20110328054314.GC31692@core.coreip.homeip.net>
	<4D90AB00.5080800@windriver.com>
	<AANLkTikK0FTAj0MeMk4n3_V6=yDYBL4cVROWSOHDm+XG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:49215 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab1DDRQH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 13:16:07 -0400
Received: by eyx24 with SMTP id 24so1780724eyx.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2011 10:16:05 -0700 (PDT)
In-Reply-To: <AANLkTikK0FTAj0MeMk4n3_V6=yDYBL4cVROWSOHDm+XG@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Ross <andy.ross@windriver.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Thu, Mar 31, 2011 at 7:23 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> test platform printk
>
> On Mon, Mar 28, 2011 at 3:36 PM, Andy Ross <andy.ross@windriver.com> =
wrote:
>> [combined responses for clarity]
>>
>> Corentin Chary wrote:
>>> Wow :/ How long is an acpi_evaluate_integer call here ?
>>
>> Early on I benchmarked the per-axis ACPI calls about about 50us, whi=
ch
>> is shockingly high to me. =C2=A0But honestly that note there is just
>> pedantry: the hi/lo race (and the fact that "errors" live in the sam=
e
>> space with valid data values) is a real condition that lets me justi=
fy
>> the "retry on large deltas" behavior, which most definitely improves
>> data quality.
>
> Ok,
>
>>> When is asus_platform_probe called exactly ? Because I'd say it's
>>> called during asus_platform_probe(), and that doesn't fix your issu=
e
>>> right ?
>>
>> Admittedly this is voodoo. =C2=A0Moving the input_polldev device
>> initialization to asus_laptop (originally in asus_acpi_add(), which =
is
>> called out of the ACPI framwwork) caused reliable panics on boot. =C2=
=A0I
>> moved it to asus_platform_probe() to restore the structure of the
>> original pega_accel module, which did it in a platform probe.
>>
>> I don't know enough about the platform driver model to say exactly,
>> but I strongly suspect that platform probe calls are not done
>> synchronously underneath the platform_{device|driver}_register()
>> calls.
>
> I'll check that this weekend.

I didn't have any asus-laptop to test it, but here is a call trace for =
hp-wmi:

init
register
alloc
add
------------[ cut here ]------------
WARNING: at drivers/platform/x86/hp-wmi.c:901 hp_wmi_init+0x1db/0x234 [=
hp_wmi]()
Hardware name: HP Compaq 8710p
Modules linked in: hp_wmi(+) nvidia(P) hp_accel lis3lv02d
input_polldev ext2 sdhci_pci sdhci mmc_core thermal button ehci_hcd
btusb usbhid joydev sparse_keymap hid e1000e wmi bluetooth [last
unloaded: hp_wmi]
Pid: 25890, comm: insmod Tainted: P            2.6.39-rc1-00184-g78fca1=
b9 #4
Call Trace:
 [<ffffffff8103becb>] ? warn_slowpath_common+0x7b/0xc0
 [<ffffffffa00621db>] ? hp_wmi_init+0x1db/0x234 [hp_wmi]
 [<ffffffffa0062000>] ? 0xffffffffa0061fff
 [<ffffffff810002ba>] ? do_one_initcall+0x3a/0x170
 [<ffffffff81070e39>] ? sys_init_module+0xb9/0x200
 [<ffffffff815b733b>] ? system_call_fastpath+0x16/0x1b
---[ end trace 9b2a16f0f1ed60e4 ]---
bios setup begin
------------[ cut here ]------------
WARNING: at drivers/platform/x86/hp-wmi.c:783
hp_wmi_bios_setup+0x2a/0x2df [hp_wmi]()
Hardware name: HP Compaq 8710p
Modules linked in: hp_wmi(+) nvidia(P) hp_accel lis3lv02d
input_polldev ext2 sdhci_pci sdhci mmc_core thermal button ehci_hcd
btusb usbhid joydev sparse_keymap hid e1000e wmi bluetooth [last
unloaded: hp_wmi]
Pid: 25890, comm: insmod Tainted: P        W   2.6.39-rc1-00184-g78fca1=
b9 #4
Call Trace:
 [<ffffffff8103becb>] ? warn_slowpath_common+0x7b/0xc0
 [<ffffffffa003ad2d>] ? hp_wmi_bios_setup+0x2a/0x2df [hp_wmi]
 [<ffffffff81339efe>] ? pm_runtime_barrier+0x5e/0xc0
 [<ffffffff81331b46>] ? driver_probe_device+0x96/0x1b0
 [<ffffffff81331d00>] ? __driver_attach+0xa0/0xa0
 [<ffffffff8133087c>] ? bus_for_each_drv+0x5c/0x90
 [<ffffffff813319ef>] ? device_attach+0x8f/0xb0
 [<ffffffff8133121d>] ? bus_probe_device+0x2d/0x50
 [<ffffffff8132f546>] ? device_add+0x566/0x630
 [<ffffffff8132e18f>] ? dev_set_name+0x3f/0x50
 [<ffffffff813338b8>] ? platform_device_add+0xf8/0x1c0
 [<ffffffffa00621e7>] ? hp_wmi_init+0x1e7/0x234 [hp_wmi]
 [<ffffffffa0062000>] ? 0xffffffffa0061fff
 [<ffffffff810002ba>] ? do_one_initcall+0x3a/0x170
 [<ffffffff81070e39>] ? sys_init_module+0xb9/0x200
 [<ffffffff815b733b>] ? system_call_fastpath+0x16/0x1b
---[ end trace 9b2a16f0f1ed60e5 ]---
bios setup end
done

So, the call is clearly synchroneous.

Where did you put the call exactly to make it crash ?

>> Dmitry Torokhov wrote:
>>> This I do not quite understand... Do we bind acpi drivers to device=
s
>>> before ACPI initialization is done? Then this should be fixed in
>>> ACPI layer, but I doubt even early userspace is active at the time
>>> ACPI core is being initialized. Also, input polling is done in a
>>> separate thread so you not moving the poll out of ACPI binding
>>> thread but delay poll execution by a few microseconds...
>>
>> See comments above. =C2=A0The current model in asus-laptop is to reg=
ister
>> its keyboard input device underneat the .add callback in the acpi
>> driver. =C2=A0That was crashing with the accelerometer.
>>
>> And there's definitely a userspace interaction: disabling the sensor
>> daemon (the distro in question is a MeeGo tablet image) at startup
>> avoided the crash (and in fact worked fine when started up manually
>> later).
>
> Just to try to fix the crash in a more cleaner way, can you (re-)tell
> us more about it ? It's a kernel crash, or the hardware just start
> doing stupid things ? Any traces ? Does it also happens when you load
> the model *after* boot (blacklist it, then modprobe) ? Could you also
> re-send me the dsdt ? I think I lost it.

ping ?

Thanks,
--=20
Corentin Chary
http://xf.iksaif.net
