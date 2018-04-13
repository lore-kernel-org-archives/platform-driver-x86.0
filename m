From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 4/7] platform: mellanox: add new ODM system types to
 mlx-platform
Date: Fri, 13 Apr 2018 19:53:31 +0000
Message-ID: <AM6PR0502MB3752A6F66062DF33C4319BABA2B30@AM6PR0502MB3752.eurprd05.prod.outlook.com>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-5-git-send-email-vadimp@mellanox.com>
 <20180413165433.GF27560@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180413165433.GF27560@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Friday, April 13, 2018 7:55 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v1 4/7] platform: mellanox: add new ODM system types =
to
> mlx-platform
>=20
> On Tue, Mar 27, 2018 at 10:02:04AM +0000, Vadim Pasternak wrote:
> > Patch adds new ODM systems, matched according to DMI_BOARD_NAME.
>=20
> General nit. When writing your messages, please use the imperative (comma=
nd)
> form. Rather than:
>=20
> "Patch adds" or "It changes" use the same form you use in the subject lin=
es:
>=20
> "Add new ODM systems", "Fix struct field documentation", etc.
>=20
> Again, I've been rewriting these, but as a regular contributor, this will=
 help
> reduce the overhead of reviewing your patches - good for you, good for me=
 :-)
>=20
> > The supported ODM Ids are: VMOD0001, VMOD0002, VMOD0003,
> VMOD0004,
> > VMOD0005. It doesn't introduce new systems, but allows to ODM
> > companies to set DMI_BOARD_VENDOR and DMI_PRODUCT_NAME on their
> own.
> > It assumes that ODM company can't change DMI_BOARD_NAME.
>=20
> You said "it assumes that ODM companies can't change DMI_BOARD_NAME". Is
> that an assumption, or is that how ODMs work with Mellanox?

Till now ODM companies didn't care about SMBIOS content.
But now we have two, which want to overwrite BOARD_VENDOR and=20
PRODUCT_NAME (and some other fields).
System manufacturing for ODM is provided by Mellanox, so Mellanox
production team is responsible for setting all these fields.

Both don't care about BOARD_NAME and it has been closed with them,
that content of this filed will be defined by Mellanox.

> --
> Darren Hart
> VMware Open Source Technology Center
