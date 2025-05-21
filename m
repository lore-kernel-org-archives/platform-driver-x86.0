Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA0231A37
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830253; cv=fail; b=d99uXlUCxuvn4cLdzWxYQGqBtIyFr9YWWGxmSgeSwoa8cvSLieQimU7lS/b+l4FlhC9/UCdQdkckkPBH1VFhkXf/+MsWlYtCnBgDMK8suA3ySe1yQkHvSLzq2dyV8ni+r6p3nEPVBF+Inm9TVxfAvEeY+u9bGewB8t98kjYEdPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830253; c=relaxed/simple;
	bh=s/fYrKlDW/FF5IuCwZuBcRCuoB1rN72fPQKB2pnz2fQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tgvVmvNU1xmEpMICsxq7P+YZaw8Ubix5RKK+F3TR83kOPDjxB600+UviXf7jHWiJJ73ygpZCveFtkTfVDtgiOgFQLNQQH1zBsRuX3x9OZCP1IgxxHi5y0k45lENgObVh0BAvURNf/pvyLe4fT7DrCg5ivE6Fl2FHKHAI8yg1LYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMjKwiXP; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMjKwiXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747830251; x=1779366251;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s/fYrKlDW/FF5IuCwZuBcRCuoB1rN72fPQKB2pnz2fQ=;
  b=KMjKwiXPPGFM/hpyPX8th1vkEmkEwkeqnxDWB/JNoaGT/BSrSJHRCXSc
   Hz7bjBT7GAnp/k2iQ9tpAoY2EhYjZNY4jSHjh2TM8srw9KXI+0nh3JV6I
   rHX6pVAHtGBte+hAVDG7Jfr8Mc6GKzH1WAe8V+v92uq/iN8tbQ7VksqZN
   yWf39UmE8kjK2rGDI0Xb/Xf6xhqhL/mWCrlcumUdEvoekwU08uPsMXF/1
   82lD9lAOPlMSvyYpgMPGLS5iKhLYq5wvt1ddgHhuwHT+XcAwfmtVdZWf4
   ArfvHUqR+rGsSlEiocDQMwF1dzPV9gtqDS4hkQkVyUV25X+xr0A8v/Qp2
   Q==;
X-CSE-ConnectionGUID: WbCTa34lTiSrlXTeY0g97A==
X-CSE-MsgGUID: RXzIPpRbTkS5A0g6SpuOBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53469017"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53469017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:24:10 -0700
X-CSE-ConnectionGUID: 34s8JQksSLyVLoC6R4SOWQ==
X-CSE-MsgGUID: m+zyirzIRzScVoDhyDzI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139898987"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:24:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:24:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXvOTItoki8haWa/6ogzJLopamD5wUZ33WbHEwwS1ZNoCX8Z62qNxYyuYIFvA56UMJgDuY9SVCXuzGGJ5oCTfsYisC25ElSTaSL7PWBEqC9HPPC3jxABAEzhakFQs9ni2JGVGdXeXYZsbt3lcDZjD+jrGfBGFsxwVYuQWn5NsxR1PNzJoR8R14/bxIEQOpYZ7yWBFsbAk85FwXwbzrls/6Y0OfkxDJoGmWs0fPbOcZvdeXYw221W6ojaB223tf2+5liY+fgTRnHc8LwvMsxBsxg5FP8C23DgY1CoT2zbphnL9OSPAkV6NkKQfzfdlOabV2X3wJodJsnml0bBTw52YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6AP+ZufZ34ciqz5DCcMrKY4qDSVv7T8JX9GGYUGtDA=;
 b=JXcXeTLwqqR9UDZvO3JkPyJLVAO8NFKz9Sl3yn404lWe7MZAQV8fUBrbIoqjNDdl2xPkN69SPbvml9kwkqB1ty2/NG7TgxLk3i/yeqoSakx9214JNIUr28sm3Jg3OSxXgmiM4/9yJhgoQGTTRKrN2SBaB3XSDhUq3iUIeR1Hz9/Z157364FGmC+8y+N9KHvrIW8KL2K8LYBnD+g1MRD1W7dhbSKHf3wSpsPG9dczbMHbSwod4QPr/4PpbS9y+p1ysgWqXlL2NLWioiFStEFTrnXdtllovUZddGoSab6qf5IgOWzkdFKNoplti1Xf9YExsTX8SsBxq2hozLeUHAXeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 12:24:06 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:24:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 1/4] platform/x86/intel/pmt: crashlog binary file endpoint
