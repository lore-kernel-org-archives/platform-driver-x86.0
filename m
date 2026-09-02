Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91B4A92CB
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376238; cv=fail; b=g6s6spT3tg511YIph3kxyuSG3MYyC+4h8/onywmFSpIbBi0H7lvBl0xP6oGWMovwYNkwDO4R3F8Z/68B6jYHnDmPa5OyC4SeH5HpB5QJ6kb+subEuM0xTw/DLeKOiff7ZnG3LmkF1gj846CAlEncHltTrI6Hp/5Sd0y/Lt2eVoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376238; c=relaxed/simple;
	bh=YIJN4E2c1xZEvGmOqAQ0Hzf8O2JX3qIuAs+kT+ny5lk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OuT9tGZ1/tDamafzT85ZLBjAZ0ntljUzLaBsbHmmhInJschY6VdXfrl+BRC/HwKMEQwqsAlLnw+U9OgxrSQ8CuR2I3p+zqfyUXtBW4lJWfIXqew65rdY9iN7gVtCyLsEhgAM25gDw9FafvcMrxYwMtaLJV+tvBeiRlcS3WavKS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJOGyT5i; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJOGyT5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376236; x=1819912236;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YIJN4E2c1xZEvGmOqAQ0Hzf8O2JX3qIuAs+kT+ny5lk=;
  b=YJOGyT5iIizD+q/69vha5Fiu300PQmFgd5KqEeg3UCMVxiRed6ByrO0s
   Kwx4oWGjYckzd3ytstilng8aTn1Q//BD5+HyRlLHHoaX2K6iTE/x8xjEp
   9TZBh8pXQ4miXhzpiOKmW7goNyZ70BNWLBWIHqy4ZiJTBb//pZotl98vF
   UmfvGH7r6B7MnyXQIi+H9jibMcjZKz+Hw9H6/b6fg/ujZ4DlLZPK8GmUI
   nT+f/+L5W/U9IQhaT+34OJAAnAAToipro1Vo8uPNkUcnFNKqzI+Zj8FKg
   5WGC1ENxdHUL94ptDQoUftFv+OtcxPYu5jbNcykCqQxhjwdKPPlaOYG5t
   A==;
X-CSE-ConnectionGUID: +ozP3A+hQLG3OZz4yKdJNw==
X-CSE-MsgGUID: tVR/V+zNTYui8rJtMY+2Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88695226"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88695226"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:10:35 -0700
X-CSE-ConnectionGUID: toFrLhn2RQazyWiYXgudJA==
X-CSE-MsgGUID: Wwvf49iAQfCwt4enWWT0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263330120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:10:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:10:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:10:33 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvgDRlph4AuJXMqqUUsBIHsk3vH3uF/+cbRhtkE3mCDpnpZEcx1c++CCxvQSy52LGOQSrHiLjnAUXsMbROd70D+hvTRC2LSxIyAkiv2BBTXCsWZGidjrCmvF2y/6aRncgZXbb3ymlBphdHKPquPpoTASSAgAxYfpuEgjE8z+NEbw+gBiIIuk8wMyfNLfXsFb94P4j6LUshV/XDH57QeHFSRjhO0Dx6C4YoKTbEWAisnXoHviDte/ZAjkMUSuo92oY5FHYBg8PXiSRSxBmD1/KkBfo9FUoghgZNSgJIFnJBi6aPsU6pIt8qmBPtxzG1hAyY8Nb1KVRzgawBNj4yC9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHhjCapRZBCiTSJ6V8nz3xFMEgHdcGdYlJXtyiLAIC4=;
 b=ngn+y1ICTDWedJ0ZNmNjZ47OqvgT5lOhHHXwNG1J0wRRFBoPbrxockHcEXbijxMUjg2Eg7ophWXTvkS352Du0qNNaw4P4cqS21L4iCt7myj9/XzY4dU4Use+gjyi2sLg0NoYoY5tVTlDUn9dTtey47wqp24hkwEPIL+w3Ai4MvE6KNJ2DtJTWav8ALLurs3HfO+wxn5aMFq6rn2DchiMUw8i3F5BiknS29Eh/9sv2K65IoG0K2Dxsh77Lf8qi4Ka131tC+AT8nw2bEGma6j7DOjicdaPMLNfFaphB1oIlyhlxtzy8Uu9TXYm+GNl630S+bgSiHumJiHqMnKrRYskgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:10:29 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:10:27 +0000
