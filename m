Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5404248DC
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053020; cv=fail; b=J7LUKTaAotKYc18oaFYT5fm0jubwddaoKsAglgVhQTPwkOnfNe0jmTXe3oiXRUzyaFjX0j+Gp/Bxw2Kxw742dW2MuedSTy6mUo1Z2DYy2ZHQbTYX2nvC1mkrUao/gG/Fv7Q1XSAcv9CBEEFo2wydnVBuXjSd3jrBaS7wiMZBngU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053020; c=relaxed/simple;
	bh=HkkikJCn3o9JVcmDSfM1VFPriN2P80uRzVIBUYdjGW8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nkyuoKb4udkH82GvqT6pUFsW1K7nzicbod8yOwkaNLEDzgA/7bzOStkYaKtGALN04m38Y+pRQGc8OsQAx54B0XCce77yK9vsW6+7hw/flrbaprIh91tpRyKeQD9ZK0wmPYHaZpGLQ7br8u5FUud2DrNKK2vg7fymYdFzRmSQ0SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilo/1cys; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilo/1cys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786053018; x=1817589018;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HkkikJCn3o9JVcmDSfM1VFPriN2P80uRzVIBUYdjGW8=;
  b=Ilo/1cysfvAQlS4l4eLfIWc4rbutQMociKcr0P8uMhKTzaXzjannCMea
   EueTz0OOr/fzZf4R2QZXYaZXmBBwVPa4vBEh4ixzo9e/57hSsApF+kgoj
   DJRo8/AaJ+8sQ2cpBTF/EvgxiHHx/Jw43r89h38gBV4yOnihXnorjPQT+
   6GwCKvC9FAEuum4hfKysGbBk7s3MMdwjdtCFPtIfM43bUitbboQXMKnet
   QIb+LQAgipl52Lx5MhBnPgF8KK0IGHVSL82bi+VM2+C/jz+C+JfL536Fa
   eq/EMCwzUZhSLwhN5xV4wm4QVXmpo8oOw0UIrnR5gILyLnBRdXc/xG1BD
   A==;
X-CSE-ConnectionGUID: CYnQUeO+RtqD53KufNLiPA==
X-CSE-MsgGUID: SEhoUV6oQiW3vBVHcJOtYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="109453793"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="109453793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:50:17 -0700
X-CSE-ConnectionGUID: WB1VY8prTC+GmyQ6GX/EgQ==
X-CSE-MsgGUID: PrDwL+lZQtSp8CLZ/wfpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="262280761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:50:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 14:50:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 14:50:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 14:50:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX7hR9THOB2aIr35Vxbn2Zhxirqik5eD7aysZPFkgCa5JAOuUu54nIINEMVntBbqCXC+vWNOdZP0g0uAVACtYo988NXBu+5gm94F7/pyub02v8zBQHn86pVzoKKGA5SL2XfAf27hkNxdMNTHHsEzoKxcu+6m+3CCgcLZqGRabpi8sqBu87Kxx6K+cRXWrQUzbSIKmsMoBCY2saHaU40KjudrKrcKmfvUGc+cKUi/chlmk+RXPzTnh2Hvbt0X+d7+1e/S93YyEJReQ60IOsA+gl/XqLkEOBEODAAaASdRl1/hADqlzcWBHjHUH8epxscUNAvYFlKBUOoJEecJNNh12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMAfRun7Q2gihLcHRekCDkBmsx4NoHkvkc8RBxoFR3o=;
 b=cHIUv8kMUGkj3eb8IMueFYwkeLz/Prna+b1s/V6nmDhpnFF+3PgWKq1FmBjSnRaH8gOqqNqiBN2c6DNvSW97jIu9Sq1NOmUiPRFioqhwt0Bn+nZ6JsvNrKstlvKB3t5/XX9YQVmterc09ksRhSlrqH40IeoFt+dv/J5cHr64tMp1flvrAOTZKzHgBKlkTYm9/B+5QCj4D8H3F5fCwEMPLIChGpC0BDe80+BtyyyNtJ+WZebBV8+cOB6ImRmkxvpB4NJuPdEx/zjbbrc+l7v4PmyGpaQ6k0bwXqfdCdyGOUw4FIN29gwHdUzfB/VtKtVZwI3qOkuqGLYRiSReif04Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 21:50:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 21:50:14 +0000
