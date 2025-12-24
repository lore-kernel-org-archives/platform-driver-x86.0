Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB735958
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766544987; cv=fail; b=VibOSskfOyThXKv2l2h7nbsHcYiU7jmBZdRhn9AQeK+Qka1oTvUyc+AseLES+MCIEUwjL9hE8ftC4PwOuwk4tNwnbpqcLBibtSHvh8ZFFv3hmzv1y3h07shgTS+xa0H1e7OQwAau/dozDLEKutejk+sg1s4tEXllUGHevUwz7co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766544987; c=relaxed/simple;
	bh=tHtpqSU9Fi0zBWBXr7JRJgFQx6U1xUUpouUb6f+FkqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h2RRU/raKapxXBrV61uG4cXXUmmpLI8yr0oUWWuxe7yjYeU9FvIavC8mLz8wpPDpCV05pG26MH9TYVf6JGBSVGesSKQbUZajWlxC28jlr19puJ1wTElvZDYWPVwN25ELZqjpFmWia7HCJYmRCRwb6aoC3BnXr7S5bIsvklnL9iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPD2qnYV; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPD2qnYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766544987; x=1798080987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tHtpqSU9Fi0zBWBXr7JRJgFQx6U1xUUpouUb6f+FkqY=;
  b=PPD2qnYVBQeCyFuxsUu/3C5LB4yl3a0nDFcdTBthr+iG+o4+nrw+j/Nc
   rpnPH+65Xgsm2lE6CQM5yuN5osU/u6GLqW0RFctapj4OfhfGxLwTPMDyS
   IGRdMO6jxA1+1pZbO9ytQBH3OH3gN222PIAPmwENth/z56HiMP7LVOvXt
   N1iizkgs0ecqCNtL8+qV9FxWwcPwJrG+bP+St8NPF9fqYYJy7J9TRi4zl
   T3yN6sbHz8f+YQibM/OBdlzx0bTP1PTQs01hrlQdUSJ44YT7CdLasWyMK
   Wn1qMTSTd+9Ux1A+HDBamdOGMfDV0RcSVRNHGCOg73AZkn9KV/TLZaLLT
   Q==;
X-CSE-ConnectionGUID: IB2jptYXRIaeLxTFQky3EA==
X-CSE-MsgGUID: YXOU8+EMRdS3Dos/XQA80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68435629"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68435629"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:56:26 -0800
X-CSE-ConnectionGUID: 8PnDlfP5Qr6GeYFt9Ijt2g==
X-CSE-MsgGUID: b0EysECIQnGATFrTbGFsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204459964"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:56:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 18:56:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 18:56:25 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 18:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evOYUqEFPTpGo5CO0JGk2MpuOT5md+hxko/2N0z2BhpvYDWAVopdbBHEasbZS4DzfhsmceYxuVryuCRVs4GZfrvgj1ISZU0j8LHo6HcxemLkKCkHzHOmGlZHXDqeUDm8T1hH+LGPmRHu1bcTRMFyjCGOAiC82zXjimK3vL6kaoAm4pcbnwHCa5EY3GAGLnl0IIfRVXIERxz45SCJLkHTO+eoH56AwpkEmRnH0Xi7nkBcgrHvt4OgryYJtqusOpcMe5PU6oV0YLsu/sQKu2kqLGC8tdJi7iQH7AnvwgCDczBKQ0uQ7Vs1RvQMqAltRrrKHG5Jh3LYOu3n4lNF/n5ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHtpqSU9Fi0zBWBXr7JRJgFQx6U1xUUpouUb6f+FkqY=;
 b=ydLwBLBho64a4xNWHexKEJ39lMQe/8TfrR0ZeP56tT3PSYlma3O6IabRzFqkSjJHlSIVGjh/xiMx90fqXU4ljCsIyZH1uEqDqI/BrphokGJCpiPRkJj+mTYP6ielS/YHAM/LVorR/T+08xs7tp/0LxomxovCBOfWoXXy+8cG5VekiEMsaSVbkrOyslo2R5bChQ/9ZlFvu//99D7fMUwnk0HxN1S/ccbTwdeQI7DbDoxeT0WS6C24+G3r41U+Fe0z9ULWTYjl+ETIINt+b9scwWvkcRxI1HWuXwKYfDCPS+cU7M9fbmM1HIhI3Ksk2BxFPm5dSNVrmSyWQe+IrOWo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:56:18 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:56:18 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/intel/pmt: Fix kobject memory leak on init
 failure
