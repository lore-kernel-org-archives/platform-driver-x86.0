Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457517;
	b=wltYPIEDWOcDer9KJClFBGczS66DWNABQqP/pk+PNaF4UQ5yDyItfsCR4BY2+Kuyfo3e
	 nExk19hqYIzSHae+GJvvRq7xo6R4znkagIC8BsRS3khmwLBlFuF0Orxt5uD/9fYQvw4/3
	 G8hjeme1HMsMbKGendQ0zUQj2C0DF+dgmFfP5QXv2UsAqPQOAaIwoAQHFg2670wZht7vi
	 kfgFd/c1K6seUeCbHPslo8kg9gIAsmMrClZI0c3yCZrxL05Ewpzn/5J1cSVFkoxBzt6sy
	 n6uYnmJH89YKPWmaPpwN4uDJ9rhLAqmedcLJvhMDFx2dEI6r8QQJNu7Jgviys7T7rKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457517;
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
	bh=mJphmIZOURz8CoIiDLst7XCFNsFPbqWhFekM8W1whPI=;
	b=cpaeRWJNG2cbTUBvv+6sjnglXfSgM3SJZRHMAJy9BUUHcs0ziScxw3olOauqX3dYgdW8
	 3p244DEey21/4cJaDQ1KgDjpYHJ4Cq8exouuq1VLO8B6n+aI9CRVHUzHHbr5u4+gGgtZF
	 0nN1yKw0KO9PWyIStU6adRJJJrXhJvI6D2fY+JnVCpIUYCF7W7Y9T7uegZkRl6PnSQjHG
	 5BheHr+tGV0ro5fSva463SAmDJtvhpmEShRAVqcusWAbs0MA/0n0ntVaCO7pf405zqz8F
	 vSzHloZ/Q2c9sJ1Ajs3xVbUBqQw4jVDfqgveAJZCh2MFomINkCgU6LsBnqiFVe+zvxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xva3t9v5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.71
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A8E606A31A;
	Mon, 23 Nov 2026 18:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xva3t9v5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbKxQ7Rk0e9eSwWri/LTtd0W/OrNuKJ4Bj3PeHOzKbXAc5Z6HYzgoowrsoOzRvWt8lV6KsCzKbZFmZ+ospR9oUhnbHXJafrD7sWxyhnnx8IXCXz+LaDFbme8h4jq9O+rzsteskcfBWEBwWDDDHxKjAcestolnErCQDYb34vVsJk2ZPQdqAymlsAPvE6rsr9ppjLVRPLYvLUuTOHJoz8G4hqQBVYSuUjDnTpufjXZJEtSLzZWfRm5P6enB+EfTRGnctvkriTOfDSiSVTMC6K904nrGrycRRyqwiT/CYA6w4auaWJsTlnIDhuEGZ4HDoZkw5RYdrqz+9FsPnhjE+WOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJphmIZOURz8CoIiDLst7XCFNsFPbqWhFekM8W1whPI=;
 b=cI+6eKCQw844hpQWAEEfPZA+JTzkFS/QfMAH9a1CI2Ynl/S9AXA9ZHeaYYeMbKKh+uYLmCfioAdwmg+/t/S4RUhbixMXmEpUlLzXnENhfWRJCRIny1Xk41yfVOZW235TpIEMGnEpH9LoiS0eFMpraHAaOmK3ht0cNEr/iRBxxzla26Ezxr/mvNXHKcoSYMCX1zhQdN5PvbgWbvaO2CZCndVt7yci1Wr6AtPTPirXtY1jeRVV0KAONZpbQu4jNRG2BYdXFd3KhoRgUGY6A1TOiNtLHCVPK3wds8aPsbMP+5pr3orIb1QnC3aFdVZJrdseQZ/Bs26EBntsm1uSbuDkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJphmIZOURz8CoIiDLst7XCFNsFPbqWhFekM8W1whPI=;
 b=Xva3t9v5FBFIkNt8citIp8jZvUvwZ4j4gkuCjrhsypMqoxNvrfM1W2dikOCGZZmRJ7nxL2cm8Ub+H07Gc6612i3DSniLHRYAcgR9FVCKRBvo0iinMIzx/IOVuG6g3P99aSOeX9GARl9HOAvcKJPJSQAny8kxpq5V8tr8u6GTtyYbyYFLN0HWs/YvuxQTM5j8mebsgGltBAFRGIOLBHSHgjGx9raLqkRNCTyvtJ9UJK7j8uuvWnl4B3HpDEgbkmYvLbAnxMUQr5CkJ4NCp8qIe2ashkMvAhQcFQbIQg0Su6u/32IFTAPSDSpg5sOc/Y6ymXcI+ZDCgXvV6GnUaJP7dg==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 18:11:51 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 18:11:51 +0000
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
Subject: Re: [PATCH 5/8] platform: dell: smbios-wmi: Fix probe on RTX Spark
Thread-Topic: [PATCH 5/8] platform: dell: smbios-wmi: Fix probe on RTX Spark
Thread-Index: AQHdeUxbcrh8i67zp0++sMxii4xE2Lc4iiMAgANve4A=
Date: Mon, 23 Nov 2026 18:11:51 +0000
Message-ID: <507c04a4-6cdb-44ad-8872-869e6c99a6dd@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-6-bmak@nvidia.com>
 <77d84196-1e9a-46ef-835a-56275087631c@gmx.de>
