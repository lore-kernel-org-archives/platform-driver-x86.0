Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168F2C0268
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376525; cv=fail; b=I1zNlBM3ZI7xx5AqEjPwBXBMT1YoS7bd0Aew8AGNwGJ8HnI0lm6dVyjVhiOFXi3W6gZ8Uf+QWFhe8XcX4wpQkg2fhlm4m20xp24hcnm5uUxjEjaY7zHlUhVGAlhww6zwwX+fq6lTdh+DyK+KJZLVPqXsjJ588nFmt9V3IETr6rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376525; c=relaxed/simple;
	bh=C8JOpDpIJQ+do9xixAfMaHqv0/4WqYz2ubyI1AxomGo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CUODZyvoE1MXVrLTFvQPbvdCcye9YtbHQe4F63KruwVjrfjOvRLwmkGLJ7alq75dF+B3weoM7uxtoSmQz4rPYjfZBnQrzNfC+v06uinC/6JcV9+sFk6Pgxz7ZmGZLu1bA/YaST+QCfa20NovIrbzKgrMKwymZFHVNeM121wyPAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsqzovbC; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsqzovbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376522; x=1819912522;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=C8JOpDpIJQ+do9xixAfMaHqv0/4WqYz2ubyI1AxomGo=;
  b=VsqzovbC6oHnQ1A4BrobOz4SK2MC38U7m5OOLErcQMm0QTqrRj54oTZm
   dCprCGT9i2OOzuRBV2YGgMJCeCG76TJvz3HMHXZZaKsWZw78RgQVe1vrg
   jlpQxdcYZBs9qwRf+TNSovZHBwk3qHbvETjMb+A8pfM69SNYY/9MSkAVF
   2J/4blPHiFh6HMtUlsuFr9y4mqBs3fEEDTVYWdJcIB8mOoDFdVuHCQGxi
   +5S2X3ADMe6rSybpZneKh8d74OjvqEFnBuMGjxdLVUUroVbrbYpgnRMl3
   YoQJgk5H3NbDoC0S3a+VQGFIzVWE5xuDaq6usIbMWnp5f1mUJkl+suXaA
   g==;
X-CSE-ConnectionGUID: g5vuw1inS/KyxQtGl5TY/A==
X-CSE-MsgGUID: 4yAmIYgKQumZQPXnHBo/WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89058150"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89058150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:15:21 -0700
X-CSE-ConnectionGUID: Ng+FtrCQQ4ibIGHucBy4ZQ==
X-CSE-MsgGUID: yDrXsfifQjuy81QyVSlAuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273658763"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:15:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:15:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:15:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:15:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0UT/IZ1VPFLJyx/p7RqENgkBhUsdXMd/7gMit9xIQVKNTUT9uYB70Zst5D4BREsYTIGqzYqRau7rfQ9Y3Xw/+ObNOKBn0Juj1MUiv5qRCobNJVkM16xRqisnneKgLKCtdNrxNpI95iYL1KjG4csLm9B3RcIej+q2PPv9ewBtSbVzIZ6HFGMI64L4rynfZNKdz3jVhRLvLEuPgCkmnb7HbahVNucot+w8lwrTie0fMeufPX09gLuUOprCzStVuciiB9OaHomTHKWz+slpP/Ty4DQSctEd/6AYuCfCrz/UO2QkyUChCA8F5FjTSwJNx6nLDeybIW/7k8jQn3G2IUJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkGFQfVZU495Xt4dw3/fFdh/hbPvxVh6aHhAi7R3M6w=;
 b=VBjstbD6yxiOY6mYZJABRIgj1TPhDnOhJMq/YK54NSXfVwnnD8ZX5UaQdkAXwask44rH1icG/sb7iBqpMXybQ/MbVrxmpQZgA4z1s+RGfpKAQs6jYaVirBxVDd46gIVtaCojLdEH+J/Fjnw/78vaB345X71qT2KVEdIbPovlPc+t84zekA18junM+fPppT4lsKMXISh5FvaIY52LXuNLq5BqVYSPJbZIm7Io8vOiphmcRJW6Cal4GVhW7zjDPIzGDQzfwxApWVG6amhMzNzQWe18hzwcyaGwXK34heu1DXKeDDeK27jqD/GPS7A2KdJKYfRoYyS92/94DRxeN0eFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:15:18 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:15:18 +0000
