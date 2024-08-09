Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766A14F124
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Aug 2024 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723227714; cv=fail; b=OPu04nOsGxcjInEHzcZygyVqVoS6MrYrQ460NOOg+yb+hjsJCTdNNoVAiVySNROZTnNqErI+Vszj0nSvsS57oJAvJi+IldSBRf6s5oY16zIta2K1uEXNf539uOaLBtmZnpBTKgiy7T8djoZy8n95/45/R1y+XeBLCdkjC4Qn5dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723227714; c=relaxed/simple;
	bh=GXLXqVndIWmv5Rb7gs3qi14Q/iCq1+Wg7g6NmD6fe4E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n7JtS4ILCz1oPvJd5Bc1pTizfX5pgYhI7bPfh0IMasi1Nu2bl0L6SjOdENB1KaZ9Hc6MgCuyLcdzlI6rvNZ5508SkRHBDIGI1q67VOHs7r2dnvv4U31+caKB/myffTXJ8s5ZkRlwsJcAyGYIlyJg/X2z9h87a5ggxSplll30Iug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNIT9q0G; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNIT9q0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723227712; x=1754763712;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GXLXqVndIWmv5Rb7gs3qi14Q/iCq1+Wg7g6NmD6fe4E=;
  b=gNIT9q0G6UEWzIn7y3wYmCyxF0hOMyO5mkC8GDVNmoQw2xJIurz3FKTp
   xbIwNoIAgR75InT5HqD106V3eJa4IaS0uDiPzQjweKZV2BaBfyp5QlVJA
   uJAkDTGH8pkwsfporxoJ00CuQDf083ZqNBBTqnQLnMUFiv192zIBB0oMV
   BCukj/K8Ses8HxUgJuXd2U3KYZu8yPmp8HKswmI8UKO8b5R/HR0ivqAxR
   ALJjHK24mtigQd0oNY87mver5S+WbBV1nS5ul+zW5Im0egf/InEcWfE1P
   X0MU0BFCBD9c66h3U6K1IlQUn+B9+BICx5JmYBeWfGoE1TSsrhirAcarf
   Q==;