Thread-Topic: [PATCH 1/4] platform/x86/intel/pmt: crashlog binary file
 endpoint
Thread-Index: AQHbxnPVN2JxPQtmMU+H+Fabnn4i/bPaFDOAgAL0F+A=
Date: Wed, 21 May 2025 12:24:06 +0000
Message-ID: <IA1PR11MB641880D130D1C6AD9C3B985CC19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
 <20250516150416.210625-2-michael.j.ruhl@intel.com>
 <6486a90b-6d5d-01c3-c9a4-6921e8c2692c@linux.intel.com>
In-Reply-To: <6486a90b-6d5d-01c3-c9a4-6921e8c2692c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB4806:EE_
x-ms-office365-filtering-correlation-id: d24661da-69ee-4b86-07d0-08dd9862614c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?NNzPKBMdzz7RiTcw7MMJQJiqXgWoBO9GrDClLTFhURBybk5Rsz33ZvmX7G?=
 =?iso-8859-1?Q?elEIAVwhycoUh55NoolW61buefx6Gbn6rKCzNcVX66NzXQo6BJlRJvicyR?=
 =?iso-8859-1?Q?MaTPoRl7ug2PMzxFZaryBvs8Anfk2cacEO6ER0ql8k3RymzPbctwffgJU+?=
 =?iso-8859-1?Q?IQrTXdNW1iqEK61yxQ3lVGxutpDIgxMnUVZvjmKBxA1vi31WbCMbCmKDC4?=
 =?iso-8859-1?Q?Ms/xmaNRNJj2DqfQ+qWAUu5ICPjxHkYc1qtJ+mcRKH7b6A8BaknwshDisf?=
 =?iso-8859-1?Q?9azeNFyB0WOeSlAq8rKE3zxoiLf85BPYv5xtAAV/NOIUgvfREsf/8t/SzX?=
 =?iso-8859-1?Q?6udw9NQF1o3R7Uvgy4VWA/itv+iOULbsTExvBZ1SQ8i0ujWPkaLqnovwpO?=
 =?iso-8859-1?Q?k7n6yArWYeh6C6iCDqX+f1VLtWzdEc16cqBoHPRnsGpneNbQp+w4wXpdEo?=
 =?iso-8859-1?Q?KZOXRKBOMSj2GgThTpKNSsRXftGwsnII+70XvwQZR6+Z7Aq9sA7iemNmbJ?=
 =?iso-8859-1?Q?TzRsLaEjvASrnae+oxvtSVEla88z106qobLfm2Q+PBXSyWIsQHkESD26KK?=
 =?iso-8859-1?Q?1RdtBK2CfpDHfod0Mzaz2p/UtOl55NMmXvU22qXqdJu1m6aNqjl5o2GnsF?=
 =?iso-8859-1?Q?ZLoLYUn+6FDdTgyOxfWCsXTXfjdvV2DCm+UwzTY2J7W69jH9eGkZ5tjyYU?=
 =?iso-8859-1?Q?/XidCJp46lZq6S12NMUhm3GwXUj2nK6xrIzokqo6pSlCJUg/AsM4ppTH1J?=
 =?iso-8859-1?Q?6rsOg8biP4wxka0llAsdsjell2mqtJqXkDxm/AHoVmlqJWTlmlWFyuvgKJ?=
 =?iso-8859-1?Q?Kx17mc1xqGk/+QGNprBF8fp7cfJjXR/mfXEfiBSQBvy+Pw4oUKlOCsgtO/?=
 =?iso-8859-1?Q?2ttBYSRVQfRA90vcjj6y1RdFZL1hzN4aujDp11JrGT2a38MZjLEr++8+85?=
 =?iso-8859-1?Q?bjmGlIsSX+mh2hBeL+jRt1NVR4jot1WmWemmC7XIRz6KcW2E+L95Rg43SM?=
 =?iso-8859-1?Q?cvVnJIoKahu+QqTqGL9ndOKPUSEwwcxjI4x6jZVAM3IOiSgbgDYkpZAqlk?=
 =?iso-8859-1?Q?XrfNR/EeTUrQgaNyQ9C2K8hm7SCnO/c3as6n4lN10lLSnoFYsDyNHhy+/v?=
 =?iso-8859-1?Q?LUhLik+PqYnAUGRFnP9tlKE3vPoWIPCLW7G01XYF3TXLuaLLgPc8wy6SoP?=
 =?iso-8859-1?Q?ob2N6DNHtfR1Qjyrz10nxjI/slG9WoynfeaLJxaUUpn1A9/TKKuOKWjobA?=
 =?iso-8859-1?Q?VnFCvun9TJIfmQYN8dRvJHBk0Tujzq5N1iwCs4Lhxaov5DEAcUp7lMEsjz?=
 =?iso-8859-1?Q?1tK8SkWpMB8zx98Y/oG1Bg0zlWbpK7mtIxFFKDeQ3L4YqLjWyWdoVqOFv7?=
 =?iso-8859-1?Q?yxneiOJcbXDFreKoQThu+lQiVZ2HtBA58yIseipmYsjDk+6NoWhWR25vRG?=
 =?iso-8859-1?Q?01ekpQUnH41/LDl9stGopcgb0Sa/FMCKP7huzEqNsAUS90BQiKwIKYbZqY?=
 =?iso-8859-1?Q?zWbSk0tnmIp6NfbZFGBLRKx+0qNPW5WLFgx2kTAmKSuQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EunP5DUc+06zCONUbiBPiMqTzJHtr6aEmB3ZBYi7ufU/Kas/AYSWKu6tXi?=
 =?iso-8859-1?Q?+Ik18RUpR2QbRKjKzJ0EC6SxjRSPbjm4w20qB4UmG1O6hFXHl1Is8wdS2m?=
 =?iso-8859-1?Q?ps2Oe2LqvyzyzKfrWbGRMrhSDvB8fQ4l+9PXksPefbjnQvg93JYHh/uy8W?=
 =?iso-8859-1?Q?ARKIw1X3Gx6hIbZ9vdM+We2m6JbLzABtZRY4WaAxNsESav8NdL0S/+gicZ?=
 =?iso-8859-1?Q?IMTVzt9Hn460BpqOGuDsOAN+G9JDNsY1NRW6zaOtB6NHeezCM7bW32T0ce?=
 =?iso-8859-1?Q?zyNKYorJaMBTMIkq2JW7TYrt220DnI19tne9qoHV/lz3EmBIEDPa+Tx98x?=
 =?iso-8859-1?Q?va58Lgq1sIKlBvvu/ED57y/wqV+UAsmY/Bc6K7O/5lEZENnvDCH+nSPe9B?=
 =?iso-8859-1?Q?SPlpVh6qE20X70ImYL1CzezZHvDyf4hSN84USwsuDeKVTthYydN2wfFMeT?=
 =?iso-8859-1?Q?uceMqpuQE3vvrSTYJuZvIu44tsjNQPrtPacLBqL/UT1R26ovXsK3CRzAJx?=
 =?iso-8859-1?Q?Afz+7TNNkBIjJqCB+SfNt07CrFAWNaEutgeMac4Q35Nht9auBYZAghXitL?=
 =?iso-8859-1?Q?IiJYTrQNUfPEmPL7jsNMdvU2gSlQY6PpyZ+Ufrs2+YhBhztfBO1OBe/rhl?=
 =?iso-8859-1?Q?1SsNqZ+KSVnqqZFfTqTQxTh6Yc101KX/xXGXStV5xCxjyiUZdwJOpMtC6d?=
 =?iso-8859-1?Q?mbOJ2ZSpsjfqkSlQHTCIpqeW5MPvcU85F3nB0i06FnsKKfxa/egGX074zk?=
 =?iso-8859-1?Q?OXH7wmdSEk5tVfH5On2q+d9fYMSSXxZhsbwij/h2hZ1KmCY6R43cMP0KjW?=
 =?iso-8859-1?Q?MGDJdOhpyQkq6Yrt7/+UKan+OZS8lDizb6e3rJejGv6xlAUiJQcC2lY6QO?=
 =?iso-8859-1?Q?U3Y3cqIm8bjfH8KXcGJem0pj+jHD2SjEH9rwtRL5/lmZWcoXwXgRxaM/nZ?=
 =?iso-8859-1?Q?b1xb+PNBj/CgyyfWt7wAV8GQBjGmA/cTWleOKogBSmC6pFoGh5ogJs0HRJ?=
 =?iso-8859-1?Q?NgA6Z5/dPC7S2pGVY8EmLvlBhMMdk9gSvW05MmvltIDUDIt89cjCKw/YvT?=
 =?iso-8859-1?Q?pTsfWW8duQhJQ5dc5jJZwAYbtf05mXB3ylBh/w97QoD+OOvi234iiX0CHA?=
 =?iso-8859-1?Q?/2o8n7uDAEFwrRtkVka1F8oVyceZYD6kZWX0W8PnnuZ1EV+wC2rExef92X?=
 =?iso-8859-1?Q?08kv7ipG3EcULFQm9R3D+Cxemw1cjBQ1TtBSs/qAxSecvZzlKIJXiK+krz?=
 =?iso-8859-1?Q?qJsVg32zA4aScNCDgEZNL48Bjgn83lqCzJ9G4zcPTo9xbtZfzIa8e4WiG0?=
 =?iso-8859-1?Q?nE6qNXEAO6L/cBsSRhSiZGvUoJ9y6EjuOmsfnQgYr8AIl2J0WDR1kHJjKj?=
 =?iso-8859-1?Q?dPfHLsrS/hhx0GJHSY714rLrv7PfpVJS0rPTUNWTUf+1C8he6s+X2bBei5?=
 =?iso-8859-1?Q?M0Z8j2tjkrNIIp+VR8q6TtX0mGDdF/QLkkCnxw6LZeQv2mw5/KFP3ZEh7x?=
 =?iso-8859-1?Q?gkAPbKdGrMtze1y7Sdh8LwcmM70lca7QD/ouWzhtoFy/JyzFRE7LreSLkg?=
 =?iso-8859-1?Q?pWW5hsGrmLVGoNoZxnXr9uajNlsKSeL6oatspQcGGdl7G84aFmZ6M+utmE?=
 =?iso-8859-1?Q?YwrtfvnZCgRDdBGpMsd7iCNKmcmkvqtgJH?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24661da-69ee-4b86-07d0-08dd9862614c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:24:06.2611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvLiE2BRQ6gSzLiX7ltj9JDh7gt+CrU4v4QOWdC3frSqlxE6OB2GLKgr4m5lpE+pjcyfK7OO3WFgnrV8ftTWgd+PmnHVNLXzu+yzwB9uabQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Monday, May 19, 2025 11:13 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org
