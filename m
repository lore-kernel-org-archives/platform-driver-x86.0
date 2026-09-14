Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9C44AB6C
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402267; cv=fail; b=spmwN0TID24YAr+hufqp/WYqIbo4rC1dGSVhDm2UcS73rK/rZLDmWhNx9G9nSI/dXt/cjwfixJkBobAA844zdivqHCmZuhxqSx/InkHhsP9X0NnSwJT3zobeMs43U+Y5u0EtFHHTrva8cCdu2I5W13r1dWoNwDbZPESltFIUxNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402267; c=relaxed/simple;
	bh=5l+LNrgCTNaxoeJETp7ECLmLXlAXUTos/q52O2XdxmA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AHgW96y2yRtp0HOmmPQOYbaPL9x4WkQMrnv/JfBXHq0zMqUvGS39RO8E2XYrUA8efoquHwGslCTcdrOmvk6AEHZP/UArrB91GlvrCrXMhP170yqcrdbiPDvp50FwKW6WlQuF4mwmYw8TYwlSRPJplocbRxYLB9l1B5Kv+JYUqoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJUdOlRn; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJUdOlRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402266; x=1820938266;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5l+LNrgCTNaxoeJETp7ECLmLXlAXUTos/q52O2XdxmA=;
  b=JJUdOlRn5vQMYgXWcPlJPfGBYxtnpV5mcyV1J4Rq2nbWGtkaHrTF85kK
   QVhyU0BiKHP/eBQa8qoF7rx/08K6NahB7Wm9ah5tDVOxSHN9JnyN9uaPQ
   +E6mbDES6BM1dTx7XgpyZVePVuimPZJ1iO14LadkaZq/pWdYR9B5bQsg7
   oyEWqghZsnWe5eHouh6KZyG9CpUcCVpLJocUelu57jbnfWT/0KGD5Bp4w
   Yr2LzNC5995GBB6I5KxhkDtkRj1Cy3cEygPKWar7cqE95ZgQr3CWBVs6m
   AwHz2AeK4pBZarhhdWJkL9bAb96an8f1aqmZ7MQBPXsnOnHF0nYgsJstN
   w==;
X-CSE-ConnectionGUID: KK+2+e41TFKUTaZhoj2GPA==
X-CSE-MsgGUID: TdEGLBmHRy+GUkujtmafBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89697920"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89697920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:06 -0700
X-CSE-ConnectionGUID: VCmuYXYZRaSYecWRfec1LQ==
X-CSE-MsgGUID: Wr/CR2a5R5CIjOonYf3mPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268999767"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:11:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:11:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpW3mgik4MUjFS8YC5VkY7BZu0nsd5BBJhl+ZdQyI7Rk/6IXqeEx/TULJAYwdtMby7wr75mg6UbJdGZiOGmjp3kNCgyh+C9qqitzoxs4+DtQ8wzd0XnSZoEm1URRxexxGKDL8G0u+plWqvoaFzETPZvzmTh/2JWfaBepC56wFPPouIlNy5OFIkoiDaatrh5F+oprnDluB0g74inzSD35FAd0A+sqvzz0EZ1t5ClmpU6VGyysgZxKPdixDkzaSZzNyYFXefR88dfmjLDbMEKbnhg8OVHn/3XIjdjsWPOigsPkNurzjYBQgIQcB990VUkhnXgONaRGlkYya5esA2hKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0ijCXroBsW13kcLye0tibIQBa9EeFgPYrlfLEfxdOw=;
 b=n3ec/idtiePD4Qz9fbyH6KNwig2kRM3CyRH9N3FWqbs+qoQNfmpEoqASASDvWn8K2mLTblLlpfd5hj5FeZlznvcHHyC46qVrIqskzjudKzunJoWvFcmzpgYG1hdWvnXh1V5d23wpnJWJC1SJ+eJbdmv6oKreS8zplnCORtgk1P++YYVTpxhZiMumjm51PL7TRHA8yhmkrKYOioJQfKP5iTFP4BPHM8o6lKj04rC6LmY5gbYKvOVP5jetzsr22ln+ua2oDiFwGwlOsaauULguoHQr7D7KQRrTnOKi2dcdJGrTjUZCBp7g8f42fiw+greJgFUGQd5F6L4+LwUGacsL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:10:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:10:45 +0000