Date: Wed, 2 Sep 2026 15:10:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 09/18] drm/xe/vsec: Use correct pm state get
Message-ID: <aph0nAWjVme8PIQO@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-29-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 8232a8e1-e8e7-4feb-72f9-08df0925d91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4cyMQockCpOq8BjqfdnDtic5PLSPQTnmWEe+NJYla4CtBVEudm8qhQkd2Edm9KajkjcHHprJHnR2w5C5VCUsL7KBkT/+ICJxyeBS9qDu9J2zlS7sYjka1hIKTCu0Djg7my25LR/e8FujasrtQauMylyEz3hg2tdBbiUkIAbtFz8Y4f3G77ZZSlEge+gUJbvxMUChRabFKcwvFDChUSIJKk/wsBeNIhanC5ihmpf84v39cbE1CzKydfrNOQILy065NCcnta6Upvz8SM99OfAnDnDc3Psw0JHZwju15tpY+cpvac911WfPeSxGi1yaY6naBW/hmgPb/ZA7kVcKaORMiyxG1xEmqUm/bt5ynLyS0IXXA1jwY9+AvwvvLTR3oMAxNFTKICUGwaRsqi6arIe31qgXbPRF8S78x51URGP3V97nVvjg5Q2yos4p2BPmGCMogw2Dnicn0O/FO7cl3IhsGUwNG8TIro1lVllZ5/7xYKtuHXsXT2KrFZm9Sz31m8YgUF1wgRpqDUWdUHT3WK4aidLhL/fjFN8QlnQaX7xYRDtHYl57rmBUdh4RGyhh0hHS7H8S345Vvrv6o/wij5Jg5+EUJ7IaVGTAny6NC5gh00J2pwaYlLHvv3spscpxkuowgigfje2FMvU2XHWNYtLb8uep1Rbi3aS+gjJ1Grq1wk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0h/qnKGimegfGOUSRqv7GW8mNbNLuVSCdEaf0ex+i10RHtvCjTL4K7tgKwxu?=
 =?us-ascii?Q?yyxPwSxkhEyZaKUoF2KGQkKLIDrh90lJS+dNrdx0YjGTVC1lRF5OYT6Nez8R?=
 =?us-ascii?Q?WnkqMnGk/YjNKwpfbwzysLsfJKeXR6ywZcxUdaG9V+NJHOfXu4C+S+7ZJpvl?=
 =?us-ascii?Q?RC4KNs2VzhVcT9ynqjaC5zTbFLiJkOEKQYWNdagyRvhxP1ChVC/mxJ2WcrXC?=
 =?us-ascii?Q?SjUaOVSsrgbCR/cEe19Y4rpRc3fobKtePleQjRiTxXtj37YQ1tWFQUtkDp2A?=
 =?us-ascii?Q?otWWl4TECzyQ9R84ppOXfjGYb1CajvRplkss/4Ms4Ba5yv6gVVUq0dFZeDVr?=
 =?us-ascii?Q?vY6UUrCBXTr3sw26vzJhqRfPv0OQ2QgY7eZZNXntq6VIFytwTuunonxsnOpg?=
 =?us-ascii?Q?uRE5+S5ac9mjhU+oLjd0RV3dXqgaAKB/Pxfs9udo5yla68G5Sq/n3I03Rdye?=
 =?us-ascii?Q?wRNKuh+MdUV/J4+YWSBmNuaeYELZPiQ9wifEMKTa5EpiLlJKjrc5tGlm9O1r?=
 =?us-ascii?Q?cf6Rk76vELs/0TDLZXgeGhsk9FkJSFkxCD5T6dWggeNdxN0rO+5rzDBMtloV?=
 =?us-ascii?Q?NDzw+Xgl9g/MFAMV00gLJjFOilarmgodD1yw0kNfewWmnJVNjwTI/QGxBPJd?=
 =?us-ascii?Q?eUFn25vOSukV67qRlNED8W9RTYsCTfwXt32shJk3ZJZkmIDocmkcnq1igSGa?=
 =?us-ascii?Q?JDwH+q7v9KXudFQnpJ52km9n5x6RTFKS7flRB41W/rEl0BOwOgFy/YUV6Bt3?=
 =?us-ascii?Q?W5/FRk3I19RK9oHJmXqhSFKalaF3wyiju0gGzuzBO8ts00Uu9CfnfiQPFZMQ?=
 =?us-ascii?Q?1Lquj/fvmRujU5slk0e8SRu69Fpm73au4p2blpu/vhJuyPl4c6V4vPWaCkPC?=
 =?us-ascii?Q?0BERZLsIcG/2QHNX1WAb+oC6Dy6FLoJFD67kFLfbgyQ18w5nstGpWVXqewpD?=
 =?us-ascii?Q?jl2Iz4Gl0Uj1C1XEQdkEA4CywXpGkPFPsur+epw+VYUGBmCHCwoWcM4q+Y7P?=
 =?us-ascii?Q?7K5wnnSD4/4Ad7eiyxoXk/u83+udFdT3Qvjfr0X7vAADPjiXKEg0WRFF294B?=
 =?us-ascii?Q?uuMIdjC21gnRga/QWAooei3FGqDM0Jeanthc55DWS1UMRU7Q/OtkMxFK7+xP?=
 =?us-ascii?Q?bPEL+xjerFJxfNxYfmeXrl2q0hXK5ebc/mbDeF9NFxY5hLb/QjD0JhYW/rfk?=
 =?us-ascii?Q?iVnBnkI8N6EK9VvLJqvNxClqMZy7DDn8mj5BcrvCQP/hKt+gLJOkixX+f0+X?=
 =?us-ascii?Q?7AvNIEbCBaL9lgk4TU5wNPIUTGTYNt1pxIupG9eL9kMXGzWnVi30iu3JkXRH?=
 =?us-ascii?Q?JRlfitwvm5QdiHzlFrzW9eUyeDWd/TXsZH5qBYZ8iDT8M3BhG1Ie7B+VMH8Q?=
 =?us-ascii?Q?2z1b6Yi4OtIrtlQpL/xOgjkTEw34pPlQMa9hk8hftVuPHv6H4bcNx1IMZat+?=
 =?us-ascii?Q?wnYzEM6l+ha9fRY9oGXgxVzd/VvHCI2rvhOHxElMwEA6RJvA9rbIAks7IcXx?=
 =?us-ascii?Q?fNtYUptH8xQxzk8JSwE6jLX+Vt/KIvdpKWMksKI019eVVeRpkZI1+N3mebTu?=
 =?us-ascii?Q?apj2UdK8TTA1UwFWXhC8P8rrdQsVkFSd6jm5ILgUbqIIBhSKyeywCWEHpn2D?=
 =?us-ascii?Q?zgN3QIJcRpm1TPbXSoLKJ4FZ6NOfvSes6AW5DCK8hTp/ea85MzMUZmsOIIbQ?=
 =?us-ascii?Q?HlK0vuytYdvPLE3tx2FSCqoVRWMLk7MVeVP69nOlcH61l2dr/U0RnZmVZDwu?=
 =?us-ascii?Q?1d5iVuxErg=3D=3D?=
