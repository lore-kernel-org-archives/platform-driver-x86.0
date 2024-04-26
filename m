Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF962F2E
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Apr 2024 22:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714171271; cv=fail; b=c3jCA5Ut6zykPRUCmx1CwHoLInWz+u89jGpJXgJgdmy5/ZoB75PwTvxMBFHBc4N58UvG9jKxWkk34rtT2+ABF1FdCGp7MyMazCL4Fq23WC6ARWN+UVIiF64J+5AvlNHLhlkAdvXpbdKeSE0oZKniUwZ7KqqbioEFc5Kmz6DjpQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714171271; c=relaxed/simple;
	bh=1rrz+HnddaW/4TdQ0VplFzXVLRrWCbZ0kFso4QnRWio=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=geIb/7CRuZU7EEuLP274jrGlkpS2pKPg7OrenkKiiCVk/NE6xMUYqufGhqFYVKnMOZsnS1aEBMe/mt8/bW552gZMJCxeR/DELbpUEgrbfAyrgiDYbSqiRYDDSyMZS+R1ntuVFu0cfquoOIcqfgh8YR2qXiB3bSiq+12KIBjkxE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfUTIqE4; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfUTIqE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714171270; x=1745707270;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=1rrz+HnddaW/4TdQ0VplFzXVLRrWCbZ0kFso4QnRWio=;
  b=HfUTIqE4LwEGeHwJcEjuwWu/0HId5gsYKBfBkkqwO++aCNX1J7xbaGPi
   snAGlkvoFqBQW2vtUNS+afxZAFWnbAU/By2d0XJ0KXMiSjTN44SKKKa6P
   Vg+thngjuMYU6ubY8Ek2a+Lz9YqapGa/rKjTzdLT6VBspsCo/KiTJe7Me
   ErD/gifhPWXeFAaGP3WsX+2WURnMBQZbfI8X2KxRUeCHJA9CX5kPtdljc
   IGJKZe7BTqp40lev8/kGnoBGxqZj5uQSUv2yRTdsQrsJVhLpATAXk7+mY
   XDJMb8EuN5Uux55xR3JuTIEMhElC33Ub5ykHARWY+Fg69G9zszOiWC4iS
   g==;
X-CSE-ConnectionGUID: DmVTKUfBSy2XFi4Oqx7WkQ==
X-CSE-MsgGUID: yRnyC9NnSf2hn+qZvYVATg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9783299"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9783299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:41:09 -0700
X-CSE-ConnectionGUID: qrtIuaLCTZCOB4DiC9UZcg==
X-CSE-MsgGUID: UBgySrSGRLyTSE33n6WehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="30206292"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Apr 2024 15:41:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 15:41:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 15:41:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 15:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=och//s4msMDV6bmMqjJeO3vuzwdpXvP+Q4N1Nk8Vv0HBhwmvWTDbtrB0M0aqpyA9AWgQWHiQD/SqGa2zTNFNKZFyqBQkBnt2MDCtrMfB4wlEZmYoJHx9LD+qHgIhK4wJlVSC2BnNVIAgtoyCZjtVzOn+DLPMaTStXorYVUOwYdKX1ZNg5byYb7JXTcE1GQ1FaoT6GVtLQonzRbTH7kB2Xo8wI0YT8W7cKdm8/T86bAZQ9ovslWUgNe83NKUeai1BEw12MPl4vHFnfUIlQ9VYeaSIsMA1RHRClNIpxPydN/lomDhIjsZJLKlG83TLHLr/9f/3docDr+iBtKDX+UTpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rrz+HnddaW/4TdQ0VplFzXVLRrWCbZ0kFso4QnRWio=;
 b=WtbZ8h5iZYZEL01CZsA1Mb2bTZ+D/09o5zYWrSuCtbJocFb6qohhPMeR2C31PHWgsrePQC2lHWdT1l7IykMbNSgh23RdpuZw2Day5bKlTwkMevU9JQll84l4o0/3IwwO+jVZ1fd29LTrKrUwJXui4GENPWUp5FrKAuXDNyVLs9nhViWEKxBS+XF8ZzGQ9QDNVVVXuR/iiIAI9b/p/FHE5ddWYivl/PG+wTCte8JBRMZm7XSCZNMUbZDqRIONKokWX8i0suWJcX10r074GPg/wLFvYkRzxeVR3r0tdN5vVFLPVYrODeu1Hb4Q+I7IMvNQ+QxZX1/Yc7P484gDZoax1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 22:41:05 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%7]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 22:41:05 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.10-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.10-rc1
