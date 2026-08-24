Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26D375F97
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787599105; cv=fail; b=uo4LnGH6Onz45CdoOxYGtXNvFgMf8MaQFSX1xSZz2rYxGc8N7byhqClcWZdvihCyEr50lk5rcZ1uadWxWKOpBPwugWHw46kuKl1B3PT1ilT1oBzzNxdv8aJ3UyVcFx70jj3tyCNOKPe0ZiMoagaJC9ZTK6/Xp5Chi0pX/J5Dam0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787599105; c=relaxed/simple;
	bh=cugDVqAjuG636QnA6lpABpanUJPZ0GZiYb8AtuHmGbU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CP0fm8Tm8QRK6r3x/JQuOYM1Bjij0ZhJxEQptzUsn/wyZ3r/ElNmvIn2YRmqY+QjljsOziObinO2yLCoUHG1zlbxH/ReUaWdkpZ9FoyMzaIPDRioNEVCK1cmddikmguPt/faeFcqBiur33dv6ColVHY1ctaKXprvaHto9AQ6Zs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBVPiRF/; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBVPiRF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787599103; x=1819135103;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cugDVqAjuG636QnA6lpABpanUJPZ0GZiYb8AtuHmGbU=;
  b=mBVPiRF/mic7/seiHJ3bzp5p5u/lqGFTuazEP/J1YxBjdls9AfSU1Oy0
   m5pbfr0PFebFFxl2920vCyPRfDHIU9DvMynK7K0XMbLSEl9BVivDsy52P
   MEKEiyAXYGQXDy6BHiUsxISefggJ5UXrNhea8wxVvji03oFNU6E505dOv
   fAOmNDxb0hkKT1Bf1iyFGxCxzP07NQHLADcZgj1H1BCcTnOtczZw2JJrx
   jlwJ+3oTRjil/m4E5BZKunDnGj2fbN567+X8/IOy7Pn/swK5FF4ghQPrb
   SG50OCweUHKUXg0faeMIIAg/BtsHDdna14fzTZtznMEYhbEnDhuAcBCX6
   A==;
X-CSE-ConnectionGUID: cL7U7ArRQFaR5+N8XFk2tA==
X-CSE-MsgGUID: LuZLvaM8T66PzidzuMt/ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87182625"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="87182625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:18:22 -0700
X-CSE-ConnectionGUID: s2q3PxJJQc+/gLwR1VxLMg==
X-CSE-MsgGUID: FspVrg3kTuajUc2pq0otHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="290612812"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:18:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:18:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:18:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQZink/p4zAOvmI+mioM5U9zY+IuipwCn6aRSR7VTJLHz2gaNkwWW2dnSpIn3l1gSVWh/CvurbI+jyp3COMMEHNdXmUV2AxTlDmnOW0U6N6eWWolon/V4cQfxh7/c1TmX/FMlYwg4Mo/D1EsBo6OH83CB1SjPItrl/j8MSJcrYwzpSo2sMFhTYk99VDI5namPIriKPUNnA3/MH8eIiVd0sYWu79OAmjY7hRwX226/oWZ3SYoFbalwqI1Xv2MAY8M/87W+WIzDvG91pCSrFzDkZgp+uIdZnYv8I4Sr7n8xSt944oQr7vXIT36rjwUNMHY6KY6vnZ4aAR2nzxXX930TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IJWH5JqlinK8+Jkm+dtzxz5t0HafNeY2TkZ0EhsWEg=;
 b=gpo0wRdFmRGdhc2b4Tl5HbDvx654M+7jJmtR6OsU/3LYe5oujECJK0C7JCHbglv2b6wD1GqsbHcNqWswPU+OP1vjskbwnVpQriuZaTGt6VhQzKdG1OkvbtnpvqM69Qo5+JOM3eXo2x+Vj85AMH/fO3XxPRN7V+45u/dWxJUyabTP83ZRslQ0V5PxJ8bRSVeSAckeXx7lPAfagAodzHZ2VnSHsixpv8D/fIdlc9Db+lUyVA8dh8/hrtYKPnmvJDEqzLpjvYKw1Z1Om9Dr3fGe9AqtWoFQLeZ5e3VSkCjcPs2ecbHB0EkRNWQXv1ogK8BTPraLNWmLxEniPgrNYI3PXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:18:19 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:18:18 +0000
