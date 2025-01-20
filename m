Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336514D711;
	Mon, 20 Jan 2025 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737406041; cv=fail; b=MYjpUhwTjYGcX6Esy2IIvJXlwaG9mQ5Kmhm6Tltp7q3K29rRtlWdQoLaW+0C98lAQUsUOLzl5Q+uBS+Wokuur8SCG+yZy4GVmXrI06P6/kJfOAN6+gQQkVYfNpqEUlRApkvKtl4CXBowB/JKr8JI3Cfk7VazHSf8zesVBjRGzSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737406041; c=relaxed/simple;
	bh=dips8mTka6IgYysXk+qo0T8OrHQ+Nuj/wxgrVZOnsvs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dF4onWx8BZQEeDfAZmaxSESsmtsmSFXT5kfRN2dWW7G8HpVBH7+zZDjnN6v2R1yzCYL/v/edlH/u0/D5fjBQ6C5z8Y1sflVcDUNzLCO/+jgJZqYUOrSb0O8vLMtTPRJFrBFDi38Xr46HheI+++Q/YryJHng+ChoQLesStDQ1sPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzjeDLE0; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzjeDLE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737406040; x=1768942040;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dips8mTka6IgYysXk+qo0T8OrHQ+Nuj/wxgrVZOnsvs=;
  b=gzjeDLE07+s0edy43FBw7SD931kfS3hTOfYymHSr0MChzGpdWuaovNqY
   yYz4ejet8hgG5iiVvcIW9CThP3wdAgcp6QuNQ6+13aPyeXdeue8YQC3sM
   fpXXqF+R4Nhw7wMxYlhGg/LQfiHLiuxneB7+UpsbIJoDz9dLHWnBCtMjj
   6rX3n8vKkpuD/oJpMBMmWfYIa4lCbEl3M7v0O+2aBxiUHKvM98caJNqlW
   VKew6lUGVXkWkSqTURkuv/4X7OJnXWtlDXK9Y4ToGz+HgFKe1QfdLXBj3
   jPOD4MBb5QT7J7fiKiA1KhPC3fQOZmXo98Kspq5Hk2OZKlop0ak8LDX5m
   A==;
X-CSE-ConnectionGUID: bFYHQ0RDQ8yxyGmcWBd3Fw==
X-CSE-MsgGUID: KMar7k9qQLOCVbm78slKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48803727"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48803727"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 12:47:20 -0800
X-CSE-ConnectionGUID: 3XR6WFEbQTCsiaZjCA3nGw==
X-CSE-MsgGUID: brUPtVECSwetpU+Xt2J21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111600754"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2025 12:47:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 12:47:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 12:47:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 12:47:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnWSR3bTeDwQ7BBgArnDWyioALTiDETM5Bj4MEIoc4X/zRPfclH+cDWr+WI1M3H33ms5F1f8yeC3TTPjoWkgR4z+RB+k2HwjGpCNXhDQDXt0f9+UK8FllNI/8H27Z8HlltD9hBSUrhi6P5vYJAWFT5C545n8+JxL5cjydyJwlUoMplsnbXPrgYD7jiwCkTK60Mh/8FI8DpPHK8aMyD9AkTjL4micReSkzOdWLov/A9J1KgJT0ffHaWZ0M96UjxxebBgOEp8DsM/xVNz5QGJP3KFSRJLTk+YhltsH+8NiCeo8Nh8tWCN1HADPEtI+S8/BAeR6TwsXGZ/x9vxUNsenVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjAUaCUsbuZp2+ti9RmWuqmNGsxqMo9tyh1bE2/fGlI=;
 b=Ccs78XZIb+JTTIT38XxQq1fdtdEHf6/fQzTvM/v3G+FbtamBnrM/qF5xbB++Ddb0/ry74nbHI8LjWJ5t0KPKmtW629403QbKUvJXWwNI6Yo/jI+3UES1cvvpM0PuHlcEQBs2NNe1MnbMZavRbYNilVb71g9xySFi6it+02F7yTPBptV3fiKTCt0JsJ1NYzZVVhp9oNNL26+m+cHQIAkh8zOLFfwJADfLHWA/zKuicji7LCC9k3osJ5/w6dnI/nZJHNNrJ1aFTvq4ez7HsrZutg3WTjHeOFOvXG9qWzZJKZoIu3rRHMZty+xBpSXtILUN4qYA4q1QNfZmmz7UHc3jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 20:47:16 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 20:47:15 +0000
Message-ID: <58bc54d3-0abf-4d51-a592-465507f91bf8@intel.com>
Date: Mon, 20 Jan 2025 12:47:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
To: Anisse Astier <anisse@astier.eu>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Ashok Raj <ashok.raj.linux@gmail.com>, Tony Luck <tony.luck@intel.com>, "Hans
 de Goede" <hdegoede@redhat.com>, Ilpo J??rvinen
	<ilpo.jarvinen@linux.intel.com>, "Joseph, Jithu" <jithu.joseph@intel.com>
