Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125311;
	b=Fd61w2I4sOKw1ftY9tGg9T6Huew5ExTD3B26BC6xMxEN6VKCCa2PqFGVV2Yc4+oITKpz
	 yntOLXo9rh8N91PgNRLuSCY6qR7C96cPPGZJnl091PjS31WSauQel09peUQSajS6NYdjz
	 ZLb41LzoBPgBPhHPiQykm1aSQ3tL2D0HMSSLpaiRabOeHP9haE4rnx8FkumUhOX4pRV3+
	 +rBu4vAobtGxwd+3G+hHLrTbNE280zRLnNGfAvZgbxl9gy3a5zhgmyGjWCwXL6bqEO3aP
	 HNa4h2/PNgp+Rcqge89Z78OxSCzdFHcjArsOBeCY8B/0gLz1TlOcYElQhiJO1U5H9gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125311;
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
	bh=/yynBoLbzUTHcDXVul+M+cxmWgk7UfcDNJFkNic547Q=;
	b=iKyixvhENqUOY1KCETq7t0HQOV4hIH5q/6Pg5uwNwXQ/khDxNzWlE0DH7DxdlfGxVZSb
	 BFuMP2o8gBD2wCrlB0mSsD9BVvvxWJgKin+2FeXWXjNjkNaSYwhIsg+u+LGIFd4xP153U
	 OzR/E1xbZokOaxTT2NHh/R9Tr/xn5UrAefxaA4ye00sGZcfCZpKPtONQ9iL53Nsj1/j2n
	 edKl6sG6ItJwbBWfegBIvBzC6LmcPjzo3/ZNJTlwrWhKxdqZ8qUxZiRSuReIqchb4DEyf
	 FIPpwdgc9PDkwKBxTw7IKznZWm3cLyPkb8YCjAGlKSS2dpSb/Tq3y2waZGWADhIXdSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bm1mjkv6;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aFJ072vE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1947606A324
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 21:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1947606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bm1mjkv6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aFJ072vE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795125310; x=1826661310;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/yynBoLbzUTHcDXVul+M+cxmWgk7UfcDNJFkNic547Q=;
  b=bm1mjkv6de4sywNLYAyjOSA5omil3lMOOfG8SCtKluKz7SOlefwdWAsl
   PTv8IktRja1xdYkmwcp5a5K78a1APndzYSZGVlNLz3p9zf9pbzxFvZNt6
   byUwc9l8Azga3crFr4CNPW4SYT0djNwR7bgh62pSPl1hgze18p4Bxxyfu
   cRazdb9/y/t4vwx9pxqd1zJKC+Gw4I+NE5XvtzDQXlpdb4DNi8rHUFmI9
   9j3xPr3coDeQb9RJGZCtdJlqB/Xr6lMxFCNFDxSfax8B98sjHUSK3rre6
   EuFfezITdORSzEezlawgk+4hHc7of35E91H53gai7eg3gailnzEBZUjcS
   Q==;
