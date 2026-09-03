Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDD377EA7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414625; cv=fail; b=VJbmwdQY7G3JEn90BnNyNVXh6O9H/cleATYD8rVYXHAs1tDqnqghMNSh9DCtMuSlKu6Wxd7Nrci/QZoiDanMyl6BKdeT7zBfhaQAtk5LxSgJHUGpBXQNBlPr6715BdmKLw9yz16m6BtBobrdDTIIlYL+s5HG42BomWi4SyKiE9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414625; c=relaxed/simple;
	bh=DuvPMf6k0RpvVBpvPS4qrKmkng6tnnhN47qWMr5D5mw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=orX0mboktWyih+dSAo/G0lyaf7ygpmkIm8HvN05OxH0M7nxXnTREDukJALrtKxwRb7+LyhyKw1Dh9PM9Vx6wWK6GxU85DEdMWGamtIsvJ++gdv6YSIFNHLihL1YjCa2w19/WD8UFGfIRmR8uVp2uCvdUFlJGZR9JSzKFcunAMgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xt+Vj3Lb; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xt+Vj3Lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788414624; x=1819950624;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DuvPMf6k0RpvVBpvPS4qrKmkng6tnnhN47qWMr5D5mw=;
  b=Xt+Vj3LbThUrbQO/6BfPmJkd+N+uPLVm2XX9ubBhZOhiZ/fiCdrG1eo5
   Prd0zpzfIVxzHupXT1arGQq2xIiPHPqZsZ9JptUv80iw6h5HKE1n8hwpL
   4Dz3VdU0TLH94GMm4pR6J7s+qv2f7y0U85JIhKpTteDbRHdiYupjRxkOt
   BsjW1r40lkBPac8kT2Cl3cvqYukrBxESLRZzoe4yG5tPCkacr9hv42eSE
   LTDOfT+AXCi0YnMvKuJM88BCXTVTV38nCiRgDx7p/TmxadNoh84xb/Pad
   e267R+llQLXiWOYw9TK4caVtupbJGjfNNWXXs+eqyIV2hX8GyYIr7caHO
   g==;
X-CSE-ConnectionGUID: tRb9UzvOTSCM8Hvg/tkG/w==
X-CSE-MsgGUID: x9BwiKi3Q1e/ywbQswh7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92703360"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92703360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:50:24 -0700
X-CSE-ConnectionGUID: pJOwIWZ/RlmVrcjiHG/9aQ==
X-CSE-MsgGUID: 47quzajqRJyWk3vL8dUeSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268285194"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:50:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:50:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 22:50:23 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onU0PZq5UsI6DJchzy3lrR2I4F3t+cxHEvpHdeYefRSvF1bnAPC92FKCNWxJHHupNMkjTZK0/7Luo4G7A7zHpo9BSMO+Lnw1tzHff2ISRPGkoxNMkvStQkhK2YjmcW+ePDbP6gQ286fODy/xQDGS3M2lCh4esRPCs31DHHX/L+IeFXCu3/MZuwpMUTGY7GCM1pP4LleEzV6SDNs6SYRpcMNX8A0XF/uckRa11KYo6SBayDjJl8or4A7tLnvm3N3GJmnrliblBX0GLdiiOl3COiAmpAABcewrg+XCdJoSuK7cq15Wakaz8toZq6JUUdJnj4yOU1a72R5ES4FW25kEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp2jJSywBAbYWqO6qcytotzsqiXco0s9oEcVshkdQrk=;
 b=Ld2BWMIWjF2q6q+meDoMEAuennZjjbW7Fa7cydbo2mdxuV7gQ6/yZdTXn2Lqd8VPIDapo08pLy3Z9fPhonKI4cvWPg0yV+zaSAfH4wHUTMviJWUDdH0sMy+tEXVNP6+RtnQ0UUUSMid4JV6KFlu2B44XSpR4mxJ8YakZN/vPeXGs1JCTAlMsW4z+hgExQloMJeUPlmoxbaPB4FGBS7ZbjetwZg+FRlbYAOuoqoIPUAp8mPMw0aHYMblKkXF0bOdgoCOIwSgzYjdItm6ohs99rR9oZtPg+lZXi93Iw3pBpWjjCItx9dD9xyPjbz2q8IbWycglHSUtt2GnseXaErswIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 05:50:15 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 05:50:15 +0000
