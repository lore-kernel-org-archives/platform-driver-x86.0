From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-smo8800: Possible unnecessary 'out of
 memory' message
Date: Wed, 13 Dec 2017 09:40:14 +0000
Message-ID: <BM1PR0101MB14445D157BF6CF2BCC908BDBE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082354.23273-1-dhaval.shah@softnautics.com>,<20171213083053.mywa4bgv56daxud6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0092.outbound.protection.outlook.com ([104.47.101.92]:45513
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750880AbdLMJkT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 04:40:19 -0500
In-Reply-To: <20171213083053.mywa4bgv56daxud6@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Pali Rohar,

Thanks for the review.

________________________________________
> From: Pali Roh=E1r <pali.rohar@gmail.com>
> Sent: Wednesday, December 13, 2017 2:00 PM
> To: Dhaval Shah
> Cc: dvhart@infradead.org; andy@infradead.org; platform-driver-x86@vger.ke=
rnel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] platform/x86: dell-smo8800: Possible unnecessary 'ou=
t of memory' message
>=20
> On Wednesday 13 December 2017 13:53:54 Dhaval Shah wrote:
> > Removed Possible unnecessary 'out of memory' message checkpatch warning=
s.
> > Issue found by checkpatch.
> >
> > Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> > ---
> >  drivers/platform/x86/dell-smo8800.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86=
/dell-smo8800.c
> > index 1d87237bc731..9590d5e7c5ca 100644
> > --- a/drivers/platform/x86/dell-smo8800.c
> > +++ b/drivers/platform/x86/dell-smo8800.c
> > @@ -150,10 +150,8 @@ static int smo8800_add(struct acpi_device *device)
> >       struct smo8800_device *smo8800;
> >
> >       smo8800 =3D devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERN=
EL);
> > -     if (!smo8800) {
> > -             dev_err(&device->dev, "failed to allocate device data\n")=
;
>=20
> Hi! Any particular reason for removing error message?
>=20
When you give the -ENOMEM as error in return then this message info will be=
 provided by the kernel subsystem. no need to give this printk and that's w=
hy checkpatch gives warning in this case.
> > +     if (!smo8800)
> >               return -ENOMEM;
> > -     }
> >
> >       smo8800->dev =3D &device->dev;
> >       smo8800->miscdev.minor =3D MISC_DYNAMIC_MINOR;
