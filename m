Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198341A08BC;
	Thu, 16 Jan 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018235; cv=fail; b=sfXAuSjulRHL2lVwTfVSeG7srUZE7NwlUkiwXUE9c7E8CA2aQyKoV/RXdHnRjFmirHzluplR77WF8/txOBVRzcLyBn1dKPW9d9IGfUNTgUM+THBbIKVQrTVTQp+2XXAJgg+mKHcmRK5iZc9IzkgwZBE8dMIGVmvbgF2a4yb0uS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018235; c=relaxed/simple;
	bh=MSCC+gdeJyiXxyLquNwnN5mj26bQ6df/LCe0GxKq1m0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eMKBuB59pFNHZyF1sGLZW7DcpnN63MAmzzFWfs/9Q9GfzHJUv/5KlPmDfYdJ5Kg0VWkireadoZdkNChfLyfMdkt1qPAy/Ws0SjtjU5Dyv5nj3ycbUw9zjqP0/VfzE2Y8ltTuFe73yBGEZWY8DQ7zuXDUMrp2tbO6sKjKF0VbjmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nsWn5CAW; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nsWn5CAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2RHnK4X5HM6xzjdR1luPwYAiPi924bovxfh2QJ2lmPrxaGOL0oRmNnpuyVJI0M0OoIJOMN5SLgTml9QJKHTMXAVRgBHsajpIu1/2A1AIWTfoop/fVhLlSpzsAdBGqnGwObbqCSbJYzYOavhnZFvVza2N4ZGOLyISjDds66JRudHw7N91zpj8saF0hIgjmI3Cv9sRMBU6gLFWtuN4dHaMJ3R/l2XEEfSOyuq1L+MhJgZyr53tvzY/5S1hTFpD53uqbHBmtxbToNeo0yEyVk+MZZBERCBpWvBHUSvnE6UVvAKjcbQSnPpGKpNiclZFpWkSdGtPXxqlt6t6Hr5FEWfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSCC+gdeJyiXxyLquNwnN5mj26bQ6df/LCe0GxKq1m0=;
 b=EAnrxHJ1VHsV9YwoSK8Zc+U/HpswKaXg2ImymxlynqsCzUzzGyLZD/32M+kIbr+aAPYsj0wGilpaK+cdCphQfX/KSdWeX77YJrIkJmFTseTzkYrtm5LRoHMsHGvmJ0k1c362PTngNapedPDtREB7vjuxlCci8Db7o9ZF1cvfCvAyjPA7853uTeaDm8tdEls7tG6YSSDT+1yoNNfBu2/CDhOIHVhw1timIyXlLK/JinkMBG1l+zVf5OUbvYYmohX5rDbadI0c4jj2vSzhvEGV2seGK4DONLjvkVzkZywsdGUtJgdLY/YdbARXtlXMliYzCGrTjrapF0e7tH7mVucPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSCC+gdeJyiXxyLquNwnN5mj26bQ6df/LCe0GxKq1m0=;
 b=nsWn5CAWUTWbUfHg1EKM4ysV46RGrToGRJ1UCFxMnGGeFWtZV3mH/IsiI/uFNSFZ1XmVQX6jhgNpfKdbQoncInm7+c47rVE+/qE92fJz7HuhsWK4sxWQdbu1gQMEV7r6iV77/y36nP3JKPWSaZJMXns87ZXTevCDt4nMz/WRWA6lXIYHQsKdYpcrj7bqhScQkoe5Rd0O+evKP3UOsclmp4mq23f4iP1hKtcTvBFlgKGNMvTZUVzYJFkmxv2o/ooQHIGEPZs1FmaI5eF1nbE1k/Tmw5iNMbvQZZClS/LKahae8+Pn5wG+Mh0RqvT/BsnYQos2vjjWt6vc1/XIuaeVTQ==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:03:51 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:03:51 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Ai Chao <aichao@kylinos.cn>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: mlxreg-io: use sysfs_emit() instead of
 sprintf()
