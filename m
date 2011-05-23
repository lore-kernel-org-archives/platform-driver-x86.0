From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G
 device when set capability
Date: Mon, 23 May 2011 00:39:36 -0600
Message-ID: <4DDA8DC8020000230002CF41@novprvlin0050.provo.novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
 <1306020834-5186-3-git-send-email-jlee@novell.com>
 <201105220043.58857.carlos@strangeworlds.co.uk>
 <4DD8DF47020000230002CEBE@novprvlin0050.provo.novell.com>
 <BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com
Cc: dtor@mail.ru, Joey Lee <JLee@novell.com>, mjg@redhat.com, carlos@strangeworlds.co.uk, trenn@suse.de, platform-driver-x86@vger.kernel.org

Hi Corentin,=20

=E6=96=BC =E4=B8=80=EF=BC=8C2011-05-23 =E6=96=BC 08:25 +0200=EF=BC=8CCo=
rentin Chary =E6=8F=90=E5=88=B0=EF=BC=9A
> On Sun, May 22, 2011 at 2:02 AM, Joey Lee <jlee@novell.com> wrote:
> > =E6=96=BC =E6=97=A5=EF=BC=8C2011-05-22 =E6=96=BC 00:43 +0100=EF=BC=8C=
Carlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> >> On Sunday 22 May 2011 00:33:52 Lee, Chun-Yi wrote:
> >> > That will be better to check the existence of internal 3G device=
 when
> >> > we set threeg capability and generate killswitch for threeg. It =
can
> >> > avoid userland access 3G rfkill but the machine doesn't have int=
ernal
> >> > 3G device.
> >> >
> >> > Reference: bko#32862
> >> >     https://bugzilla.kernel.org/show_bug.cgi?id=3D32862
> >> >
> >> > Tested on Acer Aspire 8930G, Acer Travelmate 8572
> >> >
> >> > Tested-by: Hector Martin <hector@marcansoft.com>
> >>
> >> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
> >>
> >> If you can now autodetect 3G and already have the relevant rfkill =
device, then
> >> you should also rip out the remaining sysfs support for it as it's=
 no longer
> >> necessary.
> >>
> >> -Carlos
> >
> > Got it!
> > I will send another patch to remove threeg sysfs file.
>=20
> I'm not sure you can drop sysfs files like that, as it will break the=
 ABI.
>=20

Yes, you are right.

> Could you document acer-wmi in
> Documentation/ABI/testing/sysfs-platform-acer-wmi.txt ?
> This allows to check when a sysfs file was added, who use it, etc...
>=20
> Thanks,
>=20

Thank's for your suggestion, I will maintain the ABI document like
sysfs-platform-asus-wmi.=20

But, when can I remove threeg sysfs file?


Thank's
Joey Lee
