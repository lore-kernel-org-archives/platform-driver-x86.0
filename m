From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH 0/3] platform/x86: dell-laptop: All the warnings are
 resolved.
Date: Fri, 15 Dec 2017 05:15:15 +0000
Message-ID: <BM1PR0101MB14443B072F71BF4CB1F85100E60B0@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213081309.22851-1-dhaval.shah@softnautics.com>,<CAHp75VfTO9iCVFhddb1WHCL8RPKTVT7OhdOwvHJNy60V93wy0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0102.outbound.protection.outlook.com ([104.47.101.102]:15555
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751034AbdLOFPT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Dec 2017 00:15:19 -0500
In-Reply-To: <CAHp75VfTO9iCVFhddb1WHCL8RPKTVT7OhdOwvHJNy60V93wy0A@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Andy Shevchenko,

Thanks for the review.
________________________________________
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Thursday, December 14, 2017 11:29 PM
> To: Dhaval Shah
> Cc: Matthew Garrett; Pali Roh=E1r; Andy Shevchenko; Platform Driver; linu=
x-kernel@vger.kernel.org
> Subject: Re: [PATCH 0/3] platform/x86: dell-laptop: All the warnings are =
resolved.
>=20
> On Wed, Dec 13, 2017 at 10:13 AM, Dhaval Shah
> <dhaval.shah@softnautics.com> wrote:
> > There are total three types of warnings are resolved.
> > First patch  : Block comments use * on subsequent lines
> > Second patch : Missing a blank line after declarations
> > third patch  : braces {} are not necessary for single statement blocks.
> >
>=20
> Can we survive without this? Does it break build or alike?
>=20
Yes. We can survive without this. It will not break build or alike. This ch=
anges will not affects the functionality of the code.
But, it overall improves the code readability.
>=20
> > Dhaval Shah (3):
> >   platform/x86: dell-laptop: Block comments use * on subsequent lines
> >   platform/x86: dell-laptop: Missing a blank line after declarations
> >   platform/x86: dell-laptop: braces {} are not necessary for single
> >     statement blocks
> >
> >  drivers/platform/x86/dell-laptop.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > --
> > 2.11.0
> >
