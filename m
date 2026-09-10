Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F7458FD26
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066573; cv=fail; b=CDdhpoUMkQjbtR40gU6ZySwUYLdQ7luaobempDvC3qyBSTA1nqgkJIdQEHJyWoKUpSV/uCAK/qZKaV9nDHXTnrrB5ezem0kHGglNk+Jyvmq3zqpmh7/gAUWZYB6IiCuYZkKIthcFh4/q7N7hz6ej5DcRX1XcMF3hMG66jr2/gw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066573; c=relaxed/simple;
	bh=LpunQpg7dTyB1o52QRPbgBBsXu/IvCMgKzlnRJG274w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WNqFjib05xZLlxoHjY12aZfsw3kNKnul1ktFKVfexgygMvy1ZwVK6oQfAp4jRKQf3p1Wk1NZQwgSGL9z4cyKfMZsUpE44euUazUmoWKSSceGRreO+5jDsuCuS1bMhSk2qqNn53PKlj4z2uHNmwkDlu6nI/Glj5bSPBDjAhdJj8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qn162v7D; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qn162v7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789066571; x=1820602571;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LpunQpg7dTyB1o52QRPbgBBsXu/IvCMgKzlnRJG274w=;
  b=Qn162v7DmAdQtGRUNt4VXfI/sW83jgIS3Pwt6hvCjTDQ4Znvz/NVBdVz
   Bs4I0dOFOCqERRBkVP2N6O2NSKygTc/PK9PJdINeaRsHdPqjQ2d/m6Kp5
   KoGk0Gk2g7Y/B4qiX355iwVKRqkGORmXC8G2hIld8xUThqH8u9l2mRFy/
   loDgtaQ2fD2tFANomDePqYgTV2j7G+DlDQ2og+xr3LLkXAdC5NbVQr65l
   9hJBG5bnrypwto9p4grkHg1+iRHKc8j/Lyc4uTgM2/QgK/R7lC3NYUXDU
   UHzEBt7fOIhELn+dA+m/YQfaCe5RvvS3gGC59IJ9BRpl88BRhHZ9Lj++O
   w==;
X-CSE-ConnectionGUID: c8ucBQbSR7qTQQ0tyWMFUA==
X-CSE-MsgGUID: 5uF8FI8/QVuIXn9jbwsLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99856612"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99856612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:56:10 -0700
X-CSE-ConnectionGUID: +AAWOX+5SpWaMozdlmIIZg==
X-CSE-MsgGUID: rPKSFPNmSm2q2ecmSJqq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="272227845"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:56:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:56:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:56:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcdmuxqDbOSvnJzEp/WASmpaIydGz7tlgnP6mEPWd9Cmvxfe8TeiyVPxKFx1gyOuqZofzxcL5dpuqxq2NJA0A8WRC7FmU7Nte7+Fv51Vaax3YE32+jEdZDg90bfHE4KgpN5EUILFDyZWNXgPWMjGrzaE73ssBf+ejLN/si4po/EYmNE02m7YNWy5Wn2SKyAmrGewzRPolxt8oEbDgN7q9569Qcj8XQJFOOqZaHu0AT/cEwoOUjrIWOH2xRaIDfAlUnoQPZIRLEj8hNr9Auio6UBmzwhnP1F6f0tEKXIA3H5sUnoWbqCEawDFu8sqpyl3bEemDdYqoLgDxgj6qC6eag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9pM4s9ZJX0Ys6tHmyETbvFwghyucdpQgRuNufvpxp8=;
 b=jU/0HnDNsqKRITAOOPEaP+3O42PQGQUk3/OsxRajvhI8hhowJoRrfB0Ep3L508rFygV3ij3eCHuYSvT4Po+XvNwKGEkaHzUL9P5zsX7VpA5YbhtxGFS+FVEnq8wKQNqnY2T6wZBBkAPD2X3WFJbVbpkOLC1G87rb9cB7G9JYP51blyOUVL9ED8I2lm55/Ehs7PLg77DFMxkpcvKL6nayOUTfoscYI/aYWNLkzp/Y36gXize44HfUtGITCxSuDcDYkuAIjWzXgcYg8cZg7hc4FS7Fx9Rx9JMQ7ZqmNH9WEhJoLz3H94fS5pezIdiAhzTnZUe16EBqHUE7DlhNXiKh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Thu, 10 Sep
 2026 18:56:06 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:56:06 +0000
