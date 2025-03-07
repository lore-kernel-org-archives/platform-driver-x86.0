Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6822154E
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364004; cv=fail; b=USMIQZngVqiATG9+uIXtwezG+yl/x++SR+Q7BLAnAmw50axeAPZvlCcxJqvzAw8Bj5von3fD8ulxf8Usyekijt5SAKSIdCfxKckshgri7cFjgXmXahaePGD7ocqhauoqm+ewWXzW5QkGhNQfwJNbf6BTM9lNED98R0YB7l2y9vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364004; c=relaxed/simple;
	bh=ontW2m1pmoMapmsR46ooyljA3I8sAVS/e5DcDJKWLB8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f653cWGcXcBayQz90ZA4jQOOQkLeVEwt0ntZGrfg2M64TiBJnx+OVbX0Bvn2fGdajMrWgOktEF7KqryIc8AAbzVCq60eWJDtorgtqJNfLgQXJD4w9y5xbH0WXEwLHuFAsTfQkGhr9D/eZUbqjuSRdN41WZuIHnWVChq8iLsohW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsyQLoVP; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsyQLoVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741364003; x=1772900003;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=ontW2m1pmoMapmsR46ooyljA3I8sAVS/e5DcDJKWLB8=;
  b=HsyQLoVPvwmiqvChZEXkT9CJSjxv5tlfalP8qkae0AMwkuSm1BT/Aw9m
   rdykLw5M/E5MgnghR5hG97ieICi7FftQ3vPMZas255hiM26EpyZIBZMmS
   9t6xhTfbxPO5PsN0H+PilTV6QDbeM1HHSlNn51If24p8gqP3MdRIgNnWH
   gA9zCtoenpSGc6fUdBILGgSwGYza7q2FRBlZHaL47iy6/0nmIrCAa1p55
   tbLuir8Sif/F8vas4Rh8DYtn34viRU8I/JrafLYDnjZF7YsNZxDYSX8ga
   Yp2vwo1yEhqYNNwtwJUhQBgxgEMwrZZPqGrvFiq6Ase3U4KEyRgxRunRs
   A==;
X-CSE-ConnectionGUID: SEZcjxV8Rrenksq2cgQMIQ==
X-CSE-MsgGUID: jLRmc5f+Q5mxDGa4+Zk/8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53811072"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="53811072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 08:13:22 -0800
X-CSE-ConnectionGUID: M1w508koT7C+oi9klbIW+g==
X-CSE-MsgGUID: yHTM8TU6SnWfgtFPpqZ1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119187176"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Mar 2025 08:13:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 08:13:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 08:13:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 08:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POgATGNMN/EpvNuvq6twc8GTDJl63qvheReTV8FJAY5hDfMI6QlIx4p5VNGACJdK2QzdKuj7jjN9j/BpPqss5XbD6HrpZLV624v9IjH6UgF6mFsdLt0tZQX7s592F2/Gbms2J8M6ReEZRmzAJ0eayFOYCmdZdZKvAT66CLYwcmf4jzVPBmbKDVb3CFPmmdMA2tnbuxh0ThZmwOsMjTNcsRXec3d8frth4BXRc72H/TVf5ahg2lJn4mCzUO6hBRGzM2rSsMA6mrpvlsfOuNYvZBuZu/Y42J/cvfC8TqD1B7+wTBPBtGBmUZbh/Lf5LGxcK/yhUpcKRY7sj0kM82nnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ontW2m1pmoMapmsR46ooyljA3I8sAVS/e5DcDJKWLB8=;
 b=iHqGZaGoX089hflWHx7f1X6jpI+D6wXfX/mLKN3yKVxYACCY+hfaunBmXXYah2RQA9lX9dT2pzjPJiRqkdyKbsRAcA8nVPhWA+6U+JVXQ6NJRxRhJRuGzEU9NVL4+rpTZSbfte0PWxjtn/jFMqKT9mPhY3reacWNLbR+5uPgnjOMOJU36QM9JQpLYGkmJAI+/7qp5agbMEz/GOJqY7zlwY8DYimkTnLKyCfNwKlKCkSKURR0BHbIUrRn8bBWsMeeR9WkZ1a9/gy/nzz3bJJDBcgInS7c04ONHUEOBijCRberWQ4joMfd/FbqWgLsWGUNgd9kDspeipvyeLFLZ/IwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.19; Fri, 7 Mar 2025 16:13:16 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 16:13:16 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request-2 for
 6.15-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request-2
 for 6.15-rc1
