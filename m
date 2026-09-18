Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D64F68DD
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747690; cv=fail; b=hf4Y+SQhIvc+9E6P+KzKMdJV0ZP9fOSXIWI+WLtgFTUEi7Y3plz2gCYD0yPzysMfTNOEHJd31H7Bf1GOskKSwzUpSw55AI562OQ/4FKU8tenPsfkTpa2PUqgtlHJLWP9+k+v85Yn/kTwRl2t9H7rBAf+XjOC3UqavUde+cv31ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747690; c=relaxed/simple;
	bh=d4VQVnPusHODURe6vXl7webckjO+yZHgHXFbpM2FYxk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ndMkKsdcXTlSW6iFAOAFIDNc/RkqyoS6Z22f42YEmm74C5yaDE23boWnfR33bVab7+u/dIbqhxU4qraAHeZ1l41Ci4Twvkwv9EVWu0kCG6xDAATAsLxokODccG9u84mQprRvYiYGj4Lq/fZKVH3syOjRDZ5sPHliIy1/YFv47+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkTOz+hn; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkTOz+hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789747688; x=1821283688;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=d4VQVnPusHODURe6vXl7webckjO+yZHgHXFbpM2FYxk=;
  b=NkTOz+hnGDs4j277Oj/NybEuzwJqkTtgFu/OVBgzcIjZCaSGcu1Jyg3E
   WneVlK70o5HZTQa+rTjIPgYMr0qEMo4sIqB/QM+2NJAJLYZVUEL+OmGYk
   3y2FpXg/RTJ4ThmMJVl576S9nWsUOw2Mdr+VhBYi5sIR4z0YRX414zhpQ
   UkbtKSyK9f9XVs/J5MOP72zW7/cEemNs3E2gG6jmwDjZhbAlMvO7vizc3
   Bmzo63WAheNxophrfiOf2fvIjm9LmvF18NvW4W8ZM5DCU7FFZAQJqtfEi
   dHWj1O23X4cGPv3J7xJYOGbEJfClMzl9T2FepX/HS8fYNwq3ftfNRWMvM
   Q==;
X-CSE-ConnectionGUID: P27DEddlTIOyU9kAqFgARA==
X-CSE-MsgGUID: n5jfoa4DSxq/MYrbejg1bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100929425"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100929425"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:08:07 -0700
X-CSE-ConnectionGUID: le6OyN9xSk+lpYP3SY36rA==
X-CSE-MsgGUID: Wc/ThTLmSdqeVH/yNxOr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2917616"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:08:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:08:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:08:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUEdgA/gIrRqUKtceICdYSJD/h4QDyeV3hbpkJ5wj7Lssn8+HH63xTMcb3Sw35wCBJlhBbxrx+LKWhvzq1M7DGVAD6OXaVqFYsknO55t+n5VedN4VMaiaKOmLF0m1EmWwFi+GWJ634EVzRA/yRqGKrpE7t5dw1zfAmUjYZESvkn+Q7AcVebQOaA4PgJljuwLzwsIYENHB46OT4jRw1k0FOqK4qviMruz7oGKntfjZakw69/eM+22jFt2E+Xs6aOKL2SHige3ezjpp8PlrexVmXk2ixjQ/6rw9LbXcDk/gVkGmIgcN5Aj6d7+aBgFeJeRnMrgynv3fw5gLe6VxZ0FRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cT0RDUemQoEJ0yl1Dpidg/WNqYkzxuQLBO/IRvDS1w=;
 b=hOKqQZdW4GcxphaH1q4ivc424KVxB3zWwYs3orbGMmb7e3fXizx5U8IUPKsiT8gZveWbc4ig1/0OGg4ew/uYYfpJvohoFXOVKLwkH5WvYryP3t9NOr18WbjfYnxDt6XTP4rhnhI3DGx9DDbEwDBQ/+6P98bmC2OLQZEglwrTW7qrJa4Bil/DlCZFNd89eIBaE7BDcptQoDnj5btPg1iuYfhKQwE6y+sng1xRlbvVCLCKtH46bCn4d8PzB6UAvJ/FHOE8iO7vk1i+c6QNHQsJNcOqWp/pXEdks+kpkfQdtslpku/Noc7H8h6AXw6GkmAK6HkfIxAvQnoZUQERaqNtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:07:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:07:54 +0000
