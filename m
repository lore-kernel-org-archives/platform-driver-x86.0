From: <Mario.Limonciello@dell.com>
Subject: RE: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
Date: Mon, 12 Mar 2018 22:42:01 +0000
Message-ID: <4cce64d16cab4d499dca9347c1a1f30c@ausx13mpc120.AMER.DELL.COM>
References: <20180312185357.GA1672@light.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312185357.GA1672@light.dominikbrodowski.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux@dominikbrodowski.net, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]
> Sent: Tuesday, March 13, 2018 2:54 AM
> To: dvhart@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Dell Inc. XPS 13 9343/0TM99H fails to boot v4.16-rc5
>=20
> Mario,
>=20
> unfortunately, my Dell Inc. XPS 13 9343/0TM99H, BIOS A11 12/08/2016 fails=
 to
> boot v4.16-rc5. More exactly, I could bisect it down to commit 25d47027e1=
0
> ("platform/x86: dell-smbios: Link all dell-smbios-* modules together").
> Usually, I have enabled
>=20
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_DELL_SMBIOS=3Dy
> CONFIG_DELL_SMBIOS_WMI=3Dy
> CONFIG_DELL_SMBIOS_SMM=3Dy
> CONFIG_DELL_LAPTOP=3Dy
> CONFIG_DELL_WMI=3Dy
> CONFIG_DELL_WMI_DESCRIPTOR=3Dy
> # CONFIG_DELL_WMI_AIO is not set
> # CONFIG_DELL_WMI_LED is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_DELL_RBTN is not set
> # CONFIG_DELL_RBU is not set
>=20
> For v4.16-rc5 to work, I need to manually disable DELL_SMBIOS_WMI:
>=20
> -CONFIG_DELL_SMBIOS_WMI=3Dy
> +# CONFIG_DELL_SMBIOS_WMI is not set
>=20
> Any ideas?
>=20
Dominick,

Interesting.  Can you please change CONFIG_DELL_SMBIOS to a module
and see if that behavior persists?  If it does, can you please blacklist it=
 on
the kernel command line and try to load it manually and share any
backtrace?

Thanks,
