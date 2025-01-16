Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BF1D63C8;
	Thu, 16 Jan 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018221; cv=fail; b=VVXEmuTgAfaxQGDYbAiWXcMm0oRvdPSUzdJrsVfx5I8bje83k58r17ndABLoOKb0E0fLTN8/y3IHQJslo1d2lp3ub43Df75YWvSzwT0r699P/dPDek8HgBPQNWIpVti2R7Vs1AYHoPOyHu0fbGDUpcdNw3iGXcs1NCmSfbWAnhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018221; c=relaxed/simple;
	bh=f+jzXIOe2FCjYmxnsULv1K1W0ywmQT3SOFDqOd4T1mI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mEU5rObIg8MY99BCjv/S2QxcJYvZ2ZRLhJNEg6ybKUCFU9l2Lj1CxnOF8QygF2Vwq80KAMROFXYUNQ9qyonHzct7xM79Giu/8HLz1w5wX+vpbQhzuIWhnem6RLBsDXDJGuLDR1Q3wM2qx8kwsqfhmFN9lEfDLsaC4YM8jaJschM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JQfN3FW5; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JQfN3FW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryF2f++q4ybN88BtHERBaTOR9DA4efkfMa0UKtgZB48RiZ/r1BIlb0jQEth3Fy/hCWNqf1EKOjnz4V+/W+Dybd1+YBAu/sr/zrwvigGvLzKswvlIIRWKg79a3een3hl0apzYZ2xScOsUvPqr/sX1C1QqJc4l+cRri9tr81DspgMfcua8INTOCIPzdRQs//OJK/eZP4W9+lYrDRtlSIUMVqOotX9JWujQuroCou1vtti0cmGw+A3BZ0M5dvs+ZFlR3ioFmq/UpvkvJNp/3sftzfpm2gWGMxc8tcCXoMYnTH1lfpiF6zlnU2DwmWsXcBpHjOr8/t6QAFY4364ZZWJJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+jzXIOe2FCjYmxnsULv1K1W0ywmQT3SOFDqOd4T1mI=;
 b=jfqBmMU2yBZZ15bqHf05CmnU3E8xUaf2R8RJ9yPTiSzxx0RYRTcpF6iLg66I2QdRqETqXtMssg5eXkdgvoz/wghKxmytMfGCbjqUFb97/ZxkSwx5kTwRhwSUg8qdgxgWWMZekhIswgzcMW3kQYIXWvdJxbzOYGQrPl5FdtJQt1OfQWfmq6StX0LbuasqxyPDaZd7OQxL0j+hTHwCC6vOiYwFORvZeIkC7VBnCX5bCRpO4wXYfluNL+SKGIuo2XOh0AkTO7dj+vVRKJ3ST9vwG7I285VK4zjUId+yi1a6pQDTiQCQ+ytmEUpTwTRBAtfnQ389BD0I4D6P7nM0HIUaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+jzXIOe2FCjYmxnsULv1K1W0ywmQT3SOFDqOd4T1mI=;
 b=JQfN3FW5WJPbknJ/hr8VaWWlpuhH8QKHFav+CKAEBTigqjUayGTlxDj/QW/U5LU0PSSgG2d4gC5Yrt997yE1/4GQmpjwsSMsVj5BAN8AWj6HHf6sHdfBrRnyPZJZoOzx7dNaChsOC3kD1JHAFY8k2ifw5937AgOZeQ1MblG9zdC5q5zbFn1AY6T+pxsgVmyN4J3vdBFvksjVuRHAkgAPoM4o9wwJIVlKgWs/aZvGMrgRc7Ka6SxEVLEwrFWeZOphhPthAbXn6QKagiD/DT0AFq3ct/TD8iVKPNjpdLnswkTdCL/B2CBmWa84Pdx5OsNxSCubvXSjzjDdrCf7vNnOlQ==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:03:37 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:03:37 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Ai Chao <aichao@kylinos.cn>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: mlxreg-hotplug: use sysfs_emit()
 instead of sprintf()