Date: Fri, 18 Sep 2026 12:07:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v10 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Message-ID: <aq1hyU7wKLzdLkI3@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
 <20260918131751.2408883-28-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260918131751.2408883-28-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 5971af48-1c3a-4588-b664-08df159eff32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: PqYYeQw1Ow8G4OIq3YA8xVTtSfiTOGYZocLDL8q240sNdUd5bSfU+JQGIsc3kfW1iHKEVec9OXJDSy82ztfVevg7mn+8nS8LyfR7FzuMBkzrcLRhoUsan5Vk2wgBqGwVHITf1KALv3RY8+Ivrmz6q7/toKgin2UDDMQhQ7ptnbAeCAoXCN6kDunOY7954DQtybRS2JbO/4NjgB2NWdsBtdgQDrRCNe1AUElYqcMR8DiwW8JdoI9c/yDzmjmClDhAVlB6S1Y2LY0nLSEfXUA+NJ8WOoFMZ3VTD9r2AIi3sEDM1JEEng0IWIdHimlT8D70h3QIVrquhiLOQgCMPAAG7Gfob95GdZBC4xfI4pkRlX8vN8lFlZx4wy9HucgYUWpCVeM+9TqYj7j3qT/PKmHf8jyU1uJoz7FDbrFVW3zhKw5SfMs35uydRlCDE8lYOatl64GoeI6IBAPeXINDL1/yjqDykVvUdCSoc0kaDK+BziZxESA9Uz2tuqx/tO6LZA1Uw0vjU8CmI2/93Zeehr70XJzEmhRF4vjZknHp3nQa+0OM2DuJn6OvK+Y2sje6Tf08S2ac3e4lOTgAXuQrU3XYSVHeFI+1bImRy1EgwKkeq4eStEmV9iOo+yEIW947Rve6rFVEJSGxJ+THeiDoYSFB+BVfqR+05gEm0BXlE6I2hlo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nsG5OVKAdZmiqmPc1wLcZRg7mlgWBScfGuHHYOsWl8JIkgqGx9WYBw5YaJpw?=
 =?us-ascii?Q?FSi23lOh07ldFEAz0ZGcPVnF5wVuXcZCtYKyyHu0p4eyztK0F04XERYdD8ym?=
 =?us-ascii?Q?Ci06h3pao/p3yVkOxKdM0D2hc3iuSWxOBsQ2XXwvRKjH6E87lVe4INTe+on2?=
 =?us-ascii?Q?i8PM+4rflkKbrZmcNYvR4ZUqkK0TcGceoARtMC23xKYjEFSBEWYY396rrWf/?=
 =?us-ascii?Q?no62mgpWAYyBzWVWtQdOusr8npRVGOVMP780iVk5L3N9fJqT++gKW8QuMvGX?=
 =?us-ascii?Q?4C4UfRLVkT9jdu2V21kV1xaP99pYzEn7MIjlWaPuiFiQS24eNnjd6TbwOoL3?=
 =?us-ascii?Q?pM7dFgPqToYA7+Lw1O2h3YH5XURgZxsbR0Q2F3niklpQYUISCUvyCqNO026q?=
 =?us-ascii?Q?K5T49rQsIiXYLx+G2im5T7oARQmSfrr6khCU2+y8V72Q2PkcQiJY+VqoMa9J?=
 =?us-ascii?Q?4y6hsbeUVoJL4gO9JtIFoFCJH//qyEBiFYudJalX6XzE3fpEbpOk9+dtyzfl?=
 =?us-ascii?Q?lun5/ysbp7zynrOM12JZgNJa0F4JxEJkTCHQwR/HYDLF9Aa+MpcBaG3J51Mt?=
 =?us-ascii?Q?mWPAiQTRpXFY2WXNrEYiViOrUko6JQNNw7qPDmtHMinW/ubbvPnQL4NupMYw?=
 =?us-ascii?Q?+DmUfi3q2mZcOX7xZt9IP8Pa2J5uU1zeyu9j44LjEIMrQzSKBzpnwQgFNlVu?=
 =?us-ascii?Q?+8aC2MAFc/3owyM1rmQms79Nr0TUbslnSl05vbitZz7hfrIRVSjLOJj7iKim?=
 =?us-ascii?Q?A/maZ00LOlyIF8wX/MeXz6IIq45Co5IvsUURXziJTJVO6tG694YIh3dhF4NN?=
 =?us-ascii?Q?Y6Xqacu8LDSmGw0UNrIGrP55j6wCxdXMu3bcD9aVKIgXTPaz19VsqnXEkuRn?=
 =?us-ascii?Q?A61npA3e7EuZ/2Iyfg9vxwA+XgnemAgN7Xt41UMmi4H5X2hXx3cHmXZW4uTX?=
 =?us-ascii?Q?RPGghPSXQh0r3R1+9AImjzXVfV/58I5ffpN2CG9AsS9C0P5cmYcvjcuAxcaD?=
 =?us-ascii?Q?Nx72cz86Z3MbYFQOD75/ZEE79luq96Yqt6rQ1yxdWuaoThn7wkIsbIoGBaA9?=
 =?us-ascii?Q?dcB3HXvXIgT74vEWKwGsvw1szdGPXMFHOlNx6Cw6J5/MBIYceud3cky6Y1oJ?=
 =?us-ascii?Q?Iip8VJiQZR5c5aKZdMR53jq8XRSGcVzkWANL+DfAD3bp+ny0QD0ucvOYRFCw?=
 =?us-ascii?Q?8xG5CeZajj+fFReaa++6OIKi7ZzvHBQl14uMM1YCqL6syeTRcY5anr5Zy+Rd?=
 =?us-ascii?Q?GQFxdDqJc2eDFwdtORZiPeqG9YCxo950vdtVJs8oas+FdlVCi4kA57eUW2k5?=
 =?us-ascii?Q?5nqK7lGludoz7ln7JHMksyi7XHlgKefvcUza0nhfObXLClGnjsVwOadCoth4?=
 =?us-ascii?Q?KXEyTy6N3rjS4zNy91uA/ffumjgDYqzyVPfMwS55tiad8A/w+qdiuwXzkStM?=
 =?us-ascii?Q?ZLZ6EDhoZhXDIDJOCYxQ2Y+R3ZuXx9/AjkK8yVHh2C3dieMJIueObcp1uKkU?=
 =?us-ascii?Q?7kPsfQlBfpHKKr/E5m/vMmlUA6+MjPKzAVuyq9gGOnaxIi3k+QAjpp3WNtgF?=
 =?us-ascii?Q?xS9KZQJTujRhs8Eogw7PUf5esU9T6RZd51aYjwvpKnED8sa9mLQgr5k/SlE4?=
 =?us-ascii?Q?RKK+b620ByR1vHHjfsH6LlXuLJMK+fMvos4TqOW4IYil7V6LHBxsH8uPZbnT?=
 =?us-ascii?Q?L++f6vLz39KzycFaJId3UdaTXONepTdw4yEmWaYE48LUdz1eKWVtgaIszgBH?=
 =?us-ascii?Q?vnJDmecUDg=3D=3D?=
