Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A53876CD
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598682; cv=fail; b=nPcvOGApmv5sBBFY25ZdfIvq6WPtDnbKfLEqDd8nyCJOMVK9LlPBwNu/Lj4quPUTurOdGUNLPG+6ki2Efm6gYtf71LAg4XDJ9RM6Wq1E5SxYw4g4QlylgEqk3Fby0m3KFZFYFfI3KAhDbh+QnuR38etyLbO938Y1nzq+Eu6OwAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598682; c=relaxed/simple;
	bh=eyrT9rrUu96kkgMqPOP3RvZ2nxlGLFcCkbENvYEwA4I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lvgPT8BwWjWbpG4cZmN7Bo32OUgXIeqOnSfVSmWr2VmmjJz1rRlQVfAc4i10Mp147bnNF3vxH4mR/vTa9BGJf0mB1VcOGD/khwWcnWqThA5RULZytrqxdE5KUuiLuwVcxo3bmm0dHCYoyzvKYKPNqI5dN7CROgaHYOWa90Fiuz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II/tReG+; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II/tReG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598669; x=1819134669;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eyrT9rrUu96kkgMqPOP3RvZ2nxlGLFcCkbENvYEwA4I=;
  b=II/tReG+4q0IotxcjdY1X2puEvHya+K9YZe8I5klA/qk3yutkmDqZAj8
   +OYLqGxX/eRH8mAXpIgdX84R7U7knpDFH4S58SWuRDvgzg7APPLbZ1OwI
   D/CF9s90VJZEJB0BOsgjmjkst4CQcd/JtlyoxlT+gxyzjvIw4DN5d3cvR
   v74J5zqbUbD23QnfQo+Ql74hgVQxAoiCC4pSQ3UNUZkBkSfcTTOrEPhzF
   /1xe2l07WXp/x1ZOaLe36dg/mhe3Ug8jVoqWsnshCCyOO9yOKKh1Wl2iF
   YyL9ciUn6CnVp2LqZwlqWkPQPX4XejmD8iqvp5vOWK+m2siDpk7CEkfvM
   A==;
