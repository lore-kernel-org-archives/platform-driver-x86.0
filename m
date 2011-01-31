From: "Joey Lee" <jlee@novell.com>
Subject: Re: Rfkill always soft/hard blocked upon boot
Date: Sun, 30 Jan 2011 19:08:04 -0700
Message-ID: <4D46B4340200002300027E82@novprvlin0050.provo.novell.com>
References: <4D455DC1.6010909@pardus.org.tr>
 <4D45B338.8010802@lwfinger.net> <4D45B776.4000403@pardus.org.tr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4D45B776.4000403@pardus.org.tr>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ozan@pardus.org.tr
Cc: Larry.Finger@lwfinger.net, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Ozan,=20

=E6=96=BC =E6=97=A5=EF=BC=8C2011-01-30 =E6=96=BC 21:09 +0200=EF=BC=8COz=
an =C3=87a=C4=9Flayan =E6=8F=90=E5=88=B0=EF=BC=9A
> On 30.01.2011 20:51, Larry Finger wrote:
>=20
> > The nature of that Fn-F2 key depends on how the motherboard manufac=
turer coded
> > their BIOS. Most do it as a toggle and use some WMI (Windows Manage=
ment
> > Interface) code to initialize it on boot up. As this no-name laptop=
 is unlikely
> > to have a WMI driver the way that name brands do, it probably gener=
ates a
> > keystroke. That is easy to check - Use CTRL-ALT-F1 to switch to a c=
onsole, log
> > in, and issue the command "showkey". Is a keycode returned when Fn-=
=462 is pressed?
>=20
> Hmm I've got it. So maybe taking look at the ACPI tables/WMI block ca=
n=20
> reveal a way to initialize the toggle? I'm not really experienced in=20
> these things but I'll take a look out of curiosity.
>=20
> Thanks!
>=20
>=20

Does it possible share your machine's model name, dmidecode and
acpidump?


Thank's
Joey Lee
