Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C16336ECD;
	Mon,  5 Jan 2026 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617562; cv=fail; b=mqOKkru1uoXqA8AI+cWGQD/8TZazj7129zl5l9g12sum2R9mu/lbxjjD7/Z2vW44few/kZG0tSAoJQKTIyXCjZuP2U0pjeRx2+wLN7y69B5FQuxtZlv3V01GcafsYZAxeWoGeU+6TpJc0edlMuUwC1VPW17TeNCqLKjhPywCl48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617562; c=relaxed/simple;
	bh=oA9a1uGwU5WwQV8TYmx66sSow3OCwFra8ZWJlz+PWe8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EcW1TqE+lX043SNHgLjDpkW0FgRijdrZJmev8kks1ltLV/utTSQ9Boa4Bl53LyjRBOyzcJit60kH0QHLosUtXRflXyYHThRDR4wk4vKdlZCY+BjnMJRDhJsWDk+LE8C/pN8IMD0gmucYppHmvBHizCrmLgZ1CeIb3SnujBfznow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MctFXfWT; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MctFXfWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767617560; x=1799153560;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oA9a1uGwU5WwQV8TYmx66sSow3OCwFra8ZWJlz+PWe8=;
  b=MctFXfWTuVk+pfsBCHalHXeupsn4UsyiSizcmU8ds1YCQFOfEnIQKLiI
   bTW28YpLZBI3yoFdA0U0XQB1svF9BuOrc4zLqwSeZyv8cP/cNa1qG7cHZ
   Wrnx2/Hzek9A6lEX5tBm2h3WyZlGUry/nQ2hEzbPoDy665oiAY5Wiarum
   NLt9kiLCXVaJADZ7fuSMTTgHTU5nyLplO5xX/1C91g4bmMRbC0aK1FPAj
   fVagqBYyAzvbNXx7qsnTMwarmPBy1736eXCRk06W0HPhIM9Af03vhAaMs
   89xjnDIl32ygA7Von6AV85DJMrqoa+luKmXuBJ3/4akZ9aKyYG1hXo+89
   g==;
X-CSE-ConnectionGUID: FdY7rw7ZT2CGs0OxQLeyWQ==
X-CSE-MsgGUID: v0oMJuGeQLujAC5uGDDovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="67993059"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="67993059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 04:52:39 -0800
X-CSE-ConnectionGUID: 7ItJtAu+R2KHMF5h4XPVnw==
X-CSE-MsgGUID: FKZ194lRQdaDRHpiNqmbng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201507830"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 04:52:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 04:52:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 04:52:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 04:52:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ybd/7EvA6eLGdX7wKJT1vkMqscZ7Hfr9YhKqOVEOcqwrFI5qOu9PbEMcCOePirvEuIjF/JPl2bg/MuslcTtFworv9pW1Af8RMvT40FBfMpc8OMK7R/GHdwP389ATpQklAFHpLvNVoPA8r91kkz17nGisKb3hO/suE7T0D8a4HDobUSH64tPVGQSbZ8HW3gNtgmQIcZl65gAxNPdJ61iFj1qSsjgysuGWcOSv9vvCoB75TIVz7/0OHNNh8yQCkAqrL6SeZQa8hJUaLdeiGNoPOGZtUAxQEv8lh6qBiiLSQNTbCjX2Z6FRTyt5NpDD6XeW5xT6SVrQ7KxABsbkbaMxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/N/M9+M4AGJ0qqPd6MrCDwPlwviEek0NTU/UaehXV0=;
 b=aHxglP02yvu8s4i+n0DyE9yrmk1D2pRK3eFoXJFLLXbW0Tvb2A+mVw+ThlDbDRzklZAiHdFfcCXxPH9vsTSeFOkCLjCCM8J+/bYsaI4c87cOXkEU33XYp9Z4esUhBTYAOeIzQcfUcybp2EFXTahbs/6HipDlCkckc0qbMXLcUEJ3NSNBQbqYSVlPTbA7vYujb/4/vJA2ACawdevSEBGGgW9s5aK+XZ3IVqLNnHAixZKclcl6D4sOMgOj6BJStGXvFG/FN+8XwchJn7Kh0bpb6Ub4SqmpfLput4LJj6V62E0V1qRlgshTG2w1d6w0bp9nCm1OsfdWJf5diTNyxqyJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 12:52:36 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 12:52:36 +0000
Message-ID: <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com>
Date: Mon, 5 Jan 2026 20:52:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/surface: Replace deprecated strcpy in
 surface_button_add