Message-ID: <4fe43cd3-0feb-4833-ac62-1a40bcb9b417@intel.com>
Date: Thu, 3 Sep 2026 11:20:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] drm/xe/vsec: Update PMT internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
	<badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
	<james.ausmus@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-37-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260901192736.626777-37-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: ddff6366-41d4-48fe-4100-08df097f3a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|921020|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: g7DnIHuT4hLopinqlwQj56m9TR2r2wnNLi0ofAlHhXsScBRUXjdGz6vNLzqYNryzzqrGs3eJyklJJOnLg5hd6zU2NsTRg+/yZkER+9xbvnKst3DxcwSMXUpSxBjHQFHSJvZEmbmVnylja3xVZ7G+c0vF8HEgPTe9iXUPSidhCGMZlqCvtu4FGwYY6kYFph1oWtaA9MxPrAVwp/JD54PtpZlP9jtIMk7V28Z8LdQ6H19xPLUSOFX9vd2DFF8Q2PSLgKAFVVJjxVjKEZsz4rCNviaxr9mecXeacN85tgr0CExGvsYOwVgm9WFN7BWkLkSC4+C0oM/l9iFVMzUj6H+SWn4Bnna2hPVtoCCfrDlN7cn9hYvOxhyhzZ6QtMP7id0tWpYaPVlkk1NkB6U3SablMhnraRgVhiVubxSqG9GVJMyAfVWG+c55pF1UmXmI7/sTZK29RILVFEHZJISAszXImq0uGlQvTD+gz6h1MMJLsVU2W3q47EafzH7Wq48BiFmwOg1Ea26R2cZUiVpE6jX7kUfLbv1gCfvWmUrzVCkPe0sfTz8+jnuULMjA12ZxpnYQfxPP/cI5RzLOx/ak+Q9iA0nmOAueNv/tNbHxm5LYchpGBvEJgapzxr392TzgsI1+hIcT4OK4XnAED1ziEzL/rBXp6J6xoAmyA2eGm1FE19BNGjiStsKmDD0fAIZwDaW0qqDfjyMx38QUtAkXCY/Exg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0N5Z2hoVC9SdjZQRTNyY1AvOHk0NUlXYTg2WmpsVHpwcnhnYVNOUnRJSExi?=
 =?utf-8?B?VWNBVlZ5TUZEb29sb0F2QmhtK3U1V3Jyazh2Z3BtQzNueDlVZERmZlkxZXpj?=
 =?utf-8?B?MnlYd3NhODZBVkFUL21jRnllaml6Smc0ak5IRVc1S1RmSmpZZE16aEJxOVA1?=
 =?utf-8?B?cGZ6Y1BDK0NNempoVlI2Z0pkTVhVSzYwUmpWQWlReld5ZElCb3B4ZGwxa01V?=
 =?utf-8?B?TWoyVjN6QnJhR3dNUlpPUmYvQUNrNmphYU0zV1dZTjVFQzZiTVZjQWpYaHE5?=
 =?utf-8?B?aXMxR3VwcTMyZ1JQMk9kVHB6bGg1dkVkSHJ6WDVWUEFhSWlkODlUMmFzcHF4?=
 =?utf-8?B?ZktzRm5Tc01QVjduYVRtZjhhVUJmQzR6V0ErYktmUnB4N1FoRDBnZkllTFJu?=
 =?utf-8?B?TFhvc2t1aDNXelFId1Buak5vOWRQZ2hlbWJSb0FaZm14T2RkTUlWZnlIckE5?=
 =?utf-8?B?M0lmUDhpRCtGbXVHcGNkOHU2bUQ0SUZHdVJEM3BJdktzb2xsdysyaEkzMFdV?=
 =?utf-8?B?MkZ5UUZPYWFNcGwzNk92V1dzYkRJbjliNmcvVDQvNjdIS2YwNE8zbDNSd0ZZ?=
 =?utf-8?B?UWhGSU1jdGJGbVpjU25WY0VlYU4yeDBiOEpldFc3VHNIZVNpQzc0Nlp2Tkl2?=
 =?utf-8?B?MHAwVkM5ek8rMFdiSi9HMitQaVljallFWGJLUzJORnkzZW1JZlRGbGdjMVRl?=
 =?utf-8?B?UEtWeTF4VmJNQmQvQjVhQTIzUFJLRFJST0o0b0Q5Q0xtUVlwelhuclphazZj?=
 =?utf-8?B?UTFYOEp4REdnL1MrZ3AxVHdjYUVqKytyWnVsUTZYMEs4VVdsUFVjQ3hCNlhE?=
 =?utf-8?B?SkJvd3VxaHJKSFZTZnRMZjRmc3hPbjBGcEU4cTRzcUUrRE5EK2FoTXh5VzJS?=
 =?utf-8?B?T0FVaFh6ZHdxQkZGVGFISXhYSlVibFA1S1BuTHFFTEVqUXYrU3d2VzJvU0lQ?=
 =?utf-8?B?VktHdHZJcEdXWlorbmVzNno3TzRqQW04c1dxZlprTkZEdFpGaHo4aWNaRjlG?=
 =?utf-8?B?RmpFWEI3MFVxNjNvRDVLNXJTQjEyaytWL2RJQUtVZlBEeHVaMDVZMEllaDVl?=
 =?utf-8?B?ME51eHU2OEQ3YUlFNTFFTXRuUE9CTG9UdStSK1BlbDlVVzZjMXRTNlB5UzI4?=
 =?utf-8?B?WGhXc05oOFp6eXMvUlRseElaQUVmdkhqc1BCYTgvdjRYaU5qNys0ODNtUXdn?=
 =?utf-8?B?K2pqWTlBTi9pZTM2Zi84RklXZ3M4czd2c1ZqbzlzQ2UwWlhBNmJQbW5ZM1Vp?=
 =?utf-8?B?UlF3OC94dUNCZjJBc1lVRnVoZDNzYnF1U2k5cFN5RkcyclZoOVlHY0dudDR3?=
 =?utf-8?B?Rnp6Y3NMdXJldSs3UWFjY3dJVmxyYTlRUFhkdk51azZnMHBzK3I2NE5wbktj?=
 =?utf-8?B?dUFwNGx2bkV0UXJwN2NsQVp6bWJOL1Y3VXpDR3dIZDVia2t6Ly9GLy90QmVj?=
 =?utf-8?B?U2pOQndvZ0drV1RLWE9xRkNzOXYvWldCWjU1VmtESzNya1JmZWNxZExGb25w?=
 =?utf-8?B?NEtLVk41R2JDQVR3MlNrNS9mRzZSVklUUDR1RkRUV3UyNEVrSnc5LzJMc2k3?=
 =?utf-8?B?RENrQ0VhWkJEcHVZQjFsaC9ZR2tyNlNkbXA4NjZYditkN0VwL0FyKzJuSG56?=
 =?utf-8?B?RTh6UkwxdlpKZjB5TytJZjRjZU93Zkt5YlNxRTZva1p5L2dhLy9hcnpSc3Zy?=
 =?utf-8?B?RVgxZm9OVFhVOGIzTmNMNGVWT1l6cExVazJpZUxUaytsTU9jbEsrdjJkYmoy?=
 =?utf-8?B?dFJNdDJYZVl1dmxzNTBYeWUySzJWOGEyaDE2L2hvZnAzcUZNTHczTG1laUM5?=
 =?utf-8?B?R2ViaG91OE55NVFkdGVnbjFqUkZHQ1N2YkVrWlU0QkVVNHNPMmdwbUJORk81?=
 =?utf-8?B?Uk9wSXpPZWxWV1ZvVFB3TDRqUDV4SStiNkJIdXd0SDZtMjh0bUVxTzlURjJi?=
 =?utf-8?B?ZVZhZW1VcmlPTnRUZlJ0Ync5ZUdIVG03ZGpySmVDYWpLbmp6N0JZZU9Fc01q?=
 =?utf-8?B?SW5hOFZZeW5UZlVlTnhSSVFoY1kreCswTWdVUWFWRjNNMklGQ3NGamhLQWFj?=
 =?utf-8?B?b2daRitRa1QrR28xSWdXazZnU1MrNS9VNDNnN0MrcGVMUm9jQXFySkpwLzls?=
 =?utf-8?B?RzZ2djcrUVBjV2U4VjU4cjFGbUthazJ6eTgrMHVvRG84aVVaek1NOFd4bGQy?=
 =?utf-8?B?Q0dmMUtYTXg5K3kzalZNeXh1cHlOWnIzbWNBUXdrdmk4eGxYSHM3SlBPdDlK?=
 =?utf-8?B?cm1YZzh1aHVrMWpGVlQ3NkpnSlE4eG5jLzBtdVBsY1pITmxoSGpSL3kyditL?=
 =?utf-8?B?TUdVem10N3R2aytFcXBERnJXRnhMa2xpUUI1ZjZMNVVnN3FDTDRFQT09?=
