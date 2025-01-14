Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBFF142E9F
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jan 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864047; cv=none; b=SZGgxMVwxaYVQVuRsGcS67CI6xpgvksRewjkoi/IVjkU1plMxXkqLaHv86dE6AO+u3GpCy601+NLh0+8GlGvkukFD2MK/HrpK+WDXZkLJjyaYPMVl/1jrjARDS88kZNwUIQhGK3UA+ivnJA7UvNqESE0+kUrn3xoTuO/vj3aYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864047; c=relaxed/simple;
	bh=PQRP6UbvmrKELiTAxUkRjLth5u8gl7H6Z48i1/pfBhQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HJ7JGZ2jJ3k+G3U+YR5KM+7KpF6v8VEhO5GDeVi7KUKscnzAusjYQQ0VrHJeWBc0Fij0WYGXLZWmZV1HYNzs9XLDGM2dWx9GlUpXYBvpF8zPygIuCYxWh+wa/nmg7ehgS4DnASRF0iC5mkrbUiTQ6T3gsy+laPUJEsiKMNKdb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aa7WLFGI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa7WLFGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736864046; x=1768400046;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PQRP6UbvmrKELiTAxUkRjLth5u8gl7H6Z48i1/pfBhQ=;
  b=aa7WLFGIm1K/DkKSGe4n2uGn6aSVRa9SK5C2i06qO/zIoA6rZxpdi/j+
   18Po8yFTaZ8cftZxHOKyVo1uzx1TADzrt72iyIBi+FyhllRq9qx+egtKL
   Dck1+bxvwqVfbEZeec55a0GouxUxxXv3ZAOT3tY874sjoGzWtpNgJD9wc
   nhkGzf93OC6sqWHE2eHGionl9s3qcxml5+rJI+EwQ1v0YdrCfHYRWbFUa
   avCJfdk4OBS0++ka80qibA3rlJFJkDoqLus6tAUzDpjEk6FbStFlRbK7L
   mHZV5xBB9Mr0TChPh60snmmDO/I2vJOkse0Ho6/oQz78MudtNC0ymiwug
   g==;
X-CSE-ConnectionGUID: 0C4qkkr6RE6eCezrrqQQcA==
X-CSE-MsgGUID: tkBh3JXGRsiFWobI5O70Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48162646"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="48162646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:14:05 -0800
X-CSE-ConnectionGUID: pAdV+7/YSoa0C5NUgOprcQ==
X-CSE-MsgGUID: e+ns5CmfS+iBthhT20p4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109443428"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:14:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 14 Jan 2025 16:13:58 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>, 
    Oleksandr Shamray <oleksandrs@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v2 07/10] platform: mellanox: Introduce
 support of Nvidia smart switch