Date: Wed, 2 Sep 2026 15:15:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v4 10/18] drm/xe/vsec: Support possible hotplug exit
Message-ID: <aph1wI_JKevc3w1h@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-30-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901192736.626777-30-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 11535c97-5dec-43d7-77aa-08df0926865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Yfp3vWrZ8/0Mr6av4r9RV1yjBG4zEFaK5XZ1KQqwnXBo02+clzobYluSyWd45kLMrhx85HgTlcq43oL+n6i8LncZPIYL8voGuytyiKNxSJMVNPCzwPZXWcKMdvvnIkBuIvNiKfrxFowD5dn+TAy2VSZb9i6fE8MKelZ+tSoYWHmpSOVHWbnq+iedSOVHDCAGdXWsdxl36UDt63XOqZb15Wz0Nt9+WjEuazu5e57JL6Ww5yPUDwUiloThGyJ3SrP9zgsFkl9XQjVqoiF2z57yG4I+GLDmrVyj2vAjNw6Aj/SfWLzAfJHMFsSVDIKqfyLJ/uVJVRGmis39piikumNyAeUcANU0Mqn4WIdC+diFVPtbcsR70exKtN8WuZ1TiZZloG/QUjT8qTwEr0XMU01Lz+5QOGay0M1+KoiaanLQscBjTjVdiPejVTbDQGFr7UIcXy1lcZVQI+jEPj0ddMSyDtk0WviRP1zmJB68CFAWpGJtGqRoPKO5Cxm+InedcRXyJqmuf8pedkOamGKjpCWWFhCR15MkAYWCbAOgrF/PwbynARx4bSZ0d8sMUs6zZlg9/a2Xp4A4RIkftFz1Y6PClgEwzbJnOYK4efsFU9A8S6Z4uRkvU1WoTSBNQ8LXinBPzb7FEnNOy7EbtVHFS3+kWvyDLyar/A1nMpLu3lUoZ1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oj4LA7L2eyDn6R4ZfMQLBSkS3ymbCVhFO6GPVU2x9tnOLi2QiH2P85b1JY7Q?=
 =?us-ascii?Q?vCGHJYTegEWrvfo7ivvgEzjOmYc2sRvOdvFaEnp/jAO6xJwTXt0Jf8aILseT?=
 =?us-ascii?Q?GiAOkMM3npFPlLLiyHXGEqz1FctXUe1QR3e+pdaqFtQ5dssBCSwNKjPPU+NZ?=
 =?us-ascii?Q?+vpOUQ900k/+WewHLvBY11JV//QGddBhrZo4l4AzZNbFJQB9GFZ4rwta8FX8?=
 =?us-ascii?Q?n4RfXNMbKYpuzkKajionRzM3dZKIaSI4/FYKUvbjarsG3PIah7qAnIqbnuZv?=
 =?us-ascii?Q?R3jtZJ/4Jzs4ehm/bWjH0sjJP9tlcvYB8vFimW1KKkFyAfp75NtWk893aGOu?=
 =?us-ascii?Q?fR+qucE31o1YhdlsT85SUB0hgFVr3YwLJn9vMSN4GHpXGSHXMdFDzzxk0fyB?=
 =?us-ascii?Q?hHzDPMAuTPK3DfkhSz3Im3Z7JQziojl2u58o04TRoaWIse396VonMok/HApi?=
 =?us-ascii?Q?wktRBwLFQwjUIYz2Q6l9ZTyW/pnXnooEA1PxkfN1r+ZUGsA8fk6SsA+ZBfZV?=
 =?us-ascii?Q?n8BYQ2oPHW2qpc3t8QVGi1iYVRqCGC5eCvfbF/cJpoTSHYpCAp3VdCQ98Oxr?=
 =?us-ascii?Q?ot/ELcF0tR2dXqGpf46Du85rQ/goVqolOSQs5eZ8lDAAk8vN3aekSCL/OVMJ?=
 =?us-ascii?Q?5Ns3FhGnxkM3IRSWA3Zribfww0qMQEQif13iwbYWbCiDQRXlbEQn4DvWJqG2?=
 =?us-ascii?Q?bUA/1zjiMxpQHFbCAwHnnGMOqah56dMSRwSDAEh3nUk6QCsiBlv7wYtMEdJ0?=
 =?us-ascii?Q?2vaf74Sk2+L+XsyD0YLaiDVd41NhDYPSm+SAYSIiGc3CcCig+4YiGjzBb/S5?=
 =?us-ascii?Q?msLV+1tUICEGccOZPA1gzKN4+oOGGC1VdDIWboIcNwqfGqRNnDWVWUI3k1i/?=
 =?us-ascii?Q?t0hn7zc0vcP8JaWKorLCLZvHkWOnDP7Vvkxya+szmdQLAlfQGLaeGlO4Tguh?=
 =?us-ascii?Q?8p/fDZmfnB2qdv9SX7aBj5QXWy25SgGmQZwtMqDCsifkkZ5bEwdBN8pvGIlV?=
 =?us-ascii?Q?YCDrpFzLUzTlZDIUVHkRIdYDIZrWpGCsv2gphGniATtmaGcM/fVZ8rdN3Cin?=
 =?us-ascii?Q?+E4QIZws/bM2meQbLnNt03W3x0Loytla+lB/qr4ZygNFCQ+gTGUJLmb6N9k6?=
 =?us-ascii?Q?1KHEmC2XTRbBWSN0BqSI2+C2SegYrsRFEUPdj52bbS/VU39wGnQuw/3R0Ags?=
 =?us-ascii?Q?pGcPJlTkpxCgkxrat65D+Y/+G7VXwajPgCIJC58c5A5aIjILenbgBz0hRMXz?=
 =?us-ascii?Q?GnHRzezzoYZEsb2TsSqsTnzVV1+DbmoUI747i10WSwQoJw/UxJ3ktFX9rsK1?=
 =?us-ascii?Q?f5kriuMdRn4I77W/Htmj6hiV61VofU8uzvWJ4BraQp/NBSdOrkC00Ttl/zBG?=
 =?us-ascii?Q?PQlcb5m/31EmFcr3oPGYX9Ws89QnPevCm+A/cKnT/HxbP10IMRqEW5/VIp1D?=
 =?us-ascii?Q?OpyRTWk3xq5kZ1I7DtC+cZvuSdwtuWC3uz178+21dn/ZIwrgU0SZ2PPgTtaY?=
 =?us-ascii?Q?/Bg31B4BwW3sV/teu6vFBpb6OPvJ4ZYwLR+zfPNkV626w522oSH4LyjUbahW?=
 =?us-ascii?Q?wCpfajU1fKSvofHNm53ggn4GsWSgD74vZiP2dzcn/OknAdNc8dAI20VBB5lv?=
 =?us-ascii?Q?QvSuqJlbq4CCzeT+e1GyXLEicsdAACaul/1ooWZ6+wch4Tz0A0Oml/k+xhOE?=
 =?us-ascii?Q?LQNLdf1ZT7T5jBFGH4qRuC6mDXQZkwu5OSAQMs/4o1DH223aW1n2kfrTZqNh?=
 =?us-ascii?Q?yH7YTpv9rA=3D=3D?=
