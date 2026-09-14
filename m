Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1011B366DA5
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401808; cv=fail; b=WeW54prtpJOR7ShYSzKAb1UoQA+GkIHr5FiyZNW7OKCnKo44mAGxIUDxFlZic9nki6f0i9tK/pHMUOUeFhkXwpyEOYBvKW+JEvMQoRB+WsbxcRMo3B6fExGpYUsu5uKNR2EVVE/g6jnnyPEEBAWk3aE67MMtiagxvLG3vpqIZ6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401808; c=relaxed/simple;
	bh=NyKdLkyxF+XUGpw6/rz1GWewWH7/w66WeL8Mra4/AYc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EV7Lp3DQE8X6v0CJYtFhb2QsNzLjL0TEp6XHaDN0RZyZNo63OTuRNBjP/7MZP33fyVvomfJWM/hsZYTms2AbQufFf6VIfW17FYQeXrwYfHWT392x7Auf6ajAObsdkmbLFWLQM2uLPtRNLjmYMpmDR8FxqWykpFJJ8DNFTWwhln4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgxUkUVg; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgxUkUVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401806; x=1820937806;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NyKdLkyxF+XUGpw6/rz1GWewWH7/w66WeL8Mra4/AYc=;
  b=TgxUkUVg9gAHAuZQw9frxbaA7VLfwpSr8hjnsEW29jf5ATQPEQVL40b0
   cmhxLM3LOI5lhe9FzNq2gWBdbTREu+PCnojokEVHtpsBBN0PzmOUtdUOg
   YgDPDYgu0fN6n+bGJ5cemUwgvVycvNjsSQOFEPcq0qPUT69UwC7pjJQZn
   EKYw3sD6ctLR5chQ3I50wDoHbWF1ouXX7QSIa/nfIkCyIWrHjceEez8OS
   vtbE3OOD4JTVVlZ4GXLCgKQCuekEIH5b6j+pehl7J+JVh61/1ht0+rG+i
   Mh2sVijLNHoY8JXTHiprFSFq3LD8eaj2dBm1wCB9YShhNf6YXH+QZbrz+
   g==;
X-CSE-ConnectionGUID: hoKFfsj6Sp+a4JQgQbAEpA==
X-CSE-MsgGUID: H8I7ayVrSX22QytENdTDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93453499"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93453499"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:03:26 -0700
X-CSE-ConnectionGUID: rbEtVWs7SnK5IG+YSzB6xQ==
X-CSE-MsgGUID: L6aGqlaLQ0yMg6a9iQqJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1075506"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:03:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:03:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:03:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSASZUC1LBHLyI3vhCi8ghGLQ2YHJMQROOE8iMf+ii1YKHASIvssZe8Z2OYu1XlD1RlGS8+KPLbA6vuKQF6KM0eJ6sdJDsVnBUdmEk/OOymQTghohlEXDvOHqdr+BlCprAMgo3qDfgU/QYgzTVZfULipWL5H9tI3M8kJfP/ovGS+GcvOnO9A8nKBXDQ01RuQZUbdn5SMiaZabWUy8HvSPoriRVPIByyuutSjMGSX3xk6pK933g1CKiF8MIkmXrs7fhXKwjk6QhX0dba55CebwP0rrmXfhHzJq84B8jMRk6Ub66CeZISOrgvESIuDFMBctaL8FqoIHhMPng+F2NhElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg3DopwNtUeyx7WYnHJwPov/Zos4DdnKBSlHodb+Obg=;
 b=T0ddc3jBVf0zvX+g8AXsCeuzkFPtdIJgiYYwi6sWPscZy3ZsGDOt866/IJ1Zv+tluedkXn9loNAtGjO+9s2L+zoATXcFTa4YSw5zqlaUzpuhlK9Oo59DWg6N8+Dti2/ug+8v+XNitsDrYiCAg8i4kxWY2X8RnuZ0gnWMC44HD3Fff/pZuxiP1IqKHoaH2g5qEKiyqrgYBm+nlRYJQZZn+zch3juSeJC67EaAuViZWkMx+JK4uEmNrKla8WNohBfhofCmJIaiBQPXx7F5+0ce9/dJUxmrWRKtQ3cm2BQixWQ8xr5nzOxaPAfIa9ZyqDjZI2dlUB8EKmsThQQXJuvHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:03:16 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:03:16 +0000