Date: Mon, 14 Sep 2026 12:10:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 10/20] drm/xe/vsec: Support possible hotplug exit
Message-ID: <aqgcgB1ftrwUzi1T@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-32-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 1908fc45-3aa0-44ab-9b83-08df127abbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: QmnQQbt+QJF7cYXs0NNObYyvc+Kc4m0viBlwzKcFrdHWmeH4Jj++vTCD/8a/fRD6lapJmQD3L/JRSpA8py7oqrVXmYD8mhGyUs3s5469koO7ipVDfQjXdzi2lD2147E0ZxjfYP1KoXlqKQRpx3UOSGPuiIh+ibymlXQlnXjIJqEgr3XWbbJslRb9KbURQk1v6VNCZikbMhAIUXbEOOLLBx4PwniTpRBatxgxMOIDTfyij7m5UbOyjbZ+pKhT9bTGc/NZGts8M7Sjr/BXnp/69iMQJUuDsa+EcRZbdxP/zKZc9KjJo4sa1oqI2MeHt+tMvhOcRKGMFNEZPClzQgrNYhNo2qBtT2bY/FFHrQYGh+1acNkvD80OWSR/qsnCcdddpi3FXxIvC0ERmcu65sGaKETFGoWXG7wyF4EvEZuiz6vtDEppgboK1LXiBMoKCjXwCWeyIkSyfJMZ5CHLuEf44hIuJnu1EPnBWqq2F2hTtEhXwsWYirfmX8SWfodCFoQs/y4XYIehnxYftTQhN8ybhdebajral3VEywyAl1+4zyvP4EqbxZorttctXhgcFgOw14QbNM6++U+g52tOINU6Ks4kQDYrTgEuAcO9cdwjMQacrz6NhNaFNNUqioiZ8bhjAO8e2NjZmJOCE3pPFlt0GmMIrYg1QdBTFN6B2Fubco8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BdG4GDAJyDp6oDDXboCbtEbNIABnrkokfHFvB1Qi78+x3iWhDStGvFUbfVK5?=
 =?us-ascii?Q?gDnLcIoPx9aK045QZOkYn4D2ah4FhucrihVidn1Z6wrfzdCgdUOVlgyRJ3JV?=
 =?us-ascii?Q?YrEAsGjvg9Cry3H9w4B0j6+nwkt77hdZocQjMGheHVKOZ0oF4xBKf4ZDysHl?=
 =?us-ascii?Q?5CvcKPGNaOCeueoqmGVfog7sr1RQtRECwPvvA51VN+q2ZzZvEoM3XRVYSAwL?=
 =?us-ascii?Q?U6UevpIg/XGVZKf0MOPIBntyiacf0KjJDxv2Cy0lPnZ3pUu/PWX57IcAPErP?=
 =?us-ascii?Q?zp2xCpqwcqiZQA2Qi4SBquKbWPLA81ZKKCwkAreG5F0wgUjodKgWchz4sQmK?=
 =?us-ascii?Q?jenNclblgt+cBzq0gAlsW5rs8mWgQVKYtYJU2kX2wV6iynlkCaAuUMnOqq/Q?=
 =?us-ascii?Q?NZNl4eqn9Pch2ZYLd5ksVt+AxhisukuunNs4ETpxV+vyEU2zPdxAIVnHbTzX?=
 =?us-ascii?Q?22M0fa+gaeaQXfEj/qUNBx9+PPHfTdEaO7Xl6JP3koVT4JHZ4VOd/JB+g0Oa?=
 =?us-ascii?Q?GsiFv6cHA0oeXiR692yvJv0corrmnEGxTEjN/tByvBCfv3rIDV/dWtUKA4Ue?=
 =?us-ascii?Q?/QDRuEQkM9VAOAF5KOuuPR5wjum8AslZ0aDJwSKlpp990JsKOS4SbqDLdFIH?=
 =?us-ascii?Q?Xya0u59f4HnLXNfW1EbxZmfYXsTaJuUIWRIneqF+/MW3XLuVKtx6TRsBh4WA?=
 =?us-ascii?Q?l5GjK+DwcB1HWvNKL4MSvp31DTKhlj4G5Xghc+/4B7ZgQywPi7SzWOhgmAud?=
 =?us-ascii?Q?iKargKk6rAuh7DC5Sz+4v+FlpHUSafX2MB7gygRxkC8wJ15eYh5mMZCIgzk6?=
 =?us-ascii?Q?s725jSy11ACNQP+7W4+UxAmlNHUIl3k1MiyU+bjrZolMIA/2zosS4joVZm8y?=
 =?us-ascii?Q?syYNw5OSRVP7jR1s+fMMJ6lGgkXwww3a+FIqKWKFyMmZqpWs1gCvMdjaaAf+?=
 =?us-ascii?Q?V1iNWRo9pFKwdp1SsvnMbNY2sD9/bbkJdVOGUelwrZfFVeXqiYGYwS3os1nb?=
 =?us-ascii?Q?fl9drt847PKWThb/e6xVwd+kMwUMh6bOU1XuAJsWR7g73oWbtsItacEUsi7Z?=
 =?us-ascii?Q?J7Tr5qCiKd2OV06wBA09OlccMr3xIXCc6pBYoaHFTMVAC0E4eidZND+/HEod?=
 =?us-ascii?Q?2YRP2wgQNchhDNWtugKdMGKziEuNyDJHcF6XzbJzQgX5oKzNMtB3I/qTxOOW?=
 =?us-ascii?Q?Yh7tbsIRbqq5WqxZafLcJjvYMOke6EaEVV0ufTv16L36OoT1SCnTRks0cWLb?=
 =?us-ascii?Q?+y7ovRZpoxbgSPQAzMCy7eogA5BQVsRsH36k4JNNN1OODs74+3XA6dICoibA?=
 =?us-ascii?Q?T9cN55/TTRcUtsNyKE8fexmkIUrIWp8SUdIoaYuxKxxw73PJubFiUwqTKC5C?=
 =?us-ascii?Q?CGveL0yS9VHYrX1JX/N8Pj0U2+pGw76uBTCrNs/Y9RdMqEJUCZyV/1jlXpMa?=
 =?us-ascii?Q?Feutw5Wk071AQLBciuWJeWYIu4ErFMUCqjoL6kfEOZXEexkSAaYmsIv61uwO?=
 =?us-ascii?Q?a2h71o1cduPppxFAQbH6ROo1M/LaVfkmwxN5Pi1q0+PEdYL2d5sEwfN+Kwj3?=
 =?us-ascii?Q?n0dE7rkkgd4VyihAngIYv5O/9ahZG/zGrxovttN7mfAh8Ydnycz8ebK1GPkn?=
 =?us-ascii?Q?msZyPIpGdT4qdGzomZAVYbqntVRmnQZHaKk8phMuEpJ9EMsTF15KUF2fM5mJ?=
 =?us-ascii?Q?1EyfPhv3rVKtXkPjRrXUW3ie5X9oBO8i+oUa3fSkEySuqlJEQJ3/NwORxxSN?=
 =?us-ascii?Q?6Teeu566zw=3D=3D?=