X-Exchange-RoutingPolicyChecked: STl9EpUCi0FZW4hcTwko0X/CtA7hLetTCNmKc7/uoYisP/4bWiLRWEI2TRb+eA9wFbVGPfm+ksAeBfTnU2NGT2jXHOwlpXgYU3/xAQM6rSPMAnFPuJJWriCJBpMZASY5YrmdelFoDuD0cI55H1Yi/ADiZGb+4Z8T9qIDebo8i0qWVjoG62BgPby6EPkyjIEdIFbWyUQizUBZ5ZCwYoCepmo1jf1nocpUuVslYhalvNcygMeMXz9tTq9Ty5Zxi6l26VSOIKDENjHJu6m7cSiebYiNZxWS4aM6f9TxzUAJOIUJtJAAhs2fJJ/33m3K0f1zh/EjBaP6bn1ndeax/qwr6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8232a8e1-e8e7-4feb-72f9-08df0925d91e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:10:27.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jSWoX1qrLcIm4LdQy5G/gnHxXU7St1vZct9qOPtIAmadhOUzMgn2WR2wRssUz8EbYvxSk/wMnGHLO0iy45IOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:44PM -0700, Michael J. Ruhl wrote:
> Crashlog needs to be collected at all times.  The current pm
> check assumes telemetry only.
> 
> Update read path to enable device for crashlog instances.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index dd7723ba6c1c..468a221378fa 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  {
>  	struct xe_device *xe = kdev_to_xe_device(dev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -158,9 +159,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	/* Always allow crashlog. Telemetry, only when powered */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);
> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;

The watcher probably deserves a separate patch or at least a mention in the
commit message.

> +	}
>  
>  	mutex_lock(&xe->pmt.lock);
>  
> -- 
> 2.43.0
> 
