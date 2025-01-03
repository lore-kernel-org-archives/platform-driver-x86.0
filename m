Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08F1FAC30
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jan 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915149; cv=fail; b=HRw6MwQoMe4F75+5eHYbR7m7w8r1MXqmL6kWn3xDitA2uCM3z0u0cbNMZ2xh4+loR3M4eG9qkzqSc6P2LeliI1wuN0OxcGXDdPkZKkWVnAfhxdi8aTA5ldDHzm/8zg+rtztNMELp5ydlIx/gsXvhysvdY2PXOIJvHitjHsnJS3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915149; c=relaxed/simple;
	bh=tv4O7+UBDEufFv3sdKXiwiWKMftye4rttF4+IJnANic=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uhvgav/W4OCY1UjRiHZldKMSguSomqL3zJMBL0toJ/DH9VKHUMjMFRhLrj4CTnScEBQGsLc6spzfRzdFY4STnDmz0SIAodr4D+wGRCjSHnVyqBj8FyiDhc3CgrdYZOopUk963/5X0QFUOdGiFWjmDu8xJbO4iYj3OC4LWcEWUOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKsAjyMP; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKsAjyMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735915148; x=1767451148;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=tv4O7+UBDEufFv3sdKXiwiWKMftye4rttF4+IJnANic=;
  b=hKsAjyMPHw0F7WChZZ6PJ6/CUu4qckZEVjZpxnNFeFiQm0ZJHfTaYKhz
   GzOtRArMl5b7ZctIRLRBtvqiN4cOFn0uLJPVXoHs7vkrjhGg9Oqi74JWs
   8EK24W+3EvbVPqLwp1cq9iTK4evNQ5e9wNDCMqMePfy9kybl5uqcxL1ZF
   TRJVUXPLcsoydZ0urhQv45Z+dR4LsFxxkLbPT8Q88UTdC3DsfyDilcPJu
   z7pCpMF9tf+nq1i677HtQZKLBQMGZQS0R8vKgT4O1HR7yNPeGQpBAexjR
   F9kf1ll2XSVKF5/dTqBrLG7bFbRh6znZpWJXWYgEPSJROm+8r2UDrSwdA
   g==;
X-CSE-ConnectionGUID: 9AQDunBTS6ys08liNrufhA==
X-CSE-MsgGUID: VfLou7MbQSmWOpy56Nbsjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46662062"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46662062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:39:08 -0800
X-CSE-ConnectionGUID: wILcQbZGRW67b/1jpEP8Yw==
X-CSE-MsgGUID: jJy8bq6PT4+y+3pr8XlEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101643348"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2025 06:39:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 06:39:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 06:39:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 06:39:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QerdAb75F0mlbxLfFtFUP+UZffDxbGCJc+M6dRPY4Xve41X5E6zmq7D1fcl6ga3JrQwAr2eP6qw3iIuiXbSJLPN1VEbCJD+bvSF6g9eaD8jN52QlSIvIc+XLXCnsgtIWECI8k7AAuiw9pJ21T3qL1kNL3VkMiNTvAKj+wNONHruVmNGpK32mqgkX797KVp/Uuu40EmLwVKtLQEWHTp3u9SZLO6CPyMdeq7n2YGBf4HYeJgXoeOXI5oJTU1pN+0lHABefr7loF/tsWO/udAwwTGt4cmVIdJ6pyJaKNWw1Oj77ljKARZy9jndDU+ciBB5z5cev0LL22I+Ei7e5af8UeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv4O7+UBDEufFv3sdKXiwiWKMftye4rttF4+IJnANic=;
 b=Ku9j45/1/NW/YT5jaLerT09hipGr4HvrOmeEGGI3Cw26+EwCfDfK+TwHSpujHNUlDt2zGtQw402xs01mVaVnxoS1QcR4ha7Ov06/3uMxJAwakcEy8O0hKbFr5Vi5ZW15jghEGAqeG0DxkDEZpZhYejo+pA+Txn8kRz098ErTDtzwu7RZaf1jM6pWmHIHZkuur4DxNGwHBt1j6FU+JDJ1ohJAVbJ29F3GDOWEReiMP/yCpVUdD1y1dZasjBBS2XJrI1P0LCKYR8/a/N25+LeKpjwiHQVRi8+HNalF3ijBS0v5qifla9PvPTPfKqBSVqDNN2DqUPL60MyKyaX3zsCs/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.14; Fri, 3 Jan 2025 14:39:00 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 14:39:00 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.14-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.14-rc1
