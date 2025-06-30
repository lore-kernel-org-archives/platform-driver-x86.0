Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E231B87F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751313491; cv=fail; b=gj1qC6sm1gVLYwdYSfBrcsQgo/7snKBFbJW5VLpDJuZlOqQrJlFcZm55SpyNTrFSYG/PZJGfW5ajITlCUu7EA41lYM2Qs9o4b3EhJEELFnmWqdWpXhT/HWQaUjy+qF5ZfHurPxr8LrwmjUSkKVnnb+1oThDboU9adpGlyYHcMSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751313491; c=relaxed/simple;
	bh=9M/we95B+8lTsF0DTpWxdmCl/TZTzlyCGYCT0OUAUQQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WkUkvR1YqQFp27E8vMKdici6CeyyMrDFOWEshdvSmf5qBeSFvZHi/8g8uaDgsGj8c54EKyBe/S9+MGbUpYiU5/myTqPnsGX/uefYM1n0B9I2Gwazm5PV9e3ixjdXWXA1nTIUByjy9nsSAQmzfZPQjboJeJmz0oPmkv4j1F+7OY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XU/Th2/L; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XU/Th2/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751313489; x=1782849489;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9M/we95B+8lTsF0DTpWxdmCl/TZTzlyCGYCT0OUAUQQ=;
  b=XU/Th2/LiKYdY4fpRS8jfjNIora1wZwrkxL3A/Q8nuu3Xw0Ep/vxou27
   OVZcLl+AFoEwI7kxMeI5SbPVfh1XwT4ifBORqyKD6k659MMEMl05ljT5m
   xmf8jsCvwXj/aeLJXi8S+mZAIhHOQsNl6Ekxx1j0l0WVhdQm7f4COLi4H
   U78XTEzbqH7YDDPdpF++Bp5Pm73rQ21SQkOpybEUvqLj+TcbHW2H5rN+p
   BJ+bWWYkJAAmz2c78We+c5lqWnr4WT0rl4inYGhZPbMptXACUDBOad5wj
   lM9cDLBVKCVgXOA/RXXz+C7wuf6zdCfzsrkQ22PeZRg39v2vgseW8eGKW
   g==;
X-CSE-ConnectionGUID: +6vO+9CeQcadpJ0pt66E7Q==
X-CSE-MsgGUID: BpYzOqXOTcaUX4Dc7xEGVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64999831"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64999831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 12:58:08 -0700
X-CSE-ConnectionGUID: 7iEAiiwcSs2hONTN4r7PfQ==
X-CSE-MsgGUID: nclGEf35TR6q1lHygwXXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153848780"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 12:58:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 12:58:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 12:58:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 12:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7zXVmiZvIILnCN6P2eqZ8hq9kRB9efeELoJBr3B3P/6gxRrp1p5fA19e67OkqBCU4RoDAieqBYu5xwLBHqtmd6bAMVs9T8nwLpQv4pu53D4ChtkpRA26+1urQ2RbPJ2P+hflHCvhl5vVDlu/Th4juhEHGI95654HLyri7zwMVvAWjhl6jNPxT4jEOXcB6qi64O7VRMM9lCBi0wTsvJbt4lVAXMDxzlaP9qEzPNYnQ9CC7USFYi75EGZac2l0sXOROhjbzWgKFaO4mV2sEtdgukxDX1zBJB5pY39D43+Fc1E/RDBzmfjAF9P2z8aiLHnfGmQ7O/kMtgsaomQIJOcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsAwqEMYvQnL4+YZZusYbIkrAICv/vCk0dpEqKNZBV8=;
 b=jVhW8jtIjvBVpNMxylc2LFlibBzM+JS5MofZ2wP3cmg8VAbG2zjaUI88Qb1nhgvZes1IkSM1szNNlbIP1nSKi1e41u8B78+RSjLNV8XOErAV33zCJU/lhQ4cszu2S2wpELwMjmlDy1wjg23Mq7m/tM69QhQor/yH9FBhs28VZoo0CzjzrUwGbYyX3RNuDEZHjjYl28bt12MWDuX6tQzZBt7W6HiNZ3VI4P+PFDYkMI6+zmfjDGKSmoRG2NES9eTL8MHE/JbmVWsFDbOMa2MW1uOeVFexr6gz3t8GC1JiX0hP+GXjKYz+o30uYFFaFG2YOTZ+BePVmF6o8CgPxHO2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 19:58:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 19:58:02 +0000