In-Reply-To: <77d84196-1e9a-46ef-835a-56275087631c@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|PH7PR12MB7260:EE_
x-ms-office365-filtering-correlation-id: 7fba23da-52b4-46ec-bca7-08df498d3f5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261026121527099003|261021123027099003|38070700021;
x-microsoft-antispam-message-info:
 TkpWSFlMItazOtnPqnwKgEoqaW8iC/OgCQb2wUKhBVtp/BSzX1llQ+8gEcTTWcR8NLcwPBSTfu4OKvtoYkThllHCImqm+45CKF/vOVnf2YHWVTSrj1X6l8vTh27656P3GhIAhW3fJz1PEGTX7zCVdiGoYrpDmrJkbS76Jz4iRn585RdTBMI30S8U6/kGbLdKCti6S9A0a1sqrpqmDz3WNoVO5vvXq8eDMxueP1l+Eq2Bnqwbu+lLhDRuZDkrxAE20YdGNREO+H00L7oQfvJPvzuUT+HP26wOXmTmCC7XfZp1lmPsRUNJcLpXQn19rpKFGFHEnwS9gGhLQmOqnwcJqWIEEBJ19dYYo9ILCNfw7wuTK0MhQMrPcXH1zL9pa0P3Di9mw0GPyi2T99rDEVNcoqHstPwqWjHBXEjA0G4PfApgwIQ0fwMvbD9QOhO99owy/fAFlbai6L8M7VN9FDHK8Rmt+QvWE3P6WKDb+eEgVb5Z/1sz+mE0n4iBPioWErVE7wX7YbXVaNqgy0BFG8VRFu/8sDfTTetn73chyPwnUQ/h9Td2Li80fbHzghoiFiEBP759SHBibyj8Xx3JuwMDGAUDIm84Jhn9LPqx+foOMap0uDj0gFFME9ktm8b8PZjJrtDK9MZWj1tMQZPgy77R32XZEgktvFgTE7PH/GCMiOLwPeBWX2p4uSjGmleCdc8lO/XPRb3tv8SuyJIYE4zpj48LTSn2tlDx62RPsROuOn0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261026121527099003)(261021123027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDNzemsrVTNJT1pRYlFaUnlFSHhmak1XeGROcXhraG5JT3YzeFVaMTV1WEg2?=
 =?utf-8?B?TTlEK005Nm1aVTQ0c2dyZ3pmZ3lkZFpZTFhVcjRWSDdnSGd5M3NsR0RmL3FU?=
 =?utf-8?B?NTdESFFaYWNreUNSSkNaRVB6NUNia1VaaWdqU3pvTUI0a2hsRnBzRnpuR2pq?=
 =?utf-8?B?Vjd1dFp3RGdKRkY4YUJXSnZJc3J1cTRyWDdLdjQrOG1vQzV2TXA4OGJTRkFY?=
 =?utf-8?B?Lzc0TXBsSGEvT09BL3doNXpJeWVxTlZnbHBsYXpnc01rYnlRREtEMjhOSjdD?=
 =?utf-8?B?Y24vQVJVV0Uvd1p0TG9JaTQ4eElwZnRpQVFwbWRhTVVGRG9WTTUxSDhtTUwz?=
 =?utf-8?B?RmlmM1lHVjhJNUN6UzdLeWZlNHRTeXRvNGVFVE15TDgzZkFiajRFR1FCczQ2?=
 =?utf-8?B?aE0rSnRtcFNLcFRtUzB5TXh1aU9EMUw4SEwzWFk3M0NCWlJpSmZXNFl5Yk5Q?=
 =?utf-8?B?ak9PNkFEUWdtOVZ2Zm9ER2tvSkZrSFRJQkZNQXBpc3h1QlhiRGZCK1Rmem5q?=
 =?utf-8?B?WHlwWUNnUWZ3bHpaT0c5amxHVXZncmd0STB6UEhQbmYwSzcwQ3hIeklaM1VD?=
 =?utf-8?B?a1NYYm1oaVd6bDZwUlh5QmtrV1RaUktFblk3OGFZY0dlNnlzcDMyRDBVU2gy?=
 =?utf-8?B?OGJ5TGthelJ3cys2YUkwc01sR3oyMnBKRTN1M3VyWFM1VlE5U3NORTZ5TTh0?=
 =?utf-8?B?OC83V3NZUTlHdVgvd0lxa3FFNHV3UXBhMkdpZitoTVBxSi8zNWtGRVJkWkdM?=
 =?utf-8?B?WE1aOXZYZHptbVdPVC9pUzJaN2Z5R1BYY0pQNlU5b2VjN2hMbHF1UlVSNjN3?=
 =?utf-8?B?Vjc1cTV5eGE1c0hZUFBSQ1dDUWlabUx4ZElibDJURkVtWEFTVzNvWXIrWmth?=
 =?utf-8?B?RGJjOTVkWXhjaEpqWUwrM1ZrRUZvd09SQUtXckNqK2JpRFZCNURrY05rdUtx?=
 =?utf-8?B?RFRJd0hUS1pjVXkwaFdSdjMvc0pHMDhGdGlxamV3dzN2OGhRdHNoNGJrOVVu?=
 =?utf-8?B?Smc4bzRZd1JWZjBuZVRiZUJWSk5WZ200NHlaN3RKUGlpRnM4S2VqR2ZCbnRv?=
 =?utf-8?B?ZUdLSElrQm9MSlNkOEVFLzRkOWxRWnA0TjJNaERaK20zOHBYQ01pZTduWCth?=
 =?utf-8?B?ZHZKTmxwV1NBTXlpK1dSSUIrV2gvTkxXUnNSeVl6aUx4REd0aW0vVGx1VjZ0?=
 =?utf-8?B?cHhSN0ZCM2w4Uk9FYlQ5cTBhTktTWnBPcDk1aFIyZGdVdk5tTW9lSUFBMU91?=
 =?utf-8?B?MktSM05wR3Y3Z0IzcWYzNHMxS3ltdHRxY05sUXVpOTZ5bEl2ZHBWZGhwajlz?=
 =?utf-8?B?WC9KaVZPSHYyR2x2YmlYdTN6WFJ4TVJRWUt2VkZxV0VJZDVHbFlpSTF3V01m?=
 =?utf-8?B?MGlybS9aVjRzZW0zZU1pdUFLdzMyaDBkVjVVWHZuZHRwUDB4UWpocktBby8z?=
 =?utf-8?B?dUNtZXpNRUQ1SGxZWHUySm5tQkx6bExLT2pUSnJGQUpFUm4zdWpGWndUZSt2?=
 =?utf-8?B?ZGxqZXllVnZPdFBTcFZBVExPaGlxYTFkRGRWNTFNNVcwc3pSbjg5M21GMWxq?=
 =?utf-8?B?Vzc5aFhQdDdpNjhkMmh2TFNOMGtiL1F4eXhrMUtUSXp1eWlNN3kzTW9MSGln?=
 =?utf-8?B?MXdGK0xjZGwxeGZnUkJDMzV3ODBRSDdieUpZTm54M3FEWDl4aWZTOXB5QmM5?=
 =?utf-8?B?LzJjMDJlMUYvYzRidTloUkhSZFIxTzNucllMNXpuN2lLWnNmbHU5UkNadlE4?=
 =?utf-8?B?MXZnbjZXUTlYWVhsTUo0cTF6OVAzVjNoWWt5a2FtTG8wOWxjU3ZIZmtsUzlW?=
 =?utf-8?B?NjM2c2JmNUNZUGQvUkdHQnZMb25kSEE3V2YzSG9qTjZhdVI4YmhMM2w2RDMr?=
 =?utf-8?B?U0FZVDNQV3ZpZTBLWlVneTYwSVZDekJPVWFXMTNzcUg4eTh3MnpUOXkySjFq?=
 =?utf-8?B?bnl0Rll1cmFiYlF4Z2pHVng1QmdhbTBIdTFzSGdnbWdNVDZNUlpuZzlUdXFS?=
 =?utf-8?B?aXp4Ym5mdmNNcnVaT2NzbTNNZUZ0VEFZVVhwcDR0Rll2M2pBYVN0NXY5V2VS?=
 =?utf-8?B?RmZjbFQxdWhaeEEwWWJGS0ZacGhOdW5XZDhDSFllMkJlbEEvOFhySG9raXlD?=
 =?utf-8?B?WkIwd0E4Szh5emRldmpFMS9iRXdNVkdjL1JnSG5EZ3dwNWtTV0czY3g0ZktH?=
 =?utf-8?B?SVdJeHNIRElack11R29kRWZVWVdVR3pNQk56aS93VEVoS21CVk1Bbml4dzds?=
 =?utf-8?Q?tZhGUzTLK8Um3XDF1eLLFLK/UeyEbn0X2jY08s6/I8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1121366134B8B49B934954E2855B690@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fba23da-52b4-46ec-bca7-08df498d3f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 18:11:51.1701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHkBVOZB+IHk8r764jpcvHKcQEcDNJJbZ0i1icCMFyavjD9hEgGAr7ikttgHbyVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

T24gMTEvMjEvMjYgMDU6NDQsIEFybWluIFdvbGYgd3JvdGU6DQo+IEFtIDIxLjExLjI2IHVtIDAx
OjA1IHNjaHJpZWIgQnJpYW4gTWFrOg0KPiANCj4+IGRlbGwtc21iaW9zLXdtaSBmYWlscyB0byBw
cm9iZSBvbiBSVFggU3BhcmsgZHVlIHRvIGEgaGFyZGNvZGVkIFNNQklPUw0KPj4gaGFuZGxlICgw
eEIxMDApIG9mIHR5cGUgMHhCMSAobWlzYyBCSU9TIGZsYWdzKSB0aGF0IGlzIG51bWJlcmVkDQo+
PiBkaWZmZXJlbnRseSBvbiBEZWxsIFJUWCBTcGFyayBsYXB0b3BzLiBJbnN0ZWFkLCBzZWFyY2gg
Zm9yIGFsbCBTTUJJT1MNCj4+IGhhbmRsZXMgb2YgdHlwZSAweEIxLCBhbmQgaWYgdGhlcmUgaXMg
anVzdCBvbmUsIHVzZSB0aGF0IG9uZS4gSWYgaGFuZGxlDQo+PiAweEIxMDAgZXhpc3RzLCBhbHdh
eXMgdXNlIHRoYXQuDQo+Pg0KPj4gVGhpcyBmaXhlcyBkZWxsLXNtYmlvcy13bWkgcHJvYmUgb24g
RGVsbCBSVFggU3BhcmsgbGFwdG9wcy4NCj4gDQo+IEhpLA0KPiANCj4gaSB0aGluayB5b3UgY2Fu
IGRyb3AgdGhlIHNwZWNpYWwgaGFuZGxpbmcgb2YgaGFuZGxlIDB4QjEwMCBhbmQgaW5zdGVhZA0K
PiBqdXN0IGNoZWNrIGlmIHRoZSBTTUJJT1MgdHlwZSBpcyAweEIxLiBBRkFJSyB0aGUgUENJIGNv
ZGUgYWxzbyBwYXJzZXMNCj4gc29tZSBwYXJ0cyBvZiB0aGUgMHhCMSB0eXBlLCBhbmQgdGhlcmUg
dGhlIGhhbmRsZSB2YWx1ZSBpcyBpcnJlbGV2YW50Lg0KPiANCj4gVGhhbmtzLA0KPiBBcm1pbiBX
b2xmDQoNCldpbGwgZG8gZm9yIHYyLg0KDQpUaGFua3MsDQpCcmlhbg0K
