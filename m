Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0825D54A
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480093; cv=fail; b=vCg1A1FEyBUAZTlM/0UVuIipTw0tUIuXsd+fU1C9Ww8PLbhyr2gmNpP3sPwzA1aYhoSBmgu0wEA6RvPx4NU31BMH3K6XTebep8HpXhtbBtbm2C8qAqk5sanM9y7rOti1FojTyY2556QDjAdmIXXoVvFsetC6nUAHeebXzxLuRcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480093; c=relaxed/simple;
	bh=OppGvxQRoabo/hor+3C5toDWs4fguoHD1l8AuTT9IAI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=duzP5qR4hb0OUuHoHqrJI0+mubsZB+szcQCN/oHwTaCXIgf4NO55kOZvrG+b5AwBMjg6EqhWMouWXMN95vA8ULySy1DtY2mwPs0Xxw7+kTvWnExLwjmb0jThbl/xNoRwMxrjGwzMHMO7YFw11x426Z/NCXeJmEK6RzDzEOP5bV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJej5ULE; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJej5ULE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749480092; x=1781016092;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OppGvxQRoabo/hor+3C5toDWs4fguoHD1l8AuTT9IAI=;
  b=OJej5ULEaZtkhPUXrXm2WrbNmLIRyzgfkmnFIGQIoVOuwROWILNW5Jc1
   ntFb1dAqZpkprYNxMitK559OaCkJuzghlM6h1uEVjLUOUmEPD5TFndEu1
   yqy3xF9JloSS6udlehum8Zb4T24vgG+l4N28UAH4OjrK8ZFfV5ff/AnKm
   Tp0jdVyFZtizJRKOV637h3h6l9W2nzvEXSDl/sy2OPzG8DWllD7JHjTgK
   1u7RILZRwxw6yxT8UfQCOdFuzrSTxMPXgdBf31IwTBmgGD46zJuqDfxoN
   Rs2f3pCL23Z8xngfpO9LRl+VQ8fJxukkNKDPugdN1T/wfIbfkycpzGu2W
   w==;
X-CSE-ConnectionGUID: 52yqwncfS26NAsKAcAaY+w==
X-CSE-MsgGUID: GLzAbf1KTjGbBuFlm5GECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51554149"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51554149"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:41:31 -0700
X-CSE-ConnectionGUID: ecj1j/dWSR6n0x606dwpzw==
X-CSE-MsgGUID: 0POUdfdNRFS8FmI8Ym504Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147469781"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:41:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:41:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 07:41:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frR1iGlW4GcmELPlkHi0tbaFrIbHeYFnN2+tUH3RqjE6iP/GBmxo1DOGGMqI5zsFtFp/IzcSQv+d/UqWYlUrDbaMK2wyi7x6AmwV46CAE/Sm5AmqxD42U3+AysjvdJJhTt+ntpxe1Xxb2zT3cCC6w+O57O0B2TY9DZpnC/IXDIA9hHFt1sWBQUazeh5k5q19thoSgdctyDtnccRX0iDyTV+cjjV5NhoC2UjoUCSe9t17QjdXNmV5GYbXBT//FAIpRGfDVoVlmkunKmvxJATpvjwiiezL0wKJgjnSPlVju/+BdLxTgeEz10Nr5t3AuMPfULIUfWJPD6Bm/MvFd/CHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OppGvxQRoabo/hor+3C5toDWs4fguoHD1l8AuTT9IAI=;
 b=PBynzNXkD1vxgOUhZGBTY9qqc+S3O6IEfLeutYWedUXDKidXpYsZTAOxI36iVkWm5mQn9YPyh2wKZaf37ikM92r+o/xAdMMvl697e+ht5IF4OiGFWImgJp0Fziw7aJiiw/92O4ePac1yFGbku9nv9Y2H5vgCzIx13ren+piCYqzZtR+5Tpb972bSDT3nof3UtG2Fv1X5S75nOP+VkThDpQHJiqyYlZXmKkSsYW+GDEotNeheQnvLFe9YYgkRt5VAB7DUJj5MThJ6ceM4fiCRls7hyjmARTGNx2buyQ7fH/E67enx9PIFU4b0omOv/UYVAK63SzalGTRBQn/G1rtJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 14:41:08 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:41:07 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: RE: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
