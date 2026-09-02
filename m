Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB220375F69
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376135; cv=fail; b=Vk4hq4k6yyryR4BpzJG20EgUjC/iHxW1dQNe5AaC7vhNlLB24m00TKo7mrhZWRmEMLT2YVt7e6MtlB6tM+nQPnPuFcES6WGxt+EAVJSYx0QMwJrNhw38EzIacESicnlMuEsReM38ivWtGvFOyzvzKytQLKjqNQgrAh+GAqM/qMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376135; c=relaxed/simple;
	bh=+22emFQ15RlnDbFx2VafMAznqWHRzC5BPvkFTxcmNSE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HjhDdze/QX6bpsU+k2sBatC79l2At2W5Oly7LjEzUJXDwAGXDxcmC0WanwyEg/JSruSnaaxMx9tpVh/e5bn2wLZm9XYJormTplsZgXqe5O183xAuhA24PmqqXNunFpvUjOIkcdKZvlsVVhNShR6BbvjkBXuE5KgXIxUzFvt3ne4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXRgOC6S; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXRgOC6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376134; x=1819912134;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+22emFQ15RlnDbFx2VafMAznqWHRzC5BPvkFTxcmNSE=;
  b=nXRgOC6SfkeEgchSnY9FF0jnm8sZMRMvZU61cJqk/Lch8V3S4llwjaId
   WpX188oEm91vVvZFhQMPyFlERboKiaM/bGb7Q0D5fsbAQat7kO8pwjWPf
   sr3htzVOsSWgLwM24x/W17hwUfAMPzOg7IwJ+eqWhUcsJOtv8OzsJkkPg
   QPkN0xYCCKFF+kZ08fu73bVwaeim0Dn9NjbL0zzWBER2h642M9WHxlqw8
   Gve8IWJCo3uzCSuDzRPyd0pjCLOFBZKIFwTCE+9/cFnzKufXLzpMlAyQE
   c5XoBnfwno5OXlGgyc6wsLKYKzb211MCnbkkVcs1rRDfIdv8avbOAQew9
   w==;
X-CSE-ConnectionGUID: scO4E47DRM6G9KMdlE3fXg==
X-CSE-MsgGUID: Kz+5x+rHTuSRWl3kIu+PzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88610972"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88610972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:08:46 -0700
X-CSE-ConnectionGUID: 4C6AZuTuSuuJOYtlb6vClA==
X-CSE-MsgGUID: mmkWuCeiSKSKRyUBpAdvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="272998996"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:08:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:08:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:08:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l33qwKZ5M7S0J5clvytwHNphAf/C4pw/kcs8JdJOvhq8x+8VQ8KXAo6NJwmARJZmzUbr/R455KvBsm1S5wiL4AbGsDZSjpouciWyre49AP2cQv0cOzu7fV4wMyGj789OLAGQlBZ9UVSk7c7gu1g3eV6tTrOzooNQ4HrTkD20JWl1f2iUoc+pgG1MozQVgk0rD4gjPFudC9dKmu5qCbGL1H8K8MZQSTNHYcjY61+U1B3bev33K8rSjAhXAntzn5PFRnEoYqGfa7BT1t2svlJa6ePi5S8SdXMgnJxhjVKLOhXqNvhsxF7ZozfN4doyzpjiDdG8bXfVh9gTz8GmQm+c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kA6NCMh9aga95lH5bKniKQirTJUS8DGbgv9c8zkUmU=;
 b=ZI0xyAxOtEWpVkCwU1g+9+lsXb1GT007DZMjFVZOJE23fQYa7RBL3rv0FuPzJomRuK3nt07B+pv+GzL+0P7RMX9jF+TAKuN/4WbwyCaH2GhiR7ogGU496h8jXpD33V8WCmnUyp+qqI+cHuC2+iktjsRL/bpN0LENbPhcAmS+etNGAmQkmgPmkvMPtE1jXUwHJVoGwjtlCBB6vfa0bKtq4j8aWBl5zFjY5bbUvzS83/4cvhLmFyBJxO5oV9a+QKO8DLA6ku+evT9dFuhJREfI0QuYKkS0vfo4CfONVLMYKgk32CVqo/6miUO8p48dUFyVP5Vb6awngJEnDyjBtswCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:08:33 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:08:33 +0000