Date: Mon, 24 Aug 2026 15:18:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 10/10] drm/xe/vsec: Update PMT internal access for CRI
Message-ID: <aoyY9cLoYKcmahf1@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-22-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-22-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: efcaf62a-6ab2-4c87-aff8-08df0214741c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vDS7nSyQUueqYN94hdLW5R4udjJpsEb7W34fkjKgTz9r1G1nX50zX9e2RhTM6s1j6ZSV/2xDU8PNxYuGohIxAJfMFmHPhL+Vo9CW16M03NqOePCLx5yajDGhr6KR6LRbQj5x2ZhoEOLqJl8TPpZOcUCOQ7hKHj+m8dWBbTDrhV+TZNdDcGwSJc6v/idnL0yxgQ6pbWi59TCK0Z11BAS73WrmK+aBdvauufaTqfAmCBCqf8lcRlLkPGRGZy7Woh5bkmdTUv/qQy03deAjUQ/AscqsUS37oABe12W/31U1HvfSMr1dTF5ocjrEU4H+hkSdNcDchFxtG2AKZ9otA90M/RQ3Yat6JX3krcKmY/0WoNHghSB+aNjiH45ITWh7AeZL2aezld6PCuUwbokOMXuRcldweN4w7TvYAmoOI5vcLe4tXHMrTfn4T3byDpOw5BxdZ+4YEsjHbwnRhLxUArADNErMNjYBMCrLMeDRzNgc6eUK5QiQtuNsVsj0VzWDrdNfrfduYj+4zEzjskXwnotREXTPxa+hoxRNXa1qkuTwE9yCqziJAn9iO9Hb/sc0dXVrNB1EzIzX6G430yhOPYl07jTLIPS6xKadwrFDG7nKQ7vpl/btcVA/8pmGUqWdxttwj07beNGuS/Pb7IX/DLeTvxf4Xhq67yFdrP5Efbq3Fkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D078dLzKJfNLGPrd79uZdLV2+38nfKURonJJH1TVaTD3BlAdGfELlv+7pI+f?=
 =?us-ascii?Q?QU43So1YoRfC5XhCDA5qWIFW+rJFRTmHzsuJf6cISp+mXx/6u5hovCEJh8K5?=
 =?us-ascii?Q?wag7Ez7ahpTzgWvEflq/YL9BDGbk8YuPFyOSboqKjHHaMK6qkvpX+Q0DNlPW?=
 =?us-ascii?Q?qUkXC1fdtwYn2y11NJ+AQn/w9+pmKMVdZUkF3Sjs392gJ/+o1rC3TYLQcbUc?=
 =?us-ascii?Q?0uDRYjkks1obXgFdqUg4BvPtImKtaV98EWPS/+Po3zFd7UScixFJAVaSFqd8?=
 =?us-ascii?Q?/XVQU0cfxXYcmoO4p/sqnt5ArxO//yQS+8dMJW9DLLgeI/gPx0wW46lTsZzR?=
 =?us-ascii?Q?VdmXGo9OsGUKwutNxurfeo4t+kGMuvhPpdVwxedxdXYlEzpvlj/kdTnCzdsj?=
 =?us-ascii?Q?LsF9YB1RLGSBQdECGztKd4drw1MTyxlgmh7t//NMVuomvbiIGi0Lm1EDFsrK?=
 =?us-ascii?Q?4+grjkzoZPo4j6DF34XnkmGcS9OUuDGk7rIzqdZoBhaCIKHA/lm8KWrrpC1S?=
 =?us-ascii?Q?+HzbhQHBeQwfmiWBGRxUC9Lx4sZAdGgxrUfe0gBPaP94Rv9XCzhm9dUqmGzt?=
 =?us-ascii?Q?QuRP78ak/k3j28QBFXUffCmuVtWhur02Y6sqTJEo8g9ly46VikLUZOa3xXhi?=
 =?us-ascii?Q?PhxzeJaQQp7c5AbAmLkvufybOvG8SLNzX8HZWiA+Lt4+h+Tjm5IxUVSma8S6?=
 =?us-ascii?Q?44h7mtdOIBrS9aYnIaQY4Fhk1ql6BHua5qmGfDpXm/Yg5cP0C2qVVofgpq5w?=
 =?us-ascii?Q?9JBT1v5TLBisIY7ML9cxwSy0caYXF91DghaFeXOJSpoTo8nUqXoyABCET0c5?=
 =?us-ascii?Q?tUuW15ggLXRj3aZNsVsSXYrzIQe0rbMz3P/fPxDZEvpQyfuisA4zrXTBFSh5?=
 =?us-ascii?Q?yegd/0150cfGqUeX2XXhID9A5DfwqVAMRKsoZs/JRM+kfSm03eG7MpuZ9TbZ?=
 =?us-ascii?Q?qTFpz27xLq5vwqlWRl6cDQow3qEXI5ef9eb38bys784+4FYF3sgsldGTYmKz?=
 =?us-ascii?Q?g8PL3CbBB7Ma4Q+Z5yAi5fUF7bq+KuC7tECGFP1C8XErvglf3LOxK9TnV2Om?=
 =?us-ascii?Q?xzBHo5AyNBbqiKwtY1XpAQpuLsYeVoi9gNqSvq3Y98RSwtjs8K1Ssdiium4a?=
 =?us-ascii?Q?pZIzBchjkvq5m41rtbAytuJn58FyJrbMzHYHMTRiQjjdKu5pbt2eSJ+hTNJL?=
 =?us-ascii?Q?1AMHhf6XstToDK7++BCI4X2hqPtje00YEINZB0G0VeN9ECSHcTv49++HLVHB?=
 =?us-ascii?Q?mG2VYSNm18kPvz8Ztx9oAwGcV15A65Dsv17klnxJdEt6+u2R9CXnteYi+jJN?=
 =?us-ascii?Q?SVvoTm8F598Lpyg5H6X25GfeEt21j6tlIBqeHOlBy0RSRs97ujzQlXP8NlJa?=
 =?us-ascii?Q?1vpZNjgumSc8t7Y85brcdNe8v7SODs0gnDShT9BXa3m3SrgBMrk2FoVZsNAX?=
 =?us-ascii?Q?pw7CDO9PK9pbf1IY6Y2v3ePYvE30Q8JOJRaSTvqgHMPziPP3XQRVOl7Bwzun?=
 =?us-ascii?Q?+3zECsdMQDE67hJ6HBdVGK/XM/9cs+nqpGeFdH6SOVHfB/eSb6RX5wHXq6dB?=
 =?us-ascii?Q?r/mDq7MqlCERjTqfCKOB3MilQnIeqDO8/TCqXoK6hNA4YMZgxQncFqadg+Dh?=
 =?us-ascii?Q?Jg5M7Yg3GPwsSKB7EJzpyNiwC2llILRreBok63VR2Ot7gCgxfGcn+DCiS6ES?=
 =?us-ascii?Q?sblnPUeDBiIbai5PSUlcqt/3kuTy1FqBIZxQtkhciMRuwcdNwIs4/TPWjsJU?=
 =?us-ascii?Q?2vr7uGwuPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: nu9pdHTepevN+5NDKKvbMUTbQhPb0xzZH5kQf+m4QWom6k1CH1OavauFJLkAwV5LGtS30XywTvH9JvjpEqIjmSvSgUdMH6Vr4t3QnMjIMJnvLQ1sopoKRqMYgrAkZxSXe3wYflSq1qqewPQVIoW+WlyJb1JWk2ZpJS0wAFLzocUhOpeX24mgduah7Hi/453ALueZR3eo8Vw+/dsPB48A3sle5FRttqRzh/j7g2iPNT+ON7waWfhGZ2BTygUTzh2OXy8JoV27u6c+JOt/igKrVEHhMTnjUkbu06MGzc9mOAJK5bQH9NlypRCBqZM4wWAcBGP7RIhKv2uh0VYo2rhRuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: efcaf62a-6ab2-4c87-aff8-08df0214741c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:18:18.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW2EjtKSe64CrpvceQ6W565l3qsWtOtk6WwGAG5IlOsNGrvJSDKYpAZ4SQhB74w3WCsDFvyOc0oBLyf4z5+XLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:26AM -0700, Michael J. Ruhl wrote:
