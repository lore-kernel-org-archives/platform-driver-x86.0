Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85A36CDE9
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402435; cv=fail; b=LHYyDu0qzlm1Rv51po3GJOydmIPA463AaTuM7bYsS9jd7hgYknmJAUque9IzAR635vFdYRBNHoIuE7EIdHsG/uGVfuo8WEuCbGKmlUfW1QbvWNsP3iiV94OnccN3VRAvDYgJSUKuBZxCWkn6bRGCCKeZ7QppOw6YaPXLXriGGm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402435; c=relaxed/simple;
	bh=4r3m7loqYicvTGrR8g3Eb+Qq5G6cs0MuKZFM0vkLqe8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GgCasnWPt7Omx1HBPeQPi9Uwh8K02WYc0SKAItsMnl7KPm/7dYW2ffhKbkMhMjkxmllM8lUHY2oUeBUdlsJ1+ssYlYDWM4xtByowSv+DWSxtr9/D7CZkxL/+Wb6T2Q5DKW6ZRbjxpCwbR/lI6YS/zxDmNzNTlneWmuhReg2/Gaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZmoMMgA; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZmoMMgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402434; x=1820938434;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4r3m7loqYicvTGrR8g3Eb+Qq5G6cs0MuKZFM0vkLqe8=;
  b=gZmoMMgAKjwfPbxh/13G6ttOC7IGykBq2+ADvZoFRYbYqtIUEPCLwuTD
   pFANsoaVVzu6jUwZzarsuKyi3lbEmvoGo2mMOsGoq+PkVTpnE6CBaly3Z
   U8pMF7PKAvW3s9k6ojx6fPYWQ5sqvl/8I/3wplsikCA1kIl9m/nfOiXMd
   uFE44S7niBjZIIleS/IlIm1Ffii12iOQjLkR3mqp4xsUf7qyoRW9cZUJV
   szo0DbWomAF9hrMdGIP5aIegNL8stlNLYwrEEj4T+omP2S7UoOCK5wurD
   cwUjf3Md1NszBAXUbCceW9ROETD2sV/bZv+GTao7JumPsz+e5ImUVkbcz
   Q==;
X-CSE-ConnectionGUID: L3DRYSgSSOWzwDQKq4i62Q==
X-CSE-MsgGUID: GFm4i0J2RZOBMkbG5Mrm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93623896"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93623896"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:13:47 -0700
X-CSE-ConnectionGUID: fhsY5+RSS0mXfaex9Ws8VQ==
X-CSE-MsgGUID: 7M7g1Ak/QKqaQac4jvlZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302573435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:13:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:13:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:13:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqF0oYBxh+Nf0+4P2Mk1wYp1KxZPtQ8hxqo0t6BmB0FG6YvGXxFepCYBDrhI8hFrZTchVdl6/RrVoqmPjEZbIDJW2Rx0TiTaag5gDkHrM0l8X72BEcSHHsrODx95jxDLFC0n9TswzFGXZQBX4X4JqighsvTUeng2E3XVAJwdOJtqssTFO8h9GD2od/ozvwqdS15D2ZgpV0gSnz5w0oWrGkHv6D3awJgoX8bRkRFPfrpNVxcnciShPwY/HTF9wErgAwkXJ2CZtl0RmObVZbA0JB0XAPDsk4OEg+v1HOtw6IiLNA6hluYZLNi9ULpQmcGwmhRQdf9VfZMyDjjdKbX+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUpOmwR8mQjYW8ejLPuc8JSv+nX2YvgMMT1hrmJlmoA=;
 b=H+7RtCn0NBTlkF1dblf2nilb84bO6mD94jhi3Ys40h+H0gDrW9gYL8Nwzg68RoZcJ+E6nLAzLQKuA1UxWFRtYXIFUJnmwpgDV1N1LUashx5GPxUTbbI8EnL8iAOB6F3pjurCo0tatpUb2PPHqYzEWtp9iFnAQByN1ER/zpYcHebl3dnl1U8KTFGy2phmc0CpgXTbkvOSGTtO7wFxyqvTfnELLxsE0h7afMbz03DuVMUJBthurAmfqLRjSY/Z0wNYtp6l89TsVaKpIjvWKvJabOYoeF09wh0sNpTGUF5byWsRm7gNoESyAt3rxgyoI/dNUhNB5wLhoHYcMdt3mpMBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:13:41 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:13:41 +0000