X-Exchange-RoutingPolicyChecked: qHbotrMVnrckJS9TpgwMuiHg672pFsJgQidIyZixxRp1q6FzMvyQcmoEKsCsTHenqHan/f7i6Outl7sw78skdB2t4qTgkoF9COAt3ysdHlipP40tat2ZVqL/8ZymTgjfkDh0gW6wwjmz2Sq+1gF29ba0q3XMFqaB1h482QC2dOaAFaQtUej1wMF5xw3fbAGQY66Yl4PbTEhcuoSaLcAsE5sBxjuXO7lE7OlWxs+KYVQc4zfRw0TFDaj7wZAcpo/Zx8sUvFazcCQ+zDoWDY/Kv6G+dv+R0nP2cvj9PyppEtUaKINFnjWor8D6L7nEpu5nuB0qAAjcTEng5baCiaYTNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5971af48-1c3a-4588-b664-08df159eff32
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:07:54.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WihH3zjws/6MbmF4XtySbfeZSPta53Re9ZFxgJzfNH6K8HdPIlAPd+FRK4m7lzbxgCtP3jqOUXGGtEhPhKVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-OriginatorOrg: intel.com

On Fri, Sep 18, 2026 at 06:17:57AM -0700, Michael J. Ruhl wrote:
> BMG PMT is not supported for VF nodes.
> 
> If IS_SRIOV_VF() is true, do NOT register with PMT.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572..481bcbcc6372 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	u32 offset;
>  	int ret;
>  
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +
>  	ret = xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
>  		return ret;
> @@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	guard(mutex)(&xe->pmt.lock);
>  
> -	if (!xe->soc_remapper.set_telem_region)
> -		return -ENODEV;
> -
>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
> @@ -186,6 +185,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	if (xe->info.platform > XE_BATTLEMAGE)
>  		return XE_VSEC_UNKNOWN;
>  
> +	if (IS_SRIOV_VF(xe) && (xe->info.platform == XE_BATTLEMAGE))
> +		return XE_VSEC_UNKNOWN;
> +
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> -- 
> 2.43.0
> 
