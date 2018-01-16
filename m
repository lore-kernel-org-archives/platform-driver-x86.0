From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v8 2/3] platform/mellanox: mlxreg-hotplug: allow driver
 for ARM architecture
Date: Tue, 16 Jan 2018 08:06:33 +0000
Message-ID: <AM4PR05MB3330579046971991B10D6C46A2EA0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-3-git-send-email-vadimp@mellanox.com>
 <20180116034313.GC4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve1eur01on0072.outbound.protection.outlook.com ([104.47.1.72]:37152
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750890AbeAPIGg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Jan 2018 03:06:36 -0500
In-Reply-To: <20180116034313.GC4590@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, January 16, 2018 5:43 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v8 2/3] platform/mellanox: mlxreg-hotplug: allow driv=
er for
> ARM architecture
>=20
> On Thu, Jan 11, 2018 at 08:58:42AM +0000, Vadim Pasternak wrote:
> > It allows driver to run on x86 and ARM architecture based systems.
> > Also some unnecessary includes are removed.
>=20
> Hi Vadim,
>=20
> These changes are not all readily mapped to this description, nor to the
> changelog below.
>=20
> Only the kconfig change is obviously linked to building on ARM and not ju=
st x86.
>=20
> Things like the removal of the dev_err messages and the relocation of the=
 create
> and destroy methods seem entirely unrelated to building on ARM.
>=20
> I'd like to get this merged sooner rather than later as it has been linge=
ring for
> quite some time now - can you provide some more detail about how the
> changes included in this patch are needed to make this driver build on AR=
M?

Yes. Right.
Should I split it to two separate patches, one only with Kconfig changes an=
d the
second with text like:
Remove some unnecessary includes;
Remove dev_err message;
Change filed bus to nr for consistency with kernel definitions;

>=20
> Thanks,
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