X-CSE-ConnectionGUID: 4MSKmhZCSgu17Rn+aDctxg==
X-CSE-MsgGUID: m63rgvyXROWl0Hsyo1bfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99583004"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="99583004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:11:08 -0700
X-CSE-ConnectionGUID: wVPLxdZaTcq0qHoZIZ3SAw==
X-CSE-MsgGUID: 7MfbFkRISa+p/lScOKo2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="260933947"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:11:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:11:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:11:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhpNAPIu2/yM6BcSKr2nTFOsXUNtWIldCNRdwxVl17HbozuUw5FlSG2k6jw0POeFF9czGfTRJlimdhMnY5mnGkl1l77rbQcFdhx4bNAoA79k+bY94aoM3mIg22B2P3T9EClk5rxx40CbVVOEaPXvlYh7KLoO0r6Cjm+vJ/fdwqbbkiN6QDHKIVFnxxEX64XZhaVCIgS5c+aruJvMIuE8M4tl52I3S6VlKx7yQw9PJIVxRwrnv1gZqeDue7UVhjfXeiCwgUf2em6ZkW8KmYaBB22wTRNul6063ddMrPUBGHJ9gJx9myP/PfEqngxe2HTPpeZmL6an5kG+n3sj4F76Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bASScGq1fuXdm2m1t9w68ae/YwVP46TmiqK6htQOoLQ=;
 b=L4dezGhmdHG7cCYKZGgEIgYtEQKQjUEMSXcYPY57it3lcV9U8wKwX+UA2TAO3pB3HXpPHjmYS+JFGK3kE28X5M+EzcUcGl/fspFMMB5RpVg3uCLvepTCz1kUoemJGR+PrH27vM/kE6aXxAMxK4pgE3B1XCp+r3rOdbKmsrUmIpwML+z6kLfdzcED4E9eB9vE9llRSo7S2mxPQFbvB/+HtOS7IKXiiZFDOht7XwhSpGrD+gwBz+PsJXvdUEirVaDj/nTyrga/hZMRS0CeKTeSsWU63zETG+tbDDS5Wt+DWhEFWGpgIHvzlqzFm8l2zZSPryxAfXXNZEaDiGBGNOcRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH7PR11MB6980.namprd11.prod.outlook.com (2603:10b6:510:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Mon, 24 Aug
 2026 19:11:04 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:11:04 +0000
Date: Mon, 24 Aug 2026 15:10:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v3 06/10] drm/xe/vsec: Support Crescent Island PMT
Message-ID: <aoyXQwxh8kSZ08Vp@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-18-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260824162317.2450380-18-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH7PR11MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: e731a6a9-b091-4267-c42d-08df02137177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vthcMXOx7lSogoP10JOUOBmE+FaZHTUhm5besq0xnpABTRCU+sLxgnz5b4gGWgPhH2MhZzRzSCc8L9QnCNYMROCKhEllSHoWPssqp1UOL3EpWnhedBmZ1qDudujeHhLg8PN7H90/xHc/n5L+W8flzWBrG0o35J3G5PO/A13UOXSueR0bbyfy2oZYqNEuu9FU/+hPjQEHlj7QNpXoylrbb3gMgy2efvrrXpiGIQAZNb4GxzR3n4pr0pm6DS9g1wJKWfjOxEhes5KpcT2bsiB+IblEPj16DJsum1hMAJWag9jcWSrdDSTYa3Wwu8E0O8BLYlLSiW+E4s5lfw2ZfYtGMcero5WLPwvN9h8FPHQjMkHhyNOBDZN8QLa6TdxvFjUdoDMcY4OQWQqgj6mWzW3iqMXWD1l84hdhsqMRW0XNDxxqRQMIGD9mf3zuHk/T/zA+Y26+Tj5B0JZpdidCSExNfoWEjOpphNqWaD9dunp+1r8lyD/XjWAj/Fqy3Ui0FRm32NHAYuPCdnEwAyyQ1vPliQWqsROOLmNTjXX6NV0MtErNHtzd2h4K+N1WexHypLpjgiD5tA2nWFMWFHxPAxbLD8MoS0JCGR6S3CwokUVHDNJhrXSMxfDk8OLLBZSO1H6AAOZFLU5ehGBGkcOFbUzhMgxibIGNE9cwEI4fddXZdl4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7752.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTRoiAirm0exAtNg3cN39cByFU2F3NLh2sHBb5ZLpjcu3xYw+qgKEDzUi4j4?=
 =?us-ascii?Q?5JGKq9ApnN8zOxfnjivcuoPy6nxARBRf+h/7cIJPG8P9myjkFIBgtNcrDjVH?=
 =?us-ascii?Q?m2i7SHxbXt5olUqv0wzaLKCLnWcusV0MQeMhkuoh7RVkvl866IAVB/sly2K2?=
 =?us-ascii?Q?Oz1XDdCm4NPIGfA46DucnrhX7ZWrqTfyC8qeUzWaTYIvrj8BXi+V8UOQwh2E?=
 =?us-ascii?Q?EX94rSrLgj7k4TmZVfsDSJC5zRwvq8BHnl18uJT4W9KPmex4CbiiSKfxefJs?=
 =?us-ascii?Q?/GTPF8AhxpJqVwivS7R6V5piscs/Tc1eo13ZxL8tplr9xdiPU4pNArE2szTJ?=
 =?us-ascii?Q?FMyhAXviZFdiA1tW7VROX4Sbo50w0Mb0m9gsG3G1ddPtyFuDvVfKEokrAytO?=
 =?us-ascii?Q?QK0AzhdH5ZeIiD66346F9A8v1iRuA9/P3ZqNLv6rQ5uQh7c0yUceM8mOehaH?=
 =?us-ascii?Q?sJvLnVU5r4rB1+rdDFN1bn9wDtN2bEK3wuhkZUCLXzRq0IvYj80MSHTs6oaI?=
 =?us-ascii?Q?eB6jixawrOIbAyAwWoVPVVz0jXUgIJ3wmjPxVJs3k7TC86b+JWIrNMOXpKsO?=
 =?us-ascii?Q?P95DWk2ciVBL3qkKiFeuLl4gRbZYzCS7om5IwZ2JS1GM2BgiNA/IwFoBgrhG?=
 =?us-ascii?Q?OayEh++dRI73h8Z6P4Gbatj5pMH1ZXqA/6kdTdMX2DNrxTn25hub27KZFO8F?=
 =?us-ascii?Q?NxEBtp9KodGCpSmrong4Gn3rUD47sZcHucq77NinNf/Heo6E0Gem0cPWL5rW?=
 =?us-ascii?Q?oTTnWNYLIp4BPInuRKgGB+zRXuXmuiHc4s3YH5FAHsmkPI1pgd9V2Dw4sJ8Q?=
 =?us-ascii?Q?b11R76XsgQ623q4aoOlxvlhb28mRVJ8Kuyo0ZvHTyzPgwkDWjy32yvaaqFdX?=
 =?us-ascii?Q?AQ3XEsymIA7Z3/KhZaaVIkuHG6jNM0pugB3oh8vIQ+FqLKchfpg6RKZuZUPM?=
 =?us-ascii?Q?VR3xwgL7yKfNrWUbk7df+dzZvOlct3yastPN5y5LoluNfemdHCLkxhrkhBS5?=
 =?us-ascii?Q?tqqd/Z/wDwSxVB31ARSVITFHZ5Al2untApCCPlLhCqB0iBMMtnC/xFBRL7Dv?=
 =?us-ascii?Q?MFJP/3hVGDNWMgoteB5m+ujEWHlm3ZVRqhN5dPqA0QEEOCK7WMVD6ch8gbQo?=
 =?us-ascii?Q?ITjo/TNQwTfnESdP/4ap5DfV2OfrrxPoZFrIQlX07b7qznuQ2u//odESKb0S?=
 =?us-ascii?Q?lGXIJYFmkc3h0GIIqlNfZmMvoImWJSJ1+CbgyhBFxk9eyarqjp5bDLJdL4OC?=
 =?us-ascii?Q?9crndXbi7HdBbhrHVRlGF2EIhMRZisQ/Qq4TJ1jEq4g63mZoV822e6rrckLp?=
 =?us-ascii?Q?gp0oEDAhF0cpcllDqDGALeGuquzA4psVdk/n6vFRxeDsykRfvRlhZBs2mC/i?=
 =?us-ascii?Q?RYO5GUHza+/TmP+zY4Mh2Ae01MFqa/1o69W5P6sH85iJKcXxe1BCsFWda/jL?=
 =?us-ascii?Q?GdYcXiPY341jvU50JKb1RI+67qDTTSbL6071ul298DaAHR+FiutlJJChE8lh?=
 =?us-ascii?Q?JXwD6SVxoF0TX6+VW662EVZnLt2RBEr2Cj2YuOsklgBNq92VXEOlf0eMqyYG?=
 =?us-ascii?Q?kB7ax1sWxkrnIuDfWbZbjIuCv0nO2FsRXP9/X262jwrRUpfwF8bBtPU37c9F?=
 =?us-ascii?Q?L3PFbs4bLmL1b1x4k3Dm/8ZYuRC8l1THfCfH9szapyTzu6oKRl1w6ZqR1C70?=
 =?us-ascii?Q?/mOrtBFoScMtDKyf38/MjWHFU+/hD2rnNCBzj7H06BNFSsFgWtiDYiQMy4it?=
 =?us-ascii?Q?KLp7HhgmMA=3D=3D?=