Thread-Index: AQHamCrS5fFAhjPr+UuJNs2vKnkDww==
Date: Fri, 26 Apr 2024 22:41:05 +0000
Message-ID: <6993d8890e0831efee03924ff09a9fc80afebd75.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|BL1PR11MB5223:EE_
x-ms-office365-filtering-correlation-id: effed140-18fc-4ac8-b520-08dc6641f588
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?eEpuYTlIYnNWZXhtM2loYjBxTkRJVTEyNVFOclRHMWxKajdwOG05ZjdaZTVq?=
 =?utf-8?B?MUpSbFhjMVZyS1hwSnlWWFBDb213U2JSQWhoNlFkUTB4cnh1TnJsVmZSSVYy?=
 =?utf-8?B?WGE0QjQ0WDc4QXAySDdCaFdDVUZmR24rajBJaDMyQ2Z3TEQvY084bDNDa3Rj?=
 =?utf-8?B?Z2JrelhSUVR4Z0VBV2ZDMFNsUHhuY1RXaE1jTHdpMURsYW94aFk4aTZ3R1Av?=
 =?utf-8?B?UCtndjhVdlJpM0NNN09kQVZsZ2Y0WFNQdHhVQlVHdFRweVU1dEdER2ZSK000?=
 =?utf-8?B?WWRtOFV4MTBkMVR6bllxUWRrOUc2eWNrMlF2S3gxY3ZPSEtPT1hyaFowWEtP?=
 =?utf-8?B?em9CUGp4djBReE5rd0JDYTVFSUI1c0gxYmI0TjZFcVNieUtzbUJNUi9RSDZ4?=
 =?utf-8?B?cUZ3Z20xY2JWd2JuUDFRMlFyQitiZDZqNXF1dSsvY2dCbXpUbWJjSnBMRlBx?=
 =?utf-8?B?dFIzZ0h0MVpGN2REc0pObGd4aS9vMVBjZFVKcE1iTlI2WUtucW9sWGR6S0Vl?=
 =?utf-8?B?OUxEY1BaSkIxZU9HTVJranVTZDB6bjh3Z0JqK3Mzd0dGNjVtU0p6MEpaQWZo?=
 =?utf-8?B?NExSQ1I3aVlCZVZXQ01xL3RQY24xRHI4Q3FuTGk4UkUrcTB5R2JCbVlVNXMr?=
 =?utf-8?B?SysvWGlhaW5ySUZsS1lQZ2hReFA4dEpoQVNzVkYvMm1RZFZLdGV5cDBHd3lh?=
 =?utf-8?B?YUpQbXRuaHlMMThkZis4Z1hSd0lNL05rMGFyc0xPVnlkeDc1Q3hnMWcvQ3ky?=
 =?utf-8?B?a2EvSjUzb003OU5SRHJFN2EyaFRhTU1zemQ2NmsvOHlrSFJIR3JzdndMb3Ja?=
 =?utf-8?B?dGNNT2tLV0pYbHFOMTJJSFRVcTExUDFTaEVDUkVGS2gzTEN0WkpZcDgwVmZQ?=
 =?utf-8?B?WW1yMWxSNjdaZ1hQUUtXb3pENmo5T2JHZzhLRnJTQ3ViWWdQSkVPdnRPRWRi?=
 =?utf-8?B?VkpjUEg0dWt4N2Ewam5PenFmeDUzWkZ4T2dzRzg0QlVhSVFQMzZUT2k0MzA0?=
 =?utf-8?B?M0RBNEtBN2dPK1RPWlhIa1MrRWtVcnpiMzQyM1Y1T05OaS9mMWc5ZkVpbzk0?=
 =?utf-8?B?dHJmOUZGYzNKdkJQTFB1SDJMQzZybHFJeVFwMW1CNUNwbGVXakYrRTZBWWho?=
 =?utf-8?B?WmR3Z1Q0UUMrSmRsUlk1NFNlOWtDZUpLVUVVWll4QzY2ZnJ5bFFDeU00V3pG?=
 =?utf-8?B?SWRON29tYzdMc0xtZHhxNy96V1pKMTVXYUozYlZaaDJOMGdPb1c4Q0I0OXRZ?=
 =?utf-8?B?S0dJRURtMkFBMjM5c2gzWXRPWi9SL0ZCaUZDdjhaWDJqenJQOWpZN0JQT0Rn?=
 =?utf-8?B?c2ZjYWI0S1hwWEdCcXdCK1A1VnV5NFA2OGxVcHB0QlpWS0w2c3lyOURqWTFq?=
 =?utf-8?B?UGJtSUJ1TDN4Z3RGSFk3bllHdGtQd0orbkl6bWs5ZGJjc2xUQlEwS3VDeG82?=
 =?utf-8?B?bHh4TWIrdnZjMkR6V0lPRkt1a2RHNEJBVUQ0RXZxcjQxTVlFK3JGWVJGeXY3?=
 =?utf-8?B?Wkx0bnEydkgxQlNuRXNQNHN1clBnUVRPYkR2YWprbXFOUVBvY2pNdU96Ry9G?=
 =?utf-8?B?cGY3NEFoSTByQXMvVmF6N3lsdjNUMmlmdWhRZ0pYemVYV25HL21aWDFaQWhm?=
 =?utf-8?B?bVZOR1RCZnQrNWdENmRSZVVQWTBaQXpWblJiUVM0b3N0LzhrSVlFNEx1Szc0?=
 =?utf-8?B?WHFHUE5RdVd1OFF2L0toVmxSMHlqS09lQ2p2VUQ3WWpTUXpKRXNiejU2MHZ3?=
 =?utf-8?Q?2fNERDK+T1cmBMyBSU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTBkazU1RmdEWTVTWm1CYWNBSXIyelNJMEdzUlJzNmNJZHpiTEZQS3ZlR25L?=
 =?utf-8?B?WjBpRjYxa3FxUXNzdlppZGJxSGxJVDNoM0VSb3lvWk9yQkQ5dElYNEc2WnJO?=
 =?utf-8?B?a2hTaVdpcjhHdldLRHpPTU5wdTRacEZJbHV6eEtLeXhHQlhMQkdqa01vSHo3?=
 =?utf-8?B?dEhWWTVrVnJBS2RCQ1BRRkVsR3A1YkhUaWVYUVhVVnFSNFZ5Lzh2cEV6dlJL?=
 =?utf-8?B?UFZyRUw5N2tLZXprVmNQUEl3OFFub0tVaHpMdE14WnBFOWVpbmZQNmNJY0dB?=
 =?utf-8?B?Z0tWdkF6SzRTcTg4ZHNJNnJ1dHliRWQvdWFiWWpwd2h2dWlZVFNaMjRRWGw5?=
 =?utf-8?B?TDRQTmtKSnF2U2dZUHlvRkIyVG0zd20xWm12YnFjZ3lMWGhlRVJCb3huN2JQ?=
 =?utf-8?B?L3RhZytXWXY5Y0VOejhobUZSUnFCVVNGL2ZSeXV1ZWY4eEcxTm1FaDdXWXpy?=
 =?utf-8?B?cEFxZ1dWLzJORDdNZk9nOVZEenExQkpEN05TTVpkcTdxMkZXcU5QcmkwS29j?=
 =?utf-8?B?eUNOdHNlY3Rpa1NJcnIrT2hsT2k4U2hIQVVOT0hnTzdiSUFBTzJ3Wk5oMmc1?=
 =?utf-8?B?bDF5VGNZVU5UclpGWXQ4d0hUamdVbmdWcVppVjRQYlZKb2NvKzRMamdONjJO?=
 =?utf-8?B?NnRLa1Y4N0JUR3BlOUo0SmxjSXd2NktLYkNIczBETDVZTUZNMFpjN3kwS09v?=
 =?utf-8?B?bEJqSlNHQmpaR2N3QzRZcG1KbzRmbkRtZTk0MVc0TS9XRXp4Y0RLQlRubFhG?=
 =?utf-8?B?d3Z5MGswR1FQTHo0eEM2VDBvT0tjQWM2ei93cXRyQi9FeGdPVC9kZ2lsQ2p0?=
 =?utf-8?B?Wkxlc2ZDWkN6L1ppMUhYMEU5SHRlMWRxV1NneG5jUklBNXlsYWxKVHdVL1pq?=
 =?utf-8?B?c0hLZ3M5YkRXa2NIZGgrTkFkanNITU5WSVlRY282djg5R2UzdGs0YWg0dnI4?=
 =?utf-8?B?d3NJNUgwangrOFJmejJNMnNhNFpFUnYxdkpWdm1NL0wrM0k3TjJkZ0VZZWl0?=
 =?utf-8?B?Q3ZqK1lYWFQvdzZTTHVEd3FqYmEzSDRuVFpkaWFSNEp1eCtUQmlGQ1pzUFlU?=
 =?utf-8?B?WFNLVzFjbFFwNFdiYnV4b2E5aXdiQUZPcGtZak5tZkhhWlFKYjN1akQzQkhw?=
 =?utf-8?B?bWMvNStDU255MEc5NktCeVlQVVhURHVxOGdxcFMyZUF2ZHd6VEFTNEUzbUVD?=
 =?utf-8?B?OUREV3FnRS8rdEpWT0RwUnZSV2xrWitmZmJHWW93cmpGWnNYV09qb3EwbXM4?=
 =?utf-8?B?RmFUMFhISy9sQ1hJWnZ5cXQ1ZEZFWmxrWHN0TFNqM0FOMVRvTVZyN3lXYVBm?=
 =?utf-8?B?eTNzcnMxYWZXYWNFWnM5M3NxR0wrdjNzZGVoOGtvRzhJRkNIdExYaTNDNHA3?=
 =?utf-8?B?R1BuUUp6L1lXdml1Vjcvcy9aSjczOVBxNlVDYWF3aDF0ek54ZFFJWG9wRXFP?=
 =?utf-8?B?RVc3QWxSdVV5UWJ5TUZFMHRkclFPdEV5NllNTXFmWTJSa0ZIbTIxN2l4WGp3?=
 =?utf-8?B?a3NwR3V1RWlMY2pydEk2K2k1alJQZnltdXdYd1FGR0VNMHdVNnpWc2RReDFE?=
 =?utf-8?B?RUhEWlZvUmt6Smg2SGdwTEVWMHUraDJXakZpc2xFOStpbFdIOU1KUmErWjc1?=
 =?utf-8?B?eUJOdEdOTnlOVFBnd3VhOU9abm0vaDlZelFTY24ySmdVZFk1ZDV3ZE1sMmpj?=
 =?utf-8?B?R0hteUlSOW1PdXE3ZzR3ODh2OEtxL1gxNHB1NHRoSmZPbDR2YzFDRFRoeFFU?=
 =?utf-8?B?blVvTmxXWmxhWk1aQkcxYlM1dDVqZDRGMWdyL2pSd3MvRHdhZHZjdFNrSlg5?=
 =?utf-8?B?NE9scCtjMjNIVzVkUHJBcElMNmQ3Qk1CdVVLbEloYU9NREpBaE1XTnI4a3VO?=
 =?utf-8?B?Zytxclo5TG5IdzBYUVdnaFNibzZybU91Kytya3d0dXZUSXNEQmRRTk9JS3RK?=
 =?utf-8?B?U2taQkhoYzNjdWgrYW85Y0pFZjB2QzhxZGRJd1FrblBNaFFzLzFWZkhZVGtv?=
 =?utf-8?B?Z0NhV0FOUENoamhRQUo4ME1FQ3Voa05ZaEdZNk1ZWVdMTGNyQWhUVE8yaVVN?=
 =?utf-8?B?c1hMNDB0d2VlZjdtbW1EUkVKYmswYUhSWDlrYzNDenNTekIvekJjcGo2T1NS?=
 =?utf-8?B?elNvdUQwS2lraVN0QllHdW9zc1A2ZWd2V1Z5d3g1dmdYMkN3ZGJPOTZCeUY1?=
 =?utf-8?Q?PbtvkydIvyAHbwTXTmxf8KE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC47FA4BBAA08A4AB5A22AC69D34BB37@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effed140-18fc-4ac8-b520-08dc6641f588
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 22:41:05.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lkre8G/W+wvpkpZ890Z/tmOYaGqn9XBFx2t1LMlp4GQhL9ve8+FANhoPcnDfDGbGY8NQDPlY8aunu+nI+jiBQM90dJAqzvhjM4QMUch96bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
X-OriginatorOrg: intel.com

