From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v1 4/4] Documentation/watchdog: Add description of new
 watchdog type 3
Date: Tue, 28 Apr 2020 13:06:27 +0000
Message-ID: <AM6PR05MB616869CBCC863F03538D07FCD9AC0@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
 <20200416163514.7334-5-michaelsh@mellanox.com>
 <20200418114646.GB103392@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200418114646.GB103392-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org" <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, "andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Guenter,

By some reason, I obtained only this your mail as a reply to sent patchset =
V1
Later on, I discovered your comments at=20
https://www.spinics.net/lists/platform-driver-x86/msg21412.html
And saw that you also have comments regarding [PATCH v1 3/4].
I'm resending patchset v2 that address your comments.

Thanks,
    Michael.

> -----Original Message-----
> From: Guenter Roeck <groeck7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> On Behalf Of Guenter Roeck
> Sent: Saturday, April 18, 2020 2:47 PM
> To: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Cc: wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org; andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org; dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org; lin=
ux-
> watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Vadim
> Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Subject: Re: [PATCH v1 4/4] Documentation/watchdog: Add description of ne=
w
> watchdog type 3
>=20
> On Thu, Apr 16, 2020 at 07:35:14PM +0300, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
> > From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> >
> > Add documentation with details of new type of Mellanox watchdog driver.
> >
> > Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> >
>=20
> Stray empty line.
>=20
> Also, the subject should reflect the driver name.
>=20
> Guenter
>=20
> > Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/watchdog/mlx-wdt.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/watchdog/mlx-wdt.rst
> b/Documentation/watchdog/mlx-wdt.rst
> > index bf5bafac47f0..fa0a94e5c82e 100644
> > --- a/Documentation/watchdog/mlx-wdt.rst
> > +++ b/Documentation/watchdog/mlx-wdt.rst
> > @@ -24,10 +24,19 @@ Type 2:
> >    Maximum timeout is 255 sec.
> >    Get time-left is supported.
> >
> > +Type 3:
> > +  Same as Type 2 with extended maximum timeout period.
> > +  Maximum timeout is 65535 sec.
> > +
> >  Type 1 HW watchdog implementation exist in old systems and
> >  all new systems have type 2 HW watchdog.
> >  Two types of HW implementation have also different register map.
> >
> > +Type 3 HW watchdog implementation can exist on all Mellanox systems
> > +with new programmer logic device.
> > +It's differentiated by WD capability bit.
> > +Old systems still have only one main watchdog.
> > +
> >  Mellanox system can have 2 watchdogs: main and auxiliary.
> >  Main and auxiliary watchdog devices can be enabled together
> >  on the same system.
> > --
> > 2.11.0
> >