X-Exchange-RoutingPolicyChecked: KNj0BQmorJ25TFfyylm+0ukBbO0699z/j022NNqkuQhEDjBWQ8h8nLniRsrc5+qo4eNQCK/QG+p8QmjYKB/DkqucQer9mkgmafqEYBMDDbjUyY+ZV2VHePWsQb1fuHpkxWgSgTWaIiRq4LuD1mDwhJFC84TRKDMUexbu2vX8FrkQhD2gigkVLCQ75c01TCJ9+739iOb2y0WNc/gW237hvo5EQLvQClLb2UuYwY6UXdOrnRX+vUpiduHsl/BFTb/ydg3nsVjSGPhPbdWjCQDJfYXvQk1f2OVb/FgFa+m43YDQMn4DqGY1e3vmkRQHVl1tsmM3rHcAYOxlXnHy5h/x6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11535c97-5dec-43d7-77aa-08df0926865e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:15:17.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkC3BU7lv9xDbX8Q3lmTGTc3LF8g45G5ErwL5A5GFS8z05AZZXvMsn67GjEF2Y5PGsjDEJLTLLBtjdNrzYtb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 12:27:45PM -0700, Michael J. Ruhl wrote:
> DRM has an API that will verify that a device is valid in
> the hotplug context.
> 
> Verify device is valid before access in the VSEC callback
> API.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 468a221378fa..c6299629dc27 100644
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
> @@ -140,6 +142,11 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +/*
> + * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
> + * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
> + * verified (drm_dev_enter()).
> + */

Could you please make this a proper documentation function?

Worth also creating a proper /** DOC: section for this VSEC/PMT component here
and a new Documentation/gpu/xe/xe_vsec.rst

Thanks,
Rodrigo.

>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> @@ -148,14 +155,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
> @@ -165,11 +178,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
> @@ -183,7 +199,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
