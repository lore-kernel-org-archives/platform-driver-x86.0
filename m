Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4537F742
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098328; cv=none; b=cXfTkhfUPCB5JftUjCGH50u/iXoiryJjSk/jfwp+Aok9JZ1FPYQ5uehr1+cqkT4fynmuzlvNWjBQqCIj4+qdN5WmwFLhMo005PjNFUZcDZSE3XIR3ttTP8g7T2ArskNX9PUPwYgHj//vW6pfbbHajCcdPzVLQrtawiafxazZWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098328; c=relaxed/simple;
	bh=t9wIJ+xZk9MiE//CJpppk56EI9cfiidvL57l7ftrMXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saG3LLQVcrFEkim/d97+3+y3WFp3RCzon2VuYn1RmsxVjQP16EXJI+ybZ0rJDFBgO40O2YA9lNbNLef70Wn/XZhV+RkCm92JGjYvFiftz0PuqY92k/5nm6BHz9rLEwuz50woka8na16crMU8n1lL2Ty1zVjhcjaFGxDaYvb8DjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RNYAfDLt; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RNYAfDLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792098316; x=1792703116; i=w_armin@gmx.de;
	bh=NyxRkI/Lb5l94MfAd3jzJZZ/HTfRtN4sHjG/vG/RfcQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RNYAfDLtTqsJ8vCMhVIdpv8CgeGyu3iJogAJZuj0ktqN3wpXaXmdaTRQ6K61cAvN
	 3wvtwejMQdDoB723SyIvlR+W7CnBIgpKn6Fe1PQ3sdY7j9A0AI2SvGTd4GvzELvg0
	 qeMEwlvMKSbXu0quY+Gz7L95IKJ00M7y3340+VcNSKtYljRWqLks+iU5/Uz+3bFDM
	 nX1DXRGdE4arODUGtzW8CGsPoy8AFJMMl03UyoD2Jq667XFLapkWuyVDrdr8+x4Jk
	 MoBazHKgsYsv6spFL81uVbyeLpFfBl2hXYKDC8X+TsrDTDV2Oov8o68y3pEorYV6b
	 dWO6U1NGinDv2Bua2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QwW-1wbDxK2q4k-00raQ2; Thu, 15
 Oct 2026 23:05:16 +0200
Message-ID: <ce77a57c-b4a6-41cc-a151-edd316697e3e@gmx.de>
Date: Thu, 15 Oct 2026 23:05:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI
 driver
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
 <20261010190543.563161-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261010190543.563161-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y+CwbrSeZsfdQLHhPgMVjRJbIu9TQbM8tbkQxM7K6JY7Z7LKtih
 94eTY4ZvAED1ZQUWp5QqVHwVOoX7toIldGsVxwNJdoQuOQgTg18Wk5StAsg8BB6UIkp21BQ
 37tsCRB4nTCKmYdCwgWS902lCt/0ntw+8Z21Cw24LVJnbOJ+2m8FYqiGqI9PAE3UT9d2nAA
 4jMn004KUnX/tvGsZJ+Dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JsBG6xe2KRM=;Xpx/Nr3YnUqjlIAtSK8npSnU7wQ
 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

Am 10.10.26 um 21:05 schrieb Shyam Sundar S K:

> AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in th=
e
> platform firmware and expose it through a WMI device. The interface is
> command based: the firmware lists the commands it supports, and for each
> command the supported range or list of values can be queried and a new
> value can be applied. On Windows, this interface is used by AMD Ryzen
> Master.
>
> Add a driver for this WMI device. As a start, expose the following
> settings through sysfs:
>   - PPT, TDC and EDC limits (write-only) along with their supported rang=
e
>     and step size
>   - SMT enable
>   - current memory clock (read-only)
>
> The firmware stores new values in its setup variables and applies them
> on the next reboot. It does not report the active PPT, TDC and EDC
> limits, so these attributes are write-only.
>
> The attributes are only created if the firmware lists the matching
> command, and the property flag of each command is used to pick between
> range and discrete value checks.
>
> The firmware supports many more commands, more attributes can be added
> later as needed.
>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   .../ABI/testing/sysfs-platform-amd-wmi-aod    |  98 +++
>   MAINTAINERS                                   |   7 +
>   drivers/platform/x86/amd/Kconfig              |   1 +
>   drivers/platform/x86/amd/Makefile             |   1 +
>   drivers/platform/x86/amd/wmi/Kconfig          |  19 +
>   drivers/platform/x86/amd/wmi/Makefile         |   8 +
>   drivers/platform/x86/amd/wmi/aod.c            | 604 ++++++++++++++++++
>   7 files changed, 738 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-ao=
d
>   create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
>   create mode 100644 drivers/platform/x86/amd/wmi/Makefile
>   create mode 100644 drivers/platform/x86/amd/wmi/aod.c
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod b/Docu=
mentation/ABI/testing/sysfs-platform-amd-wmi-aod
> new file mode 100644
> index 000000000000..1f7bb5b87434
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
> @@ -0,0 +1,98 @@
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/pp=
t_limit
> +Date:		February 2027

