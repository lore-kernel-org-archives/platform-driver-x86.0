Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94C3587C9
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779760; cv=fail; b=QKKY8YbZfmac1Rpg+4oG2fFNpl/fDJY0ZxvnGGekTXosxfaMBDv07GL9t/5+LStQPaaDIvHZ3beVbgh/sGFaq3T8WxfKv7Ywk1TR3YVGS8RkO6ssq+vKToHNJM7zbGxa6pWhyx619WjAxbPPaEKWV+X/1GRYjlcembfriS5sea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779760; c=relaxed/simple;
	bh=wxSlZKBfo5PtqpDxqSRZ8IEWn9Kc2Re0EMMuDU6HDk0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YrkdF6F2IYnwR+sVWLK6kWhmdTNzm3ND9oOp3M5n8FahDvaOoe+1CLbgHOB3QPlRn2hAtxzeJj4RXS5FtgLCfhDbjPTa9aIlxZaQO9vH3ylE0mQqPi3R8AShBZ64V40cVViSCJBA7ityNrZANTOr7qbtdbrh4YO4IHCNMIc56yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADCAhKlW; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADCAhKlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764779759; x=1796315759;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=wxSlZKBfo5PtqpDxqSRZ8IEWn9Kc2Re0EMMuDU6HDk0=;
  b=ADCAhKlWixrh2O4E+qaUlF/Bsq/p8RfQgWJiPckxxjBdGJcqrhrUaSKc
   fs4kah2mpYnH9LBbUz05cGmcZ4u5FCUU6SVgDwks2kLPcScRaXQybXSBh
   VR3uiWsU8VEu0BGAr91GUJlzSSIn12qptIVDiDdUcGSkAGfR6BLQ4Rcn7
   olDE2zx4LbvPmnD1C/WX5H32c71qF82uXTD21iKni+WcfEEDVsrov8sh3
   LrW+GjFCtjAYPl8ZYHbMUGTdmhfPE22htxc5vwXsv9mS2QULu4hU0e41N
   tmbmRebUbEqgn6tW0/praWsInLe8JWqluxdh/TMztS5vyxJ58MSfwhDCw
   w==;
X-CSE-ConnectionGUID: /YaR9RCyRE6t42cjIfFvvg==
X-CSE-MsgGUID: XdNgn5XRRWas7t8Xa6by4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84378105"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="84378105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 08:35:55 -0800
X-CSE-ConnectionGUID: 9oHIMQuFQVGaf2L6WmFl0w==
X-CSE-MsgGUID: TVDJJNioQaGkiS65xEjfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="199150919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 08:35:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 08:35:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 08:35:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 08:35:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5PmQ31bM04N9mqcXGYbk7Am1M5vPxnWBRBEuUBO2XAldn+6su7zE6XMyUUWdEYW2fnUeRRH3R7Zqny/uE+uYvfMLfvusWjOlYcs4vYGTwkZHgs6GEBctl6FGGblueit1Xgs0wDjaqRaWrLNjGRrpb8J0ObbfsMIbkZb56L9yFzS9LDy8dvF7ve7szVodA6/Vx/bISr81c379959ddzCQP79wsgr88k4QMlirL5Sv/2Bq1/YmdK8fRGBCepf7V7p5p/E3FvlPKXketv2B8a56U4wV1lZIV++AdLa9whYTiGChMIhHjdtII0gJRQq/053YSnC/9JzjwygmqXsayEf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxSlZKBfo5PtqpDxqSRZ8IEWn9Kc2Re0EMMuDU6HDk0=;
 b=g/0dkMXmOjai8lILq5qKDnGbmeDxKgigbOXsiYTDBQjpcWsco1EYKfIzbHmUN2Dkqgzyj0QAhPKirzrAdO7fEeNcUBNi5i4YaeE3NG3amd2wxQnJA1o4ptkhdg0Q6IJzikLBh/i/KdNJHcRvHB3AexbyHG5usYo8FA3MVI5m+ATAbReH15b1eQjZ8nUtDyyaqcZtCvK0N4YJgemUcojT6UgRUhr+VvWqH88LHYvQe9vZF6Ln1pmJ1AJbBYXgctFXouKQKjaK4QCgCkS8NF3vOnYXUcl5i3RcHprqEC8zIigTEt+0HkhX3ZC6QOXg60D0OFnQjs6xXoFDIEvgSYAY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 3 Dec
 2025 16:35:45 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 16:35:45 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.19-rc1