References: <20250102194358.33029-1-anisse@astier.eu>
 <eeb29cef-fb07-4bf9-9728-346a697ceff1@intel.com> <Z46vUgFJv6o-tNLq@kanto>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <Z46vUgFJv6o-tNLq@kanto>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::29) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 52508df4-d68d-4c00-192c-08dd39939f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUJHZHZNdU9xUnBTYzNZaENwYUgvVWhsWHZwYjBweDJWYURDWUlCTTYvQ05Q?=
 =?utf-8?B?bFk0L3ZkMWRWSENLWFVmSS8zTGFyaFBkdFhaVHl4WFVSSWxDUHFNNk11TjR3?=
 =?utf-8?B?U24rZ2s4enBpTEluRWorVzBBcXFSV2dzYXJyc3BkNHNCYW1nRmZ0WURPQUxV?=
 =?utf-8?B?NStITStlQkx2NjlTZ3R4aWFSdGFpSkYxZ1ViQUFkMU93a3dLeDNNQmZjVXps?=
 =?utf-8?B?blNsaXJGSGFwandzYWlsVTBWbkRBYXVMY21Lb3dDMFZnTk0rRzMrKzVVNW1t?=
 =?utf-8?B?QnBzS0pEYUpmRTJlWTlIK0Y1R0ZYb3Npbm81TW12eWZ4OVkyZUtnWXNjSWtQ?=
 =?utf-8?B?NlF3SHhnbFF0a2dyT1FUYTJqZ2pzQ2srNXdvVTdoWGJZS2U4bnk3RWJIMEtq?=
 =?utf-8?B?NjRVeDFueUFDQ0F1SEJTaFZKLzQ2dEtoK09XK01Yald6ZmxXYjF5ZU9NNnZs?=
 =?utf-8?B?cUR5bHhRS2tJVndzUDQ4RGxwODFNMXNxUHZGbXdPK3pMeSttb3RQbjFaSEFP?=
 =?utf-8?B?TmJtcGh4V0xhZFBubDRkMHZ5U3RIaVVnNDZ0RnFDbzFWb1hIa0Jwc3REY1JO?=
 =?utf-8?B?NUhzeEcxNERSZkVWbzBYaXBmZ1lZWllKZVUxc2hJU0QrbldkNXYxT3RDa0g3?=
 =?utf-8?B?UE1kTFNpa0hmZ2cxYzRlMnVyZlQ3U1RBaGdvUU5xMnd0VThoYnI2eFRYbVhu?=
 =?utf-8?B?bGRLd29BWFlVWDY4cHlacGtWTkIzQUhxbnpPWjBaKzNwT04xcUpCM2I4UDN4?=
 =?utf-8?B?enE2YTlPTjZtcTV0SS96NFZFNVR3YzJEbFpjRENjSGVsbzBRK2tkVHgxK2h1?=
 =?utf-8?B?VFRsRE56RTJIbjg4SDlKMW9ZclFuNmp5d29FZW1lMVpSelNRU0s0YnpWMERo?=
 =?utf-8?B?azBKend4d2d4TFdDR1FmU2NCZkliZVFsWXZYQmZZV2ZJZGNzSm5jRHBUZjlP?=
 =?utf-8?B?WUxUdzBWb2QwMkR3NnY1WFI1QVB0UFNDanlDeDhDNzhzcWUxcGZlcVIvdFV1?=
 =?utf-8?B?a1dsUExYeHc4RGMxb3pmNlN2TytYeXlidGdBd2hEcGxVY081OWdoVFl1V0ds?=
 =?utf-8?B?UkIwaERzck5SckRaUDFJS09TZStpcjJoUmpKK0xuT1orZXNISWovckE5SDhU?=
 =?utf-8?B?Smx3S2cvWCtJMk5zVng4NXBmWUU0cWJsZzRRTS93T2VWOEhpdWpUcE9UVGRJ?=
 =?utf-8?B?UFZyTUZKQ2d2ZXBTRFh2MXYzc0VYY1BPTHpQQVJZQ25aakgzdGFZRWc0dHNE?=
 =?utf-8?B?Y1hTVHZKcGUzUS9NeFZjUktQdkpTOTl5blVaUlNha3IxUDhlaGZyU3UwdEtk?=
 =?utf-8?B?ZUZoNDRqejNBam01YnJMaTZQQWhLOEpFeitNOFEzWFhlOS9Qb2lhVWdiSEVR?=
 =?utf-8?B?NVdScEdQbzAwdGl3cTJKWnNaeENramViUVlJaDBwT3cxeG9RNmxuU3RLRU1C?=
 =?utf-8?B?QVJWeW9TbVVBS1NhWmlTWVRZS1AyUWdiTlgzczVtWjh1UXYwOU9PNW5OK2Jh?=
 =?utf-8?B?TU1USm1sODNXa29zeEpwNG1qL3pob3dTYk5JOURjei9vbjJMMExGOUZlbVB4?=
 =?utf-8?B?Vmh3anZId1hEcTRmcGprSFcxTytpa2FMQVVMRnRFMkU3NVlraFZmZkJ0Wkhv?=
 =?utf-8?B?K1k3ZGRNcmt1bEVBNXZzNTNiM2lXcmk2aEsybTVVQ2NSZHE5cjJhU0NiVDJZ?=
 =?utf-8?B?YkQ4dU5KQXlPRHFZZC9RMjNMQ0hhUm1qVDhPSHQrRmdRQW53WlRBTlAxNDVj?=
 =?utf-8?B?M0RVOTh1SzZ3MG00UEpKM1R2Z0cwOWZvWm9hRHF2ZFoxUFl6MjFhUllHWjJ4?=
 =?utf-8?B?YUU5b1VoMSt5clpmcGI2ci9DbmtkQ3p1THRKSUxxY0k3Qzg2Q3B1SzA0aitP?=
 =?utf-8?Q?w6sj2puMV57Ix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VERwdWcyci9Razg0Z3JsWUhvNXV5OVNobk9NeHVUSWNDU05EZTdXeHkySkVk?=
 =?utf-8?B?OWpFZjYzYXNYRnM3ZnczYWo4SFlybjBQSnhJRDZPT09US1I0YVBEMld5TExK?=
 =?utf-8?B?VngrWVFBTlI0WUhCNmFLQUw3VjhsYytzSU9pRkk5bHBCN2dhaGdpbjR0eWdp?=
 =?utf-8?B?WXVyemV6V3RzZXZTNmRUNTAvb2VnaHVXaVBpR2V0blVjQy9ZOWdMdXQ5Y2ly?=
 =?utf-8?B?TVBiWG96bkppTWV2ZWNnU1RvWDBPTmpydmpVdGJobGJCWGJJbGE2eVZlNWwy?=
 =?utf-8?B?N2FhQjhoWEVBay9SRmhEQVkzM3ZrN3NNOVgyblZHZENSamhDWUNEVCs0SFB2?=
 =?utf-8?B?ODFuWER6N2xnWnVUYytrZFNlTWVORUNGc3lCSHY1OWd2VUhXZmpkK2VieEFT?=
 =?utf-8?B?aHh6cFNhSDQwcytPQmhSZGdONnJqTWRWa3VqU1dBVTdmZG1zSlBzWGViTEh3?=
 =?utf-8?B?dGhadzJ2dnJ3aEpNZjVXclNNRG1ISnJuSHdZa0dUZzZvMWs3Nm5ZZFNuTGx5?=
 =?utf-8?B?cUVtL1ltZThlZEVQSERsWG1DbWo2b2FEZ0dwbFFDY0poWlptQzdpVWtTcXYw?=
 =?utf-8?B?NFUwUFdDQlI0bmZqRUN2QTV1OVBvNEV1SDlvRDJmRG52eVhpdDlwdDNOaGJH?=
 =?utf-8?B?TGVaV2hGSU1aU0Y0c0NzTkY2VUZ2RWNDZjE0RFhHVHQ1RHFScUlldElBMWt4?=
 =?utf-8?B?QUcwTnBDQ0ZNcStBOWpMbWw5amljTTBEUFdPRFp1SnI2ejRwOURpN2M2TlZY?=
 =?utf-8?B?TmsxZE13MEpsWVlNZk1XS2x0RnNPV00wQ0pTWFJXS1k4TFQ4Y3c2OHJMQVJp?=
 =?utf-8?B?VzZvUjBkU1ZwakVaWXF1ZlJybXQxcmpjclN6cnh4a3Juc1JUWURVOE5oa3M2?=
 =?utf-8?B?ZUthVHZBN3V2Q2YxdDVERGUwZjNxa0t4bW1BTFhBOGQ5bjA3MFV4akFQWGIv?=
 =?utf-8?B?c2ZGWTQ2RDYxdjZrNGRZcDl0MmVYTVFqQjE5WFExei9LRUQxSHZra1NEelNy?=
 =?utf-8?B?cGt1T0RjOERtSzhLNTRIUENtaDJ2NU1CK0hML1d4NHJqSTJ2WENpemdXOUZP?=
 =?utf-8?B?dnRSWk5OclhtcWN2Uk1TMWxwM2VMeXZ5MHhBRXV1aU9vakNYWmhTVmFFck81?=
 =?utf-8?B?TFZGQmlXdXFlKzNhQTZMcUNLaVoyVHROWTZWUWZyL1dKRzk4OC8xdkNaaG1i?=
 =?utf-8?B?OCttcmtYTnowV3JIQndvVkh3QTh3S29sT1VTUVlnR3p6dE5KMWs1QXRySTRy?=
 =?utf-8?B?WklOWStQSXFVKzQ2cFNrb3l2MVBPcnd4enhtWktQdzZ2K3NpV0drRlhiU0Zn?=
 =?utf-8?B?bExLS1ViVDdlcGlvL2k0VjFhWjhzUS81SlNjVkpTNHIwQ2VWZWZYYVlrTXJU?=
 =?utf-8?B?MTM1aWVUWXhLUGJMV1ZYQ3VaR1Ayd1ZsRllSOXdtVHFMaU1HWlRCZkZKakhF?=
 =?utf-8?B?c3JnV2FIKzVRdWVxTjJSZm9tNDIzaUcxYWJuTmptcWlGQU9lbDVKRkNnYnZB?=
 =?utf-8?B?aXNkZkczeHJNaUFlbkJlaGtraFJUTU5OdTdWa25LUlcvcFlVRFBGWmtDdUpF?=
 =?utf-8?B?bkNGY295ZmdVcVd0NWJvT0ZFbjJSRlQ4ckt5cC90ZkczT3hQVThvVk5XTy82?=
 =?utf-8?B?Q1VVZFBOOXNwYitWV2V1blJkNlZCK0tPN0h3NGNUM1RKNGdxR1ZDV05JaTkv?=
 =?utf-8?B?VG9XMUpSd0FrcEZ0VjEzZUcwSGpTRWhiSWRqNTViUktsbEVTWnp3MEtJZTY3?=
 =?utf-8?B?d0dzblRQYnl1dHhNSXFqK3d2LzB0NDRDRkpBVnRGdk5FdVVuWmdaUmhoVm84?=
 =?utf-8?B?RExSY2hRM3dFc2U4bmt4TEw0aEgvVlUxbFJTZm9xVmNlbEovZFc1blBwbkR1?=
 =?utf-8?B?RmViVEJDNmExOVVjKzN3T3drUk1YWWY1TDZNNjREUkU1VEtaMXVFRGJkVDN0?=
 =?utf-8?B?REVRcWtObW5SQTN1aDhFZHh6UUEyL1pSU29PRWZxdVYzMGJyYmJGejFaSHdj?=
 =?utf-8?B?dzhVTXZiU3RsbzFCanlqbXR5eEhVREdXQjlmMzJDRmhDbGgwamZyblF5SXNT?=
 =?utf-8?B?ZUxPWkhtOFZNWmJiZEZMMTBXV2xNbnl1SmtOdVlBSlpTVEpvemlyTjdXZnBi?=
 =?utf-8?B?Qlg4MGMrUWZQaXVMSW0rMCtFakNpZUZ3aEMrUFBVTC9SelR6QVMxSUl3b2g1?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52508df4-d68d-4c00-192c-08dd39939f9e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 20:47:15.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Mt3h+Gx4UFCBek+ZaSlK0v1zGGqMWT8OW32sF4o/MvJz4fmiTfB+qvSChlhC+Q8ng0SnXOVR3iqajyXIXVKxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
