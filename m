From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [platform-drivers-x86:for-next 1/1] ERROR:
 "devm_hwmon_device_register_with_groups"
 [drivers/platform/x86/mlxcpld-hotplug.ko] undefined!
Date: Mon, 24 Oct 2016 05:32:21 +0000
Message-ID: <AM5PR0501MB2097DE5CB795F200E5841D4BA2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <201610230328.IieEHVjC%fengguang.wu@intel.com>
 <20161023145025.GB120221@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0057.outbound.protection.outlook.com ([104.47.2.57]:17792
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755203AbcJXFcZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2016 01:32:25 -0400
In-Reply-To: <20161023145025.GB120221@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, kbuild test robot <fengguang.wu@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Sunday, October 23, 2016 5:50 PM
> To: kbuild test robot <fengguang.wu@intel.com>
> Cc: Vadim Pasternak <vadimp@mellanox.com>; kbuild-all@01.org; platform-
> driver-x86@vger.kernel.org; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>
> Subject: Re: [platform-drivers-x86:for-next 1/1] ERROR:
> "devm_hwmon_device_register_with_groups" [drivers/platform/x86/mlxcpld-
> hotplug.ko] undefined!
>=20
> On Sun, Oct 23, 2016 at 03:07:36AM +0800, kbuild test robot wrote:
> > tree:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86=
.git for-
> next
> > head:   3c294d95beca17846eee58084ec92553ec2af009
> > commit: 3c294d95beca17846eee58084ec92553ec2af009 [1/1] platform/x86:
> > Introduce support for Mellanox hotplug driver
> > config: x86_64-randconfig-x005-201643 (attached as .config)
> > compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> > reproduce:
> >         git checkout 3c294d95beca17846eee58084ec92553ec2af009
> >         # save the attached .config to linux build tree
> >         make ARCH=3Dx86_64
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ERROR: "devm_hwmon_device_register_with_groups"
> [drivers/platform/x86/mlxcpld-hotplug.ko] undefined!
>=20
> Vadim, please prioritize a fix for this issue and submit it as a stand-al=
one fix. I
> will likely roll it in to the existing patch to avoid breaking builds, bu=
t I'd like to
> review the patch independently.
>=20


Hi Darren,

I already sent a stand-alone fix for this issue.
Is this fix OK or you like me to do it in other way?

Thanks,
Vadim.

>=20
> --
> Darren Hart
> Intel Open Source Technology Center