>Subject: Re: [PATCH 1/4] platform/x86/intel/pmt: crashlog binary file endp=
oint
>
>On Fri, 16 May 2025, Michael J. Ruhl wrote:
>
>> The export API added a requirement for end point data to be
>> used by the intel_pmt_read() function to access mmio data.
>
>Can you please try to rephrase this, something feels wrong with the
>grammar (but do realize I'm a non-native speaker).
>
>I'm unsure what requires it due to general vagueness feel of the wording.
>
>I guess you wanted to say something along these lines:
>
>PMT export API intel_pmt_read() requires end point data to perform
>MMIO access.

My attempt to be concise did lose some of the context. I will work on the w=
ording...


>> Without the ep, the call causes a NULL pointer exception.
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000000
>> PGD 0 P4D 0
>> Oops: Oops: 0000 [#1] SMP NOPTI
>> CPU: 12 UID: 0 PID: 5721 Comm: cat Tainted: G           OE       6.15.0-=
rc4+ #3
>PREEMPT(voluntary)
>> Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>> Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS
>1641 02/21/2024
>> RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
>> Code:
>> RSP: 0018:ffffb19981ebba18 EFLAGS: 00010246
>> RAX: ffffffffc0ef8e08 RBX: 0000000000000800 RCX: 0000000000000800
>> RDX: ffff99aee03af450 RSI: ffff99ae86552000 RDI: 0000000000000000
>> RBP: ffffb19981ebba58 R08: 0000000000000000 R09:
>0000000000000800
>> R10: 000000000e2f8200 R11: 0000000000000000 R12:
>0000000000000000
>> R13: ffff99aee03af450 R14: ffff99ae8a4bbc00 R15: ffff99ae86a35a40
>> FS:  00007f097dd88740(0000) GS:ffff99b62fbe8000(0000)
>knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000000000000 CR3: 0000000198860005 CR4:
>0000000000f72ef0
>> PKRU: 55555554
>> Call Trace:
>>  <TASK>
>>  ? sysfs_kf_bin_read+0xc0/0xe0
>>  kernfs_fop_read_iter+0xac/0x1a0
>>  vfs_read+0x26d/0x350
>>  ksys_read+0x6b/0xe0
>>  __x64_sys_read+0x1d/0x30
>>  x64_sys_call+0x1bc8/0x1d70
>>  do_syscall_64+0x6d/0x110
>>  ? __mod_memcg_lruvec_state+0xe7/0x240
>>  ? __lruvec_stat_mod_folio+0x8f/0xe0
>>  ? set_ptes.isra.0+0x3b/0x80
>>  ? do_anonymous_page+0x101/0x9c0
>>  ? ___pte_offset_map+0x20/0x180
>>  ? __handle_mm_fault+0xba3/0x1010
>>  ? __count_memcg_events+0xca/0x190
>>  ? count_memcg_events.constprop.0+0x1e/0x40
>>  ? handle_mm_fault+0x1a8/0x2b0
>>  ? do_user_addr_fault+0x2f6/0x7b0
>>  ? irqentry_exit_to_user_mode+0x33/0x170
>>  ? irqentry_exit+0x3f/0x50
>>  ? exc_page_fault+0x94/0x1b0
>>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> RIP: 0033:0x7f097db25701
>
>Please trim this splat to have only what's relevant.

Will do.

>> Add the endpoint information to the crashlog driver to avoid
>> the NULL pointer exception.
>>
>> Two minor white space issues are addressed as well.
>>
>> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to r=
ead
>telemetry")
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 38 ++++++++++++++++++++---
>>  1 file changed, 34 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index 6a9eb3c4b313..952bfe341f53 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct
>device_attribute *attr, char *buf)
>>
>>  static ssize_t
>>  enable_store(struct device *dev, struct device_attribute *attr,
>> -	    const char *buf, size_t count)
>> +	     const char *buf, size_t count)
>>  {
>>  	struct crashlog_entry *entry;
>>  	bool enabled;
>> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct
>device_attribute *attr, char *buf)
>>
>>  static ssize_t
>>  trigger_store(struct device *dev, struct device_attribute *attr,
>> -	    const char *buf, size_t count)
>> +	      const char *buf, size_t count)
>>  {
>>  	struct crashlog_entry *entry;
>>  	bool trigger;
>
>Please separate these, in general, put whitespace cleanups outside the
>lines you touch due to real code changes always into own patch.

Will do.

>> @@ -222,6 +222,31 @@ static const struct attribute_group
>pmt_crashlog_group =3D {
>>  	.attrs	=3D pmt_crashlog_attrs,
>>  };
>>
>> +static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
>> +				     struct intel_pmt_entry *entry)
>> +{
>> +	struct telem_endpoint *ep;
>> +
>> +	/* Endpoint lifetimes are managed by kref, not devres */
>> +	entry->ep =3D kzalloc(sizeof(*entry->ep), GFP_KERNEL);
>> +	if (!entry->ep)
>> +		return -ENOMEM;
>> +
>> +	ep =3D entry->ep;
>
>Since you have the local var here anyway, I'd kzalloc into ep and only
>assign into entry->ep later (after error checks and filling it).

Yeah, I cut and pasted the telemetry code here.  Your comment is how I woul=
d
have done it, I will update.

>> +	ep->pcidev =3D ivdev->pcidev;
>> +	ep->header.access_type =3D entry->header.access_type;
>> +	ep->header.guid =3D entry->header.guid;
>> +	ep->header.base_offset =3D entry->header.base_offset;
>> +	ep->header.size =3D entry->header.size;
>> +	ep->base =3D entry->base;
>> +	ep->present =3D true;
>> +	ep->cb =3D ivdev->priv_data;
>> +
>> +	kref_init(&ep->kref);
>> +
>> +	return 0;
>> +}
>
>This is 100% copy from telemetry.c, isn't it? The code duplication should
>be avoided.