Date: Mon, 14 Sep 2026 12:13:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 15/20] drm/xe/vsec: Crescent Island PMT decode
Message-ID: <aqgdMDGCHageUfqQ@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-37-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911201148.1610547-37-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM6PR11MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e1a871-cd28-4119-0cdc-08df127b24a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zlH7oSKLrEX76u9g9at0/epDGecUAc2hlTzYy6xvmsohQUDZ2Ml3pnJUSJ7yq6gOlZo7D6aUIfJTgq9bcAhkNajnGumIxcG2b0q9GC3fAD41BvgrVm+FDU6jJc45GZZasLP9BkW2YetMtjBOg3hAelOo47O5+IAwaya8qIBWv26bVHcaG/twezPJcdt677sb9ZZSBgF8K/F2SsEy/yIkezvMlNJXq4wHMErFmv9WHWMNy4C3lfRUliCneQ9J2lVmMJWojsb/oODe6j1cZ4V8Wi9UxeaDhSE5edN+vRWP4fP5E2UvDDV8qk+9FKzkHl6Q4WLSnwfS7rfXfsFNPjQg92GKnWdJSZ93jAqKlKyneM4lIAYA5EOF4TM0SOFoE9YIXA1ZaN7m57WgN2eS8yJvffqMFXvIdKVg2wg5OPVzPHBpvWalihAgLFDeAS89yVeYqsgy4q028ukadgNcTLFZxF7TnUWC+tZNsH3OP+N6h5bTAfNJ58ZNXk2vvvdAKfm+sAs2HeK4NuTSfDEwgNKibn+S+w9g3l+PekQ7MoBlz37uDeFMqYDOWdSE8ovY5ZhKk8hw+ePdApQMA2ZPzS4YSar5E6qAnrvyICdh+219wjEMnuGcpekFVT92ZtsnWE2wJo38XCjogqOMXUqDfqr3UJoodr0rBurmzShnTMUFvvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2kzMnRVcG52UTJvbmF0dTM2ZHNLVklSSnpZUnU5MHJXMzFBdlF6RHQvWFRx?=
 =?utf-8?B?SDR6OHNML2hhY09JOEFKWW9DTmd6alNXb21TS0crWisrT2xWUU1WRUd3ZXJa?=
 =?utf-8?B?UWllTW93c291cktaM0VhRUFrREVFRVFReERwMXRTQk5KZDBYYmZscHdCWmJr?=
 =?utf-8?B?VWhZVDRHT1hTQkVNY3VZc1J6bDNZeGJaaHVEMi9vUnIxNHRvTUhlRnhDU3Ay?=
 =?utf-8?B?M1NIYnZUNFh6LzV1Wkh3Njh2WkVXM1Z3cEg4UjlhSVROSThIS2tLSlVTSjVs?=
 =?utf-8?B?ckZVK1J3eHZCME9Ud0V6SlZ0NSt0NFJBL3BYcXFkVm9iRnhhYktVYVlxS2xK?=
 =?utf-8?B?Q2ROZW5zM2VkOTh4TTZ5cWRGWDZBU0d3LzRmMjlQcjg2cmFmanN6WWpPOG5t?=
 =?utf-8?B?ZTdGV3dXZCtNZ3RYdFJOb25qK3E0TXdlL24yUktOQ2o3UUYrUEh2UW5ST0J1?=
 =?utf-8?B?ckFaZXpiQjgxWXVnU3ZXWlJmcE5idVliZG5rM1ljdjJ4Y1F4OWxnYTkrRGRz?=
 =?utf-8?B?dFR2WHYyd3drREo2TURBZXBack9DT1FoTC9TNGJZUmkzMmJJY1VHT1NQMWZW?=
 =?utf-8?B?cnU2S3NjUU4vSmZ4TWVMY1p4cUdpZkZjTDA5aTViTis1cHZkelhFLzRMQVNt?=
 =?utf-8?B?YUQ2ajAxVlZCVnVXengyUThJRDJSNi90ZXoxVXlVdmxvTjZzQUpBOTgwK2RO?=
 =?utf-8?B?VGFGNHRxOUc2SWpESFRtd1AzSlQ2N2NEdWg1SUk2QzJydkV1dU5vRUg4SVFE?=
 =?utf-8?B?MlFweXJSZW54bWp4aWtjWHhIL1BuMkhKcWk4azI1b3B5b0hxdzNRaGRST1Jk?=
 =?utf-8?B?SGVMTDZQM29pSDRXSEZNcE14R2NkV2krenlwaXV0L1BSQVc5ZXNtdWpOdXNB?=
 =?utf-8?B?ZlpvSkcweittNUR6M1VxUjhQdEFlTDhUcjhNdy9TbXJic3phSDlQeHl6c0w4?=
 =?utf-8?B?OFMvbWR3VkM5U0tJWldKZ3ZqNUUra0R1SjdEWnRUTGl2ZGFtaTVpODdsVWZp?=
 =?utf-8?B?M243RTh3RUdZSEIzazcrdjY1L3NINDBhcjgwcjhVOWxNQVFuZVgveTBBeUVr?=
 =?utf-8?B?N3YzeEUxUEdCbEtIMXFJQmRvUks1VjY0d1B4R1F2SzFjWWRnWERQcjVSWjdu?=
 =?utf-8?B?Zy9lQ29pamp6Ykc4eEtncjVCSm5qaE15Wkd3Z3lTYnRMc1E5TjNKQmlhbW5J?=
 =?utf-8?B?UzdBSmdDU2E1YmZ4M1FON2lkdThCWThyalNSSjR2S1YyeWZrOVlmcGdieENK?=
 =?utf-8?B?U3NKMFM2N3BHaDc0WGVCeEUzaDh6emVBNnhnd2V2QlBVNGxCcGpuam01NHl4?=
 =?utf-8?B?UlpnVkJONUJTYWQ4TXBUblcrbmc2Si9GMEljMEUvTU1YbG9XazVIak5aVkZ0?=
 =?utf-8?B?b2UxcGYyeFllYkorZEVON1dNUHVhWThKNk5yU1BuRzJwMU1xT3VsL2JvMHRY?=
 =?utf-8?B?czlZSUxYMWkxYWJUSytMckRzbjJXSGNvME03SURreXpRNFlSbzczbjVJQS9H?=
 =?utf-8?B?bDVCamh6WjhhWnZsMjAyRkFja0MwNmNtclVYR3lJa2pHaEh6T2FvQXBBSHVU?=
 =?utf-8?B?NVlVelI5bHY1VmF5aWJPN0MyTGFVZElCWXN3dVc4QXZsbDBFYzJYQkd6SnpK?=
 =?utf-8?B?QXRHeUNabUozVGxER3lUeEZIUkVKVUNBOTZjYmQ0S3o3VVhwSXdtNjVXMk9D?=
 =?utf-8?B?WGFXUGdDcklKWjVKOE5KRjJDcTMwQ1ZoRzhsc3NEcDZTYlhkbmRuYll2T2g2?=
 =?utf-8?B?MUdkQ0MwQXQwK01sL3VGemV6Vy9OUlh6amljOTlxT29RbWNyK2NPbzEvNGVH?=
 =?utf-8?B?YkN2ai9nWitNT3V1eE9aU0FkRHpkMkRHcjhCMm1INHA2eVJqdjlIQUkvQjh1?=
 =?utf-8?B?ZnFMWU5hc3MzUnZXVVdyUTN3MVM4TytKSGRVTGYxMHJzQ1NBaEoxckFUSGNF?=
 =?utf-8?B?aTRkVE9rejgvRWg0TTFKb25DbHhzRWlOcGg0NWk3RXhoU3FVeVFpeUtFMzQ0?=
 =?utf-8?B?VUM1Z0VmS09FYWV4djhUbE52R0hwbzFSdWhRYXV5TlkxOTM0WVpaY3VZeGw1?=
 =?utf-8?B?UnBBb2VvTmhZOG1rQzZ4NVlzWHdaU0t4TUhwcjVWV09iTStCSml6YUZhWk12?=
 =?utf-8?B?T2RZKzBmREk0bGQzRW4zb2J2OGFhUDFiV2hlOUh0K3dXN0hncDZ4MHNhdkNw?=
 =?utf-8?B?Y1krYVY3Z1MzNDg0Z1JadTIydi8zaUFsUmdPU01zcGZVdnp6dFkwRFdlb09T?=
 =?utf-8?B?K1daaVJRdTE1Y05OdndzZzFsSWx1bHBIMGhSeTQ3UmhIcjM3Zy9UcWF4ZEd3?=
 =?utf-8?B?US84YXlvRGREOXVSeVh6YTNjbEZoYll1R0xxcnZPbDdZNklQZHlOUT09?=