Thread-Topic: [PATCH] platform/mellanox: mlxreg-hotplug: use sysfs_emit()
 instead of sprintf()
Thread-Index: AQHbZ+4U2W9he3zC8kG075JDDiyxwrMZGx+Q
Date: Thu, 16 Jan 2025 09:03:37 +0000
Message-ID:
 <PH7PR12MB66683EFE4395B10DC5CAC43EAF1A2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250116081000.2900435-1-aichao@kylinos.cn>
In-Reply-To: <20250116081000.2900435-1-aichao@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|PH0PR12MB5679:EE_
x-ms-office365-filtering-correlation-id: 18d4a225-1655-4759-06ee-08dd360ca9de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWJhcGg4RFlzSVhqRXRFQ2FTU3hETEk2SDRGTHlhUE1JVHQ5TmhEbmlLN0pl?=
 =?utf-8?B?Z2lmYStoZ0xIaHVBNUVnU1NZMGx5c3pndkJMTEhRd0pTamh0YnRuckRHUVRQ?=
 =?utf-8?B?eGswYkpTNVV2WHpjUGxsdVpQMWhBNlFMK2FMSWhVR25HSjFwZ0RrMDcrR2lL?=
 =?utf-8?B?MHdhSXlmT0RkZjM3TkxKS2s5ZmcyVThsejlZQ0l3OUZzNmQwNlorSExSV1BL?=
 =?utf-8?B?ZVpISmQ1VzgzYzZZVkd5SjJzZFlDTGxkSWZyUStTNHFHOUk3Yk90bEZhT3Vm?=
 =?utf-8?B?TUpadytjOE5jcmhwamFMaTZBTVJ5WmxBNDJ3SDd5aVdkWXJDSGcwQ3JUVGFl?=
 =?utf-8?B?K0d5aStueEpJRmtMTDdtVS9UbmxIMERsa3c5YVpRRXRybklwVWg5dGtRdVky?=
 =?utf-8?B?SlBUeHp4M2g0MDNWWUJ1clFKbkw0MWxRaTN0bGlLbGVTMFVXTk9GNVEwWkU5?=
 =?utf-8?B?WkVTcm1veEg1bkk4VUZybmtoN1djZVg1cEdrUmFsRFBHQXcvNXpEQit6a0lY?=
 =?utf-8?B?M21BT1FTeUJiWUhzK2FUeFArNkRST0NNelIzTURqbVNTWVowRkVBb0lLM0Vx?=
 =?utf-8?B?ZzgzL3daTVRPeVZZZGdtbDFad243NnF4NFhHa1ZITG1CYWtQZEhQWFNxM2pq?=
 =?utf-8?B?Nk42akpXS1o5c1oyZXlkTXFVQ3E5Y2xUMThQS0VnZWtsTlE3QU1UNS9VbURn?=
 =?utf-8?B?a21JbUhpdHhCTjIybVplTVAwdHhUdlYzb0hJd1gvMWdEa1JYZlhibjNoR3dM?=
 =?utf-8?B?THFoam96aTFzalQwS29IL1crN2lLbUFvaVFBSVZMYjkwcHYveGNyR2RQYWhw?=
 =?utf-8?B?enFKbjdoM25CTnU5c3lMTG1DSFByOWFUQ2FJYlhLSXhlRklab0RqZVRhWlJV?=
 =?utf-8?B?MDJnT0tWWnVaMC9QamJzdTdaNG1UVUgrQU1mMFVKTnhHZ0JoQm5xRTF2Q0RL?=
 =?utf-8?B?N2FkUFl2Y1h4dk5NMEw1ejIyMnhHbFJwck9ZV0ZLSGF4M2Q4NExIU0JZWmxZ?=
 =?utf-8?B?SEpFOWFraXVNaENnSDJjZ0hIWnF4enZXYUprRTk3RGYwbmc1WGZIdkFmakZt?=
 =?utf-8?B?MC9INXpxaVFZK01XSlJUTDhmbTJMVHE2aDBSdEk1QnRmdDN4WTBQRVlyM1B1?=
 =?utf-8?B?NTQrR01JZWpnbnZCZ1hBb0dqLzlzQXVObWMyQUV0Ny9NQUZPY2xjRjdzSkhk?=
 =?utf-8?B?OEpWbUd1L3UzRmt4aFc4NGRvdHRGK2tHUmppdjgyWmZFREZWczVaaUx1NGha?=
 =?utf-8?B?ZTVVa2RDbWVER0JaWXdIeGphOGNxNmdMakdkRjR5M0N5TElaQ3RBdXRYcGhm?=
 =?utf-8?B?MFJNV0g5d1NMTlNPOE5PTGVPSmNXUEZHOE9EdkpjK1FOTE9NTlo5aWdyRWp2?=
 =?utf-8?B?U1FHbDdVSVlYV3FRMUxNWnVyNnNEY1FRMURXQnFVT0dSVW1sTTdFZWZ1MEVV?=
 =?utf-8?B?VlVVWTREeWVOQmVtajg2QWp6SHJKZVZxSCtGd0hKQ0F6cEJVUTQ3a0xKWHE2?=
 =?utf-8?B?RHVYeHJOQ2hwRmJSNTJyVlhERFVrVDZ0Yk8xU0tSdVhHbVZCQTROM1lkU3V4?=
 =?utf-8?B?SGJDZWlBaHdaNHg2OFN5cHFVRUV2ZEppeTdobmdiQklJLzA2L2dWZFJ1ZHJV?=
 =?utf-8?B?Vmh0eGt0Ty9WcG1xcmloR2lucm4yZGUzWVFOb3FnZTNGMFJ5UTZtbjZvYXU0?=
 =?utf-8?B?aEZzeHZpMVJxQ1hrM2M5UzluVS95VzN2ZjUza09PRUtRZUoyajdQYXlBTE5k?=
 =?utf-8?B?eWFUdDZlTU5KOTV2Nk1OMWR1bVRCK0pxU25ReTdRbk5xWS9oRGZlcXlnQVV6?=
 =?utf-8?B?ek1wSjZFR0hzMHZzMGk1aXMyM0ZiRWIvK1Rsc1hXWmQ3WHRCVWZkTjdiOVJ4?=
 =?utf-8?B?NEc4c2dxcTNTZTAvRnFEQUJ4Y3FJcG9NQ2xxRDhvb1YrZlVnRU1XUUk3WnhC?=
 =?utf-8?Q?7EKWouVo3//ghW20W237/sHrWjknfYL6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEFsUkZpSUFsemt3QndHRFRLYy96dFR1bjgzMHdhdjJpSDNUTUs3eFlVOVVT?=
 =?utf-8?B?VW9oUysvcG1aMXVUbm9SNjRORHlFdDBsZ3NFQkQ0b2NnVWhLVG5LQ1N5M0Vo?=
 =?utf-8?B?WG1JVVdOdnpkenhjYSt2aFFINkRpa25OT1JpOWhMaE9LdnN2bHdnUHV0VnN0?=
 =?utf-8?B?OWwrK3prWGovcm8xV0FZVzJjWmlhMEZnSzl2bG9mYVhGaWFwMzhtbXNSNk5J?=
 =?utf-8?B?YytzTlpUaEo0S3dwYS94eS9IQ2FjWEM0QzRrM0wxSm9pNDJjdHZsYVR1cmFK?=
 =?utf-8?B?TVlNeDlQbWdGQUdVNy81ZngwWkFLQjRGdTBLcWFFVjBWU0J4aVZ6a00wSFdX?=
 =?utf-8?B?ekU4NUxreGVRbzVMdzNkQUtuc1M0NERZUlRweHJWdWFWNkEzOGJFMiswUzhO?=
 =?utf-8?B?bTJ3K2VSQkJhM3g3MDM2dXlHeHlVS3I4Vm9BcnFaaW5Jd0VsbUNHNUZ4UCtP?=
 =?utf-8?B?eTVpSEp4UjNsSnFxWmJEQUNPaCtaNjE1RHNiOHU0bC9sU1pOUDduL3V3M2Rl?=
 =?utf-8?B?T3padmVEMTFTT0xDaEYyODlqMlFOTUVQVUlOUVU5cTJQaGROamMwZkoyU3d3?=
 =?utf-8?B?S2IvRkZCVFZWT2p5d0xlM0ZZRzBBc1hqMWk0MlF4WWhHblF3NDdZUDhyTlZS?=
 =?utf-8?B?aDN4R0U4U245QnpkT1hVYUdyOEkwQ0QrNFRScFpLU3hRYlUrNWtUL3dVUHJY?=
 =?utf-8?B?Q3ZQSmYraENTVjU1YVRMaUVzOTdUSTQwcEY2R1U5ejZESitoV0ZxRUtWS2NI?=
 =?utf-8?B?eUpuMnRTeVZiOEFWY1JTMnlEbzd3RVRpbDY3SjNhaVFmdHgwcnNoN3ppc2Nz?=
 =?utf-8?B?UG1jV25QT1YyOGZhc21PV2dVZFJuWTVHamtMbC8zb0dsK0ZYOElyTkZXR0x2?=
 =?utf-8?B?eWcwdm9vQkJzcEZSWnpsTjNEeTZNTmt4YTZlc3doOGFkQWExbXFNODRuaVlF?=
 =?utf-8?B?cHFXUDlBaytrY1VYVnJOSVJqd0h3VzRtdVZIanpxaVR5RHUyek1udStuUU9i?=
 =?utf-8?B?MFJOa1c2REt3SkNld2lwbVJ0emJxVzlFQWtHY1FGWCtoZnFjY1Y1elhXTEVY?=
 =?utf-8?B?WGwvRytzdnh6YkUraDNQVDZsRjRvMWJVWEdsNjErTEREY1gyYUh4Y0NybDNk?=
 =?utf-8?B?elZZeEVmSU9uc05NMkRDaWRIbmQ3N3FyUzRVMFRnbGRXNE5KaFdJUWR6SlMw?=
 =?utf-8?B?S1FESGJVSmdTTkMyS1lUaDlqNUNxalhyMmVYc0t4QUh5azFzOTgwMmViTzVr?=
 =?utf-8?B?NGV6YXNrenBiN1ZvcExjWXBXZHdGckVOV1BQTmJHMFBDSVozSWIrQ0FWb2NS?=
 =?utf-8?B?eHo5d0RxV01DRHRLWmFrRW5JZHFnU1pJMUQwM1ljL1FmLy9TMkFZRFNaUjlP?=
 =?utf-8?B?QlJEOE1TZ2xodW42K0w0aWpveWM4VHd5SXo2SmJNOUZLQXpYZWFFT3VrcU1j?=
 =?utf-8?B?aExKSXFhbUs3ZTZkalovR0J3a1YzV3hJSzJ0UC9JVVo0NjUreUtDZWJuS212?=
 =?utf-8?B?TFp6Vzkzb0ZtdmdBS2t1cUtnNHZ4VVBVWm5kRzJOS1MvRkdPeXBhWWRjVVJJ?=
 =?utf-8?B?TU40cDhiTE9RY01xTkNLZnZOVWJkaS9kYUo0K29GUlZ5MWFTOFE0N2gwcFRp?=
 =?utf-8?B?UVphd1ZycEU0NzdmejJEa2lBYnNMMit1djRFdDVXTUtmZHBpY1dEYWRqak95?=
 =?utf-8?B?c28rcGh1cHRCVnVKdTJPcHF2M2pWVmNUY0JmM1p0YlR6cnZaVzNBK2VQNW1T?=
 =?utf-8?B?Q3B1bzdBMnNVTjEwVHNEdk05SmZSQlpiZ2kxZDZaclFkYW40ZGVFaktPNkFn?=
 =?utf-8?B?S3R3M0tHWWU1b0RnKzh4bXRpbm9qeVA3N1BBbXJYRlNBWEhXbnJFeTdHcURL?=
 =?utf-8?B?Y1FGeEpEVjBMakFlRjVSQkNncjNVVDFybGMwMGczZzdzVzcvcThYWXFaUXZJ?=
 =?utf-8?B?YW5RZVdyTUZYT1Zta2pqOXZCT1NBVUpKTDc1UkhObWpvemthN3NZNm1pcEEy?=
 =?utf-8?B?SkptTFppTm96K2hSTEFrSzRBV0lSdlNZN3UzbytBMUFndmt2MkM5YlZzTU9v?=
 =?utf-8?B?WlFmZmZPOVYybXpQbHlTWUpvdTNOMEF1eC82aEVIck8zQy9BdUpOQy9QTDVD?=
 =?utf-8?Q?w3qY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d4a225-1655-4759-06ee-08dd360ca9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 09:03:37.3508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZfcHgl1Qnub+tymDb48bKOeYr5rwbr36EJxxOwrQkuXporT8y00VpUsvvXPb2blUDishzk0MTd7CnIBjnaP14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWkgQ2hhbyA8YWljaGFv