X-Exchange-RoutingPolicyChecked: mEEKITqb+77Eh6fID55BVshhx4s5ziA+ejlIwmQb6Q8SwEQ4o9HuUmJIK90m288mPBSMTvziSPqs+fjuwGZVyS/ZLaPnX0OzyMqkFif9ewcgLoCNTfhXkyUXE4S2RlUbVcQcu0XeYTMpzg9095p4YXFXUPxnu2RSEzlqY3GzO+qDYrmX6HdWb4zzVWq3wuo7vTz5/xHQ1rAgGcoMe6WE/q+vJ12cvYlT+u50fu9FUlRuFOKhbJLFkTOGbiyJ5S2aUehoPyXG3rftiamnYqV0BO84MhM15xdJsxGHidy9xatJuIcij9fnwm2LRvqcgsi4rzh7CJ+9RL7+AmuI1khmbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddff6366-41d4-48fe-4100-08df097f3a5d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 05:50:15.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eofMH9gMk6U6vY1rrrby0aS2dd8504OjcvHqmRHwXaJaNRqwY8Yv0c8zsRbwy5ABR2ROVpDDbXPfNkTl4xUBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
X-OriginatorOrg: intel.com


On 02-09-2026 00:57, Michael J. Ruhl wrote:
> Current PMT internal access assumes BMG devices.
>
> Use the new PMT GUID API to read the device specific guid.
>
> Minor cleanup for a newly unused parameter (mmio).
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 27 ++++++++++++++-------------
>   drivers/gpu/drm/xe/xe_hwmon.c   | 10 ++++++++--
>   drivers/gpu/drm/xe/xe_pcode.c   | 10 ++++++++--
>   3 files changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index b01f1e649b51..f17b993755f3 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_debugfs.h"
>   
> +#include <linux/array_size.h>
>   #include <linux/bits.h>
>   #include <linux/debugfs.h>
>   #include <linux/fault-inject.h>
> @@ -21,7 +22,6 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
>   #include "xe_hw_engine.h"
> -#include "xe_mmio.h"
>   #include "xe_pagefault.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
> @@ -97,16 +97,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>   	}
>   }
>   
> -static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> -				   u32 offset, const char *name, struct drm_printer *p)
> +static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
> +				   struct drm_printer *p)
>   {
>   	u64 residency = 0;
> -
> +	u32 guid;
>   	int ret;
>   
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
> -				&residency, offset, sizeof(residency));
> +	ret = xe_vsec_get_guid(xe, &guid);
> +	if (ret) {
> +		drm_warn(&xe->drm, "PMT device is not available: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
>   	if (ret != sizeof(residency)) {
>   		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>   		return;
> @@ -245,13 +249,12 @@ static int pcode_info(struct seq_file *m, void *data)
>   static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>   {
>   	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>   	struct drm_printer p;
>   
>   	xe = node_to_xe(m->private);
>   	p = drm_seq_file_printer(m);
>   	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
> +
>   	static const struct {
>   		u32 offset;
>   		const char *name;
> @@ -265,7 +268,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>   	};
>   
>   	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>   
>   	return 0;
>   }
> @@ -273,13 +276,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>   static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>   {
>   	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>   	struct drm_printer p;
>   
>   	xe = node_to_xe(m->private);
>   	p = drm_seq_file_printer(m);
>   	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
>   
>   	static const struct {
>   		u32 offset;
> @@ -291,7 +292,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>   	};
>   
>   	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b9740224e07f..c44a7d24816d 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   
>   	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>   		u64 pmt_val;
> +		u32 guid;
>   
> -		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
> -					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
> +		ret = xe_vsec_get_guid(hwmon->xe, &guid);
> +		if (ret) {
> +			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
> +			*energy = 0;
> +			return;
> +		}
> +		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
>   					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>   		if (ret != sizeof(pmt_val)) {
>   			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 844d8c6face6..039c23086990 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>   int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>   {
>   	int ret = 0;
> +	u32 guid;
>   
>   	guard(xe_pm_runtime)(xe);
>   
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
> +	ret = xe_vsec_get_guid(xe, &guid);
> +	if (ret) {
> +		xe_warn(xe, "PMT device is not availalbe: %d\n", ret);
Except this typo, other things looks good.

LGTM

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>


> +		return ret;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid,
>   				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>   	if (ret != sizeof(*version)) {
>   		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