X-CSE-ConnectionGUID: 1BB+R4mVS6KDBtwF56kYhA==
X-CSE-MsgGUID: NrKdcYBwRw+hDB9OcbYdqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21073227"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="21073227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 11:21:49 -0700
X-CSE-ConnectionGUID: lfc/sOg6TvazqPpmqMoLEQ==
X-CSE-MsgGUID: j0vEmK7mRk6qrLIJewjUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="58200420"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Aug 2024 11:21:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 11:21:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 11:21:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 11:21:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 11:21:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYwKqTk4iBv7k15sZRJnjcekvtXJq7jFxInFzERwiPRbi9zcm9jR/+XSCDKqUVy5S5Ebc5n7jm0YhOE1hOf6VeWUQ2EXm+/9t9m6/EFiT/75o077YOVIIF1sICAMn3UmaLeHPktUtstFYrkrfnC9NnnsCr7OzvK+PdHb6mtf8fhTl64Oqg83zMq75KmzP/72C58utz0VvSzfJe1Yz1u3jCRvbNKPpwva6A1TH0g8vElmQe/45BC6UU+MDZW+x5aURbwQsnBcs3k+Nor1nFs4BPKXuRyRXPnG5jkyOfM7rIOA/14JgFF0H+iXCMuw74o1MZ3lPagPZnH+ownkLiR3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXLXqVndIWmv5Rb7gs3qi14Q/iCq1+Wg7g6NmD6fe4E=;
 b=tVOb+afV40rcbUQsXLLkUoP/gQVGpawgwpWhbrLe3fHRdSG3+/ECX3dQJ5OByzWrOZLkUHN7zTXJjNtH/5ug2YwwIg2uuaEXnfCvqQ6TjqWAZoeAB/Y+OWTVUCOzvAbKfhqhRAHm3CK0iiAaJ6d2/w7V3qR4TlX04ImXicYPnXeMmLDW/p5VF2E0fPZonnPEbNEI/TfCqSd2BBW7Pm8/UnlH+QTCV5WqaJEQd6+wzbdIeSddDP7PbdkFo5aTZIw0qHG4BGXf+bn6voAHrwBoKsy8rgaxLkykn8VE6OLPtnJiXwzKS8dHaeQkpn1ufYQQ2X0A2Y1W57FLLOMcsds4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 9 Aug
 2024 18:21:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 18:21:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Topic: [PATCH v9 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
Thread-Index: AQHa3o2UzQ6Srp5sNkmojIJgnAERKrId2zAAgAAT8ICAAEHagIABI32w
Date: Fri, 9 Aug 2024 18:21:45 +0000
Message-ID: <IA1PR11MB64188E3342EB3C26BC30EDD5C1BA2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
	 <20240725122346.4063913-6-michael.j.ruhl@intel.com>
	 <e70a44a24b1404a000e302a444a41c286538f3f9.camel@linux.intel.com>
	 <ZrUyH6vZpShdacjx@intel.com>
 <fe23eb2ef30e4a867668a221f3f02dbe9d322edc.camel@linux.intel.com>
In-Reply-To: <fe23eb2ef30e4a867668a221f3f02dbe9d322edc.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ0PR11MB4927:EE_
x-ms-office365-filtering-correlation-id: 7bb32b22-070c-458a-bae7-08dcb8a0203b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y1hwUEFSVFRiNjZxNzIxUWdzeGFyWjV6bFJzcE9jUnJ2VGJqMVpBaW5rb2Q3?=
 =?utf-8?B?NTgyOGxKSm0raHhVcG42aXlUdWdDVHpEcituRG9DbFI5bGF6azNBVHh3RTE5?=
 =?utf-8?B?cFVpaDl1Tk9TZzRMNktZR0orekV4T2tscnZ3aUJuUVJ5Z01HQnFSaS9vT2x1?=
 =?utf-8?B?VUV4QVNYYXN2bkh1WGZpalRYa1RtSEMrRFA0WEY0cWpydlJyN1ovTTNvR3VP?=
 =?utf-8?B?dno2YnlzVklTRG1yZEd3bzVLZ1J4MTgxZ0xnUzU4ZTFVZS93K3R4N0o1VHJL?=
 =?utf-8?B?dFFIbFN4N3B2dHg1c1kzL0tWdTFMYVNFZXV6TGF3aHNDYmRoYjRzcGtGY1h1?=
 =?utf-8?B?VmsxQXpMaEJtbXg2bGpyekx5SE13R1pqTkg3Q0Uvb29md0xwd3JQbVJrMlls?=
 =?utf-8?B?WGttM3hadHhNMFNyL2ZaNmI0dUlYY2g1WVlHMVEybEV6UjdhNWhPL0tJaDJ3?=
 =?utf-8?B?aDlLNitZanFEd3VyYm1XY3lKd1Fwb01RcGg2WVU3UVphL1RyM2FFaExGVHFJ?=
 =?utf-8?B?RkZXa1BLWTdKS3lXaFo2UmtGYVVRQ1hEM2ZDcXZhSkJFUlQvV0hvS2JGT3Qz?=
 =?utf-8?B?TGgxaVBhUEJ6NXYyQytRUExISTdUQU1DK0RydTFFWWdKcmlkS3A2ZjRtNEox?=
 =?utf-8?B?bFA3UFErOEJhYWNEVGo0cDlZcnNwZ1FmWmUxbW1Hckxjam5uc0lmQmc4WnA5?=
 =?utf-8?B?Nmhwa2JWbXZoR2lyalNvQm1KT0RncUI4T1pVTnFUMlhmTExwR3pCZEFCd1Rp?=
 =?utf-8?B?dGlCQzFZRVd3QlBjZzBUdVI5MjdIUEpLeU5JTlR4TW42L1RlQ3QxMHJJMjJC?=
 =?utf-8?B?L0N2ZUxjRnFhVzlPeE1FV3hrWjJXanQwbGxmUXdpbXdjK2hFc21ncDR0cmxo?=
 =?utf-8?B?My9hMmwzN1J1M3pmcjRyaTFYSE5vOGdHQkJ2UzBFVWVmTmxnT1ZmQmJZUnE5?=
 =?utf-8?B?dFhnd05ab2VXTEc3Y1h2RERjVENsSndJbW1TdzZlWCtQWkV0UFJVcGcyWEtX?=
 =?utf-8?B?clNWTk1LUWxNRFAvYlJVak1ycjhyTkN3SGp0RlB5OHlKUEVyOFlpYkxTTTFE?=
 =?utf-8?B?WDJYMkUrZ3lvNEJiZTkvN0E5SzBTcGtldS9Hc2dsTFZIem9JSkRpTjVUTG05?=
 =?utf-8?B?TUZSeWFrWmVHQ05PeTB0UkVFcU03K09xcGZWUmViSDBsMkVXK2E4NytmZWgy?=
 =?utf-8?B?aW9UM2x2SGhIM25JYmMyQ2pvM2IySnE4NWhXWldDWU81YTQ0YmkyZjFjbTBs?=
 =?utf-8?B?S0libkxMVHZJS3MwM2hFdFJCYzU3YTZFWjdsdzd6UG16cFI0YlovTzA1Q1Vy?=
 =?utf-8?B?MExTN3BjNnlyZWhzUEc0NC9hZi9ReUtzYWVUQVp1Q3JJOTU4aFRBZzcrTnZl?=
 =?utf-8?B?SmpjQXdZd1EyV2RtcnRicTVrQXBkRVlaU3RCTFJnODR1MUxnciswaUdVOWpt?=
 =?utf-8?B?K2o1YzNnUzZBdmNoUE5SSFR5b2xVdUtQQW1Zc25Yc1VHVDJwUEExM0tKN2ZX?=
 =?utf-8?B?UUJVY1Vqa1REZXNzVTcyUmx3My9KYk9yUkFibjdleHNzeEJsc0RxcTh0SlAw?=
 =?utf-8?B?dkdqbWM2blhIRUVxUGJXV0Z5eHIxNTZObFprTk91OWttaU9BN1V3NlpxQmxT?=
 =?utf-8?B?Qzh4ZjluRWExRU0yZmx0d1A0Ulh2Q2p4Z2dQWlJJNXJGUUZxb01vS2VBQ0dI?=
 =?utf-8?B?RTFzQVplbi84ZHdEaWJ5MFJTRksxanJUdEN3TkNKdloyZHdXWkw1UVl2Y0lH?=
 =?utf-8?B?cnBQRzgzc0VycXZpOFBTaWFEdUpoWld4SUxPeGV4NlVwTC9paE02NlFNQUZm?=
 =?utf-8?B?ekM3U1VhSUlnLzRBVGp0eStMcEcxd1ZodDNESjJFM1dob2QxVXMrOTdNTjVQ?=
 =?utf-8?B?SEFFcUJtTEpnOTEzQmlEemlQa2JuNjBla3lNcG82eHhXNlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vmo5eFEvRFhXUUg3UGdrbTgrVmJQeHJKa3pDeWR2S2p6U1ZGKzgxNytQTkhC?=
 =?utf-8?B?YnJlMll3V3piYkcxNXhhU2VDT2h0OTN0TVlINlh6NmNkL2g3KzBrUU4rd0RV?=
 =?utf-8?B?VHpoOGdRTmRQZmMvZ1FoRkxmLzdyQ0JCT0VGNkRCd1puSjJWdFo3eGcxbm5F?=
 =?utf-8?B?U0hsbDFzQ1E2OWZlUTZqUXJSbmQ4VEh2VC9KWVdVM2xSYStabHdOQkR3bU1Z?=
 =?utf-8?B?aTRDMjVGVCtRNjZ2MkZZWHJVMVk1RHkvLzdZcGszQmxkcUZYaTZsL0pIajBi?=
 =?utf-8?B?TjZoMmtXd1JYMU5YUDJLaFFoZkxkZ2FPb0l2Tmw3YlBPZ0lIM0xuVDJHdmUr?=
 =?utf-8?B?UEF2NXRSZnA5QUZ3YVZIdXFSOXpEeU5qbUhwTmdrSzY0TXpwS3hYMkU2Snkx?=
 =?utf-8?B?OXlwTi8xekVDSHgxRGZsMkZHOE81WFFiNms0b2tOL1Jzc04vTnZvUy8zZDJV?=
 =?utf-8?B?cTQyQWZBRmpQT21uYitBaE5Tc3NUM01tQUh0TEJwRGNlQ0NYdFExTis4U3BC?=
 =?utf-8?B?dW16UU1LNi8xZkU0YTE1SlBvVFhHTVFqaDZTRTlVWnNUZnE1UjcwTTdQSHgx?=
 =?utf-8?B?dzh6V2g1am91V1JMVi9KanlNTDNmR2t5TmZaOGthZVJqUkM1d1k1WTh6QzZv?=
 =?utf-8?B?NE1KK01tU1JqM3p2YlBZN2N6am9nYStWMEV4T0dnYXhNbTdCQ0NvZFJTZlhr?=
 =?utf-8?B?MitubFJXdUI0NFAxMjY0dDlRM3hNc2szcDNkaUJMV3h3WmU3cDdlYUR5dGMy?=
 =?utf-8?B?LzNMbW0raUR0RVZ0L3QxRkRReGxMUHNrQmxwaDlTM2paVFhiYXN6dGsyUld0?=
 =?utf-8?B?OGNlUzY4ZjltMjNpc2FYdURwZnN0akZibDQ3NWZpZGVJN0V0SnZqT01RZll5?=
 =?utf-8?B?Y1Y5dlpOSjRxSnpKUldKRVRvRXNhS0cwZWVCczZYVm56RSs2eHdFZlBsL0ls?=
 =?utf-8?B?RW5lM3drVUhEUytIRjdKWnpYa3NIREJBSTJJcmhQWmJiMHorYUpTMTVBUXc5?=
 =?utf-8?B?d2FWR3k3MWE4d2RVWmprRmlhQWZkODRPYkk4ZEZwZlFUM21GcGc2eng0Qjda?=
 =?utf-8?B?VlNBdXZXKzBUaVl2L2N1VFJESlc0OEo3NGxnUS9vdnlOalZJRTVGV0drZHBI?=
 =?utf-8?B?aUc1cDJyVmloVENnTGNMci8raXJLZ0ZDT1E1SDRYekRqK2FJSUFOcEUvV0Ux?=
 =?utf-8?B?anZGTWF4T3FvTnkvK1hkTXlsdEFwNUFUM0ptcVg0aG93YlF2b256Uytnb01t?=
 =?utf-8?B?RjBESlF1R3U4eExRZ2ZTelkwMVlPTDgvZjVIZzJSNlVGVGRQclpGd3AybWFT?=
 =?utf-8?B?RDUxSU81NW1UZFN1dXZGSm9STkxyQ2xvK1NMYzRidng2MWdMbG1BcEVDS0Np?=
 =?utf-8?B?cG1tRGVEWXJwM0w4ZUcrMEt0Um8rZDYwdEZ4MjlKZCsrYVBsV0tBZG55MEhE?=
 =?utf-8?B?SkRJSnRJbnRlM2FFa2orTG9jOWcxd2NyVnVESy9qU2JxNGs4aVRsSjZjUDl3?=
 =?utf-8?B?cVkyOTJUdVZ1WW95QUdENjZPQmFMcEcybFZyL3F2bnBySUpXT3FVTStpQkVh?=
 =?utf-8?B?NVBpQzV0RUFOaDZHSS9UVGJQVmNyTlBmT0J3eHdGVnlJMzI2a3M0TEc1c0RG?=
 =?utf-8?B?ZjZiUUZFcGtjRmVjWlJNT1JZeHFhL2pWL2Ntd1I5cGh3QmZhaXJUbFkyeEZz?=
 =?utf-8?B?MEl5ejQvLzNtRXVScFlaeG41MElxdStSUXlJaExNcmpTVStkN2JFdEhxcHRu?=
 =?utf-8?B?TnhEcSt0TnIwNy9DOEU5anI5TEZabnoxY3hNNTdJQjA2MG83KzFBWFJXdUMy?=
 =?utf-8?B?YlBUL1lDbzZqVG9kR1Z1ZEZOZlhFSDJaYTFTWVluWUFpSFNiS0xwZzF5UmM3?=
 =?utf-8?B?cFBwUFE3clYzQVM4UUg4bDA0VTMydHNvQnNiVlA5dktxOGx1S2U2a2xvYmJx?=
 =?utf-8?B?a2dvaDRBSEFOcUhmMXJLNzBIcW5yL3lQU2VDTWUwdVI1QXRnS1hIYjlRc0N0?=
 =?utf-8?B?UFFhTytJYlRodk5TN3VUZlAwcy9HdkRBOFpCazhHNEJ0UHVDY1ArNHUyK0kr?=
 =?utf-8?B?WGZld29ZRmNLZXB4TWVVSjY2Sm9jczd3K0hzejlUMnAvaVpKUCtDTlRKc3hH?=
 =?utf-8?Q?EMv9uvs6nuCX5RREcWUQF+WsS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb32b22-070c-458a-bae7-08dcb8a0203b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 18:21:45.4572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1FmSflP3XhjRtuxdqcg/+dcPqgQzJEqzQDR9Thiee78qSDt4uM+/jIvpU9Mgb1L+hpodXiuBwX2TV6BuSlO3aCgETI8N8BhwWliod6aOR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBFLiBCb3ggPGRhdmlk
LmUuYm94QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCA4LCAyMDI0
IDg6NTcgUE0NCj4gVG86IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+
IENjOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5l
bC5vcmc7IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBCcm9zdCwNCj4gTWF0dGhldyA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5j
b20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSA1LzZdIHBsYXRmb3JtL3g4Ni9pbnRlbC9wbXQ6
IEFkZCBzdXBwb3J0IGZvciBQTVQNCj4gYmFzZSBhZGp1c3QNCj4gDQo+IE9uIFRodSwgMjAyNC0w
OC0wOCBhdCAxNzowMSAtMDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+IE9uIFRodSwgQXVn
IDA4LCAyMDI0IGF0IDEyOjQ5OjU4UE0gLTA3MDAsIERhdmlkIEUuIEJveCB3cm90ZToNCj4gPiA+
IEhpIE1pa2UNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDIwMjQtMDctMjUgYXQgMDg6MjMgLTA0MDAs
IE1pY2hhZWwgSi4gUnVobCB3cm90ZToNCj4gPiA+ID4gRFZTRUMgb2Zmc2V0cyBhcmUgYmFzZWQg
b24gdGhlIGVuZHBvaW50IEJBUi7CoCBJZiBhbiBlbmRwb2ludCBpcw0KPiA+ID4gPiBub3QgYXZh
aWxhYmxlIGFsbG93IHRoZSBvZmZzZXQgaW5mb3JtYXRpb24gdG8gYmUgYWRqdXN0ZWQgYnkgdGhl
DQo+ID4gPiA+IHBhcmVudCBkcml2ZXIuDQo+ID4gPg0KPiA+ID4gSSBrbm93IEkgd3JvdGUgdGhl
IG9yaWdpbmFsIHZlcnNpb24gb2YgdGhlc2UgcGF0Y2hlcyBidXQgSSBubyBsb25nZXINCj4gPiA+
IGxpa2UgdGhpcyBzb2x1dGlvbi4gVGhlIHMzMiBpcyB0b28gc21hbGwgZm9yIGEgNjQgYml0IGFk
ZHJlc3MgYW5kDQo+ID4gPiBjYWxjdWxhdGluZyB0aGUgb2Zmc2V0IGp1c3QgdG8gYWRkIGl0IGJh
Y2sgaW4gdGhlIFBNVCBkcml2ZXIgaXMNCj4gPiA+IHVubmVjZXNzYXJ5Lg0KPiA+DQo+ID4geWVh
cCwgNjRiaXQgc291bmRzIGJldHRlciBpbmRlZWQuDQo+ID4NCj4gPiA+IEluc3RlYWQsIEkgc2Vu
dCB5b3UNCj4gPiA+IHJlcGxhY2VtZW50IHBhdGNoZXMgZm9yIDUgYW5kIDYgdGhhdCBhbGxvdyBw
YXNzaW5nIHRoZSB0ZWxlbWV0cnkNCj4gPiA+IHJlZ2lvbiBhZGRyZXNzIGRpcmVjdGx5IHRvIHRo
ZSBQTVQgZHJpdmVyLg0KPiA+DQo+ID4gV2FzIHRoZXNlIHJlcGxhY2VtZW50cyBzZW50IHN0cmFp
Z2h0IHRvIFBNVCBsaXN0IG9yIHRvIE1pa2Ugc28gaGUgY2FuDQo+ID4gYWRqdXN0IHRoZSBzZXJp
ZXM/DQo+ID4NCj4gPiBJJ20gd29uZGVyaW5nIGlmIHdlIHNob3VsZCBtZXJnZSB0aGlzIHRocm91
Z2ggb3VyIGRybS14ZS1uZXh0IG9yDQo+ID4gdGhyb3VnaCBQTVQgY2hhbm5lbHMuIFRob3VnaHRz
Pw0KPiA+DQo+ID4gSW4gYW55IGNhc2UsIGFjayBmcm9tIG15IHNpZGUgdG8gZ2V0IHRoZSB4ZSBw
YXRjaGVzIG1lcmdlZCB0b2dldGhlcg0KPiA+IHRocm91Z2ggUE1ULg0KPiA+DQo+ID4gQnV0IGlm
IHNvbWVvbmUgcHJlZmVyIHRvIGdldCB0aGlzIG1lcmdlZCB0aHJvdWdoIGRybS14ZS1uZXh0LCB0
aGVuIHdlDQo+ID4gbmVlZCB0byBhY3QgZmFzdCBhbmQgZ2V0IHRoaXMgcmVhZHkgd2l0aCB0aGUg
ZmluYWwgcGF0Y2hlcyBhbmQgYWNrZWQNCj4gPiBieSB5b3UgUE1UIG1haW50YWluZXJzLCBpbiB0
aGUgbmV4dCAyIHdlZWtzIGJlY2F1c2Ugb3VyIHdpbmRvdyB1bmRlcg0KPiA+IGRybSBjbG9zZXMg
bXVjaCBlYXJsaWVyLg0KPiA+DQo+ID4gQXJvdW5kIDYuMTEtcmM1IGlzIHdoZW4gd2UgY2xvc2Ug
dGhlIGRybSB3aW5kb3cgdG93YXJkcyA2LjEyIGFuZCB3ZQ0KPiA+IGFyZSBhbG1vc3Qgd2l0aGlu
IDYuMTEtcmMzLg0KPiA+DQo+ID4gVGhvdWdodHM/DQo+IA0KPiBGb3IgbWUgUGF0Y2hlcyAxLTQg
YXJlIGdvb2QgdG8gZ28gZm9yIEJNRyBzdXBwb3J0LiBQYXRjaGVzIDUgYW5kIDYgYWRkIERHMg0K
PiBzdXBwb3J0IGJ1dCBuZWVkIHNvbWUgd29yay4gVGhleSBzaG91bGQgd2FpdC4NCg0KDQpEYXZp
ZCwgSWxwbywNCg0KVGhlIERHMiBwYXRjaGVzIGFyZSBhIG5pY2UgdG8gaGF2ZS4NCg0KUGxlYXNl
IHRha2UgcGF0Y2ggMSAtIDQuDQoNCkkgd2lsbCByZXZpc2l0IDUgYW5kIDYgKHdpdGggRGF2aWQn
cyBzdWdnZXN0ZWQgY2hhbmdlcykgaW4gdGhlIGZ1dHVyZS4NCg0KVGhhbmtzIQ0KDQpNaWtlDQoN
CiANCj4gRGF2aWQNCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gUm9kcmlnby4NCj4gPg0KPiA+
ID4NCj4gPiA+IERhdmlkDQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+IMKgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmjCoMKgwqDCoCB8
IDEgKw0KPiA+ID4gPiDCoGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC90ZWxlbWV0cnku
YyB8IDkgKysrKysrKysrDQo+ID4gPiA+IMKgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNl
Yy5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArDQo+ID4gPiA+IMKgaW5jbHVkZS9saW51eC9pbnRl
bF92c2VjLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKysrDQo+ID4gPiA+
IMKgNCBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuaA0KPiA+ID4g
PiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5oDQo+ID4gPiA+IGluZGV4
IGEyNjdhYzk2NDQyMy4uOTg0Y2Q0MGVlODE0IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3MuaA0KPiA+ID4gPiBAQCAtNDYsNiArNDYsNyBAQCBz
dHJ1Y3QgaW50ZWxfcG10X2VudHJ5IHsNCj4gPiA+ID4gwqAJdm9pZCBfX2lvbWVtCQkqYmFzZTsN
Cj4gPiA+ID4gwqAJc3RydWN0IHBtdF9jYWxsYmFja3MJKmNiOw0KPiA+ID4gPiDCoAl1bnNpZ25l
ZCBsb25nCQliYXNlX2FkZHI7DQo+ID4gPiA+ICsJczMyCQkJYmFzZV9hZGp1c3Q7DQo+ID4gPiA+
IMKgCXNpemVfdAkJCXNpemU7DQo+ID4gPiA+IMKgCXUzMgkJCWd1aWQ7DQo+ID4gPiA+IMKgCWlu
dAkJCWRldmlkOw0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvcG10L3RlbGVtZXRyeS5jDQo+ID4gPiA+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwv
cG10L3RlbGVtZXRyeS5jDQo+ID4gPiA+IGluZGV4IGM5ZmVhYzg1OWU1Ny4uODhlNGYxMzE1MDk3
IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvdGVs
ZW1ldHJ5LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L3Rl
bGVtZXRyeS5jDQo+ID4gPiA+IEBAIC03OCw2ICs3OCwxMyBAQCBzdGF0aWMgaW50IHBtdF90ZWxl
bV9oZWFkZXJfZGVjb2RlKHN0cnVjdA0KPiA+ID4gPiBpbnRlbF9wbXRfZW50cnkgKmVudHJ5LA0K
PiA+ID4gPiDCoAloZWFkZXItPmFjY2Vzc190eXBlID0gVEVMRU1fQUNDRVNTKHJlYWRsKGRpc2Nf
dGFibGUpKTsNCj4gPiA+ID4gwqAJaGVhZGVyLT5ndWlkID0gcmVhZGwoZGlzY190YWJsZSArIFRF
TEVNX0dVSURfT0ZGU0VUKTsNCj4gPiA+ID4gwqAJaGVhZGVyLT5iYXNlX29mZnNldCA9IHJlYWRs
KGRpc2NfdGFibGUgKyBURUxFTV9CQVNFX09GRlNFVCk7DQo+ID4gPiA+ICsJaWYgKGVudHJ5LT5i
YXNlX2FkanVzdCkgew0KPiA+ID4gPiArCQl1MzIgbmV3X2Jhc2UgPSBoZWFkZXItPmJhc2Vfb2Zm
c2V0ICsgZW50cnktPmJhc2VfYWRqdXN0Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCWRldl9kYmco
ZGV2LCAiQWRqdXN0aW5nIGJhc2Ugb2Zmc2V0IGZyb20gMHgleCB0byAweCV4XG4iLA0KPiA+ID4g
PiArCQkJaGVhZGVyLT5iYXNlX29mZnNldCwgbmV3X2Jhc2UpOw0KPiA+ID4gPiArCQloZWFkZXIt
PmJhc2Vfb2Zmc2V0ID0gbmV3X2Jhc2U7DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPg0KPiA+ID4gPiDC
oAkvKiBTaXplIGlzIG1lYXN1cmVkIGluIERXT1JEUywgYnV0IGFjY2Vzc29yIHJldHVybnMgYnl0
ZXMgKi8NCj4gPiA+ID4gwqAJaGVhZGVyLT5zaXplID0gVEVMRU1fU0laRShyZWFkbChkaXNjX3Rh
YmxlKSk7IEBAIC0zMDIsNiArMzA5LDgNCj4gPiA+ID4gQEAgc3RhdGljIGludCBwbXRfdGVsZW1f
cHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eGRldiwNCj4gPiA+ID4gY29uc3Qgc3Ry
dWN0IGF1eGlsaWENCj4gPiA+ID4gwqAJZm9yIChpID0gMDsgaSA8IGludGVsX3ZzZWNfZGV2LT5u
dW1fcmVzb3VyY2VzOyBpKyspIHsNCj4gPiA+ID4gwqAJCXN0cnVjdCBpbnRlbF9wbXRfZW50cnkg
KmVudHJ5ID0gJnByaXYtPmVudHJ5W3ByaXYtDQo+ID4gPiA+ID4gbnVtX2VudHJpZXNdOw0KPiA+
ID4gPg0KPiA+ID4gPiArCQllbnRyeS0+YmFzZV9hZGp1c3QgPSBpbnRlbF92c2VjX2Rldi0+YmFz
ZV9hZGp1c3Q7DQo+ID4gPiA+ICsNCj4gPiA+ID4gwqAJCW11dGV4X2xvY2soJmVwX2xvY2spOw0K
PiA+ID4gPiDCoAkJcmV0ID0gaW50ZWxfcG10X2Rldl9jcmVhdGUoZW50cnksICZwbXRfdGVsZW1f
bnMsDQo+ID4gPiA+IGludGVsX3ZzZWNfZGV2LCBpKTsNCj4gPiA+ID4gwqAJCW11dGV4X3VubG9j
aygmZXBfbG9jayk7DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbC92c2VjLmMNCj4gPiA+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjLmMN
Cj4gPiA+ID4gaW5kZXggN2I1Y2M5OTkzOTc0Li5iZTA3OWQ2MmE3YmMgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPiA+ID4gPiArKysgYi9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjLmMNCj4gPiA+ID4gQEAgLTIxMiw2ICsyMTIs
NyBAQCBzdGF0aWMgaW50IGludGVsX3ZzZWNfYWRkX2RldihzdHJ1Y3QgcGNpX2Rldg0KPiA+ID4g
PiAqcGRldiwgc3RydWN0IGludGVsX3ZzZWNfaGVhZGVyICpoZQ0KPiA+ID4gPiDCoAlpbnRlbF92
c2VjX2Rldi0+bnVtX3Jlc291cmNlcyA9IGhlYWRlci0+bnVtX2VudHJpZXM7DQo+ID4gPiA+IMKg
CWludGVsX3ZzZWNfZGV2LT5xdWlya3MgPSBpbmZvLT5xdWlya3M7DQo+ID4gPiA+IMKgCWludGVs
X3ZzZWNfZGV2LT5iYXNlX2FkZHIgPSBpbmZvLT5iYXNlX2FkZHI7DQo+ID4gPiA+ICsJaW50ZWxf
dnNlY19kZXYtPmJhc2VfYWRqdXN0ID0gaW5mby0+YmFzZV9hZGp1c3Q7DQo+ID4gPiA+IMKgCWlu
dGVsX3ZzZWNfZGV2LT5wcml2X2RhdGEgPSBpbmZvLT5wcml2X2RhdGE7DQo+ID4gPiA+DQo+ID4g
PiA+IMKgCWlmIChoZWFkZXItPmlkID09IFZTRUNfSURfU0RTSSkNCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oDQo+ID4gPiA+IGIvaW5jbHVkZS9saW51eC9p
bnRlbF92c2VjLmggaW5kZXggMTFlZTE4NTU2NmMzLi43NWQxN2ZhMTBkMDUNCj4gPiA+ID4gMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oDQo+ID4gPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oDQo+ID4gPiA+IEBAIC04OCw2ICs4OCw3IEBA
IHN0cnVjdCBwbXRfY2FsbGJhY2tzIHsNCj4gPiA+ID4gwqAgKiBAY2FwczrCoMKgwqDCoMKgIGJp
dG1hc2sgb2YgUE1UIGNhcGFiaWxpdGllcyBmb3IgdGhlIGdpdmVuIGhlYWRlcnMNCj4gPiA+ID4g
wqAgKiBAcXVpcmtzOsKgwqDCoCBiaXRtYXNrIG9mIFZTRUMgZGV2aWNlIHF1aXJrcw0KPiA+ID4g
PiDCoCAqIEBiYXNlX2FkZHI6IGFsbG93IGEgYmFzZSBhZGRyZXNzIHRvIGJlIHNwZWNpZmllZCAo
cmF0aGVyIHRoYW4NCj4gPiA+ID4gZGVyaXZlZCkNCj4gPiA+ID4gKyAqIEBiYXNlX2FkanVzdDog
YWxsb3cgYWRqdXN0bWVudCB0byBiYXNlIG9mZnNldCBpbmZvcm1hdGlvbg0KPiA+ID4gPiDCoCAq
Lw0KPiA+ID4gPiDCoHN0cnVjdCBpbnRlbF92c2VjX3BsYXRmb3JtX2luZm8gew0KPiA+ID4gPiDC
oAlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQ7DQo+ID4gPiA+IEBAIC05Niw2ICs5Nyw3IEBAIHN0cnVj
dCBpbnRlbF92c2VjX3BsYXRmb3JtX2luZm8gew0KPiA+ID4gPiDCoAl1bnNpZ25lZCBsb25nIGNh
cHM7DQo+ID4gPiA+IMKgCXVuc2lnbmVkIGxvbmcgcXVpcmtzOw0KPiA+ID4gPiDCoAl1NjQgYmFz
ZV9hZGRyOw0KPiA+ID4gPiArCXMzMiBiYXNlX2FkanVzdDsNCj4gPiA+ID4gwqB9Ow0KPiA+ID4g
Pg0KPiA+ID4gPiDCoC8qKg0KPiA+ID4gPiBAQCAtMTIxLDYgKzEyMyw3IEBAIHN0cnVjdCBpbnRl
bF92c2VjX2RldmljZSB7DQo+ID4gPiA+IMKgCXNpemVfdCBwcml2X2RhdGFfc2l6ZTsNCj4gPiA+
ID4gwqAJdW5zaWduZWQgbG9uZyBxdWlya3M7DQo+ID4gPiA+IMKgCXU2NCBiYXNlX2FkZHI7DQo+
ID4gPiA+ICsJczMyIGJhc2VfYWRqdXN0Ow0KPiA+ID4gPiDCoH07DQo+ID4gPiA+DQo+ID4gPiA+
IMKgaW50IGludGVsX3ZzZWNfYWRkX2F1eChzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IGRl
dmljZQ0KPiA+ID4gPiAqcGFyZW50LA0KPiA+ID4NCg0K
