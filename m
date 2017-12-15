From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Block comments use * on
 subsequent lines
Date: Fri, 15 Dec 2017 05:17:48 +0000
Message-ID: <BM1PR0101MB144415FCFB23134180481887E60B0@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082105.23082-1-dhaval.shah@softnautics.com>,<CAHp75VeRvQtMOUC2w9GXXwmORDOh5TjSOKZWUwv_Q-Dqxckr1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0107.outbound.protection.outlook.com ([104.47.101.107]:63982
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751136AbdLOFRv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Dec 2017 00:17:51 -0500
In-Reply-To: <CAHp75VeRvQtMOUC2w9GXXwmORDOh5TjSOKZWUwv_Q-Dqxckr1Q@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Andy Shevchenko,

________________________________________
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Thursday, December 14, 2017 11:29 PM
> To: Dhaval Shah
> Cc: Pali Roh=E1r; Mario Limonciello; dvhart@infradead.org; Andy Shevchenk=
o; Platform Driver; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] platform/x86: dell-smbios: Block comments use * on s=
ubsequent lines
>=20
> On Wed, Dec 13, 2017 at 10:21 AM, Dhaval Shah
> <dhaval.shah@softnautics.com> wrote:
> > Resolved Block comments use * on subsequent lines checkpatch warnings.
> > Issue found by checkpatch.
> >
>=20
> Same comments as for the other like this
>=20

This changes will not affect the functionality but improves the code readab=
ility.

> > Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> > ---
> >  drivers/platform/x86/dell-smbios.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
> > index 6a60db515bda..25a296c90e08 100644
> > --- a/drivers/platform/x86/dell-smbios.c
> > +++ b/drivers/platform/x86/dell-smbios.c
> > @@ -353,7 +353,8 @@ static void __init parse_da_table(const struct dmi_=
header *dm)
> >                 container_of(dm, struct calling_interface_structure, he=
ader);
> >
> >         /* 4 bytes of table header, plus 7 bytes of Dell header, plus a=
t least
> > -          6 bytes of entry */
> > +        * 6 bytes of entry
> > +        */
> >
> >         if (dm->length < 17)
> >                 return;
> > --
> > 2.11.0
> >
