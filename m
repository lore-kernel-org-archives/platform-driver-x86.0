From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 1/4] acer-wmi: does not allow negative number set
 to initial device state
Date: Sat, 21 May 2011 17:43:02 -0600
Message-ID: <4DD8DAA6020000230002CEAE@novprvlin0050.provo.novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
 <201105220038.19817.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201105220038.19817.carlos@strangeworlds.co.uk>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: corentincj@iksaif.net, dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

=E6=96=BC =E6=97=A5=EF=BC=8C2011-05-22 =E6=96=BC 00:38 +0100=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Sunday 22 May 2011 00:33:51 Lee, Chun-Yi wrote:
> > The driver set module parameter value: mailled, threeg and brightne=
ss
> > to BIOS by evaluate wmi method when driver was initialled. The defa=
ult
> > values for those parameters are -1, so, that will be better don't s=
et
> > negative value to BIOS.
> >=20
> > Reference: bko#32862
> >         https://bugzilla.kernel.org/show_bug.cgi?id=3D32862
> >=20
> > Tested on Acer Aspire 8930G, Acer Travelmate 8572
> >=20
> > Tested-by: Hector Martin <hector@marcansoft.com>
>=20
> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
>=20
> -Carlos

Thank's for Carlos's acked.

Joey Lee