X-Exchange-RoutingPolicyChecked: TgNZ4esi4cYXnc1kwOm3wDcYjqXUp56yhAE8qfWKX+Qi2u/jrhIWYQkZ8mZ5w4WVoTEsI40KK6XcRKBTMh0Fp97jgKHA+2BQjftUnJWsTwBgZN7J3W6t0TATLDU7dLcuv/1vHk7H3lKWsEaOtr4DsE8erZTD5lRrlSh7pwdXKy+l8hiZQJFvM6BeL2CS2p/G4HpQtZxoq3X31o/vFSMXfyYUErk95Jzpp3FVZSEk7k9ibFw4NvXI4oYeSz/4DsziKjyh+UN8PLWsUsUaWpnCh9r6RoLtn29bkIbXCm5zwY2gHF3cjzcP6n1NlgdISC2J3yRulxDdjcHCEcIAcXVPzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e731a6a9-b091-4267-c42d-08df02137177
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:11:04.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ROGZlsxlEjxGZFilCsH/QYry7KoqXWtTZa3HwhMdkynIw8DDrAJ8g9Wy3HEQplAgZhfoyaSHh4p+E+QzDlX9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6980
X-OriginatorOrg: intel.com

On Mon, Aug 24, 2026 at 09:23:22AM -0700, Michael J. Ruhl wrote:
> Crescent Island (CRI) supports PMT telemetry and crashlog.
> 
> Add Crescent Island (CRI) discovery structure (DVSEC)
> information to allow for Xe registration.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h |  5 ++++
>  drivers/gpu/drm/xe/xe_vsec.c     | 46 ++++++++++++++++++++++++++++++--
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index a62ab05c6b4c..fc9c9cb6a830 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -20,6 +20,11 @@
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>  
> +#define CRI_TELEMETRY_BASE_OFFSET	0xE0000