> Xe access the PMT infrastructure directly. The current usage
> is supported ONLY by BMG devices.
> 
> CRI has further requirements for access.
> 
> Add a new API to access the GUID based on the platform.
> Use the API get the GUID for each device.

I have the feeling that this patch is doing much more then advertised,
like the debugfs residencies and all... could you please split the patch
or improve the commit message?

Thanks,
Rodrigo.

> 
> Minor cleanup for a newly unused parameter (mmio).
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 ++-
>  drivers/gpu/drm/xe/xe_debugfs.c      | 44 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 10 ++++--
>  drivers/gpu/drm/xe/xe_pcode.c        | 10 ++++--
>  drivers/gpu/drm/xe/xe_vsec.c         | 48 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h         |  1 +
>  7 files changed, 92 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index fc9c9cb6a830..683bf401dc9d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,7 +10,7 @@
>  #define BMG_PMT_BASE_OFFSET		0xDB000
>  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>  
> -#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>  #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
>  #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>  #define	ENERGY_CARD			REG_GENMASK64(63, 32)
> @@ -25,6 +25,8 @@
>  #define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>  #define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>  
> +#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
> +
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..12476549164d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -21,7 +21,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
>  #include "xe_hw_engine.h"
> -#include "xe_mmio.h"
>  #include "xe_pagefault.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -97,15 +96,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>  	}
>  }
>  
> -static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> -				   u32 offset, const char *name, struct drm_printer *p)
> +static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
> +				   struct drm_printer *p)
>  {
>  	u64 residency = 0;
> +	u32 guid;
>  	int ret;
>  
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> -				&residency, offset, sizeof(residency));
> +	guid = xe_vsec_get_guid(xe);
> +	if (!guid) {
> +		drm_warn(&xe->drm, "PMT device is not powered\n");
> +		return;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
>  	if (ret != sizeof(residency)) {
>  		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>  		return;
> @@ -244,13 +248,12 @@ static int pcode_info(struct seq_file *m, void *data)
>  static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>  	struct drm_printer p;
>  
>  	xe = node_to_xe(m->private);
>  	p = drm_seq_file_printer(m);
>  	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
> +
>  	static const struct {
>  		u32 offset;
>  		const char *name;
> @@ -264,7 +267,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>  
>  	return 0;
>  }
> @@ -272,13 +275,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>  	struct drm_printer p;
>  
>  	xe = node_to_xe(m->private);
>  	p = drm_seq_file_printer(m);
>  	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
>  
>  	static const struct {
>  		u32 offset;
> @@ -290,7 +291,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>  
>  	return 0;
>  }
> @@ -710,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> -	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> -		drm_debugfs_create_files(debugfs_residencies,
> -					 ARRAY_SIZE(debugfs_residencies),
> -					 root, minor);
> -	}
> -
>  	/*
> -	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
> -	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
> -	 * PUNIT_VERSION_OFFSET.
> +	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
> +	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
> +	 * and have a fixed offsets for the required data.
>  	 * Attempting this access on other platforms must be verified before enabling support.
>  	 */
>  	if (!IS_SRIOV_VF(xe) &&
> -	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>  		drm_debugfs_create_files(pcode_info_debugfs,
>  					 ARRAY_SIZE(pcode_info_debugfs),
>  					 root, minor);
> +	}
>  
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5d9e6e66c665..7acc57f6d4fd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -472,6 +472,8 @@ struct xe_device {
>  		struct delayed_work work;
>  		/** @pmt.retry_count: late-bind probe retry */
>  		u32 retry_count;
> +		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
> +		u32 punit_guid_cache;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..c4b44eb4b220 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  
>  	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>  		u64 pmt_val;
> +		u32 guid;
>  
> -		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
> -					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +		guid = xe_vsec_get_guid(hwmon->xe);
> +		if (!guid) {
> +			drm_warn(&hwmon->xe->drm, "PMT device is not powered\n");
> +			*energy = 0;
> +			return;
> +		}
> +		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
>  					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>  		if (ret != sizeof(pmt_val)) {
>  			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e1b8062541a9..7831dd597794 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -366,11 +366,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>  {
>  	int ret = 0;
> +	u32 guid;
>  
>  	guard(xe_pm_runtime)(xe);
>  
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
> +	guid = xe_vsec_get_guid(xe);
> +	if (!guid) {
> +		xe_warn(xe, "PMT device is not powered\n");
> +		return -ENODATA;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid,
>  				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>  	if (ret != sizeof(*version)) {
>  		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index edc20c24137e..5ebb4ee9ef08 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -564,6 +564,54 @@ static void vsec_disable_late_bind_work(void *arg)
>  		xe_pm_runtime_put(xe);
>  }
>  
> +u32 xe_vsec_get_guid(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 guid;
> +
> +	/*
> +	 * Both supported platforms (BMG, CRI) require the remapper callback to
> +	 * access data. CRI needs it for the GUID.
> +	 */
> +	if (!xe->soc_remapper.set_telem_region)
> +		return 0;
> +
> +	/* caller must ensure correct power state */
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return 0;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	if (xe->pmt.punit_guid_cache) {
> +		guid = xe->pmt.punit_guid_cache;
> +		goto unlock;
> +	}
> +
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		guid = 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		break;
> +	}
> +
> +	xe->pmt.punit_guid_cache = guid;
> +
> +unlock:
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +	return guid;
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index c4a1e2fc67d8..43c3e9f227c5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -10,6 +10,7 @@ struct device;
>  struct xe_device;
>  
>  int xe_vsec_init(struct xe_device *xe);
> +u32 xe_vsec_get_guid(struct xe_device *xe);
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>  
>  #endif
> -- 
> 2.43.0
> 
