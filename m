Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABE4F052F
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534894; cv=fail; b=Rfqy1MoMSpKYjsnhHzElBc3XB3olk62K1SGAeIy6h+XVsL8nxoL8oDmjtmkEolxt9eCYzdhG9drckS/9DveIiwB5p4Lz5XRMUTQQM0nKDlx3FLdF7qE/I1s/XRC/gKp3f2PyG1QSEGf4OF0Y7mEnyyeMQFmDvcsYutbKn1P/qYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534894; c=relaxed/simple;
	bh=OWNKsfdLH39DTSu/lf95LHkEtOaYgsAp/tqIZM80ljQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X1RA0eO819YHnkrdbhPLtS07kydEzkSc28RJG53z1jyLkkWMVucFRAsl84Ym9xaeZ0LNTMomqb+GCAd27BT6zilzgksQCrjJ4CqN7Tb69/nkg+S8AV+WS7Xi3svZvSR8r/W0EvWnyACtZK4vkJ3Egegj+v/z23SvaoaaZyDpvVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2vBGG6J; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2vBGG6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788534892; x=1820070892;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OWNKsfdLH39DTSu/lf95LHkEtOaYgsAp/tqIZM80ljQ=;
  b=i2vBGG6J67qYj4ZmwCKO7+ma0eEI6iEHdt9v604CsNkUoHadB8s23+tE
   LIJJgHHf/T+HOGc6gx/B66p5ELu/gfYEp86IgvCxKCMFObysFTLAA7dvo
   JH2B9HoTGOHvk2xLdh9ooNUS51f7OazabD8RETTdandiHYYY+um5mUUti
   d6JBEsmLB6JESjWrHtGabC54E90tP4RP2Y2oVE7CkuNV7A3wofJS1HOwu
   u5wQzhoWKsMcfvlCZ41SeDlXmDdFNPLmxypbgC4p9YN4rhif8mfp7tvsi
   Wgqd6b35uyvEQvrwqGFFgM+eockr9XvdqksR6Nhq+tfdTWwpKibsMwRJk
   A==;