Thread-Index: AQHcZHLfp4kex8P3FUiTTEIH+GAgtg==
Date: Wed, 3 Dec 2025 16:35:45 +0000
Message-ID: <29f01076610a5467ea64101f1bf7a4c0663e109f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|SA1PR11MB6869:EE_
x-ms-office365-filtering-correlation-id: d245fdee-7d67-41c3-354c-08de328a01eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QXU5aGdGZ3ZjRHlCNjFBZlpHQW1aRVBwM0ZVSlJwL2pxUDhqVHV4RXpocDc3?=
 =?utf-8?B?S2FkNmVyUDJad3U1Z1dEUjRQdy9MbEUydXVTNUkwNnpHcDMzenVjcS9yMkF5?=
 =?utf-8?B?eXNhNFBONnlab2t6blA4Ylhha0Z3SDdWRmlwMDl3QVNuVXo2M0F2MExxQnJ5?=
 =?utf-8?B?Z3RSMzh4TFZzL01yV1hBU2xGVERlOERzVlpXbjNndjRuUlg4UHRZYkZzbldI?=
 =?utf-8?B?ZWxkRFBwdmNrTmUxVWlNTjJoR2VORnRyQ1doNGYwUUhQTERFUzBJVTNQbU5R?=
 =?utf-8?B?RDFaRVYrREpFSEZGRy9JZHRrTm4xc1FHaUhCSnFTN1hiaktvRmRmT2NuS2lW?=
 =?utf-8?B?eGc4V29UTXN6N3l3VnVITTg0VEVNMm4xRTFMVkVHSDExbWxibWVZQ0FMOVlw?=
 =?utf-8?B?SzJLMDhmb1FTbWg4NHljZzA3eDhDanZjODRaekRjbTF0VXQrVTlzM1JvanM0?=
 =?utf-8?B?WEhGV2ovYjdpOHMwd2t5KzlOVVpzTHBFNUNGOWlid2hYRDJnOUtld0NlZm5N?=
 =?utf-8?B?Z0swN3diT3J3d210TWxTN1l1ZGswdmlCa3FWOUw0aW1peFlRTzVmLzBSK1BS?=
 =?utf-8?B?ZitYU0gvcXdLUGVhV1FvNy9QRlJFWGx2NFNnK3cvUlVTZ2Zya3ZLZlVmZzlr?=
 =?utf-8?B?OWZzd2d2eURrVFlMRXgxSlczbDhGUmRNb3lCQW9pTWZxSlRnTjA3Q28yYjg3?=
 =?utf-8?B?ek0xYzlRdW1FNnlDSThkNkV6K2ZIc0lDOTNVS2xyaDNGaGR4TWhFRmtQRXRo?=
 =?utf-8?B?MkpEaU5oZkowb1U1OHp0SGlsVlpHWTJYMXdnYUE3WDhCQXlGWHk2WTRvekpi?=
 =?utf-8?B?WnluaUVEazFHY2xKSGgwTUExbXJHcW9qOWtQck8zTHZWNTR3VUVQVzJzR29V?=
 =?utf-8?B?Wk9HNjRxcTM5WjFSM0FRZDdSbFMwS0ZXV3VHbDV5WGtiWHVJMFVNM0RmUTVP?=
 =?utf-8?B?TWxXcWdONTVZTWpBWDN1TllpdmtqeDJzR1hKS3BGQ0JOZ2J6NElzbHp6eU41?=
 =?utf-8?B?Mlh5aUFTRFBOcnFneEphU0xqRUR2Yk1xZFlYRmxHV29QNG81eGtnL2hhSXk5?=
 =?utf-8?B?SkNheEhRdzdYZkpqT0RkMkZJZzc2SU4xRHhicFVxTTFBOXlyUG05UHlsb29L?=
 =?utf-8?B?YlhUTXRkeGUxckRnL3JXSGU5UlR5b1M4Z2ExS0Q4WEgwa1VtYUh4ODJUT1Zp?=
 =?utf-8?B?SWZjTVRuK01XU1lYaGZYWXdkbmNEV2NqYUVoVjNORkVTZGtXcndvTWZGcXRa?=
 =?utf-8?B?RmI2RmFVMzQ3LzIxeSt2ZmhPZVdSWURzT0E2VC95TXJra1BYd0ZUd05NNTlO?=
 =?utf-8?B?clRwM1E1dVhaalNZZ0RLOWNhZHRDelRjb2NnQlphNVVBUk1oL1lXOXkwdmwr?=
 =?utf-8?B?d2ExNEN1SWYrTGJybTMxM3ZjQmdXaitOU1VGUXd2Q2MwNzA2VDczcFpPcmtN?=
 =?utf-8?B?ekszMjQ4U0V1aWJKdFg1WERQM3kwQ0o4eVNLekRRYzVNTmJPUlhFV3lsNXlp?=
 =?utf-8?B?Y1c0QmcwVjZuR09mZzhDWTRjMDZzeW4vVzV0OG9lTHBBNjBrSEszSlVwSVBl?=
 =?utf-8?B?OTBCR1hkU0FEV2xMRTN0ZUV5WU56c0RjK25Sck5ENS91dE55Q2hGUHI3ekdy?=
 =?utf-8?B?elV3M3NVQWlrOTE3d1JhZkJxSHlYbnJNc1JOaUs0cTNTaHRLSGs5K2Q3Q0gv?=
 =?utf-8?B?RVhTR0trRXB4YVF1azFNWUNLbVk1YzVXWEgwY1VBOEh6bGVrc2N3YzVGTWkz?=
 =?utf-8?B?TmlBdms0YnFkNzA1OEsxbnNDcFJzSXRoVm82WFFwZzNJKzdGOHhKaWtpQlVt?=
 =?utf-8?B?eVluc2htYzBLSnRBb2NxeHN0YUVWUVQ4b0dDa0Q5MDVJWXY3ZjRKOXBMRXlB?=
 =?utf-8?B?SlJ6US9IRjBKbUJMOUtYU0pGUno2QTRVTjR2UXEyc3NMVFZnbTd2MVJJODlt?=
 =?utf-8?B?NGtDWFliU2l5RFoxd3FhTnUvUHJMaGk2a1ZiSGhxS29UOGU4Z3A1T0dBcjMy?=
 =?utf-8?B?OVU3ejArSVByL2w4QmpFWi9VbUJaclRGSDY4RE9Fc1dzZGR3bkR4bzRwd0dE?=
 =?utf-8?Q?sozHyp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkExeVZscE1VbnNqaDUxTDUxbVJESWFpWkJKRUw4YmRMaVB5TmQ0N1d4S29p?=
 =?utf-8?B?SVQxbWZFbnhjenpja0MyVXBiLzZYV0w5WDRRV2R2UFNVa0VXeUpUM1dyR3FV?=
 =?utf-8?B?eXRXSUU0MDJVNFJtZTJNRFRHeXRrK01CQVE5QUpiR3RIbTRRcjRSVFBwRlI2?=
 =?utf-8?B?NEJDeTB4TGM3em53Ri94RFpkN1Nxa1VSdVpCTVlFd1dxVEUyZ2pwUGdvS2Zj?=
 =?utf-8?B?VnZJOTNyeDZXQnZnaGRNcFllL1ZwZkdyZ3k1QVBzQ0ZzY0JPbTg1dlF2dVdI?=
 =?utf-8?B?MVZQZVV0c091SjBIbWFnVzNDS1hRdmxzbHpIb0tNRDh2b05xTCtHUk1hQmd2?=
 =?utf-8?B?YW5oK0dxcUdQVDJaZVJsc0JyV3hMZFZRTG9jVG0wU2NvMkNLcisvNTJIYnFt?=
 =?utf-8?B?MFdKQUY0aWx1Z0xxVjdZMTBYWVU2OHVRdUhBRG00eXdsQnZmNzZVMG1Mdytq?=
 =?utf-8?B?aEYwR3J6TzZ5Y1E2OXJZMjNvZFF2eTJacCtRUlJ6V3pwOFVNcHhWQVY4M1ZF?=
 =?utf-8?B?NDdTeXB5N0dXNDJhWVlZVFpNT0lJNnczMkY3YlQwRlhvSzdmUHV0WXphZWhw?=
 =?utf-8?B?TkhqR0IzUEpXcUdCMmdFYVdqdndqUVdqT2NZK3lFUEZuUVRmOXFXejZkMTdQ?=
 =?utf-8?B?Sldkc0pDbkY1M0oyQ1JpOVRWeUxvdVdmTm0wZGpZWFV1akUyVklvaGw4ckxM?=
 =?utf-8?B?MUs5SjIrMXVNTE9oQWxUSlZiODNvcFpMOG9CdFVVTFhHck93ZUVYV05Mc1J1?=
 =?utf-8?B?TERtajhsSmhWODNBaHJTTEQ4S0tacTBoN0twandVcVdkckNraU1jcjB2WXc0?=
 =?utf-8?B?WTh6WXoveVB5M2xXODhuWXk3RTBReHlMdWd6LzNkZnZwZWd4MzlBbmhObjEz?=
 =?utf-8?B?NThVd0h0SmtoUWN4TFJLc3FSY1FsTm9iRE9KM1JpYVZvQzU3OER3SUpEQ1FT?=
 =?utf-8?B?QnVIRkVmNVdkOVE3SlY2V3RLVzQxOTFRZG9xSVZxSURXZU9RRDVGUjBPenVD?=
 =?utf-8?B?Ymg2WC95OGxDMGh6NUcrYmdXY2Z2T0QyRVdOSTNySlZwZ0VYdlZjTldld2Jk?=
 =?utf-8?B?QnlOS24xLzdBcm1qcml1eFBUSU45dTc1NTI0Qm5SRy9mdGFqaGZXZWU0ZGVD?=
 =?utf-8?B?MDA2YndxMXNyVC9JdXNxRnh5bmNUcjdUWFU1Y0tKK3pvdWc1dElsdFVaR0dj?=
 =?utf-8?B?SWJRdnhoMXJxYkxyeHBPd2FNQmZqMm5MdlFPS3RRdExQeDFaWEV2TlM1cjVE?=
 =?utf-8?B?WHpNYUx0YlIyR0J2UHVnOTJ5UU12bEhmR3dnY3lqeU9RQkVrZzlQcHNlYWQ4?=
 =?utf-8?B?TkFtMmdQVDNLNkdDSzJ1MVk2QXpsNzA4TkxkQjZnVjZiNWhjQXRuR25hSVN4?=
 =?utf-8?B?dElNNTY2cXl4U1dQU01GMzdpSU9pTmFUdy9lc2pIY2NIakdqb0k2RjkyaHVa?=
 =?utf-8?B?MTRHTVFrVi9lNi94Rkp1bWNwYkhneTllOXQrZ2ozNFpjSG1ZRWxLc3VpMXZF?=
 =?utf-8?B?K1N6Z09MeXBYS1FBSzFLRTN0eXNTaVNSOU5BdkI0cXhLZ2FOZ1hsckxET29m?=
 =?utf-8?B?c1BwUWxNNm1GeUd2WTNlbElUN2tHeDcxc2VkcXU5TTEwcEw2SFFFZTdXZFNU?=
 =?utf-8?B?bVpnU1p5NTI1R2VWTnNOSG01MHU3eDBpNG9CTDRYVGVBQ2tFWUticmNCdmlP?=
 =?utf-8?B?OVF5dTc3QXByQ2hnaGtuVmxLazdHZzl4MFVDaStWZzdEWlNFZ1ZNQ200elRx?=
 =?utf-8?B?S1JObGpXc2x4eG5NNFRxZk5FaXJBQWtoZ0J5T2NQOGs1RmxzRnd0cG83VXZj?=
 =?utf-8?B?R1NtaE0xM2Y3d0c5RW9PLzkwZC9PcDNzSFdJajZmYldjbXNDSVBHMHpDNlE5?=
 =?utf-8?B?cVM0aHF3QzVLVXdhMGxnTjErRjJmS0lQNHFIa21uam9sQ0IyNHpmUFJ2MTdK?=
 =?utf-8?B?cTZNRzk1b0RLaXB5a3QvVGhCQU5YWFMwbmgxaHMrQnZOUU1taHRkQ0ZKUXlU?=
 =?utf-8?B?UHVrNkRpN2NpQW9wYm5yVXp5bWljSEpDeHk0c0xXVkRCajc4L3RkczgrWDBj?=
 =?utf-8?B?ajQwd3paVStRcE5ESUpoaFJQOTdYQVNmVGQwRUZEbG0ySVdsNzFQTVRXZ0hB?=
 =?utf-8?B?c3o0N1J6aENLTkJQb1NybVZqMDJ5WlpRcWRyeXRGOVduVlI4cTNLNU5ZVlVr?=
 =?utf-8?Q?g8pUBuleJHts+iel0vRk2T0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A11C4E43E64E6E4397C0DA00A2944A22@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d245fdee-7d67-41c3-354c-08de328a01eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 16:35:45.2027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2De8X8C6YvnN/20b6YLNFO7pmLPYa80iP03LOxWn49hdUIPpPmPeI4s/My/O/SN0zteR94Fg0l8+UJkyeB3GL1PwfLI3gcidNCajiFitLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