If it is the same as BMG, let's just reuse that.
The platform prefix means the platform where that started or that got
changed. We don't need to have one define per platform.

And actually in the XE we even try to use XE_ as prefix whenever it is a
unique value with the platform.

> +/* for CRI discovery and telemetry are in an indexed window */
> +#define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
> +#define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)

same for this right?! probably not needed...

> +
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8abe11e6312f..6345b0b4b26b 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -21,8 +21,19 @@
>  
>  #include "regs/xe_pmt.h"
>  
> -/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
> +/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
> +#define CRI_DEVICE_ID 0xE2FA
> +
> +/*
> + * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
> + * For BMG and CRI PUNIT and OOBMSMS crashlogs are consecutive.
> + */
> +#define BMG_CRASHLOG_PUNIT_DISC_OFFSET (0x60)
> +#define BMG_CRASHLOG_OOBMSM_DISC_OFFSET (BMG_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
> +
> +#define CRI_CRASHLOG_PUNIT_DISC_OFFSET (0x80)
> +#define CRI_CRASHLOG_OOBMSM_DISC_OFFSET (CRI_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
>  
>  static struct intel_vsec_header bmg_telemetry = {
>  	.rev = 1,
> @@ -41,7 +52,7 @@ static struct intel_vsec_header bmg_crashlog = {
>  	.num_entries = 2,
>  	.entry_size = 6,
>  	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x60,
> +	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
>  };
>  
>  static struct intel_vsec_header *bmg_capabilities[] = {
> @@ -50,9 +61,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
>  	NULL
>  };
>  
> +static struct intel_vsec_header cri_telemetry = {
> +	.rev = 1,
> +	.length = 0x10,
> +	.id = VSEC_ID_TELEMETRY,
> +	.num_entries = 3,
> +	.entry_size = 4,
> +	.tbir = 0,
> +	.offset = CRI_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header cri_crashlog = {
> +	.rev = 1,
> +	.length = 0x10,
> +	.id = VSEC_ID_CRASHLOG,
> +	.num_entries = 2,
> +	.entry_size = 6,
> +	.tbir = 0,
> +	.offset = CRI_DISCOVERY_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
> +};
> +
> +static struct intel_vsec_header *cri_capabilities[] = {
> +	&cri_telemetry,
> +	&cri_crashlog,
> +	NULL
> +};
> +
>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN = 0,
>  	XE_VSEC_BMG,
> +	XE_VSEC_CRI,
>  };
>  
>  static struct intel_vsec_platform_info xe_vsec_info[] = {
> @@ -60,6 +98,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>  		.headers = bmg_capabilities,
>  	},
> +	[XE_VSEC_CRI] = {
> +		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
> +		.headers = cri_capabilities,
> +	},
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 
