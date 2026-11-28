Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795833620;
	b=mQVbPGQUmFBzuJNjb2Xd91iDtBsJWOqjZrjv86SvsPTIbR5Wlb8h8Sy7hps5x5TNa7Fi
	 IGlk/PUZwHxEf3CQzVsNk1u6gMQ0ONmnAS3YqpoiW4gV8gwzIm3AXDVhN5Hl+QGm9S87m
	 kTYbvuwOBdK5oTgHPJUgcelfxPSPPUCS5kppUN8LRBmEOY9H/bGsyaBB3gJk0dDNhAVXH
	 d23pxMESzYG9+pDGtGJDNeB6nwVQFSxcr5nBpPrWhhxqksUp6wWa/gEXbgcmFMn/keDPM
	 ZTVeIhcZXm4PGrJfJRBp5u4oltYF6i94Q5B9LA7rgbmt8aiCdSL9samiIDPXJ0nOxeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=czugB6a0d9eQjWshz1uGU6Xj/5YrqokznzJIzY6gJvs=;
	b=u6ue2XxkA7UrUT07QSOiAvUkUUPUeRvagNuXoEA13RHYkVTWRT/MVkpIzYp6WHvlEIuF
	 TNZ4UN/IQ1E+jyL/VcnBxaS4N94/lCvcLkNLWhU5CThasNnTTyZ20/WTtSYVPogUBfd8u
	 y3chZSc2Xx0275pxXwWIFf9pnSxf97ESDbydw/X4q2ac28xcUbp+5KwPF+Mz6z65ylO2S
	 4MaKi73488xGYayzTb2kHtdaicztabkEmb57Jaet0FcpBqOU7XBn6Iv8zzHMA/AKv2OlV
	 F9vK1b3ry/kVa75bblUZHOEtzQhvuuKkK1X6ba2n5rdmwYQzU9WTe4eYwgYLvJy9fzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQam28kW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05391606A31C;
	Sat, 28 Nov 2026 02:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05391606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iQam28kW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795833620; x=1827369620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=czugB6a0d9eQjWshz1uGU6Xj/5YrqokznzJIzY6gJvs=;
  b=iQam28kWz7NxrBXNzgqScWSKu8rNyLOjYSoQ465TgZdq15my7FZdVSau
   yjOcWeZB5BV3E87PciQwI2kvW6dj0CIvKrhXo0p7KtHolcQ70dZy8EQJb
   ZJTRZ6yN7bjdrIXBlIV1sopjLA/7twVuWcwHPUEYknVthgNAIXlDzzcWI
   lmmqX4o6W1B0iu7Fjjmg27zQkMRv4HHMKqJI/MGbN9wh0I0m1j+SabBFu
   0lyCkbwPkY00Y9251bN8Jfu22K8hAQ2oCLS8ju01sb1xBG3+CcVGkZOeB
   J3hXRcMsQQFJ2xj1OTWwJ8DCukdk5qnAniPUsxqhqVs3LSGiWRtXG4uEO
   w==;
X-CSE-ConnectionGUID: ljAxsgPZSFqVtyoFEjcIZg==
X-CSE-MsgGUID: 3OnFKRgMQFKoWSMP8Ot6hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4627855"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4627855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 18:40:20 -0800
X-CSE-ConnectionGUID: Y/kPxUclQB2gh3p9KS6qkQ==
X-CSE-MsgGUID: uIL4nRPoSyudZ+CdKp6iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12739799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 18:40:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 18:40:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 18:40:18 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 18:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd50NL6tW5ZbhxjsyosuEufdvmIY8LY7Qh78sHmD4unLU07eJ4ZBRi8ZosOmLIFQE1VWiAVCEZq6xVdBDTKpxXvoh8GZzL7Pxl8VrI8+3/YFURUIBiu65f90jFXRyJJboeVTGsHEgixnL3yB8z4o0tdT6zcEU0irssJpsfjecKpcSzNa/SgDbVda7ZwHpSm+Wr5VQ2ZRP1q3kIZbzXNcnsq41Z5c8bhcvTTRB5hykdsVNx0QPIb3qBjJ1J3etbcdbLpxt2QPlGA+tYiIJmYpg9imExdfpVyu3KIKptxL48CkyZyDfpL6v972jNdwVXSyGxgIiHWkxhB5hbae4rENtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czugB6a0d9eQjWshz1uGU6Xj/5YrqokznzJIzY6gJvs=;
 b=DJbEb6NSNKfIOha1+oo3CJJelWwG8ty4T/ZZnBegjMVDutRYFY5sVtinTNa4EmsnVb/1ZYgnV3/otcFImtlYFPYNii20s/zFkD7NZ5DvJUlHw1LDoaHK+sEhwSq+l2kknxfOG5QsxLNWxKQXm1vEkAOwE0ZPS1zGkz8IJVnxn9cvujWZ1Mu1M1BzPKprlNLJ4eMKugRF9lyHkW50hb0YgQei7SQW6RoVbHA+i/FSXZW8Ngwax1mn5Lw/DUX5ceOMjIGro2QQs2HmQp6x5hlx7rrnyaUWBGy62raJ3TcNoKvozr3MWTgTK75IUtu9KRRiX5s3d0Lix8f+emvFUU8HyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 by MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Sat, 28 Nov
 2026 02:40:14 +0000