Date: Mon, 14 Sep 2026 12:03:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 04/20] platform/x86/intel/pmt: Add register access
 callbacks
Message-ID: <aqgav49Omcx5_TUY@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-26-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-26-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 291ead35-e3e3-4adf-f5df-08df1279afb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: os/+C2215pp16up/zF+G2OzlT6wNN2z3ksW68sIMPVwT8F/ghyA+7GFoaXgSmo+d70SLFYX6sDZnPbGG2yF8su7NMIp41fTLrp829zKKT80PaJTGgPOy+6EswaKgrD6eFV/M5SKgWPI9czInKW4okot9yptxJZzowargGOj7ZXtFrMrn3MtRiolD98skzQRvMmdm7P7W/udp1SkIqlhuq4m/vECV/M4dPJcHtxWKP7COBvqDFFPpUZHp28GFqW1RiP2boM/B+iA3d9XsdJN/qFFQEtBg0D8je94M4ADuAecPyQNSHN6WRBdEIbDxhbE2yGif/HUwt32HNxhO8thZRTU40nNymIs4dTGmHgScr2ShejpYpYIBlVdQUeAd/u42QodMzcInElbHeUoZbnhpDmTC+DrNXr3KEl4aajWebIAHC9tp2NalLApl8zNtPLULN3zmbxwYPnv1j5affsklsmFX0z1K5Za9fci2xCz7uYWrAz3WzaLg5w0SC+rAUdvhoE4LIrllqoVNTnonLC9B3ddIGx/XjowrktIFqK9VVEnyTEpP+jesWOvJzG9sIWPqi1IyG1BG7ft9TLfw4U+a7W95KHsO8Y7A/JDg1ZhQtPym0jC/UFdMnxJtB7NGHYj+vRj5yuWX8mp4MbTolR4kNiLtkcjyaRDM4ZOWNkDA8Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xyrw2A3lQekZUuEQ4kvYBIlzI2kQ6AIeCJadtbpA61Ov9CSRe48djQqkwqk6?=
 =?us-ascii?Q?jJkpsw8okhFj182+ADPILPjw/TgI96xpgKWxR7JfXOqJWdyiCwXfhYHJ0RaC?=
 =?us-ascii?Q?WADnHrCdV9mbkG6cv0+z+xvBTQLIYqPp2ZGGf/yB+x5j5frDZP+sfGgHxTbw?=
 =?us-ascii?Q?rrmPusaBMfeHcReqvfwNd6zDQ4Vbi0KRV1hAedImyQH77PxgUQ41RSgpGd1L?=
 =?us-ascii?Q?0GvoVISjhKEBOZb1ygUXcE7ZFFu59vJ7ifWoJrmOtPAhLDKVmaIooxzHUknb?=
 =?us-ascii?Q?4TLZ04z72hqHNi7s7Fob71Pt0moiPpA7blzW3s1ert3/IQ4o7S+QmAybe8pS?=
 =?us-ascii?Q?03P57zF5PmCJ+I+dX/zod37w2cr/q7i5DqF/iOGHGME2tQO0GhfO8UerGeYe?=
 =?us-ascii?Q?Zx0wcqCtqp93g/m7wnfZT/Ozeg7AVDIXk/bdDMu39x1+QeUW50iGhMFOXBLP?=
 =?us-ascii?Q?DCnzVbSb759Uw/21kHv7YWAg7LkQjatwaITuQuaONNYe94zM3f9/r5mXl+7f?=
 =?us-ascii?Q?e7GFJ2Itp7bh3zspDUAL589LHOXTS2LPcfBlRcEz3pHXJlb1FfXbpotK0S1k?=
 =?us-ascii?Q?K3/1YG6T2yezMsVJH22ox0HS4UhmR92sfrHSK1riHm8gJiBzuxNToSnTszPC?=
 =?us-ascii?Q?SQK3eGcn1L+3FKgmxkYkMDq6hFaMwMaSjgGIPSKQZ5jLn/2XBvJwsLRZC8++?=
 =?us-ascii?Q?RiJ1HwGRoWPulvS5enXODiUrzezKjfSfHMcWLdfNEeayUnN10dPPMU1n12rG?=
 =?us-ascii?Q?iI+ikeKRolge4lg0pCBLDoU/AsepRR5wvx5BQ2N9HTAcQF7a2J92NoyEikG+?=
 =?us-ascii?Q?m9tNV6l5bmjnoUC8+3WhTwUb4UVnsYbTl03GdsnleHIx80YVSyWIOkNUsFIe?=
 =?us-ascii?Q?HBWtiE8FJzb0kep6W4s92v0W/XuTIEk3/XFztMYZwJAMagqFh56mDIDmmBF+?=
 =?us-ascii?Q?C9OfGUx3JrKbKWsDwBUxC51RVV/fy+hRfwrmUX90GSA6mUf1PDmlG0PZ/IIh?=
 =?us-ascii?Q?XSDao/PnI15WjyAUCrHQPHIvbjSXHCWlt1vspXEqDcOVW+RntC1qF4samBof?=
 =?us-ascii?Q?soEN5P1ZtesB+1CJK042P8ihRMb61I7LajUkQjm8YIZ8xvRh5mLxbt2CP4Al?=
 =?us-ascii?Q?F/PbwCVdfEK/iLOX2zPXI8wFJYq3VnCwycPFABD7SA27eQ2UGMighHU4tTua?=
 =?us-ascii?Q?c+T5dZNYRkeEMKcWFV75sWFbNM5wxmm/Oq5vmydd/k8/c1rd3z+lbNfyLSJ7?=
 =?us-ascii?Q?ABrwpbWYmtEqnXL5BQnNGUNVVvoyIR+M8XcxYYTFMtnXe/dq12snwiRrUlAm?=
 =?us-ascii?Q?Esvq4dC5iL5hejAccGzfdjGpMtsyyQXkYbzilpt+opwHss//KzNii5FKgw2a?=
 =?us-ascii?Q?C75OSnLbJtJg9XvQ9p0MJdiRNd6Cztl9OL1n5aILREMaVczPT+YGPan/Nqbq?=
 =?us-ascii?Q?uWQGGRrgnACrk1fEM7GAAGudy1djnvJ2h3Tf4KD1JejmI/Hs/2UcltpYoyPC?=
 =?us-ascii?Q?+a+2R+STHQK8I5f2yKqAqeic8R9+i1hGOdlhW/2X9WAQw1VjPofuOaJ/cX6I?=
 =?us-ascii?Q?JGRaUXGXI7piSqbpQYf4oWC+sYbT9GyomtErzKcwDz00qnPst0BnkDR0opIf?=
 =?us-ascii?Q?UTU5HlcOKuLz9PH2PBV0G+XdR9JTfB9fFSR8wlQ9lwg7R5jerYJ1lguGAm5r?=
 =?us-ascii?Q?yE7tRhkPR5InzKrvx/gwsG+Db3U/6tMYgmqLDK/F16Fbcbbupbva7SgDcNE1?=
 =?us-ascii?Q?Y0BrIwNokA=3D=3D?=
