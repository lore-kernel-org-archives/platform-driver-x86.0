From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
 auto detection functionalities
Date: Sat, 17 Feb 2018 05:08:12 +0000
Message-ID: <AM4PR05MB33305DC442CCB25AF280F0B5A2CA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
 <20180216013237.GC5786@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-eopbgr50048.outbound.protection.outlook.com ([40.107.5.48]:54689
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750959AbeBQFIP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Feb 2018 00:08:15 -0500
In-Reply-To: <20180216013237.GC5786@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, February 16, 2018 3:33 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; platform-
> driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; jiri@resnulli.u=
s;
> Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed =
and
> auto detection functionalities
>=20
> On Tue, Feb 13, 2018 at 10:09:32PM +0000, Vadim Pasternak wrote:
> > This patchset:
> > - Adds define for the channels number for mux device.
> > - Adds differed bus functionality.
> > - Changes input for device create routine in mlxreg-hotplug driver.
> > - Adds physical bus number auto detection.
>=20
> Hi Vadim,

Hi Darren,

>=20
> We are now in the RC cycle for 4.16. Do you consider these changes to be
> "fixes" that need to be included in 4.16? It was difficult to tell from t=
he commit
> messages how severe some of the possible issues were.

I actually considered these patches for the next, having in mind that 4.16 =
is
already closed.

>=20
> I'm concerned about the level of testing seen by the previous patch serie=
s if we
> are getting these changes so soon after they were merged.
> Can you comment on why these are being discovered now - and how confident
> are we in the drivers with these changes applied?

These patches has been tested on the all relevant platforms.
It has been discovered some time ago and it was in my plans to submit these
patches after the previous series.

Do you think it's better to consider this series as a bug fix, and target i=
t to
4.16?

Thanks,
Vadim.

>=20
> >
> > Vadim Pasternak (4):
> >   platform/x86: mlx-platform: Use define for the channel numbers
> >   platform/x86: mlx-platform: Add differed bus functionality
> >   platform/mellanox: mlxreg-hotplug: Change input for device create
> >     routine
> >   platform/x86: mlx-platform: Add physical bus number auto detection
> >
> >  drivers/platform/mellanox/mlxreg-hotplug.c | 31 +++++++++-----
> >  drivers/platform/x86/mlx-platform.c        | 68
> ++++++++++++++++++++++++++++--
> >  include/linux/platform_data/mlxreg.h       |  4 ++
> >  3 files changed, 90 insertions(+), 13 deletions(-)
> >
> > --
> > 2.1.4
> >
> >
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
