Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925F368276
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401682; cv=fail; b=iH4ah0I5l0foPHIv+oXnws4BlIY6ri3Fz3kJmwYur8igE3eIEjsHK/eUChQp5/ntJb9Ht0+y40Kqriw3oMq1u+EbEx86t/LVH+bntTphZXRcsXBMNNseOZrVAE+rmJX2Md+zb6Gb/WYX9X8yrBISGBdbkCrhJJ3oTvWLwwXOkzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401682; c=relaxed/simple;
	bh=S33jGPpMAWKBQdt1KUZBYzu7uPo7ZkH/K7iH1RPz/xQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gubT+Gdcw44tI34xVa8JmO58hwUIUgPQrEyksFpGO+y02ViBodEsXvf7miiDlIgxieAaPs8+5XEvYi8tA+GcfDcw4hEhW+T0BG62F0BSBU6Rdw/P3LK1cVq5uMa7/z2NXXRB7Fgx+I21UdtELr13iKLU+DPa4h9OTufEfujKf/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lw5IOI8f; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lw5IOI8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789401681; x=1820937681;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S33jGPpMAWKBQdt1KUZBYzu7uPo7ZkH/K7iH1RPz/xQ=;
  b=Lw5IOI8f2wRtxl3tag7k5X9cwOskYiL9L7TzK37FIFPRkdOo3SVUSUv+
   3+E70E6ajlxezUDVmC16F0KyBoSkfCDTbTm20SS3KBfqPybRIV0uySgjv
   VSvLrvNbFQPUUuA4OpwXzuXR730DzeYA4ascANu6WusJby2nmRnBS7se7
   l0p5XO1xhQUnnXemQzkzcp2OZf56Lkx3etSvImWOeXmdgNMITSUQQvtDt
   7T+6H23LNvQftb+U4MFvggyeIqmt+pBHvzjj/Cx6r2q/RlmZj4RIiqWrZ
   3O7uBf+zyoNnTzI4r/Igji579cESZ657V+x3yyWr2QrTBF+lXV6tsu5e8
   Q==;
X-CSE-ConnectionGUID: WaB1VQ+tTSy5IaZjGUj+pQ==
X-CSE-MsgGUID: qEt3Cl9DRl+Ru7y/v2gBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100082913"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100082913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:01:20 -0700
X-CSE-ConnectionGUID: m+nUHjRpQyS1d/dyvoNTNA==
X-CSE-MsgGUID: 67oIdr6uSxuVXDT940prhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270046465"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:01:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:01:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:01:19 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZX9IP7+GWvdhJlG1lgKYcghhmG3z25UjwukCbE/XT2GNTuaNcEJFW89Jl8c1FWy5RrYcVef29EoiBgGTtHdZiiv2axDp+ffnk1cobeb0OIW+/6MoconOcYRCs8sdyxip/B94xZuZODzOhgxXm/3PwGbEqKU6m4VhnBCxhw07tqIHVqAmdeN7yJt4ICv/kABPvFoG9Tcv5OBMkumpnekaBmQGrtekBm+b+8J9iQ0bT8j8O/YrXIDe5QI8Yk3qfXZXThsDS1vywU2TwZe0umBvZphy9bDZMUVB57YB1M/nW/y9cxZ9ZTEygDvGg4AA2LMAlUG3s8/+mi0AeJnTzThaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=punlwswz7u+RLJ8QzOxNiMAHIDSObYlmln8VYb6TH20=;
 b=sEDdQ3GtIHf+aU8kfOJsHPb+9fNETD8ppW+mLCSglu6Lc/SwNwypYO4IGkw6LutHmxmBZrRgjO5HP5072kLPxUo0gm/6ATy5L6Pjfb5EwhcINIc76sKC1W0koiEd9C/2N32LN6rOO9bQZesRYku/OFJQt0J/naUzsZVPx+TN0ZlID9fA51XtOqbmdu4ieYRWsIUwrdvA/6aVmyLm8KmY0axijPnAb4uXUAZEsejfNOVb9eOP+gfJwRm1BYGJRgmE7G7iEGl4taw4Gn0LDVQ/UQjhtY+BSBjKRBb8QKddJFblQuMDIUldzpnJogmhoPkVwOSs1AFYyV99YrkOi0dFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:01:16 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:01:15 +0000