X-Exchange-RoutingPolicyChecked: LTnEkoCQeRudp+FKqt1bjdGJ0iJdU+N6GUQshqYJXwG3zJyiUtz5292vT6vUGy1d9HFcwmiWeNnLg+GaPM9l4nV77MWxHRXYuZ1w1t5qRTQxG+njL/tdB6mDcd55XYL7y3nDzCiCXW2G0mONwjXh9FwddeBZikeaxE3jtLsWk8Y9ION0vxeaETeQx/Y+J7R1zWpyTpVLELyiymMQIglm6pv67xWsrj+O3Fv4+QrzJT/SyhKezxYQdyH8kq/WcNxxnrmuuSokmKMRSmS9sL128sCLUU0wD3PtaMqRjJ3rmU3vJSl3RZVA2lOkUXNqLL4O9n/9T4akooi8+XdDuauFsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 291ead35-e3e3-4adf-f5df-08df1279afb2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:03:16.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvkfntGK1M4ofGTDQlT/ekOuQz0ii1hLaNObvRd+dPIPjtZlpCHacPxokEYiQdIaR6CGawGRinHNb0izFJQLoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:52PM -0700, Michael J. Ruhl wrote:
> Some HW does not have direct MMIO access to PMT control and data
> features.
> 
> Augment the current callback infrastructure (data access) to allow
> a registered driver to customize read/write access to the control
> paths for PMT usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 46 +++++++++++++++++++++--
>  include/linux/intel_vsec.h                | 14 ++++++-
>  2 files changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index b6540f3a9a17..912b61c334a6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -11,10 +11,12 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/cleanup.h>
>  #include <linux/intel_vsec.h>
> +#include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/printk.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/overflow.h>
> @@ -124,12 +126,36 @@ struct pmt_crashlog_priv {
>   * I/O
>   */
>  
> +static int pmt_crashlog_read_reg(struct intel_pmt_entry *entry, u32 *reg, u32 offset)
> +{
> +	int ret;
> +
> +	*reg = 0;
> +
> +	if (entry->cb && entry->cb->read_reg) {
> +		ret = entry->cb->read_reg(entry->dev, entry->header.guid, reg, offset);
> +		if (ret) {
> +			pr_err_ratelimited("failed to read reg: %d\n", ret);

I believe we should use dev_err_ratelimited no?!
since patch 1 we have the right dev handle anyway now

> +			return ret;
> +		}
> +	} else {
> +		*reg = readl(entry->disc_table + offset);
> +	}
> +
> +	return 0;
> +}
> +
>  /* Read, modify, write the control register, setting or clearing @bit based on @set */
>  static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control = &crashlog->info->control;
>  	struct intel_pmt_entry *entry = &crashlog->entry;
> -	u32 reg = readl(entry->disc_table + control->offset);
> +	u32 reg;
> +	int ret;
> +
> +	ret = pmt_crashlog_read_reg(entry, &reg, control->offset);
> +	if (ret)
> +		return ret;
>  
>  	reg &= ~control->trigger_mask;
>  
> @@ -138,7 +164,15 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb && entry->cb->write_reg) {
> +		ret = entry->cb->write_reg(entry->dev, entry->header.guid, reg, control->offset);
> +		if (ret) {
> +			pr_err_ratelimited("failed to write reg: %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		writel(reg, entry->disc_table + control->offset);
> +	}
>  
>  	return 0;
>  }
> @@ -147,7 +181,13 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
> -	u32 reg = readl(crashlog->entry.disc_table + status->offset);
> +	struct intel_pmt_entry *entry = &crashlog->entry;
> +	u32 reg;
> +	int ret;
> +
> +	ret = pmt_crashlog_read_reg(entry, &reg, status->offset);
> +	if (ret)
> +		return ret;
>  
>  	*state = !!(reg & bit);
>  
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 843cda8f8644..917d9397a993 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -90,13 +90,25 @@ enum intel_vsec_quirks {
>   * @read_telem: when specified, called by client driver to access PMT
>   * data (instead of direct copy).
>   * * dev:   device reference for the callback's use
> - * * guid:  ID of data to acccss
> + * * guid:  ID of data to access
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_reg: when specified called by client driver to read PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to read
> + * @write_reg: when specified called by client driver to write PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to write
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
> +	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {
> -- 
> 2.43.0
> 
