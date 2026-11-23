Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468628;
	b=hG9xmCo7TFXzRkbZeg0e0tcEWlkmaaLMo3cjpvW/ZeRkMMp5SNBzcyJid9ZLCzD9amwi
	 EmAWtSchAyXn7P5xztR3wKslvxGPLfvAYQqKCIhonucfWmLNglZKp4Qc2g34I/tg57Mfx
	 bzV0JBj5BzEzdZRjmIjdWB8LW+zLN2byQBw4PxQcuMZ2ERo2LaHzkg4nU+1Pmy7CvJQMD
	 DS0XEdQbD09ecwdxQpGMYOdpwNw3xtmHmgrLSQ63AhKg0qhGSE0+cGhOw4YCcdgQKWS5G
	 kogtUGWAKtnHOn3v4wdRgGTn1h3x1yKfwmATj3gtzRAPerk15D3I6QpioiOTQ0y3Z2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468628;
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
	bh=aprHhszq6cMbsZbho6trB4BcvpI+aO2hNZjIJTZy3RI=;
	b=e7FZhBPMPKvdGRXlFKvGwWm3UrLEKy/LaRXeKoYKrAGpxMG3fXuRz69j+7RM7Om0q8Sd
	 4ftQB+7N9DC1xJt8xMDOvMYlR92yJrkmI1vCVa9hyGcEgsbS9YD9ywavfNBoKd5edE70Q
	 5g1vGrtc6ia1kGCusez/2RZlnJUhmWnhwuD/CL8FwIm8lR4Vm2zoyEsgX+JPxax+rSaCi
	 N4n1H/iNVLi2UmI4zBvqhhjk64Sm3MK253JPptBoF+aTWk05MTTJThOIuYQZZTN0kAckM
	 ep5NWxQkC+sYS6eJ9vD7QAktGu+L6UFBcfXLbEvLIRngr9u8qpzyHcG2bznbUZFHl2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jiLNREIL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.5
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533C606A31E;
	Mon, 23 Nov 2026 21:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8533C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jiLNREIL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCnXCrqW1rt52dqYN27/Z97G+EEc7AOSsAztrpQvRlNdU3gFS/v9ZkbfHOAsKqvT2pGMON3hty282lvbaKDhqHqqTTW8BLWNSTltllZJWjb5OWiInsJ6bN4CQf71gFtO045NZB4ZHPh3CzGYAAcw/aBRspUeXNtiZFzbWfdVsd8ufsn7GCFDTxo+DAcOMMC8EjwzknLN5ANnBmXdTCIvRiDeyFChLOi3AkikluANh7HhgXnjxM9CEi3ZI6zVvRFmnXE6PBXiRbmtoZrgHkfd2lIXEoc7T1AsqHnaP9M/zcc6tODrP8v5NLSZHipWHW40OXtxEGG2PEw2SklFFlpOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aprHhszq6cMbsZbho6trB4BcvpI+aO2hNZjIJTZy3RI=;
 b=WpA3m+TGnm19irQbIZ0vTPJlUPgW1QdF0qnJkSHyqiq+LkRMKaprfeBYr8e4LE4fA2azUb6MJ4U1rR0Maqy5/XLC3e+crWB/uuRNMIHo51TUo0U4x+tO8Q4xDXTokXNlrR7YaK9EB3S8ka3nIBvGuS+sJ0yY4Lxqs+qfgwFwV6FPsAHg2ma808JF0NWEP/DTXFytCvDeuSeAMB3rXaERuyxE1jgTqcV8kcMz168ALNFGwN7P1zGN/2CHBmcfFGUCOJKDt7wsqjNd0YEhcxT/0VqvlkTJPKzQZVWG8wlcgqojjPKICz9K2gzBikoNzy52eZh4Km/9Md0X23QtAYXnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aprHhszq6cMbsZbho6trB4BcvpI+aO2hNZjIJTZy3RI=;
 b=jiLNREILM/4jtYaoHqStBaeOxlrCfuGW2uxaYWf3TsmjixvUHSzK4JoSRbU1gGV5Rfi8efmxGjGEJ/G4SvvzHL6NeE4mov1XuCv82xIdF2jtVFiK/AUmYNUTqtWArtopbm+yQc7d4Rz+jVl8ipY8tyJOl7IwU2Q/s24HVOZY2J/BtIIxWuUJ/T6HdVLmTt6IssMFjDyNMf8VSQmazd3MY//hI3uV59HiiQixVKVxFc56Y3+gYAtzJrtRCafqWnuf8CYyVnoWCnMHoFQ5SeAplNJeHLJW1fOxHb7Wn44jLd4hunG3nCD8E+ZipIFJ8iduHyCrrQlzjWL5qUtXF415Rw==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 21:16:57 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:16:57 +0000
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
Thread-Index:
 AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAADwcAgAAHggCAAAS5AA==
