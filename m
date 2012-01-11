From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: check wireless capability on AMW0_GUID2
 machines
Date: Wed, 11 Jan 2012 12:26:39 +0800
Message-ID: <1326255999.16788.40.camel@linux-s257.site>
References: <1326090677-25942-1-git-send-email-jlee@suse.com>
	 <3474148.WRXZ4siLlh@valkyrie> <1326103224.24116.282.camel@linux-s257.site>
	 <4607313.aZXtt4raMe@valkyrie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:50841 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932520Ab2AKEa0 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Tue, 10 Jan 2012 23:30:26 -0500
In-Reply-To: <4607313.aZXtt4raMe@valkyrie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

=E6=96=BC =E4=B8=80=EF=BC=8C2012-01-09 =E6=96=BC 22:15 +0000=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Monday 09 Jan 2012 18:00:24 joeyli wrote:
> > I just checked and found I also have no AMW0_GUID2 machines on my h=
and,
> > now.
> > I have some questions about AMW0_GUID2:
> >=20
> >   + Why we enabled wireless capability in acer-wim if a non-acer ma=
chine has
> > AMW0_GUID2 ?
>=20
> IIRC, there were some bug reports on non-Acer hardware (I don't think=
 this=20
> involved Acer hardware, but this was some time ago...) where the wire=
less=20
> detection wasn't working with this, but if we forced it on, it worked=
 fine.
>=20

Yes, in acer-wmi supported some non-acer machine by quirk and read EC
register. That means we need find out EC register reflect to wifi RF
state if we are lucky.

Unfortunately, direct enable wireless capability causes some non-acer
machines' wireless rfkill always disabled. e.g. Lenovo E520

https://bugzilla.redhat.com/show_bug.cgi?id=3D674353=20

If we don't check the wireless capability, then they need manually add
acer-wmi to backlist. On some lenovo machines, ideapad-laptop driver
should support by lenovo's ACPI method.

> >   + I saw there have some magic number when you access AMW0_GUID1 (=
e.g.
> > 0x9610, eax, ebx, ecx) Could you please kindly teach me how can gra=
b those
> > value for AMW0_GUID2? Does there have any useful dump or report log=
 can
> > provide by hardware owner?
>=20
> Probably not. For AMW0_GUID1, I got the stuff by using the Windows Ke=
rnel=20
> Debugger remotely to see what my laptop was doing when changing thing=
s in=20
> Windows - unfortunately that relied on a firewire port on the laptop,=
 which I=20
> suspect most people don't have.
>=20

Thanks for your teach, but I never used Windows Kernel Debugger, if hav=
e
good chance, I will try.

Most of the state, bug reporter already removed OEM(Acer/Lenovo...)
specific Windows and hard to remote debug the machine.

> The real problem is that I know almost nothing about AMW0_GUID2 - eit=
her what=20
> it's used for or what it actually does, nor how hardware detection wo=
rks with=20
> it present (if at all).
>=20
> -Carlos
>=20

I also don't have any information about AMW0_GUID2, almost all modern
Acer machine already removed AMW0_GUID2.

My humbly request is:
Please kindly accept this patch to acer-wmi, it can leave the wireless
rfkill state control by BIOS or other platform driver, and don't need
manually add acer-wmi to blacklist.


Thanks a lot!
Joey Lee
