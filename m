From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: Rfkill always soft/hard blocked upon boot
Date: Sun, 30 Jan 2011 12:51:36 -0600
Message-ID: <4D45B338.8010802@lwfinger.net>
References: <4D455DC1.6010909@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:62020 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503Ab1A3Sux (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 Jan 2011 13:50:53 -0500
In-Reply-To: <4D455DC1.6010909@pardus.org.tr>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozan@pardus.org.tr>
Cc: linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 01/30/2011 06:46 AM, Ozan =C3=87a=C4=9Flayan wrote:
> Hi,
>=20
> How to fix or debug the $subject? You always have to press Fn+F2 to h=
ard
> unblock the rfkill after every boot on a local brand laptop.
>=20
> If the rfkill switch is really a switch which can be toggled on/off,
> this makes sense. If you keep it Off, it will come as blocked. But it
> seems that on this machine Fn+F2 controls the hard block state.
>=20
> It should either be saved in somewhere (I've read that there is a
> persistent knob for rfkill drivers in sysfs which tells whether the
> state is kept in a non-volatile space across boots or not) or all sof=
t
> and this kind of Fn+Fx hard blocks should be explicitly disabled by
> kernel during boots.
>=20
> I don't have direct access to the machine but the owner will help if =
you
> need any output, etc.
>=20
> After booting:
>=20
> 0: hci0: Bluetooth
>         Soft blocked: no
>         Hard blocked: no
> 1: phy0: Wireless LAN
>         Soft blocked: no
>         Hard blocked: yes
>=20
> After pressing Fn+F2:
> 0: phy0: Wireless LAN
>         Soft blocked: no
>         Hard blocked: no
> 1: hci0: Bluetooth
>         Soft blocked: no
>         Hard blocked: no
>=20
> 03:00.0 Network controller: Atheros Communications Inc. AR9285 Wirele=
ss
> Network Adapter (PCI-Express) (rev 01)
>         Subsystem: Device 1a3b:1089
>         Flags: bus master, fast devsel, latency 0, IRQ 17
>         Memory at f1d00000 (64-bit, non-prefetchable) [size=3D64K]
>         Capabilities: [40] Power Management version 3
>         Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit-
>         Capabilities: [60] Express Legacy Endpoint, MSI 00
>         Capabilities: [100] Advanced Error Reporting
>         Capabilities: [140] Virtual Channel
>         Capabilities: [160] Device Serial Number 00-15-17-ff-ff-24-14=
-12
>         Capabilities: [170] Power Budgeting <?>
>         Kernel driver in use: ath9k
>         Kernel modules: ath9k
>=20
> This is on 2.6.37. I'm waiting for the dmesg output.

The nature of that Fn-F2 key depends on how the motherboard manufacture=
r coded
their BIOS. Most do it as a toggle and use some WMI (Windows Management
Interface) code to initialize it on boot up. As this no-name laptop is =
unlikely
to have a WMI driver the way that name brands do, it probably generates=
 a
keystroke. That is easy to check - Use CTRL-ALT-F1 to switch to a conso=
le, log
in, and issue the command "showkey". Is a keycode returned when Fn-F2 i=
s pressed?

If the button does generate a key event, then adding a command to gener=
ate this
key in a script that is executed after bootup should solve the problem.=
 I don't
know the command you need, but I'm sure someone will. Where to put that=
 command
will depend on your distro.

Larry
