Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795755635;
	b=aiP+XLKEYEajB2krXnYmLtkkjojIxl3Dqo5r0hE6qf7Tq7NRIqO+IAX3vagTGNGW2ITn
	 cvS+ESm2szX04+sNZTH1VNPSdVLiu0YZwAFBl1bU4XGhCkojfrBkAfUl152a9Vw12Q0l9
	 TCXPgLiYKYEWJlOm10B30n3EFE3x0IxFo6O0suOqq23iImu4NvUmWwG8n3aJrZM+/hKDE
	 Ubh9aOLq58UZsgepZoHtC3K/ZzoOJRVN6dCtHXdXRiNNKqn8clSTXr85t0npIr3aO6+dK
	 3wzhMHNsk8qFuB/D0C8FYm1H/UX3Kf0lx5yOpBnfEpuSb4z7Z8S1+uY58ts6vZl6HKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755635;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=JvLtH6nTNFpYvcgFhPDGsK1rozG0bHJQBPdiB+nGdiE=;
	b=UplvQWoJhaW3Wn1xOZ09+hS1o+2yYBo/iSRj7dUfvUATx6XFURsqdimoZiCNbX6xAqAC
	 YpEpWVGMLpkpEloof4Wprct9i3fwX71nqeOwAbkKqg6jKoFihWdFIyCnc6KCNEUAlDQKm
	 TwB9Htz94N1h/Z0LtHxs6q57Su3ILcM7v1dmDWRmjmlZ86QPpHv1ph/H5HvAjy8r9XsvK
	 UMEuoct/BmabYheW6N25uJBOxCUCCB17JrE1JpZ7CsJNO1PFnJNLG7Rgg1xbMmyuQDyge
	 QdPCfTJumf3oyQlvn1RDNd8hZlIu/QeDH5MuiWHqOg3q0cN/i+A01h8w+eWL8keJKLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRnOJOtT;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RMEkKIZ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B952606A31C;
	Fri, 27 Nov 2026 05:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B952606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRnOJOtT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RMEkKIZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795755635; x=1827291635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JvLtH6nTNFpYvcgFhPDGsK1rozG0bHJQBPdiB+nGdiE=;
  b=dRnOJOtTKQDjd2db2sliL/6T5R1LR2pphl4Hxjbky8lDWrmQ+c39hu6e
   /2nW+mcz/6yjMulgFAPn7Iq58X54UMd5UEQyEaTYJrRehAh2IvEk6SfQO
   Gf40ZSNv4idd3lyRvYarPk1ZgiVsdixUuSX3aZoyhYRodq0iR0UYScTU6
   03e2MU4ZieYK0Par3mtDZynHe9VDBtU4LW943Exe1I4t7E48qvvk285Lh
   tTTPhsmIfT6fdvYulmDJQNB7+S3Dzw8G3EBZFf2fLuWYbI7aqYGfbjlEN
   YnZri1IEe5QLl+YwrIwJQiTkMO1TOuurnLGRnK1rvbHR0nfF8FI6L+vI2
   Q==;