X-CSE-ConnectionGUID: y9vcg7VITDKkSrB5tdB0cg==
X-CSE-MsgGUID: WMBJ+R09Q9KB1y4OFRQfVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4035952"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4035952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:55:10 -0800
X-CSE-ConnectionGUID: ECYcf4hIQRWw9cu4FZOJZg==
X-CSE-MsgGUID: LEr6acGUQWG3YTPn9KaIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10366564"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:55:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:55:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 13:55:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:55:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFC2rmtNzzCTOhDaGKloTvcVv+bIcjaUUhnMKXyh9aLeFaKBvE3c6AYqNHRspO6xAsMVLCOnloCNftQrRUN0+hvmZIAoP7rSj+eyoUDHyuLtmrFHJXjgQuRqRzPAnLZSLW7PMzigkYbfkbeT+zIw6CKtFa2Bv+wSVnEEbkdvKl98OP4yaFfiAHYlGZkd4fBFIuN1s1DeBG9SRVnspGVlf3CNmD7EEGK1qKvcnfXWxcCtIpXUOnZNUDW3Rkdfkt34Wbo7Gr+QjaetNqNS+/VOfOc0WstT/7VHIqdH7uHlz6wb66eHHjU8a/j/ERSyvCDDZV6oP+LvAXYYpH/pSXF6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yynBoLbzUTHcDXVul+M+cxmWgk7UfcDNJFkNic547Q=;
 b=e/VBGZMi0VoEBgz6NlXIQK/gnlb3SevvD5hOqN7A37vYCQc3LBv+tBNGM0udYoyZ2r5MWSVZnO4aBcB3ei5tkUgCxyjhKCRtxMpfmsLGt/oRDbJHZr8VR+eEStWqxp4ua2calhc00wqzkEZeTOeiyzmUJnkZNfwy2EuV3EmY6yVbfyCMjZAM5fGhIHNf8iyrkLQGAc/jI+nKC1J4PfIjn4GCdKSnlx0aY2L82L0MALAR/N/DjdyDSpDUFmrrqjwBiLp09IVRh0eAbtQFfGqW0n4mKHOard1DvoZfBVuhkXOV4nvi7ruuaIQDeWj/leTzbJnda6IKakooOWxjmcdoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yynBoLbzUTHcDXVul+M+cxmWgk7UfcDNJFkNic547Q=;
 b=aFJ072vEzjtK7Rp1XDuVRisGmWOo9UVtsRffFfXI37oxczQECZfQeTyEVAeWfawhj2CXLzKruy3ltYF0hKT2nxnpHNbBDoFMtXQxRpJunnq8BNx1Ut3recjnXd0T1eGocyo7MIErvImCI35yBOdbC/eM/jE6QGCwZCx8EatM5vY=
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB9728.namprd11.prod.outlook.com (2603:10b6:510:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:55:05 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:55:05 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "david.e.box@linux.intel.com"
	<david.e.box@linux.intel.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
	<matthew.brost@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
	"Vijay, Anoop C" <anoop.c.vijay@intel.com>, "Ausmus, James"
	<james.ausmus@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Topic: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Thread-Index: AQHdeD5bBcIfyMcdVEuHFYZzYf/OCbc14tCAgAAKLwCAAAPHgA==
Date: Thu, 19 Nov 2026 21:55:05 +0000
Message-ID: <9e9a9edc41b3a81839505443ffa312c0edd7fea5.camel@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
	 <20261119155438.40762-35-michael.j.ruhl@intel.com>
	 <av9kgfXlujk2SeT-@intel.com>
	 <CH3PR11MB04614920DB3241FA3B0089DE72C1792@CH3PR11MB046149.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB04614920DB3241FA3B0089DE72C1792@CH3PR11MB046149.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|PH0PR11MB9728:EE_
x-ms-office365-filtering-correlation-id: 4fa976cf-2bb1-420f-b4e0-08df4687c559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|261022075727099003|261026121527099003|4143699003|56012099006|261026140227099003|11063799006|261026130827099003|261022105027099003|261022115727099003|261021130227099003|261009223027099003|261021135927099003|261021133027099003|261021121427099003|261021123027099003|261022113327099003|261026135527099003|261102123227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ASftYGfXmfP4CNVMwbNB/KHAqZHSpzquwTQUbXrI6EzfWhOIIFuG6M2c4tPMvukM01dQT+f8LMX9/Smq56k42UQcGvYdetXHtkqoZxQS5l4yLoVhO8QEjOfI/Dgdi4Khbcd29cPHdsTh/iOw38vu7pOwonD29QRwuORguU7WA7f86nkGXqP7W6pg5HD9Zi3DuuGo7r5EhOu2x/bMDzgUsHCE68HvY+r3rWJ5w1riq99/y9NdE4kKS3mQmtocuofJ5JgrE129nFWSHW+EAu/UJpoTZ+lPYnn/JKcZboC40DKxtfvcAHeKTtKXbhkohdufH3k3siUv9oqxd1Q6ZvEW3FoRizQ9GDgRth8W96qfv7ZlBobfYY4xPMrY3eKvJIPQgKSrTeninsF1GoGx9h73ljvB0305AB8XlmuQHYm/9SmQ9+R7rOPc8KNYdg56N2Plw5FJPMTSH5p02mFcl3BLbZLzkpg2uXZjMwOWRLAyGDOX28rcGeGn84P82E087cKFPXmQuNmiMe5MkwjWhYeESgP4B61Ut3dpA2lJhTpra8/KsjN0QWzRvhdHFlNUiIPNR81yrhUpdpM7a/WLiNSZ2+vutEN1faHQFSZerLeEHgOmSTLbfPdZLZ5+WvANWzi4MyjnsmGCYyh/5oPconaI5mJJ2b4l6UenK02f7Fv7fmL7t5XqeckEZPV8qk2ibVc61lxvJTla1Q9yBzHk9iuC+z/OW/mxd/7CE0uepYGPLM0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(261022075727099003)(261026121527099003)(4143699003)(56012099006)(261026140227099003)(11063799006)(261026130827099003)(261022105027099003)(261022115727099003)(261021130227099003)(261009223027099003)(261021135927099003)(261021133027099003)(261021121427099003)(261021123027099003)(261022113327099003)(261026135527099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFh6bFZNeEJoZHlRZk1NbTNOTFlSZ0dVb3R1aXBtdk1ZQ2N5R0p3bDFWZm9D?=
 =?utf-8?B?TS96VEZJVmw0NkZOZ2d2SHNoYTN0WXVhZXpSa3RPM244MzFFVFo3cnJhc0Zp?=
 =?utf-8?B?U1JiWUtPSnpLU0tabDVRSXI0MTY5bERCc0NmbWtLZFM2UDRSR0VlTlNiUW1y?=
 =?utf-8?B?Z1ZxZWxwRmdOY3J5aTJ3V2dhM3dxTFZsbm5QZ0VTbzZIWVBpL3pkUDVmdkRu?=
 =?utf-8?B?QXcwWitSWDgrQm13bjlWR2tiNUFscTFYSER0MHRHNTJxZ3VrWGFESUxjR01u?=
 =?utf-8?B?TVRoNnhiMS9vR3RoZDlGbFRFOTV3T3BYczFLVnNZODVjL2JoeGZxV2l0TXQ4?=
 =?utf-8?B?RFVUakpvUlJ2aDV5NitJeWZXeEhORXl2MFVzaVNRMVRLYTFFODZiTDYrK0Nn?=
 =?utf-8?B?V0hiUkJYN2dKd0MrS3VnNThaQmx3bUllUUNwa0pSdXo1WWtVNWEyL1U0azUw?=
 =?utf-8?B?OXkvLzhtMzdIaUxWZFYxMHBTK1hSUktUUjJkUVArRjl2b0hRY29DSTVHNDdO?=
 =?utf-8?B?TUR4ck5PbktYMXRBRE9RWUVWY2lUSURwdUhlaUdWNWorZWdSQ2VFTlNMTFFT?=
 =?utf-8?B?NjVWQ3pzSm1yQ0FOM29QbHFFdlBsNHB0aTJKN00yc2wzU0hvcXZlaUQ0YnBD?=
 =?utf-8?B?MHgvSXVRdEVJeXE1bmpxbkttRnllWlpUR0lpaVhRcU14V1I5Q0x0bFFkcXdG?=
 =?utf-8?B?YnUyUUdoc2FLU3I4Tkc0akVVOUF5ZjFKanUvc1RNNWFLTHgxaEVoTUszYUlp?=
 =?utf-8?B?SVQ5K2ltckFyaWR5VThJV2JCb2gwSjd3WjZkZkU1Z211U0E2MklwN2xhWGpW?=
 =?utf-8?B?OWs5Y2FzOUpHNmhsR3FWb3plRTkvVWtMaVMxRFVCSWYxOFhwdFpRUU9LS3Jv?=
 =?utf-8?B?aG1Mb1VrSzA3dllhQktYUVp2bTBJcDhpTzRnTGlqR2RMckY3UlZaNlYvOVdG?=
 =?utf-8?B?c0wwZFlYMUV5ZnZLYWFkUGlLMTlJNWpRVEVYQndnTVRuT0N1YnVreDd1aThz?=
 =?utf-8?B?UTRiVy8yK3EyeWxBaHdtUlAzaGp4QXJLZ2d1cUU5bWgvSzJlbEVjbE1zMU5j?=
 =?utf-8?B?cjhHSVlISWJyb1ExaVRQZ3Qrck1vbjRSc3kwMC9meEhSeVhPRVdkanhTQytS?=
 =?utf-8?B?clBnMTNnUExjOWNqUVhZckh4UitydlFOcDE0aURGaVBzekRnNEpnVS9qaVlk?=
 =?utf-8?B?UWkrM29uNFNVSkYrSmtlSEdoVW01c1BBYVZ0Uk1Ma3U3YjJxNlhmamZiWm40?=
 =?utf-8?B?UkptbjFqdFZ3MFJMbGFWZkR2N0VtN0dTZGt5SE5XbEQ1WTVQWkY4a3EzTWlH?=
 =?utf-8?B?cjZiU2dxOTJzY2VJTVVFVll4VWIzeGRVOE9wUVErMTJlYm05TnNTTDZhSlNw?=
 =?utf-8?B?aytZQXVKa21uSFBwSURKSWJQcUVyQThDK3Q2cXdWVS9GS1lWUUdDSUdtUi9O?=
 =?utf-8?B?aytZK3hocUlhdkorR0dmTnJCRjVJY2FuNXN1ZTkzd3BzUzZiM2FNUTYvc1gy?=
 =?utf-8?B?WEdHdE4xOE4xMlJkaGZCMTBiMGZMUVl5M0VDV01xVmJNUzVhOXQzVHRSRnF5?=
 =?utf-8?B?cGJpSXRQbi9rT3pFWEVIT3cvWlc0UnNYejFNdmRmUkdCWnBBMGN4dUZ6dUIr?=
 =?utf-8?B?QitObHh0YkdIbjBrZFlYMmtmUFNHWjFxalFuRXZGQ2NnTGpaT3BIRGNVU29H?=
 =?utf-8?B?RXV0bVNwdGFBMjFLcExOWW0xTjE4czBPcm1RZnA2SGNPeW9WN0J2aENYb09Z?=
 =?utf-8?B?clJzUFJvOU5xSjlseFV2RThuN05LREZHSzJNM2Y0NVpEYjZrNkp3M0Nua2VZ?=
 =?utf-8?B?dXZXakF6YkJScmVvT0p4MlF1bUh0dE8veEhGNFBHZ1VMdUs5dmpuRW1saFF6?=
 =?utf-8?B?ZUlwdkVabS9DSTN4MkJqdDNBM1lDN2FmUmNOWVJxM0treFpGbTVtL2pSaFNK?=
 =?utf-8?B?QWlUVG1yL29leU43dWRRTE1ZWnRlRk9hSzhQNjBrc3Y4blVycElzSis2aU9W?=
 =?utf-8?B?ZzZmUkZFK2JuTUcxRnF0T3g0Z1JmMGZxV3QvODlUZmJGSzZtZ20xTjFNc1BJ?=
 =?utf-8?B?a3NZY21wU1VOWUx6UUVqYy9lODJuMlk0S0lZcW5tdW10SHh3b2FIdFIycEpm?=
 =?utf-8?B?RFViRG5XOFZld3ZXcXdsV2wxaE9LZXBJNWNCa3hsdlhwUERkeHdIL3ZHRlQz?=
 =?utf-8?B?b3g2WkhpKzkxYU1hcnlGU0pIS3pkTndZZ3g2ODlpaWIrQkZQcGxhTVJUWWlR?=
 =?utf-8?B?TkJQSGFMdVo2aHFxdTVqSjc5Q3M2YlozUFFMVkNUUVFWNlhHSlR5dVN6QUFL?=
 =?utf-8?B?dmtDTWZsc0FxQUVSc3hNeWZQa3J1Qjdtb2VJMWMvYkJFa09lWm9Wdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A0ACEA000A7124E9A2DE8D564199228@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: gSSH2/RFZbvbFhQ6ezVgSumvL569cPwsHvgJI9IRrh3ADJDJjpBbW4eyi8tI1XrP0rTFgKMIy+/wgOq/M9mMrT7s2+F5MDuEImy5CRXm/qzxHNBW2WuilEl37+mb1+qrxqvp9AKQPzXQ5vMn4ff3JVpW9MHXFHaq+knyLsNvU+4ikZG/J5kgmiX95qjrIJ1GuVgytmYh7hgwBMgJA2MWNd4We/UY8iWyYhrgF3IeAKNbhyQsJ/+k7yaonpUJnoBDPmEWr7V+cNZywVSu1+9PO/4bFZt6gXs3YtR82aYtExyrDHDljmIVA0XQ6FTl9fqCF4fcwBLIj4Fzg7huQGYC5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa976cf-2bb1-420f-b4e0-08df4687c559
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:55:05.5210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJovF2UkS8zHpnOOpKRE9JASVcIdSnjd9VcYf4Y86vgnyFgzzB0TDPBDan6gcO7GzYTnaggcJX2nBhUfvVkqvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9728
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTE5IGF0IDIxOjQxICswMDAwLCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBWaXZpLCBSb2RyaWdv
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAx
OSwgMjAyNiA0OjA1IFBNDQo+ID4gVG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxA
aW50ZWwuY29tPg0KPiA+IENjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsN
Cj4gPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gaGFuc2dAa2VybmVsLm9y
ZzsgaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3DQo+ID4gPG1h
dHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb207
DQo+ID4gYWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBmZndsbC5jaDsgZGF2aWQuZS5ib3hAbGlu
dXguaW50ZWwuY29tOw0KPiA+IFZpamF5LA0KPiA+IEFub29wIEMgPGFub29wLmMudmlqYXlAaW50
ZWwuY29tPjsgTmlsYXdhciwgQmFkYWwNCj4gPiA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+OyBS
b3BlciwgTWF0dGhldyBEDQo+ID4gPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Ow0KPiA+IEF1
c211cywgSmFtZXMgPGphbWVzLmF1c211c0BpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MTkgMTQvMTldIGRybS94ZS92c2VjOiBDcmVzY2VudCBJc2xhbmQgUE1UDQo+ID4gY2Fs
bGJhY2tzDQo+ID4gDQo+ID4gT24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMDc6NTQ6NTJBTSAtMDgw
MCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPiA+ID4gQ1JJIFBNVCBzdXBwb3J0IHJlcXVpcmVz
IGNhbGxiYWNrcyB0byBhY2Nlc3MgdGhlIGRpc2NvdmVyeSBkYXRhDQo+ID4gPiBhbmQNCj4gPiA+
IGNvbnRyb2wgYXJlYXMuIEFjY2VzcyBpcyBhIGNvbW1vbiBNTUlPIGFyZWEgdGhhdCByZXF1aXJl
cyBhbg0KPiA+ID4gaW5kZXggdG8NCj4gPiA+IGJlIHNldCBiZWZvcmUgYWNjZXNzIGlzIGFsbG93
ZWQuDQo+ID4gPiANCj4gPiA+IEludHJvZHVjZSB0aGUgbmVjZXNzYXJ5IGNhbGxiYWNrcyB0byBn
ZXQgdGhlIGRpc2NvdmVyeSwgc3RhdHVzDQo+ID4gPiBhbmQNCj4gPiA+IGNvbnRyb2wgaW5mb3Jt
YXRpb24gZm9yIENSSSBQTVQgdXNhZ2UuDQo+ID4gPiANCj4gPiA+IEFkZCB0aGUgZ2x1ZSBsb2dp
YyB0byByZWdpc3RlciB0aGUgQ1JJIFBNVCBmdW5jdGlvbmFsaXR5Lg0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jIHwgMTc4DQo+
ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDE3NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jDQo+ID4gPiBpbmRleCBhODE0ZDcxNTFlZWEuLjU4ZWI4NWZi
NmE5ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmMNCj4gPiA+IEBAIC00LDYgKzQs
NyBAQA0KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvYml0cy5oPg0KPiA+ID4gwqAjaW5jbHVkZSA8
bGludXgvY2xlYW51cC5oPg0KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4NCj4gPiA+
ICsjaW5jbHVkZSA8bGludXgvbG9nMi5oPg0KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvaW50ZWxf
dnNlYy5oPg0KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiDCoCNpbmNs
dWRlIDxsaW51eC9tdXRleC5oPg0KPiA+ID4gQEAgLTM0NCwxMCArMzQ1LDE1IEBAIGludCB4ZV9w
bXRfdGVsZW1fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gPiB1MzINCj4gPiBndWlkLCB1
NjQgKmRhdGEsIGxvZmZfdCB1c2VyX29mZnNlDQo+ID4gPiDCoAl9DQo+ID4gPiANCj4gPiA+IMKg
CXNjb3BlZF9ndWFyZChtdXRleCwgJnhlLT5wbXQubG9jaykgew0KPiA+ID4gKwkJdTMyIGRldmlj
ZV9pZCA9IEZJRUxEX0dFVChHVUlEX0RFVklDRV9JRCwgZ3VpZCk7DQo+ID4gPiArDQo+ID4gPiDC
oAkJLyogc2V0IFNvQyByZS1tYXBwZXIgaW5kZXggcmVnaXN0ZXIgYmFzZWQgb24NCj4gPiA+IEdV
SUQgbWVtb3J5DQo+ID4gcmVnaW9uICovDQo+ID4gPiDCoAkJeGUtPnNvY19yZW1hcHBlci5zZXRf
dGVsZW1fcmVnaW9uKHhlLA0KPiA+ID4gbWVtX3JlZ2lvbik7DQo+ID4gPiANCj4gPiA+IMKgCQlt
ZW1jcHlfZnJvbWlvKGRhdGEsIHRlbGVtX2FkZHIsIGNvdW50KTsNCj4gPiA+ICsNCj4gPiA+ICsJ
CWlmIChkZXZpY2VfaWQgPT0gQ1JJX0RFVklDRV9JRCkNCj4gPiA+ICsJCQl4ZS0+c29jX3JlbWFw
cGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+ID4gQ1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0K
PiA+ID4gwqAJfQ0KPiA+ID4gDQo+ID4gPiDCoAl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+ID4g
PiBAQCAtMzU4LDIwICszNjQsMTc4IEBAIGludCB4ZV9wbXRfdGVsZW1fcmVhZChzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+ID4gPiB1MzINCj4gPiBndWlkLCB1NjQgKmRhdGEsIGxvZmZfdCB1c2VyX29m
ZnNlDQo+ID4gPiDCoAlyZXR1cm4gcmV0ID09IDAgPyBjb3VudCA6IHJldDsNCj4gPiA+IMKgfQ0K
PiA+ID4gDQo+ID4gPiAtc3RhdGljIHN0cnVjdCBwbXRfY2FsbGJhY2tzIHhlX3BtdF9jYiA9IHsN
Cj4gPiA+ICsvKioNCj4gPiA+ICsgKiB4ZV9wbXRfZGlzY292ZXJ5X3JlYWQgLSBHaXZlbiBhIGRl
dmljZSBhbmQgYW4gaW5kZXgsIHJlYWQNCj4gPiA+IGRpc2NvdmVyeSBkYXRhDQo+ID4gaW50byBh
IGJ1ZmZlcg0KPiA+ID4gKyAqIEBkZXY6IHZhbGlkIFhlIGRldmljZQ0KPiA+ID4gKyAqIEBjYXBf
aWQ6IFBNVCB0eXBlDQo+ID4gPiArICogQGVsZW1lbnQ6IGVsZW1lbnQgdG8gYWNjZXNzDQo+ID4g
PiArICogQGRpc2NfZGF0YTogYnVmZmVyIGZvciBkaXNjb3ZlcnkgZGF0YQ0KPiA+ID4gKyAqIEBj
b3VudDogYnl0ZXMgdG8gcmVhZA0KPiA+IA0KPiA+IGNvdW50IGRvZXNuJ3QgZXhpc3QgYmVsb3cu
Li4NCj4gDQo+IFllYWgsIGFscmVhZHkgY2xlYW5lZCB1cC4g8J+Yig0KPiANCj4gPiA+ICsgKg0K
PiA+ID4gKyAqIFRoaXMgaXMgYSBjYWxsYmFjayBBUEkuwqAgSS5lIHRoaXMgY2FuIGJlIGFjY2Vz
c2VkIGV4dGVybmFsIHRvDQo+ID4gPiB0aGUgWEUgZHJpdmVyDQo+ID4gPiArICogKFBNVCBkcml2
ZXIgc2NvcGUpLsKgIEJlY2F1c2Ugb2YgdGhpcywgRFJNIGhvdHBsdWcgbmVlZHMgdG8gYmUNCj4g
PiA+IHZlcmlmaWVkDQo+ID4gPiArICogKGRybV9kZXZfZW50ZXIoKSkuDQo+ID4gPiArICoNCj4g
PiA+ICsgKiBSZXR1cm46DQo+ID4gPiArICogKiAtRU5PREVWIGRldmljZSBpcyBub3QgYXZhaWxh
YmxlIChob3RwbHVnKQ0KPiA+ID4gKyAqICogLUVJTlZBTCBmb3IgdW5zdXBwb3J0ZWQgZGV2aWNl
IG9yIFBNVCBmZWF0dXJlDQo+ID4gPiArICogKiAwIG9uIHN1Y2Nlc3MNCj4gPiA+ICsgKi8NCj4g
PiA+ICtzdGF0aWMgaW50IHhlX3BtdF9kaXNjb3ZlcnlfcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHVuc2lnbmVkDQo+ID4gPiBsb25nIGNhcF9pZCwNCj4gPiB1MzIgZWxlbWVudCwNCj4gPiA+ICsJ
CQkJIHUzMiAqZGlzY19kYXRhKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IHhlX2RldmljZSAq
eGUgPSBrZGV2X3RvX3hlX2RldmljZShkZXYpOw0KPiA+ID4gKwl2b2lkIF9faW9tZW0gKmRpc2Nf
YWRkciA9IHhlLT5tbWlvLnJlZ3M7DQo+ID4gPiArCXN0cnVjdCBpbnRlbF92c2VjX2hlYWRlciAq
aGVhZGVyczsNCj4gPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gPiArCXUzMiBvZmZzZXQ7DQo+ID4g
PiArCWludCBpZHg7DQo+ID4gPiArDQo+ID4gPiArCWlmICghZHJtX2Rldl9lbnRlcigmeGUtPmRy
bSwgJmlkeCkpDQo+ID4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiA+ICsNCj4gPiA+ICsJaWYg
KHhlLT5pbmZvLnBsYXRmb3JtICE9IFhFX0NSRVNDRU5USVNMQU5EKSB7DQo+ID4gPiArCQlyZXQg
PSAtRUlOVkFMOw0KPiA+ID4gKwkJZ290byBkZXZfZXhpdDsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0K
PiA+ID4gKwlzd2l0Y2ggKGNhcF9pZCkgew0KPiA+ID4gKwljYXNlIGlsb2cyKFZTRUNfQ0FQX1RF
TEVNRVRSWSk6DQo+ID4gPiArCQloZWFkZXJzID0gJmNyaV90ZWxlbWV0cnk7DQo+ID4gPiArCQli
cmVhazsNCj4gPiA+ICsNCj4gPiA+ICsJY2FzZSBpbG9nMihWU0VDX0NBUF9DUkFTSExPRyk6DQo+
ID4gPiArCQloZWFkZXJzID0gJmNyaV9jcmFzaGxvZzsNCj4gPiA+ICsJCWJyZWFrOw0KPiA+ID4g
Kw0KPiA+ID4gKwlkZWZhdWx0Og0KPiA+ID4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gPiA+ICsJCWdv
dG8gZGV2X2V4aXQ7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICsJb2Zmc2V0ID0gZWxlbWVu
dCAqIChoZWFkZXJzLT5lbnRyeV9zaXplICogc2l6ZW9mKHUzMikpOw0KPiA+ID4gKwlkaXNjX2Fk
ZHIgKz0gaGVhZGVycy0+b2Zmc2V0ICsgb2Zmc2V0Ow0KPiA+ID4gKw0KPiA+ID4gKwlzY29wZWRf
Z3VhcmQobXV0ZXgsICZ4ZS0+cG10LmxvY2spIHsNCj4gPiA+ICsJCXhlLT5zb2NfcmVtYXBwZXIu
c2V0X3RlbGVtX3JlZ2lvbih4ZSwNCj4gPiBDUklfSURYX1RFTEVNX0RJU0NPVkVSWSk7DQo+ID4g
PiArCQltZW1jcHlfZnJvbWlvKGRpc2NfZGF0YSwgZGlzY19hZGRyLA0KPiA+ID4gUE1UX0RJU0Nf
RFdPUkRTICoNCj4gPiBzaXplb2YodTMyKSk7DQo+ID4gPiArCX0NCj4gPiANCj4gPiB3ZSBwcm9i
YWJseSBuZWVkIHJwbSBnZXQvcHV0IGhlcmUsIG5vPyENCj4gDQo+IEluIHRoZSBub24gbGF0ZS1i
aW5kaW5nIHByb2JlIHBhdGgsIHJ1bnRpbWUgaXMgYWxyZWFkeSBpbiBwbGFjZS4NCj4gRm9yIHRo
ZSBsYXRlLWJpbmRpbmcgcGF0aCwgdGhlIHJ1bnRpbWVfZ2V0IGhhcHBlbnMgd2hlbiB0aGUgd29y
ayBpdGVtDQo+IGlzIHF1ZXVlZCBhbmQgcmVsZWFzZWQNCj4gd2hlbiB0aGUgcmVnaXN0cmF0aW9u
IGlzIGNvbXBsZXRlLg0KDQpubyBwb3NzaWJsZSBjb3JuZXIgY2FzZSBsaWtlIGxhdGUgcHJvYmUg
b2YgaW50ZWxfcG10IGl0c2VsZj8NCg0KaW4gZ2VuZXJhbCB3ZSBzaG91bGQgYWx3YXlzIGRvIHJw
bSBnZXQvcHV0IGFyb3VuZCBtbWlvL21lbSBhY2Nlc3MgdG8gYmUNCm9uIHRoZSBzYWZlIHNpZGUu
DQoNCj4gDQo+IE0NCj4gDQo+ID4gPiArDQo+ID4gPiArZGV2X2V4aXQ6DQo+ID4gPiArCWRybV9k
ZXZfZXhpdChpZHgpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICsvKioNCj4gPiA+ICsgKiB4ZV9wbXRfcmVhZF9yZWcoKSAtIHJlYWQgYSBj
cmFzaGxvZyByZWdpc3Rlcg0KPiA+ID4gKyAqIEBkZXY6IHRoZSB4ZSBkZXZpY2UgdGhhdCByZWdp
c3RlcmVkIHRoZSBjYWxsYmFjaw0KPiA+ID4gKyAqIEBndWlkOiBQTVQgZ3VpZCBvZiB0aGUgY3Jh
c2hsb2cgaW5zdGFuY2UNCj4gPiA+ICsgKiBAcmVnOiBkYXRhIHJlYWQgZnJvbSB0aGUgUE1UIGRh
dGEgc3RydWN0dXJlDQo+ID4gPiArICogQG9mZnNldDogd2hpY2ggZGF0YSB0byByZWFkIGZyb20g
dGhlIFBNVCBkYXRhIHN0cnVjdHVyZQ0KPiA+ID4gKyAqDQo+ID4gPiArICogUmVhZCB0aGUgcmVx
dWVzdGVkIFBNVCByZWdpc3RlciBiYXNlZCBvbiB0aGUgcGNpZSBkZXZpY2UgYW5kDQo+ID4gPiBn
dWlkLsKgIFRoZQ0KPiA+ID4gKyAqIHN1cHBvcnRlZCBzdHJ1Y3QgaXMgdGhlIENyYXNobG9nIFR5
cGUxIFZlcnNpb24yLg0KPiA+ID4gKyAqDQo+ID4gPiArICogQ3VycmVudGx5IHRoaXMgaXMgZm9y
IENSSSBvbmx5Lg0KPiA+ID4gKyAqDQo+ID4gPiArICogUmV0dXJuOg0KPiA+ID4gKyAqICogLUVO
T0RFViBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSAoaG90cGx1ZykNCj4gPiA+ICsgKiAqIC1FSU5W
QUwgaW52YWxpZCBndWlkDQo+ID4gPiArICogKiAwwqDCoMKgwqDCoMKgIHN1Y2Nlc3MNCj4gPiA+
ICsgKi8NCj4gPiA+ICtzdGF0aWMgaW50IHhlX3BtdF9yZWFkX3JlZyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHUzMiBndWlkLCB1MzINCj4gPiA+ICpyZWcsIHUzMg0KPiA+IG9mZnNldCkNCj4gPiA+ICt7
DQo+ID4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0ga2Rldl90b194ZV9kZXZpY2UoZGV2KTsN
Cj4gPiA+ICsJdm9pZCBfX2lvbWVtICpkaXNjX2FkZHIgPSB4ZS0+bW1pby5yZWdzICsgeGUtDQo+
ID4gPiA+cG10LmJhc2Vfb2Zmc2V0Ow0KPiA+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiA+ICsJdTMy
IGluc3Q7DQo+ID4gPiArCWludCBpZHg7DQo+ID4gPiArDQo+ID4gPiArCWlmIChGSUVMRF9HRVQo
R1VJRF9ERVZJQ0VfSUQsIGd1aWQpICE9IENSSV9ERVZJQ0VfSUQgfHwNCj4gPiA+ICsJwqDCoMKg
IEZJRUxEX0dFVChHVUlEX0NBUF9UWVBFLCBndWlkKSAhPSBDUkFTSExPRykNCj4gPiA+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoIWRybV9kZXZfZW50ZXIoJnhlLT5k
cm0sICZpZHgpKQ0KPiA+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gPiArDQo+ID4gPiArCWlu
c3QgPSBGSUVMRF9HRVQoR1VJRF9SRUNPUkRfSUQsIGd1aWQpID09IFBVTklUID8NCj4gPiA+ICsJ
CUNSSV9DUkFTSExPR19QVU5JVF9ESVNDX09GRlNFVCA6DQo+ID4gQ1JJX0NSQVNITE9HX09PQk1T
TV9ESVNDX09GRlNFVDsNCj4gPiA+ICsJZGlzY19hZGRyICs9IGluc3QgKyBvZmZzZXQ7DQo+ID4g
PiArDQo+ID4gPiArCXhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsNCj4gPiA+ICsNCj4gPiA+ICsJc2Nv
cGVkX2d1YXJkKG11dGV4LCAmeGUtPnBtdC5sb2NrKSB7DQo+ID4gPiArCQl4ZS0+c29jX3JlbWFw
cGVyLnNldF90ZWxlbV9yZWdpb24oeGUsDQo+ID4gQ1JJX0lEWF9URUxFTV9ESVNDT1ZFUlkpOw0K
PiA+ID4gKw0KPiA+ID4gKwkJKnJlZyA9IHJlYWRsKGRpc2NfYWRkcik7DQo+ID4gPiArCX0NCj4g
PiA+ICsNCj4gPiA+ICsJeGVfcG1fcnVudGltZV9wdXQoeGUpOw0KPiA+ID4gKw0KPiA+ID4gKwlk
cm1fZGV2X2V4aXQoaWR4KTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIHJldDsNCj4gPiA+ICt9
DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCB4ZV9wbXRfd3JpdGVfcmVnKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdTMyIGd1aWQsIHUzMg0KPiA+ID4gcmVnLCB1MzINCj4gPiBvZmZzZXQpDQo+ID4g
PiArew0KPiA+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGtkZXZfdG9feGVfZGV2aWNlKGRl
dik7DQo+ID4gPiArCXZvaWQgX19pb21lbSAqZGlzY19hZGRyID0geGUtPm1taW8ucmVncyArIHhl
LQ0KPiA+ID4gPnBtdC5iYXNlX29mZnNldDsNCj4gPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gPiAr
CXUzMiBpbnN0Ow0KPiA+ID4gKwlpbnQgaWR4Ow0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoRklFTERf
R0VUKEdVSURfREVWSUNFX0lELCBndWlkKSAhPSBDUklfREVWSUNFX0lEIHx8DQo+ID4gPiArCcKg
wqDCoCBGSUVMRF9HRVQoR1VJRF9DQVBfVFlQRSwgZ3VpZCkgIT0gQ1JBU0hMT0cpDQo+ID4gPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKCFkcm1fZGV2X2VudGVyKCZ4
ZS0+ZHJtLCAmaWR4KSkNCj4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gKw0KPiA+ID4g
KwlpbnN0ID0gRklFTERfR0VUKEdVSURfUkVDT1JEX0lELCBndWlkKSA9PSBQVU5JVCA/DQo+ID4g
PiArCQlDUklfQ1JBU0hMT0dfUFVOSVRfRElTQ19PRkZTRVQgOg0KPiA+IENSSV9DUkFTSExPR19P
T0JNU01fRElTQ19PRkZTRVQ7DQo+ID4gPiArCWRpc2NfYWRkciArPSBpbnN0ICsgb2Zmc2V0Ow0K
PiA+ID4gKw0KPiA+ID4gKwl4ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+ID4gPiArDQo+ID4gPiAr
CXNjb3BlZF9ndWFyZChtdXRleCwgJnhlLT5wbXQubG9jaykgew0KPiA+ID4gKwkJeGUtPnNvY19y
ZW1hcHBlci5zZXRfdGVsZW1fcmVnaW9uKHhlLA0KPiA+IENSSV9JRFhfVEVMRU1fRElTQ09WRVJZ
KTsNCj4gPiA+ICsNCj4gPiA+ICsJCXdyaXRlbChyZWcsIGRpc2NfYWRkcik7DQo+ID4gPiArCX0N
Cj4gPiA+ICsNCj4gPiA+ICsJeGVfcG1fcnVudGltZV9wdXQoeGUpOw0KPiA+ID4gKw0KPiA+ID4g
Kwlkcm1fZGV2X2V4aXQoaWR4KTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIHJldDsNCj4gPiA+
ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHN0cnVjdCBwbXRfY2FsbGJhY2tzIHhlX2JtZ19w
bXRfY2IgPSB7DQo+ID4gPiDCoAkucmVhZF90ZWxlbSA9IHhlX3BtdF90ZWxlbV9yZWFkLA0KPiA+
ID4gwqB9Ow0KPiA+ID4gDQo+ID4gPiArc3RhdGljIHN0cnVjdCBwbXRfY2FsbGJhY2tzIHhlX2Ny
aV9wbXRfY2IgPSB7DQo+ID4gPiArCS5yZWFkX3RlbGVtID0geGVfcG10X3RlbGVtX3JlYWQsDQo+
ID4gPiArCS5yZWFkX2Rpc2NvdmVyeSA9IHhlX3BtdF9kaXNjb3ZlcnlfcmVhZCwNCj4gPiA+ICsJ
LnJlYWRfcmVnID0geGVfcG10X3JlYWRfcmVnLA0KPiA+ID4gKwkud3JpdGVfcmVnID0geGVfcG10
X3dyaXRlX3JlZywNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gwqBzdGF0aWMgY29uc3QgaW50
IHZzZWNfcGxhdGZvcm1zW10gPSB7DQo+ID4gPiDCoAlbWEVfQkFUVExFTUFHRV0gPSBYRV9WU0VD
X0JNRywNCj4gPiA+ICsJW1hFX0NSRVNDRU5USVNMQU5EXSA9IFhFX1ZTRUNfQ1JJLA0KPiA+ID4g
wqB9Ow0KPiA+ID4gDQo+ID4gPiDCoHN0YXRpYyBlbnVtIHhlX3ZzZWMgZ2V0X3BsYXRmb3JtX2lu
Zm8oc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiDCoHsNCj4gPiA+IC0JaWYgKHhlLT5pbmZv
LnBsYXRmb3JtID4gWEVfQkFUVExFTUFHRSkNCj4gPiA+ICsJaWYgKHhlLT5pbmZvLnBsYXRmb3Jt
ID4gWEVfQ1JFU0NFTlRJU0xBTkQpDQo+ID4gPiDCoAkJcmV0dXJuIFhFX1ZTRUNfVU5LTk9XTjsN
Cj4gPiA+IA0KPiA+ID4gLQlpZiAoSVNfU1JJT1ZfVkYoeGUpICYmIHhlLT5pbmZvLnBsYXRmb3Jt
ID09DQo+ID4gPiBYRV9CQVRUTEVNQUdFKQ0KPiA+ID4gKwlpZiAoSVNfU1JJT1ZfVkYoeGUpICYm
DQo+ID4gPiArCcKgwqDCoCAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSB8fA0K
PiA+ID4gKwnCoMKgwqDCoCB4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9DUkVTQ0VOVElTTEFORCkp
DQo+ID4gPiDCoAkJcmV0dXJuIFhFX1ZTRUNfVU5LTk9XTjsNCj4gPiA+IA0KPiA+ID4gwqAJcmV0
dXJuIHZzZWNfcGxhdGZvcm1zW3hlLT5pbmZvLnBsYXRmb3JtXTsNCj4gPiA+IEBAIC0zOTksOCAr
NTYzLDE0IEBAIHZvaWQgeGVfdnNlY19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4g
wqAJc3dpdGNoIChwbGF0Zm9ybSkgew0KPiA+ID4gwqAJY2FzZSBYRV9WU0VDX0JNRzoNCj4gPiA+
IMKgCQl4ZS0+cG10LmJhc2Vfb2Zmc2V0ID0gQk1HX1RFTEVNRVRSWV9PRkZTRVQ7DQo+ID4gPiAt
CQlpbmZvLT5wcml2X2RhdGEgPSAmeGVfcG10X2NiOw0KPiA+ID4gKwkJaW5mby0+cHJpdl9kYXRh
ID0gJnhlX2JtZ19wbXRfY2I7DQo+ID4gPiDCoAkJYnJlYWs7DQo+ID4gPiArDQo+ID4gPiArCWNh
c2UgWEVfVlNFQ19DUkk6DQo+ID4gPiArCQl4ZS0+cG10LmJhc2Vfb2Zmc2V0ID0gQ1JJX1BNVF9P
RkZTRVQ7DQo+ID4gPiArCQlpbmZvLT5wcml2X2RhdGEgPSAmeGVfY3JpX3BtdF9jYjsNCj4gPiA+
ICsJCWJyZWFrOw0KPiA+ID4gKw0KPiA+ID4gwqAJZGVmYXVsdDoNCj4gPiA+IMKgCQlicmVhazsN
Cj4gPiA+IMKgCX0NCj4gPiA+IC0tDQo+ID4gPiAyLjQzLjANCj4gPiA+IA0K