X-OriginatorOrg: intel.com



On 1/20/2025 12:20 PM, Anisse Astier wrote:
> Hi Jithu,
> 
> On Thu, Jan 02, 2025 at 01:40:23PM -0800, Joseph, Jithu wrote:
>>
>>
>> On 1/2/2025 11:43 AM, Anisse Astier wrote:
>>> I realize Intel had a few troubled years, and that having this feature
>>> in the kernel must be quite helpful to some users. But right now, it
>>> cannot be used unless one has a commercial relationship with Intel.
>>>
>>> I am not advocating for the removal of this driver; this is just an
>>> update of the documentation to show that the publication of the firmware
>>> images necessary to use the driver might have fallen through the cracks,
>>> and might not happen soon.
>>
>> Thanks for bringing this up ... apologies for the delay in making the images publicly available.
>> We have reached out to internal teams to speed this up.
>>
>> I will update the the documentation (or respond here) when I have more info
>>
>> In the meantime, I am okay with updating the documentation  to reflect the current state of image availability
>>
>>
>> Thanks
>> Jithu
> 
> Did you get any update?

Things have started moving internally towards this. I do anticipate at-least a few more weeks before having
a sharable link.

> 
> Do you think this doc patch could be queued for 6.14 or 6.15 ?

I don't have any objection in merging this doc patch with minor changes to commit message to indicate that only the 
scan test portion of the IFS test suite is affected by the lack of public image availability  ... 

I will comment on that in a separate reply



Thanks
Jithu
