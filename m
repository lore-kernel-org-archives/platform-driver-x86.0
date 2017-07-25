From: Harvey <harv@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Tue, 25 Jul 2017 14:14:41 +0200
Message-ID: <260f6e2f-055c-7ba4-65a2-e00b92f7e016@gmx.de>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
Reply-To: harv@gmx.de
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="t6PqmNRVchX4u1bseILDjIxOspXJ2QInU"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:55746 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750878AbdGYMPF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2017 08:15:05 -0400
In-Reply-To: <20170720064257.GA4942@larwa.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t6PqmNRVchX4u1bseILDjIxOspXJ2QInU
Content-Type: multipart/mixed; boundary="5pjHmkOoO6eJ0iH7fUM1u3jGwKQJ14PU0";
 protected-headers="v1"
From: Harvey <harv@gmx.de>
Reply-To: harv@gmx.de
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <260f6e2f-055c-7ba4-65a2-e00b92f7e016@gmx.de>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
In-Reply-To: <20170720064257.GA4942@larwa.localdomain>

--5pjHmkOoO6eJ0iH7fUM1u3jGwKQJ14PU0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Micha=C5=82, Jonathan,

just a short note: I am currently on vacation in Spain. I have my laptop
with me and will report back as soon as I find the time. I will try to
help in any way that I can. I want my laptop to be as functional as
possible with linux.

Greetings
Harvey

Am 20.07.2017 um 08:42 schrieb Micha=C5=82 K=C4=99pie=C5=84:
>> Hello,
>=20
> Hi!  Thank you for the report and sorry about the delay, but I have bee=
n
> at a conference for the past week, having way less spare time than I
> wish I had.
>=20
>> I found your mail address in https://patchwork.kernel.org/patch/859880=
1/
>> and it seems you are somehow involved in the improvement for
>> fujitsu-laptop LED handling. If this does not 'belong' to you, maybe y=
ou
>> can point me in the right direction where to report the issue.
>=20
> No worries, that is fine, though I have CCed Jonathan Woithe, who is th=
e
> maintainer of fujitsu-laptop, and both the platform-driver-x86 mailing
> list and LKML (both are open lists).
>=20
>> So let's start explaining.
>> I am the proud owner of a Fujitsu Lifebook E 751 (DMI: FUJITSU LIFEBOO=
K
>> E751/FJNB222, BIOS Version 1.22 04/19/2013) which is equipped with som=
e
>> LEDs in the body (11 to be clear).
>=20
> A photo would be useful (though please do not attach it to your message=
,
> provide a link to it instead) so that we know exactly what we are
> discussing; image search engines can sometimes come up with confusing
> results when looking for a specific model.  Is this what your laptop
> looks like?
>=20
> https://www.notebookcheck.net/fileadmin/_migrated/pics/Fujitsu-LB-E751-=
Tastatur_1j.jpg
>=20
> I also found an alleged photo of an E781, which apparently is a very
> similar model:
>=20
> https://www.notebookcheck.com/fileadmin/_processed_/csm_Fujitsu_lifeboo=
k_E781_Tastatur_67df789f2a.jpg
>=20
> Are these the 11 LEDs you mentioned?
>=20
>   - top, left: E, HDD, Num Lock, Caps Lock, Scroll Lock,
>   - top, right: I, Power Button,
>   - front (not pictured in the first photo above): Power Supply, Batter=
y
>     Charging, Battery 1, Battery 2.
>=20
>> I am using archlinux and as of kernel
>> 4.11 (IIRC) there has appeared an error message in the journalctl log
>> saying:
>>
>> kernel: leds fujitsu::radio_led: Setting an LED's brightness failed
>> (-2147483648)
>>
>> This appears for several times:
>>
>> harvey@gruenix ~/Documents/scripts $ sudo journalctl -b | grep radio_l=
ed
>> 725:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 761:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 762:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 788:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 796:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 799:Jul 14 12:29:38 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 887:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 979:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 981:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 987:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 988:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting a=
n
>> LED's brightness failed (-2147483648)
>> 1009:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1010:Jul 14 12:29:45 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1036:Jul 14 12:29:46 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1037:Jul 14 12:29:46 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1776:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1777:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1779:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1781:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>> 1783:Jul 14 12:33:48 gruenix kernel: leds fujitsu::radio_led: Setting =
an
>> LED's brightness failed (-2147483648)
>=20
> 4.11 included a patch which sets the default trigger for the radio LED
> to rfkill-any, which would explain why you only started seeing these
> errors after upgrading to that version.  See also below.
>=20
>> Some of the LEDs are not working under linux, especially the bluetooth=