Hi,

please adjust the date values.

> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(WO) Package Power Tracking (PPT) limit of the CPU in
> +		microwatts. This is the maximum power the CPU socket is
> +		allowed to draw.
> +
> +		The value must be within ppt_limit_min and ppt_limit_max and
> +		ppt_limit_min plus a multiple of ppt_limit_step, otherwise
> +		-EINVAL is returned. The firmware stores the new value and
> +		applies it on the next reboot. The firmware does not report
> +		the active value, so this attribute cannot be read.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/pp=
t_limit_min
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/pp=
t_limit_max
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/pp=
t_limit_step
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(RO) Minimum, maximum and step size of the PPT limit in
> +		microwatts supported by the platform.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/td=
c_limit
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(WO) Thermal Design Current (TDC) limit of the CPU in
> +		milliamps. This is the maximum current the voltage regulators
> +		can deliver over a sustained period.
> +
> +		The value must be within tdc_limit_min and tdc_limit_max and
> +		tdc_limit_min plus a multiple of tdc_limit_step, otherwise
> +		-EINVAL is returned. The firmware stores the new value and
> +		applies it on the next reboot. The firmware does not report
> +		the active value, so this attribute cannot be read.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/td=
c_limit_min
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/td=
c_limit_max
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/td=
c_limit_step
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(RO) Minimum, maximum and step size of the TDC limit in
> +		milliamps supported by the platform.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ed=
c_limit
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(WO) Electrical Design Current (EDC) limit of the CPU in
> +		milliamps. This is the peak current the voltage regulators
> +		can deliver for a short period.
> +
> +		The value must be within edc_limit_min and edc_limit_max and
> +		edc_limit_min plus a multiple of edc_limit_step, otherwise
> +		-EINVAL is returned. The firmware stores the new value and
> +		applies it on the next reboot. The firmware does not report
> +		the active value, so this attribute cannot be read.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ed=
c_limit_min
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ed=
c_limit_max
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ed=
c_limit_step
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(RO) Minimum, maximum and step size of the EDC limit in
> +		milliamps supported by the platform.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/me=
m_clock
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(RO) Current memory clock (MEMCLK) in MHz. For DDR memory the
> +		data rate in MT/s is twice this value, for example 2800 for
> +		DDR5-5600.
> +
> +What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/sm=
t_enable
> +Date:		February 2027
> +KernelVersion:	7.5
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		(RW) Simultaneous Multithreading (SMT) setting of the
> +		platform firmware. Reading returns 1 if SMT is enabled and 0
> +		otherwise.
> +
> +		Writing 0 or 1 changes the setting. Other values, or a value
> +		the firmware does not support, are rejected with -EINVAL. The
> +		firmware stores the new value and applies it on the next
> +		reboot. Depending on the platform, enabling SMT again may
> +		need a power cycle instead of a reboot.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b..d069d02665e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1335,6 +1335,13 @@ F:	drivers/spi/spi-amd-pci.c
>   F:	drivers/spi/spi-amd.c
>   F:	drivers/spi/spi-amd.h
>  =20
> +AMD WMI AOD DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
> +F:	drivers/platform/x86/amd/wmi/
> +
>   AMD XDNA DRIVER
>   M:	Min Ma <mamin506@gmail.com>
>   M:	Lizhi Hou <lizhi.hou@amd.com>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index a1a74ef6c859..8f51901f98ca 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -7,6 +7,7 @@ source "drivers/platform/x86/amd/hsmp/Kconfig"
>   source "drivers/platform/x86/amd/pmf/Kconfig"
>   source "drivers/platform/x86/amd/pmc/Kconfig"
>   source "drivers/platform/x86/amd/hfi/Kconfig"
> +source "drivers/platform/x86/amd/wmi/Kconfig"
>  =20
>   config AMD_3D_VCACHE
>   	tristate "AMD 3D V-Cache Performance Optimizer Driver"
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile
> index 2f467dbbfc8a..a3415f83cf03 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_AMD_WBRF)		+=3D wbrf.o
>   obj-$(CONFIG_AMD_HALO_LED)	+=3D amd_halo_led.o
>   obj-$(CONFIG_AMD_ISP_PLATFORM)	+=3D amd_isp4.o
>   obj-$(CONFIG_AMD_HFI)		+=3D hfi/
> +obj-y				+=3D wmi/
> diff --git a/drivers/platform/x86/amd/wmi/Kconfig b/drivers/platform/x86=
/amd/wmi/Kconfig
> new file mode 100644
> index 000000000000..a8d2c35ef919
> --- /dev/null
> +++ b/drivers/platform/x86/amd/wmi/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD WMI drivers
> +#
> +
> +config AMD_WMI_AOD
> +	tristate "AMD Overclocking (AOD) WMI driver"
> +	depends on ACPI_WMI
> +	help
> +	  This driver adds support for the AMD Overclocking (AOD) WMI
> +	  interface found on AMD Ryzen platforms. It allows to change the
> +	  PPT, TDC and EDC limits and the SMT setting of the firmware, and
> +	  to read the current memory clock through sysfs.
> +
> +	  Changing these settings can make the system unstable or damage
> +	  the hardware. If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called amd-wmi-aod.
> diff --git a/drivers/platform/x86/amd/wmi/Makefile b/drivers/platform/x8=
6/amd/wmi/Makefile
> new file mode 100644
> index 000000000000..4848193aff88
> --- /dev/null
> +++ b/drivers/platform/x86/amd/wmi/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/amd/wmi
> +# AMD WMI drivers
> +#
> +
> +obj-$(CONFIG_AMD_WMI_AOD)	+=3D amd-wmi-aod.o
> +amd-wmi-aod-y			:=3D aod.o
> diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/a=
md/wmi/aod.c
> new file mode 100644
> index 000000000000..c64a02b5d379
> --- /dev/null
> +++ b/drivers/platform/x86/amd/wmi/aod.c
> @@ -0,0 +1,604 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Overclocking (AOD) WMI driver
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/errno.h>
> +#include <linux/gfp_types.h>
> +#include <linux/kobject.h>
> +#include <linux/kstrtox.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +#include <linux/wmi.h>
> +
> +#include <linux/byteorder/generic.h>
> +
> +#define DRIVER_NAME			"amd-wmi-aod"
> +#define AMD_AOD_WMI_GUID		"95F20B61-3D44-41F8-87E1-03CBF94C4E8F"
> +
> +/* WMI method IDs */
> +#define AOD_QUERY_VERSION		1
> +#define AOD_GET_OBJECT_ID		3
> +#define AOD_GET_DVALUES			4
> +#define AOD_RUN_COMMAND			5
> +#define AOD_GET_MINMAX_STEPPING		6
> +#define AOD_GET_OBJECT_ID2		8