X-CSE-ConnectionGUID: 4xkcf/mFQ72Qvm0xRj53zg==
X-CSE-MsgGUID: O4NWNH0LTYO8EeHQH2gNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4751404"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4751404"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:00:34 -0800
X-CSE-ConnectionGUID: iE5ZnbmzTaS2lGUhzWy7QA==
X-CSE-MsgGUID: Ct2IyYjNS6SWmiePj8GZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12343455"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:00:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:00:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:00:33 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:00:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy3QrIlhfRmf+OtRLsPVvhKE4VN3ESSs71cgIE/rdO6ADp0PmQaxSpXLaH6C9JS0IqOAzk8e9Ewf9IJLSZz02LiTHweMtIDf3GKhwCSiikjB1UgLZbbEgCqgeH611uXzlAEsRJnOuqBIoRfO6P7QfEAF/Hs4n42UIa6ZpuXcxIsr7C3RGS6HojRrERX66m+ghyU7DDYFugSnWdN7uXt1uZ1GxfzMZRdl/MZql4yMIgDlmf4s7JnCWvgKHNvt4ywCncpnpk0spbkTpBG8pQVtUrS86KBotVm7H9zJCkkkQc8zdEC/adW1KMkFWgDZlka8QtjNA2TwzAolYbtFdJdgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvLtH6nTNFpYvcgFhPDGsK1rozG0bHJQBPdiB+nGdiE=;
 b=EQjJaDE0C486IYRhc7B3Lvh3l2q4arFQgwA+jf02CN6owX4OV/f48Qo2BSjJtPFuvsX8Xw68DwSNA3tjuUaY/2Oq3K/r5pC3XyzERzYswGllJhaLrtxgJ07mLjn1Wn5xl2insYOKoXcudz314kQwAY27vlEbWxPmSOzA0mytuWegfVk5BD4aNQdRNzg/3Y9rL8hnDRj2MvbAC11ZQ/sDAQOwulIwEzmHcQibrQT18XEqfFaQag4L/g5rlQJbqJpJZkRTOfBX4Unk29Myq56eH4e6yDpPrUvxmR9iLK8XSHOTBNxUgoIsG52HTr34e7ZiO6mRvZzNlvw18JxmOVgiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvLtH6nTNFpYvcgFhPDGsK1rozG0bHJQBPdiB+nGdiE=;
 b=RMEkKIZ7JEJjc44poGojVuKiGRyQUNuhZWFROCnc6JPkw6tkaHKrADX6naKE/7/HjGOqYIBG8wm5UiTBhzOD6UyGshhXCx0QfMkSdzjgCJmRHYvWcdfgEb3+WRRIkn5hzxBpzZuTVPDyLAwFKgu80dHqqKrgIBYi0cuufee+j1E=