The telemetry code has more overhead with it...i.e. the kref is actually us=
ed.  For the
crashlog code, it is not currently used.   This left me with the allocation=
 part being in
the "common code", but not the kref parts....

I will see if I can make this a bit more clean.

Thank you for your comments!

Mike

>>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>>  				      struct device *dev)
>>  {
>> @@ -252,6 +277,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns
>=3D {
>>  	.xa =3D &crashlog_array,
>>  	.attr_grp =3D &pmt_crashlog_group,
>>  	.pmt_header_decode =3D pmt_crashlog_header_decode,
>> +	.pmt_add_endpoint =3D pmt_crashlog_add_endpoint,
>>  };
>>
>>  /*
>> @@ -262,8 +288,12 @@ static void pmt_crashlog_remove(struct
>auxiliary_device *auxdev)
>>  	struct pmt_crashlog_priv *priv =3D auxiliary_get_drvdata(auxdev);
>>  	int i;
>>
>> -	for (i =3D 0; i < priv->num_entries; i++)
>> -		intel_pmt_dev_destroy(&priv->entry[i].entry,
>&pmt_crashlog_ns);
>> +	for (i =3D 0; i < priv->num_entries; i++) {
>> +		struct intel_pmt_entry *entry =3D &priv->entry[i].entry;
>> +
>> +		kfree(entry->ep);
>> +		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
>> +	}
>>  }
>>
>>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
>>
>
>--
> i.