On my device the WMI interface contains additional methods:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Clas=
s to Query/Set a CLKValue"), guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}"=
)]
class AMD_ACPI {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, read, write, Description("Get version")] =
void QueryVersion([out, Description("version")] uint32 version);
   [WmiMethodId(2), Implemented, read, write, Description("WMI function in=
it.")] void Init([out, Description("status")] uint8 status);
   [WmiMethodId(3), Implemented, read, write, Description("Get BIOS ACPI s=
upport function table.")] void GetObjectID([out, Description("Get BIOS sup=
port Object ID table")] OIDPackage pack);
   [WmiMethodId(4), Implemented, read, write, Description("Bios request da=
ta")] void Getdvalues([in, Description("ID used to identify")] uint32 ID, =
[out, Description("status")] GetdValuesPackage pack);
   [WmiMethodId(5), Implemented, read, write, Description("Command Run")] =
void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], [out, Descr=
iption("Out buffer")] OutBuffer Outbuf);
   [WmiMethodId(6), Implemented, read, write, Description("Get Min/Max/Ste=
pping values")] void GetMinMaxSteppingValues([in, Description("ID used to =
identify")] uint32 ID, [out, Description("status")] GetMinMaxSteppingPacka=
ge pack);
   [WmiMethodId(7), Implemented, read, write, Description("Get DIMM SPD da=
ta")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 Index, [o=
ut, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
   [WmiMethodId(8), Implemented, read, write, Description("Get BIOS ACPI s=
upport function table2.")] void GetObjectID2([out, Description("Get BIOS s=
upport Object ID table2")] OIDPackage pack);
   [WmiMethodId(9), Implemented, read, write, Description("Get RMP table")=
] void GetRmpData([out, Description("Get RMP table")] RMPPackage pack);
   [WmiMethodId(10), Implemented, read, write, Description("Get OPP Heaer"=
)] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader pack);
   [WmiMethodId(11), Implemented, read, write, Description("Get OPP Data")=
] void GetOppData([in, Description("Profile Index")] uint32 Index, [out, D=
escription("Opp Profile")] OPPProfole pack);
};

Please add defines for those as well. I also suspect that WMI method 2 (In=
it()) should be called during probe.

> +
> +/* Command IDs */
> +#define AOD_CMD_MEM_CLOCK		0x00020001
> +#define AOD_CMD_SMT_ENABLE		0x00020026
> +#define AOD_CMD_PPT_LIMIT		0x00050001
> +#define AOD_CMD_TDC_LIMIT		0x00050002
> +#define AOD_CMD_EDC_LIMIT		0x00050003

I suggest you use a enum for this.

> +
> +#define AOD_MAX_OID_COUNT		64
> +#define AOD_DVALUES_COUNT		100
> +
> +/* Property flag of a command: discrete values or a linear range */
> +#define AOD_PROPERTY_LINEAR		1
> +
> +#define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr,=
 dev_attr)
> +
> +#define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _sc=
ale)	\
> +	static struct amd_aod_attr amd_aod_attr_##_name =3D {			\
> +		.dev_attr =3D __ATTR(_name, _mode, _show, _store),		\
> +		.setting =3D _setting,						\
> +		.field =3D _field,						\
> +		.scale =3D _scale,						\
> +	}
> +
> +/*
> + * GetObjectID/GetObjectID2 result: the length, followed by the ID and =
the
> + * property arrays, followed by AOD_MAX_OID_COUNT WMI strings.
> + *
> + * The MOF defines fixed-size arrays for all results, so shorter buffer=
s
> + * are rejected.
> + */
> +struct amd_aod_oid_result {
> +	__le32 length;
> +	__le32 id[AOD_MAX_OID_COUNT];
> +	__le32 property[AOD_MAX_OID_COUNT];
> +} __packed;

According to the MOF definition OIDPackage also contains AOD_MAX_OID_COUNT=
 strings at the end.
Do the have any purpose? In any case their existence should at least still=
 validated because
some firmware implementations return truncated WMI buffers to signal error=
s.

> +
> +struct amd_aod_dvalues_result {
> +	__le32 id;
> +	__le32 current_value;
> +	__le32 length;
> +	__le32 dvalues[AOD_DVALUES_COUNT];
> +} __packed;
> +
> +struct amd_aod_minmax_result {
> +	__le32 id;
> +	__le32 current_value;
> +	__le32 min;
> +	__le32 max;
> +	__le32 stepping;
> +} __packed;
> +
> +/* Start of the RunCommand result buffer */
> +struct amd_aod_run_command_result {
> +	__le16 smi_cmd;
> +	__le32 smi_status;
> +} __packed;
> +
> +/* Command list returned by GetObjectID/GetObjectID2 */
> +struct amd_aod_oid_package {
> +	u32 length;
> +	u32 id[AOD_MAX_OID_COUNT];
> +	u32 property[AOD_MAX_OID_COUNT];
> +} __packed;

Does this struct still have to be packed?

> +
> +enum amd_aod_setting {
> +	AOD_SETTING_PPT,
> +	AOD_SETTING_TDC,
> +	AOD_SETTING_EDC,
> +	AOD_SETTING_MEM_CLOCK,
> +	AOD_SETTING_SMT,
> +	AOD_SETTING_MAX,
> +};
> +
> +enum amd_aod_field {
> +	AOD_FIELD_CURRENT,
> +	AOD_FIELD_MIN,
> +	AOD_FIELD_MAX,
> +	AOD_FIELD_STEP,
> +};
> +
> +struct amd_aod_data {
> +	struct wmi_device *wdev;
> +	struct mutex lock;	/* Serializes WMI calls and protects the fields bel=
ow */
> +	bool supported[AOD_SETTING_MAX];
> +	bool linear[AOD_SETTING_MAX];
> +};
> +
> +struct amd_aod_attr {
> +	struct device_attribute dev_attr;
> +	enum amd_aod_setting setting;
> +	enum amd_aod_field field;
> +	u32 scale;	/* sysfs units per firmware unit */
> +};
> +
> +static const u32 amd_aod_setting_cmd[AOD_SETTING_MAX] =3D {
> +	[AOD_SETTING_PPT] =3D AOD_CMD_PPT_LIMIT,
> +	[AOD_SETTING_TDC] =3D AOD_CMD_TDC_LIMIT,
> +	[AOD_SETTING_EDC] =3D AOD_CMD_EDC_LIMIT,
> +	[AOD_SETTING_MEM_CLOCK] =3D AOD_CMD_MEM_CLOCK,
> +	[AOD_SETTING_SMT] =3D AOD_CMD_SMT_ENABLE,
> +};
> +
> +static bool amd_aod_is_limit(enum amd_aod_setting setting)
> +{
> +	switch (setting) {
> +	case AOD_SETTING_PPT:
> +	case AOD_SETTING_TDC:
> +	case AOD_SETTING_EDC:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/*
> + * The firmware reads the input buffer even for methods that take no
> + * arguments, so a dummy 32-bit argument is passed to those methods.
> + */
> +static int amd_aod_call(struct amd_aod_data *data, u32 method_id, u32 a=
rg,
> +			struct wmi_buffer *out, size_t min_size)
> +{
> +	__le32 in_arg =3D cpu_to_le32(arg);
> +	const struct wmi_buffer in =3D {
> +		.length =3D sizeof(in_arg),
> +		.data =3D &in_arg,
> +	};
> +
> +	return wmidev_invoke_method(data->wdev, 0, method_id, &in, out, min_si=
ze);
> +}
> +
> +static int amd_aod_query_version(struct amd_aod_data *data, u32 *versio=
n)
> +{
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D amd_aod_call(data, AOD_QUERY_VERSION, 0, &out, sizeof(__le32))=
;
> +	if (ret)
> +		return ret;
> +
> +	*version =3D le32_to_cpup(out.data);
> +	kfree(out.data);
> +
> +	return 0;
> +}
> +
> +static void amd_aod_parse_object_id(const struct wmi_buffer *out,
> +				    struct amd_aod_oid_package *pkg)
> +{
> +	const struct amd_aod_oid_result *res =3D out->data;
> +	int i;
> +
> +	pkg->length =3D min(le32_to_cpu(res->length), AOD_MAX_OID_COUNT);
> +	for (i =3D 0; i < AOD_MAX_OID_COUNT; i++) {
> +		pkg->id[i] =3D le32_to_cpu(res->id[i]);
> +		pkg->property[i] =3D le32_to_cpu(res->property[i]);
> +	}
> +}
> +
> +static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_=
id,
> +				 struct amd_aod_oid_package *pkg)
> +{
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D amd_aod_call(data, method_id, 0, &out, sizeof(struct amd_aod_o=
id_result));
> +	if (ret)
> +		return ret;
> +
> +	amd_aod_parse_object_id(&out, pkg);
> +	kfree(out.data);
> +
> +	return 0;
> +}
> +
> +static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
> +			       struct amd_aod_dvalues_result *res)
> +{
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D amd_aod_call(data, AOD_GET_DVALUES, cmd_id, &out, sizeof(*res)=
);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(res, out.data, sizeof(*res));
> +	kfree(out.data);
> +
> +	return 0;
> +}
> +
> +static int amd_aod_get_minmax_stepping(struct amd_aod_data *data, u32 c=
md_id,
> +				       struct amd_aod_minmax_result *res)
> +{
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D amd_aod_call(data, AOD_GET_MINMAX_STEPPING, cmd_id, &out, size=
of(*res));
> +	if (ret)
> +		return ret;
> +
> +	memcpy(res, out.data, sizeof(*res));
> +	kfree(out.data);
> +
> +	return 0;
> +}
> +
> +static int amd_aod_run_command(struct amd_aod_data *data, u32 cmd_id, u=
32 value, u32 *status)
> +{
> +	__le32 args[2] =3D { cpu_to_le32(cmd_id), cpu_to_le32(value) };
> +	const struct wmi_buffer in =3D {
> +		.length =3D sizeof(args),
> +		.data =3D args,
> +	};
> +	const struct amd_aod_run_command_result *res;
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, AOD_RUN_COMMAND, &in, &out=
, sizeof(*res));
> +	if (ret)
> +		return ret;
> +
> +	res =3D out.data;
> +	*status =3D le32_to_cpu(res->smi_status);
> +	kfree(out.data);
> +
> +	return 0;
> +}
> +
> +static int amd_aod_set_value(struct amd_aod_data *data, u32 cmd_id, u32=
 value)
> +{
> +	u32 status;
> +	int ret;
> +
> +	ret =3D amd_aod_run_command(data, cmd_id, value, &status);
> +	if (ret)
> +		return ret;
> +
> +	return status ? -EIO : 0;
> +}
> +
> +/* Read the current value, using the method that matches the command pr=
operty */
> +static int amd_aod_get_current(struct amd_aod_data *data, enum amd_aod_=
setting setting,
> +			       u32 *value)
> +{
> +	u32 cmd_id =3D amd_aod_setting_cmd[setting];
> +	struct amd_aod_dvalues_result dres;
> +	struct amd_aod_minmax_result mres;

Having 1 Kb sitting on the stack seems dangerous to me. Since all WMI call=
s are protected by a mutex,
i think you can move those into struct amd_aod_data and maybe leave a comm=
ent explaining why
they are not allocated on the stack.

> +	int ret;
> +
> +	if (data->linear[setting]) {
> +		ret =3D amd_aod_get_minmax_stepping(data, cmd_id, &mres);
> +		if (ret)
> +			return ret;
> +
> +		if (le32_to_cpu(mres.id) !=3D cmd_id)
> +			return -EPROTO;
> +
> +		*value =3D le32_to_cpu(mres.current_value);
> +		return 0;
> +	}
> +
> +	ret =3D amd_aod_get_dvalues(data, cmd_id, &dres);
> +	if (ret)
> +		return ret;
> +
> +	if (le32_to_cpu(dres.id) !=3D cmd_id)
> +		return -EPROTO;
> +
> +	*value =3D le32_to_cpu(dres.current_value);
> +
> +	return 0;
> +}
> +
> +/*
> + * Linear commands accept values within the min/max range in multiples =
of
> + * the step size, discrete commands only accept the values listed by th=
e
> + * firmware.
> + */
> +static int amd_aod_check_value(struct amd_aod_data *data, enum amd_aod_=
setting setting,
> +			       u32 value)
> +{
> +	u32 cmd_id =3D amd_aod_setting_cmd[setting];
> +	struct amd_aod_dvalues_result dres;
> +	struct amd_aod_minmax_result mres;

Same as above.

> +	u32 min, max, step, count, i;
> +	int ret;
> +
> +	if (data->linear[setting]) {
> +		ret =3D amd_aod_get_minmax_stepping(data, cmd_id, &mres);
> +		if (ret)
> +			return ret;
> +
> +		min =3D le32_to_cpu(mres.min);
> +		max =3D le32_to_cpu(mres.max);
> +		step =3D le32_to_cpu(mres.stepping);
> +
> +		if (value < min || value > max)
> +			return -EINVAL;
> +
> +		if (step && (value - min) % step)
> +			return -EINVAL;
> +
> +		return 0;
> +	}
> +
> +	ret =3D amd_aod_get_dvalues(data, cmd_id, &dres);
> +	if (ret)
> +		return ret;
> +
> +	count =3D min(le32_to_cpu(dres.length), AOD_DVALUES_COUNT);
> +	for (i =3D 0; i < count; i++) {
> +		if (le32_to_cpu(dres.dvalues[i]) =3D=3D value)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static ssize_t amd_aod_value_show(struct device *dev, struct device_att=
ribute *attr, char *buf)
> +{
> +	struct amd_aod_attr *aod_attr =3D to_amd_aod_attr(attr);
> +	struct amd_aod_data *data =3D dev_get_drvdata(dev);
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_get_current(data, aod_attr->setting, &value);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
> +}
> +
> +static ssize_t amd_aod_range_show(struct device *dev, struct device_att=
ribute *attr, char *buf)
> +{
> +	struct amd_aod_attr *aod_attr =3D to_amd_aod_attr(attr);
> +	struct amd_aod_data *data =3D dev_get_drvdata(dev);
> +	u32 cmd_id =3D amd_aod_setting_cmd[aod_attr->setting];
> +	struct amd_aod_minmax_result res;
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_get_minmax_stepping(data, cmd_id, &res);
> +	if (ret)
> +		return ret;
> +
> +	switch (aod_attr->field) {
> +	case AOD_FIELD_MIN:
> +		value =3D le32_to_cpu(res.min);
> +		break;
> +	case AOD_FIELD_MAX:
> +		value =3D le32_to_cpu(res.max);
> +		break;
> +	default:
> +		value =3D le32_to_cpu(res.stepping);
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
> +}
> +
> +static ssize_t amd_aod_value_store(struct device *dev, struct device_at=
tribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct amd_aod_attr *aod_attr =3D to_amd_aod_attr(attr);
> +	struct amd_aod_data *data =3D dev_get_drvdata(dev);
> +	u32 value;
> +	int ret;
> +
> +	ret =3D kstrtou32(buf, 10, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value % aod_attr->scale)
> +		return -EINVAL;
> +
> +	/* smt_enable only accepts 0 and 1 */
> +	if (aod_attr->setting =3D=3D AOD_SETTING_SMT && value > 1)
> +		return -EINVAL;
> +
> +	value /=3D aod_attr->scale;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_check_value(data, aod_attr->setting, value);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D amd_aod_set_value(data, amd_aod_setting_cmd[aod_attr->setting]=
, value);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +AMD_AOD_ATTR(ppt_limit, 0200, NULL, amd_aod_value_store,
> +	     AOD_SETTING_PPT, AOD_FIELD_CURRENT, MICROWATT_PER_MILLIWATT);
> +AMD_AOD_ATTR(ppt_limit_min, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_PPT, AOD_FIELD_MIN, MICROWATT_PER_MILLIWATT);
> +AMD_AOD_ATTR(ppt_limit_max, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_PPT, AOD_FIELD_MAX, MICROWATT_PER_MILLIWATT);
> +AMD_AOD_ATTR(ppt_limit_step, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_PPT, AOD_FIELD_STEP, MICROWATT_PER_MILLIWATT);
> +AMD_AOD_ATTR(tdc_limit, 0200, NULL, amd_aod_value_store,
> +	     AOD_SETTING_TDC, AOD_FIELD_CURRENT, 1);
> +AMD_AOD_ATTR(tdc_limit_min, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_TDC, AOD_FIELD_MIN, 1);
> +AMD_AOD_ATTR(tdc_limit_max, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_TDC, AOD_FIELD_MAX, 1);
> +AMD_AOD_ATTR(tdc_limit_step, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_TDC, AOD_FIELD_STEP, 1);
> +AMD_AOD_ATTR(edc_limit, 0200, NULL, amd_aod_value_store,
> +	     AOD_SETTING_EDC, AOD_FIELD_CURRENT, 1);
> +AMD_AOD_ATTR(edc_limit_min, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_EDC, AOD_FIELD_MIN, 1);
> +AMD_AOD_ATTR(edc_limit_max, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_EDC, AOD_FIELD_MAX, 1);
> +AMD_AOD_ATTR(edc_limit_step, 0400, amd_aod_range_show, NULL,
> +	     AOD_SETTING_EDC, AOD_FIELD_STEP, 1);
> +AMD_AOD_ATTR(mem_clock, 0400, amd_aod_value_show, NULL,
> +	     AOD_SETTING_MEM_CLOCK, AOD_FIELD_CURRENT, 1);
> +AMD_AOD_ATTR(smt_enable, 0600, amd_aod_value_show, amd_aod_value_store,
> +	     AOD_SETTING_SMT, AOD_FIELD_CURRENT, 1);
> +
> +static struct attribute *amd_aod_attrs[] =3D {
> +	&amd_aod_attr_ppt_limit.dev_attr.attr,
> +	&amd_aod_attr_ppt_limit_min.dev_attr.attr,
> +	&amd_aod_attr_ppt_limit_max.dev_attr.attr,
> +	&amd_aod_attr_ppt_limit_step.dev_attr.attr,
> +	&amd_aod_attr_tdc_limit.dev_attr.attr,
> +	&amd_aod_attr_tdc_limit_min.dev_attr.attr,
> +	&amd_aod_attr_tdc_limit_max.dev_attr.attr,
> +	&amd_aod_attr_tdc_limit_step.dev_attr.attr,
> +	&amd_aod_attr_edc_limit.dev_attr.attr,
> +	&amd_aod_attr_edc_limit_min.dev_attr.attr,
> +	&amd_aod_attr_edc_limit_max.dev_attr.attr,
> +	&amd_aod_attr_edc_limit_step.dev_attr.attr,
> +	&amd_aod_attr_mem_clock.dev_attr.attr,
> +	&amd_aod_attr_smt_enable.dev_attr.attr,
> +	NULL
> +};

Please mark the attributes and the array as const (const AMD_AOD_ATTR + st=
atic const struct attribute *const amd_aod_attrs[] { ... }).

> +
> +static umode_t amd_aod_attr_is_visible(struct kobject *kobj, struct att=
ribute *attr, int n)
> +{
> +	struct amd_aod_data *data =3D dev_get_drvdata(kobj_to_dev(kobj));
> +	struct device_attribute *dev_attr =3D container_of(attr, struct device=
_attribute, attr);
> +	enum amd_aod_setting setting =3D to_amd_aod_attr(dev_attr)->setting;
> +
> +	if (!data->supported[setting])
> +		return 0;
> +
> +	/* The limits and their range are only supported for linear commands *=
/
> +	if (amd_aod_is_limit(setting) && !data->linear[setting])
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group amd_aod_group =3D {
> +	.attrs =3D amd_aod_attrs,
> +	.is_visible =3D amd_aod_attr_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(amd_aod);

Please use .attrs_const and .is_visible_const instead.

> +
> +static void amd_aod_scan_settings(struct amd_aod_data *data,
> +				  const struct amd_aod_oid_package *pkg)
> +{
> +	int i, j;
> +
> +	for (i =3D 0; i < pkg->length; i++) {
> +		for (j =3D 0; j < AOD_SETTING_MAX; j++) {
> +			if (pkg->id[i] !=3D amd_aod_setting_cmd[j])
> +				continue;
> +
> +			data->supported[j] =3D true;
> +			data->linear[j] =3D pkg->property[i] =3D=3D AOD_PROPERTY_LINEAR;
> +		}
> +	}
> +}
> +
> +static int amd_aod_detect_settings(struct amd_aod_data *data)
> +{
> +	struct amd_aod_oid_package *pkg;
> +	int ret;
> +
> +	pkg =3D kzalloc_obj(*pkg);
> +	if (!pkg)
> +		return -ENOMEM;
> +
> +	ret =3D amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
> +	if (ret)
> +		goto out;
> +
> +	amd_aod_scan_settings(data, pkg);
> +
> +	/* GetObjectID2 might not be implemented by all firmware versions */
> +	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
> +		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
> +	else
> +		amd_aod_scan_settings(data, pkg);

Can this be detected based on the return value of QueryVersion()?

> +
> +out:
> +	kfree(pkg);
> +
> +	return ret;
> +}
> +
> +static int amd_aod_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct device *dev =3D &wdev->dev;
> +	struct amd_aod_data *data;
> +	u32 version;
> +	int ret;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->wdev =3D wdev;
> +
> +	ret =3D devm_mutex_init(dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(dev, data);
> +
> +	/* Make sure that the firmware interface is functional */
> +	ret =3D amd_aod_query_version(data, &version);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to query AOD interface version=
\n");

Does AMD have a list of valid interface version numbers? If yes then you s=
hould check here
if the given firmware interface is supported.

All in all the driver looks quite good to me, i will test it on my machine=
 if i find the time.

Thanks,
Armin Wolf

> +
> +	ret =3D amd_aod_detect_settings(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get the list of supported c=
ommands\n");
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id amd_aod_id_table[] =3D {
> +	{ AMD_AOD_WMI_GUID, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_aod_id_table);
> +
> +static struct wmi_driver amd_aod_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.dev_groups =3D amd_aod_groups,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D amd_aod_id_table,
> +	.probe =3D amd_aod_probe,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(amd_aod_driver);
> +
> +MODULE_DESCRIPTION("AMD Overclocking (AOD) WMI driver");
> +MODULE_LICENSE("GPL");