Thread-Topic: [PATCH] platform/x86/intel/pmt: Fix kobject memory leak on init
 failure
Thread-Index: AQHcdAPcGewpXwL6OkGl+7M8e4Y2H7UwGW5A
Date: Wed, 24 Dec 2025 02:56:17 +0000
Message-ID: <LV3PR11MB8768682A6AA8A29F08A8C004F5B2A@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20251223084041.3832933-1-kaushlendra.kumar@intel.com>
 <802187c0-2172-e63e-c855-1d5750b4c2a9@linux.intel.com>
In-Reply-To: <802187c0-2172-e63e-c855-1d5750b4c2a9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|IA0PR11MB7283:EE_
x-ms-office365-filtering-correlation-id: 4bff583c-bac3-4b8b-cc94-08de429802a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9mLym2w9TdDy13hvq2VdN17Di9nbv4WoT00tgJKPTU39EaZV/AJKCR7xqU?=
 =?iso-8859-1?Q?NHkF9kfPuZA74JQE0lHMEEKctVCqe24d5UH6+X7vXpqOTu6Ryiz56LsK76?=
 =?iso-8859-1?Q?WqKhW6kJ3pKLOC4iVjNXxvuuOUBE7Rfj+abBF+FznzldZXQ5lTn9l/dTqm?=
 =?iso-8859-1?Q?2nABStxjk06QC8WBrwS65z06x0op7Kdp5ulb0apXJf0FzDLkARZAyAEJSv?=
 =?iso-8859-1?Q?Dypc4Yq90icaTECxamXKJIai1JOz28rWezRapw/Y25+dKBhIrrjmPNJ8cm?=
 =?iso-8859-1?Q?6b7cjSlRWs55O8M3Mok+4rhIjpOHgATHp/vjvz650yhycAXLQJgk921Ks8?=
 =?iso-8859-1?Q?bOzuIlvwvvHuZ5I3hsixqlCtMlrg/OAd/IVxiCEX/+Z/5aME8sBMKcAW0O?=
 =?iso-8859-1?Q?A8oLEts1ceg/2c5kaFZFMID77CluTWECXpi3xkRA2RuitNb/MRPl4vGTNb?=
 =?iso-8859-1?Q?vT5moaS0oLxxdlmvEwhBuTSEVrTFg1ryLxlIPnRaY1y1NCc50RleiBgqv1?=
 =?iso-8859-1?Q?09zU+aywEkA53HZrzuhvKoNLptSaCzcRtnH0g8vLI4KrvMYuTwJIzNk0P8?=
 =?iso-8859-1?Q?1Ger5uWbskEPCJbPokQ/EZeFMlSzzqE4mzA9cjOcT9HATJ221NcfJ5St8p?=
 =?iso-8859-1?Q?42S5m+mQQPMPJVMTH1pFYr2RL4bXiX4SfAUg2lawWsWz+A4uH7ZaZAhqeQ?=
 =?iso-8859-1?Q?mBewwAfD9ltV29fptevlBAB7qq/67/H3jb5S+414uZGkuawQ/n/R9qBX2O?=
 =?iso-8859-1?Q?y+k5zp9vMvX/1Jwulpn2Ck8WRPjHwCQMaEbM58zhOI40/eP7dcTRuZx1D+?=
 =?iso-8859-1?Q?JnxE/tfO67trpcIsycLiVRR3Q8WuqAFujixuHsPnKOxNHZJDEWErebqxWV?=
 =?iso-8859-1?Q?JabxyvQcMgbApCqd7/oG9f7KD11ETe/WYdSNbJCKrSAIxr4MEasc8XbwD2?=
 =?iso-8859-1?Q?iZk0/mitY0LfZluuW1zijJGtXkBPR6i3u8Ksa9CTGzdjahtWYdQz7pe94E?=
 =?iso-8859-1?Q?kdYLgzOQAvKCRJoaOGQ2o4XxugB+/VU+oPhsQ4peFYZvVRFFK4x1vJAhHC?=
 =?iso-8859-1?Q?Zneo9tczyEvqrjnyocqW9vb17IKnSXLu6XYDypR5S/i6hHveoMxOnVQIXm?=
 =?iso-8859-1?Q?4l4BnJovDYM7WVVboQdRE0qjPAqHP9COruPMoX+yz9C8mlspZb5aPt3qOP?=
 =?iso-8859-1?Q?rNxrfX+bWp2cTf3bea3bXl/YYmIJNV0mnf3d98NPmhIbYCpCu9aIdDPQwk?=
 =?iso-8859-1?Q?C89loScDja+wk/8qMnhtmGG+wUB8RfUIvDj2ddLhJJc3pMr6ozZTs5sqkZ?=
 =?iso-8859-1?Q?flLZtAkYUKByY00vAGMhqjAv3PzZCsnp4CqadOExaQdLP2fGvdvYPRVPpz?=
 =?iso-8859-1?Q?urox34qyphmYNRGBn2Tek5XHbgTqHai9i08yG2ptVvZWdhK1rIokxos5/c?=
 =?iso-8859-1?Q?YmidpsCmkrcC290D6Zt+EHcRW8QkBDStym4xulus2yLOY8tyDivavZob7q?=
 =?iso-8859-1?Q?GePPhz+dAiSUmnzBQgCDe5EBCyIyjdmYETce82N1jARoNQRwhaMpl+XdjP?=
 =?iso-8859-1?Q?JcRE8V/AyiBfuqDadhVp49jKt3FD?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8768.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Pp+viaxBQUYfsRwvj4fdy5x+BUmhpv7eos3HgltLDeJaX6YsPwIEuNoWow?=
 =?iso-8859-1?Q?lqUq8q5x1+VI4grNFXcpwBDhnCuzgEtxmMUoZicHEoroSB8jITdF04Cy/n?=
 =?iso-8859-1?Q?MziVj4z/l0vYJMVLCiJ891dObCofx9NRshZ4klum/MIQUpEldaio8jNfm6?=
 =?iso-8859-1?Q?8NEQQ2TO8BHJfs3y8ryV0VXLyInZiobTN1nYMoPwmi4V3NoUlHCHELPJEl?=
 =?iso-8859-1?Q?eHA67nRkUJxcwDPRMcNpEw/qq0kCt+lcp+73FFlhxImNVY5rRspqB7zjZT?=
 =?iso-8859-1?Q?LrR4Mb3UG64e3SH3xN2z/AIH5vmUivOoM1+o0+vlKE3PyLaslaO35Goqke?=
 =?iso-8859-1?Q?xMaYVX3Nylcu9Hp/8lK/w6bd3Rx3XE1r+G8bRMtZUjxBQ6pm6qymy7W8yR?=
 =?iso-8859-1?Q?Pt8FhqJ75oP8j6d2eKOP3bnUtF6EzLFQ0F7RcYcsqJaDd/cWZCG8VcUgxO?=
 =?iso-8859-1?Q?rC6MAbMZzSNwp0QE0dLjgleaKho/sEDs5j3fa0pfeIgVBfs1MfqMNZ2Uep?=
 =?iso-8859-1?Q?FM2FRMzA0mshFC4+xFgsbRfjUwWMup6Dm4cBlvw4y3Jq0pCSufZWM5h6IO?=
 =?iso-8859-1?Q?ZwLBCPsarDPCHqbc4Y43LS0se8cqaSrenRE6W7uO9rxZYh6a+5I/5QhDXX?=
 =?iso-8859-1?Q?fdsVDi7+Of3nxB2zvukfC13HqkdAocS29m19Dzmi7vgKBiDsEhu5fMZGoy?=
 =?iso-8859-1?Q?2yDkNupGWsbWkGs0Ta7C7f58MukfbSMV9MKwH5hOa5LZZNXMo3nXUP1w9T?=
 =?iso-8859-1?Q?zviPEKCtQFOG7DD3opdriSsINkUQi70HKs+UCNN55NWQIPj/6Tb+I1cmiA?=
 =?iso-8859-1?Q?EJMkz6fRcv5SEc0gGvmY7+84M/Un9Mh3ssxKPQm68dRSutPy85cDR03M8Z?=
 =?iso-8859-1?Q?4ee5dgWJsNQFbRmIJJlxgMnL98HdBPrXVN1pZRd3asM1lTchJQgQINCwxf?=
 =?iso-8859-1?Q?Q891KWH/4o+FrnW7twZLjCbWdvfvy0uKY23vw1AsF+QrFoQwZ9FsdJPQG+?=
 =?iso-8859-1?Q?U7LJN5ADXmjHuKz3Z35kGRMEcjoZX/h+gZKpMcNFM7PkE5aF/mnB5C8YZ9?=
 =?iso-8859-1?Q?pcLTsgTQs7NN2dyHuupnNe8FJ/BW5T31t1jO72j8mQOyoOCFJl7maep+A9?=
 =?iso-8859-1?Q?HEKhfnBALLL48uPnMx4m/N9PJPDwqVti9nJAwaaLkC4ryxpqWa9ga3WKFA?=
 =?iso-8859-1?Q?tDj6y7yGvLINtc12Y+8RtY+p0SiPJ01//KxZaD0DHMXhABhdkZohL4G0BK?=
 =?iso-8859-1?Q?lJ8pm3WmlctUES3uUoQpOaL85ohxPt9p7vJ0AlpkKel8D7sFpZ5Fh66KFw?=
 =?iso-8859-1?Q?kOzWmpPCzubu9496XltBjQHq3w3Y80u7w81Y7v71AMuOyNfnfbg4MZ2rQW?=
 =?iso-8859-1?Q?yZljr6dwurassG0LxicpEHI5znSH6RjQ0LrD4fzPB9S0N9Qo4Z6q3Yp4AN?=
 =?iso-8859-1?Q?P7d/MIgiSGrFkBb2+hVrA3Y/vxoXWRxtASmKA2xkUEZ12m3spV5wqlsDDW?=
 =?iso-8859-1?Q?+8dxqj+jhLUvsCB0msrTVMVPkyQTcm2XJSoL1cPa4JNbKf9iwhvT254qj8?=
 =?iso-8859-1?Q?FDF0Zd3eULTwlvN1g4c2ylL+cHqx/UtjvZ5gYwWdaEQlil6C92h79X5FPT?=
 =?iso-8859-1?Q?9i9D0b6803Ca5WU3OZwZYUmO1ulnSsjyGI5BHo6Y2dMkc7fSpdT0+Ac+pl?=
 =?iso-8859-1?Q?aU/oLzHo4vTQUKdYoNby3mzzUgkSrDWR7l3z7LcSR2NQrSLU1qTc7tP87d?=
 =?iso-8859-1?Q?xdXHbcEWG3mOy8Pak4RHvJgNvCkLIhG375Yqvmlh2TTM9RidbLXwLE7QXg?=
 =?iso-8859-1?Q?VziV1wL9ig=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bff583c-bac3-4b8b-cc94-08de429802a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:56:17.9402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzodYUHnnIzedsWJK43nntmjHJ7MIXLr5Uf6wV3+H23I7/GjOze2oUf4qn0VT7noBno/USwvs/RmB+zs6578qpZLY/hl8Hh3oeIU/6nh5og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com

On Tue, 23 Dec 2025, Ilpo J=E4rvinen wrote:

> Hi,
>=20
> Thanks, I've applied this to the review-ilpo-fixes branch but I had to ad=
d=20
> Fixes tag myself as your submission did not contain one. In the future,=20
> when fixing an issue, please add a Fixes tag pointing to the commit that=
=20
> introduced the problem.

Hi Ilpo,

Thank you for applying the patch and adding the Fixes tag. I'll ensure to=20
include it in future submissions.

Thanks,
Kaushlendra
