Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466000;
	b=Pnue7exzncBFacLf7T36x12cBGtV6Fs75yebSYvu4Q57wyPyY+MhUx+n/QI5FveF1aly
	 zPIts5NWKUhrnF91Q5MFP+ZGM73e/ASg/oyTZ772lcgZ02oBcVogrFhllhiBKNK6x8/ln
	 vlwSgiI1Bu1fXhmPF+3cR6xE6PHmsU9iECZ/nCqLrdzSb2een+xff+dVqOqcJOvvrp52I
	 ExUma9x2HaXxos1dEWfz/ItD1yugBZ9F4Tt/w2b96c7WHVbNlfBXFck8ZtI0o8JeespQu
	 emlgRmuSE+AIiZUE+n6pprshrS9gA8XUbm+KMDUQxzo6BbhyvB7Cj5VPt3se8KmL6oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466000;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4dh1aKuKp3hLTihwqg5VfClXbtvwqeA/MZe6svLKP+Q=;
	b=O950YvhkWydLbWqfZ/92HhFGOpqrNLMSozrEL+xmQ+ixp/LYNau1jEZasq4iQBqOqoxV
	 2wZFr/u1nziVov/L5mrhT3RiOJbCGmcMjlsvTrDpXPzbPNp4/BxZ49URlLSCKb0xq6Jl7
	 JqXAMoOIffR5PWm0g0A/EVMcgUhiaNWY8bvWHL9B0gW/Gfnn15FLQrXxHUzGfMJSife15
	 X1eBOZdvT5FN8/i0TrdnJyfSRRCrY4FaaXODFoXwKcy2N8YBoJ7sjBdTXfPOi4P88pZLr
	 XxUj6vqNGB95qqT6RKwTt3HeuNLyMphjEJu+lgkPE1i5+jjSUa2j61tjIhMzi2vus2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HKVItw0J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.30
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486F606A31E;
	Mon, 23 Nov 2026 20:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1486F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HKVItw0J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmLf+yELrbGZlVG5pk+gMBoX2ibnDj5D8AzrmItiXFFdsXuQTkPuXr8/1jHcYSbI75V+E/CKsUmqF+59lPNnpEU5fRVTFb/wTCwrZNV79QZnRtjq4KRTGXTE7iHURpcKnwf6dyTdubbR0Vm3WjVj5uDU+xwn+2OPM/e2mrZ3FL5wKJWEd3awynjBqrJflLSbJQgXJuOUzde+hHQL0Pk8sG95RQ2Ak7iNMWTeDt3MxzYfYy0HPrGm5IEyXwEv5RfP4FGGqMQ02L+mTxgSUlSAdZn/nS1u3c9rn4FAdjgNjpV1n0VSy80LMFEbtAyILaLb+yqngfkD4Yqsg4z2BoD3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dh1aKuKp3hLTihwqg5VfClXbtvwqeA/MZe6svLKP+Q=;
 b=OO7pksvv4XLlBD8UMWxAtH84Sc41JtH9ilS1r3Nx1L8mhVE2aIpBPqF33cOND2zrczpXhAFNq5BhJE/QtU0Iqo23O0WvmDdYCv+H+5Xs2nNQg4wDlS+mmsgVBQeHsXdGMk45luEkhFPjoqTpt+GwowLnluOY11k9/ASG8/E0X0/ctpCb5BBvpXM37h1iCLRwefHo9v7EfFTVYbd0HQIhnsvQdixnFMEYmhtQpvtMuhJrzjZ+aqYN+hkYNuwGoE2G9MjSEAThuKsMR33Ug8ox4uaD1ic2yRYM13vDOAr4iBSXqfiGSBS3CUp678P6TPC++IMGdsnSfLiWC5/lf7acKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dh1aKuKp3hLTihwqg5VfClXbtvwqeA/MZe6svLKP+Q=;
 b=HKVItw0J5VGhTWeppCvbQCVRc5kosiKyaiRRxzvhf9r36KOQU5ZmgplIT29mKtrazjqwEaYt189E2/SKbYTv0n/UQNcpzaLHnuEvffUSxP1FsrTO1ykwNVr3V9sS9LxzP5PuZa1d3JQLepYH4r6FN2w0AVNDz3YLvdAQLac7YH0+ZUCHiIueFK7FY18Y18iWHcM9ON/gp1A8FHDwu2e/UFmtd5eb3sKcSABeoaKybp/WlPH4qwoXYngko8l6RaXgZYi9XezD3YwMaO5supF7NiPPoIT0YPd94mVwoJf44UMhlhUX/zXwQViqud+hS9hioCTcyrxvXA4tTj/itXt/mg==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:33:12 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:33:12 +0000
