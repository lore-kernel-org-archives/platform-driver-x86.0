From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
 auto detection functionalities
Date: Fri, 23 Mar 2018 15:59:22 +0000
Message-ID: <HE1PR0502MB37532883C411EA1BA9871443A2A80@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
 <20180322235541.GD24138@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322235541.GD24138@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, March 23, 2018 1:56 AM
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
> >
> > Vadim Pasternak (4):
> >   platform/x86: mlx-platform: Use define for the channel numbers
> >   platform/x86: mlx-platform: Add differed bus functionality
> >   platform/mellanox: mlxreg-hotplug: Change input for device create
> >     routine
> >   platform/x86: mlx-platform: Add physical bus number auto detection
>=20
> Vadim,
>=20
> I have rewritten most of the commit messages after parsing through them a=
nd
> reviewing the code. I believe they are much more concise now, and make th=
e
> intent of the patches much clearer. I have not changed the patch content =
(code).
>=20
> Please review the commit messages for the top 4 commits:
> http://git.infradead.org/linux-platform-drivers-
> x86.git/shortlog/refs/heads/review-dvhart-mellanox
>=20
> Does this still match your intent?
>=20

Hi Darren,
Thank you very much for review.

Looks good.

Thanks,
Vadim.

> --
> Darren Hart
> VMware Open Source Technology Center