X-CSE-ConnectionGUID: DUCHGCDmReObxVYHreJGEQ==
X-CSE-MsgGUID: 5YMo1GqHTtyAdDPtDzNJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91549672"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="91549672"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 08:14:51 -0700
X-CSE-ConnectionGUID: PnUvOPsbR+GZUVps1mH/IA==
X-CSE-MsgGUID: IZTAbhKnRsuovhUoaAD0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="308274019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 08:14:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:14:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 08:14:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAuf7vNHAvtRsTPh/Yuf5iF+2sy5x/Y3CBzr/ALXUBdgii6OJw2r0JR0E98YbfhcRv3ykUz0CH70VIWophSsAhgG99ZWREVe66biASkkImMo15XErdmQu/b/S+k7HGKqp6QuJUbXnNVCC/TnPRmBKZeObGCCvyvJXdLsbPRZ3y6t8lIKFBtvTLFp8GFh7oVgOj5g0zLFQLaFrYRJ/ku6LT6zGv86Pkx5YnPWLZYKDxb+p+pE8jNNuWEETGBcX0UNu6JHNSYT8cxu60xqEevzbunOVHPy4GHnBS+Ahhu7vCMT7PYpyB/v9aTDjJkPiDQdMmOLcxvMoTf8YeNx8VChvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuEOAQCqtBmVwPmVOZSRbzTPN0kCJRBl9iNZiL5tqKk=;
 b=R4EFMS2MfWWAdnVwXSK+XeluuyGlXZ9qywnzl+LnOi21BsGX2EgfwAtYRWX1g/+JbQPmbFoWiJT7xzk6cmezAtmXNyx2/lMCKfzU63m/SYvvVinwUzRbIawcMGpNMAD96dhCCb/l822z22yVcVlZpQTIyeTMZ4JG33NeGlowmSmIkJfbN1YjcwbB/4i2kmmQGWbekgpdYsUX/mxmkL0DEuApnhkbkiMaFo48sj7603xP3ZHOFU1YILwQqi7yrh0XIgUvDET5ZuuIR4HFePnJrvgOvNnJjR+OJPuQ0pwnEkCGX5tP5Z0yqwyN6/Pt0T0ZLaruhz3Ej4J+yJXVW3aedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SA3PR11MB689426.namprd11.prod.outlook.com (2603:10b6:806:58b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:14:47 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:14:46 +0000
Message-ID: <599e779d-6a72-460d-8af6-8a6cdb1e09df@intel.com>
Date: Fri, 4 Sep 2026 20:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/18] drm/xe/vsec: Add PMT GUID internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
	<badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
	<james.ausmus@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-36-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260903201002.1064889-36-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SA3PR11MB689426:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2b8080-1388-4fa9-0903-08df0a974166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|4143699003|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info: 6A1jjGLtOPZBaJLjj2dhFQZ9zbDWeVMg1/ldLHy0aapTbUx200JJ2llAXxEsat7j6nTaI0B+gc722mqkWPS9z9DtheRQBEETekZ/sK/L6klhXHamZNd1IBqZteKoIP2U4LTN4Y//RiUQUDJsSHYpz/+/8THvASHy9iIiD0tY68Dazk5EYe1m5eBuU3LhI2gC4zFkppvqlfGs1+vzrZv2BUcYUoTsWdkHfIgR6z1Kww/e/lyZwYldo6FH9JyO74NUfLESIRtcibxRJTyEa0C6rTLraB2r6k+vbNLfNyRJYAPC6dmgjcUM++eCY//+VDMTPM8u+loz24f9N6f5WzSKPmRyAhz8N2wqh1GSugZ7f4X53LK7Mrnpq+TwR5UllvcAooOcpFDSUs4HpZKjWyiSRTHSAIKZH+E6z2yZG84ME04Nvle65b5ykQuQ31uynBYS/kid4m72nxoEHBnbtBH2KNGv/D8IzKJIIMFb1Zb46aNSSPF0WEMe1hcigOl1BpHpsx44ocKgEdi1ffmGoQXi//jR5gJCxr+k07QDyreNnkF6/XgKsfE4DiHp+Rdw2d5/2s+V2ZNcO4oFdl1nrkzfwLk379u3J7Aftki6586dSwY58Fjfo40UuU5zca1EpCQ0p73+p+quVid5cIXA6JpxVQH9iDEd+0qRGnRJwnydoqcoNrZiod3eIa1PxcvxyexXttmzs+NEVsNbD5sQc9iFVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5249.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZBeEpHS1NZRkpSUUFFUmk5ZllWVzgvdWtqc2NDZWgzNHF5VkpaS3Fla3o1?=
 =?utf-8?B?VVF5eDZBZEdSNWxNb1UwelF3d1NnZzBOWkFSNWxVN00vU1BkWC9XYk11cEhh?=
 =?utf-8?B?Y29zUFk1ODlScnlDSGZ6WUZCSGtSTzJORXRNU09LQy85emowMzdBT01lT1JK?=
 =?utf-8?B?OS9GcDlGb1lPWjZsalJRQ284T1g1ck9BMUh1NkJGamtXZkZFdU5BU0VPUXJt?=
 =?utf-8?B?M0lYOGRTTnlacmFKdC9aV29oYW96L0tCMFNaRlVZRWZlYVdHK3lQQStpNHpK?=
 =?utf-8?B?V0lWQ0dFWkJXajRiam0wNElIQ3FvMjNZYXdYeG8vYmU5bFpxTXJRaG5SWnln?=
 =?utf-8?B?OXRBaWxFWTdhaTMwazk3d2k3M0kxZzVpRiszZk9hWVdEUEJMTUZBYXhGc1ZX?=
 =?utf-8?B?YnFvTTFFalMrcElwS0NRQnJ5U21CUXFmNDlPYWxmU2d0WXlnblUyZmFjVTZs?=
 =?utf-8?B?TkJOK014b0VsWTRjQ0tCS1ljZ08rVEtIWVVTZG9PV2pYVTEyQVJNcEtSTEdJ?=
 =?utf-8?B?d2k4SE9IQTB5TlQralJlVEFtTHYzdnpzVDF4ZDREcElwMFI3bDZTUFF6L3Jo?=
 =?utf-8?B?RjZkVFg1OUlYdEUzcVF6ZE5tK253WHA1L3lKUEhIeERKUStKWFkyOTJDSTY2?=
 =?utf-8?B?VlloRFRvVlhHV2c1bHdSb2hnSGUwOUl1NmZhVTMvUzZrblRjV3piQUYya2Q1?=
 =?utf-8?B?cmdQa3Jtb0IxZ1BKM2EvbzRKVmh2amYveElUWHRnTStmSE9sK3VJeTFaQUZM?=
 =?utf-8?B?UTJHQjU5RGZ3RXc3eDRtdDUwcUFoa1FPMU15SDBDWkp4YWJtbnVlUE1pYzFq?=
 =?utf-8?B?TTFMaWh5ai9qVXVMOVN2ZEFxeHd5WW9sMWhaKzF4U3pWRyt6ckdRc1ZlbU5s?=
 =?utf-8?B?SjF1MUFzSitWV1ZqS3FyN0FyYi92VlBPT3J3ZEZPZ0tWdWducEJpUFc2bEli?=
 =?utf-8?B?c2xFbWtXd0RBdmRGdVdBcSs4NTBtdjAwc0djdWQzcjFwWXVMalV6QUl5NnBn?=
 =?utf-8?B?RnZiUHRPU2hIdEYvblVNMjVuRmhXMG1EVVZ3T3JhbS9JU1JpYkZjODZZdVRq?=
 =?utf-8?B?c3pjS0o4NFBMUG9NTUxWS2prSVoyYXFtTUhBL1lHUG1UMURLREppVWNzeHZG?=
 =?utf-8?B?NXVlZFVpeEZVU0FtNURGZkloREN0clduNndOVGF6T2F5WFV3cHFTQ0xXM3A0?=
 =?utf-8?B?Qjc3cDdHRml5N08vdER0TXRIeTdJSGhrM1BoMUxoVnNhVVdlak14c2ExM1dx?=
 =?utf-8?B?b296djJRcTBMNVFhWnNxamdMQWNZQXZTM3dDQ2w4TUJQQUZIVHpkMU9Db3lr?=
 =?utf-8?B?R1R2OFZ5T3k4OWVoUUdMSmRCNmRuSWxuVExESGNCVTRHY29aa3NoSnA5KzVR?=
 =?utf-8?B?MEVaZ3lqaW0ydFpvckIwOTQ1ZHVleDRUZncvUmlEQnVDV3lJWUZnbi9kMlF4?=
 =?utf-8?B?bFVYWWxLY015WGhMR2V6TEUySkIxbTVSNjRPcnhIR0hLMEVILzJ1eUNIVUNK?=
 =?utf-8?B?Y2M1Rmt0SEhzWUlEd0piYnhMWjQ0OW1hTUcvamh0WjJpRXpRcm5Lb21xa3dw?=
 =?utf-8?B?YXdBTyt2QlRjUGtET2hsVjkvbWZiek9JcGNoYTgreWV1M3JmNGg2L2poWkNY?=
 =?utf-8?B?UGJaQzU4YTUwUjFKTmRjdWp6QVMyOGM1TDdJV0dYdTZOUWV3TTk5TkZYZ0FZ?=
 =?utf-8?B?L2ZvNXZHY1Z2amhYVzlOeUZ0MXJDYlRBWkRYaHpHLzkxT1g3MnFXWTJDMUdt?=
 =?utf-8?B?OHFzOHhvQlpEWlhYN2o5WDI5QUtFemdSbE96V3NlRHhvOTdKNGRyVGFQKzZl?=
 =?utf-8?B?cHN4OWpQSmltYWNlVC81ZEkyMC9EanpkSUNpYjhsTEVGS0U4WE8xVlYxaUoz?=
 =?utf-8?B?VC9BZ2p3czcyZEt0ZkxyT1c4QVZpU2FYWnJoTXdyWW9QNC8wTW9Hb3FHWmxZ?=
 =?utf-8?B?V0hwMWw3bzhwcWJSZVBON01iRlphTnJhZUxrWHRLYkRkT2hKOGFJMjBzb3Fa?=
 =?utf-8?B?UVU5Q1A3UzRCS0dtaXpRVDRCUnRWYlcvK1dxN0lLRjRybkN3aFNuaWtURWpo?=
 =?utf-8?B?dlZEK2lYSCszemN4NWl5NHl4bmptNzVSSnpNei9aYVZYL3RDYWlBK2daZW40?=
 =?utf-8?B?bzBxVkphNVdPVnVSM2lnSTBjak9kNkk1cVFLVzZmaVh2Rm1hRnV2SWxrSWph?=
 =?utf-8?B?SllTWlVmMXh0bTYwUjM1bW9wMGU3WlE5YmNXN3Z6c0RPOEZKY1V1bVNBVXlW?=
 =?utf-8?B?OXc3M3B4RTU3ZUhWdE5DdUh1Nyt5VmtxRmdMUlZuZEhpdmp0bm1xTzlaaGhj?=
 =?utf-8?B?RmEyOFlNVnpJSzZtOEFZb1lpY21NL3AxcjZIUFVZSTJaMVFHMFFBUT09?=