Date: Thu, 6 Aug 2026 14:50:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Message-ID: <anUBkmSjMOA4wlFk@gsse-cloud1.jf.intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
 <20260806135820.1422040-15-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260806135820.1422040-15-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: fab1eef2-b2b1-4fa7-ef48-08def404b210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0gW7JQETzUsSw3lG1MvHsnsO1mE/5N69bLRzLWmYvKStrvOeOxoCSz8ZW4pdKSm6pcf/O1zyPpIoTNW9vUI/tyO4XuPiZlvj2JFuYCB/9nEqSdl++QVU67s6L2O9X+uid4oOHmiiowzJjJflcTDoH30eqTWMMYwakOKzengDXeWp///3EHophALKy+N9zjaNSfrNOPbEb43+qVhza3nVEReGED0B2bp1+wgfUOx2r7cRoA+g8h2M3SrLHgYKfy4vFRknDzBsL9bq0MNe9aTvXY84V8QqmL5KSJl2L46o7nEDga4/YFWgllkBycd6imiKwDAowu34B0gqz3YlMyq8iOwV4Tf6dWgQzoOfrDohpLpezLhXkSkDXKrM1AI9wCXnO9q4r9UpsuoksbiRilVFYy5YUlbikFKYIqxkUKCegyGfhizung0hE8KVTcfCwDf66CljzC2x/w3JF8nA9Z7Idu9D/SkCuGSrfVyV1vi5ksFlJB69HNpevHYcSRY1XzDKEtZh2I7ud7A4gp+31pVIunqSWxgJoKjGKFXjZNxj3oEnIsDZePrE1SBUqlsVG8v0OA+icGJnm70WKYbFZwTQgCsvnss9GIDjlcHcm7imgVoeMFsqKUkaBwgKU7Y6cGdiQnXkk9oTChXOoLUBUj0AvHllHte//owNaGw1Ah+Tmcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7a8CqQkFdO9s+vWJ55PZYnwEFtDXuLSn7d246TVF11gFI8daBMuBnTIj2mpP?=
 =?us-ascii?Q?lkRm2AG/eghPwVWKd07aGCn6ap1JvihojIrAXe2o/j0RUsyIs2iqn+ewakMR?=
 =?us-ascii?Q?ZEXL/l4phOXXKHCS7APp8KGCrRR/BcxINYnCBjX+IX3DQ7D4G77U24TgI82i?=
 =?us-ascii?Q?qusafxq/TXBX85ZQSJgGaYP4k6wNoeacXVLJjkKr8R/Jo1QBdxoPhh/l1QuY?=
 =?us-ascii?Q?rXvwwkxhyvujJ/Ziio+BRMlKoM/B7Jh1BV3VXaMlgI1ZSf1D+IfgTv7wRRVu?=
 =?us-ascii?Q?4Ss0nmLrkyJOhTfopz4ytXdfyQDILm26JyATxsHixYQ2mUTQBvmGS6E5ClId?=
 =?us-ascii?Q?La+kgcPDUJqb8FdjIwZsWjtDc5rN1CXfZBzBif47WB/iscjScB3lfnOFhAxr?=
 =?us-ascii?Q?uquKTrz+nNBFoB/M6jj+Kmyx5aLWHqHSFu7BSyC5FGj5cYncka9LaklEj3+1?=
 =?us-ascii?Q?EtoZH0++TbjSXE9thMZHA4FNJwPwAeRGEWsC4oPssP55mSBxtdqdYzQ2cXRi?=
 =?us-ascii?Q?cQdhsMHuNvUIZrQrrC+AtrDylV5tNGrVnuSJYracwjA3O9CgvNPzRQbhIIXG?=
 =?us-ascii?Q?aBWmBocCAHf0G1tU5vcbL3eUqY1Avnm2EKwbnPHv0pcDIU0tUuQ2cshVHvNP?=
 =?us-ascii?Q?9Xe0t0HDEMxkMrxfW1TBm4fS0VvC1b7fu4+eFO4pfovQ4XSLJ85fNdZlF87f?=
 =?us-ascii?Q?xDE2NuS1fqpRoy/grSMGOTmMgIszbdqzqmrDiGXjq1Vq7Qi2jg9zqrvgWLNT?=
 =?us-ascii?Q?eTB4ra/zwdFsnNXCMnh3E7RTMC0v11+lMX5XMkETTnORp0DeTU0ruxZZTVFJ?=
 =?us-ascii?Q?4RcCkd+1p0CygvAiiSbC1GzGFby4bjZGYAuu0OGyS6OkcHdFbyoyW9T5rlrz?=
 =?us-ascii?Q?xA7saikWUkrFGZMLLH3Q1+3gQJOJYyQzrUgIkct7e/S5ZTizsYKd8Qb9exE9?=
 =?us-ascii?Q?isBdL6bk2ePKJ4OH83d1vfIZW5yCnQCn02nT/YKkz+aS/swfh2oO2Bce/KVk?=
 =?us-ascii?Q?UUtFSMkKVmOlbF+kcAbLPCFWqI7DvcJSLyFCWkpzZwHyADyEMHpHOQPFlp8J?=
 =?us-ascii?Q?7x3cZ1U2DRoRoGld6VeV+DPfvc2Kfw3oetBySWZ7a2QBSxyAXaKpf7biesRN?=
 =?us-ascii?Q?hwM/co+iW7pcNuSk4tU0EbvgTzbOXr3oX7fgkGnwJHD+1jC9lNWpBEMBOA67?=
 =?us-ascii?Q?2WBpyXKWxd3IIan6URaX13kZoOtObwvphCG08zz/wBcCtbihuZj50M5HEu+r?=
 =?us-ascii?Q?gdWErqMQXEgjrDkNrvoZbG96Z80yZ5R3RSjFyQj+NraBKdFXoWItULvbZ8Zp?=
 =?us-ascii?Q?a86iuNmTuCw6xqgVjSWnF8/Y+RBayuJNc1SgtvGi0VPQxKj1z3XDLEDhBQab?=
 =?us-ascii?Q?kLo3qasczIjoqQe7IOopNZxaW2vfIaEYXOxuuV9cbxrWoR9K1f9fQrZvdlEW?=
 =?us-ascii?Q?0XeGoVxcMxoXCbkHOaOzW811OLEoics60ysId2WgN7vGUdjmsFVCOt0h20Cj?=
 =?us-ascii?Q?0URSxLeMNH7coSZo8QyyvL3t7OpgVbzoFXt8C8WTlS55KtvnO4G37AKjJ7PX?=
 =?us-ascii?Q?CyIdXVdqkOUq2swBzxnxn5oNwM0JqowDPMS9WzaL51dWZ9+qCKXwlriCNGYH?=
 =?us-ascii?Q?Gb/+XuVn55Vz7+zrpNDFnd37JyknjLRQx8d602bbU16c47ebE4KmgmXgDVIF?=
 =?us-ascii?Q?D7gxiODSGuGovDU9IO8WACowZVMnppf4DKR9Ber1LdMOmwL560d/p8HFbi8d?=
 =?us-ascii?Q?uerQqlwfbw=3D=3D?=