From: Brian Mak <bmak@nvidia.com>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC: Hans de Goede <hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Kurt Borja <kuurtb@gmail.com>, Stuart Hayes
	<stuart.w.hayes@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Lyndon
 Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr
	<prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Topic: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAADwcA
Date: Mon, 23 Nov 2026 20:33:11 +0000
Message-ID: <58afee6c-52fd-49af-b8d2-b0569051f5e3@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
 <20261123193923.cl2i62lgute6li3u@pali>
In-Reply-To: <20261123193923.cl2i62lgute6li3u@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|IA1PR12MB8224:EE_
x-ms-office365-filtering-correlation-id: 4ad4e360-eb4f-4e52-294b-08df49a0fe52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|6133799003|10067099003|261009223027099003|22082099003|18002099003|261026121527099003|261028144727099003|261026130827099003|261021121427099003|261021135927099003|261021123027099003|261021130227099003|261102123227099003|38070700021|261022105027099003|261022115727099003|261022075727099003|261022113327099003|56012099006|4143699003|261026140227099003|5023799004|11063799006;
x-microsoft-antispam-message-info:
 e/TSUt78wiawT4Da+eMW5rEbRZOhWPN0UthzHbXuHXOoIqF+0GdDwWeRKEi0e0trFABpR+D/NbmJP8X67eAj8wGYIFzkHibY0xmNwZAcPwhfImLvd34dFlss6NE9cPnMeHHDSoGXJqoZregd76Ug/D1fjdj+kd/ihTp7pCwx4/YxDchzT5YclfzsV6i8VYuVr5S+T2tTkeJlIeM6upQFPrYgAg40lJEKAxbCtk8U5Q4379NjRMcCRCn5KcBUK7JsxN3OU+EF/MAjT95yefip93LRCjvNqdm59yjVvsYxC+fc2rP5zSU/IV1ammd0XB3mOfTVQqKARU/54wGAZMIV+j0KvX29aF+BiRBrWyri8osKjkfUnzQxQVQPRYZN5g41QgZL89hZEg+a/+aiYyE0csqSN9NOrj4pOnTjo2fPzmp2lT9o5ZHoseHHwxh2iu2Aw8M0aPjzwu8QApzisXu+QZTYQDRjuRNfsDp3vTIyY58cGMGs3TzytBszUmbgNj+rkrPsSvIo9E0G0UgQHIea68+0DTVsx1UaqQ4SxTrDuWwDJwA6s648M+JKbLrLErufQX63K4vhJtjukMO/wzn5RZZYG/FlHxR7Ymixw+fgSVU5MgEkyl8K3KLx4Zxd3d8YUuq2uYW8/+1azvM46bc4zC7W5liSzNbQN9uEpjZ83Uy4daKJaNhHZ6LIz+yT5aggqIk+j6Vye345FYkvPlEffg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(6133799003)(10067099003)(261009223027099003)(22082099003)(18002099003)(261026121527099003)(261028144727099003)(261026130827099003)(261021121427099003)(261021135927099003)(261021123027099003)(261021130227099003)(261102123227099003)(38070700021)(261022105027099003)(261022115727099003)(261022075727099003)(261022113327099003)(56012099006)(4143699003)(261026140227099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUptdFFBUHVUOWcwOTliVXEvdHRsK2wzS0hwNjErSzU3Z1RNNlBENGF1VG9Q?=
 =?utf-8?B?TFdBZzZTQmtvRCttY29BclpJWTcxb0JsQkNiZFBzcjR2V0lET2x2NTROc252?=
 =?utf-8?B?OVV2eGdjU1cxVkQvSWVyTkNuYlplT21panNXdUVwczVTL3Nzc3NvUE9qYW1D?=
 =?utf-8?B?Zk1obnptb3ZHTlBKSXdHT2dBNlFUZWpQc0RXNTcxV1pDYTlEeXhySXg4aWxR?=
 =?utf-8?B?ZXVkMFZRWkNSWnhmejBqK3V5NzlrZ25OQ0k1dFNuS2J5eEdaaDJMZlJCVHhx?=
 =?utf-8?B?eTN1Yko5dXN0UEV3a2pJb1R4R3lSZTZ1RGRnLzlLNnJlOGd0Ymt6Nk10MWtl?=
 =?utf-8?B?eFROeks5RnUxTWNiSjNpQUExRVVQS3JHcnJLSE95MDVHNUx2QVZEenpyN2hS?=
 =?utf-8?B?blV6NGpVUDc4Ni8zYWVHTGpPVDdXbVRjSHBaYVc3QllXK0R3enhqTnBLL2Zy?=
 =?utf-8?B?U29xaVlaZlNrNlR6cVpiWnV6L0F3aUxvaURqd2NTd2VhZjNTZEQ2M3FSd01V?=
 =?utf-8?B?eXd2ZmN2QWF0eVBtRnJIdGZRYUdMRHZ2K05kcUs2OFJMTCtLRVNidk4xRUdo?=
 =?utf-8?B?TmZuTDFYWTdYODI4M3YxU2ttc1lKTSsyWnp2cm42cmpwU0lNMjVrL0VqcmJT?=
 =?utf-8?B?VzY3akxiWHFMRVlMK1pUUDZVbGRrRk9DN084ZlZ1T05Xd1VGZjJWSS9LeS96?=
 =?utf-8?B?bG1RQ2N1dTlXTU4xTjcrOUc5cGhmc1JOZXFUME42RlFvWEQydG02TlJnQ1Zx?=
 =?utf-8?B?VHEraStGMkVKektUaFFwaHRYNFNaZ3A3ZVJtZTRyTlFyVE5kNUppbHU0L0JX?=
 =?utf-8?B?WkVHckt3dC84NVRZeHBkMWxoTkxCZHV2MkN0Z3JOQ1dCcUZMMHBkak8wbS9Q?=
 =?utf-8?B?STN4Z29PbXdhLzJORWpmRSt1UXJ4cld6SXV1VDUxamE4eXcxRFQ2UjgreWlX?=
 =?utf-8?B?M1p4bkswb0Q2N0VmT0ZGd0xRSWJHL1NFM0JCR0RjVUhrM1lkN1A2ZHBUSmU2?=
 =?utf-8?B?RXVlN0NMeFFJZFNxZHg4MVZVeWNsVTJyUnpOd0xVdVAvWEpkaVdGeUhSM0ZX?=
 =?utf-8?B?YjdVZEV3d0hjenp6K3lBWEw0OGNZRm9ISnRWWVY4OEp6YzBITExvWC9iMDJa?=
 =?utf-8?B?VlN0OWRqa1VJMnRIZG13Uzkxdm9YTVdZV3N1dmVLY2Z1cStZQkU2MU04VUV4?=
 =?utf-8?B?Y0JreVlINUNEb3Yxc005aEFTZnd1c2dFZ2MxeVVPN05WZWNreGlLZ1p5aDhq?=
 =?utf-8?B?V3FmUzZGYTVtek9QaGJMeVhyMDFNc3RFUXhhRVdhdWdnQXpkSmI4T0crbndx?=
 =?utf-8?B?Tk1uSUorcmk1OU1XQXpVTDRYYkJkVEJOYitjdXlWclJIVDBmR1FjVEF1VmNv?=
 =?utf-8?B?ZjUyU3BoR2NUUmRoc2Vjb3RjdTFrUWRhSDNpNmRCZldjSjdmYW9SanM0ZDRy?=
 =?utf-8?B?VmlRK05tMCtDTlV4VHdXTFFaRUE3VUhqYnZwT04zU0VtdkpwOURxZVJkVHJB?=
 =?utf-8?B?MzUxSWdLNGtiTEtYZmJFcFJaQjNWdklhajRuc29lSzYvbEhQNnpDREFRTEh6?=
 =?utf-8?B?dVgxT3lXdy9GSXJoenBwdkFqaGhsNVRycitxRHgyZjZXZDgwcW81bDFPQkhM?=
 =?utf-8?B?VlJBelNEK2NXeTNaZ2JRemR3ZzhzK0huNkFHcXdoOXY0ZjUydDY2cGMyMG85?=
 =?utf-8?B?UmlXekJLaXJ1MnkyYVpKRlpLc0puREQ5dTRCSG0rczI5SDJQeSsxTFBKRnly?=
 =?utf-8?B?ZlUxMFB1elFFa3JhNWViWjBabUo4T09VTnhNK1l4aGFhV1JrOUNjdEdwdEZi?=
 =?utf-8?B?MEpWZTI0SXl2S3hjTWYxQjB3aUZTdWtSdFd1Z01QeUZ2SkU3ZlUxTzVTcjZ3?=
 =?utf-8?B?MFhOWXJyZ3RsbHNsanJXeitGQXlIMzFqUnd1NDMrR3duRXdGTCs4a3ZISSs0?=
 =?utf-8?B?S0JlUEJLMGphSDRMYW10Ri9HUTg0RzV6MlRtK0lwY0d1RHRHblRaV0M5Y2R5?=
 =?utf-8?B?RytFWHFzamZzZWp6TWN1US96WlhXaFNNaFdUTXlkSTBHaVhrM0p6ekphWmtR?=
 =?utf-8?B?WjBuS1NkWFBWZEpYamhFWkxhTEZra1ZTYm9wa1dCUGpTRDZsVEIybWhwcFN0?=
 =?utf-8?B?VXI5UzkzOER2UnpvQ3JXOGZxaXVkYlpFQXUxcTVsSFFDZis1aVlraHlkOU5E?=
 =?utf-8?B?NFdLYi9VTXdwaUNCK0RvSG14WTYzVHJyakJHZ3E0NUxzM1pseEhVZG96MGxm?=
 =?utf-8?B?dG1iaHI4Qi9CeWFVRUpHanBCVWw1QzY5OEdSa0dmU2hSWTBzZTlGQXU2MG5R?=
 =?utf-8?Q?JrNRh5jwKj8nQDlHeH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BEE8378A9F929449F90271DE8C431F4@namprd12.prod.outlook.com>
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad4e360-eb4f-4e52-294b-08df49a0fe52
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:33:11.9839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdFZ1qTmH+XADm7ACfFBZZLw/6TeY5kGIqGFt4CInEue24MM9XaCAEjeUlPwPYKr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224

T24gMTEvMjMvMjYgMTE6MzksIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBNb25kYXkgMjMgTm92
ZW1iZXIgMjAyNiAxOToxMTowMCBCcmlhbiBNYWsgd3JvdGU6DQo+PiBPbiAxMS8yMC8yNiAxNjo0
OCwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4gT24gRnJpZGF5IDIwIE5vdmVtYmVyIDIwMjYgMTY6
MDU6NTAgQnJpYW4gTWFrIHdyb3RlOg0KPj4+PiBDT05GSUdfREVMTF9MQVBUT1AgaXMgY3VycmVu
dGx5IG5vdCBhdmFpbGFibGUgb24gQVJNNjQsIGR1ZSB0byBhDQo+Pj4+IGRlcGVuZGVuY3kgb24g
Q09ORklHX1NFUklPX0k4MDQyLiBUaGlzIGRlcGVuZGVuY3kgaXMgYWN0dWFsbHkgbm90DQo+Pj4+
IG5lY2Vzc2FyeSwgYXMgdGhlcmUgaXMgYSBmYWxsYmFjay4gTWFrZSBpdCBvcHRpb25hbC4NCj4+
Pg0KPj4+IGk4MDQyIGlzIHVzZWQgZm9yIGNvbnRyb2xsaW5nIHRvdWNocGFkIExFRCBhbmQgZm9y
IHJlY2VpdmluZyByZmtpbGwNCj4+PiBldmVudHMgd2hlbiB0aGUgZGVsbC1yYnRuIGlzIG5vdCBz
dXBwb3J0ZWQgb24gdGhlIHBhcnRpY3VsYXIgbWFjaGluZS4NCj4+Pg0KPj4+IFRvdWNocGFkIGxl
ZCBpcyBhdmFpbGFibGUgb24gbW9yZSBWb3N0cm8gYW5kIEluc3BpcmlvbiBtYWNoaW5lcyBhbmQN
Cj4+PiB0aGVyZSBpcyBubyBmYWxsYmFjayBvciBkZXRlY3Rpb24gb2YgaTgwNDIgYXQgYWxsLiBF
dmVuIHRoZXJlIGlzIG5vDQo+Pj4gZXJyb3IgY2hlY2tpbmcuDQo+Pj4NCj4+PiBBbmQgZm9yIHJl
Y2VpdmluZyByZmtpbGwgZXZlbnRzIGl0IGlzIHNhbWUgc2l0dWF0aW9uLg0KPj4+DQo+Pj4gU28g
dGhlIGRlbGwtbGFwdG9wIGRyaXZlciBleHBlY3RzIHRoYXQgdGhlIFNFUklPX0k4MDQyIGlzIGVu
YWJsZWQgYW5kDQo+Pj4gY29tcGlsZWQgaW4uDQo+Pj4NCj4+PiBJZiBub25lIG9mIHRoZXNlIGZ1
bmN0aW9uYWxpdHkgaXMgYXZhaWxhYmxlIG9uIGFybTY0IEhXLCB0aGVuIGl0IG1ha2VzDQo+Pj4g
c2Vuc2UgdG8gbWFrZSB0aGUgU0VSSU9fSTgwNDIgb25seSBmb3IgeDg2LiBBbmQgdGhlbiBpbiB0
aGUgZGVsbC1sYXB0b3ANCj4+PiBkcml2ZXIgbWFya2luZyB0aGUgeDg2IHNwZWNpZmljIGRlcGVu
ZGVuY3kgdmlhIGlmZGVmcy4gV2hpY2ggYWxsb3dzIHRvDQo+Pj4gY29tcGlsZSBkcml2ZXIgb24g
YXJtNjQgd2l0aG91dCB0aG9zZSBzcGVjaWZpYyBmdW5jdGlvbmFsaXRpZXMuDQo+Pg0KPj4gU0VS
SU9fSTgwNDIgYWxyZWFkeSBjYW4ndCBiZSBlbmFibGVkIG9uIGFybTY0LA0KPiANCj4gVGhhdCBt
YWtlcyBzZW5zZS4gaTgwNDIgaXMgeDg2IHNwZWNpZmljLg0KPiANCj4+IGFzIEFSQ0hfTUlHSFRf
SEFWRV9QQ19TRVJJTyBpcyBub3Qgc2V0LiBXaXRoIHRoZSBjdXJyZW50IHBhdGNoLCB0aGUgZHJp
dmVyDQo+PiBidWlsZHMgb24gYXJtNjQsIGJ1dCBhcyB5b3UgbWVudGlvbmVkLCB0aGVyZSdzIGEg
Y291cGxlIGdhcHMgdGhhdCBuZWVkDQo+PiB0byBiZSBhZGRyZXNzZWQgd2l0aCByZmtpbGwgYW5k
IHRvdWNocGFkIExFRC4NCj4+DQo+PiBGb3IgcmZraWxsIGN1cnJlbnRseSwgdGhlIGRyaXZlciBm
YWlscyB0byBwcm9iZSwgZHVlIHRvIGEgZmFpbGVkDQo+PiBpODA0Ml9pbnN0YWxsX2ZpbHRlciBj
YWxsLCBpZiB0aGUgZGV2aWNlIGlzIGEgTGF0aXR1ZGUgb3IgYSBQcmVjaXNpb24NCj4+IChjaGVj
a2VkIGJ5IERNSSkgb3IgZm9yY2VfcmZraWxsIGlzIGVuYWJsZWQsIFNNQklPUyByZXBvcnRzIGFu
IHJma2lsbA0KPj4gc3dpdGNoLCBhbmQgZGVsbC1yYnRuIGlzIG5vdCBzdXBwb3J0ZWQuIFRoYXQg
ZG9lc24ndCBhcHBseSBmb3IgdGhlIFhQUw0KPj4gMTYgQ3JlYXRvciBFZGl0aW9uLCBidXQgaXQg
bWF5IGZvciBhbiBBUk02NCBMYXRpdHVkZSBvciBQcmVjaXNpb24NCj4+IHByb2R1Y3QuIEZvciB2
MiwgaWYgZGVsbC1yYnRuIGFuZCBpODA0MiBhcmUgYm90aCB1bmF2YWlsYWJsZSwgSSBjYW4gbWFr
ZQ0KPj4gcmZraWxsIHNldHVwIGZhaWwgd2l0aG91dCBmYWlsaW5nIHByb2JlLg0KPiANCj4gV2Vs
bCwgaGVyZSB0aGUgbWFpbiBwb2ludCBpczogd2hvIChmcm9tIEhXIHBvaW50IG9mIHZpZXcpIHdp
bGwgcmVwb3J0DQo+IHRoZSByZmtpbGwgZXZlbnQ/IEl0IGNhbm5vdCBiZSBpODA0MiBiZWNhdXNl
IHRoaXMgY29udHJvbGxlciBpcyBub3QNCj4gcHJlc2VudCBvbiBhcm02NC4gTXkgZ3Vlc3MgaXMg
dGhhdCBkZWxsLXJidG4gaW50ZXJmYWNlIGlzIGFsc28gbm90DQo+IHByZXNlbnQgYXMgSSB3YXMg
dG9sZCB0aGF0IERlbGwgYWJhbmRvbmVkIHRoaXMgaW50ZXJmYWNlIGV2ZW4gb24geDg2Lg0KPiAN
Cj4gU28gZm9yIGFybTY0IHBsYXRmb3JtIHRoZXJlIGhhcyB0byBiZSBzb21lIG90aGVyIHNvdXJj
ZSBvZiByZmtpbGwNCj4gZXZlbnRzLiBPciByZmtpbGwgaXMgbm90IHByb3ZpZGVkIGF0IGFsbC4N
Cj4gDQo+IEkgZG8gbm90IGtub3cuLi4gYmVjYXVzZSBJIGRvIG5vdCBoYXZlIHRoaXMgaGFyZHdh
cmUuIFNvIHRoaXMgcXVlc3Rpb24NCj4gaXMgZm9yIHNvbWVib2R5IHdobyBpcyB3cml0aW5nIGRy
aXZlcnMgZm9yIHRoaXMgcGxhdGZvcm0uLi4NCg0KSSBzZWUgeW91ciBwb2ludC4gSSB3YXNuJ3Qg
YXdhcmUgb2YgdGhlIGhpc3Rvcnkgd2l0aCBob3cgZGVsbC1yYnRuIHdhcyANCmFiYW5kb25lZC4g
VGhlIGRlbGwtcmJ0biBpbnRlcmZhY2UgaXMgbm90IHByZXNlbnQgb24gbXkgWFBTIDE2IENyZWF0
b3IgDQpFZGl0aW9uIGVpdGhlci4gVGhlcmUgaXNuJ3QgYW4gcmZraWxsIGludGVyZmFjZSBvbiB0
aGlzIHBsYXRmb3JtLCB0byBteSANCmtub3dsZWRnZS4gV2hlbiBJIHN1Z2dlc3RlZCB0byBtYWtl
IHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyANCnByb2JlLCB0aGF0IHdhcyBmb3Ig
aW4gY2FzZSB0aGUgZGVsbC1yYnRuIGludGVyZmFjZSBpcyBhdmFpbGFibGUgb24gYSANCmZ1dHVy
ZSBwbGF0Zm9ybS4gU2luY2UgeW91IHNhaWQgdGhhdCBpdCdzIGFiYW5kb25lZCwgSSB3b3VsZCBh
Z3JlZSB0aGF0IA0KdGhlcmUncyBubyBwb3NzaWJsZSBzb3VyY2VzIGZvciByZmtpbGwgZXZlbnRz
IG9uIEFSTTY0IERlbGwgcGxhdGZvcm1zLg0KDQpJIGNhbiBnYXRlIHJma2lsbCBzZXR1cCBsb2dp
YyBiZWhpbmQgYW4gaWZkZWYgYXMgd2VsbCB0aGVuLCBmb3IgdjIuIElzIA0KeW91ciBwcmVmZXJl
bmNlIHRvIGdhdGUgYmVoaW5kIFNFUklPX0k4MDQyIG9yIFg4Nj8NCg0KPiBJbiBhbnkgY2FzZSwg
aXQgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UgdG8gcHJvdmlkZSAiZmFrZSIgb3IgImR1bW15Ig0K
PiBkZXZpY2UgYnkgbGludXgganVzdCB0byBtYWtlIGRyaXZlciBjb21waWxhYmxlLg0KDQpJJ20g
bm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gYnkgdGhpcy4gVW5kZXIgbXkgb3Jp
Z2luYWwgDQpwcm9wb3NhbCBvZiBtYWtpbmcgcmZraWxsIHNldHVwIGZhaWwgd2l0aG91dCBmYWls
aW5nIHByb2JlLCBubyBkdW1teSBvciANCm5vbi1mdW5jdGlvbmFsIGRldmljZXMgd291bGQgYmUg
ZXhwb3NlZCBieSB0aGUgZHJpdmVyLiByZmtpbGwgc2V0dXAgDQp3b3VsZCBmYWlsIGdyYWNlZnVs
bHksIGFuZCB0aGUgcmZraWxsIGRldmljZXMgd291bGQgZ28gYXdheSB3aXRoIGl0LiBJIA0KYWdy
ZWUgd2l0aCB5b3UsIGJ1dCBJJ20gbm90IHN1cmUgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhl
cmUuDQoNCj4+IEZvciB0aGUgdG91Y2hwYWQgTEVEIGN1cnJlbnRseSwgdGhlIGk4MDQyX2NvbW1h
bmQoKSBzdHViIHdpbGwgcmV0dXJuDQo+PiAtRU5PREVWIGFuZCBkbyBub3RoaW5nLiBUaGlzIHdp
bGwgcmVnaXN0ZXIgYW4gTEVEIHRoYXQgZG9lcyBub3RoaW5nLiBGb3INCj4+IHYyLCBJIGNhbiBn
YXRlIHRoZSBMRUQgcmVnaXN0cmF0aW9uIGJlaGluZCBhIFNFUklPX0k4MDQyIGlmZGVmLg0KPiAN
Cj4gSSB0aGluayB0aGF0IHRoaXMgaXMgY29ycmVjdCB3YXkuIFRoZSBpODA0MiB0b3VjaHBhZCBs
ZWQgc2hvdWxkIG5vdCBiZQ0KPiBlbmFibGVkIHdoZW4gdGhlIGk4MDQyIEhXIGlzIG5vdCBwcmVz
ZW50IGF0IGFsbC4gQW5kIHRoYXQgdG91Y2hwYWQgbGVkDQo+IGlzIG9ubHkgZm9yIGZldyBtb2Rl
bHMgYmFzZWQgb24gd2hpdGVsaXN0Lg0KPiANCj4+IEZvciB0aGUgS2NvbmZpZywgc2luY2UgaTgw
NDIgaXMgcmVxdWlyZWQgb24gc29tZSB4ODYgRGVsbCBwbGF0Zm9ybXMsIEkNCj4+IGNhbiBjaGFu
Z2UgdGhlIEtjb25maWcgZGVwZW5kZW5jeSB0byBiZSBsaWtlIHN1Y2gsIHRvIGVuc3VyZSB0aGF0
DQo+PiBTRVJJT19JODA0MiBpcyByZXF1aXJlZCBvbiB4ODYgYW5kIG9wdGlvbmFsIGVsc2V3aGVy
ZSAoaW4gY2FzZSB0aGVyZSdzDQo+PiBhbm90aGVyIGFyY2ggaW50cm9kdWNlZCBieSBEZWxsIHRo
YXQgc3VwcG9ydHMgaTgwNDIgaW4gdGhlIGZ1dHVyZSk6DQo+Pg0KPj4gZGVwZW5kcyBvbiBTRVJJ
T19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQo+Pg0KPj4gUGxlYXNlIGxldCBt
ZSBrbm93IGlmIHRoZXNlIGNoYW5nZXMgYXJlIGdvb2Qgd2l0aCB5b3UuDQo+Pg0KPj4gVGhhbmtz
LA0KPj4gQnJpYW4NCj4gDQo+IE15IHBlcnNvbmFsIG9waW5pb24gaXMgdG8gbWFrZSBpODA0MiBk
ZXBlbmRlbmN5IG9ubHkgb24geDg2LiBBbmQgZG8gbm90DQo+IGV2ZW4gdHJ5IHRvIGVuYWJsZSBp
ODA0MiBvbiBub24teDg2IHBsYXRmb3Jtcy4gQWxsIGRlbGwgZHJpdmVycyB3ZXJlIGluDQo+IHg4
NiBzdWJkaXJlY3Rvcnkgd2hpY2ggY2F1c2UgdGhhdCBleHBsaWNpdCB4ODYgd2FzIG5vdCB3cml0
dGVuIGluDQo+IEtjb25maWcgKGFzIGl0IHdhcyBub3QgbmVlZGVkKS4NCj4gDQo+IE5vdyB3aGVu
IHlvdSBhcmUgbW92aW5nIGRlbGwgZHJpdmVycyBvdXQgb2YgdGhlIHg4NiBzdWJkaXIsIG1heWJl
IGl0DQo+IGNvdWxkIG1ha2Ugc2Vuc2UgdG8gY2hlY2sgaWYgdGhlcmUgYXJlIHNvbWUgb3RoZXIg
Y29uZmlnIG9wdGlvbnMgd2hpY2gNCj4gaGF2ZSBhbHNvIGhpZGRlbiBkZXBlbmRlbmN5IG9uIHg4
Ni4NCj4gDQo+IEFueXdheSwgSSBoaWdobHkgZG91YnQgdGhhdCBhbnkgbmV3IHBsYXRmb3JtIC8g
ZGV2aWNlICh3aGljaCBpcyBkZXNpZ25lZA0KPiBmcm9tIHNjcmF0Y2g7IG5vdCByZWJyYW5kZWQg
b3IgZXZvbHV0ZWQpIHdvdWxkIHVzZSBpODA0MiBmb3IgYW55IHN1Y2gNCj4gQVBJLiBOb3dhZGF5
cyBhbGwgdGhvc2UgZnVuY3Rpb25hbGl0aWVzIGFyZSBiYXNlZCBvbiBBQ1BJIG9yIFdNSSBBUElz
Lg0KDQpJZiBJIHVuZGVyc3RhbmQgeW91ciBzdWdnZXN0aW9uIGNvcnJlY3RseSwgeW91IGFyZSBh
c2tpbmcsIGluc3RlYWQgb2YgDQpnYXRpbmcgYmVoaW5kOg0KDQpkZXBlbmRzIG9uIFNFUklPX0k4
MDQyIHx8IChTRVJJT19JODA0MiA9IG4gJiYgIVg4NikNCg0KWW91IHdvdWxkIGdhdGUgYmVoaW5k
Og0KDQpkZXBlbmRzIG9uIFNFUklPX0k4MDQyIHx8ICFYODYNCg0KVGhhbmtzLA0KQnJpYW4NCg==