Message-ID: <babb052b-64f1-4fd4-9251-6759be728556@intel.com>
Date: Fri, 11 Sep 2026 00:25:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/20] drm/xe/vsec: Add PMT GUID internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
	<badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
	<james.ausmus@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-40-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260909154739.1515514-40-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PPF2F49754B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c4f1b3-9f51-4f29-f30c-08df0f6d2b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|921020|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: blTHu9tkI19+kKawDUed0XypfxDUojTgJvAAfz4bkwC6Ki6/oPBsakz/YfnAlKq8QoQtmziDjQNQYoHlK6f4MI8uq+7DitJLhS4J13HwLtc4cl8k9ak3MevZ8D/5E5M6EI7zBoBWmAi1czjyDhhOeWXEQZbms9y726TSf/DzbjrjWywKNfW47ZrW9Blp/mYg94iguKSUUvQrQhBYzkEa0lE70g3ooz3gWNZz/u8C2sZZk78UTVQa16epR0q6d+ZdSz2F3hgAUURG/P8WJ+VVtiZsCX9Egei8xbgAtiw35ZkrpS7E3rl6qe3R7CoiNV6VNdQZ0OMmjihgV9uY/yAT7B+Em+v6vgf4psJRAu3DeVbuPHnDji3Ydd9Ed+UlLk+g6QyJQlP6ilRp6Rn9dPZUxAwD7SLPT0+Aw4qm6Gm99pS0k5vz/xi71mW6WCP4psgTDKP6GLe5l3Fs1B/mJbLC3MfFGxAW94DqW1nkdX9ZByl8WYksEfcpb9LDwHASDx2s2Ir5AWc4mWcCvJrziE24uKXDDebxohUYwNFnokpLwACxIXpclIPPRXsMY0l+4sEozmZCxiBa3F7bMgPhcV1HKtLNBzjdG8kNOoI7/K+0HfxXByJVmh5VgbiUIj4eOYwnInJOeRtimuA3QQHpUS4IbZ3zav8rf/T+V+OOQDcQBrDBjtufXJhyr0eq4wCXqAmHIpbU7i+jsETExz2c0o+8FQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXNzZm5BVGhwZi9QbDFidEc5SnAzVm1jYVhiMjdSQnl0T21naDhRWTcwNnll?=
 =?utf-8?B?TDRZR0o4M1FadlZSZ1pHTVY2aHVqR1RyTk55b0pCUUg2UXQ2eFc0OHlPWGor?=
 =?utf-8?B?Q0NTKzlFaGgwNUppc0xTencxaHVRdUhiS1pVVE9scHB1ZEY4cVA2bnZ0VTR6?=
 =?utf-8?B?YkRkM1BPMlJIblVGOG1pa0JrY0I2TW5kMTNqdW4rcFI2WFM0aXBIdWtPVzdl?=
 =?utf-8?B?bFd3Z0MzQlVHVC9NZUd3QmZhTXJSTUxwWlcwVXBRYnBDR3hoN1lieWc5aUhP?=
 =?utf-8?B?NUMzS0x5OUdRWERBeVgreWRIM1FZVVk5cC91MTFUUU16eUpBajlSamxxYVI2?=
 =?utf-8?B?cHNRNmhnSmdvUFF2NUF6WjJrSG1tRTIyYktIdDFMeHVZbzQ1SXluY0tlZGwv?=
 =?utf-8?B?a0ZRc1F5OFcwRGZ6WnB2TVZqQUpmUUJNWmVnaUdSOTFOUGtrSTY5akJrdVlr?=
 =?utf-8?B?THF5V3hIREw0YUk0ZDFQT1RtaGVNT1lyaTNEc3cyaFpzcEdwY3JKdnRlTlBi?=
 =?utf-8?B?VEw0TU1jUTRHVjUxSEpGUWx0WDM3cGR2dU8vbmQwdkZxUlNxcjFGSXYvYk1M?=
 =?utf-8?B?aWdwS04vUy9NSGJ2ZVBxWUUzMXQrd2lBVWRvK0pySWtDRDh5UC9tZmhkS1dl?=
 =?utf-8?B?cnVlYk9tUkUyRzdrL3R4SmNqakpaalB0YXlHMFZIZ1VLQW5LbExxS3J6ZElq?=
 =?utf-8?B?emxtTWZEN21rOHhLZWxScm1vZjIzbkhPQlBaZUhNUHROYXE2SXhqaG04YXdu?=
 =?utf-8?B?d2FtVGtnUkppV1hmd0RhSzl2VmZvWlBsTkRJVGNucVQzSVRreDN4M2dsbm83?=
 =?utf-8?B?dktaVlJraXNtMXhyTUxoVXJqNXRMbGhSeEh1WFY0SndUeHQ0bXh3MEZHWThX?=
 =?utf-8?B?L29wSTVtUk94cVZRMGFUVVpaSkdCLy9nZ3ZVaUV4VUlRWmVVNVBKaGZPSmNB?=
 =?utf-8?B?Y3lqZUpwaDY4Rm9PQXM5WTNZR1pmNGdRaVdWUW5aZU81TVE4UzMxKzFlR3Iv?=
 =?utf-8?B?TGthNllRbndHZEJueXhBSFlUS2FTZ2JEbmIyQWhsamFmQlJCTUN1eHFJSlhh?=
 =?utf-8?B?MlNSbTUyM3MrS29DL0dSZEtveTdhVWhKSzZkY0pJYmNFREpRMXcwWklkQ1V6?=
 =?utf-8?B?b1FUTit3RWNjNkRxUkZ5Y29IMlZRdFNULzQ4N0ErbUZXU0hmbXR5L1N0M3l2?=
 =?utf-8?B?STNSRmk3b0MyM2pKUlZydUord3g3RlV3Sk1zUjhibjREdXpTUFhuV0tQNHpq?=
 =?utf-8?B?WlZPT2pCaDI2WHQ3dmUvd1JmK2dIMmZ3eUM1R2E5eXNqelpKTVUyaGpGRUJI?=
 =?utf-8?B?clN0cGhwa3A0dUlJZVVZcHA4QUhFSk5Ob0lJVEd5TjVtbnpicW9kQ0FaUE1k?=
 =?utf-8?B?ZDhnTVkrYVBNTUo4VVJXL0VBSEFIODU2czFHUFhEWkFLc3c2K3lwQ05DZ3JR?=
 =?utf-8?B?a1Y1dER4TStiNUhIZlNIMG0xZllBOGJmVVRMTXhDK2RpaFB5R3R4YnFHYjI2?=
 =?utf-8?B?eVMzYW4yWmFVdHNXSjFNVkVGM3JBUlVIMGNyOGZ4QjBVVnI1YlVFcC9uaEpn?=
 =?utf-8?B?d3V2eG8zVjllTXNDcUYrYUtwc1BPRGdBRU4zck5qa0llOTg3U1pud1NTcmpq?=
 =?utf-8?B?eTE2dThmR1VLbTJFYlJzRFJOTGxzNythaloyWG82MVRXa1ZBSElEZjJKVEtk?=
 =?utf-8?B?blBEU0VYU0dadFVEQ3dLNVVMNTJsYmd2U3JobnRNMWRxd1BVajdGVGZhQ0x1?=
 =?utf-8?B?ZXhXc3V0SFJqalM3d3FGTm9BaEhmL2JmdTVUZ0d3bTAxTllsZTFHQThVeG8w?=
 =?utf-8?B?dkFpbW5STnVEaW5yL2p2Y29jZUJrV3k2TENUNlZHZEdDNnM3TGZ4dkNZYUQ4?=
 =?utf-8?B?cHNYOWZrUDFlR2xwbUtTT1pQczhmb1YwVzFmMktObnJxWnFLcU1ZcFFGUVNx?=
 =?utf-8?B?cHZiQjRUNTJzRHNuSmNiN3diVHd5MWU1cTlzSjZZN29wRG1OY0g5QVVuVjVB?=
 =?utf-8?B?NE5idDRXWllHd3NLZmJ4eXBDRE5ldnV6SUw3NWxsakpQWEFRM05qQUZMTlRu?=
 =?utf-8?B?TWJhVFVHdFp5aFJFUEtndmViZUNqZEtkTHg3MVBnVWNPcXVMWCtBRGZYbDlj?=
 =?utf-8?B?SUVmd2ZyTGE3WC9DZkx0c3dTZEg1QjFxcXR5dnJ4ZnhpcDNRWE9oZmRvQVE2?=
 =?utf-8?B?ZVFweXJoUTZQeVJURUJiWnpGRDh4eVppb1JCZHE2MnpacXh0MlNtKzk2cUxN?=
 =?utf-8?B?OTd2clpTVnA3Q1JrUDBjRnZZYUsxcjFpTWZYMHVYajMzcXRLTjFiMlBJRnpG?=
 =?utf-8?B?Zjc3eG5tanpYNUU5WVkvUjRIS1ZTczFzaEhEYzFtaEVuM3BoL1JGdz09?=
