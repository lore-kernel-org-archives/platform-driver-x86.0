Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466297;
	b=MUDzp+RrErruKlP9dfWpOF4kn7MBkV3inMjurgZKZSmM4yHYw+j+TyF1rxv9dJavaaSo
	 3RsmTYFZc+1laRp8X62IrlsLetsRGVFQDTLpPseXqpJwY0wAanpfVARAg62g4tgWIM8/i
	 BFc3Ib913EVJM/jeu3Ie9yZQVGUSFk2UwQ49uBoKRDeTZTEXl3OBSH7SO1vrG+W9JQRy9
	 AewsbNsFtHOLckPr0eHeh/EWutBmUiTAd0RyYEJbPVNr6gLqaagrbEca+evIElz9oSjZL
	 yf0m+uReY70u8i4Irgx/53lDs/1yPTi6476nR1AmPj4qEQRtvngLRwDctThK9Dal9EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466297;
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
	bh=3uiVYVGLuJUjkBKdK6yOCu3vlok/42n3Ulp6HMA+/Tg=;
	b=I1G43JjpfOqXzmBr5nzT/rRcNIxik07xKiNTglx4V5+6p1UI+bTS7oYt87aGyobFfHXJ
	 zJLwP3B81CZtR284cW6zWow7qotpnp3bW3NVPgdXwMuzLE+8hkGWkjFCBKsfWtj+5wQyW
	 pVwmKYUhPhR/CkZcfeQ08sele9eyv4aDxUACwF7umO2fwx9LlPp5o5w3AyNE9nLmHPej4
	 KdseYPC4zcr92MR4UXe7HOWDogF6YCMUpqPb6glLpB75I+/ikrzTxQdx7j0LXHDxm0Nwi
	 WWAbruMoDP7ZIHWeadrP2lXwNM3r1tqlOTp54ZOJtIplyy6zavCJZtuIB4Vvx4KM2yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kgzc93ZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED2606A31E;
	Mon, 23 Nov 2026 20:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73ED2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kgzc93ZE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaMQMnGctgO7SasE0+gWdXNGyNEjuHc1b3oPM1MogwCYoH04FSQtiahgkebzqTLGIXoRAmkQZlviZYq2uLhEScI2EjC6uyo5+YdujRcW3bopX6EsRZDt1weEXd1cDw5ljkHe27lk040SUVh3V5XzM2t43FI/vSFaN5WvAEHObfjIy5iO/UHOFBGaB5Ah/ufCIHNtDBdDzdCZGwIkFtX1B7s4NK33s0Grm0HJ0MGzetLoyYklqR9M3+oeZxoav8NQL6Qtav5n2Ogszz4RPXj3GouviLy1DAatxvL0NLh2o+dESaa4Xf225pesMgy3kPY+ijtOq1W1XOunVWYBoVnlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uiVYVGLuJUjkBKdK6yOCu3vlok/42n3Ulp6HMA+/Tg=;
 b=Mu9bw4sZR7mPt8uEa/9NhfX0uEndU2nZRNYF0kh9pewyYgJ3HOqrJ04xO+yl9KZagfsXBvwUfaAfoGdSUB5TTnivav7akRfP7Slpx7shTAhcfIkKWFYH7UdB3OmrlfOQ2voUbZ79pGL1dxAg8W8n33xETIRq4ObQEqxL97XcO1fIlNzYvsHjIxEHUybIg+0ueuefSDMbDDpHiCJDCW3stY7z3DjaC52woibIwYYSPxCGIZh8YG9LW5oOQncRVDi02pwz2LmZRgPTAODjjhrzHYzS38HTqYTSmpn81puZm3mud1OuStDJoQo16D0PQxKqd4uM7giDRPY2CX3ytYQAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uiVYVGLuJUjkBKdK6yOCu3vlok/42n3Ulp6HMA+/Tg=;
 b=Kgzc93ZEwecQbinHyWFLwLDA8SikTPO2PX6b4Zjz1GhEDxs+wu5icH4Jf2WL9SrXpQX3sIq0/utXEF727r5g6CH87TYwYlS+xKAd8xnI60ep5V0gZg8ifdp7KrekDrs+joYJCyHtYDRB2bmqxhq4JXQsLxFz9JjMFdN25fe8MvHcF6FObFr6SlTCCeYGQ+0UwSrVjgqUCrywfHphXVSekuH3klpIBlJig92R7Vhl25NO4tG1ntpZPbqL5eGegMh9YQWyoK+PmSV1BNm2UnvCevZgofM+14hvAwnrhBNI3rjBV+/UTit2VtcI9MmpoMlxToMHl3FA82kKbhMt9XJchA==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by LV1PR12MB999306.namprd12.prod.outlook.com (2603:10b6:408:3f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:38:13 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:38:13 +0000
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
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAAEG6A
Date: Mon, 23 Nov 2026 20:38:13 +0000
Message-ID: <ce653798-f777-45a3-b209-e0c0bbbd7dbd@nvidia.com>
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
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|LV1PR12MB999306:EE_
x-ms-office365-filtering-correlation-id: 25f81dab-95cf-4db2-88af-08df49a1b219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261022105027099003|261026130827099003|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022113327099003|261028144727099003|56012099006|10067099003|38070700021|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info:
 VlVbjCbSDJotIpRcW5uvAOsdQ1mkULT4nGsX7iBo4lbXNFs3BHbfNGtsn9Pzz1r1mh9GxZVatxmBIeQHlPBxUT7zhwisBFHsRoO25blSlOzHcvGflsGNfF1oxNoTS3tQ3t0nsutys2riciwVs82e5fol+vSKvTfGzz8IXhhDm5mRE8uTbJU5VXiMBpo8Xm67ab4h5p6+JGiKn+4GpxfbWWOr39Uh7z71s25q7c+Kktzz3MJWUVJBdkl+oVLL482ZH3aW1V2pVI1yHouNiBvU26+tSX6VFp2U5V1NlPAczl99hN04VL+lQ78kn6sgoKEKvtMPK17QSP2VaRUKu88EzMgeA+1RlIE/f23iFsE1UhjLoqt0FQpNBql2Pl5fuze3KtIu7tDU8OfqFQcJpIpPL+6S6fb8v9I/05Wj6D3eLBDaGN2MocSaHls/20956o/D70RYVWx5NTn0z0zLlj+Ga21oXtphj3hJ3bKXwgeh9h5+hnU/NwG4ZT/o60guiBxWxLUUGcDHqtn6fPNePSZQH6+yb3Tlg3511irIZbcKOKWt873nvIOrZIidwKJB54Q6tAeu9jByDfapjP3WPyrV+rQX6796MXMpzEDf/sefO29YWnU5oQBz7fscyUMDviotO/x4MN3HgjoCHSuQm/PyVcIakwH4xjpvmWdVYAMVcEqwhxhWx6mYCwIPpwVWzYy3SIeFsN4QrT8xgJSQzhuoSQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022105027099003)(261026130827099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022113327099003)(261028144727099003)(56012099006)(10067099003)(38070700021)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUlvYUE5UisvZUpGWWhCMmtrMThTMy96RlpRYTFUQ2Y1ZFpzd3QrQlBQQmFC?=
 =?utf-8?B?b0xVQTVQRVNMYlpTalpURUR3Mk5jdzh0Q091cU1xM1p3cG1EZ2w0VElqWEcv?=
 =?utf-8?B?blRpZEc2d2JFd0RGdmhzajk4bjBQck1zTjBJb1d4alFJb215NE1LVDR4MWo1?=
 =?utf-8?B?cVNNMXZzYkRrSUtnNWZvZFVUMkVKa1FwTm5IZ0hzRWV3QzA1Z3pPZ1JTekVk?=
 =?utf-8?B?Qnl4WDM0WWV5YkNWZE8vUEx3QTRuNjNsb1JCL2xyenpWK1BBNHZwS0t3MU42?=
 =?utf-8?B?ZXRvcUlISFRVMzBnNUlhNWxXQndxdGo4MGhIbU02M2UwODdqYUJPRW5FSVdH?=
 =?utf-8?B?ZU5wODBtak5tQWZuWHQ1M1hLNHJGNlRJQ3VLUkV4VzJXRG43cy82VWMwQm5l?=
 =?utf-8?B?M1MyQWNnRzR5c1hjMGJ0a2R2S2pmV2daRnBXeDgrRTFzUWREV0xGc0V6VVRt?=
 =?utf-8?B?bDZMV0FnS0h5eHFQTU5ZSk5QRnd3Y3h5cFRyWVRFSzBHQmw4bmgxZHpFdTFi?=
 =?utf-8?B?ZEROM0Y0cEYzdXNyTHNXNkNpeEtxcWZEdW1sT3FaNEE5M3ZpaGpkZzlFYmFX?=
 =?utf-8?B?Z1Nza0JIRS9SY1RMeEZJWVZ1aXlKL0pnWXJkd2FKYVhwZVFWSkQyNnVXdWll?=
 =?utf-8?B?Q1Z6cTZ3YlBDZUFVMk1QRWdlbTV3WnN3M1A3ZFBwZi9ZT2JzcmNvNmdjK2dS?=
 =?utf-8?B?VStpeGEzRlRoditTWEFCOHFFYmNaNExpTnpYU0o4NXh1VjJURU9tWDVvRmlX?=
 =?utf-8?B?YW1vWmJWTVpzYlE1UHljd1h2Q0dZSlM1N3QxQjYwNUYybnl0WlJtaTRUOW94?=
 =?utf-8?B?Z3E1UWFBdjVEanVvRVliWndQWm5hdE9nZVZqaFdiaUxGOEFSclFyemE4TkJp?=
 =?utf-8?B?N2xES2VkRkVmT2FBN3RFRjIySmxyTGFHVEQ1VFh4N21DRFNtMVM0dDVYcnE5?=
 =?utf-8?B?dUFTWlFocVc0MlFZMWZFRnBpU0gvRUc5RDcwNkVFYWZKRWZ4Sm8xMlN6eVFZ?=
 =?utf-8?B?d2pUZFZ1SUV2UDBWSGoydHJtdzFuOGN4UHZIRnZWMlljQ1NPbXZ4ZG5JazJE?=
 =?utf-8?B?T1lkemx1N2FJYXhwMzV2akpLNnMvWmdISWVoTHA5SW5uT3lianZRVnVPMzdI?=
 =?utf-8?B?dExnaGMwS0dTcU5mck90YUxENC9BalUxS0Z6MGtCV1l0Q0U1VjRrTzBTM1V2?=
 =?utf-8?B?TkdNeS9aNUdrUHNRdHk4dWliK1ZNMWFnSmltWWdaTHZtTnFROUZYNVZqSTRl?=
 =?utf-8?B?S2gvUkpENnFKVTNWWVdsVzRKU2toMlFtUk94bW9iMVVtZ0QvZXlYcmluTmRi?=
 =?utf-8?B?MzFNWmtlV1hwMzZIMXVCQXlIMTBtMm5yVm1OcnZGL0JTMDFmdk9PZDZUU3hZ?=
 =?utf-8?B?Wmh5eVREOXI1ckRuN1hhWTE5eVpwdWQvb2M4cnJvWGFQT1lJdGJsZzlocHVI?=
 =?utf-8?B?T3ZhMzdqM2lBMFNRb1hXakkvYStXYVdTaUozTEcyMDV5SWJoemxITklmcHd3?=
 =?utf-8?B?Ykg3UTQwa2hlYmEzeXYxSVc4SmIwc2ttMGJaZUpqNnJZaW1tSE0reVZFd2Qy?=
 =?utf-8?B?Qk9iTmtjNjJlSUpaK2t0T1UzUHlSeHE3WHdzZTZrTnZLRUdxWmpLZVdHT3BL?=
 =?utf-8?B?VEkrOWxZd08rQzVicEZ1Q0l4eTRNYTNxVE5WWXUrblJzRklYSzREWVZFOTdr?=
 =?utf-8?B?WGFVVXlqcGV5VjdKY2dpYzZIbFh5QmN4QXlQQ3NVZ0FJZnRQSENaQTFUYk9o?=
 =?utf-8?B?eWorMk9ReGdhcTBYcDJEMFo1Wlh4azY2ZzRIOXBRbUJTczh1UXRhaDVlQkU2?=
 =?utf-8?B?SDVTeE80Qk8rZzNzSEp4L21oNzRzNlcxK20zWDJvcVEvWGhnYytHOUowQjZa?=
 =?utf-8?B?eVh2TzhmM3YyUno4QVg2QnZNRzhmNkRJRzBRRlhGaE1kdldHckljYkxiOUlx?=
 =?utf-8?B?c053MEZKdFJ4UjIxa01tWktrUTFHb2h2NkNKMEMyd3lDUXNuVVRvUmFwalpj?=
 =?utf-8?B?MGlXNGNoTWR3cGUvbE9qbWhzcENnanB6bUtNR2xYQXVETm9RNWg4cmtQdXB2?=
 =?utf-8?B?K1RjK2dXNWIzL2dMdG1nZnc5MEdPa2M0ell2M2JsczhPdTFvRzNwa3NQZldL?=
 =?utf-8?B?NlM5U2JUbWc3VEs3VXBLMUltQXl6dXp0Qmg2S1hyeEg5ZjNFM01HS0ZZb1R1?=
 =?utf-8?B?aXppWjdsWDliRElqU0dwdDlNcCtaVGRhYS8rTVpVb0hOMmpoaEFIVDhwbkxR?=
 =?utf-8?B?dGhYd2o3MjVjUThhQnJnNzhwd2ZaS2Y2TkZLNWFUZkk2WkVCdHBXYjNEYzdr?=
 =?utf-8?Q?mMymINKxvdmiPEohbS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2C61EE7AEB06E43B4C767BD5B215503@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f81dab-95cf-4db2-88af-08df49a1b219
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:38:13.6260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAMsQ6dPEFss8enrmji3o0qPuVOBHhyFajMGJ7ybDkK0R3bTm8V5lQF6XEEgW46U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999306

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
c2tpbmcsIGluc3RlYWQgb2YgDQphZGRpbmcgaWZkZWZzIGFnYWluc3QgU0VSSU9fSTgwNDIgYW5k
IGNoYW5naW5nIHRoZSBkZXBlbmRlbmN5IHRvOg0KDQpkZXBlbmRzIG9uIFNFUklPX0k4MDQyIHx8
IChTRVJJT19JODA0MiA9IG4gJiYgIVg4NikNCg0KWW91IHdvdWxkIGdhdGUgYmVoaW5kOg0KDQpk
ZXBlbmRzIG9uIFNFUklPX0k4MDQyIHx8ICFYODYNCg0KYW5kIHRoZW4gYWRkIGlmZGVmcyBmb3Ig
WDg2LCB3aGVyZXZlciBpODA0MiBpcyB1c2VkPw0KDQpUaGFua3MsDQpCcmlhbg0K
