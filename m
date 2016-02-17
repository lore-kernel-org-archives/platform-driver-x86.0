From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] intel_pmc_ipc: Fix GCR register base address and
 length
Date: Wed, 17 Feb 2016 12:58:09 +0200
Message-ID: <1455706689.31169.164.camel@linux.intel.com>
References: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:18811 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161067AbcBQK53 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 05:57:29 -0500
In-Reply-To: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, Francois-Nicolas Muller <francois-nicolas.muller@intel.com>

On Thu, 2016-02-18 at 02:03 +0800, Qipeng Zha wrote:
> GCR register (pmc_cfg register) is at offset 0x1008, and
> remapping of 0x4 bytes is enough.
>=20

Darren, both patches are fine by me.

> Signed-off-by: Francois-Nicolas Muller <francois-
> nicolas.muller@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel_pmc_ipc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c
> b/drivers/platform/x86/intel_pmc_ipc.c
> index ca69135..abdf67c 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -67,7 +67,8 @@
> =C2=A0/* exported resources from IFWI */
> =C2=A0#define PLAT_RESOURCE_IPC_INDEX		0
> =C2=A0#define PLAT_RESOURCE_IPC_SIZE		0x1000
> -#define PLAT_RESOURCE_GCR_SIZE		0x1000
> +#define PLAT_RESOURCE_GCR_OFFSET	0x1008
> +#define PLAT_RESOURCE_GCR_SIZE		0x4
> =C2=A0#define PLAT_RESOURCE_BIOS_DATA_INDEX	1
> =C2=A0#define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
> =C2=A0#define PLAT_RESOURCE_ISP_DATA_INDEX	4
> @@ -688,7 +689,7 @@ static int ipc_plat_get_res(struct
> platform_device *pdev)
> =C2=A0	}
> =C2=A0	ipcdev.ipc_base =3D addr;
> =C2=A0
> -	ipcdev.gcr_base =3D res->start + size;
> +	ipcdev.gcr_base =3D res->start + PLAT_RESOURCE_GCR_OFFSET;
> =C2=A0	ipcdev.gcr_size =3D PLAT_RESOURCE_GCR_SIZE;
> =C2=A0	dev_info(&pdev->dev, "ipc res: %pR\n", res);
> =C2=A0

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