>> one
>=20
> Where is the Bluetooth LED located?  I cannot see it.  Can you show it
> on a photo?  How does it behave under other operating systems?
>=20
>> and three others E,
>=20
> According to a manual I found [1], this is an "Energy saving functions
> indicator", which is lit when "energy function are enabled".  My guess
> would be it can be repurposed under Linux.
>=20
>> I(nformation)
>=20
> According to the same manual, this LED signals battery level when the
> laptop is off (S5 state) and the "I" key is pressed.  Not sure it can b=
e
> repurposed, but how does it behave under other operating systems?
>=20
>> and one that shows the sign of a
>> lock with up and down arrows in it.
>=20
> That is Scroll Lock.  I do not think fujitsu-laptop has anything to do
> with it.  If it does not work the way you expect it to, you might want
> to search the web, because there are known inconsistencies in how
> various distributions handle it.
>=20
>> The case is equipped with a slider
>> for Wireless on/off, if that matters.
>=20
> It does, see also below.
>=20
>> Although the message seems to be harmless I am somewhat embarrassed wh=
at
>> happens here and thought I might report it to someone with more knowle=
dge ;)
>=20
> Again, thank you for the report, because implementing a feature like
> this in a platform driver often requires at least some guesswork, which=

> may result in that feature working for some users and misbehaving for
> others.  This is an example of such a situation.
>=20
> As you may have inferred from the patchwork link you visited, I was not=

> sure whether my method of detecting radio LED presence was correct.
> Your report clearly proves I was wrong.  Could you please send me the
> BTNI value reported on your laptop?  You should be able to look it up b=
y
> running:
>=20
>     $ dmesg | grep BTNI
>    =20
> In fact, posting your entire dmesg output somewhere would not hurt
> either.
>=20
> Anyway, you were curious what causes these log messages to appear.  I
> believe it happens because fujitsu-laptop _thinks_ you have a radio LED=

> present on your machine, which causes it to register this LED with a
> default trigger set to rfkill-any.  This means the kernel tries to
> enable this LED whenever any radio transmitter is active and disable it=

> when all radio transmissions are disabled.  In order to set the state o=
f
> the LED, the kernel driver calls a function exposed by the firmware.
> This function returns an error, which is logged.  The specific error
> number you are seeing (-2147483648) means "unsupported command", which
> means fujitsu-laptop attempted to use a feature which is unsupported by=

> your laptop's firmware.  If you want to get rid of these messages,
> running the following after every reboot should be enough:
>=20
>     # echo "none" > /sys/class/leds/fujitsu::radio_led/trigger
>=20
> However, I would appreciate it if you could help us with finding out th=
e
> correct way to detect the radio LED (it may as well turn out it is not
> possible by just checking firmware contents).  For starters, we will
> need your laptop's DSDT table, which you can extract using:
>=20
>     # cat /sys/firmware/acpi/tables/DSDT > dsdt.bin
>=20
> The resulting binary file dsdt.bin is what is needed for further
> analysis.
>=20
> [1] http://www.lpmanual.com/manuals/fujitsu/Fujitsu_LIFEBOOK_E751.pdf
>=20

--=20
I am root. If you see me laughing, you'd better have a backup!


--5pjHmkOoO6eJ0iH7fUM1u3jGwKQJ14PU0--

--t6PqmNRVchX4u1bseILDjIxOspXJ2QInU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRSRNvmxYqoNs6vm0SLlqqYsFRKCQUCWXc2OAAKCRCLlqqYsFRK
CW5yAKCCjS8w7MEcXsepZt/yg671PJOpWwCcCJXN7+5qENNw0RqvLnUgZzLVFE4=
=lF2b
-----END PGP SIGNATURE-----

--t6PqmNRVchX4u1bseILDjIxOspXJ2QInU--
