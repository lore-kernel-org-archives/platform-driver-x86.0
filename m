From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G
 device when set capability
Date: Sat, 21 May 2011 18:02:47 -0600
Message-ID: <4DD8DF47020000230002CEBE@novprvlin0050.provo.novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
 <1306020834-5186-3-git-send-email-jlee@novell.com>
 <201105220043.58857.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201105220043.58857.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: corentincj@iksaif.net, dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

=E6=96=BC =E6=97=A5=EF=BC=8C2011-05-22 =E6=96=BC 00:43 +0100=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Sunday 22 May 2011 00:33:52 Lee, Chun-Yi wrote:
> > That will be better to check the existence of internal 3G device wh=
en
> > we set threeg capability and generate killswitch for threeg. It can
> > avoid userland access 3G rfkill but the machine doesn't have intern=
al
> > 3G device.
> >=20
> > Reference: bko#32862
> > 	https://bugzilla.kernel.org/show_bug.cgi?id=3D32862
> >=20
> > Tested on Acer Aspire 8930G, Acer Travelmate 8572
> >=20
> > Tested-by: Hector Martin <hector@marcansoft.com>
>=20
> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
>=20
> If you can now autodetect 3G and already have the relevant rfkill dev=
ice, then=20
> you should also rip out the remaining sysfs support for it as it's no=
 longer=20
> necessary.
>=20
> -Carlos

Got it!
I will send another patch to remove threeg sysfs file.


Thank's a lot!
Joey Lee