Received: from PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:00:30 +0000
Received: from PH0PR11MB7493.namprd11.prod.outlook.com
 ([fe80::8734:39db:ce8:f20e]) by PH0PR11MB7493.namprd11.prod.outlook.com
 ([fe80::8734:39db:ce8:f20e%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:00:30 +0000
From: "Zhang, Rui" <rui.zhang@intel.com>
To: "hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "qinyuntan@linux.alibaba.com"
	<qinyuntan@linux.alibaba.com>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "xlpang@linux.alibaba.com"
	<xlpang@linux.alibaba.com>, "tero.kristo@linux.intel.com"
	<tero.kristo@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
Thread-Topic: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
Thread-Index: AQHdfiw52BsQ5SkBhkmUlDeZbj2B7w==
Date: Fri, 27 Nov 2026 05:00:30 +0000
Message-ID: <7bd156a0ccc8ce5c24d26b1a4583bd7086f41942.camel@intel.com>
References: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
In-Reply-To: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7493:EE_|BL4PR11MB8871:EE_
x-ms-office365-filtering-correlation-id: de963686-94b1-4a02-2dd5-08df4c435c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261022105027099003|38070700021|261022075727099003|10067099003|56012099006|261026140227099003|11063799006|261026121527099003|261028144727099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: a9V48QoWCDbRl/0eDkcigA7tGhLCjwIOsOsOYu8gt/la3kbi4aMZS7ck1yG6296eZndFFPzkSDHyMoi1fGx8afwgMrA6JU9Qdnj/qqUvFLCJwWqxIL/QO+nTkD/MFsqbsmJ0+Ghkogd0wsvvB5epl/iioXeZaIhAuty/oRpiaFqV9qqbwqJOcexYdvTS8Kljze7O6USblDIbewpNnP004ISFryaByEBXopc/j/H57YGRgqElPRuyH+/xe5VmqOgbp6HSGt2udvsBUE0wb3LdUUGXTacXVQ8r9OQaIRqgg8h73Ne0z7mZUvEzAh6uqQtysQ78BQLcELJ6AO44JBcD2EvTtXRmssTB8Ol+3wEsC0AIKzWjI1vXo5iqcD4Cc+o5l73US065rk/Wzt/LK4TpA2xo8snhVQLIyKIBU2om8ZiLcwjgn5EGB4KnWvca8bT4GIvenKHRzzg1OHyl9VqeHvnaQ+v6i7cUrHcBQVk7A+NE5rjAXMmY1FGRNTE4Mijb3fAtA/wevznTYhYNp7cJ/gfJYN9mPdHONerxgrW8Bvn2uF2AmCy4c8saL45xM1f1HjvwC2jYmo0XffJSvJ2orEOZ2ODSNX1a016XurQm5RLufFmPX80su2PtxCvpCaJfxuyLEv/vuil3BIw3OCdVRJtbq8dz7su0DVs/3M1/sCJWxMWY6lG/8B6RYfr19nASqSs168Y6B3K/62kqaJ8NLpwNj21aVaKCH9VOqPsz178=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022105027099003)(38070700021)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(11063799006)(261026121527099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVN6TVBUUDhOeTF3QXJ3WVZXYWJCRkhLa05VMk10dUZycmpxdHhOVlVhRDV4?=
 =?utf-8?B?WGZIY1hCQWozbGhLdWRiM3NhZ1dnb0JVTW9rbHlnRlpvS05vV2xHOHlZOTNN?=
 =?utf-8?B?dkQrQUtaVUU1QWc5aGlIYkRmRFcrQUkvb2RTa05QZHYzUm1ST2l3RU56MlZB?=
 =?utf-8?B?WHArTy9QMDk4c2xMRGN0ZCtJdk1pcFRKeGlXUFdQTjZSVzh4Wjk3VU1NQzEw?=
 =?utf-8?B?YktxQmZINkpVU2I0M1RPa1RhMG5nZkxMMENSeXNjRGp4dURpc015aHlTWS81?=
 =?utf-8?B?Unl6QmsrSjdmc0xwTjR2R1ZpK1VOc0hPWUlEcUVWbFVabjFKTmZva2Zrejh5?=
 =?utf-8?B?Z21IVmlwVTBHVWxTV0pWdzM2SzFpMHQ5WVg1aTBmZDdJUnJrMzAvMGMrcDFI?=
 =?utf-8?B?SEwvL3NjYVpkNGlVR05BeDlBdHNrdThGdVNUb0JWQXBsa3NCczJ4bDk5Sjhl?=
 =?utf-8?B?OVJjMTExbmRkYkl0WXhSTkNibThoZUlUdjIrRGVTVzFIUFZsdVBPWHBLSG5o?=
 =?utf-8?B?WGJXb0NMeXIxeXB4ZU5VYk1hMWE3RkZZM3F3UXJHU0ZMRVg4RUpncHJVMTZu?=
 =?utf-8?B?MnYzbzNiS3RZT1p6dE9hZ2VGSXVJeGNGRVlHQmhpdW5SOGNUWmVLTEVLaFhZ?=
 =?utf-8?B?OVo1Ti8wR0pFRzZIdHdZMmROMTM2ZHkyK3c0ZGdzbFF6RlJLcjNpM1F2d24x?=
 =?utf-8?B?YXRMeWNvU1hqclZCYWkrbmNqbXhwK1E2VlVWSHlCOENhU2x1R3kxOHlDamZl?=
 =?utf-8?B?MklZODNQT0NwLzRWUktmQk10MVBiM1o0YlFZbGRkbUNSekNldzNTa3NuSGN3?=
 =?utf-8?B?SnAxY0lPdWo1ZldscDMyU3p6VU5UNEppVDZHUGhqajZ0YzFzTGRHaVF6NHZY?=
 =?utf-8?B?UWlZUE15T2gyUVBzb3hyZnc2QlBwdWhMZU9nczJPdTd5OElUeVZtVHNldHZ1?=
 =?utf-8?B?SkE3VDBoVFI1WlNMb0F5TWtmQnNRSURjQjQwM2RpVTg4dHBuMTkwYkI2ampQ?=
 =?utf-8?B?bno4azRhRGkwKzlpUnpPbG56VktmTXF0Qlk2Q1d0RForQmU5ejZsT1pSdEp6?=
 =?utf-8?B?UmJEWFg3dFh5YWlEVWt4NUN3ZkNwTjRMM0tOeGdnem9oMERiUkhmMHZQWWl0?=
 =?utf-8?B?SUR2MFVKNWRYZjRHYnptYkliSU55WDVZNWV2NUUxQ0h1dXNBbDFxNHVZOCtX?=
 =?utf-8?B?K1NWdXJub1hheG14N1A5RnJuQlFBc3BrNXJHcCtzRkxGSWRWVnhZMDA3dnQ5?=
 =?utf-8?B?VFpqOVkyMVhZVEZ1NlFKMWF5V2x1MC9RaUxyaWp5Z3RGY3JwZlhnQlUzUDdY?=
 =?utf-8?B?VVEvay9WeGVNeERrMGJNTi96OXlseG1aZ2xPczJZdDRFaVU0dkpYYXdsbUNh?=
 =?utf-8?B?ZkxTbmx1UUp1NnJCTXZhRmY2L2wvdWdSUVVDcExaVXcvbVpLcDV1VEF1RmpI?=
 =?utf-8?B?UFhqL045ejF1U2g5TzVtREF2U0FGUnZIdkRIV2w4YjJwYm90V1M3ZHltTTBq?=
 =?utf-8?B?dXJSUlNXRUV6Z1NFZ1paMUZGRTdPQ3pHSGwrV0x3SkV4c2IvUHBnSkZhZDVK?=
 =?utf-8?B?Tjhtb0VXWUtqWFJ5M3NoTTc2RS9kMDcxdUNEOWRKeGNpTlNQZlIrNEs3M2xr?=
 =?utf-8?B?MVh2TVEwdnU1Q2k0U1pVT01wSzF3T1ZiU3JzLzRBQUNLQzlEUDJKdSt6SWo4?=
 =?utf-8?B?aE5zU0V3WUdSbFhLc0k2SlorNG96S1BGTHJXc3FrZnA0azVGcXNPaDhLa0VB?=
 =?utf-8?B?ekJoVXFiYytWWjBTT1FNbWhaUlArUFR6dk9NY0M2dGlaNEppcFBTb3pFQjBo?=
 =?utf-8?B?MzFZQXUxVzJUMUZza3M2WHl3Q0tWN2hkbHB3UGMvZytONG1aYTljZkc2c3Qz?=
 =?utf-8?B?cjZXMTNsVFRFZktCczZ5VkNGVHBudGdoUzlPejVYMHVPT05ZU0tQYTdKaGFl?=
 =?utf-8?B?RlVlL0I4cjYvVTlCZ1A4dzdURDI0SnZnRmdFS04wbGVIY2JSZzlNVUVmNkZZ?=
 =?utf-8?B?dTRZdWJXNDhYOXFuOFZmQ1QxdzhkK2YyNDc4OFFXQU5TbkR6a01nZnpxYXcw?=
 =?utf-8?B?cDYxYVorcHR2UHErckRRVkRJTEdhUGRBVTN5eXRGYTRyNXRUZm0rNURpMVBP?=
 =?utf-8?B?V1lnRjNmNkdkMlRwN3Ryb1VDcjVKRzRRVGtQdXJnQWhnbmtlUTRTalBkOFNE?=
 =?utf-8?B?Rm5FYnFlNkN3eFZxQVRCZ1FraFlZc1NNTkFaNEI0TUdIYlUrNkNKVDVxTlpF?=
 =?utf-8?B?S1VuL0pVb1l2aVoreWZpYjJTbTdFL082bnVBRXVhcHdFaGVMN1lYNTNPbTNJ?=
 =?utf-8?B?em5La0RJYXhWY1NzMGs5eUdHVVo5V1NaUS93dHI1bWRMUnczOHNXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <182D38CEE25AB74FB95D4588B9B6C9DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QPQGIo1CuOk5h0G99M5jIn/Jox7HUMlQYVT9yprBJfGu1faxrg59PoJoluE4s7lgWpMavTbFjdv2AVlZbrk01xlFwDXhv53LdSblsTnzMV6TEXq4DFywbqffj4N7BJeg25/sSgvHJ/doEt3y8JNar8ulBAFxW+/4eSOhPN0Kp+jwZ1iSzHuuj+VjkSfuosazikcXjADRNISW65xX4+YnEP+U9BYaJVvFFsYqMvVMq2e8mVP1ZlpCUGUQNC2J3KGONnt945zInYAGwiQXwtx56r3OIjB4FnL3fTrrOmNj1f3v94rR8OQrpJbhV5pvgKyDvyHYt3zkyUOaUDTvwL1sTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de963686-94b1-4a02-2dd5-08df4c435c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 05:00:30.8115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpJ0QImpRtj8FOexBCdEpQE3/1QDTaRKaLJldv+3pAkbcHL0iWc7FpjbtG6h8b1KztK4Tu2yClwqErPKFcCGdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTI1IGF0IDE3OjIyICswODAwLCBRaW55dW4gVGFuIHdyb3RlOg0KPiBX
aGVuIGEgcGFja2FnZSBoYXMgbXVsdGlwbGUgVFBNSSBwYXJ0aXRpb25zLCBQTFIgY2FuIHJlcG9y
dCB0aGUgc2FtZQ0KPiBDUFVzIGluIG1vcmUgdGhhbiBvbmUgcGFydGl0aW9uLiBGb3IgZXhhbXBs
ZSwgb24gYSBzaW5nbGUtcGFja2FnZQ0KPiBzeXN0ZW0gd2l0aCA3MiBsb2dpY2FsIENQVXMgYW5k
IHR3byBUUE1JIHBhcnRpdGlvbnMsIGJvdGggcGFydGl0aW9ucw0KPiBsaXN0IENQVXMgMC0zNSBp
biB0aGVpciBQTFIgc3RhdHVzIGZpbGVzLiBDUFVzIDM2LTcxIGFyZSBtaXNzaW5nLg0KPiANCj4g
RWFjaCBwYXJ0aXRpb24gbnVtYmVycyBpdHMgUExSIHJlc291cmNlcyBmcm9tIHplcm8uIFRoZSBk
cml2ZXINCj4gY29tcGFyZXMNCj4gdGhhdCBpbmRleCB3aXRoIHRoZSBDUFUncyBwb3dlciBkb21h
aW4gSUQgZnJvbSBNU1JfUE1fTE9HSUNBTF9JRCwNCj4gd2hpY2gNCj4gaXMgdW5pcXVlIHdpdGhp
biB0aGUgcGFja2FnZS4gQXMgYSByZXN1bHQsIGJvdGggcGFydGl0aW9ucyBzZWxlY3QgdGhlDQo+
IHNhbWUgQ1BVcy4gQSBtYWlsYm94IHJlYWQgb3IgY2xlYXIgb24gdGhlIHNlY29uZCBwYXJ0aXRp
b24gdGhlbiB1c2VzDQo+IGENCj4gbW9kdWxlIElEIHRha2VuIGZyb20gYSBDUFUgaW4gdGhlIGZp
cnN0IHBhcnRpdGlvbi4NCj4gDQo+IFVzZSB0aGUgcGFydGl0aW9uJ3MgY2RpZV9tYXNrIHRvIG1h
cCBlYWNoIFBMUiByZXNvdXJjZSB0byBpdHMgcGFja2FnZQ0KPiBwb3dlciBkb21haW4uIEZvciBj
b21wYXRpYmlsaXR5IHdpdGggb2xkZXIgcGxhdGZvcm1zLCBrZWVwIHVzaW5nIHRoZQ0KPiByZXNv
dXJjZSBpbmRleCBmb3IgcGFydGl0aW9uIDAgd2hlbiBubyBtYXNrIGlzIGF2YWlsYWJsZS4gU2tp
cCBwZXItDQo+IENQVQ0KPiBtYWlsYm94IGFjY2Vzc2VzIGlmIHRoZSByZXNvdXJjZSBoYXMgbm8g
dmFsaWQgQ1BVIG1hcHBpbmcuDQo+IA0KPiBGaXhlczogOWU5Mzk3YTQxYjdiICgicGxhdGZvcm0v
eDg2L2ludGVsL3RwbWkvcGxyOiBBZGQgc3VwcG9ydCBmb3INCj4gdGhlIHBsciBtYWlsYm94IikN
Cj4gU2lnbmVkLW9mZi1ieTogUWlueXVuIFRhbiA8cWlueXVudGFuQGxpbnV4LmFsaWJhYmEuY29t
Pg0KDQpJIGhhdmUgcmVwcm9kdWNlZCB0aGlzIGlzc3VlIGFuZCB2ZXJpZmllZCB0aGF0IHRoaXMg
cGF0Y2ggY2FuIGZpeCBpdC4NCg0KVGVzdGVkLWJ5OiBaaGFuZyBSdWkgPHJ1aS56aGFuZ0BpbnRl
bC5jb20+DQoNCmJ1dCBvbmUgbWlub3IgY29tbWVudCBiZWxvdywNCj4gwqANCj4gK3N0YXRpYyBp
bnQgcGxyX3Bvd2VyX2RvbWFpbl9pZChjb25zdCBzdHJ1Y3Qgb29ibXNtX3BsYXRfaW5mbw0KPiAq
cGxhdF9pbmZvLCBpbnQgaW5kZXgpDQo+ICt7DQo+ICsJdTE2IG1hc2sgPSBwbGF0X2luZm8tPmNk
aWVfbWFzazsNCg0KVGhpcyBjZGllX21hc2sgaXMgYSBiaXRtYXNrLCBpdHMgTnRoIGJpdCBtZWFu
cyBoYXJkd2FyZSBjcHUgZGllIE4sDQp3aGljaCBJTU8gZXF1YWxzIHRoZSBwdW5pdC9wb3dlciBk
b21haW4gaWQgTi4NCg0KPiArCWludCBpZCA9IGluZGV4Ow0KPiArDQo+ICsJLyogUmVzb3VyY2Ug
aW5kaWNlcyBhcmUgcmVsYXRpdmUgdG8gdGhlIHBhcnRpdGlvbidzIGZpcnN0DQo+IGNvbXB1dGUg
ZGllLiAqLw0KPiArCWlmIChtYXNrKQ0KPiArCQlpZCArPSBfX2ZmcyhtYXNrKTsNCg0KaGVyZSB3
ZSB3YW50IHRvIGdldCB0aGUgcG93ZXIgZG9tYWluIGlkIGZvciBQTFIgZG9tYWluIDAvMSBiZWNh
dXNlIHdlDQp1c2UgdGhhdCBmb3IgY3B1IHRvIHBsci9wb3dlcl9kb21haW4gbWFwcGluZy4NClRo
ZSBhYm92ZSBjb2RlIGdlbmVyYXRlZCBjb3JyZWN0IHJlc3VsdHMgZm9yIHRoZSBwbGF0Zm9ybSBi
ZWluZyB0ZXN0ZWQsDQpidXQgd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBjZGllX21hc2sg
Y2Fubm90IGJlIHNwYXJzZS4NCg0KaG93IGFib3V0IHNvbWV0aGluZyBsaWtlDQoJaWQgPSBmbnMo
bWFzaywgaW5kZXgpOw0KDQp0aGFua3MsDQpydWkNCg0KDQo+ICsJZWxzZSBpZiAocGxhdF9pbmZv
LT5wYXJ0aXRpb24pDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJaWYgKGlkID49IE1B
WF9QT1dFUl9ET01BSU5TIHx8IChtYXNrICYmICEobWFzayAmIEJJVChpZCkpKSkNCj4gKwkJcmV0
dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwlyZXR1cm4gaWQ7DQo+ICt9DQo+ICsNCj4gwqANCg0K