To: Thorsten Blum <thorsten.blum@linux.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Maximilian
 Luz" <luzmaximilian@gmail.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260105121802.1947-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260105121802.1947-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:820:d::8) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a5b9df-ffa3-43f0-3ae2-08de4c594cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGtXUHRIb2NFYTUzenJDcERhalNVaUVGeFZGdFd1TUJNT0o4aWUvNnh5TUJU?=
 =?utf-8?B?aWNHNkRjMElKdEM4dDVwemVZRk5sdURvN0o2TGZTZldlbjJhRnVRTXY5bzl5?=
 =?utf-8?B?R3cwRmVud1pIUGxsbUdDSkRPN2ZUajdiSmdoUkJ5c081N0UrbjdDQ3lzQ0lv?=
 =?utf-8?B?Vmw2YXBBSnNBMW1XSS9GZlZNZlRkTHNXUllnVmRYVU0yaDhOU0plUkp4dlN0?=
 =?utf-8?B?NFNUMHRPK3o0ODBualU4aXVSc09NZ2RQUWxrbGxsYThJRnBCZXA1NU9qanFV?=
 =?utf-8?B?QW1pdTdwRU9OTm5tajEvQnhjOE5MWkdsNFdVQm4rUUZkS2wrUEszOUN4SmVa?=
 =?utf-8?B?K1RTc2Z5QkJYSXlWRU94NUdKVTZoZTJKQ28rN3ptL1VpQkVUTm5xcjc4Yy9Z?=
 =?utf-8?B?MXE5ak5HS3dXM0hSZUdKNG9KdW9ZMTdpS25vWDVUeW96aW0xVDAxclh2N2ND?=
 =?utf-8?B?THpqQmZrcEdwTi9IMHFiczNZNVhPcWs0b0V1VjNKU1NFSFRwR2x2MEZEM0VK?=
 =?utf-8?B?VlFLaXZpSi92R3pIbGJrQlRNTWdqbzEra0I2Z0l0MGo2ZHNnNTRrc0poUHN2?=
 =?utf-8?B?cDYxZUswUnlIZDFpaEhhb2YrMzByaUZRM2t6ZXRuZnY3dXB3WXdQblR5aFpN?=
 =?utf-8?B?RzlXb3VZU2d2QlNDRk40ZUx6OXhrMElqdFJxRG51UUZtd1AxQ2tJcmg0T2py?=
 =?utf-8?B?ek93ejVIUmNhQWdEdnJzQUZkMGZtWXlQbkxGOW1mTFNVQW9WK0liMnArUWJC?=
 =?utf-8?B?TW1zWTA2WWo1NXhoSk9SSW0zL1V1NzdVVExOckcrUjdkRjRoVjNDbVh1cUQr?=
 =?utf-8?B?b0JPSWpqUDZWNXcrT0E5UlBSNFJ4emdxdzl6ZExxRlFqVjFTUTdHZCtDa0d2?=
 =?utf-8?B?MytXNVlyS2pEOXNFQ3pXRThKQ1hXMjRDajRHcmVsR2FFbWhwdldrZndWME51?=
 =?utf-8?B?dDNiUzdwK25idnQwS0d4NXZ6b2hKNm03YkhUTGdGNHlKUXc0b2hwU1BEYnV4?=
 =?utf-8?B?elE2d1hkOTVZQW1HTjZlc1ZzaE1hcGlnRjREZ0JFZzVCZFN5cWhnZFZhcmVz?=
 =?utf-8?B?Sk9VMnhDMUNKNWxqYk5vaEl4Q3NFRHptaHlrYU9oN01qL1dMbkxhNWM2RWZM?=
 =?utf-8?B?cVA3NGVoWnd5V1VlSHRDeTVRL0t5dFRxSEZMWGx1R2VnTmQ3VEUzTWtKK00w?=
 =?utf-8?B?aGthb2t3S2RRZmdWQzRsdDVUaDdwU0hFNFZRaUxhNXlUTHczamFCMFMwNmR0?=
 =?utf-8?B?cEVsak5xWkFDUm0xcXFPNlcvZE1nenlSZ2UzVm5SL0xKMjR1V3hEOHkzbTFW?=
 =?utf-8?B?ZkVCZVltaXZFSkNyQjFwdVJSZVBaRUNFZjk2Nlp1NnZBeGhmbnQwakVvMjlJ?=
 =?utf-8?B?VFpvZ0MraWV4NVQ1Ny90Skc4VWpBRDB5ZEtNL2llNmgxU3JUbHRIRU1kWUpQ?=
 =?utf-8?B?MTZGSmEwYThBNlVyYkVxbXVDTHRsMGpiTlBmcWtrNGJXQ2lidkdPZElBdWFK?=
 =?utf-8?B?ZDVUM3V5VG10R0ppUEExNjZ5dlNXenY2ZHlYcjNIN0MwUDRNbS95N21MU3dC?=
 =?utf-8?B?VDk3Y3gzdWJuNFd1TmFLZVJsd08wQVVDRDRRSW0vT3R5VjI0bk5ZRkgyemxN?=
 =?utf-8?B?SkJ4RWhsSFFhdWJUT1Jta3U5V1VWZnBvZUhjRkZrSWdOU1M4MXBTVkpaMHJ1?=
 =?utf-8?B?L2ZVMGhDcHB3d2pvbzAxZ01BeitRQnAzR3JxY3JmQWRrU1l6czJWajZCQmRW?=
 =?utf-8?B?ajMyNzkreUswMXltTWpYdGFFVnJtWG1ObzcvV2JLYXRzdkdZSVZ0ZVBqTjNx?=
 =?utf-8?B?ZzNzNk03NzBJVkMzSEFMeGJYbExiQzZocUdFRk8vTDM3RklEQjg3ZENZVTEz?=
 =?utf-8?B?aW1WcDJMQStPN1Z5dWpZVnczek8yclZYaWpwWFZuL3VHM1hJZHp1UndQaG1B?=
 =?utf-8?B?Z1hIMXY1ZDdjS1dJNkg4QnVmRjY4ZWFGSWUvcFk3MVhmQzBDaFVhSjU0bDQ5?=
 =?utf-8?B?QUFOYS90WVV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWU3NzI0bHVzWGl3UGNYSnEyTldnb3AvRUs5ais2dlVhZ3k2Vm5vZkhtdHFU?=
 =?utf-8?B?RWdudkJBdmNLZ2trNHUyaEV2SkVaUWtIY3AwTS9qQnRlY0Eya09ORU9OYWJZ?=
 =?utf-8?B?QW5lZG0zeHRoTnB2UFpNWU51RmVlUHBQS3QxVXFlbW1wU1ZoQUhCSk9sc1dl?=
 =?utf-8?B?cUhyVDNuUXEyU1BhZTFSSjlHOXJPYUppOTFGZGxoUTNBYzlCQVQvYTZnMEpE?=
 =?utf-8?B?V3lWM0xoMC9iaVpWdDJhVkFtc3JZZlhlKy9rMVZoTDQ0MzE2UFNWR3RIQUc0?=
 =?utf-8?B?T3J5T1JDeHQ2ZTlScFFXSElYQTNZdEFIT0RmMXFxaVlsdTVLdjY0SVpLcU0y?=
 =?utf-8?B?OCswZjR0QUVEUm0yTUxCa2Z2MTZJQ2dDdnBPQm5QVHdsYlduSkI5TDZHQkxL?=
 =?utf-8?B?Rlk1YjJWWTNyY1FIRGIrNVBWOTZkQjJKK1dkV05NUFFzR1JaQ0M1VHVGOThv?=
 =?utf-8?B?bXZBcjJPWDk4Ly9vZDdiVWZHSjY5eE8vSXVwM25CUDdrMSs4Z3VRQ1NPUXdr?=
 =?utf-8?B?bHRTcDlCVkxLMFRtOFM4MmRFelJweXdEM2x3bDlHdGZKcVdMdVdlSjZYdlZP?=
 =?utf-8?B?cmtzV1FZbCsxVVBaVHBYSm0yZWtRUnlSWDFJS2JhcUd4eEl6Y3cvbkorT1NR?=
 =?utf-8?B?RUQxN2FjTXF6L2RQRHoxTmxNQVRxTktRV3oyTHRMYXRDMyt1R0YxMjhPTG8r?=
 =?utf-8?B?VkN4T2wxbElWc3pza3ovNjFzOEQ3MjFsKzFHQlpKYkVWSFFSaVhHSW03dXZV?=
 =?utf-8?B?cXowMnIvTjlMQkpIK3BYbSthR2FaT0xiMzBHUkhUVElCQ25NanZIb1hqdjdy?=
 =?utf-8?B?cDZxeUhwbHlmTkhiT09xU0VZZlNicTRqQmpmRlhxYVlaZXBjM1pDYjJISG1Y?=
 =?utf-8?B?bndQbHQyMzhySTE5M0RxZ2JJellybk1acWQrVyttWGp1dlErU2RvN2tDK3gv?=
 =?utf-8?B?R2VObWlIcEZYUVdFaFFCYkJ0TkI2cEtma2MxT3BVVFpqZkN3aFQ1OVZkVTdM?=
 =?utf-8?B?endDc2hTVlFwWkVhRGowUVZkbFo5d2hicmNMVUJOS0xJTGxRS1IzZXNETUp4?=
 =?utf-8?B?T2FtRUJaQUtCMDZ6TkIrSDFJeXo0V3NNS2FIK09KeWlHR0txa0g0YUJGbUFu?=
 =?utf-8?B?U0NoZERjQ3ZubmpmWENnWHpzSWF4bEdTeVdWY3Z4Tzh5Ujlwb2ZEaDJYcmpR?=
 =?utf-8?B?WXlsdVVvS2FMaWY1cnFQdS9UL0t3YjkwTks4TTB0U01PcHJybExKKzJobzF5?=
 =?utf-8?B?SnlXVmFIdnVZNk1xREgwZmhwMUtpejNGMU13NSs3OWNsOW1ndjE2ek84WXJD?=
 =?utf-8?B?YU9nSTNMbG9KYW0yeEJyQ0lMWnA4ditWM0xUYTVkSU9IeHNidmxKbENIYmp6?=
 =?utf-8?B?VSt2VWZkb2RmeFM1WWdJakZ1OW51ai9CaHVuSVVHdXQyWWV3dVJMUTNRc25m?=
 =?utf-8?B?MEE0YWlSM0hGckJiVU8xOXpvQ01XUU1pMkRvU21rVDJsMnovVFRySHVacVRj?=
 =?utf-8?B?b1FGTmJHRDVNZ2ZKcjNCdDRUb2RLNWhia21XZjUvL3pxN29mSWMwdFJPNjVz?=
 =?utf-8?B?aEl0cG5UVG02NklKRENzMjNyOEkrRGFFbURNTTlyK1RwYkV4c3JDaFlLekdL?=
 =?utf-8?B?T2pmd0RTWjFJM2tpMVdUV1BXY1NwaWtFNS9WbENPNWhFQnhzbERFZW0wRWRV?=
 =?utf-8?B?M2NJajRQL1J2TFl2U1YxdmdTcHR6c0hWSTMrY0dPUTczSXB4U3R5V1hZamt6?=
 =?utf-8?B?YXkwU2JpNnh2MHAwZzM1MVdoYWZHR0ZmN0hIdmFGWFMrWUEvZFV2SXE1WUh6?=
 =?utf-8?B?TllEV1FtOU1yOXl3QXVZeFRxT1grMzNLQjVEZUJndDR6VE93N2FFOEZ6QkM3?=
 =?utf-8?B?MnY1UUkwdk5Kdkh0Wi9BVE9LYnZBRzhvVEdvby9lNkhjc1FpcW5oeitUd0Vx?=
 =?utf-8?B?T3ozQlNzeitiRnEvV3VsOTdrS3JOcXI4Mkg5S1VNRW5PNmlFRmVTcnF0ekl0?=
 =?utf-8?B?K2hRa3FjNFA2aVROT2ROeTAxeHJUV3p0ekVMVG9EWVcyK21DejQ3d3A4UXVz?=
 =?utf-8?B?dkFmOUFEaktzSkI2WldVb3FaVFFzN3Ivb0hPYWNWZStiUWhob09JQW5ySjNr?=
 =?utf-8?B?eHc0NnRBS1NmMVljVVNBdUVjT1JhMUZ1N3FZU0Z6YTNlNmgySHhvc3RqZmtJ?=
 =?utf-8?B?OG1FMTFWa0JocndXQ2h4VGIxbVVmQVBCMDhEZytDdnE4NWcrMFl4QWxJeDJZ?=
 =?utf-8?B?T2xaTnJGaWdYZ3FVNjNDYUJtUkRiOHk5a0hBdXdzWWZOQklDYmQ4a0xhOThR?=
 =?utf-8?B?T1Z2MFkyYmRoV0JIZ1NrYkNMVGlmQUlTMmdzV09vVGJQYUp5QnRpdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a5b9df-ffa3-43f0-3ae2-08de4c594cd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 12:52:36.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlwCsU+Mk7VM6tpbP+GM/u9EMy+me1Fe8kwpUx5lPd4Omjyy05Svd5wT4j7wm6b0TRVIexWx8FQ12Lyj1gZLUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-OriginatorOrg: intel.com

Hi Thorsten,

On 1/5/2026 8:18 PM, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().  No functional changes.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/platform/surface/surfacepro3_button.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surfacepro3_button.c b/drivers/platform/surface/surfacepro3_button.c
> index 2755601f979c..d027a064a62d 100644
> --- a/drivers/platform/surface/surfacepro3_button.c
> +++ b/drivers/platform/surface/surfacepro3_button.c
> @@ -10,6 +10,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/init.h>
> +#include <linux/string.h>
>   #include <linux/types.h>
>   #include <linux/input.h>
>   #include <linux/acpi.h>
> @@ -211,7 +212,7 @@ static int surface_button_add(struct acpi_device *device)
>   	}
>   
>   	name = acpi_device_name(device);
> -	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
> +	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);

Thanks for the fix, a minor question might be why we do not reuse
name by strscpy(name, SURFACE_BUTTON_DEVICE_NAME) ?

thanks,
Chenyu

>   	snprintf(button->phys, sizeof(button->phys), "%s/buttons", hid);
>   
>   	input->name = name;
