Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26C19CD1E
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723559379; cv=fail; b=LFH5spQemDIHS8tS7+468P7d+lhRtjEDRUJUhmKgeTZQ/OVheb0R5MjcuyQUiyc/piDBdcg2XdleQJ7UYX3UqMnERvkMzsbdeYThiZCnwYWygIuRUEGbUrahPFmUnnVUGT9IzseLbnuX1n42zlBTLdxdqoA0uhOrtxrPbGOP4gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723559379; c=relaxed/simple;
	bh=5HByGShQjRuWu5eKNjMRP3JtWRvuhTpTGb6tos4Sto0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FmewpaK98PuF9FHTPphpZevk4DR49eKgYnZz2JcszyAmRSKOmtA8h4QUiCOOZfHLgp6ZNnIv+K7tqpmwVh7jmPEjYonMe8GQcsCU8IAMEjYHJDxdLVaO2CPsnZwN6MBE3d1LChNvIaJQE9LAfYq97P7n3+cNPDbFka5HDRmn/Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMmejqAM; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMmejqAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723559377; x=1755095377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5HByGShQjRuWu5eKNjMRP3JtWRvuhTpTGb6tos4Sto0=;
  b=UMmejqAMkO7Qj7IZ6vBbLfWPVUblP3b0b+4gBGv/aKiNCLRtD5Fha6nZ
   ivRIHaSp1EiSxiq1ar2EQo2YoRHThe+3Z/Q71Gnh2+mJPUQC+I3JmTbFX
   w+isrrbxRdxUeZvpiABQx0zNltVpo66/p6eXhYz2r5RXSWSHIOnpB4NEV
   rH+ejGLw+1AOFmVqOoZZwf2tsKxOsJZviHYMRxc5S5KhAzMYJsNYYRAXK
   RMFJE5iANXm8/VWmw/3hPs/onNueNITMcI3LCcPtlCk+YyOWjJHM0rCHU
   puzw6ydco1xQqii0Fs6WI9PSJtgPy5RtdUemfjYfFGKgOsaehaye3+SCD
   g==;
X-CSE-ConnectionGUID: V8iyqJbkT0yruNBYPUR+sw==
X-CSE-MsgGUID: Ew7TufnATLugcvN8XrnZAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32869993"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="32869993"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:29:36 -0700
X-CSE-ConnectionGUID: cGToorefQOe1GIWmQFsr+Q==
X-CSE-MsgGUID: vvHh3mb3S4S3pl7/SdgG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="59446476"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 07:29:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 07:29:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 07:29:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 07:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOe2rqF9mulnXVRjq82CE5R6czDlUXUe3f5+qR0S9ugW+Me3EczLBhp4114kWOhRPmCMZncqY0HWFHrx/xd7y0+WQqsXeh1on25o6zfIDhRZrRW3FkfxeXHPEg2BOEXsDHub3WfZbbH4F6BDDRPw+G2scusYbSaFQQYC3jF0jaqEbIy2tXhsRQYqZ4d3mgkcreywYgYxmN+Ec17afkRkZR1Bg0aTImAkcYGDYcSsqgRjYbTgOxB2bXRZiQk8FUbZhaLWTi3TO4ZNA9AkycrbKfCzPfj5f+WxX3j/9KOrD5R8OOSEfk0MZkcMoJwMq2iwJmKY2fPLX7z7WNfzHR/P4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HByGShQjRuWu5eKNjMRP3JtWRvuhTpTGb6tos4Sto0=;
 b=ushmYo5YYQx0Bw/T1+SV0kuU9uXqLWZs9D3si/scGX+RY1EXansQdqFEdKeZKMjionxaULM9tUiMStZnud5uzW5slOlsgEfYB2fuWKt3EhS3w+7qzGklJ7q/F8Q5vFh44RRdTuX2o7gz/N2WA0aISU1uGjBFLSAdxhxZX/rggTBgR3KInLowS1rs7C1y9cGEdcrHGnbmk2v6juO2q+3PkIgr4f/T6maSmzg+wTjdoMXlLEIBbrNTE4uA9rfQ7a57kpPajxH5AQhgmr/+AwTqdtWDf8off7BZaDwKdY62n+Fp3AiCF0Ut65oX3h3oSUrsZChSOc8eJbXI+X7AhFqdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Tue, 13 Aug
 2024 14:29:27 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 14:29:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v11] drm/xe/vsec: Support BMG devices
