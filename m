From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Wed, 2 Mar 2011 21:09:51 +0000
Message-ID: <201103022109.51600.carlos@strangeworlds.co.uk>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:37269 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755799Ab1CBVKC convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Mar 2011 16:10:02 -0500
Received: by wyg36 with SMTP id 36so435575wyg.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Mar 2011 13:10:00 -0800 (PST)
In-Reply-To: <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wednesday 02 Mar 2011 08:53:55 Joey Lee wrote:
> =E6=96=BC =E4=B8=80=EF=BC=8C2011-01-03 =E6=96=BC 20:49 +0000=EF=BC=8C=
Matthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
>=20
> > It looks like this GUID is present in a surprisingly wide range of
> > devices (eg, http://pastebin.com/8BY0Dg64 from a Vaio...), which me=
ans
> > that it's probably not a safe assumption that reading from the EC w=
ill
> > give us reasonable results. Do the Acer drivers definitely do that,
> > rather than there being some SMI that returns the data?
>=20
> The AMW0 in acer-wmi not just used by acer machines:
>=20
> #define AMW0_GUID1              "67C3371D-95A3-4C37-BB61-DD47B491DAAB=
"
>=20
> It was also included in Lenovo Ideapad S12 and Vaio machines' DSDT. F=
or
> Lenovo Ideapad, that will be better handle by ideapad-laptop driver.

They might not be - Matthew's original question still stands. The old A=
MW0 was=20
just a funny wrapper for direct BIOS calls - maybe we just need a diffe=
rent=20
call here?

What does Acer do - are they poking the EC directly, or is the call to =
AMW0=20
just different for these machines?

> Could we just direct add those model to the blacklist in acer-wmi
> driver? or we direct check dmi in acer-wmi for only support Acer
> machines that were included AMW0 in DSDT?

Interesting. If we can't autodetect whether it's a dummy interface or n=
ot,=20
then, we should change acer-wmi to whitelist what it does support - Ace=
r,=20
=46ujistu Siemens and Medion - rather than trying to blacklist every ve=
ndor that=20
crops up.

-Carlos
