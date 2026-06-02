Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212D3FB7F4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422386; cv=fail; b=mkty03NG60G05lXDNgG4zLJaYBrS6QBxdSduc+BLixVpxL2OiN7SpSwrLCpo8RrzFPCSZQOqZbCVYoaFlgz8VnL1FerZ9vdqGMB4YjZzUQvXJOrc+zmMZiNOFH0hCNmG9Cvcuz3PdLK6JslTFFD24DqF4x5o0Qmpu/uyvP2THHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422386; c=relaxed/simple;
	bh=IjsGH/Pcq3VAwh4gci4CD/GsfykQ3moPsAjSXjg8APE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Rnm3uZkeMiEpPLrM9zQllnBVI/DldSGGO+TGqPyp+FUNMfZWeAbGPnF4UL98pTSo4IKez+C6UaPg8XpNZKnaPI4n/D6IUFcOKfIr6NZWLgOml15q7DQ9gGMnJY82D0Iuqd2nR0FbgeSgh+TmxDqwjDAShfqhzMUavcbYX9VXw+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlcAk+bK; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlcAk+bK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780422385; x=1811958385;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=IjsGH/Pcq3VAwh4gci4CD/GsfykQ3moPsAjSXjg8APE=;
  b=JlcAk+bKygSFW2c6ZY/geDbjTQFb9iuzR7urxY1x6Vii67oUemiYJh2x
   5pnUcBKJUWAlbL63h1rJNjzAJDv0jdCDPImLKRRP11KuAObncwKbqchQL
   4JZm6+of0S+O9XnLmA3Qx7xLz3I2ihqRQekN3X36BONi36U4FxsvKA+oG
   7eEHp3+dixUbyeblBvjKixaPPDC/L4fMHejFRBs787WJFauydwffw9hBI
   vIjjHFoF5ycaRSjXy45GupOtnNOBENHaMoL+FkGuq4MpDuFNbERHjhI+X
   iNIqyrd9rEUh6N8ksdCw5rhRPlPH4YpLI9jIWmTmpsouDyDxjENSzByXX
   Q==;
X-CSE-ConnectionGUID: bFN4v4CpQqGUnZD4h2LpqQ==
X-CSE-MsgGUID: 8dIOURKmT6i0JOPDLSUxaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91903181"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91903181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 10:46:24 -0700
X-CSE-ConnectionGUID: Cmnab6zlShaJ9bRkBZBqdg==
X-CSE-MsgGUID: wPKrKGYkQeu2VqHKc2ciKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="240987423"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 10:46:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 10:46:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 10:46:24 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 10:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3i6afoe2s6R+7doVYp+JOg4r3wcmE0xUJQurX0tNOojIpD6b1mK7F0d4oN5RVp0wFrSylrI+EGQc3MJl9Dv8xKTCEO/GhCucvSa8zF6u8xAxT+sSjT4zkLjgpnsxWWFv4npUu30d+V5Ce0IZ519SQwjVECgnnEVurzgXYBWsql27YeU/fCUcixQyGGSQDVgm/EMjmM7odrEDc8sxgPqVu9ViCG70SI5oi3AKUYRAFBHpUzPN03kX2K+jGENi0003vD85483Q8kFENJFPfGbA22QWN4fkk9UxOnhgHSYTK6jUJGJoyPFUd0RvLbmisKWGO4ReNu2ee8Poero53ikJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjsGH/Pcq3VAwh4gci4CD/GsfykQ3moPsAjSXjg8APE=;
 b=LaFEQQAv5HRZkoR+1E84ka2la6mz9p+dIg5FEv9KVY/duMdoyU5BLyJj1pB2m98eD2Kbfcry0pAfDGxvlSVaKmGAaitbC4Fs8aoDAnJnhZhjViaa/MiYx4RkGfeC8dPhs5kE0MRdtw6EpW6YjPgQPD4EaegcNi4AUeE0jWd/peV4h5jbMYPWuox5LIvNNqn3uexsjdF57psIua97H12zQ7jCq8wgAYeLNlg4stwvScW8/aCLgj/7TG4QgkH9z8ZIVQpt/+LauGgDIlKXYalFpIQUCz+SVH0KxC+KIBtyZIGImHuiKD763qReL4WZin90RoZPj4oVpWfY/JluyUJ7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.17; Tue, 2 Jun 2026 17:46:21 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::4fe4:767e:7ec8:6fd9%5]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:46:19 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.2-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.2-rc1