X-Exchange-RoutingPolicyChecked: vZpzq2ds5UUuWIrxn4pr0vRAcqgd+EIxg5roIpTXPyrCLTZ8yC9FdoDysuvtLJeHoNq4WaYoZdHGi/jGDDr8K/lGKnwnaMks71x8a8Y9DhYWDJOQi8pq4O9CRHJR14U1Er4mNk22mLkxhbfJBs+BG+MilFvN4gMtU+lnPFV4/L3lxBSyhcIWlVgaotjSo+MhRq7lWg9BRutVgZlIvpoRhuNWYsb2KUathr6zWmudZ5yw0MYjLb9hBxNXgnXmVZb8CxXLBcYkEq7NpH9OdhG1PqrvRSV5u6wOT7Gnj2nKyC45MtN0bDKm20f+4fXvlzHnXmL8/CsgAY2BHuZ6K+xb7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c4f1b3-9f51-4f29-f30c-08df0f6d2b01
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:56:06.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64mJSKDXRnyeE7HRsusU/D8Xfua5lf4k9wx7qX+m5Y7kmPSM7xrMuxIm4FVjH/rIvKzawSfgEcwvSKowqfHQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
X-OriginatorOrg: intel.com


On 09-09-2026 21:17, Michael J. Ruhl wrote:
> Xe accesses the PMT infrastructure directly. The current usage is
> supported ONLY by BMG devices.
>
> CRI has further requirements for access.
>
> Add the platform id to the GUID register define and use that for the
> register access.
>
> Add an API to allow access the GUID based on the platform.
>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 ++-
>   drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
>   drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
>   drivers/gpu/drm/xe/xe_vsec.c         | 46 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vsec.h         |  1 +
>   7 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 2f6658395587..fb5b5a8648ba 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,7 +10,7 @@
>   #define BMG_PMT_BASE_OFFSET		0xDB000
>   #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>   
> -#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>   #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
>   #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>   #define	ENERGY_CARD			REG_GENMASK64(63, 32)
> @@ -24,6 +24,8 @@
>   /* for CRI discovery and telemetry are in an indexed window */
>   #define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
>   
> +#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_PMT_OFFSET + 0x4)
> +
>   #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>   #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index a7021a1b025f..ab666f6cf55d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -153,7 +153,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   	int ret;
>   
>   	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
>   				&residency, offset, sizeof(residency));
>   	if (ret != sizeof(residency)) {
>   		if (ret != -EAGAIN)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fe0ed535766e..dcdd971bfa52 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -474,6 +474,8 @@ struct xe_device {
>   		struct delayed_work work;
>   		/** @pmt.retry_count: late-bind probe retry */
>   		u32 retry_count;
> +		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
> +		u32 punit_guid_cache;
>   	} pmt;
>   
>   	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index ecd52a04175d..d53185d71a49 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -519,7 +519,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   		u64 pmt_val;
>   
>   		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
> -					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
>   					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>   		if (ret != sizeof(pmt_val)) {
>   			if (ret != -EAGAIN)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 8f9afa0d9440..48e8f169af40 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -369,7 +369,7 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>   	guard(xe_pm_runtime)(xe);
>   
>   	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
> +				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
>   				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>   	if (ret != sizeof(*version)) {
>   		if (ret != -EAGAIN)
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index bf75adb73f27..1c0d35232f0f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -573,6 +573,52 @@ static void vsec_disable_late_bind_work(void *arg)
>   		xe_pm_runtime_put(xe);
>   }
>   
> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret = 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return -EINVAL;
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	if (xe->pmt.punit_guid_cache) {
> +		*guid = xe->pmt.punit_guid_cache;
> +		goto unlock;
> +	}
> +
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		*guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		*guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		*guid = 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	/* the GUID is static, read once and cache for all requests */
> +	if (*guid)
> +		xe->pmt.punit_guid_cache = *guid;
> +
> +unlock:
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>    * interface
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index c4a1e2fc67d8..50187fdc1207 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -10,6 +10,7 @@ struct device;
>   struct xe_device;
>   
>   int xe_vsec_init(struct xe_device *xe);
> +int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
>   int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>   
>   #endif
LGTM.
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
