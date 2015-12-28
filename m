From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad ACPI and BIOS option interface
Date: Mon, 28 Dec 2015 11:06:53 -0200
Message-ID: <1451308013.2011008.477636498.1353AE39@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58561 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751915AbbL1NGy convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Dec 2015 08:06:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0DEF52060F
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Dec 2015 08:06:54 -0500 (EST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philipp Kern <pkern@google.com>, platform-driver-x86@vger.kernel.org

(re-send with all HTML stripped for vger.k.o):

On Mon, Dec 28, 2015, at 10:35, Philipp Kern wrote:
> I wrote a kernel module that allows access to BIOS options on Lenovo =
machines using the WMI interface originally intended for Windows and do=
cumented on https://support.lenovo.com/us/en/documents/ht100612. In the=
ory this applies to both laptops and desktops of the Think series, howe=
ver at this point I only care about and tested it on multiple laptops.
>=20
> Now I have a few questions where I'd need some guidance:
>=20
> * Should this live as a part of thinkpad_acpi.c, or should this be a =
separate module? If so, should it live as lenovo-wmi.c, even though it =
is unclear if non-Think-branded products can make use of it? Module aut=
oload could be keyed off the WMI interface, but then the generic name m=
ight hurt again=E2=80=A6

IMHO, it could live as a separate module, and you could name it
something like tp-bioswmi or lenovo-bioswmi, or even a mix of the two
(lenovo-tpbioswmi?). Autoloading will do its job, so it should be mostl=
y
transparent to users anyway, and we don't need to care that much if the
module has an awkward name, as long as it is not *confusing* :p

> * I wrote it so that individual BIOS options are (currrently) exposed=
 as /sys/devices/virtual/lenovowmi/<Option>/value. <Option> is taken li=
terally from Lenovo's list in WMI. Reading that file will give you the =
literal value, which is fine. However writing is - as=20
> documented - a bit awkward if you have a BIOS password set, as you wi=
ll need to pass it with the value. Is this even an appropriate interfac=
e? What would be one, that does not resort to ioctl? Should I let the u=
ser store the BIOS password information in a separate file and store th=
e blob within the module, applying it on every set?

Be careful if you're taking "option" directly from the firmware.=C2=A0 =
IME,
you will eventually hit a UEFI with crap in there, and injecting it int=
o
the sysfs attribute name can cause all sort of insanity.=C2=A0 Always p=
ipe it
through a sanitizing function that is *whitelist* based, and either
reject weird entries, or fix them.=C2=A0 Also, you may hit name uniquen=
ess
issues.=C2=A0 It shouldn't happen, but that doesn't mean it won't happe=
n.

There are several ways to implement the BIOS password thing.=C2=A0 I'd
suggest you go with a well-designed, safer one instead of something tha=
t
looks easy at first glace.=C2=A0 Maybe a kernel keyrings can be used to=
 store
the credential?

Whatever you do, ensure you either require authorization for each
transaction (which means something other than sysfs for sure!), or that
you do it process-based.=C2=A0 If you use a model where you "authorize"=
 the
entire system (echo the password to sysfs node XXX, change parameters
using sysfs, echo nothing to the password node to clear the passsword")=
,
you will create a window where undesired accesses can happen.

> * The interface for setting a new BIOS password or setting the asset =
tag data is different from the BIOS option interface. If I do the above=
 I do not really have a namespace to expose these interfaces anywhere. =
How would I do this?

Maybe if you place everything on subdirs instead of directly on your
main attribute tree it would work better?.=C2=A0 E.g. store the options=
 in
"options/<sanitized_option>"..

--
=C2=A0 "One disk to rule them all, One disk to find them. One disk to b=
ring
=C2=A0 them all and in the darkness grind them. In the Land of Redmond
=C2=A0 where the shadows lie." -- The Silicon Valley Tarot
=C2=A0 Henrique Holschuh
