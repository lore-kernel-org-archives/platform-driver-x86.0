Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE625D533
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824927; cv=fail; b=ezAWTimXVMBapmMCdPwKlMtc9c6Xa9PaPn2FIVYjokiug2zPmojOf+ll3JQZ+ZZpFCJO4g1DtiIdbDfRUmMgK1QYIlHPtUX7L0sCwjd93ZEuMS9nW2lSJYLVFM/8CaytiLaij5FPgVCU0z61Eg2xFTzsNy86d23FsiQ2Jz3WIYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824927; c=relaxed/simple;
	bh=X3FJur/eiUoM11iv/K/BAJWqJQiSFjFYanER6LGaqsI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tDjwdQVA+IpIU2EfEbEB8H3yCGSy5lhRPrqcqEAQSn604HYn86lFN/+qZ/EVUvLveR7FHTZbBsotPxrvmYYLdunQ42A8OdFzP/eyLfqNmvc4V8iN8adGGVdPuPC+vmqFxHo/I3VUZei5Ak/GJ6eyWu+ptbFWqFuyNOfuNliYanA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPsKkpso; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPsKkpso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746824925; x=1778360925;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=X3FJur/eiUoM11iv/K/BAJWqJQiSFjFYanER6LGaqsI=;
  b=QPsKkpso3kJrc47ZI3fgv51nOJ5wyUNv3dRNxUQRysXcPTScie2O7orm
   BBgnOAjNB42kbhAM6fa2re5uq13Zt7WMWUxGwB0Knm3DsC6bxjDNTyY4m
   u2iku3cS8HcDNBqU1VBswPfVSghEvxqUlmkbjlR3ySEc8LI9aR0qzgOxg
   +he1e0L6SzCI2W4rU2WHAxmAJmm+u5/fRmY/2WENXMe5UtlXZQcB9zyCs
   r6F71hYyH7z078ZGkEuP8Ugv5vYIVwjsUt8znbKqF8x7pS//3ULsvzAKx
   jqQkpIeKxc5jX1Ttbkdgk+Urmee57W6fq+ohZ5ZQG6qgW7Zor18xpdmSW
   A==;
X-CSE-ConnectionGUID: UmgVRdfFQMykGWUg8/sKAw==
X-CSE-MsgGUID: cIZV5nKKQ7OQmPYIs2nYHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66204947"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="66204947"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 14:08:40 -0700
X-CSE-ConnectionGUID: E4X1Me8kS9WYjQxg+G/2ZA==
X-CSE-MsgGUID: zNthJeVdS5GMPJHGAqwBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141690343"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 14:08:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 14:08:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 14:08:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 14:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyQFXkLuwMIril511JJHKmyeZNbM7S/vOO3l8tkjrjIcDfDd8YmjEKBYJnI04O4NfZWJuPvbITjTEOUfvcDq/k0JzlS7j5670t+2GTC3VgHdVplpyQ/gg2U++IMQNGXzM/gcrNS+HzpOcnO3X5OFo4N77kwnyVBCOwoxff+ZaiEpysqV3/KLe6PXIo8zKE8D7GiQwD7nUFBsOEyuGXkApj3YjBaqFod61VVXU4spcSu7qMFz737ImreVGleIduBNt6XIqgHQ227bXQnDbEWKLTnccOCnDsmII+HdsM7KraOu33I8SeFDJhDkvTAMKblzLChOqudi+eLBjhpaZEbP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3FJur/eiUoM11iv/K/BAJWqJQiSFjFYanER6LGaqsI=;
 b=jkxnReSBFLX894qMhfqCo+gwQjqGkwkbIsGx7X8rypREvyLhTaDcnEKKX9df5mHMhk65rCkfYECUuc9PBv3QV01lHH5ozq6N8QBIMwP4tg4M0CLNVLXMpyAOoJaRxi/gGJ1ZmKAA3m9IJHWseZH4ZsmqdCQWLxH0D8sSOH4z728scG6FwBMlxT9Yd4oAYUJCsOnX6lDa6ZYhBcPmpqTH2kd0IXF5pprjywFr0rWteOdQyj7C5orRT65oLmWualPQAke+F1+gC/irRe4gQZttpwWShTTtWVxV73QNXTulBIXEAxa+VYSuZlCVgJp2ws7U9j+gjUF+6mnQqYpQjOg9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16)
 by SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Fri, 9 May
 2025 21:08:17 +0000