SGkgSGFucy9JbHBvLA0KDQpQdWxsIHJlcXVlc3QgZm9yIEludGVsIFNwZWVkIFNlbGVjdCB2ZXJz
aW9uIHYxLjE5Og0KU3VtbWFyeSBvZiBjaGFuZ2VzOg0KLSBTdXBwb3J0IG9mIFNTVCBCRi9URiBz
dXBwb3J0IHBlciBsZXZlbA0KLSBJbmNyZWFzZSBudW1iZXIgb2YgQ1BVcyBkaXNwbGF5ZWQNCi0g
UHJlc2VudCBhbGwgVFJMIGxldmVscyBmb3IgdHVyYm8tZnJlcQ0KLSBGaXggZGlzcGxheSBmb3Ig
dW5zdXBwb3J0ZWQgbGV2ZWxzDQotIFN1cHBvcnQgbXVsdGlwbGUgZGllcw0KLSBJbmNyZWFzZSBk
aWUgY291bnQNCi0gQ2hhbmdlIENQVSBkaXNwbGF5IGZvciBub24gY29tcHV0ZSBkb21haW4NCg0K
DQpUaGUgYmFzZSBicmFuY2ggZm9yIHRoZXNlIGNoYW5nZXMNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2Lmdp
dA0KYnJhbmNoOiByZXZpZXctaGFucw0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0DQowMDg0YjFlZjI1NDM4MjkzYzc0ZWZlNmY4YzVjMWM4YmRiMWEzNGM3Og0KDQogIHBsYXRm
b3JtL3g4NjogYXN1cy1sYXB0b3A6IFVzZSBzeXNmc19lbWl0KCkgYW5kIHN5c2ZzX2VtaXRfYXQo
KSB0bw0KcmVwbGFjZSBzcHJpbnRmKCkgKDIwMjQtMDQtMjIgMTU6NDQ6MjYgKzAyMDApDQoNCmFy
ZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHVi
LmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8NCmFmMjQzYjc1MDhmMWNlOGQ0OWYxYmE5NDRjNjQzYzg4NTA1
NzNlMTM6DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMTkgcmVs
ZWFzZSAoMjAyNC0wNC0yNg0KMTU6MDg6MTkgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNyaW5pdmFzIFBh
bmRydXZhZGEgKDgpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDog
SW5jcmVhc2UgZGllIGNvdW50DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OiBTdXBwb3J0IG11bHRpcGxlIGRpZXMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3Q6IEZpeCBkaXNwbGF5IGZvciB1bnN1cHBvcnRlZA0KbGV2ZWxzDQogICAgICB0
b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBQcmVzZW50IGFsbCBUUkwgbGV2ZWxz
IGZvcg0KdHVyYm8tZnJlcQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogSW5jcmVhc2UgbnVtYmVyIG9mIENQVXMNCmRpc3BsYXllZA0KICAgICAgdG9vbHMvcG93ZXIv
eDg2L2ludGVsLXNwZWVkLXNlbGVjdDogU1NUIEJGL1RGIHN1cHBvcnQgcGVyIGxldmVsDQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBEaXNwbGF5IENQVSBhcyBOb25l
IGZvciAtMQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMTkg
cmVsZWFzZQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvbmZp
Zy5jICAgIHwgMjUNCisrKysrKysrKysrKysrKysrKysrKysrLS0NCiB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS1tYm94LmMgfCAgMyArKy0NCiB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS10cG1pLmMgfCAxMCArKysrKysrKy0t
DQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvcmUuYyAgICAgIHwg
IDEgKw0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1kaXNwbGF5LmMg
ICB8IDMwDQorKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCiB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QuaCAgICAgICAgICAgfCAgMiArLQ0KIDYgZmlsZXMgY2hh
bmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNClRoYW5rcywNClNyaW5p
dmFzDQo=