Thread-Topic: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
Thread-Index: AQHb1koESs05iW5SRE2GuA/7jWt6XrP2ovcAgARJFQA=
Date: Mon, 9 Jun 2025 14:41:06 +0000
Message-ID: <IA1PR11MB64188405CD4E7689CA2E5D04C16BA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-4-michael.j.ruhl@intel.com>
 <de8a20f75094e0bc62d9459afbe7689cc6f1aab8.camel@linux.intel.com>
In-Reply-To: <de8a20f75094e0bc62d9459afbe7689cc6f1aab8.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CYYPR11MB8305:EE_
x-ms-office365-filtering-correlation-id: 2f528a6b-636d-476f-cf8c-08dda763ab0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VWhmVkxsbjkwMTBmUHZuYUVVTjNGWk4va1FnZllLOWJQNnJ0b21yU2ZqNGpW?=
 =?utf-8?B?MXRvaXhaSFhiTTdLTlJwdnZPaENLTDdsM2lRT2h2d0duYS8rN0hmYnZ5ak1i?=
 =?utf-8?B?L0RxeGNQR0wzTnZZMEoxUnpvRE4wT0VpRFFrSzgzdVBXdGNQeEgvbENtUUN0?=
 =?utf-8?B?OHpwN1Zob3NrUXNXNVRFamR5R3orQWk1RFZvUVI4OFlqY0dlUEg2TVNWRjQ3?=
 =?utf-8?B?VTdqZFIrUDBiakVCMTVDc3VsRjZpakVFenZwSmZXQXcwaWo3WEhnWUdJdXQv?=
 =?utf-8?B?czBpVHdEZ0VYaHc4U0trMS9DUG91VDdURGJiOFF0VTY0MGJESWx0TTRha0V3?=
 =?utf-8?B?dFFFZXpHek1BSVF6WFBBcXRnYmEwNzd2Z3FOOUdpdXNHbUVnSnJHM3NQMk9t?=
 =?utf-8?B?MTNVSFlGcjRyYWZtS3pWMDZVS214OHRYSFVlUTltN0xCZWkyWDdkNit4MWg2?=
 =?utf-8?B?NksvUG5TYjJpWlRDTFVQZDBqcVhxaXJYRFVXMUFjVkhJYkpCb1R2VFBidHhl?=
 =?utf-8?B?VURiOUNTd2ZLWlhNSG5IN0p6aHltc21UUVVCcUtDdjEvNFpNZHpYNGJhN1cr?=
 =?utf-8?B?aHJKM2pMaEFqNnV1U0dCSm9yanN2Rms3NC80Wit1c0p5R3JSQ0xpaGplQmQw?=
 =?utf-8?B?M09SQ21mTUt2UFpKUFoyWFNVZytiSHZHaUhSTEQxZHpVczlIMGxaUEtVc3FY?=
 =?utf-8?B?Q1IyQ012M0JVRWdsY2RaVCtIM3hqRzZUSDR2UmpGaks2ZG5aU3VXNitzS0p3?=
 =?utf-8?B?YTE0ZGlsc0x6cTRydWZJVWVwSXZKZ21DMFk1SHY1K1hPUkkwZmxqOHlGVGRC?=
 =?utf-8?B?WVYzVHhxaGZWK2RyMkFEcjRqTGgwVUZzbTV6SlhEaFJCMi9IU1VEdVlWUW1J?=
 =?utf-8?B?Q1JMcHNoN05hTnNYWEo4VXVWSVdwSVZ3OGxLWFNPV3F5N0RaQ0taN0hRRzVM?=
 =?utf-8?B?R3hDVWNrOGNJTDMxRkJrNjN6MVVTQ09EUkVXOVZLVjk0cnFwNE01eFhDOUla?=
 =?utf-8?B?QjJPSVNIejR4K0FNZ0RWR0N3SDRaMEtLMmNsSkJGS2h6STN4WnhqKzZvNkxN?=
 =?utf-8?B?ZG05bk5lRmwvR2NMMXdpTUtLTEx2cG8vV2hWVWhYdkJWTUExaFM2RmwyQ1Nm?=
 =?utf-8?B?ZkI5V00zMXYxRmNjK0FITFZwa0RrR2xhWU1pRzA2cDkxTzRhN3NBZWY3NWZC?=
 =?utf-8?B?Z0ZGVUNJaXdpbnMwL29WM1hEQVVaVUhQbkJCYmhWZXh5SmVmdXZxMGxMcEJl?=
 =?utf-8?B?TjA1TmNUSHdwM1Bkc1cxc1Vka0hCRTdOU1BpeURZUS9zY2ZJQVllLzdpZXpE?=
 =?utf-8?B?OEVRdmNNZ3ozSC9QV3c2OVI3WjlabDZqTzQ0TzBmRjV4RldTbzV4ZGc3MjBQ?=
 =?utf-8?B?OStjbEx6TXdTUUFVSEhsWE0zRExnRkFBRlFiZFdwQkVEMkV1ODVUSkc5a1ZP?=
 =?utf-8?B?S2NhTVoxT3FLNmFaaWxmUExFdVZDRjV0MnkxMDdXVkN4OERqTzhOTG9NL3VH?=
 =?utf-8?B?M0dxVzN6alYxKytZcWtDaHA1cGExeTNYS3luMHFQbU05MTF4MjI3c0VPdG9U?=
 =?utf-8?B?T0JiSkw5Z1Boa0F0bmhwZU5jNTJxZW5mZDdqTXFXSkNneHIzcmgxRHY2RkFY?=
 =?utf-8?B?ZjhGN2wyVnJTNnJPVWlGVWcwNXNWUm1ZOStpR2Jsam1Xa0tRbk85WWFvVWdz?=
 =?utf-8?B?UXJYZ1NjblRJdm9LNTZaQ0FlczF0ZktWNzVZZEVsYmgreDlOTW45MkFqQ0hz?=
 =?utf-8?B?WjVheE9LTnNNZVpDaXF3b2IrWWVHbFdESWpVNXhHVk0wYkgrR1lxL2NJVGd6?=
 =?utf-8?B?di9sKytBNGdXaU9rUGQrZk5JNVYrMFUyNmJFREJHWnZBcGlzQjdYU1F5YlZR?=
 =?utf-8?B?SWdVNzVIVjhvWDB4d1BJSVFtYjNmd3EyZEdYbmFVbGx3QVJpZzl5ZzcxMGR6?=
 =?utf-8?B?ZWRWajdKNy83UVZZbjBnbWEvUkg0VzB5NFdGNzQ3STVHRDdwS1R0ZjJCczhS?=
 =?utf-8?Q?Ac2+RIubAeBVGGNY9zuTl47NvY9ZqQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHVHSjBKYk5aRUJkSk95TDVmZU9SUnlMNmQya0o5WWh1ZUM2aGJRT2FXWFpS?=
 =?utf-8?B?UVpzSmhUbUhUUkdwelNaUkNtblFXV0FjdHFscnA3VWdUcktBcUZva3REQUlr?=
 =?utf-8?B?L3gvVE4zcGIzSVVLcEpwekdraVRiRWxJY3B5WVJhb1pXbkgyT0lwM3NUVldB?=
 =?utf-8?B?SUFmdzgxSEdVN1FBTEQyRDRhdGVQaFlha2F4aXBwY3BNUUJZa2M2VU95Ykdq?=
 =?utf-8?B?alI3ZllqLyt6YVBHK3ZCY3FPcGVDcUMzVkZYYkMwNVJ4Y2t3RlE1VjdIamNN?=
 =?utf-8?B?TDRrUlhXN1NvUWUvK3k1Z0JsUncyL1ZpMHhXYWllTS9Wb0JjQ1BSeTFnU0dl?=
 =?utf-8?B?VnRXb1E5NjAxL3hIRDhvbDkwZGxDZlZNaXdpOFRUa1dnVTJRMjB6dG1UdGRC?=
 =?utf-8?B?WWhON1NwZkx1Z2ltbG1CUnpCV1hVS09CSTJhd2hoZWhHdHBFYlAwbE8xVHFw?=
 =?utf-8?B?TE0xQjl0RE9UZHhOa0xOa0VEZlFxTUhWRWJxU0p2b3JCY2hDYTVpdENvZWRy?=
 =?utf-8?B?TFBRc0MwakVzWndJM2NwYU8reWxBVzd5V1I0MDdoeng0VE5OSlNENUVHM1B1?=
 =?utf-8?B?MDZNbXNYd2lBNGZON2lGTEsxTTJ5QmhNeDlQTGJ3VjZ0UkR3bXZSZXlWTkkw?=
 =?utf-8?B?VjlPd1orS0RkLzFGVHdDY0Z1Q213eTcwQld3cGE2cU5xb3NzYWYramw0Y2c0?=
 =?utf-8?B?M0trZitOcklyRXNQUktKOWhtYzR1N2tLMXkwQk9zMzVKbFpWd2FPWFE0TE9W?=
 =?utf-8?B?TjgzRGZ0ZCtrakQ5ZnNHSXgwZzV4WFdrOHF4YXFXcklmZ2hhS3A0akUzRmhY?=
 =?utf-8?B?VE52enhSRmhNcmtxRkVHN2dMNk9PbGlFeGZ1bG8vbDdqQXJPb28yUlhOWUJX?=
 =?utf-8?B?L2ZoaklaVkJBdjliZnB3RnIreDVTV0JNY3J2MHdVRkJkRFhPUjFWTERheGVT?=
 =?utf-8?B?Q0xEWnJYd0hBWjF5clM3Q0FCVVpSUVRDYjJXYTI1M0lxdlJkeFViZWMwRW1U?=
 =?utf-8?B?Mk9hUlZoK3BTM0lCTzZPTWo1YlBTbXcrTmVyQ1B1d0dnanN5Zk5FV3BITDkz?=
 =?utf-8?B?SkQ5SmVhOXlUQWhmWkM1aCt0Qzg0T1k1UCswVmFTOTlVSGt0MEE1ZXZQVzM3?=
 =?utf-8?B?ajF5Z0hXVjFGVVl6aVJEZW5xeHpMUDRqQ2dtZFNEcUFkSWZxbkZ4Ry9zQnFa?=
 =?utf-8?B?R3lEMGFKU2I0RUwrbkxkc09UZ0RDU04wTG1FY1hxSXBHUXBuaW1FektZWjBL?=
 =?utf-8?B?V0Znb0dUYlprOXRsUDBSQXg3T2R5c21qamg1U1EvK2RyZkNZNVlCTjhvYnVr?=
 =?utf-8?B?S01mTW1uWVFjWC9zRVN4MjZlSEJmODdoV2psY2hUYktYQ2x1TUkwK1RWSFBD?=
 =?utf-8?B?dUROL0Nyd0dUNk1Kek4xSTk4ajdsRXE1UHpFRTNsRVptMkk4MWphbUZITTEz?=
 =?utf-8?B?bVJUWHAwczRPUkJLOXZGYmpPWWE4SndNMk9EZk5Tam8xcmxOMHVQQmpLUEVD?=
 =?utf-8?B?anNFZE5GK0hWdVJuMndYVFlBcFRBSlFVM2lkV3ZBUXAvQVU2MTU3KytZWWNt?=
 =?utf-8?B?Z3RNMloxOU5Nb2ozdSsrTGNMSmswUmlhSk9ST0YzMW9kUFdQMFEvOHFxMUM1?=
 =?utf-8?B?bjRYazVkT3o0MFQzdDBRWDZVc1pFUE9KSTlWOStMay95djdnUWhUejJycWxk?=
 =?utf-8?B?Sk9lM0ZwNXpSS2ZVVzdZSXE1RndGeHFVOTRadEcvZ3dWU0YwQ281OFhxVzFZ?=
 =?utf-8?B?WGFTanZhbTAxRVIveG1zSGtPMHVKRkwxZVdMNGlBVHNDSHRsbHpXZVd1MDJ3?=
 =?utf-8?B?QjhwQjI5WkVWTWY2Y1k1YzRISW9hUWlOTGR0VE00eFVSZ2VvaVZ0ZlUvdXdZ?=
 =?utf-8?B?ajIvR2lJV3FPRkh0ODJNbHJZdDVnOWpuQVVtbUtZZzJKVXdEYjNmWnFDVjFP?=
 =?utf-8?B?MWVLeWs4OXpWSER6KytUM1JtL3JsM0ZEdGZJU0NQNS9oWk5GVVd3K203anpz?=
 =?utf-8?B?RGF2bTdkWlRnd0NlbTk1WU5ZVllvcWMrYk15eWMvMGwyWmFIV2VlcE5WaFdB?=
 =?utf-8?B?UGdza0ZveklHNU9uemR5dXhLdW00OEZ6Y2dFOVZpZ2NacHdjQmdoNlBLOUgy?=
 =?utf-8?Q?qJ6OM8Mok21Ge5+gPQaPAFaFJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f528a6b-636d-476f-cf8c-08dda763ab0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 14:41:06.9449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyA9iGjvnxslugiA+0DVRAB0meXlTEJTopRjh8X+4FPVTi8/BKfFBl7/qqsdp48YdnBD+GyELq4Nufj7SR5cxGWNFv9NwwCaMD0xOlmc69g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgRS4gQm94IDxkYXZpZC5l
LmJveEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogRnJpZGF5LCBKdW5lIDYsIDIwMjUgNToxMyBQ
TQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IHBsYXRm
b3JtLWRyaXZlci0NCj54ODZAdmdlci5rZXJuZWwub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGhkZWdvZWRlQHJlZGhhdC5jb207DQo+aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRl
bC5jb207IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47DQo+Vml2
aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tOw0KPmFpcmxpZWRAZ21haWwuY29tOyBzaW1vbmFAZmZ3bGwuY2gNCj5TdWJq
ZWN0OiBSZTogW1BBVENIIHYzIDAzLzExXSBkcm0veGU6IENvcnJlY3QgQk1HIFZTRUMgaGVhZGVy
IHNpemluZw0KPg0KPk9uIFRodSwgMjAyNS0wNi0wNSBhdCAxNDo0NCAtMDQwMCwgTWljaGFlbCBK
LiBSdWhsIHdyb3RlOg0KPj4gVGhlIGludGVsX3ZzZWNfaGVhZGVyIGluZm9ybWF0aW9uIGZvciB0
aGUgY3Jhc2hsb2cgZmVhdHVyZSBpcw0KPj4gaW5jb3JyZWN0Lg0KPj4NCj4+IFVwZGF0ZSB0aGUg
VlNFQyBoZWFkZXIgd2l0aCBjb3JyZWN0IHNpemluZyBhbmQgY291bnQuDQo+Pg0KPj4gU2luY2Ug
dGhlIGNyYXNobG9nIGVudHJpZXMgYXJlICJtZXJnZWQiIChudW1fZW50cmllcyA9IDIpLCB0aGUN
Cj4+IHNlcGFyYXRlIGNhcGFiaWxpdGllcyBlbnRyaWVzIG11c3QgYmUgbWVyZ2VkIGFzIHdlbGwu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBp
bnRlbC5jb20+DQo+DQo+Rml4ZXMgdGFnPw0KDQpTaW5jZSB0aGUgY3Jhc2hsb2cgZmVhdHVyZSBp
c24ndCBhdmFpbGFibGUgdW50aWwgdGhpcyBzZXJpZXMsIGEgZml4ZXMgd291bGQgbm90IGFkZHJl
c3MgYW55DQppc3N1ZXMuDQoNClNvIEkgZGlkbid0IHRoaW5rIGl0IHdhcyBuZWNlc3NhcnkuICBJ
ZiB5b3Ugd291bGQgbGlrZSBvbmUgYWRkZWQsIEkgd2lsbCB1cGRhdGUuDQoNCk0NCg0KPkRhdmlk
DQo+DQo+PiAtLS0NCj4+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYyB8IDIwICsrKysr
LS0tLS0tLS0tLS0tLS0tDQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gaW5kZXggM2U1NzNiMGI3
ZWJkLi42NzIzOGZjNTdhNGQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiBAQCAtMzIs
MjggKzMyLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdnNlY19oZWFkZXIgYm1nX3RlbGVtZXRy
eSA9IHsNCj4+IMKgCS5vZmZzZXQgPSBCTUdfRElTQ09WRVJZX09GRlNFVCwNCj4+IMKgfTsNCj4+
DQo+PiAtc3RhdGljIHN0cnVjdCBpbnRlbF92c2VjX2hlYWRlciBibWdfcHVuaXRfY3Jhc2hsb2cg
PSB7DQo+PiAtCS5sZW5ndGggPSAweDEwLA0KPj4gK3N0YXRpYyBzdHJ1Y3QgaW50ZWxfdnNlY19o
ZWFkZXIgYm1nX2NyYXNobG9nID0gew0KPj4gKwkubGVuZ3RoID0gMHgxOCwNCj4+IMKgCS5pZCA9
IFZTRUNfSURfQ1JBU0hMT0csDQo+PiAtCS5udW1fZW50cmllcyA9IDEsDQo+PiAtCS5lbnRyeV9z
aXplID0gNCwNCj4+ICsJLm51bV9lbnRyaWVzID0gMiwNCj4+ICsJLmVudHJ5X3NpemUgPSA2LA0K
Pj4gwqAJLnRiaXIgPSAwLA0KPj4gwqAJLm9mZnNldCA9IEJNR19ESVNDT1ZFUllfT0ZGU0VUICsg
MHg2MCwNCj4+IMKgfTsNCj4+DQo+PiAtc3RhdGljIHN0cnVjdCBpbnRlbF92c2VjX2hlYWRlciBi
bWdfb29ibXNtX2NyYXNobG9nID0gew0KPj4gLQkubGVuZ3RoID0gMHgxMCwNCj4+IC0JLmlkID0g
VlNFQ19JRF9DUkFTSExPRywNCj4+IC0JLm51bV9lbnRyaWVzID0gMSwNCj4+IC0JLmVudHJ5X3Np
emUgPSA0LA0KPj4gLQkudGJpciA9IDAsDQo+PiAtCS5vZmZzZXQgPSBCTUdfRElTQ09WRVJZX09G
RlNFVCArIDB4NzgsDQo+PiAtfTsNCj4+IC0NCj4+IMKgc3RhdGljIHN0cnVjdCBpbnRlbF92c2Vj
X2hlYWRlciAqYm1nX2NhcGFiaWxpdGllc1tdID0gew0KPj4gwqAJJmJtZ190ZWxlbWV0cnksDQo+
PiAtCSZibWdfcHVuaXRfY3Jhc2hsb2csDQo+PiAtCSZibWdfb29ibXNtX2NyYXNobG9nLA0KPj4g
KwkmYm1nX2NyYXNobG9nLA0KPj4gwqAJTlVMTA0KPj4gwqB9Ow0KPj4NCg0K
