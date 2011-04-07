From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: Fix capitalisation of GUID in module
 alias
Date: Thu, 07 Apr 2011 07:09:47 -0600
Message-ID: <4D9E443B020000230002AFE6@novprvlin0050.provo.novell.com>
References: <1302082806-11807-1-git-send-email-jlee@novell.com>
 <BANLkTinCdB8YVus2VBO4VX_ccSN5UWV1SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <BANLkTinCdB8YVus2VBO4VX_ccSN5UWV1SA@mail.gmail.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: mjg@redhat.com, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-04-07 =E6=96=BC 13:10 +0200=EF=BC=8CPa=
li Roh=C3=A1r =E6=8F=90=E5=88=B0=EF=BC=9A
> 2011/4/6 Lee, Chun-Yi <joeyli.kernel@gmail.com>:
> > wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3 needs to be
> > wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 in module alias for acer-w=
mi is
> > automatically loaded.
> >
> > Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> > Cc: Matthew Garrett <mjg@redhat.com>
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index 0b23b75..fa8fa73 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -89,7 +89,7 @@ MODULE_LICENSE("GPL");
> >  #define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D14026"
> >
> >  MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
> > -MODULE_ALIAS("wmi:6AF4F258-B401-42Fd-BE91-3D4AC2D7C0D3");
> > +MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");
> >  MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
> >
> >  enum acer_wmi_event_ids {
> > --
> > 1.6.0.2
> >
> >
>=20
> Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20

Thank's for Pali's testing. :-)

Joey Lee
