Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5D16EB4C
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Mar 2025 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358954; cv=fail; b=rNtelKnt8tEoqwro1HThT4N1GrJXMnisbWOlFykT/oqDWd0s/praqqi2zL6XqH0+g45rB/eAQEQVNAtKN2w81jTdvGWxrEO4Cw7MTEytllk/953PVcarmoZYlC3RUk5+fW5richvpv/+ZaqvmLqQDIhL8ZClyJ8P/uc5yaKjocE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358954; c=relaxed/simple;
	bh=Qld1A1vAV4VAFayIEh/7N5jmgOnykHHh30JfW4I0bog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mILVqpZL3CrrWd7mmB4ja5kuPux0GrWQOxUcFvLfS5OVypom9xI7dA5hub14M4k2XAorC/L60xhQyU2Kqetlqu5DTh6W1mnYxD65k+vw0X0qgKkampwCRzQJ035bZdCLL9qiBwfYzi3QCi2ZkwO89ushQ7x3elfb/5qru8Xo1Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2H2LLmu; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2H2LLmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741358953; x=1772894953;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Qld1A1vAV4VAFayIEh/7N5jmgOnykHHh30JfW4I0bog=;
  b=D2H2LLmu876Za0AwSAYL5sMrx6gaJkWMO168SyES6UjQr1nQ/KEZW/2X
   GFiZOElZlH0/eB2egwmIUNVIHBUmcJHLDDY5XJj/CzbOSAtVrnxEaivW+
   CNlBlWuJB+pUE8K/3tpoQlabASTeHF/OCBS0WukMESKTB89EzSGHMrgIt
   jPwkKQRsnq7CctRrl94GJ0cfAQTfDGb/sFNPMe2kvUlGkSjqub7O+4/Ql
   HAOkHDxCRH2pGBiyDmyYgQvViiPw4ORJqzsyS8VcNLGTuJwi31XIj7RPk
   x0DdL6LhndamNgGMZ6Aden3XnXFKk1Xry193Ls5DG8/+KILZUULEYk6Vu
   g==;
X-CSE-ConnectionGUID: g8x5zsfiSWCNyfl8CvMogw==
X-CSE-MsgGUID: /XDBzwuST82BjX+yOZbleA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42286249"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42286249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:49:12 -0800
X-CSE-ConnectionGUID: 66/AnQwxT3+QOHMv9QI4Yg==
X-CSE-MsgGUID: tyhgQyQYR/+nAmSKIekjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124367113"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Mar 2025 06:49:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 06:49:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 06:49:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 06:49:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9VB5Xi1VkEfgZsRZp3rQKTCNEpvaa486niCp811WSXQT/r2bAU8ye8DBNIQKNnwX5ux5LLbCylgLZVS2TDZHYIh40ZLVO9bQY2g7EAPDvUT7DrKDDChCiDxLKmmK4PP5vFAHU8gLi0t4F/7c9PHZnt9Yop8CWD5Oy30T9AyiVDv0RHWjyizriws/HpHiYv3hJsyat98SXZ/2B7gmTIn8oBt+ecQldq748a0G3S930fenxSy2X7fAE9UNC3DEjOK8DOdjXwOE88AnacVOQLy1GQtM6BrgH8Av2mMZ2ejB7qMOKK+57Ps5oT/TvZEBTTiw+dYWaUuYfUZIAH4t7q9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qld1A1vAV4VAFayIEh/7N5jmgOnykHHh30JfW4I0bog=;
 b=yj4n1RN8wiP7+WgrhPlSlOcsESD5sWk9RtuM7NdfjgpqKi9QlWsRNKQIZ+L0as72JQws0e08J+fI/zQVSLqGxV3bcRhZ6qRfzx9+I7K9xltsIWL/YdzcSqfhSLDBrIX4YDSlFefYzJobqyv8Y0K4d7t8eyk7+cT5dbaeQCZnNKfdzcleudR2ACbss3lM5l5OLaenNSUsNhm0JWCRSjXI7OK1vurszC/qJDfNJjdJP0ZfoBWcyA4xAVdtQBsXbT1cGc7ztb5sKpE3phg4bbyLs13fnuvaIl+zOmrwEwYKG/ktPTDnBGDDfA4jZnqWjjWWIDheyrPERJYN4B/xrRAb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.19; Fri, 7 Mar 2025 14:48:55 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 14:48:54 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.15-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.15-rc1
Thread-Index: AQHbjshymbntyLHZhkuZ4tF+/qHnjbNnc8kAgABOvYA=
Date: Fri, 7 Mar 2025 14:48:54 +0000
Message-ID: <ba0cbc7e24bb24d2361a238d30f9e3197421e741.camel@intel.com>
References: <e884b4d403a650139080366b4b9f7c9d4be78efd.camel@intel.com>
	 <44a4b1e7-4c85-f17f-49de-db760de1bc5f@linux.intel.com>