Date: Mon, 14 Sep 2026 12:01:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 02/20] platform/x86/intel/pmt: refactor rmw with a
 return value
Message-ID: <aqgaQj9ZCycGOpVL@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-24-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-24-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ2P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 264b3318-9d10-4613-dd9d-08df12796809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: TLqCd//qR7V9Wnroad3owUsKINwBmJwQ4vLJQam0opqTrpU/H5NU+8DWPstbm4HpMqnxWhi/EjFh+tvVTHrnqbizPHNUJRzor2XqVuFdKvZ5NMs7VsIwttysS6g9cV6rGDGvljw58p2XE9mH3b25/z4O4xSKya5g2zb6bwBwisqFrp5bjaCjTkDYkJ2MbyVUUnN0Z1bEesJ5gd5KiU9hhCzYla7JDaQxv/QitOQqlOQ2XOysO4Q3cRUNjH4pFKkrB2f1GV6X/rOAn98JCKexHQEjao9t8hsRDpBLX/5o/Ahl7a1ljGhtOTVvdvBEm7/tYGabZdp71SLVBtUCvuImn6roltcSZ4cxNNajocoY6S9F7WypmI1BHoFcftFhQliPd/FG8c/oHNoAHE8HMZzz67priMSMs49Z92HZjjXnl/Gf0f31+SKr4HAtOf5ErPNLioF/Ckc+j4mvJtlx/Qmj8wN6+tEN5AA8we/se0u59UZDCFL5RMxuUM+I9tAwVuAlLCTIXVdn44/mdePC3O50CDkdZKJ5yHwAEFv62HMRbIjG9xAB4/5pOKx08oOXJn0BUb7XWOM9K7y629LWNizbtACHaMY6ti9KEbFSdXuqpx0C/CoeBw6M6Ydy98ZnQMF3dkOOkHwLR1un2NaSgPTDkfOMNpjXBXDCoznnqrPcD1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3TFRc8D/QlcBGTxKFJCkjcC/Jl6zLbFqm8jzeF2BRSUEbHACxUf5TSTq/lmt?=
 =?us-ascii?Q?U0bnFQcryZ1DnixUlyZFy0zMxRI7MWtQSuRV79ObcP9KVpYSLWSIWemzTQuE?=
 =?us-ascii?Q?A8Q/IvxoAViWdkRQbC/OOX1wL6unHWUXRJ5fg5ONRfveyIoKKEgKLTSAuU6v?=
 =?us-ascii?Q?uD25h9uhd7AWu9svrQOJUuWiKIHVcJAhaTregsve86gR6CqUVhx05PfA8Wdz?=
 =?us-ascii?Q?qRAQsmxz96A1Ctj9EUdLgufCvW9D4WsdjltOOayZv2qoLRGHrFoZIfqPuOsI?=
 =?us-ascii?Q?km63XqPjYNTFEyjDidcqjNzwjKN4L3hBGZHOQ9KJqp+z8e5RUJhnInWVT5gZ?=
 =?us-ascii?Q?eUqpcBdUqynUZ3PnWn132laTMAylL0TyUlbZQZvxGXSnAznOOhzwWSmU6cWC?=
 =?us-ascii?Q?vsyECYNDlSoXPTXSZ6kt7PkEbV04PPO0PIrFQc57nnbu4GPzwqyWH0j1btRp?=
 =?us-ascii?Q?3zjPQhT/p+D/AZReEEQr8lySVtyh0dPz/ooFMeQ5Vt09jER9wctvpdaDaS4x?=
 =?us-ascii?Q?cPhffgf3xjgSeP8Rte1Oj/+jxieYec3KOqe0MnyU+J/dohq3hMn2vrE9ADUd?=
 =?us-ascii?Q?8uRD7PqSp3A1KsoE/eqy8R9M+fN1rkcd9qeHWxmy1pkSxlwtZfk+MGk4d0AO?=
 =?us-ascii?Q?J+OUhPwnV3LcIlM9SiG15SSD1H/RjjUufcQkCuN2p6h9WL4tsaEfvj50tVYL?=
 =?us-ascii?Q?X1E+pPXqUVYBadyvetl6bnbf1ErkkF63WnOwJavzsCAdUhzcmAiDbhWR3Ksf?=
 =?us-ascii?Q?btRqfz4XAMbAyj32R6fJPmfhjSDPjylS0IUq8FlxiOotdHuq404weGt2h5Ux?=
 =?us-ascii?Q?qVquKL+2hUU8SzgCt8TU2C0Qw9pA0b3qBRfW0Lph9i6rokZSHbR6SqUbKfKd?=
 =?us-ascii?Q?9OGG4ixn+PSf//fCvKUrVRh2n9J30WfLjXkZHENncXwBnMpdeOtkZCi80UaN?=
 =?us-ascii?Q?GN7MBm0VMDOBkQJhEg/yqMF9yPTRBCe+rx7tlIIv/31VaHmdcSAqnxkOfsIK?=
 =?us-ascii?Q?NowDVOvDyvhfS1V8HZuyh/l6GvR09VfnNMCPnepSAKBKFgOOZRm7uJLV6RW/?=
 =?us-ascii?Q?BEYraH5wwSsBdoqrflIxkkkqUv0jZcTp8gn2tVkGCPYE2NRzTs6cjnFhu/gg?=
 =?us-ascii?Q?nRmEHAEuKCVqigZHHNDd7A3maqmB+wuzb+kNKcqjgos8E1kkN8wZ8pMpS8rl?=
 =?us-ascii?Q?zB1ULVCsuhTeKTjQwc78I0y4ZGpmynY5rT+nEWBDFjy0ITDrFWBeYaRwRkVD?=
 =?us-ascii?Q?xzSmmEj6e4T5ZDb93CgTo4lXesV680GT/un6W0+zEuhlcyvVbcUg7NZrHmjk?=
 =?us-ascii?Q?70iBOrbEVtIFIja2XYnLuOTp6DiexgXWzgMD5cKFUQMNyFRdtwsY/HqN0gbr?=
 =?us-ascii?Q?pucC9I94KqKTn/o3IADp0vAOIQHX4QGSzRQou43avlhopjc3pdNdh45HORk6?=
 =?us-ascii?Q?9e+0r40B0rZZT00BWDnbU4t3hGIy1dusw92iCxz/sXRpeJxwTQzIsvg5y9dU?=
 =?us-ascii?Q?2AkK9xEPhXh44tbku73FfEfrPgjWPFDiFWSnWKHHQ2cNytDihXJreMTnt8RN?=
 =?us-ascii?Q?QL/aa6KzRaialLEKP0vinWQNKf1tjpp1najvC9eBFuNk7MkivUV1b+9AItjg?=
 =?us-ascii?Q?CAIxAuptOdq/d0m+ZAusQjR31xfYRmDhBhtzlzak5D9CN5KQcxh33z6Q0khJ?=
 =?us-ascii?Q?MeYPwpPfXl3ZpkU81f4yN4I6G1sriWLw7czgpvGqtCu2/q1L46tVyckBHum2?=
 =?us-ascii?Q?RG+N3Iz+iA=3D=3D?=