In-Reply-To: <PH7PR12MB66688190C43F4E535F2A8EDCAF1F2@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <297e8553-b1b2-da63-a4b1-0c1136f3552d@linux.intel.com>
References: <20250113084337.24763-1-vadimp@nvidia.com> <20250113084337.24763-8-vadimp@nvidia.com> <04557916-88ca-2a8d-3a20-78960f68dc34@linux.intel.com> <PH7PR12MB66688190C43F4E535F2A8EDCAF1F2@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1200279667-1736864038=:1077"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1200279667-1736864038=:1077
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 Jan 2025, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Monday, 13 January 2025 19:12
> > To: Vadim Pasternak <vadimp@nvidia.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> > <michaelsh@nvidia.com>; Ciju Rajan K <crajank@nvidia.com>; Felix Radens=
ky
> > <fradensky@nvidia.com>; Oleksandr Shamray <oleksandrs@nvidia.com>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH platform-next v2 07/10] platform: mellanox: Introdu=
ce
> > support of Nvidia smart switch
> >=20
> > On Mon, 13 Jan 2025, Vadim Pasternak wrote:
> >=20
> > > Provide platform support for Nvidia Smart Switch SN4280.
> > >
> > > The Smart Switch equipped with:
> > > - Nvidia COME module based on AMD EPYC=E2=84=A2 Embedded 3451 CPU.
> > > - Nvidia Spectrum-3 ASIC.
> > > - Four DPUs, each equipped with Nvidia BF3 ARM based processor and
> > >   with Lattice LFD2NX-40 FPGA device.
> > > - 28xQSFP-DD external ports.
> > > - Two power supplies.
> > > - Four cooling drawers.
> > >
> > > Introduce configuration structures for the new systems to allow prope=
r
> > > activation of the required platform drivers.
> > >
> > > Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
> > > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > >  drivers/platform/mellanox/mlx-platform.c | 1965 +++++++++++++++++++-
> > --
> > >  1 file changed, 1711 insertions(+), 254 deletions(-)
> > >
> > > diff --git a/drivers/platform/mellanox/mlx-platform.c
> > b/drivers/platform/mellanox/mlx-platform.c
> > > index bd3bb06ff8f2..9d237852d3e0 100644
> > > --- a/drivers/platform/mellanox/mlx-platform.c
> > > +++ b/drivers/platform/mellanox/mlx-platform.c
> > > @@ -38,6 +38,7 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET=090x0b
> > >  #define MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET=090x17
> > >  #define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET=090x19
> > > +#define MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET=090x1b
> > >  #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET=090x1c
> > >  #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET=090x1d
> > >  #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET=090x1e
> > > @@ -49,9 +50,11 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_LED5_OFFSET=090x24
> > >  #define MLXPLAT_CPLD_LPC_REG_LED6_OFFSET=090x25
> > >  #define MLXPLAT_CPLD_LPC_REG_LED7_OFFSET=090x26
> > > +#define MLXPLAT_CPLD_LPC_REG_LED8_OFFSET=090x27
> > >  #define MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION=090x2a
> > >  #define MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET=090x2b
> > >  #define MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET=090x2d
> > > +#define MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET=090x2c
> > >  #define MLXPLAT_CPLD_LPC_REG_GP0_OFFSET=09=090x2e
> > >  #define MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET=090x2f
> > >  #define MLXPLAT_CPLD_LPC_REG_GP1_OFFSET=09=090x30
> > > @@ -71,12 +74,14 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET=090x43
> > >  #define MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET=090x44
> > >  #define MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET 0x45
> > > +#define MLXPLAT_CPLD_LPC_REG_GP3_OFFSET=09=090x46
> > >  #define MLXPLAT_CPLD_LPC_REG_BRD_OFFSET=09=090x47
> > >  #define MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET=090x48
> > >  #define MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET=090x49
> > >  #define MLXPLAT_CPLD_LPC_REG_GWP_OFFSET=09=090x4a
> > >  #define MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET=090x4b
> > >  #define MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET=090x4c
> > > +#define MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET=090x4e
> > >  #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
> > >  #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET=090x51
> > >  #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET=090x52
> > > @@ -88,15 +93,20 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET=09=090x58
> > >  #define MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET=090x59
> > >  #define MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET=090x5a
> > > +#define MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET=090x5e
> > >  #define MLXPLAT_CPLD_LPC_REG_PWR_OFFSET=09=090x64
> > >  #define MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET=090x65
> > >  #define MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET=090x66
> > > +#define MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET=090x6a
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET=090x70
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET=090x71
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET=090x72
> > >  #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET=09=090x88
> > >  #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET=090x89
> > >  #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET=090x8a
> > > +#define MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET=090x8b
> > > +#define MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET=090x8c
> > > +#define MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET=090x8d
> > >  #define MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET=090x8e
> > >  #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET=090x8f
> > >  #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET=090x90
> > > @@ -128,10 +138,15 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET=090xaa
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET=090xab
> > >  #define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON=09=090xb2
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET=090xb4
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET=090xb5
> > >  #define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET=090xb6
> > >  #define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET=090xb7
> > >  #define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET=090xb8
> > >  #define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET=090xb9
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET=090xba
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET=090xbb
> > > +#define MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET=090xc1
> > >  #define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET=090xc2
> > >  #define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT=090xc3
> > >  #define MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET=090xc4
> > > @@ -182,6 +197,9 @@
> > >  #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET=090xfb
> > >  #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET=090xfc
> > >  #define MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET=090xfd
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET=090xfe
> > > +#define MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET=090xff
> > > +
> > >  #define MLXPLAT_CPLD_LPC_IO_RANGE=09=090x100
> > >
> > >  #define MLXPLAT_CPLD_LPC_PIO_OFFSET=09=090x10000UL
> > > @@ -210,9 +228,15 @@
> > >  #define MLXPLAT_CPLD_AGGR_MASK_NG_DEF=090x04
> > >  #define MLXPLAT_CPLD_AGGR_MASK_COMEX=09BIT(0)
> > >  #define MLXPLAT_CPLD_AGGR_MASK_LC=09BIT(3)
> > > +#define MLXPLAT_CPLD_AGGR_MASK_DPU_BRD=09BIT(4)
> > > +#define MLXPLAT_CPLD_AGGR_MASK_DPU_CORE=09BIT(5)
> > >  #define MLXPLAT_CPLD_AGGR_MASK_MODULAR
> > =09(MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
> > >
> > MLXPLAT_CPLD_AGGR_MASK_COMEX | \
> > >  =09=09=09=09=09 MLXPLAT_CPLD_AGGR_MASK_LC)
> > > +#define MLXPLAT_CPLD_AGGR_MASK_SMART_SW
> > =09(MLXPLAT_CPLD_AGGR_MASK_COMEX | \
> > > +
> > MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
> > > +
> > MLXPLAT_CPLD_AGGR_MASK_DPU_BRD | \
> > > +
> > MLXPLAT_CPLD_AGGR_MASK_DPU_CORE)
> > >  #define MLXPLAT_CPLD_AGGR_MASK_LC_PRSNT=09BIT(0)
> > >  #define MLXPLAT_CPLD_AGGR_MASK_LC_RDY=09BIT(1)
> > >  #define MLXPLAT_CPLD_AGGR_MASK_LC_PG=09BIT(2)
> > > @@ -235,15 +259,24 @@
> > >  #define MLXPLAT_CPLD_PWR_MASK=09=09GENMASK(1, 0)
> > >  #define MLXPLAT_CPLD_PSU_EXT_MASK=09GENMASK(3, 0)
> > >  #define MLXPLAT_CPLD_PWR_EXT_MASK=09GENMASK(3, 0)
> > > +#define MLXPLAT_CPLD_PSU_XDR_MASK=09GENMASK(7, 0)
> > > +#define MLXPLAT_CPLD_PWR_XDR_MASK=09GENMASK(7, 0)
> > >  #define MLXPLAT_CPLD_FAN_MASK=09=09GENMASK(3, 0)
> > >  #define MLXPLAT_CPLD_ASIC_MASK=09=09GENMASK(1, 0)
> > > +#define MLXPLAT_CPLD_ASIC_XDR_MASK=09GENMASK(3, 0)
> > >  #define MLXPLAT_CPLD_FAN_NG_MASK=09GENMASK(6, 0)
> > > +#define MLXPLAT_CPLD_FAN_XDR_MASK=09GENMASK(7, 0)
> > >  #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK=09GENMASK(7, 4)
> > >  #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK=09GENMASK(3, 0)
> > >  #define MLXPLAT_CPLD_VOLTREG_UPD_MASK=09GENMASK(5, 4)
> > >  #define MLXPLAT_CPLD_GWP_MASK=09=09GENMASK(0, 0)
> > >  #define MLXPLAT_CPLD_EROT_MASK=09=09GENMASK(1, 0)
> > >  #define MLXPLAT_CPLD_FU_CAP_MASK=09GENMASK(1, 0)
> > > +#define MLXPLAT_CPLD_PSU_CAP_MASK=09GENMASK(7, 0)
> > > +#define MLXPLAT_CPLD_FAN_CAP_MASK=09GENMASK(7, 0)
> > > +#define MLXPLAT_CPLD_ASIC_CAP_MASK=09GENMASK(7, 0)
> > > +#define MLXPLAT_CPLD_BIOS_STATUS_MASK=09GENMASK(3, 1)
> > > +#define MLXPLAT_CPLD_DPU_MASK=09=09GENMASK(3, 0)
> > >  #define MLXPLAT_CPLD_PWR_BUTTON_MASK=09BIT(0)
> > >  #define MLXPLAT_CPLD_LATCH_RST_MASK=09BIT(6)
> > >  #define MLXPLAT_CPLD_THERMAL1_PDB_MASK=09BIT(3)
> > > @@ -267,6 +300,9 @@
> > >  /* Masks for aggregation for modular systems */
> > >  #define MLXPLAT_CPLD_LPC_LC_MASK=09GENMASK(7, 0)
> > >
> > > +/* Masks for aggregation for smart switch systems */
> > > +#define MLXPLAT_CPLD_LPC_SM_SW_MASK=09GENMASK(7, 0)
> > > +
> > >  #define MLXPLAT_CPLD_HALT_MASK=09=09BIT(3)
> > >  #define MLXPLAT_CPLD_RESET_MASK=09=09GENMASK(7, 1)
> > >
> > > @@ -297,15 +333,18 @@
> > >  #define MLXPLAT_CPLD_NR_NONE=09=09=09-1
> > >  #define MLXPLAT_CPLD_PSU_DEFAULT_NR=09=0910
> > >  #define MLXPLAT_CPLD_PSU_MSNXXXX_NR=09=094
> > > +#define MLXPLAT_CPLD_PSU_XDR_NR=09=09=093
> > >  #define MLXPLAT_CPLD_FAN1_DEFAULT_NR=09=0911
> > >  #define MLXPLAT_CPLD_FAN2_DEFAULT_NR=09=0912
> > >  #define MLXPLAT_CPLD_FAN3_DEFAULT_NR=09=0913
> > >  #define MLXPLAT_CPLD_FAN4_DEFAULT_NR=09=0914
> > >  #define MLXPLAT_CPLD_NR_ASIC=09=09=093
> > >  #define MLXPLAT_CPLD_NR_LC_BASE=09=09=0934
> > > +#define MLXPLAT_CPLD_NR_DPU_BASE=09=0918
> > >
> > >  #define MLXPLAT_CPLD_NR_LC_SET(nr)
> > =09(MLXPLAT_CPLD_NR_LC_BASE + (nr))
> > >  #define MLXPLAT_CPLD_LC_ADDR=09=090x32
> > > +#define MLXPLAT_CPLD_DPU_ADDR=09=090x68
> > >
> > >  /* Masks and default values for watchdogs */
> > >  #define MLXPLAT_CPLD_WD1_CLEAR_MASK=09GENMASK(7, 1)
> > > @@ -320,6 +359,7 @@
> > >  #define MLXPLAT_CPLD_WD_DFLT_TIMEOUT=0930
> > >  #define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT=09600
> > >  #define MLXPLAT_CPLD_WD_MAX_DEVS=092
> > > +#define MLXPLAT_CPLD_DPU_MAX_DEVS=094
> > >
> > >  #define MLXPLAT_CPLD_LPC_SYSIRQ=09=0917
> > >
> > > @@ -346,6 +386,7 @@
> > >   * @pdev_io_regs - register access platform devices
> > >   * @pdev_fan - FAN platform devices
> > >   * @pdev_wd - array of watchdog platform devices
> > > + * pdev_dpu - array of Data Processor Unit platform devices
> > >   * @regmap: device register map
> > >   * @hotplug_resources: system hotplug resources
> > >   * @hotplug_resources_size: size of system hotplug resources
> > > @@ -360,6 +401,7 @@ struct mlxplat_priv {
> > >  =09struct platform_device *pdev_io_regs;
> > >  =09struct platform_device *pdev_fan;
> > >  =09struct platform_device *pdev_wd[MLXPLAT_CPLD_WD_MAX_DEVS];
> > > +=09struct platform_device
> > *pdev_dpu[MLXPLAT_CPLD_DPU_MAX_DEVS];
> > >  =09void *regmap;
> > >  =09struct resource *hotplug_resources;
> > >  =09unsigned int hotplug_resources_size;
> > > @@ -626,6 +668,21 @@ static struct i2c_board_info
> > mlxplat_mlxcpld_pwr_ng800[] =3D {
> > >  =09},
> > >  };
> > >
> > > +static struct i2c_board_info mlxplat_mlxcpld_xdr_pwr[] =3D {
> > > +=09{
> > > +=09=09I2C_BOARD_INFO("dps460", 0x5d),
> > > +=09},
> > > +=09{
> > > +=09=09I2C_BOARD_INFO("dps460", 0x5c),
> > > +=09},
> > > +=09{
> > > +=09=09I2C_BOARD_INFO("dps460", 0x5e),
> > > +=09},
> > > +=09{
> > > +=09=09I2C_BOARD_INFO("dps460", 0x5f),
> > > +=09},
> > > +};
> > > +
> > >  static struct i2c_board_info mlxplat_mlxcpld_fan[] =3D {
> > >  =09{
> > >  =09=09I2C_BOARD_INFO("24c32", 0x50),
> > > @@ -2370,205 +2427,665 @@ struct mlxreg_core_hotplug_platform_data
> > mlxplat_mlxcpld_rack_switch_data =3D {
> > >  =09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
> > >  };
> > >
> > > -/* Callback performs graceful shutdown after notification about powe=
r
> > button event */
> > > -static int
> > > -mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum
> > mlxreg_hotplug_kind kind,
> > > -=09=09=09=09=09     u8 action)
> > > -{
> > > -=09if (action) {
> > > -=09=09dev_info(&mlxplat_dev->dev, "System shutdown due to short
> > press of power button");
> > > -=09=09kernel_power_off();
> > > -=09}
> > > -
> > > -=09return 0;
> > > -}
> > > -
> > > -static struct mlxreg_core_hotplug_notifier
> > mlxplat_mlxcpld_l1_switch_pwr_events_notifier =3D {
> > > -=09.user_handler =3D mlxplat_mlxcpld_l1_switch_pwr_events_handler,
> > > -};
> > > -
> > > -/* Platform hotplug for l1 switch systems family data */
> > > -static struct mlxreg_core_data
> > mlxplat_mlxcpld_l1_switch_pwr_events_items_data[] =3D {
> > > +/* Platform hotplug XDR and smart switch system family data */
> > > +static struct mlxreg_core_data mlxplat_mlxcpld_xdr_psu_items_data[] =
=3D {
> > >  =09{
> > > -=09=09.label =3D "power_button",
> > > -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
> > > -=09=09.mask =3D MLXPLAT_CPLD_PWR_BUTTON_MASK,
> > > +=09=09.label =3D "psu1",
> > > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> > > +=09=09.mask =3D BIT(0),
> > > +=09=09.slot =3D 1,
> > > +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> > > +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> > >  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> > > -=09=09.hpdev.action =3D MLXREG_HOTPLUG_DEVICE_NO_ACTION,
> > > -=09=09.hpdev.notifier =3D
> > &mlxplat_mlxcpld_l1_switch_pwr_events_notifier,
> > >  =09},
> > > -};
> > > -
> > > -/* Callback activates latch reset flow after notification about intr=
usion event
> > */
> > > -static int
> > > -mlxplat_mlxcpld_l1_switch_intrusion_events_handler(void *handle, enu=
m
> > mlxreg_hotplug_kind kind,
> > > -=09=09=09=09=09=09   u8 action)
> > > -{
> > > -=09struct mlxplat_priv *priv =3D platform_get_drvdata(mlxplat_dev);
> > > -=09u32 regval;
> > > -=09int err;
> > > -
> > > -=09err =3D regmap_read(priv->regmap,
> > MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, &regval);
> > > -=09if (err)
> > > -=09=09goto fail_regmap_read;
> > > -
> > > -=09if (action) {
> > > -=09=09dev_info(&mlxplat_dev->dev, "Detected intrusion - system
> > latch is opened");
> > > -=09=09err =3D regmap_write(priv->regmap,
> > MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > > -=09=09=09=09   regval |
> > MLXPLAT_CPLD_LATCH_RST_MASK);
> > > -=09} else {
> > > -=09=09dev_info(&mlxplat_dev->dev, "System latch is properly
> > closed");
> > > -=09=09err =3D regmap_write(priv->regmap,
> > MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > > -=09=09=09=09   regval &
> > ~MLXPLAT_CPLD_LATCH_RST_MASK);
> > > -=09}
> > > -
> > > -=09if (err)
> > > -=09=09goto fail_regmap_write;
> > > -
> > > -=09return 0;
> > > -
> > > -fail_regmap_read:
> > > -fail_regmap_write:
> > > -=09dev_err(&mlxplat_dev->dev, "Register access failed");
> > > -=09return err;
> > > -}
> > > -
> > > -static struct mlxreg_core_hotplug_notifier
> > mlxplat_mlxcpld_l1_switch_intrusion_events_notifier =3D {
> > > -=09.user_handler =3D mlxplat_mlxcpld_l1_switch_intrusion_events_hand=
ler,
> > > -};
> > > -
> > > -static struct mlxreg_core_data
> > mlxplat_mlxcpld_l1_switch_health_events_items_data[] =3D {
> > >  =09{
> > > -=09=09.label =3D "thermal1_pdb",
> > > -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> > > -=09=09.mask =3D MLXPLAT_CPLD_THERMAL1_PDB_MASK,
> > > +=09=09.label =3D "psu2",
> > > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> > > +=09=09.mask =3D BIT(1),
> > > +=09=09.slot =3D 2,
> > > +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> > > +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> > >  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> > >  =09},
> > >  =09{
> > > -=09=09.label =3D "thermal2_pdb",
> > > -=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
> > > -=09=09.mask =3D MLXPLAT_CPLD_THERMAL2_PDB_MASK,
> > > +=09=09.label =3D "psu3",
> > > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> > > +=09=09.mask =3D BIT(2),
> > > +=09=09.slot =3D 3,
> > > +=09=09.capability =3D MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
> > > +=09=09.capability_mask =3D MLXPLAT_CPLD_PSU_CAP_MASK,
> > >  =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> > >  =09},
> >=20
> > Why's the diff such a mess in this patch?
> >=20
> > Are you perhaps doing two things in this patch, that is, reorganizing t=
he
> > existing code/structs and adding new stuff? If that's the case, please =
try
> > to do the reorganization in another patch before this one so the diff
> > spaghetti is hopefully avoided.
> >=20
>=20
> I really don't understand why patch shows some lines as deleted.
> In patch only new lines where added, no one deleted.
> If I am doing just diff - it shows only new lines, but in patch it looks =
like
> some lines have been removed.

Okay, I'll play with various diff options then. Different diff strategies=
=20
lock different lines.

> Probably some problem with ' git format-patch'.
> Have no idea how to handle it.

You could try with --minimal, --patience, or --histogram options which=20
pick a different diff strategy, sometimes that might help (I can do that=20
myself too after applying but if I would need to give review feedback a=20
cleaner diff in email would be preferred :-)).

But if you cannot get it to avoid it generating the deleted lines, don't=20
sweat it.

--=20
 i.

--8323328-1200279667-1736864038=:1077--