Received: from PH0PR11MB7493.namprd11.prod.outlook.com
 ([fe80::8734:39db:ce8:f20e]) by PH0PR11MB7493.namprd11.prod.outlook.com
 ([fe80::8734:39db:ce8:f20e%3]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 02:40:13 +0000
From: "Zhang, Rui" <rui.zhang@intel.com>
To: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"qinyuntan@linux.alibaba.com" <qinyuntan@linux.alibaba.com>
CC: "xlpang@linux.alibaba.com" <xlpang@linux.alibaba.com>,
	"tero.kristo@linux.intel.com" <tero.kristo@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
Thread-Topic: [PATCH] platform/x86/intel/tpmi/plr: Fix CPU selection on
 partitioned systems
Thread-Index: AQHdfiw52BsQ5SkBhkmUlDeZbj2B77dB0UoAgAD1GIA=
Date: Sat, 28 Nov 2026 02:40:13 +0000
Message-ID: <a4b87080985bb59d353bd48dd14258013875485e.camel@intel.com>
References: <20261125092244.3641945-1-qinyuntan@linux.alibaba.com>
	 <7bd156a0ccc8ce5c24d26b1a4583bd7086f41942.camel@intel.com>
	 <bac20576fb7d82c59fe9d33719b8a339ed4da84b.camel@linux.intel.com>
In-Reply-To: <bac20576fb7d82c59fe9d33719b8a339ed4da84b.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7493:EE_|MN0PR11MB6034:EE_
x-ms-office365-filtering-correlation-id: 2e62c135-8dec-4ff3-54e4-08df4cf8ee07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|22082099003|18002099003|38070700021|56012099006|10067099003|261022075727099003|4143699003|261028144727099003|11063799006|261026121527099003|261022105027099003|261026140227099003;
x-microsoft-antispam-message-info: in+ZWPss3YzTb9mOY5CgvLs1o44gPfDvdD7HOoU4mIwLNGtNiX1sWrNxHQFnIZuKINRDpymNTAKvNlQnpQgRDPWt9S9nZlAbTdaJivqCgncX+BCCY+ZAUcASp85ggYC0/SXj/MkxM1BiW2Fyf/ESX0r5tyUFTPkQVTh3y9LMns3833f9LVLqVgw/1AXKlF3KH36/ZRZvrYj1g2y0IeLuBCn11N+xfPvEveCsSm3y9Zyw2efl5pF7tOFd3ewVI07JOAMO6AL4HC3gr5vfrcMU45sGEYN0SzPtkRmqC4xN2+cOrBTD4MqvP4icNkTdL/2EbNZr0nb5U97GCE5KfxhVyox1+1PsJqSW+fB+9ip4dPg5OPdQS2xuEiWSYTbqNC6P12xJAk6y6IWWQy3nWSDiOwtwvcZaaeFUx8VnYtc4fOXQmnU89JF7Y1/eg+HfzlyiEOR14d+7Cj6Xrj81PcG8Tvc7wvhDZtLoQDqkWGFuBu8AufSoHQqEuI0mIBZiJ/ahW4JXusWAGY2r+DdLILQV0HcBOe14nNOYqRh3uspbKTvDLC9CitFsrgR9TGcSV6dFRHaXQZrWwTH5hmao72dXu3oWuM6g+KTcuCZ9r8wOXrd0qdxkTjp+KeNsdZGzoO2BVC9Bn/mfeFWbaqOp+zZhTndC/9L/uHIYD/u2AVoIUrueneRJ7D86IyI7ML6MBrFYodnXUCgFdwBj9iaSZJ7+wxDsFmaTHSiiN4ymNxN27S0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(261022075727099003)(4143699003)(261028144727099003)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0RMNDhBdWRMS0dCQVQ5RXczcGRxN2tmS0h4enAvTlcrb1RFV3BIeVZKakpt?=
 =?utf-8?B?eWI0anVHdkxEckRwc0FRakZTZ0p0MXU1VnI3NUlTczN0RHpISGZRQjlsclhR?=
 =?utf-8?B?NFYvTnQ5TXpsODYwN3BiNXpKOU5zYWV6aDB3K0hNU2pXZTJkQ09UVnU3RFoy?=
 =?utf-8?B?aklLQjBSWVFkZi9kcSthQytBMUxQQWljWENpNGtTcjBtZFE2OHh0NE1kaUY3?=
 =?utf-8?B?MTZURTl3Y3JqQ0tKMGNzc1lpa241bTFhdDlGbEhiVUVPdkNoSUJtS2hjbzlm?=
 =?utf-8?B?Wi90Nk1Na0RUbjhhTkt4a3dMclBRUU9wWFZBRzRqeXFTYWovNUhXSi9rZE0v?=
 =?utf-8?B?c1ZXRWVDbE5DLy96N2FzdWZWQ240YU1IeURpYzcya25JMElReEJLZ0ozQkpp?=
 =?utf-8?B?a0thNnc4QU1LZ01pS0JUb2RwelFoZ3RpbUFsT0ZLeHRzeWVqWlZiMjRTanZH?=
 =?utf-8?B?QVFkNVI0eXl5UURRMzBaaGpXdW16MHJTc2VlazFCMzFFMlJkYmFoZTFjc1hs?=
 =?utf-8?B?QjhwdjgzSVFUQnlaVngwSE1XMWwzMm5iaFpqK21sRytMWEhTQW9aTEY2WHRL?=
 =?utf-8?B?ZlhTdkZoL1RzdzNGR21PQTc2dVI1N3hZOUxaZ2ZYdGM3R2IrVlJWbGh0TzJ2?=
 =?utf-8?B?eW5ubEljY1pmT2d2VkNIWFdMY0J0V3A2YnJRL0hMbThuZ1FzYWNwbHJacUIx?=
 =?utf-8?B?ZDhuY2pkTld6aHpqWGkyZUg0cDl1eEdzVmxtQWU4RUdiVkVqTW5mRVEzUnVI?=
 =?utf-8?B?d2FVMDVwZ2pUMmlUZm1YbklUYUI1Mm1nK09yQzJWRzdVK3NDMmFjTnR1TzJO?=
 =?utf-8?B?d0NmeWdUNWFDR25qK3Jvd1U4bDdkQXFuQ1FYWVovOGErdytQcjlJSlVhSy9Y?=
 =?utf-8?B?R1o0TnRxUXh2T2haRGNJMXZVek01Q0tDalVhREVNM1Y4L1Jtb1NmRDF5dnJy?=
 =?utf-8?B?MVJGQ1hZWUJ0b3lMMWFKdkpDQ1M1VmJyRm5tZGZ5dnZGV1Fia1BIell1WGVN?=
 =?utf-8?B?VHlnYnRBbHVaK3VCV2lXb0RLV1FCL1ZkOEhqbVptRXpyVmI1NzFhbExXQWFu?=
 =?utf-8?B?dGpMZ204NkNPU2Y1Y0JuRXArem1FbjFyL1JjN1Mwa3ZycjFMRHlHQUNXNXpX?=
 =?utf-8?B?bklaWUtxNitvbDRUOW1NRGF5YWZiOHNXNUVVSmhTRXdLLzY4M3Y4UUNUbVJE?=
 =?utf-8?B?Nmd6TkJ2Vm45MTNCdGx1SVpMaUxnNVArUkxnM3cyWUZ1NmxuWkV6djNiUkx2?=
 =?utf-8?B?UUZndTFOQldHUVMyNTVhVmxFbFlIT21QeHBhYkxybFJINmU4ckVsbnJGQVlV?=
 =?utf-8?B?aTF5bWlQUk8rbFljMWRESHBqMlZtVnlvbWNBZWg4QVgvNlY2TzBtajVsb1NS?=
 =?utf-8?B?Qi9QQzNsa1lMY1ZwVWllYkh5OTBBQ0ZkTXFSMjBROENaZWwvamNxYnNmT1lG?=
 =?utf-8?B?a2laQ3F6OXU2NDJVa1lkNGJEaG8vRis5QUIrQ2NsWnBnWXVRRWVncTFocVRr?=
 =?utf-8?B?RXQwQjVkbnZiSHY5S24xQzdId3FEdGcwUWhoTVlRN0R1Z1VoMDl3VzMxWGxi?=
 =?utf-8?B?ZzJSNkRIaDR5ek5Rc0lXU0FmNjVEeE8raFdUYXRNbkg5c1F4eThhYWkrSGFR?=
 =?utf-8?B?SWtCNmcvcGN3NmcrL2wzb2kyVUVKREh2NVVpdHgyMk1DOUxJakVSRlNpVlYr?=
 =?utf-8?B?ZlE1czc2ckFqRHNiU3NlQXhkdHZjOEtaWWt4eVdsbnpVd0diQkRBMUhuYXIy?=
 =?utf-8?B?NVcybC9ZZkxhUWJWQURYcVRjUm16VENzMTh1dDJDcWhPRWhkZHBmQWxnZUlB?=
 =?utf-8?B?UVptWGN1OXFUQUtPZ3ZFWlN0TitzN2FIUlpnQU1VWFBNR1NXR2pRR0U4QW5R?=
 =?utf-8?B?OHFIZGVUakhiQWRkU1MvczB4d203UFIxSlFRY3JGclRETUlJdG1HeXFCeUdz?=
 =?utf-8?B?bFI3VHJweDhzWk1OUTdmWHBmYlJ3a2NYdTAwdkphaFJDR2ppTkpDYVU5WHpw?=
 =?utf-8?B?bUZhSHdXWFo3ZEpleVZFamtYZ2daOXJGYk1hUjIxSEh6T25KZGRMYms1VExD?=
 =?utf-8?B?RXFYLzFQdmRNM3Myc3hKTjhaczQ0R0FrN3RsYXBlTDBsMTlwSjdZZnYwWUNi?=
 =?utf-8?B?Wk90WWJZTzFaUzQzOVlSdVhFZ1RBVWFOUDQ0MGpCS2IzUGg0OXNvc1BMM0Vm?=
 =?utf-8?B?cHBVVndyT1hvMkpmVFp2b3NUWFlKUTJoOVpURURXUTZNY1FiYVBvdGpuN2hl?=
 =?utf-8?B?QnNrME0wN2ZpYWJzVGJweEhrVkF1MGF0Z09Zc1g2dktEbGxKY3czeEttall1?=
 =?utf-8?B?RGRsbGJyOUNkdWdRdUF4NHlHRVpQbmQrY256MXJDbFQ3OWJIaHVwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92FF3AEF12A7B41B415DC00443027F3@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: hHrzL/DXg19omjOZdXbm7GCdDuLM5gkMjIbKLsvjj9N9VgQTHXFiH34OWRVthj1vRz/csEF3kW3CDRdUBFmDVsB9uVM0CKDK1pr3krTjnFSzLlvI6XVXeQuSV+kpzgNQHQP5KMdbSBwff/JnCnf4BjDV0GtZ5SBxMY8OQsGYzSb+bQq8h6eU2n+x5pFpLUO2eUu/RLLCKMB5AwWm5hX8lSOuv6kAAjICBLSHRExn37ezW+/LKvuou9HPyTpncIOjWpsqD3lYvC3Yi1BO5Jv4R0zlv8uQNuwMB+AOw3MeN6BJjAx0bDYo8OoBR3RqadTptyT67j1/OiFAQqQ/q54DPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e62c135-8dec-4ff3-54e4-08df4cf8ee07
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2026 02:40:13.8674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: groC3kW+rnpHD8U23lY/2g4NbEZdmQyvqgDZ6/8OZu9LNDlVPP4+d0lHbGtZ/NldJHJ/+NKmkUvHubOm2o7zjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTExLTI3IGF0IDAzOjU5IC0wODAwLCBTcmluaXZhcyBQYW5kcnV2YWRhIHdy
b3RlOg0KPiBPbiBGcmksIDIwMjYtMTEtMjcgYXQgMDU6MDAgKzAwMDAsIFpoYW5nLCBSdWkgd3Jv
dGU6DQo+ID4gT24gV2VkLCAyMDI2LTExLTI1IGF0IDE3OjIyICswODAwLCBRaW55dW4gVGFuIHdy
b3RlOg0KPiA+ID4gV2hlbiBhIHBhY2thZ2UgaGFzIG11bHRpcGxlIFRQTUkgcGFydGl0aW9ucywg
UExSIGNhbiByZXBvcnQgdGhlDQo+ID4gPiBzYW1lDQo+ID4gPiBDUFVzIGluIG1vcmUgdGhhbiBv
bmUgcGFydGl0aW9uLiBGb3IgZXhhbXBsZSwgb24gYSBzaW5nbGUtcGFja2FnZQ0KPiA+ID4gc3lz
dGVtIHdpdGggNzIgbG9naWNhbCBDUFVzIGFuZCB0d28gVFBNSSBwYXJ0aXRpb25zLCBib3RoDQo+
ID4gPiBwYXJ0aXRpb25zDQo+ID4gPiBsaXN0IENQVXMgMC0zNSBpbiB0aGVpciBQTFIgc3RhdHVz
IGZpbGVzLiBDUFVzIDM2LTcxIGFyZSBtaXNzaW5nLg0KPiA+ID4gDQo+ID4gPiBFYWNoIHBhcnRp
dGlvbiBudW1iZXJzIGl0cyBQTFIgcmVzb3VyY2VzIGZyb20gemVyby4gVGhlIGRyaXZlcg0KPiA+
ID4gY29tcGFyZXMNCj4gPiA+IHRoYXQgaW5kZXggd2l0aCB0aGUgQ1BVJ3MgcG93ZXIgZG9tYWlu
IElEIGZyb20gTVNSX1BNX0xPR0lDQUxfSUQsDQo+ID4gPiB3aGljaA0KPiA+ID4gaXMgdW5pcXVl
IHdpdGhpbiB0aGUgcGFja2FnZS4gQXMgYSByZXN1bHQsIGJvdGggcGFydGl0aW9ucyBzZWxlY3QN
Cj4gPiA+IHRoZQ0KPiA+ID4gc2FtZSBDUFVzLiBBIG1haWxib3ggcmVhZCBvciBjbGVhciBvbiB0
aGUgc2Vjb25kIHBhcnRpdGlvbiB0aGVuDQo+ID4gPiB1c2VzDQo+ID4gPiBhDQo+ID4gPiBtb2R1
bGUgSUQgdGFrZW4gZnJvbSBhIENQVSBpbiB0aGUgZmlyc3QgcGFydGl0aW9uLg0KPiA+ID4gDQo+
ID4gPiBVc2UgdGhlIHBhcnRpdGlvbidzIGNkaWVfbWFzayB0byBtYXAgZWFjaCBQTFIgcmVzb3Vy
Y2UgdG8gaXRzDQo+ID4gPiBwYWNrYWdlDQo+ID4gPiBwb3dlciBkb21haW4uIEZvciBjb21wYXRp
YmlsaXR5IHdpdGggb2xkZXIgcGxhdGZvcm1zLCBrZWVwIHVzaW5nDQo+ID4gPiB0aGUNCj4gPiA+
IHJlc291cmNlIGluZGV4IGZvciBwYXJ0aXRpb24gMCB3aGVuIG5vIG1hc2sgaXMgYXZhaWxhYmxl
LiBTa2lwDQo+ID4gPiBwZXItDQo+ID4gPiBDUFUNCj4gPiA+IG1haWxib3ggYWNjZXNzZXMgaWYg
dGhlIHJlc291cmNlIGhhcyBubyB2YWxpZCBDUFUgbWFwcGluZy4NCj4gPiA+IA0KPiA+ID4gRml4
ZXM6IDllOTM5N2E0MWI3YiAoInBsYXRmb3JtL3g4Ni9pbnRlbC90cG1pL3BscjogQWRkIHN1cHBv
cnQNCj4gPiA+IGZvcg0KPiA+ID4gdGhlIHBsciBtYWlsYm94IikNCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFFpbnl1biBUYW4gPHFpbnl1bnRhbkBsaW51eC5hbGliYWJhLmNvbT4NCj4gPiANCj4gPiBJ
IGhhdmUgcmVwcm9kdWNlZCB0aGlzIGlzc3VlIGFuZCB2ZXJpZmllZCB0aGF0IHRoaXMgcGF0Y2gg
Y2FuIGZpeA0KPiA+IGl0Lg0KPiA+IA0KPiA+IFRlc3RlZC1ieTogWmhhbmcgUnVpIDxydWkuemhh
bmdAaW50ZWwuY29tPg0KPiA+IA0KPiA+IGJ1dCBvbmUgbWlub3IgY29tbWVudCBiZWxvdywNCj4g
PiA+IMKgDQo+ID4gPiArc3RhdGljIGludCBwbHJfcG93ZXJfZG9tYWluX2lkKGNvbnN0IHN0cnVj
dCBvb2Jtc21fcGxhdF9pbmZvDQo+ID4gPiAqcGxhdF9pbmZvLCBpbnQgaW5kZXgpDQo+ID4gPiAr
ew0KPiA+ID4gKwl1MTYgbWFzayA9IHBsYXRfaW5mby0+Y2RpZV9tYXNrOw0KPiA+IA0KPiA+IFRo
aXMgY2RpZV9tYXNrIGlzIGEgYml0bWFzaywgaXRzIE50aCBiaXQgbWVhbnMgaGFyZHdhcmUgY3B1
IGRpZSBOLA0KPiA+IHdoaWNoIElNTyBlcXVhbHMgdGhlIHB1bml0L3Bvd2VyIGRvbWFpbiBpZCBO
Lg0KPiA+IA0KPiA+ID4gKwlpbnQgaWQgPSBpbmRleDsNCj4gPiA+ICsNCj4gPiA+ICsJLyogUmVz
b3VyY2UgaW5kaWNlcyBhcmUgcmVsYXRpdmUgdG8gdGhlIHBhcnRpdGlvbidzDQo+ID4gPiBmaXJz
dA0KPiA+ID4gY29tcHV0ZSBkaWUuICovDQo+ID4gPiArCWlmIChtYXNrKQ0KPiA+ID4gKwkJaWQg
Kz0gX19mZnMobWFzayk7DQo+ID4gDQo+ID4gaGVyZSB3ZSB3YW50IHRvIGdldCB0aGUgcG93ZXIg
ZG9tYWluIGlkIGZvciBQTFIgZG9tYWluIDAvMSBiZWNhdXNlDQo+ID4gd2UNCj4gPiB1c2UgdGhh
dCBmb3IgY3B1IHRvIHBsci9wb3dlcl9kb21haW4gbWFwcGluZy4NCj4gPiBUaGUgYWJvdmUgY29k
ZSBnZW5lcmF0ZWQgY29ycmVjdCByZXN1bHRzIGZvciB0aGUgcGxhdGZvcm0gYmVpbmcNCj4gPiB0
ZXN0ZWQsDQo+ID4gYnV0IHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgY2RpZV9tYXNrIGNh
bm5vdCBiZSBzcGFyc2UuDQo+ID4gDQo+ID4gaG93IGFib3V0IHNvbWV0aGluZyBsaWtlDQo+ID4g
CWlkID0gZm5zKG1hc2ssIGluZGV4KTsNCj4gDQo+IFdpdGggcmVjZW50IHVwZGF0ZSBpbiBzcGVj
IGNkaWVfbWFzayBjYW4ndCBiZSBzcGFyc2UuDQo+IA0KVGhlbiB0aGUgcGF0Y2ggTEdUTS4gdGhh
bmtzLg0KDQotcnVpDQoNCj4gVGhhbmtzLA0KPiBTcmluaXZhcw0KPiANCj4gDQo+ID4gDQo+ID4g
dGhhbmtzLA0KPiA+IHJ1aQ0KPiA+IA0KPiA+IA0KPiA+ID4gKwllbHNlIGlmIChwbGF0X2luZm8t
PnBhcnRpdGlvbikNCj4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gKw0KPiA+ID4gKwlp
ZiAoaWQgPj0gTUFYX1BPV0VSX0RPTUFJTlMgfHwgKG1hc2sgJiYgIShtYXNrICYNCj4gPiA+IEJJ
VChpZCkpKSkNCj4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1
cm4gaWQ7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gwqANCg0K
