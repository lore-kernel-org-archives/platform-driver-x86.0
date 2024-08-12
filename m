Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4FC189BA2
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723482853; cv=fail; b=fIfgJt9es0KoXboAW5mR1GnUvqk3ORdcaxXejC5dIiQEvgSA1jbtzvREUxjBkQqTxWJJcgm2UdlbnF2tOYuRf4ijkaA2tnK+YzZjBQkUpM02hNDBAV5t5IfczLJq7iNY5y2JlCsQ/W8lfNXh/xvm5PVTwX+2Lf0fiA5YYv5nLNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723482853; c=relaxed/simple;
	bh=nCFfnE/BLIZbhVCH0QxNuxh8ZHAF9a3tNBNaQvDWtps=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A0kgFw0bMtapvINyZgqrNzGZubR3e5EQtrxSewWN0zO6DSotLsM7iYYOoYanY8rA6byEFNUIDuuapudypioOUVMAoCwL3JNu6oJz65uw0AFj/0/C/skrzcq3gDpkH3fL4RmbKhM83b9zfTSGOtDlHP0/+X6a2l8/1P8hmiHCu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU15SyqJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU15SyqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723482851; x=1755018851;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nCFfnE/BLIZbhVCH0QxNuxh8ZHAF9a3tNBNaQvDWtps=;
  b=hU15SyqJQ+otoT+zeC+jUxgT6ZM5rJDSUdOwZbflZL/GNYPh47bJr6MB
   Y0GOv4O/utAgcMmYTc4mx7K8UC9BavFlf8/5MVoig1yZ+uawJBAbQG7q5
   VKmZ2vbFNsKBl3kbecpN6WpaljUxl+AL1DPoOABcnlqaRTV5kwf4j5qrN
   g10l90KB8ft4i7fir9xT7aEjrsHCA/tPW/d/rMnHty1b8uU3SdPWZJme/
   2rqa0nT7PXBivLmq1A6F4vi6NBwslFZ8GgNNTdl4lRNuRIBGfjEQMuNhC
   zJdiVNayQgaLETNcYGZMDbc42nkk5iTOptY/X9VKw83UjM4cGWiIQ3lBV
   A==;
X-CSE-ConnectionGUID: aL/g3i12QX6oOhVQ1IOORQ==
X-CSE-MsgGUID: T3700u+LS6C3jFD3aKC/oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21772631"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21772631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:14:06 -0700
X-CSE-ConnectionGUID: uORL49yZTN2E22AqqL9D6g==
X-CSE-MsgGUID: p5mvDbMGQj6yxv6ED3bxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="95844892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 10:14:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 10:14:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 10:14:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 10:14:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 10:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU/77Fi/15/lRSBPUwjkTXzNwXSWy6OWOurOYi2Hbpw0Fz4YClwwA4w9zILSyOw+dX9cBb9J6mDEjtVjGznYarSc+exfRN3q9xLEQcAr5ZAJryXEXN3plmkjMYJkUQZi8U83uhOLNBqZRrHHJJ5ST9G8Q8wmm12Zk9bOVnX1azZfzFsWVf8rgciX1H7RLeIxoU0qHuU1ZB7oeGXnQ2sIQs9DmsJXr8sGU+mVqPGvMoBAqGwAn5L2xVohPNuzYaYfDvMmUc5r5AoQuqGgyGDttGxGEdIn5gzBGjhh7RYlN3u4BDWXStRVVo97khQDqqNubRWRqlV2UHFQmwgKQvTovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCFfnE/BLIZbhVCH0QxNuxh8ZHAF9a3tNBNaQvDWtps=;
 b=Qg+DlGMG/zrPXTeGBbdnDWZWcwE8LSF8t9d70XOhUrijfKyzdwrerrFUCOOabPYHJJUKxZQJx2ObUj/NjewIW2i8gh4g97GTlb/M7PDwaiXpH3yRbup+6fLR8IdGW2E8FhmSlT/gx9SthGV4YyOlDWhk3PJUAdrsdbzRDNBR7OcPj5sOrBx8Tr51RGpiyfeR6i2ADMrSR6aKfwbEvL+X7jhCIQOfhaaiL3TqMTayXjqBl4G7msgIiDjyPq22VQ04C5e1T1VK9lFZTl+98+sCJn3ZpOEX9lBpVGzJESa55bpPTpK8BxmBoH1JI1PyOeIT88DQaxLfJv/h+YgcQKpX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 17:14:02 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 17:14:02 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v9 4/6] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v9 4/6] drm/xe/vsec: Support BMG devices