X-OriginatorOrg: intel.com

SGkgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBzOi8va2VybmVs
Lmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3Jt
LWRyaXZlcnMteDg2DQpmb3ItbmV4dA0KDQphcyBvZiB0b2RheS4NCg0KDQpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0DQpjMzZmOWQ3YjI4NjlhMDAzYTJmN2Q2ZmYyYzZiYWM5ZTYy
ZmQ3ZDY4Og0KDQogIGZzL25sczogRml4IGluY29uc2lzdGVuY3kgYmV0d2VlbiB1dGY4X3RvX3V0
ZjMyKCkgYW5kIHV0ZjMyX3RvX3V0ZjgoKQ0KKDIwMjUtMTItMDEgMTE6NTg6MDYgKzAyMDApDQoN
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0
aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCmFkMzc0ZWI5YjMzZmM0NzM4ZjIxZTU3NjU4MDczYTA0
Zjc3ZDQ5M2Q6DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMjQg
cmVsZWFzZSAoMjAyNS0xMi0wMw0KMDg6Mjk6MTMgLTA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNyaW5pdmFz
IFBhbmRydXZhZGEgKDMpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogQ2hlY2sgZmVhdHVyZSBzdGF0dXMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IFJlc2V0IGlzc3RfdHVyYm9fZnJlcV9pbmZvDQpmb3IgaW52YWxpZCBidWNrZXRz
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yNCByZWxlYXNl
DQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgICAg
fCAgMiArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb3JlLXRw
bWkuYyB8IDQ2DQorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
DQogMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpU
aGFua3MsDQpTcmluaXZhcw0K