Received: from SJ0PR11MB5600.namprd11.prod.outlook.com
 ([fe80::3bb1:2d28:d07:bcc3]) by SJ0PR11MB5600.namprd11.prod.outlook.com
 ([fe80::3bb1:2d28:d07:bcc3%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 21:08:16 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.16-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.16-rc1
Thread-Index: AQHbwSZ73amoBicG6USKWIxmsTsnqw==
Date: Fri, 9 May 2025 21:08:16 +0000
Message-ID: <f3f874fd1a505396ded7fc35856dd3386e44d0a6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5600:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: 1e15f197-c47d-4e5c-c3ba-08dd8f3d9e4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dFcxb244MlJBenFqYk1aNERIZ2xyTVVXVmFQTkRoUWJITzMrZlZoVi84aWpl?=
 =?utf-8?B?MVVkeVVFaHg2cENyaHdnVkJweHZpOEk2ZTAxeUpSU1JzMmNaVjM5bklTSmdO?=
 =?utf-8?B?YWRYcVc4Rmp5RWJ1VllXdG1MRXNTcVYwb3lSdENlQlpCQU96NFJWanQ0RTZ3?=
 =?utf-8?B?SUNuazFnVGpiMlF5T3UyTllsV0JqcEQ1VHBQRmtYQnhWekF0UGg4MnJpVDdi?=
 =?utf-8?B?Y2hSc0dqcE5wUTB1Ky80TEptNUtkUHZJVEU4cVVSdzA4UGdFL092RythK1BR?=
 =?utf-8?B?RFFkUnNRSVRhZjFZM2ZZZnQ5S29qdGpqYUVFMzlTeHFaNVZpSElLb0hLcDFo?=
 =?utf-8?B?OGVjeVU3eGhLdEI3VzF2Nzc2V051clJ4WnplU2dxTjdIMENCOHdwTEFKNWZV?=
 =?utf-8?B?b29MUjF6dC9kNDdBU3lDOTlkU0lrMGk3OUpFeXJTelUwREU2aFNLY2hZem91?=
 =?utf-8?B?a0Q2S3AwdlczeUZhUzhYaWFuZkV1V1dCMkNTalY3cHlqRzg0bklLWlFVbFJl?=
 =?utf-8?B?d3c3bnJNQUN2VTR6cDdUc1lwY3U3ZzdvWEhuQVFoNzIvR0IxbURQOWxjNVQw?=
 =?utf-8?B?NStLWDBZOEhneHlSUFBZWmI4ZG1ZdmhhSThRbC9hSVJpQ0Rzbkw3YVB3cWFY?=
 =?utf-8?B?SmhHZitLMm1JRk9NMCtiMEwyVFFrQkdhVWVmK2Z6RUZuWlJ3VHMzTTRrTG1C?=
 =?utf-8?B?RlhBc2NmZjV0VkV4Mi9PZmhpdEtaVThjamt4TDNDU0hxcEQvcGFFbFVJb2xP?=
 =?utf-8?B?WUFZdVQ3MUdqemg3bUpLUzgycTdWSEFOZTUwU05PUU5QVTJ4SCtYQlkrYUZp?=
 =?utf-8?B?UUIySzZGN0NMZnF2ZmxhdDB5L1l5Y0piNkR0K3pzRk0vQS9seFVpNnFYUWI5?=
 =?utf-8?B?K3FEVW0rUnV6TnNTWWJvNzZKQ2RtcDgzVngrM2ZtekNycXpNU3c5MTZlVytY?=
 =?utf-8?B?NjZkdFlzamVNeFZZcitaY2NUcTdpRzJkWkRPTzZoNjQwdkRHbk9ZNFNhaElT?=
 =?utf-8?B?Z2tMNE4wZU5WSUI2bW92SnB0ci9qMlVrZGxmZkZUM2VoNU1hWDUxYTZZQTk5?=
 =?utf-8?B?RjNBOTAyZ2huOWlmUngzYzZoZk1NTzRwbkFPWFF1dyt2QWRPNDREc2wwWmtM?=
 =?utf-8?B?Z3dmSUY0SzlvN2pCZmhpZ0laVGJNSEN5QVhrU3VqOEQxcmpleHlZcXBXYmpn?=
 =?utf-8?B?U2tnd3BvakRma3BIb1JFc05HOGFKckhDNTc5bWs4aG1uaXBJTlJLUDVHREJF?=
 =?utf-8?B?VnFkY0wrYkgwbVcvc3RwR2xLR245ZEM1amN2ZVZOMStibjNpS2xLUFBLWDRZ?=
 =?utf-8?B?U2JleC9LeTEzbXAzNE8wWUJza0RiY0pITnBMVFh4UVN4b2RLcVM1RmdEc0ls?=
 =?utf-8?B?d1ZpNkcxYStNQ21Ockhxdk9JY1M0cWQvUkNaeFg5TDFYMUNGa0FEWUZad0do?=
 =?utf-8?B?S05xanNlblFRbWJlSENTRFZBRnVWbmpqR0hXMjlSQ3Z1bElEc0FaNWZGeko0?=
 =?utf-8?B?NVVJZ3RoMktjYTFuTTEvOXkxbGsvSGIxMFFCMTNtWi9iYlFWcFY1NGxjM1U1?=
 =?utf-8?B?RDFNOWhOSXlUU3ZHU3lpR0I3ZWtML3BvMWhHN2VZL2xNM1JkY1Q4YnM0WGhk?=
 =?utf-8?B?ZUhLYTdUU0IzdHByYWVPV05xQlZBYzduTjl3REtGWm1Ta0JnTFpUU1NSTjQ5?=
 =?utf-8?B?R1R2Ym13bWYvd0pZZXdVOTlSYzZHL25wQS9oTk5TRmZrTlgvd0lMYWlTZTJQ?=
 =?utf-8?B?RXBYZkxSQ2JUL3d6M0VvZDlDYWdZODhGTmlKZWx1dytmcXhIbFF0c0xleThn?=
 =?utf-8?B?c2o5OXM5WlBYV2tIcGtFQThPSjJlYmdMYUdERTBmNmtldHhjVEtwZ3BENUti?=
 =?utf-8?B?SDFKc1hvN1BpZWkxOGY4Y2NVcXNCWCtia3VyL0k4WW05aXlOQXB2U2tvK0JT?=
 =?utf-8?Q?eg3csIc3mkM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5600.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjNNWWxMR1ZXcW0rT3lGNWdEMG5VZW9CUXI5d0RPVXFzOC9mcmY0ODl5RGl0?=
 =?utf-8?B?bEk5OUlGd2FleE1FUkJZaEY5bjFhSFZ3QTRLNlduTnhmZDkrU1NFTEF6RHg3?=
 =?utf-8?B?TDFzUW1HQ0NpeVlVRk5WS01saVNmQlZFN094QitjWG9KRUZoOWthRi9XNWRL?=
 =?utf-8?B?NHI0MUZxdTlWZDRjWEZRZXh1ME96TndQQ3ZTZ2toSFNsYVE1MHlFWUI5RktS?=
 =?utf-8?B?bitFTkhQb0Z1WWpuOTFXK1lielZlWUtYMHAzWjRsbmlDbUhsc1V1K1creENp?=
 =?utf-8?B?Qit6aGpNU3dwUVlObVV3emVNekd2VVkza1hGNTZVeWxqYk5ncktiQ0VHN1R2?=
 =?utf-8?B?Y1dJUmtoV2tnTk1TYm1sblZ0RndnaHJJV1grOWRNd0dRMUlJR3B4OHFOaU45?=
 =?utf-8?B?VjIvVUprUm1SZmlmSEY1a2ZNVElUZXlxdDVsaWNnQkJqaUtZeWRxZytPZVA0?=
 =?utf-8?B?SDZhd2RVTnVtbWc2TVpjNDB2d0llNjZTd3NkMHVwNFRiYXpaK2R2VGVJdmhW?=
 =?utf-8?B?SEtraW1lVEhtcm9FUHRQSmwwSkNjMU9nakFDTDl1Y1FEVElEOEFaRHg2SkVh?=
 =?utf-8?B?b0JUVG9NSTQzRVJzRjZhdEpMeUhqclFMNnF6WmJqTzJpS3EwMk1Pdy9jN1dE?=
 =?utf-8?B?U1lJT1lZSFdzbW9XZVozWi81VXIrVjlQTkNxMUtXVHc0OGxZMDVPcGljVzV6?=
 =?utf-8?B?WENyeUE0VVRzUnA4OVROWVMveEoyL0x0M2hOb2xUQ00xcmwxK29GdHpNMU5E?=
 =?utf-8?B?TlVxYnNDOU02TEFYUVQyNjZlQ240QVNUeW1saHdkK2c0RncwUWxIWTlXRXlY?=
 =?utf-8?B?ajVaazVZTmVNaDZQS2FxQWRCVDZCSmVJTUJFREtCSWh4NVlJSUE5Y3J5akk1?=
 =?utf-8?B?WDZOZldZUmVOeXRCMXJXOEhIOGxUMEs1TFMxemNOL2owVkJpQkRrK3hLWU5R?=
 =?utf-8?B?QS95WWROTHJxRy9HN09XOXVIUDN4MjhDY1c3dCtpMk9UM2JCREpSdnBLWmsr?=
 =?utf-8?B?S05QY0NOOHNJKzM1UE04Qk9aWHRvN04zcHVvZEd5MGN6bk9QaHBXWnNpUTE0?=
 =?utf-8?B?elZhSUN6ekdveGdENGt4Wk9nTGVVK1N1L2s3MFN2L2g2RnFpT3B2NUs5U1JM?=
 =?utf-8?B?ODZPeUc2N2RFSHFGKzNlUnFjR2FFdHJyaEo2OG51T2lHdkV5cDNmQXNLUzlU?=
 =?utf-8?B?Mm4rWGliZjFQOGVubmp5RjJNUHFOR0Z0SXk2d2FoRTVmZkVkVkJZR0pEM3Zk?=
 =?utf-8?B?R3JWOVRrV0k4RVU2b1gyN1FQZVFGOXN0S1R5QkFuUTVPMDVISzd4bWU5SHVC?=
 =?utf-8?B?QlhBQWl3aDBBNEVNNlRjZG01eC9ZWmFNckUydlp2UEFzRzd5UmdVVFJLTDZu?=
 =?utf-8?B?QjU2Q1lWbjhHNnhaa3N0Lyt1aDM2cGgyYzdjbTlVWWNmajdldHZKeTVoMjJt?=
 =?utf-8?B?L0JEM2dEUWFXN1RlOXNXT2dIVzRQOUVRYnBOUWhxUzMyRisxZDM4UmdPZ0tz?=
 =?utf-8?B?b1VwQ3VPV2ZNekhlZVB1Z3lUaktyUDhhejRxQzQ3KzhsTDBYZ3JQZFdzbGYr?=
 =?utf-8?B?Ui9HMlRZTkVxVHU3S1JCSkJlNUI4VmlWMDRtZEVLY0xQTTNFQ1pPaHRXNUd2?=
 =?utf-8?B?aHZBdzV0TVYzMnl1dG9rZTg3VFBjdlZGajFhYmNxYm9PVGpDQmJ1K3IrWmZo?=
 =?utf-8?B?akl4QkRlWDVJUXNrVlpSN3BTRmF2WFJGTHhYSWJMQW96TjA0NEtPem9LdUlJ?=
 =?utf-8?B?dU8vVllGbWJuVFU1Wkpyb3ZNTDlwWXhWY1B1ZjA1aStLb1FyUm8xRDc4RGs5?=
 =?utf-8?B?MVU2bjBRcEZjZ1E1MWZjb2xnWHlRSUdBem1GdlY0ckZzaWJEYWM3cWxqbVJQ?=
 =?utf-8?B?K3dNNWhWNHg4OEpQWEhFaklsNmdtOTZ2UEluNGlyTU03QU1VS1RzT1NPNGo4?=
 =?utf-8?B?all0bExWcE95NU1wWmVSby9DRjJsZlQ4dmNEbGRlVlBYaFZMOUVSR21STkh5?=
 =?utf-8?B?cUdTN3grUXZOTVdPUEF0cmoyRlNOZFZkeko0R00zMEZjY0dzRFRDcFUrNmJQ?=
 =?utf-8?B?UXhpckZsTTZ3QVdRUHlOVkpYaFNuUy9QVDNRME9FL0ZUZlp4RW83Vnl6UlRR?=
 =?utf-8?B?dUFieVNUN1Ixai9WYVRMcUFVM3pZYlBINFZFa3VVR2FqV2dYT1ZVZ0hONXBS?=
 =?utf-8?Q?zCtHZVfmlphsz1inTs7XyVI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <002315081CAE05479C97DDD580772574@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e15f197-c47d-4e5c-c3ba-08dd8f3d9e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 21:08:16.7749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtO2okRteRHVC4EPriFsHmHK6bZTaN7bWwbbZgu/gcFfIwzA2Y1O369ixD6SgPgyCIXKGOpw4x+csoPkI7FSpSKe9pm6CX+O3ClZvMbkoXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
X-OriginatorOrg: intel.com

SGkgSGFucyBhbmQgSWxwbywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgaXMgYmFzZWQgb24NCmh0dHBz
Oi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2
L3BsYXRmb3JtLWRyaXZlcnMteDg2DQpyZXZpZXctaWxwby1uZXh0DQoNClRoaXMgaGFzIGNoYW5n
ZXMgZm9yIFNTVC1QUCByZXZpc2lvbiAyIHN1cHBvcnQgYW5kIHVuY29yZSBmcmVxdWVuY3kNCnVw
ZGF0ZSBmb3IgbmV3IGdlbmVyYXRpb25zIG9mIENQVXMuDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQNCjgzNTc5Njc1MzMxMDU5Njg5ZTI4NjliZjc1MmNhOWUxN2ZhZGJkODI6
DQoNCiAgcGxhdGZvcm0veDg2OiBwb3J0d2VsbC1lYzogQWRkIEdQSU8gYW5kIFdEVCBkcml2ZXIg
Zm9yIFBvcnR3ZWxsIEVDDQooMjAyNS0wNS0wOCAxNzozNzo1OCArMDMwMCkNCg0KYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6IA0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9z
cGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8NCjZkZmUyNmNiMWMyOTBmYTRiNjJlNmZiOGMwNTIwOWZlNWY3YWRiNzY6
DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMjMgcmVsZWFzZSAo
MjAyNS0wNS0wOQ0KMTE6MTI6MzEgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNyaW5pdmFzIFBhbmRydXZh
ZGEgKDMpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogU3VwcG9y
dCBTU1QgUFAgcmV2aXNpb24gMg0KZmllbGRzDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwt
c3BlZWQtc2VsZWN0OiBTa2lwIHVuY29yZSBmcmVxdWVuY3kgdXBkYXRlDQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4yMyByZWxlYXNlDQoNCiB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgICAgfCAxNQ0KKysrKysrKysr
KysrKy0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvcmUtdHBt
aS5jIHwgMTIgKysrKysrKysrKysrDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dC9pc3N0LWRpc3BsYXkuYyAgIHwgMjANCisrKysrKysrKysrKysrKysrKysrDQogdG9vbHMvcG93
ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LmggICAgICAgICAgIHwgIDMgKysrDQogNCBm
aWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpUaGFua3Ms
DQpTcmluaXZhcw0KDQo=