Date: Mon, 30 Jun 2025 15:57:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>
Subject: Re: [PATCH v5 02/12] drm/xe: Correct BMG VSEC header sizing
Message-ID: <aGLsR6rrszH0c7RS@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
 <20250627204321.521628-3-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250627204321.521628-3-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f70f194-8d60-43f8-e989-08ddb8106bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NBbgnpacr8lI1bNOo46BGYDrAbCe5m0Nz/pR/TEmGTHWNpgFxRg0EjzSeVQh?=
 =?us-ascii?Q?HRxRefZEd/RtEcJ75u+8ROIOAsQjDLrNRcf6PWukT99t46ifzi0QHdFeNG/Z?=
 =?us-ascii?Q?jxnIjJB+6P2OFXfA6DlyiIbqwtW6IAc4r9XDr9NTz5w3IRkS1i0OCbdmznVs?=
 =?us-ascii?Q?+FE8rOov8RM0ub+Q3J84C3NxCqvwUHQbNdkqj7R+1J9IX34Z20NQa/TxPqbg?=
 =?us-ascii?Q?RBkzXSxz2gWy8jsmHGiS57P37D46zzViWMjo9SgyhnibcRH4lqEwl6VW68V+?=
 =?us-ascii?Q?zqrPDQK37l3I0tOHbA+x/pIydjyUJ7SrxVIzTgpBl85QR3bLMHFbJINPJzZL?=
 =?us-ascii?Q?O/tcrSjQsNR4HSOfhtx+3fuPT7eJNq1+Kga167U3K6kx9J5eg4tGOcepIemQ?=
 =?us-ascii?Q?ywujEbZunbwXfxHQ6uCJFr0m+OfFVj0ZNOrz6sF+xApYN8qS8piGyCou6rV/?=
 =?us-ascii?Q?EGlp2bvcKxV+aEOn5SnovAYAo5XFYfbj/jckcy5h+B0WErv+71am+YT3N0f/?=
 =?us-ascii?Q?bi+Ff3jmx7dxcpknI918m5AuDZHs0LpzoU93mHFehAoiFTokH60oVUmUPiKa?=
 =?us-ascii?Q?oIGVBFiXtvJCjMwTxqUNSv+O++9flCl+DHQfB90crPhE/c6hhoCXv02Z4J3D?=
 =?us-ascii?Q?pb9iPzkatblVuhYwZ2tNJzsFir7wJtqJs6bnxP7W7NSpKaQXL6SxjAzcV3YR?=
 =?us-ascii?Q?FdXqmfoXUaoON+2IJUHMdNjPe4OXJ7AcV8W1Am4VWh2yWv+00vGbqOj8k5Co?=
 =?us-ascii?Q?WeSAVZcjaKlsF+8lcpOdS8iaTXzJ834LV12dPhl0G0iLR+kJ6Gv0LeiH6KjU?=
 =?us-ascii?Q?8alOkBLQhLgSJN+NENbvkBLWfyNJAC5cCE8XlL+mK/voBILyWMJmR9/Tf3up?=
 =?us-ascii?Q?AQw4rZDhWFcifl558oHDaWj7UMSwz0zJY5alioS4/gFk1aIlm4Peovo7aTLz?=
 =?us-ascii?Q?CFRY6s5ojBVQHEyjPm2Urgvrg5rGdIzwK/GplmgcS8Rw6zZP7vLlk2iyvPtN?=
 =?us-ascii?Q?bWRtJWN2TweGbi1Po4rIaesCANyJV5RwFolRZ315ZnVBf3gJr/IWMmvbRdOp?=
 =?us-ascii?Q?nmSYI5QO19ZBGvzLePMjkQ/opYUODmfM6iypBC+R897F2/EU4GdwZql2VBEA?=
 =?us-ascii?Q?jTpIwssekA2MXffCDyu5fyrypPcKBojQ6eAWeZjY5+k+YLyacUPdsnoREnNU?=
 =?us-ascii?Q?h54lGX+AOok+WF4DtyL+6SCxMABFaOnu8pkfWAp+ZjRibQC4bmQjE4XOD5cu?=
 =?us-ascii?Q?h4bsqmXcaywtZfcpmIs+ueeDsmzcQRYGPMLVGC3C66CghyyvN1Llh9e8R1uH?=
 =?us-ascii?Q?zmayAbexgzhzoXfbeMc2IYLbcUsou0laJbLVRho3mVQPsxwOsLKjpFGmJSEB?=
 =?us-ascii?Q?GDEnXp1LgJPA1g5zyIYFyyxGY+a5sOC8OvWV2WuZb8Qi9JSB9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRRsHjfkyjD3TT0xhzaXhccBWvKVl/mFFmIM4+m3hfQ35zafpG8bwSesj89y?=
 =?us-ascii?Q?FQyX+90AVnS5df8ZfSwNWjSjPXXiJyYl89984v1/9XuQKbiZIuuVFDbQee3o?=
 =?us-ascii?Q?ZkXs7oymR0YxdLVMpB7Hnd+UPXdVGMx7MzF6MnLHn5DhtBwnm1E76k3jSmDp?=
 =?us-ascii?Q?fyMhgZwiy/HSB3MbQoHcyLk2Sl41EfgN0ri+niLo/SKAkZ6OOe5TG+bmjfng?=
 =?us-ascii?Q?4OKpgMYUkjnP/WaqAARGAWkLVCVBxgGd3hf3RntfeDNNYNy85rKQi3EavXJC?=
 =?us-ascii?Q?OE141PL+YQwCcLprsh0GzwxOgHJFcS8gkqvSK+kO7o9MLsNi294/ZVV4azJ1?=
 =?us-ascii?Q?6VqShEM/WEU2gpCSfs6l5PwobnbahU7m9Lk7ldJxDqSEERSKzsTV2wVQ4Buh?=
 =?us-ascii?Q?9zOp0lnUd01xdIujeP5lGOuuDVH5mUhPc1ryMT5ko/LOvUpEQnXq4DqTfKIS?=
 =?us-ascii?Q?SlN94qGCu0u9tYWJes1PPHYXEa/BCLyXp3LSbtCvqHMhq6V+yMTOmP8DjIvq?=
 =?us-ascii?Q?SHLZDE1x2V8wSYqJu6Q2ALvj7uWYdXj2RNXpi3efkAmvvi8VcQVG8jARNTmG?=
 =?us-ascii?Q?LuHYkqU4RzirCjzqUjog8OHkHjPwN5r+Vk7yxZZ7ezYvusrp3U2bbWqMeaDx?=
 =?us-ascii?Q?gu46VdMogz7ixubOpaG855LpDwTHOoFdnHawpbCzsi4yQ5PyZtYS8hd/t5ya?=
 =?us-ascii?Q?MXoZEKvdRa64uLj7rkYFuN0/DFVvt7xH20avwD0EojqvahQia7m2DGy9UQf2?=
 =?us-ascii?Q?vBI1Wp3EvObYvLib/Gfp2SltHUVosCv+Ia+6JItAvPOPl9OyFVqd3E8NwKN0?=
 =?us-ascii?Q?V7kCsMrtZIkmCx5v07tbMDQdyuAPggo3sAYN1cZoeJv8zFHCIMYczerZAbUN?=
 =?us-ascii?Q?LW1dns88QZ3wmIpyz4qg9EO9Iz2kp0FBYcDQRQuQanzcNRyHo8Fq1IqssHmJ?=
 =?us-ascii?Q?peSI5Iq1KyYS9+4TTVAxn3ujDNoKupX9Iw371WmpTVUj2GLy62ox2GyiV86S?=
 =?us-ascii?Q?Nvd9PdK8JwfdAa0xfSwVzJW3uGLAM16pttMNEEs1HvTWKCss9MD8zpda1UZK?=
 =?us-ascii?Q?jEENXzTMcbii13BZR5hPoKmJxDTEY1fZgD23ybfwOGBTX6Ay3Gq8diT7n4df?=
 =?us-ascii?Q?3sWIcnULrJaVsYhHRexq8VSgOvgs3mAM40kgV9djupxQeEyBF9XHahFr9BgF?=
 =?us-ascii?Q?e9mguJRpcpCMjtJ55IWDde9LPaOmgfEITrhp3zBUkigphbpQxNrGfxeE5DW6?=
 =?us-ascii?Q?XvvT3UBM+eVH6N6//b8QAE7k6WLC6yinqJq9+s0em+Tkz9csIVBbyN7vuxUs?=
 =?us-ascii?Q?spffUlwEEuX58QBII3pXpQV1gNK+nipFIwFwBr3Y3BqghujFEndAFK9xf0gK?=
 =?us-ascii?Q?XOmDRryfKLZUtsvgsJVaKXOy3ZPOmH2PDN+pqA1pl0H6+o+RtAjg/CtEhjSv?=
 =?us-ascii?Q?2pTrsGUfmLPwpSBWvnFeu59x8uCiBtDTirLCAkIeT9JUQkmF3cjZ/kV2wMLl?=
 =?us-ascii?Q?84T1XJoUzHzndkiq0Yb7/C/6D98Zzo2Y8Gb/EiLj1pgFx2W1qHalsoeKWBS7?=
 =?us-ascii?Q?eoF7wD6dIsoChEd7GEi6707bHvLQSv84OmunVraM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f70f194-8d60-43f8-e989-08ddb8106bc5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 19:58:02.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqZRKMKipeCcs8v6jJQTUKRoOnY7GF3p0HazAS1riyl3xxox3aBWnQDNsP/ecceFXn1xT14uh23dfT9L+LQabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
X-OriginatorOrg: intel.com

On Fri, Jun 27, 2025 at 04:43:11PM -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
> 
> Update the VSEC header with correct sizing and count.
> 
> Since the crashlog entries are "merged" (num_entries = 2), the
> separate capabilities entries must be merged as well.

if you share some doc I might be able to help with reviews on this.
But for now,

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

to get this Xe patch merged with the rest of the series in the
PMT subsystem trees.

> 
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> -	.length = 0x10,
> +static struct intel_vsec_header bmg_crashlog = {
> +	.length = 0x18,
>  	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> +	.num_entries = 2,
> +	.entry_size = 6,
>  	.tbir = 0,
>  	.offset = BMG_DISCOVERY_OFFSET + 0x60,
>  };
>  
> -static struct intel_vsec_header bmg_oobmsm_crashlog = {
> -	.length = 0x10,
> -	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> -	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
>  static struct intel_vsec_header *bmg_capabilities[] = {
>  	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,
>  	NULL
>  };
>  
> -- 
> 2.49.0
> 
