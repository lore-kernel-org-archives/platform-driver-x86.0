From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure for
 Punit
Date: Tue, 8 Dec 2015 14:59:15 -0800
Message-ID: <20151208225915.GA14939@malice.jf.intel.com>
References: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
 <20151207234514.GA12897@malice.jf.intel.com>
 <1449579438.30729.48.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51885 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbbLHW7S (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Dec 2015 17:59:18 -0500
Content-Disposition: inline
In-Reply-To: <1449579438.30729.48.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

On Tue, Dec 08, 2015 at 02:57:18PM +0200, Andy Shevchenko wrote:
> On Mon, 2015-12-07 at 15:45 -0800, Darren Hart wrote:
> > On Tue, Dec 08, 2015 at 12:55:04AM +0800, Qipeng Zha wrote:

=2E..

>=20
> > > =A0
> > > =A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > > -				=A0=A0=A0=A0PLAT_RESOURCE_PUNIT_INTER_INDE
> > > X);
> > > +				=A0=A0=A0=A0PLAT_RES_PUNIT_BIOS_INTER_INDE
> > > X);
> > > =A0	if (!res) {
> > > -		dev_err(&pdev->dev, "Failed to get punit inter
> > > resource\n");
> > > +		dev_err(&pdev->dev, "Failed to get res of punit
> > > BIOS inter\n");
>=20
> Darren, can you improve this phrasing, I didn't get what this message
> about?

I wasn't going to mention this unless there was sure to be a v9, it see=
ms that
is likely, so...

Qipeng, in order to ensure the message to the user is clear, it is impo=
rtant not
to use abbreviations (especially non-obvious ones) like "inter" and "re=
s". Note that the user will not necessarily have the sourcecode handy f=
or context.

I believe this message is just attempting to the user that the
platform_get_resource message failed for some reason when attempting to=
 get the
ACPI provided resource for the BIOS interface resource. There are two r=
esources
for each, interface and data.

Without knowing the details of the internals, I would think the followi=
ng might
be a better message?

	dev_err(&pdev->dev, "Failed to get punit BIOS interface platform resou=
rce\n");

Similarly for all these messages.

--=20
Darren Hart
Intel Open Source Technology Center