X-Exchange-RoutingPolicyChecked: r2ckBGe32j2oOuiqsWBFE7q7faV3tjYZxNgYdX4TZEq2EggmsTgitoLhLnON6dl5dmpKJGAPKeo6nxhhw7t8N6gdf/LiBNU8jrBSLHs8VPMJ2rIXMY8La+dnV56Yba6Ac5JeeVz8ExgHs2DBRuGoPBgTX9dpjaPjwmxWR1LohLR9AAEAkaZYwg4iy9QUuG204qXJtH8k5z23MbWvbVNU8PpX+zhBhFg/c/Y601i/NxExlVuu5TjLjtztXH8ZkdbNl84dqkl5pq1AXfcf1jzBQ17xZrS/hQCwi5Nhp2gwt4OLTvN+VKRTcdM583wnwPmDd7eUOQDqmZbaNst0X5ZtOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 264b3318-9d10-4613-dd9d-08df12796809
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:01:15.8296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ygsX73pWj1+y9wJHauM9GC9edaQdp6bi2wQhydDazHRtd0Q9CrQ+qkSsimpvFc3F+CAFtE7vd0r1591fVHuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:50PM -0700, Michael J. Ruhl wrote:
> Upcoming changes will include possible failures from HW accesses.
> 
> Refactor pmt_crashlog_rwm() with a return value.
> 
> Update all necessary usage to use the return code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 90 ++++++++++++-----------
>  1 file changed, 46 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index f936daf99e4d..831cff743803 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -125,7 +125,7 @@ struct pmt_crashlog_priv {
>   */
>  
>  /* Read, modify, write the control register, setting or clearing @bit based on @set */
> -static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
> +static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control = &crashlog->info->control;
>  	struct intel_pmt_entry *entry = &crashlog->entry;
> @@ -139,6 +139,8 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  		reg &= ~bit;
>  
>  	writel(reg, entry->disc_table + control->offset);
> +
> +	return 0;
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> @@ -181,20 +183,20 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_typ
>  	return false;
>  }
>  
> -static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
> -				     bool disable)
> +static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
> +				    bool disable)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
>  }
>  
> -static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
>  }
>  
> -static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
>  }
>  
>  static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
> @@ -207,9 +209,9 @@ static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
>  }
>  
> -static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
>  }
>  
>  static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
> @@ -222,9 +224,9 @@ static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
>  	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
>  }
>  
> -static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
>  {
> -	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
> +	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
>  }
>  
>  /*
> @@ -245,13 +247,13 @@ clear_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool clear;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &clear);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &clear);
> +	if (ret)
> +		return ret;
>  
>  	/* set bit only */
>  	if (!clear)
> @@ -259,9 +261,9 @@ clear_store(struct device *dev, struct device_attribute *attr,
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_clear(crashlog);
> +	ret = pmt_crashlog_set_clear(crashlog);
>  
> -	return count;
> +	return ret ?: count;
>  }
>  static DEVICE_ATTR_RW(clear);
>  
> @@ -280,13 +282,13 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  {
>  	struct crashlog_entry *crashlog;
>  	bool consumed;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &consumed);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &consumed);
> +	if (ret)
> +		return ret;
>  
>  	/* set bit only */
>  	if (!consumed)
> @@ -300,9 +302,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
>  	if (!pmt_crashlog_complete(crashlog))
>  		return -EEXIST;
>  
> -	pmt_crashlog_set_consumed(crashlog);
> +	ret = pmt_crashlog_set_consumed(crashlog);
>  
> -	return count;
> +	return ret ?: count;
>  }
>  static DEVICE_ATTR_RW(consumed);
>  
> @@ -321,19 +323,19 @@ enable_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool enabled;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &enabled);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &enabled);
> +	if (ret)
> +		return ret;
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_disable(crashlog, !enabled);
> +	ret = pmt_crashlog_set_disable(crashlog, !enabled);
>  
> -	return count;
> +	return ret ?: count;
>  }
>  static DEVICE_ATTR_RW(enable);
>  
> @@ -362,13 +364,13 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool rearm;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &rearm);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &rearm);
> +	if (ret)
> +		return ret;
>  
>  	/* set only */
>  	if (!rearm)
> @@ -376,9 +378,9 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> -	pmt_crashlog_set_rearm(crashlog);
> +	ret = pmt_crashlog_set_rearm(crashlog);
>  
> -	return count;
> +	return ret ?: count;
>  }
>  static DEVICE_ATTR_RW(rearm);
>  
> @@ -400,13 +402,13 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  {
>  	struct crashlog_entry *crashlog;
>  	bool trigger;
> -	int result;
> +	int ret;
>  
>  	crashlog = dev_get_drvdata(dev);
>  
> -	result = kstrtobool(buf, &trigger);
> -	if (result)
> -		return result;
> +	ret = kstrtobool(buf, &trigger);
> +	if (ret)
> +		return ret;
>  
>  	guard(mutex)(&crashlog->control_mutex);
>  
> @@ -415,17 +417,17 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  		return -EBUSY;
>  
>  	if (!trigger) {
> -		pmt_crashlog_set_clear(crashlog);
> -		return count;
> +		ret = pmt_crashlog_set_clear(crashlog);
> +		return ret ?: count;
>  	}
>  
>  	/* we cannot trigger a new crash if one is still pending */
>  	if (pmt_crashlog_complete(crashlog))
>  		return -EEXIST;
>  
> -	pmt_crashlog_set_execute(crashlog);
> +	ret = pmt_crashlog_set_execute(crashlog);
>  
> -	return count;
> +	return ret ?: count;
>  }
>  static DEVICE_ATTR_RW(trigger);
>  
> -- 
> 2.43.0
> 