X-Exchange-RoutingPolicyChecked: K1K8Ea58CX8ISlIiOjKw4VQkGqq0h12E0CA8cd7BdaeTDgy+G23fni4Tov7CjMtUXhnLzC8jjC59ohTBEyVlFlJFjyvaWAfAasIv272NK4ikNKjPQ4CIHrQaDUdRQbGThsNmKXF40Nk4+X75eTnKUyR9uVeJoN9vlGi/DVK5lJ6bbWWle7cspsOsePB8BOBO92Fk12NK1AWC+V6UrYjyYc6npYishQqnZYvUMtWMXuQ3erGirm2LC7pOxQgwl4YmpUTW/UTcSS3LNMAB+Fu9m3g+6QRaMbd4SLBQUHxcQLqQg+aXM6tcIhNfbqeivGpVGy+V+wKLCs/mxv0u0fHSkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1908fc45-3aa0-44ab-9b83-08df127abbd6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:10:45.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFH0AOlC66HdguWcmK2TwBaeVu+IunqiJy4oqMdWLYAvXxObKjX/DfIUICgBSe9zXwSwfFfbmf9pvG4EIccTDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:58PM -0700, Michael J. Ruhl wrote:
> DRM has an API that will verify that a device is valid in the hotplug
> context.
> 
> Verify device is valid before access in the VSEC callback API.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index c0252f5b508f..3bea89f2a5c5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -10,6 +10,8 @@
>  #include <linux/pci.h>
>  #include <linux/types.h>
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
> @@ -159,7 +161,12 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>   * @user_offset: a user offset relative to the beginning of the data to read
>   * @count: bytes to read
>   *
> + * This is a callback API.  I.e this can be accessed external to the XE driver
> + * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
> + * (drm_dev_enter()).
> + *
>   * Return:
> + * * -ENODEV device is not available (hotplug)
>   * * -EINVAL for VF and PMT WATCHER requests
>   * * count   number of bytes read on success
>   */
> @@ -171,14 +178,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
> -	int ret;
> +	int ret = 0;
> +	int idx;
>  
> -	if (IS_SRIOV_VF(xe))
> -		return -EINVAL;
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (IS_SRIOV_VF(xe)) {
> +		ret = -EINVAL;
> +		goto dev_exit;
> +	}
>  
>  	ret = xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
> -		return ret;
> +		goto dev_exit;
>  
>  	telem_addr += offset + user_offset;
>  
> @@ -188,11 +201,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		xe_pm_runtime_get(xe);
>  		break;
>  	case TELEMETRY:
> -		if (!xe_pm_runtime_get_if_active(xe))
> -			return -ENODATA;
> +		if (!xe_pm_runtime_get_if_active(xe)) {
> +			ret = -ENODATA;
> +			goto dev_exit;
> +		}
>  		break;
>  	case WATCHER:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto dev_exit;
>  	}
>  
>  	mutex_lock(&xe->pmt.lock);
> @@ -206,7 +222,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	xe_pm_runtime_put(xe);
>  
> -	return count;
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret == 0 ? count : ret;
>  }
>  
>  static struct pmt_callbacks xe_pmt_cb = {
> -- 
> 2.43.0
> 
