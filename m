From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [ibm-acpi-devel] [RFC PATCH] thinkpad-acpi: Improve hardware
 volume controls
Date: Tue, 10 May 2011 06:39:14 -0400
Message-ID: <BANLkTikgKj9yBUTLiFVj4tP2LNSzbExo1A@mail.gmail.com>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net> <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
 <20110510010423.GB27107@khazad-dum.debian.net> <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
 <BANLkTinPrPT6YFYtVSyQEj0Nk7E614BYTw@mail.gmail.com> <20110510102734.GB12027@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:59741 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629Ab1EJKje convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 06:39:34 -0400
Received: by pvg12 with SMTP id 12so2764316pvg.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 May 2011 03:39:34 -0700 (PDT)
In-Reply-To: <20110510102734.GB12027@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, May 10, 2011 at 6:27 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Mon, 09 May 2011, Andrew Lutomirski wrote:
>> I read some more of the spec. =A0It looks like the EC sends query 43
>> when the mute status changes.
>>
>> The problem is that _Q43 just calls _UCMS, which issues an SMI but
>> does nothing else. =A0So we don't get notified. =A0And unless we cha=
nge
>> acpi_ec_sync_query to allow more than one handler for the same query=
,
>> we can't even get notified without breaking _Q43. =A0So we're screwe=
d.
>
> We can
>
> 1) attach to _Q43 directly (must be whitelist-based using a quirk lis=
t),
>
> OR
>
> 2) ask Lenovo for _Q43 to call the HKEY notifier chain, which should
> still be possible for the 2011 boxes, and with some luck, the 2010 bo=
xes
> as well.
>
> I will only do (2) after we went through some testing with your patch=
=2E

:)

You might have better luck if you tell Lenovo that, on Windows, you
can unmute the mute button, hit mute on the software mixer, then keep
hitting the mute button and watching as the software and hardware mute
settings stay exactly opposite of each other.  But if we want models
like the X200 to work nicely with volume autocontrol enabled on Linux,
then we probably have to hook the keyboard input and steal the
keypress (or find some magic register that turns off the keypress, but
I'm hesitant to start writing to random EC registers and hoping for
good luck).

--Andy