X-Exchange-RoutingPolicyChecked: FZXNkcW5ZEEJkYJQff1I2zmJQjvaMKnM+yWvxriKCFflsCNV+ngiJFrMbYJ0JbUtpa1RdRh24O3J52oVG2F6wvoou5b1FO4XLku2m5kSZ1BwgfRoJuDA87+a5WalCiOcRkv7hSgSbRQchHmsES5r5BbPFTSu3xLU0UFaKqBNdesjrOJ57nWsDhcoUslsaxdwJP+BRlDa+SCBBtPSjTZYvoFe2MgfITmgRiHHOZliaKqZnXP0RE0uO4Rfm2js6iM5SU58JaMgp6sP46gKno81TX1SMClneQafUd2pnZONlvd7k9Zx9Lpgqlh48bL0SvzWqyvI2ydn5Xd+x1qkVP88Mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e1a871-cd28-4119-0cdc-08df127b24a8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:13:41.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 923A+hf0UxKvAzf8YW0xAgK7QM49nYlQBc931NyAPNdPksJn7ZQxZOq9TCEJkOo/FK8196mc1f8gT7MoqwPlDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:12:03PM -0700, Michael J. Ruhl wrote:
> Crescent Island (CRI) has different index and offset values for
> accessing the PMT data area.
> 
> Update the decode path to support the CRI device.
> 
> Update the data read callback so to support the CRI usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 100 +++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4a7c24a30b3f..9f00ae58b921 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -120,19 +120,25 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  /*
>   * The GUID will have the following bits to decode:
>   *   [0:3]   - {Telemetry space iteration number (0,1,..)}
> - *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [4:7]   - BMG Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [4:5]   - CRI Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [6:7]   - CRI Instance
>   *   [8:11]  - SOC_SKU
>   *   [12:27] – Device ID – changes for each down bin SKU’s
>   *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
>   *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
>   */
>  #define GUID_TELEM_ITERATION	GENMASK(3, 0)
> -#define GUID_SEGMENT		GENMASK(7, 4)
>  #define GUID_SOC_SKU		GENMASK(11, 8)
>  #define GUID_DEVICE_ID		GENMASK(27, 12)
>  #define GUID_CAP_TYPE		GENMASK(29, 28)
>  #define GUID_RECORD_ID		GENMASK(31, 30)
>  
> +#define BMG_GUID_SEGMENT	GENMASK(7, 4)
> +
> +#define CRI_GUID_SEGMENT	GENMASK(5, 4)
> +#define CRI_GUID_INSTANCE	GENMASK(7, 6)
> +
>  #define BMG_IDX_TELEM_PUNIT		0x00
>  #define BMG_IDX_TELEM_OOBMSM		0x01
>  #define BMG_IDX_CRASHLOG_PUNIT		0x02
> @@ -143,6 +149,18 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  #define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
>  #define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
>  
> +#define CRI_IDX_TELEM_DISCOVERY		0x00
> +#define CRI_IDX_TELEM_PUNIT		0x01
> +#define CRI_IDX_TELEM_OOBMSM		0x02
> +#define CRI_IDX_CRASHLOG_PUNIT		0x03
> +#define CRI_IDX_WATCHER_OOBMSM		0x03  /* PUNIT and OOBMSM share this index */
> +#define CRI_IDX_CRASHLOG_OOBMSM		0x04
> +
> +#define CRI_PUNIT_WATCHER_OFFSET		0x08A0
> +#define CRI_OOBMSM_WATCHER_OFFSET		0x0CF8
> +#define CRI_OOBMSM_GFSP_TELEMETRY_OFFSET	0x1600
> +#define CRI_PUNIT_CRASHLOG_OFFSET		0x0E60
> +
>  enum record_id {
>  	PUNIT,
>  	OOBMSM_0,
> @@ -155,17 +173,10 @@ enum capability {
>  	WATCHER,
>  };
>  
> -static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
>  	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> -	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> -
> -	if (device_id != BMG_DEVICE_ID)
> -		return -ENODEV;
> -
> -	if (cap_type > WATCHER)
> -		return -EINVAL;
>  
>  	*offset = 0;
>  
> @@ -201,6 +212,75 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +static int cri_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> +	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 instance  = FIELD_GET(CRI_GUID_INSTANCE, guid);
> +
> +	*offset = 0;
> +
> +	if (cap_type == CRASHLOG) {
> +		if (record_id == PUNIT) {
> +			*index = CRI_IDX_CRASHLOG_PUNIT;
> +			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
> +		} else {
> +			*index = CRI_IDX_CRASHLOG_OOBMSM;
> +		}
> +		return 0;
> +	}
> +
> +	switch (record_id) {
> +	case PUNIT:
> +		*index = CRI_IDX_TELEM_PUNIT;
> +		if (cap_type == WATCHER)
> +			*offset = CRI_PUNIT_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index = CRI_IDX_TELEM_OOBMSM;
> +		switch (instance) {
> +		case 0:
> +			if (cap_type == WATCHER) {
> +				*index = CRI_IDX_WATCHER_OOBMSM;
> +				*offset = CRI_OOBMSM_WATCHER_OFFSET;
> +			}
> +			break;
> +
> +		case 1:
> +			if (cap_type == TELEMETRY)
> +				*offset = CRI_OOBMSM_GFSP_TELEMETRY_OFFSET;
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> +	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> +
> +	if (cap_type > WATCHER)
> +		return -EINVAL;
> +
> +	if (device_id == BMG_DEVICE_ID)
> +		return bmg_guid_decode(guid, index, offset);
> +
> +	if (device_id == CRI_DEVICE_ID)
> +		return cri_guid_decode(guid, index, offset);
> +
> +	return -ENODEV;
> +}
> +
>  /**
>   * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
>   * @dev: valid Xe device
> -- 
> 2.43.0
> 