Thread-Index: AQHa7PLeMjbADDlLS0q8Q7oONLxOFbIlO12AgAAApZA=
Date: Tue, 13 Aug 2024 14:29:27 +0000
Message-ID: <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
In-Reply-To: <Zrtpd_WwougszltH@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV3PR11MB8460:EE_
x-ms-office365-filtering-correlation-id: 5732a3f2-7c47-45bf-00fb-08dcbba455f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SHlRVnF5U2ZMOUF5eFlrcC9EL0JHdGt1SEs5WndQQU45VnZab1I3Ry9aTjZY?=
 =?utf-8?B?dTlIbENxWlpDcmpzTWtEMkpTcndXT1FXVmYyOXBMTlNZQ3gxVkFSdXFOa01R?=
 =?utf-8?B?eTR6NjVYT2h1emV2b2g1V1pOSEh1Y1Noa1htQ3BGOFBXY1ZTeDBlNGFhN3R5?=
 =?utf-8?B?WTVuQ1JRL0Q0Mkd3ZHJ0Y3dlMDRGYVdLYk1RTkZZMlpDeFdKak4zVGJwY3Ay?=
 =?utf-8?B?RFdEeUkwcVFrMmErNEZEbHkrUjNHZ0t1cTZqd2pXVXZTcWlUNHpnYnZjWXc0?=
 =?utf-8?B?U054dlRMbFdHMEdWeDVzS2tvSWYzU3QwVnRqZGh6MHNESHpWZ2RPVFZ3aEdW?=
 =?utf-8?B?Rmh5UDIza1k3Mlg2eWo4dE50ZTFwZWlUSW50MjJVZHVKcVZDcmJQNUFpYmZE?=
 =?utf-8?B?czQxbElBYmQwWmVoc2U4VXBPYXB5NjNLcWRNWWNwUitwUSt4QVFnNjU5dWdv?=
 =?utf-8?B?V2hKM09ieVQ4bXZzODg2UytLZktYWXBCVDN3R2J3aU5tNTY1bXU2WkxTUlpU?=
 =?utf-8?B?RWZDSmpSdXNsY0xRT3BwTjNQVllDcERyZUtNWUhDczRrS0w2ZVZiR0o0cmEw?=
 =?utf-8?B?dzdOT2NRYTF0b2UvdVpZalk1RzVjR2k4enNjM0ZSUXN3RndXZ2Z6dEJmV09z?=
 =?utf-8?B?dXpqZ0w1SmZoUmt6ZXpKTzI5c24xMS92WnR1Ni9yWVRkZTNSVjRpZmtJZGR4?=
 =?utf-8?B?RTduWmVoR3BPZEZrWExLM2JmTzBpcXJBaTR5cmZHajRVVTF1a3ZGc0hGazNB?=
 =?utf-8?B?N2tOS2FVYkFXaGdRUHJSWWdjN24zeVJac3VsUjlsMVI1ZmxDbkRnTUlreTI5?=
 =?utf-8?B?NWZIaWhxT25VVm5DRHBCZnQyZDJkY3o1R1o4M2c2STBMWkFKY0RrUGtYY2J3?=
 =?utf-8?B?bGJCQzJoeDZqdmIwUVZFNWpsV25Ma0hoRXVLNm5aaXYyOStrcFFCUmRjMWJY?=
 =?utf-8?B?ZmkrS3g0OG5MaG5zM3I0RnNaWEIrU1V2RkJqV05pMHltVXdISUxBQTJEMDZG?=
 =?utf-8?B?N09ydXNjaGlvZUJNOFM3ekcyYXNLZFJiM0ZQRWNIL3VJVHBrY0FEZVJIM2p6?=
 =?utf-8?B?dER3NzBqUVE4Sy9BMkt3MmxQREhiek02TnUrQU45c0VVZU9mUEo2bDgvM3li?=
 =?utf-8?B?OFI3TG45a3VXQ244aXhDMjk1aVBtVFBVV3pxalNsUHZsY0pUd0tud2pvZ2Vq?=
 =?utf-8?B?TFBDb29YYXExdzgvT0N1THhjemFUekZZRDVpSVFSSk1lY25ZZE9vSWJkTUsz?=
 =?utf-8?B?dEFIUE5CUlpWdmJCbDE5VlV0Q00yeldIc3JrTi8rcEd6dzBjZFBveFFMQVE4?=
 =?utf-8?B?RnRUT1ZmVVcvbnRhYXlaSTNLT28wMDNsR1RGQVM2VmRYVjZyeCtPN0xqbUhM?=
 =?utf-8?B?eDREZ1ZORFBiQzJJRll4NUVaTURnamlVRVJ5YkxFTzcwcGU4TU5MSFpCdldh?=
 =?utf-8?B?dUc0Q1p1SEx4WWt2ajlNa3A3bitCTHRwenI2cjJobmVoaGJZeE1MNVZuWEpp?=
 =?utf-8?B?SUtuRmRlaUtqL282bC9UZU8vZXBYWWt5ckluZmt0MGV6LzZOc1VkRG1NM0ln?=
 =?utf-8?B?NVRVa3d4UVdQaWNzZlRJNktLS0JIb25PclRhRFNwckczd2ZhZGVEUTJGT1M1?=
 =?utf-8?B?N0hEcmpId1Q0V0pWT2xsTVp5NUVhZFhxeXR0ajdmblk4eU51Nk5OMVpYY3Fh?=
 =?utf-8?B?UHQyU1FhbkE5aktZY0w4TUNJTjNKbFBPbVRQV2VHQ1d5K1EzZjkwWWpYazE0?=
 =?utf-8?B?MjRQcUU1QlUrU2J2aU5CZkp3WTQ5M0pUT1ltSWxPc1k4R29FTnAvMXpqcmlF?=
 =?utf-8?B?SnNvWXhxeHNxSmtxdXozQ0dTMktjQUt1NHlKQ1dTVWEwNmlFUGJuMHBFdTU1?=
 =?utf-8?B?RWNvUFFIK3pTaFBDejQ4SWtyZkZERTRmeFJ6Q3gyWlJTZFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3phMjVRam1FNFBnS0kraGhWRFdiRE1PNFZ1NUY1SmtlS0MyWkh4RFpLOXRz?=
 =?utf-8?B?U1E0MnpsbndxOERuS1FsK1dtM0dCWUlhWCtZWEJHMDBEMVlKRjkxQ0JVSVk4?=
 =?utf-8?B?MFBZZFpUUUJGWnc1akNGcVVIanVwb2diSTNWbWowNDN4clV4ZEZWU0NUakhi?=
 =?utf-8?B?RmtMZzF3eDN6S2RmTjY4S2hXbHdwbU9rV2tvbEUwR25yaURzUnRzRUliVW4w?=
 =?utf-8?B?SnpqZmpHVFI3MHFLWnpjVHprT0tVSER4eitWMlB1MFp3d2l4aHNEc2k5SjlX?=
 =?utf-8?B?OEU4emJuM2FmQUZHMHNFWFNHcEM5WGRPTjNTYkJOdlNmZWcvK3ZYWlRKajFx?=
 =?utf-8?B?bE5lbHlJNjFFT1Bpbk56WmxOUFFhQm1kNWpMT05UdTcwekFwcEhTMGJ4bENa?=
 =?utf-8?B?T3ZaNGlLbEZMTGo4WG11RzhGNzVLRW8vb05WbEpXK2Nkam5STHdPN3R6d0dW?=
 =?utf-8?B?WURsNytaY0dqOExCR1A0UnJMVG5PZ1RIcTF5eGxuRWtyMmM0d0l4NDZCTU5u?=
 =?utf-8?B?WEg2dkl3d3NUWlptMVFyNTY4dENKMEZvYkxPTmVCZy9WTlFwck8xRnBCS2pq?=
 =?utf-8?B?QWNGaGxybzJBYjYrRVJjU29tcmoySGRkU0tQd0R4N3hVU2ZJOUw0ZEt2Y0tu?=
 =?utf-8?B?ajNJdFA0RTVpaitCQVdYYXY5enVQeEZkUUFXQVM3MDFUcUQ5ZW51d0oveFpD?=
 =?utf-8?B?c1dJbnNrL2g5QmVxeDhpanlWR0RSYmlWRXBiand3SWYxRldUUURtRGkySzA1?=
 =?utf-8?B?NlFHeFdwMlJoaWhzYm9wQ1NhS3FwUEgwM2ZzT0lsNGVxcHc4RzVZajlHM0pm?=
 =?utf-8?B?Mkc1U1ArM3ZIenp2bklPRnNWUUZSZnUxZTRtRDcxR3hEYXBSZXU0VkFKZnZN?=
 =?utf-8?B?UDAybGJqTlZMZjk3MnRyZ3NOcERjLzJPSWpUelpXNjJFNUkyY0krN2Q3THJo?=
 =?utf-8?B?dURWVlBvc1dMVmlaekdKdnUxMXdCSjJ4OHkvdElGckRBVkJGTlU5MWJkanZJ?=
 =?utf-8?B?d3JTUng5dEZXY2d3ZVJIREo0TXlZcXFMU2ZoUEs2VXBBbjJZWjFDUlpnYjlP?=
 =?utf-8?B?ZGkzVDhBNFhpVUZmVjNUNnhUTFU1OWN1NnlJNjFGMzZhV3p1ZlZEWVpVYnlI?=
 =?utf-8?B?SllubjJ2RkltMER1dUc2T3hTT0tNWHJpNWYwNjM3Nk9Ra0RVZm54UkRqaHlX?=
 =?utf-8?B?QURLaVIwSTQ0U0hZRWpubVFSL1h1Mnc1ZlV5T1VGNExIUDl6WFdiWU9WUk9C?=
 =?utf-8?B?cFQ5U0QvWE1zK2N3U0Y2NXdiM2g3Tkw5SUlnc2hoSXdkOUUvQUNsRmNFT3JC?=
 =?utf-8?B?MFBEYVZoTW51R0x0TG9WYzYxdnlmYW1jTThyMmdiRFhML24wdVZWOVVTcDBt?=
 =?utf-8?B?WmpvakNnN0pDUTI5K3ZHSXpDMStlN0VyeW5mWnVxcnpoQ0ROWVNKODlpSFg1?=
 =?utf-8?B?Ry9VU1plODIxQjRVVktIVCtwNk9wZWhBVW4wZFBjTlBHdlpaRndkVEJ2ZE1C?=
 =?utf-8?B?L21DdkxRWjN2MlhvM0Fvc3VQVXZvSGovTkUxWW5yTXdyR1hnSnlMNk1ZM0Rh?=
 =?utf-8?B?WURjb2QxUGMxdHlGaXpsem5wTmNrdmt5MWFFcDFDQWN5VnhFbjdIeWpxaVlZ?=
 =?utf-8?B?Yk9SeWNCVHhMZ0xVeDdUenBsMTh4ZGFLNnNZSll6Tit6SWJ2STBFR2N6VUtq?=
 =?utf-8?B?RkVJd2xPeE1jaEZLS1BwdkVScnREb2FvVHprN0g2a1R2cUE5SGdGNkJXVkh2?=
 =?utf-8?B?WjRtYWNOcnBiYXZMSy9FU0dpb2s1T0NwUm1tWFMyUC9mblcwL0I2Y3JaNFVK?=
 =?utf-8?B?eGFQbjQ3RTBoU0RTMk15MDhzejRzQVROVElDcVBrQlRUZFRUcHpsdlFUUkd2?=
 =?utf-8?B?VldZSDdrVnVLMCtoRmxET1NDeWVMMXlQaThQQUhIZGt5dFFXcEltVHMvdm1h?=
 =?utf-8?B?VnBvdW1LckdTc0gxWkxyQjJ3NFZ2QU80aGovR200bDdxU2s5THdlL3FpeThL?=
 =?utf-8?B?Z2FWVGQ1ektOMVhXVG5vNnBSN0tUWU1ySFBUWFlQWk5vRytSMnF4eDd0a01k?=
 =?utf-8?B?VVNFKy8yOHpKcmlNUXJja2xsSUlJY0QrRXJKUndYSnhhanJNdVhxVmxJZ1hT?=
 =?utf-8?Q?AlNrwVfwBAD0rf/kBYNUv7TC0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5732a3f2-7c47-45bf-00fb-08dcbba455f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 14:29:27.0872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0UE/Gjr+VvZrHICsvNZ3EwqF/gnDPOlST+spOMTlKX7c+aPBApk5g6/vIjE/cvEwhb/A0kFt0SlfCf+fCWreIJkF3IpKDArvJ47/0BksXws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0