X-Exchange-RoutingPolicyChecked: 1R3efXofabGoOfCL6a+hZDCfG9G7cWHPkFbQkYq3Rf2/0IkRrCOb6LehpCn0p1X4r+luXs8Wm0kL6lv/GdqAxwVA0Ku6uH50AbSZ/T4l6bbEF8j/emN88ZOp5TqgilavL3PkyDyFNaE9FXeVgaP48ASvDEeQ8EXRShacPbf4vAfXOlW/YfxQK75lE68SWzp9hp9kLXVXjS/ulJ4+e4gzrAE1yoPnqKQD8xM6aa0c2rw7ntCP/y/3sprzWuz1gEBI/QXFsAQVOn74sNi8aedgMskESXzdFSrvcmBcKz0U6pzFbliUyVxF+ep4yVqYkGUrPDUrJViANLaZytGjVOIncg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2b8080-1388-4fa9-0903-08df0a974166
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:14:46.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJoixhElpXlNVOjC54L6krCgYta9r+fKQhvltSxIdi+Mkr8QnN+nm9jr5DeX7ts1yAdD0bgAwglvbvvW2PFu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB689426
X-OriginatorOrg: intel.com


On 04-09-2026 01:40, Michael J. Ruhl wrote:
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
>   drivers/gpu/drm/xe/xe_debugfs.c      |  3 +-
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
>   drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
>   drivers/gpu/drm/xe/xe_vsec.c         | 44 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vsec.h         |  1 +
>   7 files changed, 54 insertions(+), 4 deletions(-)
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
> index 28135f84e286..b01f1e649b51 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -101,10 +101,11 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
>   	u64 residency = 0;
> +
this can be removed
>   	int ret;
>   
>   	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
>   				&residency, offset, sizeof(residency));
>   	if (ret != sizeof(residency)) {
>   		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 69e052ac5a82..2a8c519e1639 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -473,6 +473,8 @@ struct xe_device {
>   		struct delayed_work work;
>   		/** @pmt.retry_count: late-bind probe retry */
>   		u32 retry_count;
> +		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
> +		u32 punit_guid_cache;
>   	} pmt;
>   
>   	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..b9740224e07f 100644
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
>   			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index d502205bb72a..844d8c6face6 100644
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
>   		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 48cacd23b071..896dfb011baf 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -566,6 +566,50 @@ static void vsec_disable_late_bind_work(void *arg)
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
can you add a comment here that guid doesn't change after first read.
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
> +	xe->pmt.punit_guid_cache = *guid;
you can set cache only when guid is valid

if(*guid)

    xe->pmt.punit_guid_cache = *guid;

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
