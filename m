From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v9 0/4] drivers/platform: Replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Tue, 23 Jan 2018 18:04:37 +0000
Message-ID: <AM4PR05MB33304E4A2C7CC588371EF0EAA2E30@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <20180123041328.GF24956@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-he1eur01on0060.outbound.protection.outlook.com ([104.47.0.60]:27125
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751508AbeAWSEl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jan 2018 13:04:41 -0500
In-Reply-To: <20180123041328.GF24956@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, January 23, 2018 6:13 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v9 0/4] drivers/platform: Replace module x86/mlxcpld-
> hotplug with mellanox/mlxreg-hotplug
>=20
> On Wed, Jan 17, 2018 at 06:21:52PM +0000, Vadim Pasternak wrote:
> > The patchset:
> >  - replaces modules include/linux/platform_data/mlxcpld-hotplug.h and
> >    drivers/platform/x86/mlxcpld-hotplug.c with the modules
> >    include/linux/platform_data/mlxreg.h and
> >    drivers/platform/mellanox/mlxreg-hotplug.c;
> >    relevant Makefile and Kconfig are updated;
> >  - modifies Mellanox hotplug driver for making it architecture
> >    independent. Drivers has been tested for x86 and ARM based systems.
> >  - includes code cleanup;
> >  - introduces regmap interface for mlxreg-hotplug driver to allow hotpl=
ug
> >    event functionality over programmable devices logic, when these devi=
ces
> >    can be attached to different interfaces types, like I2C, LPC, SPI;
> >    driver drivers/platform/x86/mlx-platform.c is updated according to n=
ew
> >    interface.
>=20
> This series is still not dividing up changes into small functional chunks=
. It "ping
> pongs" (adding then later removing code), and makes it difficult to revie=
w
> functional changes by surrounding them with non-functional transformation=
s. As
> I've attempted to break this apart myself, I've discovered a few issues w=
ith the
> code - see the responses to the individual patches.
>=20
> You can find my broken up version here:
> http://git.infradead.org/linux-platform-drivers-
> x86.git/shortlog/refs/heads/review-dvhart-mellanox-v10
>=20
> In particular, please see:
> http://git.infradead.org/linux-platform-drivers-
> x86.git/commit/4f0057fc3da29c04e2cefca9dc5b17577b3e4988
>=20
> Vadim, please respond to my questions re the individual patches, and I'll
> increment the patches in the above branch before pushing this up to testi=
ng.
>=20

Hi Darren,

Thank you for your reviews.

I wanted to take update from your update git, to align the patches with ser=
ies
you pushed to review-dvhart-mellanox-v10.
But I have some issue with=20
cda61cd592ebc9534b9786c337b124a86a6e303f hash:
git remote update
Fetching origin
remote: error: inflate: data stream error (incorrect header check)
remote: error: unable to unpack cda61cd592ebc9534b9786c337b124a86a6e303f he=
ader
remote: fatal: loose object cda61cd592ebc9534b9786c337b124a86a6e303f (store=
d in ./objects/cd/a61cd592ebc9534b9786c337b124a86a6e303f) is corrupt
remote: aborting due to possible repository corruption on the remote side.
fatal: protocol error: bad pack header
error: Could not fetch origin

Same in case I just clone git anew.

I am about to re-send the series started from the patch 2.
I currently dropped the changes related to removing dev_err (from FIXME
platform/mellanox: Remove redundant dev_err messa).
I also added one extra patch between
platform/mellanox: mlxreg-hotplug: Modify to use a=20
and
platform/mellanox: mlxreg-hotplug: Enable building

And I'll not resend=20
platform/x86: mlx-platform: Allow compilation for 32
since it has been moved from the series  as a separate patch.

> --
> Darren Hart
> VMware Open Source Technology Center