Date: Wed, 2 Sep 2026 15:08:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 08/18] drm/xe/vsec: Correct locking order
Message-ID: <aph0K-m2M48pvEZd@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-28-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-28-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: aea1e7d3-1f1e-4b41-fee7-08df0925953f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ECKqlujb09xfMcu4zLt7QNff+YbjXA/w8FjeqVyS5egTegO2S9qJp/UQthhSdXUtjMI7HJMfHRp/X+WQ9XdAwTl2F++vX/xYyHBSm+XSAwSWAxwuIxcr9N6LrE0NhL47+StBk1i597WQyltuSdvORlwI4XX0rDPBJ8CIy1huNDhSRFGiRxgk8dPVQyhXEgRYsUywjTZdkMohbbRdqbZQKnKO4jJ92bVLWJ2riy3aJkx/U3Vj6kCRRLiqcxW8zpWy4tz0bjQ0Dgsl2Iy1JeHbU05GAs7wUHRzb55s0LyPHv46GqC1QnbZFb58CFvgTIO2InEToRYJTzzKqt7nqcDrmdLkWBCod67GB6G3JjOhDvs+U+Hd9NTKH9MZYf12gVoA+/ohoW889CXGBXdz7NKIAOll0W2Q/Jn9AVrqlqEyIi6/l0iwy3zpZ45C1H/VXREMbLS0peaRsf/HGtfEanLbVjB6g6NBZOqqvFspcor5JMoDvSM/7rgrntLJ9pR+8PdOOJBTUMEZC1jyw1QK9R6QeqXYliV24Oxy9hVrhTs6xR+1/Wf9bf46QXrLhQJyS1t+siG5sJgSE9xn2hUDCN4MmjvU5UJU6H4RKvWqN1OnuBq3XL1TzKyNnhmYpwaGcAYdkhyoeWAWmZlMoixD84ATbObh2M17kZnx9JtbJMimMxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDkZl0fpGNhIa2+P6rGlVVfcwayLFRvC3dsMUXyww6VPiATcB/6P+vU/YElq?=
 =?us-ascii?Q?GIaBC6Hom/IDE+GHt+FvDUu0tj+K5TVseAkC3lgaHKZuTwfqa/Y6XRPVfOMk?=
 =?us-ascii?Q?w5caXiyJPFi1R/3IW9XYySI9CxKsWTOgkinybIhrHMdGNj3a2JmHw43Nz+Ph?=
 =?us-ascii?Q?1NihxCJe4pWWnFClm50qUqaKlFhBTN+d4Cc6AUroLQsL5pe4vCNM6yO8Hb7i?=
 =?us-ascii?Q?JwC72mXXRdmSiNFSUAueY3vsBPrKcxErNyqnihDBd7SIVlLViQLe6K9bH3/R?=
 =?us-ascii?Q?5sZON9Rk/ru9QelVBVVbcJPtYJmhcsZ52P2KxhMPWRMLWrOHIDn1qvGmdPhd?=
 =?us-ascii?Q?3lQm1mHn1oDNwSEkPKl0j7lDf2bBEu88h2y7v4UUrg52S+XOHPg2T4z01iwn?=
 =?us-ascii?Q?Y6x+EuQxBzUhhlK1Ym32dh6ctt09K6KahK7SxiBMEaFwrrRyVKgFSHGBxx3n?=
 =?us-ascii?Q?a6q7YH0tAxevLjct/iqo1xNWz/cJ/rTzBSbd2+vXOtE3TWOiJSbGZ0vOQbXw?=
 =?us-ascii?Q?omCfUBivNMPTtN52WXZVCRVVcI1Ml59C/VbxdY3MaOfPHCrndCM3vLjZ08cN?=
 =?us-ascii?Q?QIHYYoAdSK1UV1bzFBawa6ml2x0Y1HCWO7QY3lK7q3fPKfd8TmRa8xmEKH8m?=
 =?us-ascii?Q?DoNbdNAynr+v2V1t123qQ0MCSxRcN26Ub2JtJFzYtV43JMJC1Nm3yEk73x5+?=
 =?us-ascii?Q?R7LxdiAM1bqX4MMjeTyV4jNfpkR6K8rUwiKffA2Pf9GlpuQa/mBSpuFaAxGZ?=
 =?us-ascii?Q?8KI2bov7xxPBQ638dkc/dFsxJGSUahCwt1LTh+3Tsjwb7y922ubPzrW/7uLs?=
 =?us-ascii?Q?2ezE2uG3uOZUe1H/wTJxEXe6RyD2kSqPMd6i9BqXv+VJZNUl3vxA3YXbb3rI?=
 =?us-ascii?Q?PTWErtdYzz3tKhMpFwczFTVCqPHnQt+fUGeG25phsPWkrMmexiMbnbKdyZkj?=
 =?us-ascii?Q?ynmL9d2PuQFePYMlrpfsJxI1oqSTbT3STDBYO1X5tDimbFOkAeHhYy5PQ8BI?=
 =?us-ascii?Q?LzcizfC7GCnjWMpc5SFUqEQGQbfCcV6tDXVHqhpRNmcmFodatoxPgaEIsF80?=
 =?us-ascii?Q?nx9+Gj+3OILKeourWJoe+L95LhKRW6VdSreORDfVRD19XiftpF0ay5xSqmOL?=
 =?us-ascii?Q?oDcCSkAw1nltponG2Lo+SXnYLCZYXBL1yKa8JHz2IJFcmqmNkb5xoje1wGic?=
 =?us-ascii?Q?zw8rGbgFDrKD2f70LD/487t6il4Sx7B/uyePPkxaqj5/spCRfHJDzOaupUmI?=
 =?us-ascii?Q?xFZDmqdX7sRv+iuIpApC1GQy6w6zypFZUXcZT3alp690EIVP0UlGsJ2lnX/0?=
 =?us-ascii?Q?7/MC4L1KomkVJOdS+9WpNteuOazBFRGds5Kpz9NUjEkxxyN7FbNq3KfSvrZk?=
 =?us-ascii?Q?iT9om12N6OqXtrz7tzhudVu4fL4FbszOxWFjg/vgwrBSGpB1vRUoTVDRGl+U?=
 =?us-ascii?Q?omRFa3NE6GbNpqMSg+uildFyOUkMtJ4zRwaeoNAvHnCUhjMHbNM52hdYk0PE?=
 =?us-ascii?Q?+tAaUDxR03E9n9sF2uTzDfSl7JfLWv5i2JqiKZSQGFEIJjlVmEoJppiEl2Ze?=
 =?us-ascii?Q?fO/+8dGI99O2q8cdGzI6/P+mUJNEyYMrlh4AR4uRP6g+55ZXlKfvhEatxze/?=
 =?us-ascii?Q?PExIPOEiOKuASfMPwD64ctY8y5xHC9clVm226zkxEevTr9X/Ip+gqPVEXnOM?=
 =?us-ascii?Q?qO90PrcJnYSlmjANcYERK6U4TWTsf8ocOAgKd5nL0vJBuqEtX0IckwYbBzMI?=
 =?us-ascii?Q?2a1//doBQg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Uw3WMrhjpCbiHwUF2dBrTx0gRITtWCzEmu+KDx0eV3BLhczODFU8torU0Mewn6t7d03xKVn7nQQCrSwJpF6xDIDzGbFQnOCzF1sFvgD5/iODdOGYdw3PsyW8A/dU2wxnhrId+ujxDwWLu9saWKdA2DrhJ5jOut6aQkC0+bOkoGL4NqAy4GDBxPT011O5xycTpI+LbbhVgfV9TLzg314eGE4lLr75nhcBDXIhcp9JaAEeV7vS0kynH79YwR9WHWy0jTtQcpt14R9Ly/aNlhIhnLKwGg8ea9R6mRv/vJ1R6DTexBnjlU0km7rZFW95uWQWuX6BYEYO0kYpDA6RzhFG9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: aea1e7d3-1f1e-4b41-fee7-08df0925953f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:08:33.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8st6hbG+V/0jtoVG3JQ227stmT0PfBLBOGq3iQboDFFhyH9zsBqogfY5Gx6upKkUhPKI+SUkGlbs4hnhmLJ6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:43PM -0700, Michael J. Ruhl wrote:
> Xe locking order is power state first, and then local locks.
> 
> Reorder locking to correct usage.
> Use excplicit functions because of multiple locks.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 71bc359b2ad1..dd7723ba6c1c 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	guard(mutex)(&xe->pmt.lock);
> -
>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
>  
> +	mutex_lock(&xe->pmt.lock);
> +
>  	/* set SoC re-mapper index register based on GUID memory region */
>  	xe->soc_remapper.set_telem_region(xe, mem_region);
>  
>  	memcpy_fromio(data, telem_addr, count);
> +
> +	mutex_unlock(&xe->pmt.lock);

what about moving this block to a function and keeping the guard ?

> +
>  	xe_pm_runtime_put(xe);
>  
>  	return count;
> -- 
> 2.43.0
> 
