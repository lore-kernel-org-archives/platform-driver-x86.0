From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Wed, 02 Mar 2011 01:53:55 -0700
Message-ID: <4D6EA053020000230002943D@novprvlin0050.provo.novell.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com>
 <201012301004.29531.carlos@strangeworlds.co.uk>
 <20110103204910.GA4223@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110103204910.GA4223@srcf.ucam.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Hi Carlos,=20

Sorry bother you for this old issue.

=E6=96=BC =E4=B8=80=EF=BC=8C2011-01-03 =E6=96=BC 20:49 +0000=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> It looks like this GUID is present in a surprisingly wide range of=20
> devices (eg, http://pastebin.com/8BY0Dg64 from a Vaio...), which mean=
s=20
> that it's probably not a safe assumption that reading from the EC wil=
l=20
> give us reasonable results. Do the Acer drivers definitely do that,=20
> rather than there being some SMI that returns the data?
>=20

The AMW0 in acer-wmi not just used by acer machines:

#define AMW0_GUID1              "67C3371D-95A3-4C37-BB61-DD47B491DAAB"

It was also included in Lenovo Ideapad S12 and Vaio machines' DSDT. For
Lenovo Ideapad, that will be better handle by ideapad-laptop driver.=20

Could we just direct add those model to the blacklist in acer-wmi
driver? or we direct check dmi in acer-wmi for only support Acer
machines that were included AMW0 in DSDT?

Appreciate if you can give any suggestion.


Thank's a lot!
Joey Lee