Thread-Topic: [PATCH] platform/mellanox: mlxreg-io: use sysfs_emit() instead
 of sprintf()
Thread-Index: AQHbZ+5JgT69V7kebUCJ23REYvl4orMZGzVw
Date: Thu, 16 Jan 2025 09:03:51 +0000
Message-ID:
 <PH7PR12MB6668DFB042D73A37C7EC6C6BAF1A2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250116081129.2902274-1-aichao@kylinos.cn>
In-Reply-To: <20250116081129.2902274-1-aichao@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|PH0PR12MB5679:EE_
x-ms-office365-filtering-correlation-id: 9622329f-763a-4870-7f26-08dd360cb250
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2l5WExtdUhmOXZlellUZmdHbGlKN0NLNVlDZ1dxSm8zS0J2bG1VS3JCandS?=
 =?utf-8?B?bW84SVB2M2Rjb3NoS1lYNDBkRzB6N3VIK1Fyc1o0R0J6Q0RkOFA5MGRDQjZ5?=
 =?utf-8?B?M3JuOEo0QStLVjVGZkE3UlZBNzR4ck9YOGx3eWZIZ3lRR3ViUHVCVWZlbllW?=
 =?utf-8?B?ckJxRE0vSkZURzYvQ1YyQ1BISmxBT3NpQ1p1c2Yydkt5L0lxM3FDQVhaMDZl?=
 =?utf-8?B?TlFRdVZ4ZFlOSlpoNFdieTVxZGhaNmVyZ3ZZekZvRjhSMjI1NVhsS09UejM5?=
 =?utf-8?B?c3dVUVdjMmh1UXBXZVc4eHpBZFIzNHlHd3YwTlVZNDN3aEE2czFCUWZGdGtC?=
 =?utf-8?B?MWYxMEZjR0JBTHZSQzRZMnlkWTlWeG1aWS8xZjRXMGlTZXYzN0t2bHMwZG9S?=
 =?utf-8?B?eFVTeEFJMkxuZ0NEc2Q2bGtyNVFkc1BnNnVVdFJaTGQwV1lpRS91bFI0c25U?=
 =?utf-8?B?NE5XbU8vbnpjME9Td2QySTh5RCtiMmZBcFpEbXdEMnZRS1BBZmtTRll6dnh2?=
 =?utf-8?B?V29kb0ljRjJxTm0xejAzN1V1bmNLZWlqb3lIT0dkbjg0Q3F6SWE2aUhkR0E1?=
 =?utf-8?B?aml4ak9qNHNMWGpNeklJL1NqbDhNZzdvVW1RTkNVdHpLWExBTHI4TldRVDM1?=
 =?utf-8?B?TEs0TUZQWHlwcTd4UVFSbkNzZ096ZGFzU0RHd0xwRlJvUzBoTHN6RE1mNnFn?=
 =?utf-8?B?a205OEU2bDNxQlF2WmlDZDdEVWpVaGd2QWhqNFl1WWFUMHN5cmJ6ZVdNcXhl?=
 =?utf-8?B?aTUxYmVyR0g1bjdMN0paTzhkU3JhQko4RFZSSDBJbmV5WkUybnEwd0QvQUtw?=
 =?utf-8?B?ekhDdEorVE15dzkxejd1NnowYUszZ0pxSzNmRjY2azFyejBuNUtHNXc4Rk0z?=
 =?utf-8?B?M1ZnU0JvN2x4d1BIeDc0L3ZjZjU2MFE2dkIxSlVvUWtwWkY1UHE2OGNDZWRl?=
 =?utf-8?B?UHUyTzlQbncvSGRWMnYxUjZaV0ZCNmVGeDEreUhjYWFWK2hRcFdpV3dCS2sz?=
 =?utf-8?B?c1VOSHA1WmJlL2ErNmE1aGlaTEgyN0tSYU8yT1pyWUtwS3ZKTVlMR2RRMlBw?=
 =?utf-8?B?WTVBVkJEUm5oT0RzRXRRVTVwWnA5UitLTHcyZGhDNUZTeHlCTUx0MzRTZmVk?=
 =?utf-8?B?WHdsdi9UbzlKSU5rSGQ4Zy8xSFBlcU9EM2FuR3A1ajFhdFBaYnMzd1BlV3Bk?=
 =?utf-8?B?RVg0NUJSRlBJNzJJVndjUmU1YTN4TVBaQXFvbUJmcXYrRGZaWjJocHYzN3hX?=
 =?utf-8?B?NDgwNTl1bGpQbU5RbjZkcU9vUVFxcGpkNzFXYmxkTDNCT0puOVA4QklSbDQ4?=
 =?utf-8?B?MHkxQWxoTzgzajBXekdmQ05aemNXWHBQaVhTNStkQ0xSVFdENnRvZkI1TktO?=
 =?utf-8?B?ZWxZNmRpNnIxZnVTaUJFckhydWZkV21mU3lhZ2tmb0dDdnR4SmwwZmhwalpU?=
 =?utf-8?B?UGwxVGE5dmJrcFBXaDVHK3g2aHR4V2JSUGJ6cFlkWTBzTXJjZVdtY2IwVW5P?=
 =?utf-8?B?OWpCYnJIT1FuTS9taENzM1V6ckRiRnRnbE9zVDVRZHpWcGw0MElLS2VXbVhD?=
 =?utf-8?B?WGUvcy9jdzNiWElXaFpHR0F3ZDNXZ3dRdUk1ZDc2TEhNU3lkTWNaQnV6cjlk?=
 =?utf-8?B?WHVuTkJhZ1hzMUhrMlNRNUV4ZFpEOG0rRzhBa1d3cUdMak9MTm9oSHBvVmhx?=
 =?utf-8?B?SVdicG13ak5oTHFVOEkzWHFRL2xsSTNZd2hzVmFFUExaQ2FzQlY2WGcrdGNS?=
 =?utf-8?B?anFhaWQvZXNaWkxQdFU5OXhVSDdTTFN5a3FOMS90aHhZalZQdllHdTNKbHY1?=
 =?utf-8?B?WmgrUXBmSDg3Q0Y4dWZISW1qS2xYcTNyM0lyVDBybEVONllQdFQ3RzFHaXBZ?=
 =?utf-8?B?QjZTQnU5ME96K211TDVKWDhqTVVVZW95SlZNdmt0U2hCRFVvRWpRdmIzZys0?=
 =?utf-8?Q?RNyYqv5gKtFJbsTt7lSYv08KzlYsynVW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGtxLzJEMmpQb3JjdS81MXhmcDY3TG4wT2duNEJZK2hRdldEck53ZUV1VHpF?=
 =?utf-8?B?OWp6eUZHZmxZNEloODdCVFBtQkdsOU51cGNmYkZVRlN3RTUycG9Mck1YeVRl?=
 =?utf-8?B?WHFHZzI4UWdWY0ZqNXdMYmtwTlZUNVI1dFFKSVBRYS9lZG1Wb0Rhc1NpSjNH?=
 =?utf-8?B?cUlZd3FxYzhUeUFoMDJPbFRJN3BxaGRPNythbVBNbzhwMC9xZ2UrR1N3a0lR?=
 =?utf-8?B?bmltS1VkWVhxZitpUGE0RGZSY3JXMThlQ0tHRjJQajVJTC9IUjZ0Y2FoWVF6?=
 =?utf-8?B?aGM3cXRTb2RmQnVtOE5OZVlyNjZMUzVON3lLN1UranFiaWpKWk8rQ3h6SGll?=
 =?utf-8?B?bmJhUm4yTFhESlNrdmhpbmFIdUVWb1JZQzBtK3J6dkpaZWxvNkdIZSt1RUp4?=
 =?utf-8?B?Qko4YjJOeUNkZmFKdFEwZnZyRzQwa2g4SHB4Rm43Y3ZZeXFpOWdUQkZkTGlU?=
 =?utf-8?B?OFNmQmNwbTFpaGtQdWd6L3B3VitMOEgvTVp2akdVaUdCN1hYWGs2OUoxREJX?=
 =?utf-8?B?VlppS0FSeGZsVHp4YVFtejVZOFJCaWlyRnZQc3djUjc5MDZkTXQ0VUxIWS9t?=
 =?utf-8?B?UDZQZ3h2VVdJY1RxZW8wWkpZYzV3YkFsUldSR3hRUUNZY1g4K2ZSRkNhNG8y?=
 =?utf-8?B?aFRTQndhVisyNStneHdyemxsZ3BWZExsMW8zamk2UnZtR2FXQ3FCTjdlZ3g0?=
 =?utf-8?B?Y1lsWkkxWFk0bmVNd2VnenFjVHVpRlJWd0Jab2ZST0NCZTlETXVYbkV5MXNL?=
 =?utf-8?B?TDFPNUllYmdmQlJRUFM3VlI4ZnhYRHpjSWFqODdkTWRaaGJ5NWVoV29SMTdi?=
 =?utf-8?B?dTlhVGNodDZtQWdUNzlHdTIwaVd2aFU1WU1NRkdUNDkrVXZMWkZQSzBXUkZR?=
 =?utf-8?B?OVcybTlqcTVpandNYXFRY1RqMmNsUnpuQStoaWI4VGR1bEpPMXljMW9zV2VP?=
 =?utf-8?B?SEdma0ZsZ1MxLy9HdDV2MzE2bDBVMTFjRkVIcmV2aFF2c2FFcy9vZ1FObHMw?=
 =?utf-8?B?ZURTN3dPeHBoSFdrS2R6dzdmcEdVWUhCRUExWkpsaWQ4Q1U0NTlUWk0xNHFZ?=
 =?utf-8?B?dTZIK1FNTGt3VFVJS1FCTUNPdU1XS0VWOUJGVlJvOFBjTE1qYlh0YUxxTnk3?=
 =?utf-8?B?ZTA3TEJ2b1h5QXdLSk9GQWtENFdmZE83akZkMzl1YitZM2pCUWhnRVVzUklU?=
 =?utf-8?B?RFJ2SzhxM3g3aytoc3BZeEYvUXhsQThvYU4zdzZDd1BsbVlDS0RTTWdkYUxJ?=
 =?utf-8?B?TUhBeHRJb0x4alp0ODRaeDQvLy9UMWxyNHQ3L0VGZVgvZXU5ckU4Znd4L2JG?=
 =?utf-8?B?L2xmNnc1L20vOXpNVWovQ0kvaGVDaVlIamJHcGxKSkdzc1p5UnkzTUYxemV1?=
 =?utf-8?B?SDhrNDcyL0sxZ1ZuUXNyS09UbmYwOXFSdVZ6WVZOY2F3M1NyWmxUQm5XSDlP?=
 =?utf-8?B?bEtINFoxMVVjdnd1UGxwNG9nRG1NbDdkd0dpYzMrdlZadDBHU21WdGw2ODhm?=
 =?utf-8?B?MEprUXI3UXNvV1VwSGlIUTJPT0kyaGUzcWp6RkpUS2hZUDRHYVMzanBGc0Z3?=
 =?utf-8?B?YnpCYmRkMDBCVFpHanYvVHFEWUN0Z3FWa1p3bVozQjc4VWh0ajJ6czZzbnU2?=
 =?utf-8?B?MGw0YUtxSE43ZkxrVEptOVducDBDNUlJdk9YV1EvRkpJNWx4ajdBVXdVNFNM?=
 =?utf-8?B?cnkzVERjTjVaTUhDenpEMmZFZDA1N2ZYeUhuM3R2MXJFZ0hPNmxjNlNZL245?=
 =?utf-8?B?ZzBMMXh5VzFMdHk1b1hud1F5dUxLL09ZcVZzZlY4a25XZDdYNFdxK2hPS2tI?=
 =?utf-8?B?VzhjZWtjUXZJd1BXcHBDWXg2cXBoRUkzZlVPaE9VOTV5c281NWw3U0ZpbVpE?=
 =?utf-8?B?ZWpFNjBHYk1DditUeFFGUFQ4dXc1UHhrb2hKdmluLzhmWDI3Z0I5N0JBZWQ4?=
 =?utf-8?B?TlIvelFtTEFDWnBQSmJJTEVpM1REWWwvZGRlY1BBMk54azZKenFTSlZLbnYv?=
 =?utf-8?B?KzdWTjk5R1NzL2F5aEQwalh2NSthaDlWbSsvSWdEK2NIYzFNa016T0w4d3cr?=
 =?utf-8?B?RE03U1BxYmpLbWRFRllnaVZ2c2FaLzg3amZROHZuMXA1Q0swLzZidW0xcE5O?=
 =?utf-8?Q?TjG4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9622329f-763a-4870-7f26-08dd360cb250
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 09:03:51.5521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uTGsvUw/cX8VY02l6Q2Q5eFhsFxRJS5NOg300N7Qxu/1wAcmzA9deV7l9CPFX8JEtR61J7Jx+ZvHi+S8OoENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWkgQ2hhbyA8YWljaGFv
QGt5bGlub3MuY24+DQo+IFNlbnQ6IFRodXJzZGF5LCAxNiBKYW51YXJ5IDIwMjUgMTA6MTENCj4g
VG86IGhkZWdvZWRlQHJlZGhhdC5jb207IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBW
YWRpbSBQYXN0ZXJuYWsNCj4gPHZhZGltcEBudmlkaWEuY29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBBaSBDaGFvIDxhaWNoYW9Aa3lsaW5vcy5jbj4NCj4gU3ViamVjdDogW1BBVENIXSBwbGF0Zm9y
bS9tZWxsYW5veDogbWx4cmVnLWlvOiB1c2Ugc3lzZnNfZW1pdCgpIGluc3RlYWQgb2YNCj4gc3By
aW50ZigpDQo+IA0KPiBGb2xsb3cgdGhlIGFkdmljZSBpbiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL3N5c2ZzLnJzdDoNCj4gc2hvdygpIHNob3VsZCBvbmx5IHVzZSBzeXNmc19lbWl0KCkgb3Ig
c3lzZnNfZW1pdF9hdCgpIHdoZW4gZm9ybWF0dGluZyB0aGUNCj4gdmFsdWUgdG8gYmUgcmV0dXJu
ZWQgdG8gdXNlciBzcGFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFpIENoYW8gPGFpY2hhb0Br
eWxpbm9zLmNuPg0KDQpBY2tlZC1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNv
bT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWlvLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1pby5jDQo+
IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaW8uYw0KPiBpbmRleCA1OTUyNzYy
MDZiYWYuLjk3ZmVmZTZjMzhkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS9tZWxs
YW5veC9tbHhyZWctaW8uYw0KPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJl
Zy1pby5jDQo+IEBAIC0xMjYsNyArMTI2LDcgQEAgbWx4cmVnX2lvX2F0dHJfc2hvdyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiANCj4gIAlt
dXRleF91bmxvY2soJnByaXYtPmlvX2xvY2spOw0KPiANCj4gLQlyZXR1cm4gc3ByaW50ZihidWYs
ICIldVxuIiwgcmVndmFsKTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIldVxuIiwgcmVn
dmFsKTsNCj4gDQo+ICBhY2Nlc3NfZXJyb3I6DQo+ICAJbXV0ZXhfdW5sb2NrKCZwcml2LT5pb19s
b2NrKTsNCj4gLS0NCj4gMi40Ny4xDQoNCg==
