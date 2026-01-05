Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED330AD1D;
	Mon,  5 Jan 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623967; cv=fail; b=BZWtNkuyh9ZgkGb9mWy4ujoQ2Mk7lxF3G4o9Crjl9QG5fhQRqV52wLQl2CRyztuHcjZNBh+9Sz1s+71PEx8CpjodndcZaAe3JvtUoBHxmXfAaLIxB82j40zz3JmheQVNDkhRhQzB6cHaSCJvKEIXXSLYZdrcuDUcPZ8CebxG5pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623967; c=relaxed/simple;
	bh=4Q3cJfvWIq1CalFKf2BOFvqTI3iTewNnNjiBdyY2gss=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ispDGqgubcC233aSvTfkbrYu99Xf6S6jN42o9+bwXLmndPLVREz+5RN88aFbKH6gQn33KSHyvRqN+3hoHyMB52gjRGcft+uK1q71Q40M0pI4g66+i1eTCZC/lSiYvkI4Y2XhkEpuNJtQ+JyOg/SaBYSKv5eoO1OOrd7IOQ1/hCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSYiH1MD; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSYiH1MD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767623966; x=1799159966;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4Q3cJfvWIq1CalFKf2BOFvqTI3iTewNnNjiBdyY2gss=;
  b=JSYiH1MDQvUxkPr+VqYgk2gXR0L6vzZhjH+336v6o2wcPHIFjaxMHfIt
   ZiN3dx8Q5sMimRE4vjvncJY1JHRYk8L3mA155r2loYHcUxJPDThsuLFNH
   omJGLlNy5PXY4wVIUGT+miZ4d7RPwOugr+681qqY7P0yAqIMmfqcw7BHh
   Zil3e7Xm1ZooIfd+VHWkmB9n/6tOyHD//J3+jNOTtT9UjfY17MRQIziYr
   S6CUW2wZD06MX8NQ2uqdLMH/mAUO3Iq6drt/s2BFswfnDiMCyaM67NrYM
   M+S8Zjjd2mJ5Q/oyUutY1Nk5Jp7qqVfJyWfS/Wa8RKE5DBQGIZGvuVYFi
   Q==;
X-CSE-ConnectionGUID: zovTpETMTrug8aTis6CUsg==
X-CSE-MsgGUID: g0cukKp9SISVAvbGuBRqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68182481"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68182481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:39:25 -0800
X-CSE-ConnectionGUID: HL6CmMwzQImqzOF6YcMxMA==
X-CSE-MsgGUID: o/FpPBggSsel+wgLxqJnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239885328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:39:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 06:39:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 06:39:24 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 06:39:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLjXrgQwSCM9Dejz0nU1nwcPBvjDoOCbyoBRwAIrk4F0CFwbvcS1YLePn4UuI95mBmNL6IVkYr9fqhOYxDD9BazZySlpCfz9BDEQhRoYurQhwWuqO2CyX3ttCSdZpEFltRackd6LZVBt5rmBLxBOAp/IN20S9W7ZUo27MeqQuJKjsIHgm6SWVYRTEJ6Oiyky0rG8vCcnCq1ETsE1DlpL6FomXSsV1lmJ+SZbqbUaRAHs2N4bf159K/58t249NbdJEIgkigQ6Rpal8Up5B/rvXPUKs3NifXVU4vlesrOdSfSbDEIHbouF6U/3C3+n3HLsmw12dPQ7C0Xz3lIinDiWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktBmXate87UzCeJKDp2E55bqe7ghjg8YZwzqmdZNmnM=;
 b=qixr4SZ18/AzVfdmGWal+3Xifwku0P+AIkyAIsxMAi0xaOCm021MwXzsanayreFMTbj1yFtKVglJJpb7esS1qGgmPqGgrnxkv2tYPvWSQPVbdSN7WO3PIl5+lru4WVqWI78Ur203D9xbz6Ovj9DlgwSmsswk6MhWuEo4Pe8t4oOS9nKUvNjgjMfETey46AE12xV3HioMpueIiTvu1KN+77ZB+WnShpb79txzx4OgjO9Jus1BkBivymfFsBvrcvR9F5BYUPV6b1cxCmcxIyznnjbCe1WA2ltWtGrQ5IcMpty7oqVEG5pnlw3fDyAXhdPBaDijhKR16mat70B7KKC3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 14:39:22 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 14:39:20 +0000
Message-ID: <89729468-b92a-4a3f-a2b8-f774f0937f91@intel.com>
Date: Mon, 5 Jan 2026 22:39:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: Replace deprecated strcpy in
 surface_button_add