X-Exchange-RoutingPolicyChecked: h2c931gnuMZMgyUHMzz83xT+02EGcoFKAwWGGoif7yiz5CdYyzRWr2nuctnTIUXSEEYf/uFWliyfjsDa8a18nyTmbHKKKHyQl/TlWKaPn14Ec2BtESU3pUXhnq0vSeUT7NddbnoL5Ho/jQRAbPDN5LIgm4dWEdtbxeSPRjmsFi1BSg4mRMNv0e2aEg0ldl5iMC6ZWJ11Zp3Rxp0GPY7u76Y0bbe/IHjJIeqmF6TG7oRVNNvCu9Gj1fT+43E/E9zmSltZdfxAD7QlMZvC0dmd2fJdN2pzn1fXeyQC0IEnZXVLG6du8/ZdCw1r9RX4/VnmoWqaBANSceE1wSeoYP5zBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fab1eef2-b2b1-4fa7-ef48-08def404b210
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 21:50:14.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXIS3skjUZ/3p/hwVVW7RuwwA6KhVAUDolvDUJkn6vyicjR+sum42cqxxqBjHyu1j4xzoxjcEL0YoLplChjPag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
X-OriginatorOrg: intel.com

On Thu, Aug 06, 2026 at 06:58:26AM -0700, Michael J. Ruhl wrote:
> CRI PMT support requires callbacks to access the discovery status
> and control areas.  Access is a common MMIO area that requires an
> index to be set before access is allowed.
> 
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 85 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3849f99c1c91..b84ec9088de7 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -320,17 +320,90 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	return count;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @dev: the xe device that registered the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + */
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);

We have guard(xe_pm_runtime)(xe), and this should also be the
outermost construct (i.e., do not use xe_pm_runtime_get(), as it can
wake the device, while other locks are held).

So this should either be:

guard(xe_pm_runtime)(xe);
guard(mutex)(&xe->pmt.lock);

Or, like the other in-tree usage with xe->pmt.lock in
xe_pmt_telem_read(), which calls xe_pm_runtime_get_if_active() while
holding the lock. This is fine because xe_pm_runtime_get_if_active()
cannot wake the device. This is most likely the correct choice, given
that this is a vfunc called by a different driver, and we have no way of
knowing whether that driver is holding locks that could create
problematic lock dependency chains if we wake the Xe device here.

Matt

> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static struct pmt_callbacks xe_cri_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
>  };
>  
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -357,8 +430,14 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		break;
>  	}
> -- 
> 2.43.0
> 