In-Reply-To: <44a4b1e7-4c85-f17f-49de-db760de1bc5f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|SN7PR11MB7491:EE_
x-ms-office365-filtering-correlation-id: a5a0b5c5-d647-43d7-bb71-08dd5d872eef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?czdlRjdhbGZLOFZ4UlZBUTJYMlVrZVppczBwSGE2eXlRR3l1cW5SVGY1MW9q?=
 =?utf-8?B?N1Ayd1BwVFN5N0s3N2QybkxFbDZaYjZtSFNsK1ZxVmxwWTNZOVkwc2pOL3B5?=
 =?utf-8?B?OHBXekkxNnJsWVhyUlRaRGJtNVQvTUFwTi9CelFGRG93QWJ6N2NXclBGZ1R2?=
 =?utf-8?B?Z3p2Mm45bTdxQ0RRMS94Q1ltc3k5YkRGRzAvVlZIZGU1YkptQzV6Z2V0T0Zs?=
 =?utf-8?B?QWNVVUpnZURUcGtXOFg5dWlPSEVSNUhzVnlOK1UzQnYxQ2xIenRxeUVQamJX?=
 =?utf-8?B?Rmcrby83K252K2h6WVhIV2E0NUFidUcyTFhmQlRvdWN1cmsxRDIrWUFIbWhC?=
 =?utf-8?B?RlFCVThyNU90ZnVJeE1wVE5VUWNRK3VKRzRRTWpFWElvVWdSQ2JFdFh6d2hj?=
 =?utf-8?B?S0R4b3RmZllaVzVPc25iMGgzVklEd2x1aklCUzVSTnZoeGMvTW1LU1NULytq?=
 =?utf-8?B?Rnl3bDFyNkJYbDhpNzNYZW0vUHlNTWptRjdIdzhsZGg1cjVpK1lydnJQMWQ1?=
 =?utf-8?B?Y0RTRHh3a3ZNV1UxTUNnc09sd3k1MjdlMW43bWw3REE0dWZEUEg4dVhha0do?=
 =?utf-8?B?dnVURkZTVWVEeEhQWFByZ3g2elFRMXFrU2VKWFZrRVhtNXZnN3ZZbjBSeTEr?=
 =?utf-8?B?eUcwMFl1UXRkd0drNHQydGI2WGNJa1RvVlJmdXZaWVVVMFE0eDlpdEhVM1dh?=
 =?utf-8?B?Z05zUUpFYi9jWEtkMS82MVlkSHBvNUhma25PdTVWdEVOb094aEVGb0dUSVJQ?=
 =?utf-8?B?eHpPNFE2Q2p2QU40MDk0SFcrbXBvRU5PT2NtUnUybGhXKzlBeXY4L0dUMzk5?=
 =?utf-8?B?eSs3WnJkR2ppOEw3aXBTejlTTWFqL296N0FMVXdSWW9lMzQ1dUlqNGd1RjVu?=
 =?utf-8?B?RFNtV0ZhZVZhMlQvdTF2RjBpcWd0MXhkNXNVMUs1R1E5YXFuRGpYR1BCcFpu?=
 =?utf-8?B?MHo5WVc2MXNHWGVxbTRTT2FLUGQ2azJWU2ZnK3k1MTlkV0hoRmVDL2puZ2hJ?=
 =?utf-8?B?a2xvQmgvMTN3TjZsV2NjSVlyeG5kbkFqWDF5QStoZFNOdzVjSk1BOEtrUHJz?=
 =?utf-8?B?dUhjSXpUSFkxdXRodjQ3dG90WUpDclFHejJBR2c0UlJGWmRpTHpCVWVNdklx?=
 =?utf-8?B?L0VNYURzbnpyUzg5dGYxc1FPRE5aY0dNWVNEQVJEakpaU0ZkNmZLVCtYMkFM?=
 =?utf-8?B?RzMxUnQ3OXF5LzV6R25idUN2RHNRSlRzcVU5Rlk5UkZkNHhsZFFBZldGMm9X?=
 =?utf-8?B?d3JNWGc5bDRROVhWYytPcVRlUDVKZ0VKb0FOMEtBSFE5a2h0RUhRQk1GbDRI?=
 =?utf-8?B?aE13NzF2OGMzREd1d21NZExQdWViUWlYQUh1ZEZCeHpyeEpRN0dBL2R3dFJh?=
 =?utf-8?B?YzFwZjQ2MHRFbzBvRmhZTnR1ZlRxblRJUHdpUW5XNXUvcm5xeDFrdlJpdm55?=
 =?utf-8?B?VFlncndNSkdkbE12ZlJJclhmNGFLSzlQc29DbHlVNlhzSVVyYzdvbGlKZ2Mr?=
 =?utf-8?B?M1UwQktDTG51MnIybGlNNUYzQjVEUkQrVDFuRGw5d1MrcVZLd1FtVElxMVZM?=
 =?utf-8?B?MXFjVnVjdWlVVGtDWW9zM0V4aTM2YkkwSExEbmFaQ2t0TCtYMlQ5ZFJSOGNN?=
 =?utf-8?B?K3ROWkt0WmRaVk5jRWdPL0FpajMwUTZMSkowSTBGZm9UTzAvbnNuL2tjNHNx?=
 =?utf-8?B?cE1oc1RXZGVHOVk0Q291SlhKbzgzeDcrZkJHaldyOStxbzJBNVRsZEVLZ1RB?=
 =?utf-8?B?aDg0UGo3a3JkNzluVCtxNlpNaWtGbkVOY1NkMHBaQjBZQWZXbjNhcnNJdnhw?=
 =?utf-8?B?eURwa0JXMVhSYldZaDEwRzUzbkZmeEpnZlNEamdSczFmeFZaVTI0K0dWOEJS?=
 =?utf-8?B?amRvUDJvUWFPQ2JtTERXOFA0KzV1U040WDAxdkVqV2pyZ05mMS9XMmV3dmxN?=
 =?utf-8?Q?eHrsr2nzOnOGrDLs5hcH6gGu8ijRiL60?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE94ZmJQb3pFaFhSNUFTK0E1Q0VvMktORkNkSmVxelVLaUk0VTRwN2pFZXpE?=
 =?utf-8?B?bGl0dmlCQkVhSGhYcXIwN3JDazIvWGhQc015YUJhNmpTUzN0RzZORHJoaStt?=
 =?utf-8?B?VFBlQm1JMnlJN3ozTldEZk9OSHRmWFp3b3BCU1gwL2FRMVNoRm9ZamxOYzRQ?=
 =?utf-8?B?dVV6d0p1enBXMDh5ZlFIYm5IV2FZcmkxTWd1L1VSaHRhVmdXNEc2VHRiMEt1?=
 =?utf-8?B?aHlJSlFTM1I5cTQ2KzhreEZqSDdGMXBYWHhGU2tZQ0hwZ3I2bHM2b0hQUWU3?=
 =?utf-8?B?MWlyVjJUbXF3akgvT2VyZGhQaU5vMDVtSG9VZTJmUi92c0owaDEyOEVKaUV5?=
 =?utf-8?B?WnFQRUpzUUMvTEJxSUdFaTl5MUFCMjZOL3pZSk9uSWNtUGdmMmJ6TC8wcTFP?=
 =?utf-8?B?VFBPSmZRb0VaeTRhRnlQV2FBbXFpNis2NmVrNUxMVFZjSlE4dFBJanIxelJD?=
 =?utf-8?B?UnBuZnF3cjUxNmFoVktvMXJzY3kraFEvN05wTS9DaFBDRkNrMDdXbHczK1A3?=
 =?utf-8?B?aTBwbXJKYnhsa2tiOExwWVBQWEEzWjd5L1huUnJYT0Q4V0J0d1NKRGt6WFYz?=
 =?utf-8?B?WExiK1BJQzBtczNIRFVsUTU4UzgzbFhkQ24yeTZKMWx4M3lnNHlsQ3FFeGF3?=
 =?utf-8?B?elR4OUp5VlhIQ2pTNlhaYklLWlBUMWJScGlQVEVQbnY5a0tCQWEvVyt2bDJu?=
 =?utf-8?B?dC9uK0lQSTdwQ1UyS2w3ZGVlc3ZUWkV1Y2YwamRVZWdwdFNNQy8ranlIZFpq?=
 =?utf-8?B?eDVIbHBib05mc0dVWC9QbXFiNGlwbllJU0l0MkYvQms5WE5uM05xNFI1WGFm?=
 =?utf-8?B?V1lzbmJhVEhGRFF3R1hkcko1MXBRUk9ENElPQTJGR1dHSlRhYmQzRlVQRkp1?=
 =?utf-8?B?MU41TU5CSU1LUldPOGNLN3RielNyL0taUXRrOXpOMXBGUmRxR0pBbitOazR0?=
 =?utf-8?B?d2pBYkRVZjFCaERxY00zaDNyRkI2dkw3OHBWKzAwYUhWaUEzVStBNW5YT0xB?=
 =?utf-8?B?MnBkL0NNWmpsdGJvUzlIais4NklVU1I5VFErTDFoZzAvT25aZ21WTzlqd0tt?=
 =?utf-8?B?b0doYnd3NEdvTGgvdXdmc2gzVTYxR2Q2U2hoRWJLWjhWeEVYZ0R0TjY2SkZm?=
 =?utf-8?B?R0Q3Y1I1SC9iYzg0MmRkakg2amxweUl6RldDM1M1c0ZhK2FYbmd3TTl0V3k4?=
 =?utf-8?B?QS9WZk1sTFpXRlJFWStEMlZZQkJPRmY2TGhQUlBPaVpxSnI4bWY4SlVCZ0ox?=
 =?utf-8?B?S2tWaUc3QTZjQTlLSUcxcW0xUlJNM2ZUb0NDUVo2RG5JTnpnd1Zqd2dCVmdO?=
 =?utf-8?B?cThZbCtxV05SRk05WnFJQkJpdlVGcnNKczZBZXFkMDc0ZUJ5czNnd3MwcEdP?=
 =?utf-8?B?Q1lHTVNDYWhXZVlERVEzTVBOZXl2VDRGQ1Yxb0pnMUZKK3J3QlVPejNEejJ3?=
 =?utf-8?B?THdHd0ZoQXBpSEFBazhCWDBxeEpnMGtvRkdEVGdTdzBobE9PSTVpaTRRek10?=
 =?utf-8?B?VVlJYUdITWViRGtqdmI5emJzQlkxanZiWDlRQUdQcjQ0Wmo4V2dWRCtVLzhC?=
 =?utf-8?B?VERrQjByL3hMRHZDSXZvKzJVeEVWZWFYcnVSbmw1ZjZaYUgxbHpsQWVpNnBr?=
 =?utf-8?B?T1NIWXJUbUJ3WnY4RGlhcW4yK3JDcktLaXZWb3FQMXRJb1VQUXNpcnA5TDFH?=
 =?utf-8?B?TmlzVHhqRnlCRENCTzFVVTZBdzcwbTJlMzZhajY0WkhpdE1UNkxNYjNpQVU3?=
 =?utf-8?B?Q1F0TDlLaWFqL1VyS1o0NmllcFBuUWR3Sm01OStJS1RPKzFodlVqTm1KbUpy?=
 =?utf-8?B?NERZWXVtZzkyL0tWZEdzcUQ4R1VNRXp6eGpnQ2VVZFFxTTVxR0RiTGFmU0d6?=
 =?utf-8?B?Snh2U1hpTStYTndjQ2Q3RXEwTW5VbzRWM0hyYnRNNi81aytha2YvSFdOaTdR?=
 =?utf-8?B?UFJWcXQ5ejc2cmhDcWdTcmlYYU5ybUh3TUFGcXJHRlRFWVFZbmMwN1pPVitl?=
 =?utf-8?B?Z2Z4d2ZrQlNtc2prdzJkSktoWTRkMHk4VlYrYVl3LzRHYVUxRHdEYkNGK0xv?=
 =?utf-8?B?YnNzOUtqOWRnaWhBb1d6WWFVSGNwVDlGZzhGSko1VEZMb0I2OVp1WmthOVNx?=
 =?utf-8?B?NXdMaDUyWUd4WkwxK1RCclhoTUp4V1p1Q254emViNEV4UUQxMzAvL1VDTGNZ?=
 =?utf-8?Q?mkvxPRbfb98Ux1NPJ8mQlLY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0D739B0B7BCB74683A28F7337AF933B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a0b5c5-d647-43d7-bb71-08dd5d872eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 14:48:54.5783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcDeCB6MJziyq/qQwNJa+RH/OVlfi3sFHDxTZJAOW5RWoy/+kk6mYrawQmB6zfeso8UrKKMUriRNgmmxOfnhXG9K12sKDRwDvp/OiybtB1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KPiANCi4uLg0KDQo+IEhpIFNyaW5pdmFzLA0KPiANCj4gRGlkIHRoaXMgZW5k
IHVwIGZhbGxpbmcgdGhyb3VnaCBjcmFja3Mgb3IgZGlkIHlvdSBjb21lIGludG8gc2Vjb25kIA0K
PiB0aG91Z2h0cyBhYm91dCBpdDoNCj4gDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9wbGF0Zm9ybS1kcml2ZXIteDg2L3BhdGNoLzIwMjUwMTI5MDMzOTMyLjI1NzYwNzct
MS1yYWoua2hlbUBnbWFpbC5jb20vDQo+IA0KDQpTb3JyeSwgSSBtaXNzZWQgdGhpcy4gTGV0IG1l
IHNlbmQgeW91IGEgc2Vjb25kIFBVTEwgcmVxdWVzdC4NCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg0K
PiA/DQo+IA0KDQo=
