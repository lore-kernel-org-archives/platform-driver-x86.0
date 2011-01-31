From: "Joey Lee" <jlee@novell.com>
Subject: Re: Rfkill always soft/hard blocked upon boot
Date: Mon, 31 Jan 2011 03:21:37 -0700
Message-ID: <4D4727E10200002300027EDF@novprvlin0050.provo.novell.com>
References: <4D455DC1.6010909@pardus.org.tr>
 <4D45B338.8010802@lwfinger.net> <4D45B776.4000403@pardus.org.tr>
 <4D46B4340200002300027E82@novprvlin0050.provo.novell.com>
 <4D467AFC.7090503@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D467AFC.7090503@pardus.org.tr>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ozan@pardus.org.tr
Cc: Larry.Finger@lwfinger.net, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Oza,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-01-31 =E6=96=BC 11:03 +0200=EF=BC=8COz=
an =C3=87a=C4=9Flayan =E6=8F=90=E5=88=B0=EF=BC=9A
> On 31.01.2011 04:08, Joey Lee wrote:
>=20
> > Does it possible share your machine's model name, dmidecode and
> > acpidump?
>=20
> Yes of course. I have the acpidump and dmidecode outputs but I could =
not=20
> extract the tables from the acpidump output. It gave an error about t=
he=20
> table headers and their lengths.
>=20

No, I CAN dump the tables from your acpidump result, you need:

(assume you save the dump result to acpidump-test.dat)
acpixtract acpidump-test.dat
iasl -d DSDT.dsl

> This is a local (Turkish) brand laptop. The manufacturer is Casper.=20
> Model is Nirvana i7 (Casper Nirvana i7 CNTKI-620A). It can be an exac=
t=20
> clone-copy of a popular laptop as it happens with these no-name stuff=
=2E
>=20
> acpidump:
>   http://bugs.pardus.org.tr/attachment.cgi?id=3D6673
>=20
> dmidecode:
>   http://bugs.pardus.org.tr/attachment.cgi?id=3D6674
>=20
>=20

Sorry, I am not good for this platform, but will check your DSDT.


Thank's
Joey Lee
>=20
>=20
>=20
