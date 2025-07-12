Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF3E2222BF
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Jul 2025 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752359801; cv=fail; b=hgQnbMn3ZtYPM/YOLiYB8yafvLx4vyvDqfRcL1oUTPyEV+bSTwH1o5l/cD/r0mBH/TdTzkWU6aL8J16GCPBPrS+Qdfe73lnIwZjwsFd/a9mbDMyQ4Dd0TEOQj+T3mfen4x310J7DVeRfVshl7M58UbVXaNxPRg3+3K8X8RFf5j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752359801; c=relaxed/simple;
	bh=cwkZUF8DWmYdUjnvC2tdSp9DZi8RtlZa4HNaJ0QaVfU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PYJDN8pY7TosxsEUus7ILsnpHEODId4MBVj6GOJecR4yfMNxztelZBuRB0Dck9j30Kte3djzyoyKJzXUPa91kMzDJy1YYymPdJ/q+DSFEVroRU/qcih+87xgxrae9SZC7WaWnhr1Ss5qdTZq6T3dAkXYvzP+TYajDHzBikzAMHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRDqWuD8; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRDqWuD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752359799; x=1783895799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cwkZUF8DWmYdUjnvC2tdSp9DZi8RtlZa4HNaJ0QaVfU=;
  b=WRDqWuD8z6fiLtOmfV+Naqtr/igKF3liZNkDfzNYaAL6y76uDV1Tl8At
   GKyiFoAAl1ChZHDbwnDytByp+M3TQKG+nf7IZUU8/FRUczVvl4DvN5mnr
   Va/bE2rCxqumkHNodtaAJoA0zaZyOmRxhuWix3HyDoxF2eog+Zm75R5KW
   zpJwhTTifjUPKE8eZoRF1O68DP3xmgA5pdhTntIh/ZbJJpVCWCKv5rfJN
   w6E5UMe4TPhEkMAlUhrpDCPixjLISdw+30Qv2+b2K8lRY6aLqSBUs31an
   jfw9z0JBUwBtrQkchn3hZT/ty7cmvkKyvpRNvPBHPdHnrSnRw3Cm4s/9v
   A==;
X-CSE-ConnectionGUID: kYRYOkhWTKqKKz4koziydQ==
X-CSE-MsgGUID: FeD6ioDpQfWHCs1qez6dew==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65673236"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="65673236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 15:36:39 -0700
X-CSE-ConnectionGUID: 90X8QsHNSFOpMXyzVLUGIw==
X-CSE-MsgGUID: 2pJJE4iFT3a7u9eulCI81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="156720202"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 15:36:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 12 Jul 2025 15:36:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 12 Jul 2025 15:36:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 12 Jul 2025 15:36:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqjyoMkhUnSNEnids3j/E8wiWW7HeYiqdxCW6ZOyUH0W+IeFjgxXNP/yarZAR4i7a1jslbmrwSlOq+06ZWNGt071b3g+SUeNJEd5Byqp1zXgAyD0eIRtk9EBXTsPdxmiPNW5s4QTrYZE5rNc72P83m+5GeCkFJQW6PhOcIR3BXs18QYHRVEsW7Zl1jE7LtVmogc1sPf19ZqSdpxST9OCKWmozAK3A4lxCP8VdiIq3LZD9o16ltju2AdvHRXcekiIBNb/3dwK+ythAxFNPnJ7/wIrH2+ckKfLe/klvsw+HGvxqWQDE8hzHv7qknUDJ3SAW95fmp8HnSMlwAYjwMa11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwkZUF8DWmYdUjnvC2tdSp9DZi8RtlZa4HNaJ0QaVfU=;
 b=ZRTYkX+ycHNLpzZwl0RvRBbCajyyYNEawLZ8iRfthV4FwbigIb4E0hNwRzjSVFsx4+8IFtl1AjwzQaLuKEzCSddreqwPSiGmZkN3RDU45WZU1lYBFoVADWluirsuJlvE5QN8QENUtSotyIahDuCtVu0pLvw6z0JXc6nLSYWe6JfefrY+yrUBZOLrAl0CNICKiPj+Vy3BrHvABTRWoaez5wUDk6VNGtw6zc/sGbs9bpMi0ojbcQN7t3j9hEI6p7XL2UwlVs3dESXEjD6/vuFGxvqRFKEf4gxc6q4H2lfqG5f1xrxtGo+Ssa0R7pJMdgC/loP0LVmT6PnMLKUF1CpnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Sat, 12 Jul
 2025 22:36:34 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8901.024; Sat, 12 Jul 2025
 22:36:34 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: David Box <david.e.box@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: RE: [PATCH v7 02/12] drm/xe: Correct BMG VSEC header sizing
