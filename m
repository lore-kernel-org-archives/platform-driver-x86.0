Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637699;
	b=cWk6kUdrTRyUW9KMS3ZrPqT8fRJBpKYv4wHVSW+ByoEvUHoC+9EWdDUaA4AB0gxbfg9F
	 qJGQOA9cTR3fsVw8hNC3CAwDoV8AoYgGagTQsXMXOnMckqlqPa4LElK53Mf+wBbdEaleh
	 BDeALl10TK2Y8NvQoYQm5C34f7qYjtkc1Qdfl8/YC55MB4arpNO/R1yKBh7bDcd+sME6M
	 +F5nqX9QN8R1sAhUnotTWYp1gdXZSbwNW6tHcKMwAJCNCcHc4d6LyETLETZuIClM7P9Mc
	 dMd0vBfLXUd84Wpeias3fYW2HmXE7fUCIUOdgG2mmOaiT8cr1XQwc6HhrutJjBpUUrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637699;
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
	bh=m9Quat5j5EDf0Jm85qWi04QfMC5QCWQxkBEHSSpq7VM=;
	b=c4nAzXhFuDRqvVkwQjMuboQPed8gtf+0J+wiFVvkLWyegP8ayoEl/qkHJ0DrypFfbglr
	 kWUPjtuoB/2khEypsElCczhoOuByxrBcJB6vqZgjGOboB9TH9FHiI6ROdPXMfNC8L91Ca
	 34fgOKH/HwhXztaqPkxc8FGuJ6Wqvl+SgqpO08qD5kwNBERGIzh+xC5q2VbXJ6oeUdGNu
	 hq/7PXmw4kxLE/3BYryiJtKWI0qEzGGQ/qgvNRID7LjGHLITkFrQztvhnkd9aVuJ/K5cc
	 YHgqnms7zjuJbwKN1RW1GabRCdso46bTTggj/U3p4JD1VA5EnDY/6xkkydCHvo5T0vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lSlTdcPI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.42
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F5606A321;
	Wed, 25 Nov 2026 20:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lSlTdcPI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzkk/7xP/63fFxKjQlZREGPfKT3GrYm1kfsihx5jO7KZz/n/SxeYHE0a6PVRVRPFBioevvwNhVHh6Xa+ReYZhchnLf02Xfxyxo6Ok5mH5iJjCZsnFnXk18ZFkxzgQzOwkdho6WW7SWhdI1OkEPlvVLyf4njoQQdsxq7iJxdVhmQLl9aUdalCYqzf/LiIchQ7471mNT5VAGVMg0mMe2Q20upzUNc2Gf2MMVi6iAIMmSya9M2sWbMRPkQTDY2tH0Q6nCbaiqHeudjlhWGcQhSyG2MMHfMeKB1p6MfdUyjORHcDq8fkhCYylI1+LAMCYIJSi2VJWIWp/t+o8XUq7beNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9Quat5j5EDf0Jm85qWi04QfMC5QCWQxkBEHSSpq7VM=;
 b=NIhz4NFDbOO+Aot4NKvElMvwH3cTEX29kAX921qs7zvPmrBWbzduCzjn4yMio/z0W78eY66EdDA4JCXRYHfBGK12xynrixvvIvC3LKhQKNw8BXsvazl+oqI6oCN8rVXBKcD465EcZOzymoTpTtFVJEE8ybq6MoekPoEZnUsXL5vnKLQT7wtpHFl3sjYQe3OxFn7a8isfYTvg1u49GqTC5J4FX4S2FjRhxJhTJI5PnZICssJv+HSS8+ugLOjg2IwiJObKsT49ggYGauVuGbosYmG0x6DUSXTDiUcldbSiu25pzp6ZdpkuNtD7DV1EMebdEMPSPLACA1aLDKsTmOCA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9Quat5j5EDf0Jm85qWi04QfMC5QCWQxkBEHSSpq7VM=;
 b=lSlTdcPIZLFKzpP/YZTLEa9tsWxG2+YskeOVTaTPbd7jB7dQVb2ZT9tk80BumUau6h4chAPPG/giNc4oILxREB/9x2D7asCrfXc+fvQDrNKCy6QEMOfwPGeTDlj7btbwEWg2Z26d+Sw5ecigaWG9OXQ6umAbvqNSAnf026Tsim9DCE2O6YZniKynOB+3TD/sUMKWIEPrJb7CTzSDdEeZ8qC9ClCZEXvcJ8nVbVvHB27RVJM5TzrdV57+jNuOlDrg4XqcHFjHy0KacrbNsueLHkLN/0JnHZCmMxuSKzozWFS2vm5aJP1/hK/j41tzXUdXHGgNfTfRLQmecuqi7xRGtA==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by IA3PR12MB243666.namprd12.prod.outlook.com (2603:10b6:208:712::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 20:14:55 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 20:14:55 +0000
From: Brian Mak <bmak@nvidia.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>, Prasanth Ksr
	<prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Topic: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Index:
 AQHdeUxcJjeWavWmSUeVzbExQlxH3Lc4i6SAgAPKggCAAPelgIAAB+2AgAAuFYCAADcXAIABhcaA
Date: Wed, 25 Nov 2026 20:14:55 +0000
Message-ID: <168b136e-76aa-4fec-853c-2acdca0308d5@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <f3dc7e25-9c22-4b1d-9555-e83db82d05a1@gmx.de>
 <792a7fdd-b2a0-4a2d-88b3-7aecf1af3d7c@nvidia.com>
 <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
 <a851c757-3110-4ecc-b920-a98736b190b5@gmx.de>
 <f95b8efb-1719-4b39-9c23-5313903d1d4e@nvidia.com>
 <a6458b0a-125b-4df7-b41e-a4975fe8905c@gmx.de>
In-Reply-To: <a6458b0a-125b-4df7-b41e-a4975fe8905c@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|IA3PR12MB243666:EE_
x-ms-office365-filtering-correlation-id: 44047297-8ef7-41b4-cdec-08df4b30c56f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|38070700021|56012099006|11063799006|10067099003|261022113327099003|261022105027099003|261021123027099003|261026140227099003|261021121427099003|261028144727099003|261026121527099003|261102123227099003|261009223027099003|4143699003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 5kDXQF+Gfzh2WXMA3WrUExSvM+IJVY9OM45BZTwCMMYV6O4b8IP0MR11BKJOGwILRjiys6R+umpf2kpcHouL9K2eWYFT1Gejd42mV1BcvOyZcuVfaQNMnpdzF0mywDRtR6ZLSVynXN32jpekbIvQbZQOBQ1zJYVl44AauBmdBLFX2riaItxvB1dp6VhEFU5f7XF2ZYwMStiekQF20YcottTC1QEB00nFeDTk1TCVTSK+ipxQ73UjG2Uie3XxWO5s+Y3zVrGartF4Ph3cnInXXrAWDt2zGQto0W+Uf0pjx2ObGFOT8WSpBPvnM5qHHAg54KGN/T69ZCctMJZD7Fr/Vp90h8QJIcoTt5AmLgD0Yxqq2lBlrHSXB1/OK8U1lR8BVoSLpKG1VJZfSXUqk1KWfKBzJy5Xfy9dmGQ6e+NQ0C5UQ7Tli3n4zrBCt7Ymp/ZUcBabgAmqj3obdS+XcfOEEUz1Ksf3YqYmoOxwFcRtEucL30kMh/g+aZNwkbFzdLQckBLbSftgliCoWZBYyW/jRb9G5eUygp/JMERmSzuFXthjundCceRksCDj7csI7l3P3TyVYy3WRdm9VhArrPFQDyvvaS4JYlpwM+TbKCirjs0y7FhRW1RzjjE7pUNVrp+it6ZhBDupgW8qcjmMXNxOIKVUmWjjaUwOgxCKjIOzhZ+GCRuzdKHpIC7PEy2vWF3rILgyO3981RjpuMR9QL/BqzFwzWw02h5vKQtGOCmX8aI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(261022113327099003)(261022105027099003)(261021123027099003)(261026140227099003)(261021121427099003)(261028144727099003)(261026121527099003)(261102123227099003)(261009223027099003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0svWnFGbmE0em9WK1ZhM3N3ZlhtMWlucW9lQ1FBbjdzQTdnQkZKcUNYL3o1?=
 =?utf-8?B?aWMrR091ZzBLRVRxVlpKL0cvUElpY3krK3UxV3VTRzE5UUZYc1FlMW5rQWky?=
 =?utf-8?B?VVpFM3RVQkErTnhsYWxuWUJOUnNOS0ppSHg4Q1BjMlltUmtsS3NoQnIwZjhJ?=
 =?utf-8?B?ZU5QRnlabUFjRmx3cVpNQ1g5VGtEeXc1am41NkdNaG9JbkUwejN4MEdnMlBG?=
 =?utf-8?B?RWk3dTlvd1A0SjV6eGh0Q1Zvd1ZBVFFLTk1pVkRwLzhLaTFIejFoWUM3amNU?=
 =?utf-8?B?YmhTNmtnbGowY0wzMDZvbTBaeTRnMThzN1ViS1RQYVZJeEFYOUdrQUc4Vzcx?=
 =?utf-8?B?YTlYSk0zeGJkdjFzVUh4bExhVHg1dkFKVi9hV2dBS09qUy9Pb3k3YnRJUXlx?=
 =?utf-8?B?cDBueWpzVGJEdGNML0xsK2pYb3k3ZG5qNFBPbDNOb01ESVZYNU05aGpDVHhY?=
 =?utf-8?B?aEtyYkpQRWRsK2dpWEpWZ2cvQXd2ODF6ZGhTOXpCczVkcE83dDVQMkFpM05V?=
 =?utf-8?B?NVFNVXVuQXI2WWtYckNxcEpWVE4rSnViM0YwTkNLS2JPdmVZQ01MbVNZL2x6?=
 =?utf-8?B?bVUydzIwZE4xNnRuTjhDMnQ2QitRYmwrcEhWa2Z0MzZ4eWU3WkQydnpDRzBv?=
 =?utf-8?B?YWhHcVA1UFVIMk1PTWpiWEEwbnV0YnlJU2RqaGpGazBoeHhML0tDUkZsN1Vj?=
 =?utf-8?B?WEJDMGNZOWpPdzFrcHhvMFZTaVlQQ1pwVFRMR3RvM0I0NzFLcWxJRnU4WnRV?=
 =?utf-8?B?ajBBVnVRSGtwNWF6RXVoQ3l0N1JENjhSS1ZCNDZoamtCSHc5Zm5GTURlT0lH?=
 =?utf-8?B?SElzS3F1b1NDQndYV0NncE1yaWhQQXpUT0dHUjdkeG1nUll4SWhjdHdJN1Rs?=
 =?utf-8?B?RkN5S1g0alJ3OUJzSnhQMVNpQ3dZcEFjZXpmdWVsT2dnUDgvMER1OVNtRDla?=
 =?utf-8?B?Z3d5T3U5WFk3Mi9qRFR0dFlTTGhsbGJETjJjeS93ZUlBMnJvYmYzY3E3ZnFQ?=
 =?utf-8?B?c21YZURiQ0Q1U2QvMUNTZHc0VWg5UHpMYnMxc1JxeUJPUGZ0aUwvdEVTQ1Vo?=
 =?utf-8?B?eEU5K1h6OWo1SFBBeWxNRXNlcjR2RFZFZUdJejBNMSsvN2wzRXg5cUNURU9W?=
 =?utf-8?B?T3NEcGZvZy9VbExYSWFtcTJmd1dtMHVlbS9GSTQzWTg0dTk0bEVxTC81dUwy?=
 =?utf-8?B?a3lnczBHOFlQT3hBQXF3OXNtZVB5eEIxZnVvV0ZGbjhDN2xuYkhsUjNEYUtj?=
 =?utf-8?B?WlhTaGVrQmJKcDVVV1NCWFhVaElhUWV1NkpwazBWWG1NdEIvSitWVkprUVpw?=
 =?utf-8?B?WUQ3ZzVSTHJUcHVFMkZnSUhwdFB5L3p0eDJQT1VlVWJILzJBdVhYajdKRW5k?=
 =?utf-8?B?R1FlR1JXVi9FNnlHN3pUa1pYcEdYTHRzTmh6c3pYUnZodWJ6RXV2ODZvWURS?=
 =?utf-8?B?S3JQdDUwd1VSU1JtK1l2WlNrdUhoeU01dHY0Y0N0R3ZHODFJLzVuQU5YbmI4?=
 =?utf-8?B?akFnMkdVUG8rYzEyVnN4M1drRlVuSXJEOHp3Rlh3SFBROForSlEramdtckZy?=
 =?utf-8?B?NVpDWk9MdkpHY2MyOUNCeHBseXZqM2cwZnJ3T1dDc2tseXo1N1BiYkcvOTFN?=
 =?utf-8?B?bWY3VVR5ODBWYlFCcjNUNmJmbmVCMm92QjRHbjhCc0V5ekppTzJOeUVvNnRx?=
 =?utf-8?B?ZXgxSUs5VXRWTDJ5M0RPRmdsV2dOZUsrMU9jL2hKNnRpekhjcGp1Qm56UHN2?=
 =?utf-8?B?STQyb2lLZ1pDOHV5dzQxOEVtbkZBeFp3eEJPOWpsbXdQYkxZekFTSURlbWJP?=
 =?utf-8?B?UGYra1gxMlVudWtiTnU0VFZCcWpLS3EyTWQwSlAwT0FxTUxGRThtdXEwVnV3?=
 =?utf-8?B?VkV1OVZXbTR1RlhHRlhwNjRrUmJ6N3pSSktPemV3andtTjZxY3hnTndjNFJN?=
 =?utf-8?B?RG5zZDFJTGc0d3JpMUZtaUF2UVRQdlkwbFFwVFA1NVRPYXJjRStoLzgvY3Zz?=
 =?utf-8?B?alpxNkMraHIrdGFVNTZFQkVnM2F1RVI4eitIWEV2aS9SSitVOGI4YkFJOHlZ?=
 =?utf-8?B?N2JKYXlXUVZuSXJLWWpvaWhtcGlRSGd3YWtyckNYVndtSkxSLytCazJFZkdU?=
 =?utf-8?B?dE5ZaHFYalZxTllNUDA1dDQzNFVON20wQkhCdUNMSTJlaUozUnpKRkxxdnVW?=
 =?utf-8?B?ZFNMbXJzQUVBR1NDYXdSYkVlY2pZZ2dDa3pPekRpNHVDTDdZN0NCRTUrUmtO?=
 =?utf-8?B?d0daY3lnVHhVMVJySXpHenNSeklRM3FvTlphUlEyb2ZPM1d0S1BWT0NLMFVi?=
 =?utf-8?Q?F+wvqGNY7Vq76Hg2EM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <653F03C983A7E346A4BCE594AA4A1CC2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 44047297-8ef7-41b4-cdec-08df4b30c56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 20:14:55.1343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GrJa6tELRHSR63hgzFCu9GF3wFyGTRmLO3H85OvChOHHlKS0edGYHBjiP4M7c5QE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB243666

T24gMTEvMjQvMjYgMTI6NTksIEFybWluIFdvbGYgd3JvdGU6DQo+IEFtIDI0LjExLjI2IHVtIDE4
OjQyIHNjaHJpZWIgQnJpYW4gTWFrOg0KPiANCj4+IE9uIDExLzI0LzI2IDA2OjU3LCBBcm1pbiBX
b2xmIHdyb3RlOg0KPj4+IEFtIDI0LjExLjI2IHVtIDE1OjI5IHNjaHJpZWIgQXJtaW4gV29sZjoN
Cj4+Pj4gQW0gMjQuMTEuMjYgdW0gMDA6NDMgc2NocmllYiBCcmlhbiBNYWs6DQo+Pj4+PiBPbiAx
MS8yMS8yNiAwNTo0OSwgQXJtaW4gV29sZiB3cm90ZToNCj4+Pj4+PiBBbSAyMS4xMS4yNiB1bSAw
MTowNSBzY2hyaWViIEJyaWFuIE1hazoNCj4+Pj4+PiBBbHRlcm5hdGl2ZWx5LCBtYXliZSB0aGUg
d3JvbmcgYmFja2VuZCBnZXQgc2VsZWN0ZWQuIEN1cnJlbnRseSB0aGUNCj4+Pj4+PiBkZWxsLQ0K
Pj4+Pj4+IHNtYmlvcy1zbW0NCj4+Pj4+PiBiYWNrZW5kIHdpbGwgdHJ5IHRvIHJlYWQgYSBzcGVj
aWZpYyB0b2tlbiBpbiB0ZXN0X3dzbXRfZW5hYmxlZCgpIHRvDQo+Pj4+Pj4gZGV0ZXJtaW5lIGlm
DQo+Pj4+Pj4gdGhlIFdTTVQgQUNQSSB0YWJsZSBpcyBhY3RpdmUuIFRoaXMgbWlnaHQgbm90IHdv
cmsgb24gYXJtNjQNCj4+Pj4+PiBtYWNoaW5lcywgc28NCj4+Pj4+PiBtYXliZSBwYXJzaW5nDQo+
Pj4+Pj4gdGhlIHJlYWwgV1NNVCBBQ1BJIHRhYmxlIHdvdWxkIGZpeCB0aGlzIHByb2JsZW0/DQo+
Pj4+PiBkZWxsLXNtYmlvcy1zbW0gaXMgbm90IGF2YWlsYWJsZSBvdXRzaWRlIG9mIHg4NiwgYXMg
aXQgZGVwZW5kcyBvbg0KPj4+Pj4gRENEQkFTLCB3aGljaCBkZXBlbmRzIG9uIFg4Ni4gSXQgd291
bGQgb25seSBiZSB1c2luZyB0aGUgV01JIGJhY2tlbmQuDQo+Pj4+Pg0KPj4+Pj4gVGhhbmtzLA0K
Pj4+Pj4gQnJpYW4NCj4+Pj4gSWYgaSB1bmRlcnN0YW5kIHRoZSBBQ1BJIGNvZGUgY29ycmVjdGx5
LCB0aGVuIGl0IHNlZW1zIHRoYXQgdGhlIFdNSQ0KPj4+PiBpbnRlcmZhY2UgaW50ZXJhY3RzIHdp
dGggYSBPcGVyYXRpb25SZWdpb24gaGFuZGxlZCBieSB0aGUgQVJNTDAwMDINCj4+Pj4gZGV2aWNl
LCBhc3NvY2lhdGVkIHdpdGggdGhlIEFSTSBGRkEgaW50ZXJmYWNlLg0KPj4+Pg0KPj4+PiBBRkFJ
SyB0aGUgbGludXgga2VybmVsIGN1cnJlbnRseSBkb2VzIG5vdCBzdXBwb3J0IHRoaXMgZGV2aWNl
LCBtYXliZQ0KPj4+PiB0aGlzIGlzIHRoZSByZWFzb24gd2h5IGFsbCBTTUJJT1MgY2FsbHMgZmFp
bC4NCj4+PiBBZnRlciBkb2luZyBzb21lIG1vcmUgcmVzZWFyY2ggaXQgc2VlbXMgdGhhdCB0aGUg
YXNzb2NpYXRlZCBXTUkgbWV0aG9kDQo+Pj4gdHJpZXMgdG8gY2FsbCBhIEFSTSBGRkEgc2Vydmlj
ZSB1c2luZyBhIEZGaXhlZEhhcmR3YXJlIG9wcmVnaW9uLg0KPj4+IFRoZW9yZXRpY2FsbHkgTGlu
dXggYWxyZWFkeSBzdXBwb3J0cyB0aGlzLCBkaWQgeW91IGVuYWJsZSANCj4+PiBDT05GSUdfQUNQ
SV9GRkg/DQo+PiBIaSBBcm1pbiwNCj4+DQo+PiBXZSB1c2UgRkZIIG9mZnNldCAyIGZvciB0aGlz
LCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IENPTkZJR19BQ1BJX0ZGSA0KPj4gKG9ubHkgc3Vw
cG9ydHMgb2Zmc2V0cyAwIGFuZCAxKSwgYnV0IGlzIHN1cHBvcnRlZCBieSB0aGUgbnZpZGlhLWZm
YS1lYw0KPj4gZHJpdmVyIHdlIGN1cnJlbnRseSBjYXJyeSBvdXQtb2YtdHJlZToNCj4+DQo+PiBo
dHRwczovL2dpdGh1Yi5jb20vTlZJRElBL05WLUtlcm5lbHMvYmxvYi9VYnVudHUtbnZpZGlhLSAN
Cj4+IGJvcy03LjAuMC0yMDIyLjIzL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbnZpZGlhLWZmYS1l
Yy5jDQo+Pg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL05WSURJQS9OVi1LZXJuZWxzLyANCj4+IGNv
bW1pdC82OTllYzNkY2M2MmNlMDlmMDcxNjI1MzA3MDc5ZGM3ZDY4ZDg3NjdlDQo+Pg0KPj4gVGhh
bmtzLA0KPj4gQnJpYW4NCj4gDQo+IEkgc2VlLCBpbnRlcmVzdGluZy4NCj4gDQo+IGkgdG9vayBh
IGNsb3NlciBsb29rIGF0IHRoZSBBU0wgY29kZSBpbnNpZGUgdGhlIFdNQkEgQUNQSSBjb250cm9s
IG1ldGhvZCANCj4gKHJlc3BvbnNpYmxlIGZvciBoYW5kbGluZw0KPiBTTUJJT1MgY2FsbHMpLCBh
bmQgaSBub3RpY2VkIHRoYXQgdGhlIEFDUEkgbWV0aG9kIHdpbGwgcmV0dXJuIHRoZSBvdXRwdXQg
DQo+IGJ1ZmZlciB1bm1vZGlmaWVkIGlmIHRoZQ0KPiBGRkEgY2FsbCBmYWlscy4NCj4gDQo+IEN1
cnJlbnRseSBkZWxsX2ZpbGxfcmVxdWVzdCgpIHdpbGwgaW5pdGlhbGl6ZSBhbGwgb3V0cHV0IGRh
dGEgd2l0aCB6ZXJvIA0KPiBiZWZvcmUgcGVyZm9ybWluZyBhIFNNQklPUw0KPiBjYWxsLCBzbyBh
IGZhaWxlZCBjYWxsIHdpbGwgbG9vayBsaWtlIGEgc3VjY2Vzc2Z1bCBvbmUgYmVjYXVzZSBvdXRw
dXRbMF0gDQo+IHdpbGwgc3RpbGwgcmVhZCB6ZXJvDQo+IChha2EgInN1Y2Nlc3MiKS4gTWF5YmUg
YSBzb2x1dGlvbiB3b3VsZCBiZSB0byBpbml0aWFsaXplIHRoZSBvdXRwdXQgZGF0YSANCj4gd2l0
aCAweEZGRkZGRkZGIHNvDQo+IGRlbGxfc21iaW9zX2Vycm9yKCkgd2lsbCBkZXRlY3QgaXQgYXMg
YW4gZXJyb3IuDQo+IA0KPiBJIGFsc28gbm90aWNlZCB0aGF0IHRoZSBXTUkgbWV0aG9kIHdpbGwg
cmV0dXJuIG5vdCBlbm91Z2ggZGF0YSwgc28gaSANCj4gdGhpbmsgYWxsIFdNSSBTTUJJT1MgY2Fs
bHMNCj4gd2lsbCBmYWlsIHN0YXJ0aW5nIHdpdGgga2VybmVsIDcuMiBiZWNhdXNlIHRoZW4gdGhl
IFdNSSBjb3JlIHdpbGwgZW1wbG95IA0KPiBzdHJpY3RlciBzaXplIGNoZWNrcw0KPiBmb3IgdGhl
IG91dHB1dCBkYXRhLiBDYW4geW91IGNoZWNrIGlmIHRoaXMgaXMgaW5kZWVkIHRoZSBjYXNlPw0K
DQpJIGNhbiBjaGVjayBvbiB0aGVzZSBuZXh0IHdlZWssIGFmdGVyIHRoZSBob2xpZGF5cy4NCg0K
VGhhbmtzLA0KQnJpYW4NCg0KPiBUaGFua3MsDQo+IEFybWluIFdvbGYNCj4gDQo+Pj4gVGhhbmtz
LA0KPj4+IEFybWluIFdvbGYNCj4+Pg0KPj4+PiBJIGFsc28gbm90aWNlZCB0aGF0IHRoZSBkZXZp
Y2Ugc3VwcG9ydHMgdGhlIFdNSSBpbnRlcmZhY2UgdXNlZCBieSB0aGUNCj4+Pj4gZGVsbC1zbW0t
aHdtb24gZHJpdmVyLiBJZiB5b3Ugd2FudCBpIGNhbiB0cnkgdG8gZW5hYmxlIHRoaXMgZHJpdmVy
IG9uDQo+Pj4+IGFybTY0IHRvbywgYnV0IElNSE8gaXQgc2hvdWxkIGJlIGNvbnNpZGVyZWQgb3B0
aW9uYWwgYXQgYmVzdC4NCj4+Pj4NCj4+Pj4gVGhhbmtzLA0KPj4+PiBBcm1pbiBXb2xmDQo+Pj4+
DQo+Pj4+Pj4gVGhhbmtzLA0KPj4+Pj4+IEFybWluIFdvbGYNCj4+Pj4NCg0K