QGt5bGlub3MuY24+DQo+IFNlbnQ6IFRodXJzZGF5LCAxNiBKYW51YXJ5IDIwMjUgMTA6MTANCj4g
VG86IGhkZWdvZWRlQHJlZGhhdC5jb207IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBW
YWRpbSBQYXN0ZXJuYWsNCj4gPHZhZGltcEBudmlkaWEuY29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBBaSBDaGFvIDxhaWNoYW9Aa3lsaW5vcy5jbj4NCj4gU3ViamVjdDogW1BBVENIXSBwbGF0Zm9y
bS9tZWxsYW5veDogbWx4cmVnLWhvdHBsdWc6IHVzZSBzeXNmc19lbWl0KCkgaW5zdGVhZA0KPiBv
ZiBzcHJpbnRmKCkNCj4gDQo+IEZvbGxvdyB0aGUgYWR2aWNlIGluIERvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvc3lzZnMucnN0Og0KPiBzaG93KCkgc2hvdWxkIG9ubHkgdXNlIHN5c2ZzX2VtaXQo
KSBvciBzeXNmc19lbWl0X2F0KCkgd2hlbiBmb3JtYXR0aW5nIHRoZQ0KPiB2YWx1ZSB0byBiZSBy
ZXR1cm5lZCB0byB1c2VyIHNwYWNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWkgQ2hhbyA8YWlj
aGFvQGt5bGlub3MuY24+DQoNCkFja2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlk
aWEuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90
cGx1Zy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhy
ZWctaG90cGx1Zy5jDQo+IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1
Zy5jDQo+IGluZGV4IDZhYTJhNDY1MDM2Ny4uYjM0NzAwMGU0MzI5IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVnLmMNCj4gKysrIGIvZHJpdmVy
cy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+IEBAIC0yMzIsNyArMjMyLDcg
QEAgc3RhdGljIHNzaXplX3QgbWx4cmVnX2hvdHBsdWdfYXR0cl9zaG93KHN0cnVjdCBkZXZpY2UN
Cj4gKmRldiwNCj4gIAkJCXJlZ3ZhbCA9ICEhKHJlZ3ZhbCAmIGRhdGEtPm1hc2spOw0KPiAgCX0N
Cj4gDQo+IC0JcmV0dXJuIHNwcmludGYoYnVmLCAiJXVcbiIsIHJlZ3ZhbCk7DQo+ICsJcmV0dXJu
IHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsIHJlZ3ZhbCk7DQo+ICB9DQo+IA0KPiAgI2RlZmluZSBQ
UklWX0FUVFIoaSkgcHJpdi0+bWx4cmVnX2hvdHBsdWdfYXR0cltpXQ0KPiAtLQ0KPiAyLjQ3LjEN
Cg0K