Thread-Index: AQHc8re42gH6MH010UOag0XR2OMurg==
Date: Tue, 2 Jun 2026 17:46:19 +0000
Message-ID: <d155101fd07aacec65d0168f50df8327f3bc3f34.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.1 (3.60.1-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM3PR11MB8683:EE_
x-ms-office365-filtering-correlation-id: 9de60435-2507-481e-67a9-08dec0cedab3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|11063799006|6133799003|56012099006|38070700021;
x-microsoft-antispam-message-info: /7CK3aBuEBxYXUKGNUWTJi6fI6/5SMVo7MK7Slx7Br7dDAoLsQNKw4EEjHmJP4YxmRIDd0om5WwWxcJy1UHcnARxAyxIQOHpC+y6e9erjysqCz0vr86SMgp+MZoZuKQow0gWq7sk2x/Ot9kfcgtORHl0f77rkxXRbvDCeisyO/FBZTuvVNSqslo0n0Bmty5l6UtYWlfpNUmQsaDDNNNFnGIxA7lglO0vvVRUW4/d2SMF5IAX+hfihtjWa0VE7J/qYDOLeSkFOXXCpam1IV5Sx69F5W9K+BBIfoz5tmOrZti9r5YAOsb7Ku8Jg/JjBjIMirowgQc2LFUs9Upd4VvpSMTofBcMHR6U74AAIOtMwLcrvG5o6WqsVUOhpDGlMc5EKc7XlXy3oZBcuJqfLl/anQ+ez/1x7OYm+CyrgzunfKoGv/hkDtWwgDwI5XBWKMoR37H/RkXtVMRlbm+mZ7pvJjG29z10iMB05wLSLtmzeXYnvtlViovUqJXrfp03tPupUhfwsbUkhpNWsCRcB1X/sTKdTThLVLbJS7n+O9z1kD8i0/cU2wkOsJ/SGjRO3BcvP02cjQ4fRQ1ZrFl/K2IZOP2y/8Lk+JywT+QDK/7joPGUryZ1xF0kJeRatmsvfYPfDSn5QX+IVbsKmybdLVvdsCvh8XH5edoSuvBQ065+IZansqjhuMrB62oFgVRPl8pTq9fVG0EHOHEQrVHXPRROC/hSxYncvsnykkpdFuLLA6NjGgV/r8NcKud/iOnJCKeP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(6133799003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czRSbEZQQ3dUYkJDazVQOHVvRlRQakg5S2tLRC9EM1Vvemp1ajE0UG9yTE9C?=
 =?utf-8?B?TENoQmMvM0gxSlQ4N0FmR2ZPYjhVSkQ1MldhODM3dWJUSFlVaWk3VlhsL2N2?=
 =?utf-8?B?b0MzcVAxcGpRWVE1bzNCeEdId0lFL1ZaenhhWk5OS01lUVExOUFNNk1rVEgw?=
 =?utf-8?B?NzVWaS9MalVsTnZVQzFKZWcxek9LRll1TE11KzVwQnhlZ1VuZkVXV2NNMWI4?=
 =?utf-8?B?NGNKQ1dOcCsxRzNpZFhrZGpjTm1qbjJHMGErUmk4Y0lGMEpGUFBNbkdnM0hl?=
 =?utf-8?B?elVKTXBJdGZKWmtWOUk3QUxPZ2t5bndSMEJ4Q1FYaGJBQ2x1RnJRY0txNWxR?=
 =?utf-8?B?SXFEY0RiMTVEOEdCd2RKeDFvdXRxbEVDejJVS3hzL0plOWRpYnZJUzdKdlU4?=
 =?utf-8?B?TGNwNGZkUm5oNlZxYmkzQ1QvMnk5SStCMUt1VW5Lbi9pMU1LNFhUS3FSVVVW?=
 =?utf-8?B?VEFhemx4bm5TSWt0UDQvaFlFaWdRUjBDeEdEMGNhZkpwaVNkTTVjTy9tSUMr?=
 =?utf-8?B?dzVRczN6UFlWdjdsZjdLb2tRdm9RQnFUMFNPK0dsK2tud08rR1Jmd3F2RXpD?=
 =?utf-8?B?SHk4SGNnREJ6SUNtYTRKditCRXlNOUU0dFZ4aW52NWcvSzQxbFFtVFNoQ3lB?=
 =?utf-8?B?bTl3ZFRBOG9IV3c1RE9jeC9jdHJlZkNKQTVtRVlwL1N5dzBTR0RET01nUFkw?=
 =?utf-8?B?U0hZYXdrcHhpWnNhalpxczBBSkh3cTBqQ0l4VjVTMWxoR1FQVnNIL2pPZHg2?=
 =?utf-8?B?c0E4WDR4L0pKUURQQkpKTVBPLzR2ajNaK0xyYnVlZUNYVkFpVTNUeGNVbitk?=
 =?utf-8?B?YzYwbXBOaUx2WFVjV29tZ3JTcFRCcFQ3djJFM0pTRFR2TjBOQUVsSnJYQk1r?=
 =?utf-8?B?ZzV5OHpPck44R2VBcGNmbERFMVAvMk9mOU00aTlVUGFDR2wwMUJxRXMwa2xL?=
 =?utf-8?B?VVpWdWxzVVF2MnNjdmNZVms5WVRlbUJmNE5LU3F2cmFya1E1bk1TVlVhR2RI?=
 =?utf-8?B?c0JGVkY3NHVQcjBjQk4zUjBHQjBQSU5EbThOTWtLQnhWajc2azd2UzE2Y05x?=
 =?utf-8?B?aVdPVVJLcjF2c2FkL2JuRlhWbUtwbFFUOG9vbndjWnNhL0xUVWFkM0toR2Iz?=
 =?utf-8?B?bk45alpKcW9HeHFaK3kzd0FTQlVIcStsQk50R04rcy9lSG1DNVVPRFhwN1NR?=
 =?utf-8?B?NzFrK1J1NUZDUEdLMUlBYjIzRTlieFNubGxjTkJUdlU2ZmpjaWwzcDlDakUy?=
 =?utf-8?B?M1p5UzBoK2lwcnhUcmVjeG00MHhIMWNsVGdOcitEOEp6T0FISjJoWDFuZzFj?=
 =?utf-8?B?NFNlbzFWMzJRSHIxdUFVRVU4VHE2WFhWV1J1Y0QyaDJ0WUtPOEg5OWtOSlBq?=
 =?utf-8?B?Zzl0aFM2UXkxQUhEZkd6SXA2d0VvMWpNODZGcUQ2ZmZYbWVzZFRBL3Iycm1Z?=
 =?utf-8?B?N1FlTWNrTkNIcWVnREo3cllPcXF3SkVBN3ZhNnBVcW82SHVzREdvWHgvRVVO?=
 =?utf-8?B?OHRNdnZSL05VL2hUeHZhV0hOVVlxcDlLck1lNzJreENEL0JJbTIrNDFsc2VO?=
 =?utf-8?B?TTBESFh6dzQ3Y01QanU2R3NteG1mZWhFaVhBa1AxYllSZ0lUYXNTdkNaVTh4?=
 =?utf-8?B?YkxlbnVzUjZrbFpSeUhRVWpGUEJwdFprWFJ6bUNpWUhGT3NJdnNDRVVSVmtN?=
 =?utf-8?B?N0hGRUJyV2ZvUUJzL2xZS3dQdjQrd1V5bU1YbjhPUDF1ay8zL2tnOXAycUU5?=
 =?utf-8?B?NG5hQWlpd291OEF6R1A3N1piTjhKZWNHWnJoK3RvSzZVbG1rMTBIL3FtWlFi?=
 =?utf-8?B?c0R0UlVkRFR4cnd5bjA0T1J0bHYzYlFLK1lwb0QzODRwNXV1QkRIM052MWV2?=
 =?utf-8?B?dlpOYXdGMDdtZUNxNDg5ZkdFbmpLTFZrc3lEaFplMjNVc2tRTTl6UDNRcHcw?=
 =?utf-8?B?ZmVQZEFUVC9OazlzbzB5R01nMUYrR2NWd1d4Sm1PYnJOS01CNFZJY1p6czN6?=
 =?utf-8?B?bHJLSXBpTVFZcWZNR0FJVTRWODVqWWJVRit1dkZWSmVKZC9hVGZoNm8rcjE2?=
 =?utf-8?B?c0Vva2c3OTd2Qmc0dm9vdWpGSjkyai9VbStYZDJRMUhJOGtSTFdvNlc4eEV2?=
 =?utf-8?B?U3oxcmdjQ2YzSUNpaHFUK0RYaDFxZFAyek9NaGFEeXhURiswaEtIWStkVUIz?=
 =?utf-8?B?MllCM21uWVRxdTBYNnFTMmZHMVdMNVBDRnRWK0VjeFBjQjJXN0RMdDY2a0Vh?=
 =?utf-8?B?QXVneU5YWEtFYk1WeGEra0hQbUJwSHl5SjdTbm1sdDVvTWJQUXJTeld6YXpq?=
 =?utf-8?B?WXRDOGtzK2VYbGRtWVI5eTRYc0QwbGd4MHFEb0FBQTVTRkRXS3Y2RUVOc0Ux?=
 =?utf-8?Q?vtlY5rz/RctOIHe/M+IDFxwjroZ59BUAfqAxR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE551662B8C0E14C896EA6AAD542BFF0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NHcqpwTI/X07eE3gJWK2yK1EjJklOmglihVCMcJlIorw+k70F8DvWpsDLUU5Naej6AvUeOFWWiJapYrk05pyVvh0oCnes2KSosoxybsVmnQs8lwqxOwTCN14rQ0m6C0uAHEQ3XwRCKxlzOAbNht19DSfbVg+0NA/xJFxmO0fYJwmn6cPwkV8e5fW+2SKxeXXAoC5CTn8oMYKF78ryIP7wpRLqb6A7298GtrR5WfKi4YH3z5eHnUr0h8wbvBSqkYgVACU6nT/7GPdtnq/Ge2HKiNnuIMDKV7dhlCVgY/qW21o5nIjZ925afBFv8Dpds+HnEKzXtD46SetNeGG9mLGug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de60435-2507-481e-67a9-08dec0cedab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 17:46:19.7725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xUARcEzvmn4a17kg1fx0YT8vDjdQRygMG6rRtRuV2EoSgQkls4bOjmVB2ct/kTLUvvl2O+mE7/2I2yd5lAB8zskRsZP4M/2ZloDPhsEfcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBzOi8va2VybmVs
Lmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3Jt
LWRyaXZlcnMteDg2DQpmb3ItbmV4dA0KDQphcyBvZiB0b2RheQ0KDQpUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0DQphMTY3YWU4ZWFjZTUyZGQ2YzgwNDM4Yjc3ZDkyNDUwZmUxMmNk
NGJlOg0KDQogIHBsYXRmb3JtL3N1cmZhY2U6IFNBTTogQWRkIHN1cHBvcnQgZm9yIFN1cmZhY2Ug
UHJvIDEyaW4gKDIwMjYtMDUtMjgNCjE2OjQwOjM5ICswMzAwKQ0KDQphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZh
ZGEvbGludXgta2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvDQo2MDdhZjQzOGU2NDMwODkzYTgyMjk2NGM4NDFhMTk5NGIzM2FjY2NjOg0KDQogIHRv
b2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEhhcmRlbiBkYWVtb24gcGlkZmlsZSBv
cGVuICgyMDI2LQ0KMDYtMDIgMTA6Mzk6NDUgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkFsaSBBaG1ldCBN
RU1JUyAoMSk6DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBIYXJk
ZW4gZGFlbW9uIHBpZGZpbGUgb3Blbg0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdC9pc3N0LWRhZW1vbi5jIHwgOSArKysrKysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNClRoYW5rcywNClNyaW5pdmFzDQo=