Thread-Index: AQHbXe06yhLYlVUUm0muMmvgprwLMg==
Date: Fri, 3 Jan 2025 14:39:00 +0000
Message-ID: <da3e36cd68264cb0c3362206a587c94492948472.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|CY8PR11MB7133:EE_
x-ms-office365-filtering-correlation-id: 4013112f-33f9-41db-588a-08dd2c045cbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Qmo0TSs4K0lJZllFbURyZDVwdXU3OTdXNm03YUxoL0pUcnBPQzZydXBvOFFX?=
 =?utf-8?B?VjNsVDkvQ3FjZ3FqRit5QjVGbGs1RUlXbTZCRjRwck9FekFPSEc5M1AzcFdR?=
 =?utf-8?B?d3NtR0tDSWFyNjRTcEQ5bFNSb2I0UDBzOFZCZmdKdzhWK3JVU2Flek9YWitL?=
 =?utf-8?B?dGIzNEJOUHFvU1VrZkswZVZaZGFBd28rMVRJTy9pNnB2clo0QTNkYm5YTjE2?=
 =?utf-8?B?dEUrNTdaZE1mZFpsUlU2SUpCVlMwK2xhR2pkdHV1MGxKTWU3RnUwS2tRV2hJ?=
 =?utf-8?B?RkpkUFZoQ2ttNTloaktHWEwyWit5Z0tKRHA3VEJ1ZjlUdkFWQ0pSWmRJWnhS?=
 =?utf-8?B?RVJZaXZwbmViNVA5Z0xQR0tDSUhoNk56SzBYbzNSK1lLZGZ5ZHZYbGswSG9B?=
 =?utf-8?B?TFh3eGwvWTczTEJNd0ZXZjhhUGtpRGVxNWpwWFVFNjFSbFUycWdyRVhvZDIz?=
 =?utf-8?B?TEs2N3ZMdlp4Q2VycHQvYlJGRjJneHNtMnNYUTA0UVBDc2hVM1RtbVhMNWRj?=
 =?utf-8?B?ZlF4V1hCaXI1cnpXajVHeWR5MEQySmhpNTVDaW9RNzNWRCthbzBUTTFwdTBz?=
 =?utf-8?B?dHZzV1dXZFRmOXRtQkRYQmtrN2pJWmpadTZycWJrM1orTFVtTmVuY2pCN2pF?=
 =?utf-8?B?WUFQdFRsczBnY1cyMjRQSlZTRU1sTXpyV002bFdiY210M1NyZmZuR0p4bWhK?=
 =?utf-8?B?cVU3ckt6TDAxL3BXMVVNTlZuVFV4WFBmTWVJNTlTYmZXMjBGNm9ZSFN0cy91?=
 =?utf-8?B?Slk0OHpudjlreGRvR2x2YXJNcHBpUmNkTGRPNUxiUnJqUnhaWUNQN1lXc1lF?=
 =?utf-8?B?cEhubjgzVk9JdC9RTHpqYjVLVjd3R1YyWUZrbmx1R0lDL2FpN1dibDhHYy8y?=
 =?utf-8?B?VUlHV0RqWmV3blNTekNlSFJpK3JrYVNuUFh1NDk2NU1UdHFGbU45bEF3a1k1?=
 =?utf-8?B?WUJxTXRvbHR4OUVGTWVucHNVbE1SdWhuVG1pYUhmVUhOeFBnbmtaZXZkSzFC?=
 =?utf-8?B?dm9zWGN3TzRTT0pBN2w3STRxTWptS2NiRlNoOFVscDZubHk5SnlVeG53b3Nv?=
 =?utf-8?B?bDJ4N1B2Zyt3UDN5elpnRUxvRHRDWnAwMzg0YytPU1NtejJQRmdvRTFucXRE?=
 =?utf-8?B?bHhnU012anEzR2lpRXBZdGRkeVlHVG9QNm1DZGNvZmZPOERVVk5HbUpENExx?=
 =?utf-8?B?eUFsYjBWeG5vbHVTZHhXVzV0K0ZOY3BwNmNsSERvOCtkNHFVOVNpbjU5SFZM?=
 =?utf-8?B?SUpLTit5dVlGeG12SG1sUUczRWx1N1grQ1piSFlnWUN4VFUvOVBheVhmbTVF?=
 =?utf-8?B?b0FWYjhLbENxYWU4b205a3EyeVNSWHR2MzJNU1FPSUkrNTlkV3Bnekd1bVo5?=
 =?utf-8?B?WDU5L0p2ZUNkM0ptVlJxeGFOQkNqRXZPSUVrUXNmbDZUZlNJL1MvRGM0dFI4?=
 =?utf-8?B?bFh1Nnl0RUY2WGczQjZDV2ZFVUNsQmVHYm9STG5Fc2ZUV285VHpiY1BTcXdx?=
 =?utf-8?B?ZUFMb29mdC9scHFEdGVnQ0dFUmVlWFgyMkViNzVmZGxOSjJTd1FuYTVLV21C?=
 =?utf-8?B?d1NZeEc2OG5ieFdNMG8rU1BPeHRZRGtLTUtDYXJlVUx0ZW9VcGdLVFk3eU9Y?=
 =?utf-8?B?TXRNc0dZVDJoUUg2UVRkU0cwbDlzT3l3ZjNXc1R1bVlxYlNzc1Jxam5TVU82?=
 =?utf-8?B?eDFOUEhhYkExbEhZZGtGcnRlMEtENkxGck9XU1kxRXo0V3ZMeUtyUUtjUCt0?=
 =?utf-8?B?ZmtMVFNwT3Flcmt2Vm5rSHlpakNFbG5HUjRaeFlCZzRJaFNUemhpRkpDREJs?=
 =?utf-8?B?NktpdWxRMFlZQmRpTmkwRlE4YXF2Q2dLTTJJS0FvRTVSdTBlekROaTU5NUZs?=
 =?utf-8?B?VS9GSTkvR2VYOWU0K2EyLzJzY1dORUlPNjM0UEJGcGFLcTJKZGE3VTNTeklu?=
 =?utf-8?B?T1pKR0UzUjdidWQyakhKVXM2dyt4VmZsZUcrVnh4VWVNWEhSR29kTHkrdGlt?=
 =?utf-8?B?WkhRVjlDUjhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tys4WEJQNmh2WWYrYktNempZQmlWckptY0hXZUI5NUU1b1pMU0J4aUZZbStC?=
 =?utf-8?B?TEo5YUM2Y3BWMFQ2SkswV2lmQnlQZStwMWJmVjh1aEQ3TWlqYlJnQzlPaG1H?=
 =?utf-8?B?UHhQL3NLakJ5YSsxbXBZNDhQSE91TEVkU0tvZEdLOEZVYVFmbGJkOVRPSDBi?=
 =?utf-8?B?cGUwTXNqbGl6YlVJelluWDZNUzcwVytDdFFUT3NNQWZmTTVtQ1I1ckprV3JN?=
 =?utf-8?B?Z0M1QU9KbkxXZ09zVDhRZ0x0NEc3MHFUaUtaU20wb2RmcGZTd2VVdFZNY0Ny?=
 =?utf-8?B?YXl4M1FGVmQ1a0k4VWZRblkvU3VXcjlvaUlvT2I5b3FHOXRJN0x3VWhkc2hS?=
 =?utf-8?B?S2daSVpqSEd5VXJOVnBSeUZGWkdDSlRvR1o5eXo4NndyLzZQVmpvZHIrK2hp?=
 =?utf-8?B?VDhNaVNTQzdKNElXbW5DQ1hPdG44Uzg1dytaQ09rWDl5czNaYllsZ3lRakVm?=
 =?utf-8?B?cWs2OENoRUpNMkVuV3dGZkx0aUdabU8yNWUySmlQRVF5WjZRMXJBamhreEk1?=
 =?utf-8?B?ZjdnMmY1RERMQkNVTzBFbXNFUlFHK0t2UkpUbVcrbFNDWG5EbmRuVG51Nmh4?=
 =?utf-8?B?aW9UMmFFT0lUWkhaV280cVBacy9UcW5ORWRxcUFMYWlWcjVObVhBMHcxQU04?=
 =?utf-8?B?Z1k5em9YUWJ6UWEwL0VMaWhTZlVZVnYxV1Z1Zk96aXMvVmsvY3AweTZpRWI1?=
 =?utf-8?B?d3dyQWpkdDg2dXlyaWZUYXlsWXdzUjY5bTgrblFKNnZPUUI5S0ZPN3pXZ0JQ?=
 =?utf-8?B?NkhacnFuOGhxdThSR3pDMjFwNlNIMUNRaDBKWHpuc1J2Y3RrTjBrU3hkRXVl?=
 =?utf-8?B?M1phckIyREc0T2svZFZ0alVZbE11MUNRZm82RS9Zd1NGZ3I0SG9NejBBcFRB?=
 =?utf-8?B?MHp5dENNNXFwTWVZYW5TckxiMUQyY0NGMXBtQnBuWlFXcllaMGlKZ29POVBY?=
 =?utf-8?B?R3laN0xSZFpRL1ZYVkRVOVcyY2tsUTB1emNNaXN5bkNDamFjWUxlMkVOcFM5?=
 =?utf-8?B?ZDh0czhLdmh6ckhoZUkxSkd1ck5RSm0rV0JmMUpvS1NMemg3dmZBOXlMNHpo?=
 =?utf-8?B?Wm1HdHlPd3l2d0hGRUVzZnk2dG1waVA3K0I1NDkzeURmMlVYUFpyM0JrRTJj?=
 =?utf-8?B?WDBURlFyd1liVVNYMWRRUVk2emR4Q2l3MmpnclVxQVBQR3RsUXRPY0lWTnZy?=
 =?utf-8?B?MDJQY3ZJSUtUUWpQMnBEZ0c2cTBkSHJrZmVNdHVTZUh0ZTFaWmQ3cldTSTUr?=
 =?utf-8?B?ZWw4dFVVRXBCNWg5a09jZ3FSYzBVODZpVzJoWllmbURocERWU3doeGRvcUxM?=
 =?utf-8?B?NGhQejc3QmRIempLZnM5OWgySXhjUi92UjN6ek5HWm8zQk5GQXN5NDJmQms0?=
 =?utf-8?B?WDdIMDFRWTQ3SS92ZGtCTC9Ta1pyLzArWFBIeEZNMzdDMEFPKzlER0V5NFd0?=
 =?utf-8?B?VWZ5ZkhYT2xBSGtuUERXbFZ0anAvL3F2b29IM1gvdEtqYXViZGpkQUZBKzRr?=
 =?utf-8?B?SEVDR0hTU3N0dW91TVJBaFFPZ05hdjRaQlVIaHBSR3MvQXQ0OW5GSmRZRHph?=
 =?utf-8?B?KytiVzhOdWI2QXdnUlFxOU1SQzI1aDBPVFhZVDcxZzhnZWZMZjdOM0pTeVBE?=
 =?utf-8?B?bmg2NGM0WHM4bU1BaHc2OTJKaW42WkFId2NiR1NlMW1tbDZmQXJ3aU9NR1o0?=
 =?utf-8?B?bkxhK3lnVmg2aVgxc2pIaGZDZUxLM1FNN3Z3UXpwU2d4L242ZWhUSHloZU14?=
 =?utf-8?B?ZXVzY2hNZWxZaWNEck9zNzBrMnhtMW00UldUdW9lMU5zMGRhSllvZ0s4a2FM?=
 =?utf-8?B?WkIzcHpodXRaMk9HOE5SN0FHcmFFQmNKMzdWOEFxc3BtbmFMMlhpck1vS0VX?=
 =?utf-8?B?Z3gyYnVlbktDMkdpUUgvc0JHRk9sK3FQNnEyT0lQOERuT0pIa2VPMURMWEVa?=
 =?utf-8?B?WFo1VTdkM0Y2aGhjR2pHVXc5LytkeFp1NXhpQjczakpvWWxkUk5lbDM2c0hz?=
 =?utf-8?B?WUJTK090OFdHQlJQY2xYV3ZycEdSdHRWNHBxNks0VVJEekhjYk5KYjd2Qm5E?=
 =?utf-8?B?WWRIWFZDRTJFbWYycUI1Y0xnamNJOEE0ZE4wei9jWFJqQnU1WGN3VTZ5R2VT?=
 =?utf-8?B?cENPN0k4MllpMWtQdnc5ZGo5V1dIV3ZPUG1NempBaFdlLzU0K2hmTlhUWHg3?=
 =?utf-8?Q?KKq9JgV8Ouw30wHfw1M9HYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C312569F58352A4CA7B2F47620C5BEC2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4013112f-33f9-41db-588a-08dd2c045cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 14:39:00.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2E1JG0682vgJTmO1REuRN5edj59TOhoPkaNqsMyU4pdF+kWskNxQhiQlwJPjI5NDQrFnuYmqUisIcZxvFM06V41Q3IxNlt62jnyphgjsqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