Thread-Index: AQHbj3vVMU+dMa+2hk20ypWtRxXsQA==
Date: Fri, 7 Mar 2025 16:13:16 +0000
Message-ID: <41729ee0b6b11a5d2f3b18a20343c1ceace86dc8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM4PR11MB6165:EE_
x-ms-office365-filtering-correlation-id: a2fdf26b-e2c1-4a4b-7731-08dd5d92f7f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEE3M25aTDJ2ZktYaUsya0V4TjdqMFZFNWlDblRMK1lWREVwc2VWbFFjTXFo?=
 =?utf-8?B?TTk5bnZWSVN5VEhsQjMzRk0zVk5wd2pCdlBKaUNEenI4eHg5Uy83VFl3Rk14?=
 =?utf-8?B?TnN1aE1pQmQ1dERWVkdXVTNMamJlT1dPM3ZMemM2L1ZXRS9wUlNmRm9yeXN1?=
 =?utf-8?B?aWVCVWFQSDl0UDgxZGQ2RDZrTEgrN1MvR1dnaXdVNTVndjlmZTJxalozaCsr?=
 =?utf-8?B?a0ZOQmczeVpxODJXbjF6QzF0YlRhV2wxVmlDT09RcVVZOTV0NzFFYW56VEJu?=
 =?utf-8?B?Y29HRmtUaGFpODYrV24xY3JRWW9Fc1BjM0ZFQm5Jd0RGU2s4M0VrN1ZiaUhn?=
 =?utf-8?B?YTZrN0RxNVYxT0pVYklmQlB0NGk3L3ZpZG5yMFQvcDMxWHRINTFXNGZxcmF5?=
 =?utf-8?B?YjYvNzVTM0ZWMis5S3lIRTVVZXVlcmN2RVlZUUdUWmdOQ25BYTkxbGsvV3FI?=
 =?utf-8?B?Z1JXcU1wdDMyWC9yTG5ZQ290ejdCUkVxKzZVbEE1TUhqdVQ4bEZLaDM2QUJJ?=
 =?utf-8?B?MWh5eXBGL0I5dWxxaVk5S2krOVMvRGJ6QitrMEtRVC9BNE1KTjZFTXc4a29R?=
 =?utf-8?B?RWVqaTNsMUovYjBIZ2NUenZBMHdudFovWFljSjh1c3liVnYvRU5xZ3d5TjFn?=
 =?utf-8?B?VTBJYnhhR241RUtSSnNwdXJzTndVVEhJWjNzU0VsTkVNNDNDejNzZ2h6UHJn?=
 =?utf-8?B?MWpPdnNsUEp3VTF6d1IrMXRrem1wUmhEd1VvZW9jUnlOWnQ0WHM3TGh1eVBr?=
 =?utf-8?B?L2F6WnlyQ1laTkRPajBmcmU1UU5ETjhsYlV6NHB4akwzNURaZ3c4QklxMWo1?=
 =?utf-8?B?amp6U0QrR0ZxUFZBZGlSUDYvOWxMNmdKK2ZXNjRYajQ1NzVzeTBwMTNzUEor?=
 =?utf-8?B?d1hKK0svZ1Q3VVptc21IT3dPVGtiVGUvNG5SU1lJTENLYlVsZHNoMDVvUVJu?=
 =?utf-8?B?ZU5nUkluNWgydFBPVGNZb2dDMS9vcS9aVkdLMVlXRnk3UnFpenRMdVZxWm1v?=
 =?utf-8?B?cE9JNytrSlZZRmxyL1AwaCtJRmxkOU9sU2lPTVNnV3ZQQ3QyT2N3NDJDWHpw?=
 =?utf-8?B?MXM3NWlXTlJMSUpNWitlV1Y5aXVORmR4QnlZVmlrUDg3R3NaZzZxeEM1T2pl?=
 =?utf-8?B?dWJIT2NUL3dyT2JuWWEyWXIxaWcyanhoQ1V2aElsaExpa0lCNCtoSVJSQTZI?=
 =?utf-8?B?ZGtVdjZ5ZmdLMzduZk1WUG5nWFNTdkVCaUNiWjFtTCtuQnlERDNJSURXUWFs?=
 =?utf-8?B?cGdyd2Q2SnVva0JKS0tERFNGM1hsQWdYZW85TGk1MUt2Y0tYRHUyRFdUZWFs?=
 =?utf-8?B?Zzk4M0xUYWlXVXA2cmF5M2pUVHF2MDZ5cW12TE91RHdSNjFLRmtzYkgydWpS?=
 =?utf-8?B?NXdXRmFXUmhpdDNTb21GVTYraDl5ODdwWnpHSlF4Uk11UjVQb3phVmljVXBW?=
 =?utf-8?B?cXhpU1lXdzE1dFBpNmsxam1xZDBZVEFCNXl0RE1XZTFDbGlBeHNNeXROUVl3?=
 =?utf-8?B?NEZMMlg1MHJYcnlWRndKTkVZdE83c0JMMCszY3ExTkxJdkFyT2V4YXdNZWRP?=
 =?utf-8?B?OElqSE9NekR5c1JrSWdPZi9lM0ZaR0FhMUpuR3YvSjdTbllGclkrZmVLR0lp?=
 =?utf-8?B?Sm0rYy9HK3dwNHM4NVo4S0NYMFVkS085KzB6UktLaHRmWVJsQnh2YkplRzJY?=
 =?utf-8?B?aVhiQlhqU0xGeXhPUHNxMmhYNG5Bc283eFJ3amVwK1lha0RJM2oxdEhoRXMy?=
 =?utf-8?B?eTZkdVQ3NFlZL1Nsb0t2a3pKcWpneldkdk93R0VhL1g1MWhFYXMxcHlBRlZu?=
 =?utf-8?B?MzVhWlJJcWlreldSU29tbDFndzZpUTBXaDBmb0tqZGVFZ1JHSUkrcCttaWVD?=
 =?utf-8?B?WXJmbjdTTTJ6TTNRZExXZkxBa1hkOXJPK2VkdGowZ2dhRnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2czc2xreGMzTTZnVXlaOGxMQTNWYUZCWHYvSWR0Tlg5NVpRZVdvZ0U5MnEv?=
 =?utf-8?B?MzN6czNack9nQm4yeG1VWjBGVDk2M1BhSElPaGRJU1gwd1Jxb201UGtaQkxY?=
 =?utf-8?B?ZXFtclBDS3p3aEkyQldjK2h5RGZwckZuZGxBVFJFQ0VKRllEd0RwQkJHelNK?=
 =?utf-8?B?Q1Jzc1BJdVNwcVVhVytvZmtISmhhbVBYQ01RNjlOdjg3c0JaZit3Ym1LWG95?=
 =?utf-8?B?enZjVGZVeVZYKzlKbnlya2J4dEtFQys4M21FcVUvWUFRVmtONGtTSkNydFY0?=
 =?utf-8?B?VlE4SG9GNlcwTUtDQ3VQcERMcjlCQWtWb1YxUU91ZjZzeXJEaDhuVU9LWUFR?=
 =?utf-8?B?ZjFSaFlyR2dqWnJZM29LTjVySW9Ybml4emlNemd2ZncxTk5tWjRaQUMxelJj?=
 =?utf-8?B?Zk1yU3NTVnY5aURoNUQ3Y0NvMUQ5QTczY3pML3FIOG5EN3paOWs0Z0dlVXZ2?=
 =?utf-8?B?QS9ZVnpVM1B3UitLVHk0dDN5Z0pHeEhGM3FzUC9IVjVZekNlcTUzQ3NML09m?=
 =?utf-8?B?dysrWC9iVFdOOWNTT2o0M2kyYW5tdEZaODg4dFlCTjlma3pPQS8xQUJhZnB3?=
 =?utf-8?B?cmVFdm9rZEx5V3U3S3VISUFwTlJKdUo3RjRkaHgwaTFYcHdxVjV1d1NlV01X?=
 =?utf-8?B?b0pTZTBycE1UbG9Tb0FoajZyQ2lhTlR0U0I1LzBnZXRxMktFZ0NqNnA4UjVC?=
 =?utf-8?B?SG1LTUNTS2Rwejh4dmpYQUNzelRESjV6b0ZlTWpqL3Jnand2TGp0UElTckw4?=
 =?utf-8?B?YU1GUndrd3VqMEFPSDNGTGIwZ3lzMk9wTEJmUk92VFJ1M01NYTlOK21NWTdz?=
 =?utf-8?B?SDlwUHE4ekFJbmtlcFVBNjdlTU1ybmxqSFZaeXRkV0xQcjFFRm8xWmhkODVR?=
 =?utf-8?B?U0tTM1ZvdUkyVXNzRXJYNmxoZ2VOS0hvKzV5VmozaExIZXViOVlGZkF0bTBY?=
 =?utf-8?B?RnlIeFc5Z2Zqenl1d3p1b2tzSEhCYVB1MlpnSEo2VnNrWWpoVGtUajdIS2JB?=
 =?utf-8?B?Mi9xY1FSTW9QV2owaFU2dEZqZE0raWtIYldTeHIwa2dJN2N5RE5EUkZpOXJR?=
 =?utf-8?B?VkRTNjJMZE80dWxBR2Z5VGZqSkFLcmRJUzAwMVdIaHpaNXIzQWdsdWtJbzBs?=
 =?utf-8?B?QzFrM2UwdEpaV0lOa3J2bUR0ZDI3S29KNFZuQmw0Ty9XQ0lsamw0bW9EemM3?=
 =?utf-8?B?MWd3dmxZYUdEYWZrTEI5TGZ4aXRaUm9TZXBqaW1pTlNGdFNmRWxkRTFROVdM?=
 =?utf-8?B?R3hnOW1CbEh0MlBWUGJDUlRrNnc3d2ZEd0NYQ0w3ckJEMkozcG9IQkQ2K2Rm?=
 =?utf-8?B?dktrczF2eTZmM1R0Y2xrYUZaYjh4QVJudGJKUGlqbEVVUTdNOXZCTDZHVW5D?=
 =?utf-8?B?MmRhamdIUVlUekNHa2ZWa3F4em01U1ZPeDJhc28yODZ1QTFZVlNJdjlqcDI5?=
 =?utf-8?B?VldlR1liRFB4U3RtTFkvOVVZZUJ3dURMZ3AxSWs5M0k4RCtnZnJWSnFvb2FU?=
 =?utf-8?B?RWFNWHZzamxuVFdaZDVYMXc4Ti9QQnl6WVJKSHJleStHb3AzRlNKeW4zRTYx?=
 =?utf-8?B?RHRzMmk5M0t6eDB1VWExdWFQekNQVHdkcUQ1MDJnRzlqV3ZmaXd5a3BzdjlD?=
 =?utf-8?B?WUVCWGtDeUIwNkExWFJLSkQzQ2xVVUh1WWRnYVlJNGVDOTdHUGRKU3hQM0pM?=
 =?utf-8?B?cmk5a1ZrTjRZeGZ3dDBDV1JkWWdnTzIxc3cyRmhDOGtoak5LSEtELysrdDcz?=
 =?utf-8?B?djl2ZG5yR3hQeHBNVjZoZVc0NVpmSkxISW5zVjNXUlVCUFA0alY4UWJWMUhR?=
 =?utf-8?B?NEMrMWVYREpCWWdXamFoRTROSGsvMkpNRUxiNzN0THVML3EySHNoVXgzNW0x?=
 =?utf-8?B?eVFMMWhsZE1GN1k4aloxNXFqTXBYM2p3MGJ6anUrVS9KOTd1STZEQjZuNEt5?=
 =?utf-8?B?NFEvUUtWK1hQOThDTE92NTJTNWxIR3RTak10L2VvaHlaSGdIc3pXZHVwSDFQ?=
 =?utf-8?B?S2x3L3BOcWZGMzF0WTZEdDUwQ0d2L1NVamhQdkl6bUVRSlNISVZkM2daZ0xI?=
 =?utf-8?B?SHhTWXNtSnlaTEg3VjByanBnWGFYVERra1JkMVBMZ21SaCt0SjNTdDBvSkd2?=
 =?utf-8?B?Y2gzNXFGN0RtVllRRWU2elM5MVNiOERjTWhlajBYVDRxY1RNOHphK1lkVWxB?=
 =?utf-8?Q?XBGP7a2+EE8WpMDEYev95HE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C0631942192E84BAEBFBA18062B10B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fdf26b-e2c1-4a4b-7731-08dd5d92f7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 16:13:16.2620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OTebilBtXID0zFBWaElYutbde4Ln9sMnnbHKwqxrGASjiviU5ETraOXuV2jQSOJsheQrhAVVw8AqbnK1hChtufs7wPobsTAgtdmKraozR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-OriginatorOrg: intel.com

SGkgSGFucyBhbmQgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBz
Oi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2
L3BsYXRmb3JtLWRyaXZlcnMteDg2DQpyZXZpZXctaWxwby1uZXh0DQoNClRoaXMgcmVwbGFjZXMg
dGhlIHByZXZpb3VzIHB1bGwgcmVxdWVzdC4NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9wbGF0Zm9ybS1kcml2ZXIteDg2L3BhdGNoL2U4ODRiNGQ0MDNhNjUwMTM5MDgwMzY2
YjRiOWY3YzlkNGJlNzhlZmQuY2FtZWxAaW50ZWwuY29tLw0KDQpUaGlzIHB1bGwgaGFzIGZpeGVz
IGZvciBkaXNwbGF5IG9mIGRpZSBJRHMgaW4gYSBzaW5nbGUvbXVsdGktZGllIHN5c3RlbQ0KYWZ0
ZXIgdGhlIGNoYW5nZXMgZm9yIGRpZV9pZCBzeXNmcyBmcm9tIGtlcm5lbCB2ZXJzaW9uIDYuOSBh
bmQgY3Jvc3MNCmNvbXBpbGVyIGJ1aWxkIHdhcm5pbmcuDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQNCjZhZDFiMmRjMGYyYTc2YjIzYTMxZmM3YTUyZWQ0ZWMwNmU0MzQ0YTM6
DQoNCiAgcGxhdGZvcm0veDg2L2FtZC9wbWM6IFVzZSBtYW5hZ2VkIEFQSXMgZm9yIG11dGV4ICgy
MDI1LTAzLTA3IDEyOjE3OjUxDQorMDIwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtl
cm5lbC5naXQgaW50ZWwtc3N0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KN2Rk
NTU2MzY1YjBjY2JhMWYzYzU4MWY0YzQ3NDdhZDg4NDk3ZjQ5NjoNCg0KICB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMiByZWxlYXNlICgyMDI1LTAzLTA3DQowODowMDoy
MSAtMDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KS2hlbSBSYWogKDEpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogUHJlZml4IGhlYWRlciBzZWFyY2ggcGF0aA0Kd2l0aCBzeXNy
b290DQoNClNyaW5pdmFzIFBhbmRydXZhZGEgKDQpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2lu
dGVsLXNwZWVkLXNlbGVjdDogUHJldmVudCBpbmNyZWFzaW5nDQpNQVhfRElFX1BFUl9QQUNLQUdF
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggdGhlIGNvbmRp
dGlvbiB0byBjaGVjaw0KbXVsdGkgZGllIHN5c3RlbQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2lu
dGVsLXNwZWVkLXNlbGVjdDogRGllIElEIGZvciBJTyBkaWVzDQogICAgICB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMiByZWxlYXNlDQoNCiB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0L01ha2VmaWxlICAgICAgIHwgIDIgKy0NCiB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgIHwgMjINCisrKysrKysrKysrKysr
Ky0tLS0tLS0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGlzcGxh
eS5jIHwgMTEgKysrKysrKysrLS0NCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQ0KDQpUaGFua3MsDQpTcmluaXZhcw0KDQoNCg0K