Thread-Topic: [PATCH v7 02/12] drm/xe: Correct BMG VSEC header sizing
Thread-Index: AQHb8QGoECNYjKcDM0GfnV0bMGE5NLQtOQ+AgAHeS/A=
Date: Sat, 12 Jul 2025 22:36:34 +0000
Message-ID: <IA1PR11MB641839B604F80F0E03567724C14AA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
 <20250709184458.298283-3-michael.j.ruhl@intel.com>
 <lfvgatgvexvot7a2x336rdv2vps3o3so5pty7n4mw4u5ze6boz@giw6rw5auo7d>
In-Reply-To: <lfvgatgvexvot7a2x336rdv2vps3o3so5pty7n4mw4u5ze6boz@giw6rw5auo7d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB5062:EE_
x-ms-office365-filtering-correlation-id: d70d579a-b591-4f18-d791-08ddc1948e40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SG9zUEpENG1mOHkrT0w3alM2a0o1bkY0RHF5aEVBSy9oZ05ERlZZd0FaYUFC?=
 =?utf-8?B?ZTlTcS9mK2dYQjZ6SEU5SzNxT3piV3BTc29PUjNBb1dXOG1DekhTOStsK05z?=
 =?utf-8?B?aW9JSmt1UDdMaW5UOVhmQUJPUTBKSStWaWt2d3FDRG9JUUxYekhWY3NMQmdx?=
 =?utf-8?B?N3VCVHhQQ0dDeHlROGxnLzFTb1FDS2g5Vy8wanVYMXVkbnNoVG11SnVIUDF6?=
 =?utf-8?B?L1I4VkVIVVFUZGMyRXJkVVNYVnFoVTNMRnhFajFlZUJGRSs1YkhzM1hzRG85?=
 =?utf-8?B?T0FOdWI4MHpXdnhlTjJ1QmRJcTFpS0lVWm1yc0tEbHFBcFYyZEJ5VHJHaTJp?=
 =?utf-8?B?SmNtZFNzVkxrVWZNVVMvUFV5RWx1d2JRWG9uN05rK2lZUmJHT1N1dTJjZGZn?=
 =?utf-8?B?VGgxV1hLcW4vRlZJVFNBN3o0eGREUGl4b05mOGZOZUM1dXdFdnJ4dVplcmZG?=
 =?utf-8?B?UTQ2cTlYdU5LV0NDQVhuMDcyaDRFeTdjdE1hSm9WbzBvekZpU0ZEeWxHNHhk?=
 =?utf-8?B?ODNrMEsxTDhtNUxGL09oeTVZa2kvaEdSUmp5bnNXWURMd0drclUwL3BRVy9Z?=
 =?utf-8?B?NDFKamh4WExiTGx0NzNwRFBsVkpHQU1FVlZTQ0R3bEEremhmSlJVaXEwRERZ?=
 =?utf-8?B?RjVaSm9SQ1AyOSt6a1VyWkJvWlJpbHpjRSttUTdNUFVuN3NiM3krNzVrSFpn?=
 =?utf-8?B?VlZIRW1JRm5ha1dSQTVDZ1d1UC9uWGsvZUVZeXpEdlZFUHFnNDlkc0loSC9k?=
 =?utf-8?B?OU9WN0RJbDV3VzJPUUdxZDFRdGF0VFY5MEJjdzBjY01IMXA2dkVVaDE1NXZj?=
 =?utf-8?B?UTVhYnpsS1c3YWN3Rkc4NGJuM1cyRFpOWUw0TlB4NE9UQk9nRjJhNldjbURz?=
 =?utf-8?B?b0llait3YktvbUZFMzJ0ako4d1pFaFZ2ellOOWdNVFNoa0RoNWtTOXNzN1NS?=
 =?utf-8?B?S2RuVi96c3lMY2Rwem82NGdFZmRKdkhSNUE5c012R1RtNlRIT1VTNVEzZ0Nj?=
 =?utf-8?B?bTI4WTNOeXEwcFRwQnhqT2xydCtmamRnMWFkSE5JUmJ1NEhQMUkwR0VDTDZP?=
 =?utf-8?B?dFNhSUIwYWNKNkU2WWhwM3VMcnRzVWVBemd3QmhoVTR2OENPWnQwY2pLa3Zp?=
 =?utf-8?B?bHgzajdrbXRVdm5wL1U0R0hWa3RhWFZCUVRienNOV2pnT1lIV2JFT2NsaEkr?=
 =?utf-8?B?U3FGWGtSVTJqcmpHZER0ditqaExqR1JMaW9wR3lDL3dDWUVTWDhwTy9NQklo?=
 =?utf-8?B?RngwSVYraVFtYVRSTkdEOGxXTEFvWFFEUVNEOFlBQTRRRTIybnZGcEluam9y?=
 =?utf-8?B?OXJEOXQ2TTgxb2pKZmh5U3lFcXVxWUVuRUUwQXBOZGpFa0ZoaGtQRGNsVlph?=
 =?utf-8?B?SUhsVklCblF2cGlpb0gyQnFWWDFVSmdnVVloU2NVdHAyaC81YkZMbnlGbXh4?=
 =?utf-8?B?dWIxMk9kYnRLRkFFY0dxbHFIeXRYWWl2ZFlRNHJyZzBRNjBhcENaeGY0eFMr?=
 =?utf-8?B?Rkg0T1BsS05RZjhzcCtQdlZKYkxGS3ZTbnZJRlg5eEkydTJ3b2phUzI3L0RO?=
 =?utf-8?B?dGQzT29FUHdCdFJidjZQenFDK3RjQ2p5cGVxaFl2amkxdFFDemhZajV0cGdt?=
 =?utf-8?B?czJiVmVqazFyUklEN0FrZFBOOGU5S1g1UlJveUh5eFpOMFJubzlxRzdxLyta?=
 =?utf-8?B?NjBQbXFJYUFhT09DbGtsamhIeWhkY09yc0RRd2tLUU9WUGFTaFZLVm84Vkw3?=
 =?utf-8?B?WlQxMUpoL3F3MTN2YnBWQUhvWDVYdjFBM3ZwSFJWV3NEVGw4WXVaejEwTXJy?=
 =?utf-8?B?dElJWjc5eVdIdU5icXp6SW5mVnA2dGl0SHJqcUxlUVlRaGsvK3dKeWg0NEFQ?=
 =?utf-8?B?SEFDZGVZRVpmTFVsUmhvNnpFR0RqN2xyZGg2TGlVN3o4SmxOd3lwOUc1eEFv?=
 =?utf-8?B?cElSYUdkN3E1bEJIcU9RTytJOG4rQkMxUkhQS2Y3b0xzcWFhdWR3TEdHTWpJ?=
 =?utf-8?B?ajZvY3JudjV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlRJK2d1N0J2QnZtRXVyK01NVnZZY3VtbGNqNGJ4ZEEvMHRzaElIdVBrSGli?=
 =?utf-8?B?Sk9Jalk3KzUrY21sNFFoSkMxbk9JZVhlOEk3V2hPTkdpY25nTHgyd1dmcWp4?=
 =?utf-8?B?cVBENC9CdFM2M1AybG5JR2MzV2RmbzRXZDBVZ2gxTzRWakJZV2RJcmlVcG5w?=
 =?utf-8?B?S2dnYTIreVZLNzEvWm1JZzl0K0hHOXUyK252N0VqSW0vTWFVVEdPdDltZHBF?=
 =?utf-8?B?bDJNdjZMcTVic25FTkFFSVYwU0FRcTJhNTBmUlpac1lCTDRaOGVicEdzYkpj?=
 =?utf-8?B?cHRQbkV4ZXA5VGJRNVUxb09sN0NESU8rQ1ArOUJzTFNtTk5ZQVdESEZvWFI2?=
 =?utf-8?B?Vy83Q0lCRW5DN0E3WkhySjQ5Nm1YMnFvdkt0WmtORUVnMFZFWjl3RHgxNjh5?=
 =?utf-8?B?VG15OG5ENTlMTmlxUVduaHhPb1RQcjhRZGFsV0ZYS0VOaWg2VWI3VHJpOXNF?=
 =?utf-8?B?ZkVJY1hSWjFWSEVHZ0J4L0xHUlhDQXVwQndaazYyakFnUlh5ZytIdDQrNC9O?=
 =?utf-8?B?c2hTNEdmRm1SSk15MjluUGVXSGE2cHpDZkpMd21BTXpwbUcwem0vM1NwaWNo?=
 =?utf-8?B?SFdyTWNIN1pzOGIxSnRmVEg3VFhDanRqVlpscTI4bVNVeHBkVHZTcGRyaU9w?=
 =?utf-8?B?QWJSVHJaNk5tZUhIYWRMbXVUZjB6dTVabUZEalVlVTcxYW5ING5IVDNEdXV6?=
 =?utf-8?B?QzlvQ3ErVEFHS3BMTTBtUXp1cjJpRktyWkU4aDMycjRxditNNlVxc0Q5Smth?=
 =?utf-8?B?U0R4ZUNKSmQxczlPNWwxRVZLTytMSFlFd09GRDc5bnViR3d2cjZXdmVDS1lw?=
 =?utf-8?B?VExsR1BrK2NVdGRtaUVCa3pibDNXMlRUWFI2SVA2RU9KNE5jSExtTmZXRVhV?=
 =?utf-8?B?SmZML1YzMnBiemhDVWxnRURpQnlEOFRqYWNkdGg3UjBwRm9RUVE3Zk42MDc3?=
 =?utf-8?B?a05OUHFqQ003VU1FVVFOVVBnREt3dmlyeXJYckNCZkhaN2ZWVURVb3g3SGFy?=
 =?utf-8?B?ZXFSMmxRaFVkcnFlVHdVVGtjRlVaMllnY2RXbldKTU1DWEE0a095QzN2RDl0?=
 =?utf-8?B?MDhZakc0V0grdnYvV0J1KzEvQ0FMakJ4ZXhGMSs1SlF4RGFZa1EyYkpmWkhT?=
 =?utf-8?B?WXVqbk9UN29kTUdnYXRMM29Ma1ZJTkE0VG9PYUhhcWFmUitpMzAvV3Jrckts?=
 =?utf-8?B?WnFTaEVmTFpvc1ZVZURCOWt2R252aFZwbVJpekJaUndYOTEvQzFKV3VtME5C?=
 =?utf-8?B?ODI2dXZkWUR1YzF6OFJ3ZVdQT2M1bEpUL21aUFpNRlUyRlFVOTZjT2I5bURz?=
 =?utf-8?B?MldCWEhzUzlwQ2NHdSs0ZXNzVktnVXhOQ3dydnVpeXJNVUFON2tqZ1Ayc1lv?=
 =?utf-8?B?WHBhZ2ZVcDM0SUdtZm1DeHBGNjRabHE3SjQ5MHNCQTZYOEZyRGNoZ0RPN09u?=
 =?utf-8?B?TURsUjIyeUNyR2JVRkNGa2QyUTgwMWxFZGhQblFKZEllVzhFdlNFV0t2N05Y?=
 =?utf-8?B?VTdWMVBrek90ZmoyWXBMRW9BRzhyTFREQ2U2WW1JbkRRV21ta3BRRk14aXhh?=
 =?utf-8?B?NnpDRzdybkJaM1BaeFRzREw1bEQ2Nzc1WGdXdDJEcE5TSWJUN0dYVlJiaDJy?=
 =?utf-8?B?RzJuZitUa0lGN0NIbG1pR1JjVjdmL1FjTFd5dWhlME03VDQ3bkZqRGRmQ0xa?=
 =?utf-8?B?ZGprY3ZjdWhIVk1YMjlpTW40ZDlneHVxVTUzeS9xNzRNaThVZDhIQXM1Zldu?=
 =?utf-8?B?YXp6VnRVcnUvNFU2eFhaSzhtMmNBRUp2aDJjaTZOY01uaU1rckEya3kyRnlq?=
 =?utf-8?B?MURvNEsrVW12MG1tWnp4UWVKTHJtdVpRTWxlL2ZwR3ZnaUNSS3ZqdXAwL0NL?=
 =?utf-8?B?dVlSb0k5S2crRDBpQzVMVDRnMDAreWV2NnJJS3VZZmJYbnNkMXBTTWp0WWU3?=
 =?utf-8?B?bXM2ZWdIVVF2cGxjS3hQRExyL3RZQ0xiTjBtR1lmSytpQ2Rhc1RNQ2VpendX?=
 =?utf-8?B?NG1uUkRjelE3MXkyUytjaW12d3VmdlpYQUtmSWJHMGNpTHJLMVhoYVpwQUFR?=
 =?utf-8?B?bDl3SDBOV2hxSTNKRlpFTlI2TCtpWlhwanJ3bUVBVm1ObE80Ui93U1JnOTFx?=
 =?utf-8?Q?E/L/e8T9odU7kH9SU/bDdXEBm?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d579a-b591-4f18-d791-08ddc1948e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2025 22:36:34.1816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ancf4Qs/yGYurwfjowgZo/1oUF9621n6r949fzlR5LFhjP11dWw8SqsMHlwFf+kE1U0X5fjl32NDfjEJagVHsdhx2Qp9wCuQyliJhclkeQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgQm94IDxkYXZpZC5lLmJv
eEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogRnJpZGF5LCBKdWx5IDExLCAyMDI1IDE6NTkgUE0N
Cj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+Q2M6IHBs
YXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+aGRlZ29lZGVAcmVkaGF0LmNvbTsgaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRl
bC5jb207IERlIE1hcmNoaSwgTHVjYXMNCj48bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgVml2
aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47DQo+dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb207IGFpcmxpZWRAZ21haWwuY29tOyBzaW1vbmFAZmZ3bGwuY2gNCj5TdWJq
ZWN0OiBSZTogW1BBVENIIHY3IDAyLzEyXSBkcm0veGU6IENvcnJlY3QgQk1HIFZTRUMgaGVhZGVy
IHNpemluZw0KPg0KPk9uIFdlZCwgSnVsIDA5LCAyMDI1IGF0IDAyOjQ0OjQ4UE0gLTA0MDAsIE1p
Y2hhZWwgSi4gUnVobCB3cm90ZToNCj4+IFRoZSBpbnRlbF92c2VjX2hlYWRlciBpbmZvcm1hdGlv
biBmb3IgdGhlIGNyYXNobG9nIGZlYXR1cmUgaXMNCj4+IGluY29ycmVjdC4NCj4+DQo+PiBVcGRh
dGUgdGhlIFZTRUMgaGVhZGVyIHdpdGggY29ycmVjdCBzaXppbmcgYW5kIGNvdW50Lg0KPj4NCj4+
IFNpbmNlIHRoZSBjcmFzaGxvZyBlbnRyaWVzIGFyZSAibWVyZ2VkIiAobnVtX2VudHJpZXMgPSAy
KSwgdGhlDQo+PiBzZXBhcmF0ZSBjYXBhYmlsaXRpZXMgZW50cmllcyBtdXN0IGJlIG1lcmdlZCBh
cyB3ZWxsLg0KPj4NCj4+IEFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+DQo+PiBGaXhlczogMGM0NWU3NmZjYzYyICgiZHJtL3hlL3ZzZWM6IFN1cHBvcnQgQk1H
IGRldmljZXMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmou
cnVobEBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5j
IHwgMjAgKysrKystLS0tLS0tLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZzZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4+IGluZGV4
IDNlNTczYjBiN2ViZC4uNjcyMzhmYzU3YTRkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZzZWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0K
Pj4gQEAgLTMyLDI4ICszMiwxOCBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZzZWNfaGVhZGVyIGJt
Z190ZWxlbWV0cnkgPSB7DQo+PiAgCS5vZmZzZXQgPSBCTUdfRElTQ09WRVJZX09GRlNFVCwNCj4+
ICB9Ow0KPj4NCj4+IC1zdGF0aWMgc3RydWN0IGludGVsX3ZzZWNfaGVhZGVyIGJtZ19wdW5pdF9j
cmFzaGxvZyA9IHsNCj4+IC0JLmxlbmd0aCA9IDB4MTAsDQo+PiArc3RhdGljIHN0cnVjdCBpbnRl
bF92c2VjX2hlYWRlciBibWdfY3Jhc2hsb2cgPSB7DQo+PiArCS5sZW5ndGggPSAweDE4LA0KPg0K
PlRoaXMgZG9lc24ndCBsb29rIHJpZ2h0LiBUaGUgbGVuZ3RoIGZpZWxkIGlzIG1lYW50IHRvIHJl
cHJlc2VudCB0aGUgc2l6ZQ0KPm9mIHRoZSBlbnRpcmUgRFZTRUMsIGFuZCBpdCBzaG91bGQgcmVt
YWluIDB4MTAgZXZlbiBmb3IgQ3Jhc2hsb2cuDQoNCk9rLiAgSSBzZWUgdGhpcyBpbiB0aGUgUE1U
IGRvYy4gKDYuNikuICBBbmQgSSBub3cgdW5kZXJzdGFuZCB0aGUgdmFsdWUuDQpJIHdpbGwgdXBk
YXRlLg0KDQo+VGhpcyBmaWVsZCByZWFsbHkgb3VnaHQgdG8gYmUgdmFsaWRhdGVkIGluIHZzZWMu
YywgYnV0IEkgc2VlIHRoYXQgaXQNCj5pc27igJl0IGN1cnJlbnRseS4gVGhlIHJldiBmaWVsZCwg
d2hpY2ggYWxzbyBpc27igJl0IHNldCBoZXJlLCBkZXRlcm1pbmVzIHRoZQ0KPmxlbmd0aC4gV2hl
biByZXYgaXMgMSwgdGhlIGxlbmd0aCBpcyAweDEwLiB2c2VjIGRvZXMgYSBiYXNpYyByZXZpc2lv
bg0KPmNoZWNrIHdoZW4gcmVhZGluZyB0aGUgY2FwYWJpbGl0eSBmcm9tIGNvbmZpZyBzcGFjZSBi
dXQgZG9lc27igJl0IHZhbGlkYXRlDQo+dGhpcyBkcml2ZXItcHJvdmlkZWQgc3RydWN0dXJlLiBU
aGF04oCZcyBhIGdhcCBJ4oCZbGwgdGFrZSBjYXJlIG9mDQo+c2VwYXJhdGVseS4NCj4NCj5Gb3Ig
bm93LCBldmVuIHRob3VnaCB0aGlzIGxlbmd0aCB2YWx1ZSBpc27igJl0IGFjdHVhbGx5IHJlYWQg
YnkgdnNlYy5jLA0KPml0IHNob3VsZCBzdGlsbCBiZSBzZXQgY29ycmVjdGx5IHRvIDB4MTAuIEFs
c28sIGFkZCB0aGUgcmV2IGZpZWxkIGhlcmUNCj5hbmQgc2V0IGl0IHRvIDEuIEkgc2VlIG11bHRp
cGxlIGhlYWRlcnMgbWlzc2luZyB0aGUgcmV2LiBUaGF0IHNob3VsZCBiZQ0KPmZpeGVkIGluIGEg
c2VwYXJhdGUgcGF0Y2ggYWhlYWQgb2YgdGhpcyBvbmUuIEFsbCBJbnRlbCBEVkVDIGNhcGFiaWxp
dGllcw0KPnVzZSByZXZpc2lvbiAxLg0KDQpPaywgSSBhbSB1cGRhdGluZyB0aGUgcGF0Y2ggc2V0
IGFuZCB3aWxsIHJlcG9zdC4gIFdpbGwgcmUtdGVzdCBvbiBNb25keS4NCg0KTQ0KDQo+RGF2aWQN
Cj4NCj4+ICAJLmlkID0gVlNFQ19JRF9DUkFTSExPRywNCj4+IC0JLm51bV9lbnRyaWVzID0gMSwN
Cj4+IC0JLmVudHJ5X3NpemUgPSA0LA0KPj4gKwkubnVtX2VudHJpZXMgPSAyLA0KPj4gKwkuZW50
cnlfc2l6ZSA9IDYsDQo+PiAgCS50YmlyID0gMCwNCj4+ICAJLm9mZnNldCA9IEJNR19ESVNDT1ZF
UllfT0ZGU0VUICsgMHg2MCwNCj4+ICB9Ow0KPj4NCj4+IC1zdGF0aWMgc3RydWN0IGludGVsX3Zz
ZWNfaGVhZGVyIGJtZ19vb2Jtc21fY3Jhc2hsb2cgPSB7DQo+PiAtCS5sZW5ndGggPSAweDEwLA0K
Pj4gLQkuaWQgPSBWU0VDX0lEX0NSQVNITE9HLA0KPj4gLQkubnVtX2VudHJpZXMgPSAxLA0KPj4g
LQkuZW50cnlfc2l6ZSA9IDQsDQo+PiAtCS50YmlyID0gMCwNCj4+IC0JLm9mZnNldCA9IEJNR19E
SVNDT1ZFUllfT0ZGU0VUICsgMHg3OCwNCj4+IC19Ow0KPj4gLQ0KPj4gIHN0YXRpYyBzdHJ1Y3Qg
aW50ZWxfdnNlY19oZWFkZXIgKmJtZ19jYXBhYmlsaXRpZXNbXSA9IHsNCj4+ICAJJmJtZ190ZWxl
bWV0cnksDQo+PiAtCSZibWdfcHVuaXRfY3Jhc2hsb2csDQo+PiAtCSZibWdfb29ibXNtX2NyYXNo
bG9nLA0KPj4gKwkmYm1nX2NyYXNobG9nLA0KPj4gIAlOVUxMDQo+PiAgfTsNCj4+DQo+PiAtLQ0K
Pj4gMi41MC4wDQo+Pg0KPj4NCg==