X-OriginatorOrg: intel.com

SGkgSGFucy9JbHBvLA0KDQpQdWxsIHJlcXVlc3QgZm9yIEludGVsIFNwZWVkIFNlbGVjdCB2ZXJz
aW9uIHYxLjIxDQpTdW1tYXJ5IG9mIGNoYW5nZToNCi0gRml4IHJlc3RvcmluZyBUUkwgYWZ0ZXIg
U1NULVRGIGRpc2FibGUgdG8gY3VycmVudCBjb25maWcgbGV2ZWwNCmluc3RlYWQgZm9yIGxldmVs
IDANCg0KVGhlIGJhc2UgYnJhbmNoIGZvciB0aGVzZSBjaGFuZ2VzDQpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1kcml2ZXJzLXg4
Ni5naXQNCmJyYW5jaDogZm9yLW5leHQNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdA0KYzQxNmEzZmVkNzhiOWIxZDkzNzU1ZDJjNWQ4MTA0NzY5NTU5YzRjYjoNCg0KICBNZXJn
ZSBicmFuY2ggJ3BsYXRmb3JtLWRyaXZlcnMteDg2LXBsYXRmb3JtLXByb2ZpbGUnIGludG8gZm9y
LW5leHQNCigyMDI0LTEyLTMwIDIwOjIxOjA5ICswMjAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEv
bGludXgta2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvDQo2MDBjOGYyNDMxOWNlYmU2NzFhNzA3MjJkZjk5YjgwMDZkYWViZTIxOg0KDQogIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjIxIHJlbGVhc2UgKDIwMjUtMDEtMDMN
CjA2OjI5OjAzIC0wODAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICgyKToNCiAg
ICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEZpeCBUUkwgcmVzdG9yZSBh
ZnRlciBTU1QtVEYNCmRpc2FibGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IHYxLjIxIHJlbGVhc2UNCg0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3QvaXNzdC1jb25maWcuYyAgICB8IDIgKy0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0L2lzc3QtY29yZS10cG1pLmMgfCAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNClRoYW5rcywNClNyaW5pdmFzDQo=