IDEzLCAyMDI0IDEwOjExIEFNDQo+IFRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhs
QGludGVsLmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgcGxhdGZv
cm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRhdmlkLmUuYm94QGxpbnV4LmludGVs
LmNvbTsgaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3DQo+IDxt
YXR0aGV3LmJyb3N0QGludGVsLmNvbT47IGhkZWdvZWRlQHJlZGhhdC5jb207IFZpdmksIFJvZHJp
Z28NCj4gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEx
XSBkcm0veGUvdnNlYzogU3VwcG9ydCBCTUcgZGV2aWNlcw0KPiANCj4gT24gTW9uLCBBdWcgMTIs
IDIwMjQgYXQgMDQ6MDQ6MjJQTSAtMDQwMCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPiA+IFRo
ZSBCYXR0bGVtYWdlIChCTUcpIGRpc2NyZXRlIGdyYXBoaWNzIGNhcmQgc3VwcG9ydHMgdGhlIFBs
YXRmb3JtLA0KPiA+IE1vbml0b3JpbmcgVGVjaG5vbG9neSAoUE1UKSBmZWF0dXJlIGRpcmVjdGx5
IG9uIHRoZSBwcmltYXJ5IFBDSQ0KPiA+IGRldmljZS4NCj4gPg0KPiA+IFV0aWxpemUgdGhlIFBN
VCBjYWxsYmFjayBBUEkgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBCTUcgZGV2aWNlcy4NCj4gDQo+
IC4uLg0KPiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9iaXRzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGVhbnVwLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9pbnRlbF92c2VjLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9w
Y2kuaD4NCj4gDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBTT0NfQkFTRQkJMHgyODAwMDANCj4g
PiArDQo+ID4gKyNkZWZpbmUgQk1HX1BNVF9CQVNFCQkweERCMDAwDQo+ID4gKyNkZWZpbmUgQk1H
X0RJU0NPVkVSWV9PRkZTRVQJKFNPQ19CQVNFICsgQk1HX1BNVF9CQVNFKQ0KPiANCj4gPiArI2Rl
ZmluZSBCTUdfVEVMRU1FVFJZX0JBU0UJMHhFMDAwMA0KPiA+ICsjZGVmaW5lIEJNR19URUxFTUVU
UllfT0ZGU0VUCShTT0NfQkFTRSArIEJNR19URUxFTUVUUllfQkFTRSkNCj4gDQo+IFRoaXMgbG9v
a3MgbGlrZSBkb3VibGUgaW5kaXJlY3Rpb24uDQo+IFdvdWxkbid0IHN1ZmZpeCBfQkFTRV9PRkZT
RVQgYmUgYmV0dGVyIGZvciBQTVQgYW5kIFRFTEVNRVRSWSBjYXNlcz8NCg0KSSBhbSBub3Qgc3Vy
ZSBJIHVuZGVyc3RhbmQuDQoNCkFyZSAgeW91IHNheWluZyByZW5hbWUgQk1HX1BNVF9CQVNFIHRv
IEJNR19QTVRfQkFTRV9PRkZTRVQ/DQoNCj4gDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBCTUdf
REVWSUNFX0lEIDB4RTJGOA0KPiANCj4gSXMgdGhpcyBkZWZpbmVkIGluIGFueSBzcGVjaWZpY2F0
aW9uPyBJIG1lYW4gaXMgdGhlIGZvcm1hdCB0aGUgc2FtZSBhcyBQQ0kgZGV2aWNlDQo+IElEPw0K
DQpJIHRoaW5rIHRoYXQgdGhpcyBpcyBkZWZpbmVkIGluIEJNRyBQTVQgeWFtbCBkZWZpbml0aW9u
LiAgSXQgaXMgcHJvdmlkZSBpbiB0aGUgUE1UIGRpc2NvdmVyeQ0KZGF0YSwgc28gaXQgaXMgZGVm
aW5lZCBieSB0aGUgc3BlY2lmaWMgZGV2aWNlLiANCg0KDQo+IC4uLg0KPiANCj4gPiArI2RlZmlu
ZSBHRlhfQkFSCQkJMA0KPiANCj4gRG8geW91IG5lZWQgYSBzZXBhcmF0ZSBkZWZpbml0aW9uIGZv
ciB0aGlzPw0KDQpHdWVzcyBub3QuICBXaWxsIHJlbW92ZS4g8J+Yig0KDQo+IC4uLg0KPiANCj4g
PiArZW51bSByZWNvcmRfaWQgew0KPiA+ICsJUFVOSVQsDQo+ID4gKwlPT0JNU01fMCwNCj4gPiAr
CU9PQk1TTV8xDQo+IA0KPiBUcmFpbGluZyBjb21tYT8NCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+
ICtlbnVtIGNhcGFiaWxpdHkgew0KPiA+ICsJQ1JBU0hMT0csDQo+ID4gKwlURUxFTUVUUlksDQo+
ID4gKwlXQVRDSEVSDQo+IA0KPiBEaXR0bz8NCg0KV2lsbCB1cGRhdGUuDQogDQo+ID4gK307DQo+
IA0KPiAuLi4NCj4gDQo+ID4gKwlzd2l0Y2ggKHJlY29yZF9pZCkgew0KPiA+ICsJY2FzZSBQVU5J
VDoNCj4gPiArCQkqaW5kZXggPSAwOw0KPiA+ICsJCWlmIChjYXBfdHlwZSA9PSBURUxFTUVUUlkp
DQo+ID4gKwkJCSpvZmZzZXQgPSBQVU5JVF9URUxFTUVUUllfT0ZGU0VUOw0KPiA+ICsJCWVsc2UN
Cj4gPiArCQkJKm9mZnNldCA9IFBVTklUX1dBVENIRVJfT0ZGU0VUOw0KPiA+ICsJCWJyZWFrOw0K
PiA+ICsNCj4gPiArCWNhc2UgT09CTVNNXzA6DQo+ID4gKwkJKmluZGV4ID0gMTsNCj4gPiArCQlp
ZiAoY2FwX3R5cGUgPT0gV0FUQ0hFUikNCj4gPiArCQkJKm9mZnNldCA9IE9PQk1TTV8wX1dBVENI
RVJfT0ZGU0VUOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsNCj4gPiArCWNhc2UgT09CTVNNXzE6DQo+
ID4gKwkJKmluZGV4ID0gMTsNCj4gPiArCQlpZiAoY2FwX3R5cGUgPT0gVEVMRU1FVFJZKQ0KPiA+
ICsJCQkqb2Zmc2V0ID0gT09CTVNNXzFfVEVMRU1FVFJZX09GRlNFVDsNCj4gPiArCQlicmVhazsN
Cj4gDQo+IGRlZmF1bHQgY2FzZT8NCg0KSSB2YWxpZGF0ZSB0aGUgcmVjb3JkX2lkIGFuZCBjYXBf
dHlwZSB2YWx1ZXMgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZnVuY3Rpb24sDQpzbyBkZWZhdWx0
IHdvdWxkIGJlIHJlZHVuZGFudC4NCg0KVGhlIGdvYWwgd2FzIHRvIHZhbGlkYXRlLCB0aGVuIHNl
dCBkYXRhLg0KDQpTbyBhZGRpbmcgdGhlIGRlZmF1bHQgd2lsbCByZW1vdmUgdGhlIHJlY29yZF9p
ZCBjaGVjayBmcm9tIHRoZSBpZi4gIERvIHlvdSBwcmVmZXINCnRoYXQgcGF0aD8NCiANCj4gPiAr
CX0NCj4gDQo+IC4uLg0KPiANCj4gPiArc3RhdGljIGludCB4ZV9wbXRfdGVsZW1fcmVhZChzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdTMyIGd1aWQsIHU2NA0KPiA+ICsqZGF0YSwgdTMyIGNvdW50KSB7
DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0K
PiA+ICsJdm9pZCBfX2lvbWVtICp0ZWxlbV9hZGRyID0geGUtPm1taW8ucmVncyArDQo+IEJNR19U
RUxFTUVUUllfT0ZGU0VUOw0KPiA+ICsJdTMyIG1lbV9yZWdpb247DQo+ID4gKwl1MzIgb2Zmc2V0
Ow0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSBndWlkX2RlY29kZShndWlkLCAm
bWVtX3JlZ2lvbiwgJm9mZnNldCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7
DQo+ID4gKw0KPiA+ICsJdGVsZW1fYWRkciArPSBvZmZzZXQ7DQo+ID4gKw0KPiA+ICsJZ3VhcmQo
bXV0ZXgpKCZ4ZS0+cG10LmxvY2spOw0KPiA+ICsNCj4gPiArCS8qIGluZGljYXRlIHRoYXQgd2Ug
YXJlIG5vdCBhdCBhbiBhcHByb3ByaWF0ZSBwb3dlciBsZXZlbCAqLw0KPiA+ICsJaWYgKCF4ZV9w
bV9ydW50aW1lX2dldF9pZl9hY3RpdmUoeGUpKQ0KPiA+ICsJCXJldHVybiAtRU5PREFUQTsNCj4g
PiArDQo+ID4gKwkvKiBzZXQgU29DIHJlLW1hcHBlciBpbmRleCByZWdpc3RlciBiYXNlZCBvbiBH
VUlEIG1lbW9yeSByZWdpb24gKi8NCj4gPiArCXhlX21taW9fcm13MzIoeGUtPnRpbGVzWzBdLnBy
aW1hcnlfZ3QsIFNHX1JFTUFQX0lOREVYMSwNCj4gU0dfUkVNQVBfQklUUywNCj4gPiArCQkgICAg
ICBGSUVMRF9QUkVQKFNHX1JFTUFQX0JJVFMsIG1lbV9yZWdpb24pKTsNCj4gPiArDQo+ID4gKwlt
ZW1jcHlfZnJvbWlvKGRhdGEsIHRlbGVtX2FkZHIsIGNvdW50KTsNCj4gDQo+ID4gKwlyZXQgPSBj
b3VudDsNCj4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4gDQo+IERvZXMgdGhpcyBoYXZl
IGEgc2lkZSBlZmZlY3Qgb24gY291bnQ/IElmIHllcywgYSBjb21tZW50LCBpZiBubywgeW91IG1h
eSByZXR1cm4NCj4gY291bnQgZGlyZWN0bHkuDQoNCkl0IGRvZXMgbm90LiAgSSB3YXMgbG9va2lu
ZyBhdCB0aGF0IHllc3RlcmRheSAod2hlbiBJIHVwZGF0ZWQgd2l0aCB0aGUgZ3VhcmQoKSkgYW5k
IA0KdGhvdWdodCBhYm91dCB1cGRhdGluZy4gIEkgd2lsbCB1cGRhdGUuDQoNClRoYW5rIHlvdSBm
b3IgeW91ciBjb21tZW50cyENCg0KTQ0KDQo+IA0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0K
PiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