To: Thorsten Blum <thorsten.blum@linux.dev>
CC: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260105121802.1947-2-thorsten.blum@linux.dev>
 <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com>
 <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b040872-93c7-41a8-1629-08de4c683635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnZ1bTBWL0VObjBJSXB0dmhHd1ZNY3FXYU1vSTlFeWRHb3pjTEJqS0p5MTRm?=
 =?utf-8?B?ZXJNZ3MxRWxaUHZ1SHhxRTBVRnIvY2poMVBVQWZoZkV5REtSYnN2QnZVdjFw?=
 =?utf-8?B?aDRvS3JWR2I2WTBCclVIQ3RHSE9NZk5kZWh0OURqUS9ORTFUUlFWOXB4aHFM?=
 =?utf-8?B?UGpaaXBheGR6MjV1K2ZkRmgrUGlhbVFhZEE3NEgrL1B3aExkdlhuaVd1dCsv?=
 =?utf-8?B?aW45UW5nYXNmLzNrL1JvSmY0dkZiYlp2a0RQMjBWdHIyVjA1My95MUxjYm0r?=
 =?utf-8?B?dUsvaUZGblp1NTVacGttdXFIZnd4OS83RUtwMTc0WkxMNUNGbkhFbjJmSEVU?=
 =?utf-8?B?cjlPb2RWTG81ZmNDOFEvRFVOVSt0NzM2eFpoTlNSeE9kMDJmam1IQXU1K1Nr?=
 =?utf-8?B?cEpDTXkyLzdrTjdKTlFjTWR3Ykd3Nk1FN3BRa2k4b1JtZW5IelozaERZYXdI?=
 =?utf-8?B?TmxYbkxUQ1pHeHo4YkhZbVAzc1Z5S2RpdkZtdmJkQUZkQlNISDdvVlB0Qlpv?=
 =?utf-8?B?a2xHRGRXTWs0R2t2NDFsNXZrSFdUTG9yL1ozNDR6bDlleDFDVjlweVFaTVhY?=
 =?utf-8?B?Rk1DSTluYzc3WXZUMVdwcUxTeXorcks1c1BLZlRxZzRRTHA5Q25jRTBYOGJv?=
 =?utf-8?B?S3JTT1l3R3lQM0tQdTlJaXVNb0lDTlFkb3pmNStKM0dIenhxcjQrUlpUdWM5?=
 =?utf-8?B?MkRYakRDNVo2dnBiSGxCcXJQTkpxZm5mb1B2WlBqWm5lVkMwWEpaRThybVBu?=
 =?utf-8?B?YlNKMlhidklWWm1oa0hVcFl5amVxZ2dPeVdDNE5mMlB2b0JjTDNLOEl3RndN?=
 =?utf-8?B?S1A3akkvMisrNzNFOEppKzFZQWtZVVBPWXI4SjNjeWRFMS93bUk0OFpPbHhD?=
 =?utf-8?B?NTl0UkdqVExIU2NiWFFYb294b293N2JiWGszZDNPUkZyd2RjUThSbGJ4cDRa?=
 =?utf-8?B?L3kzbG9rTS8zL2dCNDFIaCtnNjFlaStVbkh5Uks2aUZhYk1OazVhT3piSC9w?=
 =?utf-8?B?RlA4OVM5NFE5Y29qY2FkcnpCTStSaitMN2VQeVdBaktwYXBGUUFxWm80QW9o?=
 =?utf-8?B?cVZacTM2elowRlY5WnRqZDhnSWlPSERCQUl2eGV1K3dqVFRjdkhqK3JubUdF?=
 =?utf-8?B?NWFKNlgxbUI5Z21yby9MSFd3SUpCR1lGbDNzQnhKRzk1MXNnNkdmenoreWda?=
 =?utf-8?B?a1JPU2ZaY0xpOTNZcEpxcXVEbkpGTnFzMFlMb3lLQjd1dVJnK2lRRDRCd1Ba?=
 =?utf-8?B?elRwS1VRZzJuQStnTTJZNFR4MFRBak41WDNVSHVYYjRVUldVN2htR2VSUXVw?=
 =?utf-8?B?TWlEc0krSUJUY0trbzFKSnpLbERHNDNWQXkwb2l1djBlb3pCOUoxeHVMOUhu?=
 =?utf-8?B?c3E3WmxQS3V1NERiNElQci9pSVI5cnd5eWJaYjFGdmZ5UGpoQjEyZ0R4Yzh3?=
 =?utf-8?B?c0Rpa2xWc3M2ZWk5YXdjYzlTUFVQLy9XM0w0NzAwWit0VnREWEFZUXBYRDhn?=
 =?utf-8?B?OGtxampYNW1KTUh5ZFJoMVhZL2pLcUhpVEJpM1Z6bElQbEpFNTl4UnE0b3pT?=
 =?utf-8?B?WDhNRG80VGZRK3ZQc2oxbWgxdUJQN3crSUUyeGloYk9QN3l3QkRHV3dMS0xz?=
 =?utf-8?B?anJ3eDU3TVNjUVFTdVZwRVJuSjJNQkFEbjF6YU5odXpNU3RWRjdNc1FyN0xN?=
 =?utf-8?B?bnJLVWxGUnRrT3lReWpwRUd1WmsraTZYKy9NYmFWMVl5RGUwSlJ2MFBlSDlM?=
 =?utf-8?B?djk5Z29Ubk1MQmVFR240aVZFRVpPRnVHUTRNOEgyblVvRXdtSzVNOWI1TG5a?=
 =?utf-8?B?SUtVV1VNRCs4a2JFdXdpUWRxNllqN0c3T1JsT3M5WlFZMUM5N0pjOGRrckZB?=
 =?utf-8?B?bmRXZDRqTzAydkZwMGN1TVA5VVBkSFBSNjZ5NEZmNTNCVzMxSFJKNnhZVHlu?=
 =?utf-8?Q?94g8hFUM7wAokuyoj0mVhlYKMaKPKdgb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHFESUFGallmVThBaXNsaHY3VTVBZFZOczdRL240NllVbHZPOE5BNWVkUnB4?=
 =?utf-8?B?bjcya3JhVlQ5bUFpZktnT09EaVlyUC9RWWR5WXpGRlVTZFVTM0hXUVhVRFNT?=
 =?utf-8?B?OFg5Mm9FRUxUQ1IxQkMxSmFWYVgyNWIxMG01djh1c0ZJSGV6S1Jid2ZJT1Bm?=
 =?utf-8?B?L3NTbWxsdkN6bjBIYXZ5Z1I4UmRsazRBRHdLMk81dk10TEEyRzRybjMxRWxD?=
 =?utf-8?B?R3QrZmdYTEQ0dmxyMFlabWhZbGgwQkhlMWtPbHRzWDZndU45anAvZy8wTVlK?=
 =?utf-8?B?NFM0a3A1eVFwNEhZdE1rZERWV3FGZk82NEdWSUl4NXhZUEZ5TEZ4OXRlaXI4?=
 =?utf-8?B?QndZSTl6VjFZK1prR2xSOG01ODljTzBSVUFIY01EQ1dtOUVoRDRzOUJLR2Nr?=
 =?utf-8?B?WlU5RlhzcUZmZnFFb2FKeGtCQzdCaXpUbWJaVTk0bkxGWCtSY2hleFRhRktP?=
 =?utf-8?B?U0hpTmp5bjJGRFYxTSs5T2hGUTdiUEdLR1dlNVVzMGJ3SllyQVd6Y2s1ajNC?=
 =?utf-8?B?MmxjS1Jtbkw2Qmpqa09qaUhHQUtHbk5aMU42VjAwUEhHRlJBWGdNazNnekVD?=
 =?utf-8?B?alkzRFBmR2VqbVZPTVc5QzQyMUJFQnFTR1RhTGs1ZDdCNTFRUGxTWVZqK2xN?=
 =?utf-8?B?ZnQwNGtwci82UGJybHdpbjFHWVo1aHUvN2Jsc1NwV3ZSQzNKZ1VEdVVrSEpF?=
 =?utf-8?B?dXVhYkdpN1ZjVi9lYWNBQnR4bEtZR2lvWG5IWXNNVEJBTHQzRzhjMDFMTGVM?=
 =?utf-8?B?R1F4SitpNTFmQ01zN05SZXpPNTlSeExmVTAyK1NIMUc0UkY5b0d5QVhkNjZz?=
 =?utf-8?B?djZ5eWhsMUNia1c1OFM3MFRJaXhDeWlWWXRNSUcxSTF0MnRiRzhhT2x5MUx1?=
 =?utf-8?B?WVBSR2thNVI5aWsyL2l1VU1ybml4OU9TaWlTYTQ4NjhxNWR1VWgvZTNqK2pG?=
 =?utf-8?B?enIzdmk5TzY1SmhYQ1FvSEE1aFhoeHJ2UnU5S3lJS1k4ak13MHUxaU5oQWN5?=
 =?utf-8?B?SVhIMFphbGhlcVJ1cTZtNlBtdjRjR21sRVBZUTZvZk5QUFc2SDd1NHdlM25p?=
 =?utf-8?B?UlQyVDhCT3BabjVOREtSUmkzNUpIdDJhSzZTL1BYSDY1NW16NkdRQWkzc05y?=
 =?utf-8?B?TVo5TzNRMFNpaHQyUkh0NzVvK1piVWRPN3h1VFladFB1WkJ2NnFkQ1ZuRks3?=
 =?utf-8?B?Z0dQWnE3QUhhVVN2Z21hLzIzVmV0bGx5bjh1dGFPSFdpQmJGR2ZzamRwQUJV?=
 =?utf-8?B?dDZsS21ONThTc3NuRHBINkpiem1mNEYrbVMreVM4eDNKendVL3JEUTBlNHhv?=
 =?utf-8?B?VjVSYmpINnRGWXJPaDVHV2Y2WkhIem9ubE1IUFVtZDJHMWlRcVM5Y3J3MWl4?=
 =?utf-8?B?eGFpTnhOaFRCZGlMRzBheHFKTnlEcjFHT3o0REdpTGhpZmQ4dFZ1UTR3U2xu?=
 =?utf-8?B?djdrNUNBOXF1U05VNlI0aWcrTk4yUXRNMTdhSVBFTE5yNE16aTkrU3FQbTc1?=
 =?utf-8?B?a0YwU0FGOUVSTVdHZmtkYWlBVUJtbG4vVWErSFpwd1VrWmp6Q2FKckY4Q1Rr?=
 =?utf-8?B?YTJjZEZBTjlxK3hlaVAxNkhBd0tZL3k1ek1KNjVtK2w3ZlFrVm5iWjNkQStN?=
 =?utf-8?B?ay9HRlNBNDhRMFlINk5QUEVuZ3MwZndmOUlYWThqMy94STZVU1hmTjZrUUFt?=
 =?utf-8?B?cnV4TlJXTHhhamhkSWVvMndONUNHM0hLUzM2L3htZjVPR3lXNEs3WnM5a3dT?=
 =?utf-8?B?SXZxQjJuWTRpTFFyemZDL0grMkZ5ODN1NFYrQTdXZFAyTXJ4bnJLVUFxdGlH?=
 =?utf-8?B?b1ByMUZDcm1HQ0J4Y2ZFeTlMMkFPeEY4WG9XdVZ2NWhmVS9CUHdWNEZiS1p3?=
 =?utf-8?B?T1c3ZkNsN3RmYVJ5VnZVYjQ0K3JPRDZ6WjIzZHk5VFZMcHJMZ2dmRWJNL2Ju?=
 =?utf-8?B?M1k0VmFOcHhNbmRxbmE0NjhRdnpsTVFreCtWWTY0SXh4L2RrSFg2SUNsVG5E?=
 =?utf-8?B?Z3JEbUFvQUZrZFczMkVMSzZRbXlHei9ia0hLUjFxbDVaTDZTenprdStVbGpJ?=
 =?utf-8?B?cFl6ZFJJYkRXL2xXUkN5TlB1M0wyTlhVcjkrcklHUkdNZ25ES25GTEd4MFJp?=
 =?utf-8?B?NWYvRVJCeG9XNUlJOEVnODJRU3d6djNKeW9WYjU1eERYTDdZM1lCZmdteFd0?=
 =?utf-8?B?WFRRNWlwWUZjYkRaNnRRYWwzcE45Y0JVOFpxMHRGMGN1SkZrQjlueE1sbm5n?=
 =?utf-8?B?R2U5aTlwNzFzdzY1U20zNDZyQm5mOTBrdUJObDJqNTZUVUIrMUlTRkpOS3I2?=
 =?utf-8?B?L0FHVmJxZVhzdUhwNDJsQzIydmZwbnNOZXJUcVZoRGxMOFVlTFplUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b040872-93c7-41a8-1629-08de4c683635
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:39:20.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wE+atXPvQ41HNUJiqH7FQ74Oc62ifaeYenn+vgSDwZGo9lOvbrFv6XQpJvnpWHS/UcacBw6S9hVOEUSW9QR6Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
X-OriginatorOrg: intel.com

On 1/5/2026 9:38 PM, Thorsten Blum wrote:
> On 5. Jan 2026, at 13:52, Chen, Yu C wrote:
>>> -	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
>>> +	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
>>
>> Thanks for the fix, a minor question might be why we do not reuse
>> name by strscpy(name, SURFACE_BUTTON_DEVICE_NAME) ?
> 
> Because 'name' is a 'char *' from which the size of the destination
> buffer cannot be inferred by the 2-argument version of strscpy().
> 
> Using 'name' would force us to use strscpy() with 3 arguments:
> 
> strscpy(name, SURFACE_BUTTON_DEVICE_NAME, MAX_ACPI_DEVICE_NAME_LEN);
> 

Thanks for the explanation!

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu

> Thanks,
> Thorsten
> 