Thread-Index: AQHa3o2VIkNiKzlGfEykVibZDVBG1rIjb04AgABqkrA=
Date: Mon, 12 Aug 2024 17:14:02 +0000
Message-ID: <IA1PR11MB6418257160238B6457AF1E7DC1852@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
 <20240725122346.4063913-5-michael.j.ruhl@intel.com>
 <0b6c37b3-297c-46f9-c0d9-b930d466744c@linux.intel.com>
In-Reply-To: <0b6c37b3-297c-46f9-c0d9-b930d466744c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB8273:EE_
x-ms-office365-filtering-correlation-id: d89b496c-2051-41f4-0657-08dcbaf22996
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2pvWi9VTDNmQXVBblMvNkQ3Zy9pTk8yNDlkQlNaQjRtSkJENzFOek41UGZQ?=
 =?utf-8?B?YjNmRUZlR1AyRHEyVE5BR3RIcjlUbVBxV21nQTFWVUp4akthR2EwRUpFa1hi?=
 =?utf-8?B?cmw1U3hlSTJDK2RnMXJkK1NjUXBaQnRxZnhRemlsa2t1enBtVWFLNk9RYWhr?=
 =?utf-8?B?NmcyUzFieUVxSHZIWitiZmVDUVlSdkdmVzY3NksyRjhtNUU2MFZhVE1SeDVO?=
 =?utf-8?B?Z0Z1QXdRQmdjWUUrRGVneHlJampzUlVaKy9XcTdPZFRPMVpTNzlTV012TGFl?=
 =?utf-8?B?TEdoNEpBODFzcTRUNk05dkNWeFJBc3NtYjMzbjVxd0hKRVhmRjNBaE5HOVBB?=
 =?utf-8?B?RTU3Wm1pYk5STklwMHB1TmtrcFZUZmRZc0lDQ2pSYytYeFVhaUhOa2MvM21U?=
 =?utf-8?B?RUtVQnlkczZTMERLMFE3VTIvYXdFMU5jZjFSOEVydHNzQklOWHF4ZStBZHlu?=
 =?utf-8?B?STRIZEltV0hiUGlPdE9IbFpXOVBvNEw4Z0t0YnBSeWk2Sk9aNHRpOFdOdE4z?=
 =?utf-8?B?SlI5QTFBUUl0NXFuNHFKaGc5aVk1RDFKRmpja1A5NEdCcVloeU5iSkZwYUJt?=
 =?utf-8?B?OVJnYldyL01aUHFzMC94Z2lOc1g3YmpIcWZnTERTNHVrNFFsM3hCUnJaanh2?=
 =?utf-8?B?eW92djZmTVJhQlFucmswQm55S3VJc25kcjlpamJhbENjeWVzVm5TZzlEdUlx?=
 =?utf-8?B?ZmttTnBibTg0T2xHcC9ScTRWcDA2YzNiYVh1Y1hrRE1pOUUvbmZETHkzTUZ0?=
 =?utf-8?B?OSsrSkcvTWVMNXFlRGNSWGduTndvVlh3V0xtWW5XRFhNTGdsMnVxRlJ6dGpQ?=
 =?utf-8?B?bVpEWU1CcHZ2NXFESzYvYVdzOTN4Y2FBZ0lxT3BoTUI1ZkZsUmE0MVZUVXg2?=
 =?utf-8?B?UjBpeHVSdFpZNFlWMnNxanhSZ01EZGJnaFJnMWNQaXlxamxtcUJVd25kSVBK?=
 =?utf-8?B?TmJPaVh0WEIxSW51OWFBTktieGJHNDk2WklONDBCekh6dk5FRVVDcTNXaHRV?=
 =?utf-8?B?c3JkUytHaGNiRWkrUkttQW5neDFSWXQvYncxaStLR0lDYmdGWUhRS2NQc0sx?=
 =?utf-8?B?NkIvVjNsZkZKNk1TMktDR1I4UnkrdFVzY3JnS0YzZ1lMcDY3MjVUSGpSUTEy?=
 =?utf-8?B?OVAwV3pWRjVpR1ZHR1Z5TjQ3MUYyRnkwbDlpRXB6UzRuY1J5emw4SklzbDls?=
 =?utf-8?B?eGxvTWY5amlPM3o0RVovbHBSVFpQTUhuQmtrMVk2d1JXUFQycURJbXQ4VGFL?=
 =?utf-8?B?OTlBM2xYMmZBYU16SFZSQmtSbWVxMjZjWURxOEdiaW9jUHo2WjZYYWwzbjBw?=
 =?utf-8?B?V2QvQjVXU29MbFZSbzA5MTNsS1VrMDdUaHM1dFVLUEJVWlE2VXVyVG5tdGZQ?=
 =?utf-8?B?Ny9SZXQrYW1LMXRTR2dwMU1JTTRINlNwREhWdEJ5bU1QVXhpNEZjYzY1M0Zj?=
 =?utf-8?B?MGdoUDlTcnppQTNkUzF0eTA0eUZIOVZrcHVIc0Q4U3JLNGorQ3V1MmZQQjAx?=
 =?utf-8?B?WFgvQ0MrZ0tvdGFJcmxpOEV1Y0xPNVc0SmVKRTFaQWtCRFRCZ3ZFQmZtZWx6?=
 =?utf-8?B?YXNraVdJODRxVEhhSWN2N09sdkdmcHBMVTZZeHBYUnI1VXIvUzMrSTdLTkw3?=
 =?utf-8?B?bnNQQjZJbExkWkZPV09MamNGRkNWWm9FditCeFMzK2VBRXlpMWVRam9adWRq?=
 =?utf-8?B?eVAwZjYzbGI5amRRSm9Hd3pJeno1SVlhWERtL2s3NlJLcWRHQUtEQTMvMWlR?=
 =?utf-8?B?Mlh1NGtBVXdrbEd3dGd3eFJIbFI4dVVOQk0zSDFrQ2tVc1lOU0ZjVWxLZksx?=
 =?utf-8?B?dWY3UkttNk10RFVlNlpwWW5jNmg5MmQwNnMyT0xFQ0xYbzl6MUtvRUtZLzhy?=
 =?utf-8?B?V0h6ZjBoNnVmSjJlOTZrQm9MN3NuSTE0cFVQS1hyOW9VNXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZRdWFvdkNVbVBNWVZubC9KdUZjMHZYbkpIa1A5M2o5UHBWbGNpbCtvR2Z0?=
 =?utf-8?B?T2ROOXNqcFMvK3BkOE5sVUpLSW9zOTNFZTUyeDNkeVg0MzhzUEMyWFNkLzhj?=
 =?utf-8?B?d2RNaUZNRGhzZEdXenFKTEhhb3NUdDhiY3VndjV1SEN6QWp4R1VjTGYyZnVC?=
 =?utf-8?B?SVJDSXBmSXZuVk9xakVuVmh5YlZKQXM2UDNvVzh6WWkzMXlIVFlhYWp2NnBK?=
 =?utf-8?B?TEs4dXdwbGpqS05OeVNLQlI1dmJZMnZEd09QU3NoNzk2TUQyYzBBcFBBWGtj?=
 =?utf-8?B?WnA0K3cxL2FkL3dFUmRSN0Y3eFRDWFBRTTA1M3ZPUUd0WXJqdTBqZFg1VXdI?=
 =?utf-8?B?a1pZSnZYcWpHQTh6b0ZvTGRCbVRpYk9wUDF6aVA4YUcvU05Vek9XaUF0VTE2?=
 =?utf-8?B?b3RCYUltd0dyRy80SEhlQnFxWnpmcjcrdEMxUG9kR1ZzS09tSUZHY0hubm4z?=
 =?utf-8?B?Z2hMeWpMMlBUcFlTdEhvbzVodzFVMEp6STJ0UXJQaExPQmlsbkRWNm5xSU9a?=
 =?utf-8?B?NmNzbjZmc2lSR3pydW9EdjJJWk1DM3grQlg2SGh2TEY0SVYxME01dEN3K08r?=
 =?utf-8?B?NmViUjJqTk9FWmwveWsxSHc4R2UyOWdIMW1JSmMvWFp1bGNWVzBrZ2R0ekRS?=
 =?utf-8?B?NHRPTXlSTWJhK1pkVVlCMlA5eEk2SUswUWM3SUFrSExtdkpjMjlCVW9GclRX?=
 =?utf-8?B?OW9Ud2xsSEJBNUUzb1kyZzF0YTRYL3JlY0t2U25GbWUzT0h6OTFsZVNsN1d0?=
 =?utf-8?B?MnU0WGNsbkI1cGkxVlhaajhpWU55dk5NL215ZXlPcDVRd3ZNSy9hQkpZcHZu?=
 =?utf-8?B?cTcrZWZwUWljcm9tRVBUTUFHR3hFWm9UUkJlbVZnMnlSZXNPVUxVb2tzTHdS?=
 =?utf-8?B?eThkOHV2T3ZoNUlycmJyai8xTWdUNjJ1Z2ovdk1WelRzMGYwTTcwcDlaWi9K?=
 =?utf-8?B?MVd6Q1ZZY0V1bEdyblFWYTlCRUNEYUdTVkY3bWdMUWUvczNpSHp4Vm1PaSt5?=
 =?utf-8?B?Z1c0Tm1ROWxMdHVIVWZub2NQTUw4eHJhMDBiOU4wcVI3TTladmNTNmpZSHVj?=
 =?utf-8?B?bkFXY0p4eTZiMXFDdGZMVXRGeU4vcG5JWDlseDdjd2FnZmpOWTlLWEQ1Qlkv?=
 =?utf-8?B?SFpsWnFJemhFM1BrVGpGRzlLWXErR1JQelp0YVkyUU53blJzRE5JT0RJY1Qz?=
 =?utf-8?B?Uyt4WmppVldFU3NDOXVtK1NkUjhwWSt1UWZCTGYvOWZSSk82TXBTV01qS3R5?=
 =?utf-8?B?MVVyc0dubkJQNnFJQm1uUDEvZ3h5ejZJOGY5RkdIVEEwVXduUGlobGxoMnhW?=
 =?utf-8?B?dSt0MXZwc0RiK1ZISis3VGo0Wm1WTHlTL1Y4TC80bDF4SXdWWjZJbUFGZzZT?=
 =?utf-8?B?blgxS3VCZzhIcHFrOFNmazN5c3hNcTFxOXg2MlkyMUp6VjIzTlplNUVGL0pT?=
 =?utf-8?B?UnYrYTRqbmJLTUtYRFJGL2xXVUdTdCtWNGkwbndqSXZFZHczanIzTlNhZVBa?=
 =?utf-8?B?ZG5wQ1g0VU16am5pUTNZeDQyM2Y4S3A4MFJIZGxaWTFDYlhzZUJaRVllZlpl?=
 =?utf-8?B?UXp0QVFEcFV6WlVhemtZQ0ltWTlEOXR4dXBlWSt4ZHlVSXJ2bFlEb2pKcVhx?=
 =?utf-8?B?eEduNXRhcGxZeXNVbStTZzZ5cTdvTmxLRzZmVFRDZTBRbEFBcW82MjdXNzR1?=
 =?utf-8?B?N1VoTU5mb2ZUVFd5aGV5VTBNcjBwbU55cEpDVS96QU12cFJ6UjBpWElXZzBv?=
 =?utf-8?B?L0VNQnVPNEltTk1HVC9hdXg2UVQ4NVdiSmY5Q25KQTViblVzM2ZIN09ROXgv?=
 =?utf-8?B?WnkzeXRhVVExS2l0MmNRM2hDMDJkaytLZWd3S3lVQUsvcXJiOFRGZnlmQTVX?=
 =?utf-8?B?akFiSjNTL1MzQWM2UHBiN2twcUhVUkQ3dlpPOTlmVGtmN3IxbnVsRVdCR0Fp?=
 =?utf-8?B?Y3BoMmNseThPODBCMVVRekppMmYxU0hOcGhHa0lwUXM0SXFaYzZwN1Q5TW5l?=
 =?utf-8?B?djlQVDYranl4dXRqWFVRUEhMS1NWM3JjMWgzQTh5VEdNQ1YvczAzL0lIdXZw?=
 =?utf-8?B?N1laK2lCdUFRSm5SUDZEU2ZqYmlOdWRValRtYVVwc0RjOEc4ZmFFZUFWZjNt?=
 =?utf-8?Q?rnwHGob5hmZL4ouYHiOwd+8ow?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89b496c-2051-41f4-0657-08dcbaf22996
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 17:14:02.1882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 104GZJN/WFYnGCgaSaHRBXMXh6OUQ5EP59xuU57k4fur3Uo9mqWMTyfQCMJCoWP2E8dK0dxk57LogeOEZq93pEdU+REhqzE21KvRxlo2kvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IElscG8gSsOkcnZpbmVuIDxp
bHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMTIs
IDIwMjQgNTowMSBBTQ0KPiBUbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHBsYXRmb3JtLWRy
aXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBkYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb207
IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47DQo+IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbw0K
PiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSA0LzZd
IGRybS94ZS92c2VjOiBTdXBwb3J0IEJNRyBkZXZpY2VzDQo+IA0KPiBPbiBUaHUsIDI1IEp1bCAy
MDI0LCBNaWNoYWVsIEouIFJ1aGwgd3JvdGU6DQo+IA0KPiA+IFV0aWxpemUgdGhlIFBNVCBjYWxs
YmFjayBBUEkgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBCTUcgZGV2aWNlcy4NCj4gDQo+IFRoZSBz
aG9ydGxvZyBhbmQgY29tbWl0IG1lc3NhZ2UgYXJlIGEgYml0IHRlcnNlIG9uIGRldGFpbHMgd2hh
dCB0aGlzIGNoYW5nZSBpcw0KPiBhYm91dCwgaXQncyBhbGwgaGlkZGVuIGludG8gdGhlIGFjcm9u
eW1zIDotKS4NCj4gDQo+ID4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwu
ai5ydWhsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92c2VjLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMg
bmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgNCj4gPiAwMDAwMDAwMDAwMDAuLjJjOTY3YWFhNDA3
Mg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNl
Yy5jDQo+ID4gQEAgLTAsMCArMSwyMjIgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjIgLSAyMDI0IElu
dGVsIENvcnBvcmF0aW9uICAqLyAjaW5jbHVkZQ0KPiA+ICs8bGludXgvYml0ZmllbGQuaD4gI2lu
Y2x1ZGUgPGxpbnV4L2JpdHMuaD4gI2luY2x1ZGUNCj4gPiArPGxpbnV4L2ludGVsX3ZzZWMuaD4g
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPiAjaW5jbHVkZQ0KPiA+ICs8bGludXgvbXV0ZXguaD4g
I2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgInhlX2RldmljZS5o
Ig0KPiA+ICsjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9k
cnYuaCINCj4gPiArI2luY2x1ZGUgInhlX21taW8uaCINCj4gPiArI2luY2x1ZGUgInhlX3BsYXRm
b3JtX3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9wbS5oIg0KPiA+ICsjaW5jbHVkZSAieGVf
dnNlYy5oIg0KPiA+ICsNCj4gPiArI2RlZmluZSBTT0NfQkFTRQkJMHgyODAwMDANCj4gPiArDQo+
ID4gKyNkZWZpbmUgQk1HX1BNVF9CQVNFCQkweERCMDAwDQo+ID4gKyNkZWZpbmUgQk1HX0RJU0NP
VkVSWV9PRkZTRVQJKFNPQ19CQVNFICsgQk1HX1BNVF9CQVNFKQ0KPiA+ICsNCj4gPiArI2RlZmlu
ZSBCTUdfVEVMRU1FVFJZX0JBU0UJMHhFMDAwMA0KPiA+ICsjZGVmaW5lIEJNR19URUxFTUVUUllf
T0ZGU0VUCShTT0NfQkFTRSArIEJNR19URUxFTUVUUllfQkFTRSkNCj4gPiArDQo+ID4gKyNkZWZp
bmUgQk1HX0RFVklDRV9JRCAweEUyRjgNCj4gPiArDQo+ID4gKyNkZWZpbmUgR0ZYX0JBUgkJCTAN
Cj4gPiArDQo+ID4gKyNkZWZpbmUgU0dfUkVNQVBfSU5ERVgxCQlYRV9SRUcoU09DX0JBU0UgKyAw
eDA4KQ0KPiA+ICsjZGVmaW5lIFNHX1JFTUFQX0JJVFMJCUdFTk1BU0soMzEsIDI0KQ0KPiA+ICsN
Cj4gPiArc3RhdGljIHN0cnVjdCBpbnRlbF92c2VjX2hlYWRlciBibWdfdGVsZW1ldHJ5ID0gew0K
PiA+ICsJLmxlbmd0aCA9IDB4MTAsDQo+ID4gKwkuaWQgPSBWU0VDX0lEX1RFTEVNRVRSWSwNCj4g
PiArCS5udW1fZW50cmllcyA9IDIsDQo+ID4gKwkuZW50cnlfc2l6ZSA9IDQsDQo+ID4gKwkudGJp
ciA9IEdGWF9CQVIsDQo+ID4gKwkub2Zmc2V0ID0gQk1HX0RJU0NPVkVSWV9PRkZTRVQsDQo+ID4g
K307DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGludGVsX3ZzZWNfaGVhZGVyICpibWdfY2Fw
YWJpbGl0aWVzW10gPSB7DQo+ID4gKwkmYm1nX3RlbGVtZXRyeSwNCj4gPiArCU5VTEwNCj4gPiAr
fTsNCj4gPiArDQo+ID4gK2VudW0geGVfdnNlYyB7DQo+ID4gKwlYRV9WU0VDX1VOS05PV04gPSAw
LA0KPiA+ICsJWEVfVlNFQ19CTUcsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0
IGludGVsX3ZzZWNfcGxhdGZvcm1faW5mbyB4ZV92c2VjX2luZm9bXSA9IHsNCj4gPiArCVtYRV9W
U0VDX0JNR10gPSB7DQo+ID4gKwkJLmNhcHMgPSBWU0VDX0NBUF9URUxFTUVUUlksDQo+ID4gKwkJ
LmhlYWRlcnMgPSBibWdfY2FwYWJpbGl0aWVzLA0KPiA+ICsJfSwNCj4gPiArCXsgfQ0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogVGhlIEdVSUQgd2lsbCBoYXZlIHRoZSBmb2xsb3dp
bmcgYml0cyB0byBkZWNvZGU6DQo+ID4gKyAqDQo+ID4gKyAqIFgoNGJpdHMpIC0ge1RlbGVtZXRy
eSBzcGFjZSBpdGVyYXRpb24gbnVtYmVyICgwLDEsLi4pfQ0KPiA+ICsgKiBYKDRiaXRzKSAtIFNl
Z21lbnQgKFNFR01FTlRfSU5ERVBFTkRFTlQtMCwgQ2xpZW50LTEsIFNlcnZlci0yKQ0KPiA+ICsg
KiBYKDRiaXRzKSAtIFNPQ19TS1UNCj4gPiArICogWFhYWCgxNmJpdHMp4oCTIERldmljZSBJRCDi
gJMgY2hhbmdlcyBmb3IgZWFjaCBkb3duIGJpbiBTS1XigJlzDQo+ID4gKyAqIFgoMmJpdHMpIC0g
Q2FwYWJpbGl0eSBUeXBlIChDcmFzaGxvZy0wLCBUZWxlbWV0cnkgQWdncmVnYXRvci0xLA0KPiA+
ICtXYXRjaGVyLTIpDQo+ID4gKyAqIFgoMmJpdHMpIC0gUmVjb3JkLUlEICgwLVBVTklULCAxLU9P
Qk1TTV8wLCAyLU9PQk1TTV8xKSAgKi8NCj4gPiArI2RlZmluZSBHVUlEX1RFTEVNX0lURVJBVElP
TglHRU5NQVNLKDMsIDApDQo+ID4gKyNkZWZpbmUgR1VJRF9TRUdNRU5UCQlHRU5NQVNLKDcsIDQp
DQo+ID4gKyNkZWZpbmUgR1VJRF9TT0NfU0tVCQlHRU5NQVNLKDExLCA4KQ0KPiA+ICsjZGVmaW5l
IEdVSURfREVWSUNFX0lECQlHRU5NQVNLKDI3LCAxMikNCj4gPiArI2RlZmluZSBHVUlEX0NBUF9U
WVBFCQlHRU5NQVNLKDI5LCAyOCkNCj4gPiArI2RlZmluZSBHVUlEX1JFQ09SRF9JRAkJR0VOTUFT
SygzMSwgMzApDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFBVTklUX1RFTEVNRVRSWV9PRkZTRVQJCTB4
MDIwMA0KPiA+ICsjZGVmaW5lIFBVTklUX1dBVENIRVJfT0ZGU0VUCQkweDE0QTANCj4gPiArI2Rl
ZmluZSBPT0JNU01fMF9XQVRDSEVSX09GRlNFVAkJMHgxOEQ4DQo+ID4gKyNkZWZpbmUgT09CTVNN
XzFfVEVMRU1FVFJZX09GRlNFVAkweDEwMDANCj4gPiArDQo+ID4gK2VudW0gcmVjb3JkX2lkIHsN
Cj4gPiArCVBVTklULA0KPiA+ICsJT09CTVNNXzAsDQo+ID4gKwlPT0JNU01fMQ0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArZW51bSBjYXBhYmlsaXR5IHsNCj4gPiArCUNSQVNITE9HLA0KPiA+ICsJVEVM
RU1FVFJZLA0KPiA+ICsJV0FUQ0hFUg0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBn
dWlkX2RlY29kZSh1MzIgZ3VpZCwgaW50ICppbmRleCwgdTMyICpvZmZzZXQpIHsNCj4gPiArCXUz
MiByZWNvcmRfaWQgPSBGSUVMRF9HRVQoR1VJRF9SRUNPUkRfSUQsIGd1aWQpOw0KPiA+ICsJdTMy
IGNhcF90eXBlICA9IEZJRUxEX0dFVChHVUlEX0NBUF9UWVBFLCBndWlkKTsNCj4gPiArCXUzMiBk
ZXZpY2VfaWQgPSBGSUVMRF9HRVQoR1VJRF9ERVZJQ0VfSUQsIGd1aWQpOw0KPiA+ICsNCj4gPiAr
CWlmIChkZXZpY2VfaWQgIT0gQk1HX0RFVklDRV9JRCkNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsN
Cj4gPiArDQo+ID4gKwlpZiAocmVjb3JkX2lkID4gT09CTVNNXzEgfHwgY2FwX3R5cGUgPiBXQVRD
SEVSKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArCSpvZmZzZXQgPSAwOw0K
PiA+ICsNCj4gPiArCWlmIChjYXBfdHlwZSA9PSBDUkFTSExPRykgew0KPiA+ICsJCSppbmRleCA9
IHJlY29yZF9pZCA9PSBQVU5JVCA/IDIgOiA0Ow0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXN3aXRjaCAocmVjb3JkX2lkKSB7DQo+ID4gKwljYXNlIFBVTklUOg0KPiA+
ICsJCSppbmRleCA9IDA7DQo+ID4gKwkJaWYgKGNhcF90eXBlID09IFRFTEVNRVRSWSkNCj4gPiAr
CQkJKm9mZnNldCA9IFBVTklUX1RFTEVNRVRSWV9PRkZTRVQ7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJ
CQkqb2Zmc2V0ID0gUFVOSVRfV0FUQ0hFUl9PRkZTRVQ7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKw0K
PiA+ICsJY2FzZSBPT0JNU01fMDoNCj4gPiArCQkqaW5kZXggPSAxOw0KPiA+ICsJCWlmIChjYXBf
dHlwZSA9PSBXQVRDSEVSKQ0KPiA+ICsJCQkqb2Zmc2V0ID0gT09CTVNNXzBfV0FUQ0hFUl9PRkZT
RVQ7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKw0KPiA+ICsJY2FzZSBPT0JNU01fMToNCj4gPiArCQkq
aW5kZXggPSAxOw0KPiA+ICsJCWlmIChjYXBfdHlwZSA9PSBURUxFTUVUUlkpDQo+ID4gKwkJCSpv
ZmZzZXQgPSBPT0JNU01fMV9URUxFTUVUUllfT0ZGU0VUOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IHhlX3BtdF90ZWxlbV9yZWFkKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1MzIgZ3VpZCwgdTY0DQo+
ID4gKypkYXRhLCB1MzIgY291bnQpIHsNCj4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gcGRl
dl90b194ZV9kZXZpY2UocGRldik7DQo+ID4gKwl2b2lkIF9faW9tZW0gKnRlbGVtX2FkZHIgPSB4
ZS0+bW1pby5yZWdzICsNCj4gQk1HX1RFTEVNRVRSWV9PRkZTRVQ7DQo+ID4gKwl1MzIgbWVtX3Jl
Z2lvbjsNCj4gPiArCXUzMiBvZmZzZXQ7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJl
dCA9IGd1aWRfZGVjb2RlKGd1aWQsICZtZW1fcmVnaW9uLCAmb2Zmc2V0KTsNCj4gPiArCWlmIChy
ZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwl0ZWxlbV9hZGRyICs9IG9mZnNl
dDsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZ4ZS0+cG10LmxvY2spOw0KPiA+ICsNCj4gPiAr
CS8qIGluZGljYXRlIHRoYXQgd2UgYXJlIG5vdCBhdCBhbiBhcHByb3ByaWF0ZSBwb3dlciBsZXZl
bCAqLw0KPiA+ICsJcmV0ID0gLUVOT0RBVEE7DQo+ID4gKwlpZiAoeGVfcG1fcnVudGltZV9nZXRf
aWZfYWN0aXZlKHhlKSA+IDApIHsNCj4gDQo+IHhlX3BtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSgp
IHJldHVybnMgYm9vbCBzbyA+IDAgbG9va3Mgb2RkLiBJbiBmYWN0LCBhY3RpdmUgPg0KPiAwIGNv
bXBhcmUgaXMgYWxyZWFkeSBkb25lIGJ5IHRoYXQgY2FsbGVkIGZ1bmN0aW9uIHNvIHBlcmhhcHMg
eW91IG1peGVkIHVwDQo+IHdoYXQga2luZCBvZiB2YWx1ZSBpcyByZXR1cm5lZCBieSB4ZV9wbV9y
dW50aW1lX2dldF9pZl9hY3RpdmUoKS4NCg0KSGkgSWxwbywNCg0KWXVwLCB0aGUgdW5kZXJseWlu
ZyBwbV9ydW50aW1lX3h4eCBjYWxsIGNhbiByZXR1cm4gYW4gZXJyb3IuLi5hbmQgSSBtaXNzZWQg
dGhlIGJvb2wNCmNvbnZlcnNpb24uICBJIHdpbGwgdXBkYXRlLg0KIA0KPiBBbHNvLCBJJ2QgcmVz
dHJ1Y3R1cmUgdGhpcyBsb2dpYyB3aXRoIGd1YXJkICYgdXNlIG9mIHJldmVyc2UgbG9naWMuDQo+
IA0KPiAJZ3VhcmQobXV0ZXgpKCZ4ZS0+cG10LmxvY2spOw0KPiANCj4gCS8qIGluZGljYXRlIHRo
YXQgd2UgYXJlIG5vdCBhdCBhbiBhcHByb3ByaWF0ZSBwb3dlciBsZXZlbCAqLw0KPiAJaWYgKCF4
ZV9wbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoeGUpKQ0KPiAJCXJldHVybiAtRU5PREFUQTsNCj4g
DQo+IAkuLi4gdGhlIHJlc3Qgb2YgdGhlIGNvZGUgZGUtaW5kZW50ZWQgYnkgb25lIGxldmVsICht
aW51cyB0aGUNCj4gCW11dGV4X3VubG9jaygpIHdoaWNoIGlzIG5vIGxvbmdlciBuZWVkZWQgYmVj
YXVzZSBndWFyZCgpIGlzIHVzZWQpLg0KPiANCj4gV2l0aCB0aG9zZSBmaXhlZCwgSSB0aGluayB0
aGlzIG9uZSBpcyByZWFkeSB0byBnbyBzbyBhZnRlciBmaXhpbmcsIHBsZWFzZQ0KPiBhZGQ6DQo+
IA0KPiBSZXZpZXdlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KDQpUaGUgZ3VhcmQgaXMgbmV3IHRvIG1lLiAgSSB3aWxsIGdldCB0aGlzIHVwZGF0
ZWQuDQoNClRoYW5rIHlvdSENCg0KTQ0KIA0KPiANCj4gPiArCQkvKiBzZXQgU29DIHJlLW1hcHBl
ciBpbmRleCByZWdpc3RlciBiYXNlZCBvbiBHVUlEIG1lbW9yeQ0KPiByZWdpb24gKi8NCj4gPiAr
CQl4ZV9tbWlvX3JtdzMyKHhlLT50aWxlc1swXS5wcmltYXJ5X2d0LA0KPiBTR19SRU1BUF9JTkRF
WDEsIFNHX1JFTUFQX0JJVFMsDQo+ID4gKwkJCSAgICAgIEZJRUxEX1BSRVAoU0dfUkVNQVBfQklU
UywgbWVtX3JlZ2lvbikpOw0KPiA+ICsNCj4gPiArCQltZW1jcHlfZnJvbWlvKGRhdGEsIHRlbGVt
X2FkZHIsIGNvdW50KTsNCj4gPiArCQlyZXQgPSBjb3VudDsNCj4gPiArCQl4ZV9wbV9ydW50aW1l
X3B1dCh4ZSk7DQo+ID4gKwl9DQo+ID4gKwltdXRleF91bmxvY2soJnhlLT5wbXQubG9jayk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiANCj4gLS0NCj4gIGkuDQo=