Date: Mon, 23 Nov 2026 21:16:57 +0000
Message-ID: <17463c67-cd9a-4fc6-8eac-8594a99426fd@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
 <20261123193923.cl2i62lgute6li3u@pali>
 <58afee6c-52fd-49af-b8d2-b0569051f5e3@nvidia.com>
 <20261123210002.baki6f34ww7azjob@pali>
In-Reply-To: <20261123210002.baki6f34ww7azjob@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|PH7PR12MB5976:EE_
x-ms-office365-filtering-correlation-id: 79d0d01d-c40d-432d-2db1-08df49a71b14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|6133799003|18002099003|22082099003|261021123027099003|261021130227099003|261021121427099003|261021135927099003|261022105027099003|261022113327099003|261026121527099003|261102123227099003|261026140227099003|261022075727099003|261022115727099003|261026130827099003|261028144727099003|56012099006|4143699003|10067099003|38070700021|5023799004|11063799006;
x-microsoft-antispam-message-info:
 G77XP/ZE0C1alqqzDPQmRVL7nwYEVrHWR7rYZCn/ITUlpC4r3KQYErzJ0UM2UH9EODNZfj4MngzzH2QMDR7KDIf2XY/hOvrdkVMEPfHmfkl+CrNxoTaiS+j1HlRH9RZPHqlkfvtE+Q03sXCJSmRC5gye7WUFarFMJ1mzNvbErGt0w1/0zZOzXndJDnGx2xtCtdIfrfqCpRiUE7skuyU6SMKyjRinM4qwZz7LUVETsX4Gm7ONwbHqwdBzJB/fLIr5gM4HHuH0EwDyh2f8ujk+OPwe/BVWyFx3+qTBsvppU452wQz3/5PTG+1S1VFawxk85VTaemDfiXoNvg7bnoNNqQs1uCCfiHsgD29zcF6xGCCjemSzMoaJ86RxjCj9tq0pfNaWHp8imHUvSJUtjjeIdefSkpP/1nxcEo22VAB1eODQdueDREM+cDXjRsiYGCTjEBc/jr46oPGoeTNykGG+GYDICQlNQIuW6v+IUZhx/RXDu4wQjddnU5k08HArqiRxhq8AswqV29Pvg6u31VZSN80dFfg0HAb1FbDTal0LVzWsZ3+ugNQqWlrNSzjFcKOvGX+aMo86UO81m+FVPaW+ZoREx643nmnX5jc3+vbCP5Mh2J3/CCWEVxy4ugstE+IvhLQGp0p+IuL0KT1kttejv6+hF90B06ZOkMqLns95/hbWNMtDkQgOB6LVoiNk8prkQjyDRyA9mz8YjyPgcPt4AwBkmycrmuZiPx443vVO0gI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(261021123027099003)(261021130227099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022113327099003)(261026121527099003)(261102123227099003)(261026140227099003)(261022075727099003)(261022115727099003)(261026130827099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(38070700021)(5023799004)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1FuWU0xWExPQ0hoNTZOeE5iYXB1cGdJbmg0VzZVUXp3RGV6b0tPMjNTTzFD?=
 =?utf-8?B?S0ZTTGFMNEdlbmptQXF4QlpVMWZnMjJpcStrOWRMOVY2RVhBM3JGN2d6V0ZV?=
 =?utf-8?B?all2ZS83Z0FkOEdETGs2N3lzLytaV25BNTlDazY4ODY4T090WjRWVTZJMU5r?=
 =?utf-8?B?VnFhNHVnWjRjRkZHRklvU0hIanpQcWhlLzZuRE5wVnRsdlFYdHJBV1o5UVFN?=
 =?utf-8?B?SURXQ2xWcGVWYWt3Ykg3ZE9OVnlRbWU4MDNYY1dMbkFpUEwyVUhYMUs2SnNj?=
 =?utf-8?B?dUc4V045cDBuNGkybUk4cUZwRENJcXMvcUEvdjZ2Y0YyV2dKbXp4aUd5ZVhi?=
 =?utf-8?B?MzZONkVKaDU1K1NiTHBUcCtvck80L2syekM1WUlTVkFlY2g5NkhRb0xjUEww?=
 =?utf-8?B?WDNpZ0V3NVdzUnNJQzJwU0kwNS9CdnVXQytJUWdYMGFib3VPWWRwN0FlS0hD?=
 =?utf-8?B?WWloeTZJYkM0NDBBaDdyN2EweGVzdlBhOXZlSEpaTjhPTEg5em8rYjVtd0hv?=
 =?utf-8?B?aVlQeFh3ZkRtRC80eVNwOTNWMksva3pkK09pNHpGb2dIYnM0OVZOV25yUXo2?=
 =?utf-8?B?ZEp4SmJvMWIraU96VmlsVm9UZUdWeUJvUlVtT3RjT3gvMG9Zbkw4dkJJQTh3?=
 =?utf-8?B?aWduZUhBak9XSlkyRWtEQUxYMDB1RlNSNjVzcVVCb3NkYkJKdFcvRGlUdzBo?=
 =?utf-8?B?b3dPT0djU2xsZnpqU25acVNiZFZFRzhIQ0JZZGVWNC92UEE2NXViN1MwNmRx?=
 =?utf-8?B?NDNTQkpETXhZK3ZPejB0NWl3eWNJNWQ1WkxBWUNZVWNHTkhyQXRrUFY4c3ps?=
 =?utf-8?B?L1lXWCt1R1F6WG9hYko3aXd2MjdQanFrWlh5d1I0VDhLb1cxaVpaOTJZWHEr?=
 =?utf-8?B?Z3NacWF2TDJSQUplL3FodC85UDJEYU1kZzAzM2c1SFRGOHY0M3RsdEFkZEFu?=
 =?utf-8?B?aENnT0JDb0JKM1djUlJJcnJQSzZzWExVWTU5eUU2cHR0U2xXcDM2cnFVK21Q?=
 =?utf-8?B?RVdETXh2OTlaVTBGY1B2dG5tSjJ1OTBpam92WjIwQzlnbVl1eTEzSkJHUkZn?=
 =?utf-8?B?WkpORUFPVlpXV0F5OVFHWTBoSW1yd0Y5dFRGZitvVGllZTRRbnRVeGpzNGd5?=
 =?utf-8?B?V2VPL013bWhyMVkyWmFLZVExY3VOYnp1ajdUdmtJdCtEVFYxeUd1c2QrblJj?=
 =?utf-8?B?VVlJVWw5VkJtYkFiamhNNWtMZVQ4WVhxK2I5TWhOcTBXOWxJL2JFSDc2MmNj?=
 =?utf-8?B?bjJHMEZPcG03c2w3WmZ3ekZaVTBIclNnQ0tNM1UvNzJMdDFIMW5sVnJ6L1hl?=
 =?utf-8?B?Mm9Bd1ZlODh4SENsN2llaDFoeGVNYm93VXpNRGlDQXo0emJocnljeUFsUTg2?=
 =?utf-8?B?VHZxWW5GODA1dmRSczIrRC96cHFGL3RBK1dqVFZVMVhuRVhqL1lsQVBLMmpu?=
 =?utf-8?B?Zk54aVR4MlFHWG1pcm1nZWNBcGh0ODZuSk5KUEFGaklLc0hFN0wxcXlsQWlM?=
 =?utf-8?B?RjZnQ0dQT3NEcDNZdWdWaUlkVmFGdWFxVEJBZ0dRYkM0VEdUczFBRHFiV2M2?=
 =?utf-8?B?WDJJTTdURmZ4UkNyMmZoUG9CU0xUVVhiTWRLYnFheDNNSmJhaVJDbko0Z0RW?=
 =?utf-8?B?cVdadXFzVDhuZTYwOFFlUDZUdFZLajB3QU9udnJLL2lTbFNVaDhoZEhxcVIx?=
 =?utf-8?B?alk3UXhVMUQyV3pwbHRLdlBaTDMwcC9YZk9XWVlDbXp4Zzk3TGZabkVuaTMr?=
 =?utf-8?B?dXZ4UTNIYlZJTGswMCt4MFo2QWZLTVh1U1hRY2hDelE0dkpFdG1RdEpNV0FE?=
 =?utf-8?B?NVlSanlWejZSR1hoekV6cFp6YTArZ3BiWXAyVWsvVDAxbTNmTzJ1UTJYZzNa?=
 =?utf-8?B?VFQ0N0F6TlFYZTVUUGZuSWFlTG03OEJvcTA1WEJXellZY216bEtuV3hhSTQ5?=
 =?utf-8?B?YWFoSmtKTUlBS1NTL20zRThMR3JHSStxWEk4RVZPc3FKS00wdUhRWHA5VVNt?=
 =?utf-8?B?U1B2c2NZRUZuZXprRk1zdlZjdnM2UDFnaGpSWkN1emVWOGxISkJJK3ZaT1Ax?=
 =?utf-8?B?ZUkwUmxEK2NsbUthTFZWZC9EUlhYY3B3YnNOby81d1ZoYVNzN3RqNkVGTEVw?=
 =?utf-8?B?TlV5a0RnOUZoTVFEdDA4dVVONFJucjdFRGs1SC9WRG5MeVJhczNFcnFJTHox?=
 =?utf-8?B?Q0FEeDJHeTV3aTlpc1NhWmM0V25kSDk5TXVBVEl5eXl4YlZxc014UUt4RDA5?=
 =?utf-8?B?ZWQ2ZXFKS2ZqL1FDMHVnM3BvWWxLSzg4U0F2aThVNnJoSVBNNEQ1a2NMM2Q0?=
 =?utf-8?Q?Lf0DSKdy4+PtVqwUGb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1CCA5C40C3FBB47939B188999659457@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d0d01d-c40d-432d-2db1-08df49a71b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 21:16:57.2497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSnmUHzCrY+rc5NvjfboKKVxFyQIrW2KKNxSvN/kC4M8BV/YgoviMRUhQUlzopGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976

T24gMTEvMjMvMjYgMTM6MDAsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBNb25kYXkgMjMgTm92
ZW1iZXIgMjAyNiAyMDozMzoxMSBCcmlhbiBNYWsgd3JvdGU6DQo+PiBPbiAxMS8yMy8yNiAxMToz
OSwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4gT24gTW9uZGF5IDIzIE5vdmVtYmVyIDIwMjYgMTk6
MTE6MDAgQnJpYW4gTWFrIHdyb3RlOg0KPj4+PiBPbiAxMS8yMC8yNiAxNjo0OCwgUGFsaSBSb2jD
oXIgd3JvdGU6DQo+Pj4+PiBPbiBGcmlkYXkgMjAgTm92ZW1iZXIgMjAyNiAxNjowNTo1MCBCcmlh
biBNYWsgd3JvdGU6DQo+PiBUaGUgZGVsbC1yYnRuIGludGVyZmFjZSBpcyBub3QgcHJlc2VudCBv
biBteSBYUFMgMTYgQ3JlYXRvcg0KPj4gRWRpdGlvbiBlaXRoZXIuIFRoZXJlIGlzbid0IGFuIHJm
a2lsbCBpbnRlcmZhY2Ugb24gdGhpcyBwbGF0Zm9ybSwgdG8gbXkNCj4+IGtub3dsZWRnZS4gV2hl
biBJIHN1Z2dlc3RlZCB0byBtYWtlIHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZw0K
Pj4gcHJvYmUsIHRoYXQgd2FzIGZvciBpbiBjYXNlIHRoZSBkZWxsLXJidG4gaW50ZXJmYWNlIGlz
IGF2YWlsYWJsZSBvbiBhDQo+PiBmdXR1cmUgcGxhdGZvcm0uIFNpbmNlIHlvdSBzYWlkIHRoYXQg
aXQncyBhYmFuZG9uZWQsIEkgd291bGQgYWdyZWUgdGhhdA0KPj4gdGhlcmUncyBubyBwb3NzaWJs
ZSBzb3VyY2VzIGZvciByZmtpbGwgZXZlbnRzIG9uIEFSTTY0IERlbGwgcGxhdGZvcm1zLg0KPj4N
Cj4+IEkgY2FuIGdhdGUgcmZraWxsIHNldHVwIGxvZ2ljIGJlaGluZCBhbiBpZmRlZiBhcyB3ZWxs
IHRoZW4sIGZvciB2Mi4gSXMNCj4+IHlvdXIgcHJlZmVyZW5jZSB0byBnYXRlIGJlaGluZCBTRVJJ
T19JODA0MiBvciBYODY/DQo+IA0KPiBUaGUgaTgwNDIgYW5kIGRlbGwtcmJ0biBhcmUgdHdvIGV2
ZW50IHJlcG9ydHMuIFRoZXNlICJIVyIgcGFydHMgYXJlDQo+IHNlbmRpbmcgZXZlbnRzIHRvIGtl
cm5lbCB3aGVuIHRoZSBoYXJkIHJma2lsbCBzdGF0ZSBjaGFuZ2VzLiBPbiBzb21lDQo+IGxhcHRv
cHMgaXQgaXMgaTgwNDIgb24gYW5vdGhlciBpdCBpcyBkZWxsLXJidG4gYW5kIG9uIHNvbWUgYm90
aC4NCj4gT2J2aW91c2x5IGl0IGlzIGVub3VnaCB0byBnZXQganVzdCBvbmUgZXZlbnQgdGhhdCBo
YXJkIHJma2lsbCBzdGF0ZSB3YXMNCj4gY2hhbmdlZCAodGhlIGRyaXZlciB3aWxsIHJlLXJlYWQg
c3RhdGUgYW5kIGluZm9ybSBsaXN0ZW5lcnMpLg0KPiANCj4gQnV0IHRvIHByb3ZpZGUga2VybmVs
IGV2ZW50cyB0byBsaXN0ZW5lcnMsIGl0IGlzIG5lZWRlZCB0byBoYXZlDQo+IHNvbWV0aGluZyB3
aGljaCB3aWxsIHJlcG9ydCBpdCB0byBrZXJuZWwuIEFuZCBpbiBjYXNlIHRoZXJlIGlzIGhhcmQN
Cj4gcmZraWxsIG9uIGFybTY0IHRoZXJlIHdvdWxkIGJlIGFsc28gc29tZSBpbnRlcnJ1cHQgbWVj
aGFuaXNtIHdoaWNoIHdpbGwNCj4gcmVwb3J0IGl0LiBJJ20ganVzdCBndWVzc2luZywgdGhpcyBp
cyBzb21ldGhpbmcgd2hpY2ggRGVsbCBvciBsYXB0b3ANCj4gcGxhdGZvcm0gcGVvcGxlIHdvdWxk
IGtub3cuDQo+IA0KPiBTbyByaWdodCBub3csIHdoZW4gdGhlIGRyaXZlciBpcyBtb3Zpbmcgb3V0
IG9mIHRoZSB4ODYgc3ViZGlyLCBnYXRpbmcNCj4gaTgwNDIgbG9naWMgc2hvdWxkIGJlIGJlaGlu
ZCB0aGUgU0VSSU9fSTgwNDIuDQo+IA0KPiBJbiBteSBvcGluaW9uIHRoZXJlIHdvdWxkIGJlIHNv
bWUgaW50ZXJydXB0IC8gZXZlbnQgbWVjaGFuaXNtIGFsc28gb24NCj4gYXJtNjQgcHJvZHVjdHMg
KGlmIG5vdCBub3cgdGhlbiBtYXliZSBpbiBzb21lIGxhdGVyIHByb2R1Y3RzKSwgc28gdGhlDQo+
IGNvZGUgd291bGQgYmUgcmV2aXNpdGVkIGluIGZ1dHVyZS4NCj4gDQo+Pj4gSW4gYW55IGNhc2Us
IGl0IGRvZXMgbm90IG1ha2UgYW55IHNlbnNlIHRvIHByb3ZpZGUgImZha2UiIG9yICJkdW1teSIN
Cj4+PiBkZXZpY2UgYnkgbGludXgganVzdCB0byBtYWtlIGRyaXZlciBjb21waWxhYmxlLg0KPj4N
Cj4+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBieSB0aGlzLiBVbmRl
ciBteSBvcmlnaW5hbA0KPj4gcHJvcG9zYWwgb2YgbWFraW5nIHJma2lsbCBzZXR1cCBmYWlsIHdp
dGhvdXQgZmFpbGluZyBwcm9iZSwgbm8gZHVtbXkgb3INCj4+IG5vbi1mdW5jdGlvbmFsIGRldmlj
ZXMgd291bGQgYmUgZXhwb3NlZCBieSB0aGUgZHJpdmVyLiByZmtpbGwgc2V0dXANCj4+IHdvdWxk
IGZhaWwgZ3JhY2VmdWxseSwgYW5kIHRoZSByZmtpbGwgZGV2aWNlcyB3b3VsZCBnbyBhd2F5IHdp
dGggaXQuIEkNCj4+IGFncmVlIHdpdGggeW91LCBidXQgSSdtIG5vdCBzdXJlIGlmIEknbSBtaXNz
aW5nIHNvbWV0aGluZyBoZXJlLg0KPiANCj4gT2ssIGlmIHJma2lsbCBkZXZpY2VzIGdvIGF3YXkg
dGhlbiBpdCBpcyBmaW5lLiBJIHdhcyBub3QgZnVsbHkgc3VyZQ0KPiBhYm91dCBpdC4NCg0KT2ss
IEkgd2lsbCBnbyB3aXRoIHRoaXMgd2F5IGZvciB2MiB0aGVuLg0KDQo+IE5vdyBJIHNlZSB0aGF0
IEkgZm9yZ290IGxvdCBvZiBsb2dpYyBiZWhpbmQgdGhvc2UgZGVsbCBkcml2ZXJzLCBzbyBJDQo+
IHdvdWxkIG5lZWQgdG8gcmUtcmVhZCBpdCBhZ2Fpbi4NCj4gDQo+Pj4+IEZvciB0aGUgdG91Y2hw
YWQgTEVEIGN1cnJlbnRseSwgdGhlIGk4MDQyX2NvbW1hbmQoKSBzdHViIHdpbGwgcmV0dXJuDQo+
Pj4+IC1FTk9ERVYgYW5kIGRvIG5vdGhpbmcuIFRoaXMgd2lsbCByZWdpc3RlciBhbiBMRUQgdGhh
dCBkb2VzIG5vdGhpbmcuIEZvcg0KPj4+PiB2MiwgSSBjYW4gZ2F0ZSB0aGUgTEVEIHJlZ2lzdHJh
dGlvbiBiZWhpbmQgYSBTRVJJT19JODA0MiBpZmRlZi4NCj4+Pg0KPj4+IEkgdGhpbmsgdGhhdCB0
aGlzIGlzIGNvcnJlY3Qgd2F5LiBUaGUgaTgwNDIgdG91Y2hwYWQgbGVkIHNob3VsZCBub3QgYmUN
Cj4+PiBlbmFibGVkIHdoZW4gdGhlIGk4MDQyIEhXIGlzIG5vdCBwcmVzZW50IGF0IGFsbC4gQW5k
IHRoYXQgdG91Y2hwYWQgbGVkDQo+Pj4gaXMgb25seSBmb3IgZmV3IG1vZGVscyBiYXNlZCBvbiB3
aGl0ZWxpc3QuDQo+Pj4NCj4+Pj4gRm9yIHRoZSBLY29uZmlnLCBzaW5jZSBpODA0MiBpcyByZXF1
aXJlZCBvbiBzb21lIHg4NiBEZWxsIHBsYXRmb3JtcywgSQ0KPj4+PiBjYW4gY2hhbmdlIHRoZSBL
Y29uZmlnIGRlcGVuZGVuY3kgdG8gYmUgbGlrZSBzdWNoLCB0byBlbnN1cmUgdGhhdA0KPj4+PiBT
RVJJT19JODA0MiBpcyByZXF1aXJlZCBvbiB4ODYgYW5kIG9wdGlvbmFsIGVsc2V3aGVyZSAoaW4g
Y2FzZSB0aGVyZSdzDQo+Pj4+IGFub3RoZXIgYXJjaCBpbnRyb2R1Y2VkIGJ5IERlbGwgdGhhdCBz
dXBwb3J0cyBpODA0MiBpbiB0aGUgZnV0dXJlKToNCj4+Pj4NCj4+Pj4gZGVwZW5kcyBvbiBTRVJJ
T19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQo+Pj4+DQo+Pj4+IFBsZWFzZSBs
ZXQgbWUga25vdyBpZiB0aGVzZSBjaGFuZ2VzIGFyZSBnb29kIHdpdGggeW91Lg0KPj4+Pg0KPj4+
PiBUaGFua3MsDQo+Pj4+IEJyaWFuDQo+Pj4NCj4+PiBNeSBwZXJzb25hbCBvcGluaW9uIGlzIHRv
IG1ha2UgaTgwNDIgZGVwZW5kZW5jeSBvbmx5IG9uIHg4Ni4gQW5kIGRvIG5vdA0KPj4+IGV2ZW4g
dHJ5IHRvIGVuYWJsZSBpODA0MiBvbiBub24teDg2IHBsYXRmb3Jtcy4gQWxsIGRlbGwgZHJpdmVy
cyB3ZXJlIGluDQo+Pj4geDg2IHN1YmRpcmVjdG9yeSB3aGljaCBjYXVzZSB0aGF0IGV4cGxpY2l0
IHg4NiB3YXMgbm90IHdyaXR0ZW4gaW4NCj4+PiBLY29uZmlnIChhcyBpdCB3YXMgbm90IG5lZWRl
ZCkuDQo+Pj4NCj4+PiBOb3cgd2hlbiB5b3UgYXJlIG1vdmluZyBkZWxsIGRyaXZlcnMgb3V0IG9m
IHRoZSB4ODYgc3ViZGlyLCBtYXliZSBpdA0KPj4+IGNvdWxkIG1ha2Ugc2Vuc2UgdG8gY2hlY2sg
aWYgdGhlcmUgYXJlIHNvbWUgb3RoZXIgY29uZmlnIG9wdGlvbnMgd2hpY2gNCj4+PiBoYXZlIGFs
c28gaGlkZGVuIGRlcGVuZGVuY3kgb24geDg2Lg0KPj4+DQo+Pj4gQW55d2F5LCBJIGhpZ2hseSBk
b3VidCB0aGF0IGFueSBuZXcgcGxhdGZvcm0gLyBkZXZpY2UgKHdoaWNoIGlzIGRlc2lnbmVkDQo+
Pj4gZnJvbSBzY3JhdGNoOyBub3QgcmVicmFuZGVkIG9yIGV2b2x1dGVkKSB3b3VsZCB1c2UgaTgw
NDIgZm9yIGFueSBzdWNoDQo+Pj4gQVBJLiBOb3dhZGF5cyBhbGwgdGhvc2UgZnVuY3Rpb25hbGl0
aWVzIGFyZSBiYXNlZCBvbiBBQ1BJIG9yIFdNSSBBUElzLg0KPj4NCj4+IElmIEkgdW5kZXJzdGFu
ZCB5b3VyIHN1Z2dlc3Rpb24gY29ycmVjdGx5LCB5b3UgYXJlIGFza2luZywgaW5zdGVhZCBvZg0K
Pj4gZ2F0aW5nIGJlaGluZDoNCj4+DQo+PiBkZXBlbmRzIG9uIFNFUklPX0k4MDQyIHx8IChTRVJJ
T19JODA0MiA9IG4gJiYgIVg4NikNCj4+DQo+PiBZb3Ugd291bGQgZ2F0ZSBiZWhpbmQ6DQo+Pg0K
Pj4gZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8fCAhWDg2DQo+Pg0KPj4gVGhhbmtzLA0KPj4gQnJp
YW4NCj4gDQo+IFVmZmYuLi4gc29tZSBtb3JlIGNvbXBsaWNhdGVkIGxvZ2ljIGJlaGluZC4NCj4g
DQo+IExldCBtZSB0aGluay4uLiBJZiB5b3UgZXh0ZW5kIHRoZSBkcml2ZXIgdG8gY29tcGlsZSB0
b3VjaHBhZCBsZWQgc3VwcG9ydA0KPiBjb25kaXRpb25hbGx5IGJhc2VkIG9uIENPTkZJR19TRVJJ
T19JODA0MiBhbmQgc2FtZSBmb3IgdGhhdCByZmtpbGwgZXZlbnQNCj4gcmVwb3J0ZWQsIHRoZW4g
aXQgc2hvdWxkIGJlIGVub3VnaCB0byB3cml0ZSBqdXN0Og0KPiANCj4gZGVwZW5kcyBvbiBTRVJJ
T19JODA0MiB8fCBTRVJJT19JODA0MiA9IG4NCj4gDQo+IEFmdGVyIHRob3NlIGNoYW5nZXMgaWYg
c29tZWJvZHkgY29tcGlsZXMga2VybmVsIHdpdGhvdXQgdGhlIFNFUklPX0k4MDQyDQo+IHN1cHBv
cnQgKGUuZy4gYmVjYXVzZSB1c2VzIG9ubHkgVVNCIGtleXdvcmRzKSB0aGVuIHdvdWxkIGJlIGFi
bGUgdG8gdXNlDQo+IGRlbGwgZHJpdmVycyBvbiBsYXB0b3BzIHdpdGhvdXQgdG91Y2hwYWQgbGVk
IGFuZCB3aXRob3V0IHJma2lsbC4gKEkNCj4gZ3Vlc3MgdGhlcmUgYXJlIG1hbnkgc3VjaCBsYXB0
b3BzKS4NCj4gDQo+IEFuZCBhdCB0aGUgc2FtZSB0aW1lIGl0IHdpbGwgc29sdmUgYWxzbyB5b3Vy
IHByb2JsZW0gd2l0aCBhcm02NC4gQW5kIGRvDQo+IG5vdCBuZWVkIHRvIHRoaW5rIGFib3V0ICJ8
fCAhWDg2IiBwYXJ0IGF0IGFsbC4NCj4gDQo+IEl0IGlzIGNvcnJlY3QsIG9yIGRpZCBJIHNvbWUg
bWlzdGFrZSBoZXJlPw0KPiANCj4gKEknbSB0cnlpbmcgdG8gc2ltcGxpZnkgdGhhdCBsb2dpYyBh
bmQgc2V0dXAuKQ0KDQpZZXMsIHRoaXMgc2VlbXMgY29ycmVjdCB0byBtZS4gU28sIEkgd2lsbCBr
ZWVwIHRoaXMgcGF0Y2ggdGhlIHNhbWUgYXMgaXQgDQppcyBub3cgaW4gdjEsIGFuZCB0aGVuIGlu
IGEgcHJlY2VkaW5nIHBhdGNoLCBhZGQgdGhlIGFwcHJvcHJpYXRlIGdhdGVzLg0KDQpBbHNvLCBz
b3JyeSBmb3IgdGhlIHNwYW0gaW4gbXkgbGFzdCBtZXNzYWdlLiBJJ20gbm90IHN1cmUgd2hhdCBo
YXBwZW5lZCANCnRoZXJlISA6KQ0KDQpUaGFua3MsDQpCcmlhbg0K
