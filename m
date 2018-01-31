From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH 11/11] platform/x86: mlx-platform: Add hotplug platform
 driver un-registration for faulty flow
Date: Wed, 31 Jan 2018 21:02:43 +0000
Message-ID: <AM4PR05MB3330F82F4BDA3BCA90351C90A2FB0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1517435713-124919-1-git-send-email-vadimp@mellanox.com>
 <20180131205932.GA21498@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]:43665
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751844AbeAaVCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 Jan 2018 16:02:46 -0500
In-Reply-To: <20180131205932.GA21498@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, January 31, 2018 11:00 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [PATCH 11/11] platform/x86: mlx-platform: Add hotplug platfo=
rm
> driver un-registration for faulty flow
>=20
> On Wed, Jan 31, 2018 at 09:55:13PM +0000, Vadim Pasternak wrote:
> > Add hotplug platform driver un-registration in case regmap cache
> > synchronization failed. In such case hotplug platform driver
> > registration should be rolled back.
>=20
> Queued up, thanks Vadim.

Thank you.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
