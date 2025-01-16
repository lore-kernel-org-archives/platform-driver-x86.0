Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BA51D6DAD;
	Thu, 16 Jan 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018189; cv=fail; b=DoIl8tg9l9kE3H9yg7czaHNKhmm7ipPlz1lKn00yIC5Ni9St3XybpsWHK6FObRVLGe51oI/l6lE7ufp1nS5CyCRdqhurhxJodTWMtNndfGyz2afPVcFrgXd8TpySztqE0tp0xLAv27dceBQ/mmQIpm5gTKrPUxoK0Iuot5TtZGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018189; c=relaxed/simple;
	bh=ixcEg0BQ62hx85MRvWxLSp0WXJowxVwQoaOjbFFIc4I=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ElJhI0f0gbLXOXvV6y8WhKohrFOyVEpFpiBwY5awNOk+t1Z2zI69m21nFlF1bETHT135mg/umvMICYRpffWu/Z0lnVmExjP2B/FrY2jd7QZ0gtrk/Y+hBltSDPhWVhC91GeSDK3TyQ5lYT80SBwiclJSxB5GNJzwz0TXlPOAnHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hBT/Ru6K; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hBT/Ru6K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4Jh3hagqaM/lELVgjjHFIMjnzlrUwJq4RQrtyTugS0w2c1g1Ms1/fgGGApy+Ju9Ysj8BYmItruPDeR5G7IXIpNOsSb/zZAS12nC/yAbsKncTRn1SXlYu3OOXuQ3yaI35vm2OG4of8w3NaWws2n8X83MGyuHT2EgCV51WqEiez3WWDjiksYt1CZiZ8rmQRT6dFnjL3b/9RqE57IIbRn3FHxGuyTGgCxuDHU8vkkZxxQSJDtvqgeiks5knBobUJWUnrfIw1eIslFgpe3i+4KDPPKqQ07tXX8wQOM6GB9q6DYt9AvPPAykLf8HmQdwA8Oe1Ylxndolxt5m0kPbn5yeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixcEg0BQ62hx85MRvWxLSp0WXJowxVwQoaOjbFFIc4I=;
 b=YvC8csopznLtHH1pUXj/Z/45P6/BJ+Gu3m7blFfGnZ2KPDbBrWw8V83AiVSIxLRGusIiMvhdK9FTIWRTl4Rwudep97O8gvZUmv8Ks83yjBFKkhIjpzL+Axkh+fdkbNQQGBJq9wqHikJFMcA63ShdAFSTczUvRMnDzOI0vBrbHF8jKb/KUbDxqZcz0dOTvl2iDsNmVk7DVz2XeT6Nx+0dwxiwQ9wph9S/F8uVexlsiLXyhk1KwDrMWvYp+ORyMmTT5oBit+SMtHZDBcNoFAbJFBo7mdBmHeT7hjNSFqlJ0a2eu6pKOA8ob13BnlmBbdJhxs1p8sPJMG5Y9cm+kiPaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixcEg0BQ62hx85MRvWxLSp0WXJowxVwQoaOjbFFIc4I=;
 b=hBT/Ru6KMCLFwjaTDesk9BLMyJMMcFLXmxaZq10KXhAir8onNV0plF9MCK2eQUjJCaozd3BAgrjvtPwi9R3Hof80xJifqzsYBNwgcdobOF5M7CxRSm1PJcjKG9C3WfXTRi+V5YIdNRqEG0MU7HgJkl5Ciwf0b68bR+9ffeGqM1PfJSC5vZGP6A7EkE+m9IhQhGlHhGuBJl117zk6fngUIk8lZAn/Q3SfEkkE0TWFbsWrBdPn4ycC60j6tTm7eW1A61l6C1hDi7XLIBgiBf5dTar/G7tw8NSYu+m6zQjHa0ScDV2nDESdMnCzmnXX+VPzNgjT00lwL+ok70L4gsmWFQ==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:03:04 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:03:04 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Ai Chao <aichao@kylinos.cn>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: mlxbf-bootctl: use sysfs_emit()
 instead of sprintf()
Thread-Topic: [PATCH] platform/mellanox: mlxbf-bootctl: use sysfs_emit()
 instead of sprintf()
Thread-Index: AQHbZ+3ifyrIjovEEEeJL5vpR87RAbMZGpaA
Date: Thu, 16 Jan 2025 09:03:03 +0000
Message-ID:
 <PH7PR12MB666888FF01C33BAE2BD7F663AF1A2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250116080836.2890442-1-aichao@kylinos.cn>
In-Reply-To: <20250116080836.2890442-1-aichao@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|PH0PR12MB5679:EE_
x-ms-office365-filtering-correlation-id: b020f6d8-deff-4479-0a03-08dd360c95fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1VleUQyd2tRSUlsSUd0NWxWVElyOVlJQnhNb0doRWE2V3Nab293Ym1uTzdr?=
 =?utf-8?B?VWI3ay9NMmt3ejFSYUc0TW03OGFJbnhwV1RiNUxsQ0x4NFlGcUhvRkZkMEgz?=
 =?utf-8?B?VXU5Vm9pL0ZyN0kvSStGcitBUFNNVXBSV01DNTJXZVQzOGJ1aGFDRFZuQ2h6?=
 =?utf-8?B?bDg2RnZuVkhlazFOSHpWTFppMmtNLzc4VUZEK29DT1ZPNFZKaGk1emJNekNR?=
 =?utf-8?B?WnNQWklHM3JPY2xmVE9HYkwzZysyUE12SjVXcG9VdUhOSXJudURjYXNEaW8v?=
 =?utf-8?B?azFncHdkSm45SkZubGpncXlUenBwSjhLdXF2Wm1PTWo0ZldnOTBDSVY1aWFH?=
 =?utf-8?B?WURBNDh1MHZCSkptL25sZlZpSFpiZFFRd1VEK1lSeGNPTUdaaWU3Y3FUNzVS?=
 =?utf-8?B?WGJZU3ZsUWdwWjdHZGJXTFNsckV1aUxzL084Z2ZnRFVCQXVSODZrcENFMkhi?=
 =?utf-8?B?WGNNSVJzWWdKdVMzU3MvTTE0aFg2SjlXWFlzbVlNdjV4M0lpUWFrOFQ0U2lk?=
 =?utf-8?B?MmF6dHU1RkwxOUNEL25aSDBkVWhEalZVSjJHL0NZU2VwSGlXeUxIMURJUmFv?=
 =?utf-8?B?N0FsdEZMUk1pVnFja3E3YkJlSGdUNnBMR0ZZWUpHbHdIbHYxcjhPSmRyT1d0?=
 =?utf-8?B?cUs4S1V6ZHVwWXFzU084RWwxWU1qdXRURHZndjNJRUYwYzRsWlhGcUYrUXB5?=
 =?utf-8?B?S0ZhNXhPTCt4NWkyaUkvVWVjSHNjbDhqbWF3MkZ5RFpTeVZBbExaRTE2djlx?=
 =?utf-8?B?ZVdtTE5zU2NlSkZnSDJ4dE5kWTE3dm9VRWlWOFpNU2pRMmVQeTlUalIveEJN?=
 =?utf-8?B?WlNzOUVKM0YrRU1vdm9CdGQzQkxrZXZEVnRVN2hvdnZlQ2Vqa2tZNklMd2FU?=
 =?utf-8?B?eGoyeGpiRXJCYThjbVBWSjY1eTZWNHFtVDRjejRvazdzUVoyTmhxcDB0K3J5?=
 =?utf-8?B?RERTT0FRM0hZdzlPdG1BNERwNURwY1ZMNFR1bHNVSW9SNnZ1WTV4ZWlDcnVH?=
 =?utf-8?B?VWhULzBUSVV4b1IzY01HZnlRTXFWdHVyMEEzWHdmL3ZsMG83NTlGTkQvZnlS?=
 =?utf-8?B?ZlFGd2lxL05UcGZzTkFsbW5mRTlnd3FwQmkwRmw0UHVKbStPaVVzSk53Z0JI?=
 =?utf-8?B?UHM3QjlLKzhKbS9TRDh5aEpJRURSejhoT3VxbCtzeXl3Nk9DS3VUeHJFVHpT?=
 =?utf-8?B?VXluY25YRXFSbnlyT0NwTThMZDZZeWdDNlo2b285N2Ixd2psRjdkSmpDL1RJ?=
 =?utf-8?B?eXFYRFFZMWZoWnNZZXJaTERqWjlIalJINjhneU5oNktYNE1EN092ejlMbDVO?=
 =?utf-8?B?bmZidjA3eEdQZk5VUFJGYmZpRkZyL2ZxbFlsMXpvSWt1QWw5c3FIbjZGOWcr?=
 =?utf-8?B?d1lYSjI2dHRDeHYvWGZrQVZzMnRFYzgvRTFIUW03aG9EaWpVYm90UEtnenNz?=
 =?utf-8?B?RXhzcXh1ZFB4YWsxa2FIbml2L3lnTGs1NEdjZnBRU0JzcHFQMmlsSm45RzRj?=
 =?utf-8?B?Z25naTNSdi9FM3cwNTJpUC9VK2R0Sm9rTDJ2d1NDeHA3VUptUjB5TmQ3MzNX?=
 =?utf-8?B?M2FwWCt0TXp6emxBYUlDemFheHY0MVlmaGYweEFoa3hEYklNYk5EZ0p2a2ta?=
 =?utf-8?B?aEhObVNpeGM5ZndJbm44ZnFDTkJ4UG1nMzRJRGQvOTdpUVlodG9ZL1JCSFJF?=
 =?utf-8?B?em9vY0NSU09tdzJMQTZqL1lVdDVhbVZldkFyb09lMzZld0F3eElEOFpqLzZH?=
 =?utf-8?B?eW44TGFNc0tYMEIvYUVrem5KTnVUVkpwclFoOWRVTEdmRWlCaGVIRVdGTG9W?=
 =?utf-8?B?UnovWTFRVWp5WTRrb1J2YXE0Rk9GOHNWY2k4RnhwYzh0NU81d1pDblVmVHpE?=
 =?utf-8?B?akV5RjltdUpvZnZlUUVGQ0dGbG1ocWZxZGt5M2RjOG5LWkswNVJ1WU90NG9P?=
 =?utf-8?Q?m/WMMU3SFUkp8w1dCo6Du+RoLniN5A8z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnFDQzIxU0pYbjNJdmYzVlFEZTBCYTIreWt3U1FjQWYwU0JyMkRZbHFlSEZN?=
 =?utf-8?B?b3pvQzJQeXd6dFFPSDBnRSs1K0R2N1E0NEoxTVM1RERLWGE5dFN3ZkViaURZ?=
 =?utf-8?B?YkMxdDJra2F5TlM2cndjdEcrTmxLYmZoVk1ubFVyMlBjZTVXT3BHWEZGYVl1?=
 =?utf-8?B?QlJKY210MmFRRXpDUE5qQXNFazVNQ3FwbnpBcjFKd3ZJZzRTQ0hjRC9jQ0JW?=
 =?utf-8?B?eWhBaExlWWpjQ3A2dXV3Nlppeml0T054RzRtZnR1ZzNNUEJBM0grSVFQakxz?=
 =?utf-8?B?S3lSQUF3czlWek4zdWZqT2tPS0RjMElHZnAxYU5MQ1A3ZW1za0lDZkF3Y2tm?=
 =?utf-8?B?a3AvclZ4d3l4b1BjR2xJeWNUZVhUNjJVSUl2MHRhTzRxWnp3STZRMmVMaTlo?=
 =?utf-8?B?ZkhxWkRUTFo5S21rVkFHMHdvRFk1UitveTJRSFJjc3UraldLTXVoVEh2Q1pZ?=
 =?utf-8?B?cmh3WWM1d20xemdjK2hxSEtvT0swbHk2MEp4dHhXUFowNTNVbVJ2ckIzb2Fx?=
 =?utf-8?B?VVlMeno0c3ptV0xGR3ZoNTNZQzUzbWhUaFFZYXBsdkVOZVJDRlJGQjVSVXlJ?=
 =?utf-8?B?WHRNd3NkVHRJUnZpaTRIbnhLYzBtam10RU1tYWYwakdRSml1RWQ3RCt2TjZW?=
 =?utf-8?B?M3JNajFLZm5RZVZLd2hzZDY4UFhUaThHTXltS3hmZU1rcHNZN0dUZXVhVDEz?=
 =?utf-8?B?SG5rMTZkeVRNY1lpR3ZnRGZKNTZkMlRjbS95QUxyVENWcXRPWWNrMXNSYk5w?=
 =?utf-8?B?VHE2V1l0ZFNIZmVlUmdjbGxGTmVlRVZRRU5BaGZLT1Z0NlkvVDlxWGxBNjVu?=
 =?utf-8?B?cDQ4ZEtGKy8rc1FZSDhjenFsdXoxMXJ3bmlnME9NbzhuUmpxazM5LzlvWjdv?=
 =?utf-8?B?NHlFNnRyQkg3aTdBM1pDMmp0UHcyVXNtQ2lsZlBtL1JWMTNUL1hNQ2dLZnpm?=
 =?utf-8?B?YnBRWUNRc0xMaG4yQWsrVXEwVFRLUjVSTFMxUUlEVm5ZbEFpZWIrblBmSlFS?=
 =?utf-8?B?S01FMDdtSXdEOHp5NlpWa1NsUU1rdnRJK1U3L2x6WW51VTVDL2VjSmxteHFO?=
 =?utf-8?B?cXJpeENNbzFOQUUzbTFiWitrNDJwNXZFUU5LbW4yaXdpS2NTTVVmc2JHQ3ZN?=
 =?utf-8?B?SHZMNGhDQ2JUSEhJMWphNDJtaDYvaU1XUUhBajNtK2dkVk92dmdGdFFtb0tk?=
 =?utf-8?B?R0s1NTYwN1ZPanUwNURqZDc5bldENVE0eDcwV2pIUytQZTVObXlDSytJd2dq?=
 =?utf-8?B?UEFaNUlkQVl1YjFFWkZNc1BIZi9VNE5CSVQwZGcwMThBa1lCVWFybFJvMno4?=
 =?utf-8?B?MHlDbGRJWjQ5VXBOM01VN0J3OURkV2llL0hwbC9Oc1ZjNDJiRUdwNEVTNkN2?=
 =?utf-8?B?SVpNNnJ2eE1SbUFEMEptbWUyZzZRRkhEcFBqVnE5N0pQN280azZlSVJRNHdi?=
 =?utf-8?B?cWxJOTh3OGJCWjVaeDhrUjZiTWVwUUZFQlFUV0FDMGl6RU9jQjJIOXJ4dHJY?=
 =?utf-8?B?bUltT0hCTG5hazRzdXRPZlhOQWZWK3o1ejVYY3RoV2IxRXBPaVR4UkQzVlRX?=
 =?utf-8?B?a21Xby9ZYXFwZTZ0N1RHM3VaQ3VPbDFWZGRTb3ltMnBsRDNmM3JRKzFWYk5m?=
 =?utf-8?B?OENYeUVTZ1pVSTRNVWs3K2xUNmxhVHVJZmQ5L1N2TnBPNHExend2d3YrT3BK?=
 =?utf-8?B?em5UTERPS05HZmxMSDQ2T3A2blNCRFJyOEJSdlZWWVF2UEs4MithWVg2VGJG?=
 =?utf-8?B?b2VmcWtoclpUZkZJSnZBQWo1S2JqTjlpbW9seUlUOHNEVVYrTUxFTmIwb0Uz?=
 =?utf-8?B?eE82TXBjT2lIdmpzZld5RFZNOWtaVjNGWkdwSmJKZVJFSjJEY0Jvd2VRV0cr?=
 =?utf-8?B?NWJ5RHU0M0JiZVNPMmhxZ1hLUDdWMHF6Rjk5N3pUZ2lmNUYrM1QzOStsdFVW?=
 =?utf-8?B?RXhQWmRQK1E2WHRuc1NGVjdmb3BzSWVDMDhOWFo2MnpwZWlNT3c4ZlFrbmd6?=
 =?utf-8?B?OVEwZXhnMFlNWkRwS1JBWUhWNEN2Yjh3dkp4cGVwOStSU05QSHVqV0pRb0h3?=
 =?utf-8?B?K1NjSGYrUHhHMW9vQVY5N1U2WnpKa2NPRnpFRWhyeHZvM3psYWJjbTJIRnNx?=
 =?utf-8?Q?2QRo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b020f6d8-deff-4479-0a03-08dd360c95fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 09:03:04.0208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmuiSkCAPxkIBCSZCKq2q9NwLohav9fmpdOVHJk13cUpXOEGYfNUDhKbCZKtf/G2TzD+/kw1CL7Dr+e3ywtmZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWkgQ2hhbyA8YWljaGFv
QGt5bGlub3MuY24+DQo+IFNlbnQ6IFRodXJzZGF5LCAxNiBKYW51YXJ5IDIwMjUgMTA6MDkNCj4g
VG86IGhkZWdvZWRlQHJlZGhhdC5jb207IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBW
YWRpbSBQYXN0ZXJuYWsNCj4gPHZhZGltcEBudmlkaWEuY29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBBaSBDaGFvIDxhaWNoYW9Aa3lsaW5vcy5jbj4NCj4gU3ViamVjdDogW1BBVENIXSBwbGF0Zm9y
bS9tZWxsYW5veDogbWx4YmYtYm9vdGN0bDogdXNlIHN5c2ZzX2VtaXQoKSBpbnN0ZWFkDQo+IG9m
IHNwcmludGYoKQ0KPiANCj4gRm9sbG93IHRoZSBhZHZpY2UgaW4gRG9jdW1lbnRhdGlvbi9maWxl
c3lzdGVtcy9zeXNmcy5yc3Q6DQo+IHNob3coKSBzaG91bGQgb25seSB1c2Ugc3lzZnNfZW1pdCgp
IG9yIHN5c2ZzX2VtaXRfYXQoKSB3aGVuIGZvcm1hdHRpbmcgdGhlDQo+IHZhbHVlIHRvIGJlIHJl
dHVybmVkIHRvIHVzZXIgc3BhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBaSBDaGFvIDxhaWNo
YW9Aa3lsaW5vcy5jbj4NCg0KQWNrZWQtYnk6IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRp
YS5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seGJmLWJvb3Rj
dGwuYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0v
bWVsbGFub3gvbWx4YmYtYm9vdGN0bC5jDQo+IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9t
bHhiZi1ib290Y3RsLmMNCj4gaW5kZXggYTIwMTFhZjQ4MjAxLi45Y2FlMDczNDhkNWUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtYm9vdGN0bC5jDQo+ICsr
KyBiL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtYm9vdGN0bC5jDQo+IEBAIC0xNzcs
NyArMTc3LDcgQEAgc3RhdGljIHNzaXplX3QgcG9zdF9yZXNldF93ZG9nX3Nob3coc3RydWN0IGRl
dmljZQ0KPiAqZGV2LA0KPiAgCWlmIChyZXQgPCAwKQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4g
LQlyZXR1cm4gc3ByaW50ZihidWYsICIlZFxuIiwgcmV0KTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1p
dChidWYsICIlZFxuIiwgcmV0KTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgc3NpemVfdCBwb3N0X3Jl
c2V0X3dkb2dfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBAQCAtMjA2LDcgKzIwNiw3DQo+IEBA
IHN0YXRpYyBzc2l6ZV90IG1seGJmX2Jvb3RjdGxfc2hvdyhpbnQgc21jX29wLCBjaGFyICpidWYp
DQo+ICAJaWYgKGFjdGlvbiA8IDApDQo+ICAJCXJldHVybiBhY3Rpb247DQo+IA0KPiAtCXJldHVy
biBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCBtbHhiZl9ib290Y3RsX2FjdGlvbl90b19zdHJpbmcoYWN0
aW9uKSk7DQo+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXNcbiIsDQo+ICttbHhiZl9ib290
Y3RsX2FjdGlvbl90b19zdHJpbmcoYWN0aW9uKSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBt
bHhiZl9ib290Y3RsX3N0b3JlKGludCBzbWNfb3AsIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGNv
dW50KSBAQCAtDQo+IDI3NCwxNCArMjc0LDE0IEBAIHN0YXRpYyBzc2l6ZV90IGxpZmVjeWNsZV9z
dGF0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gIAkgKiBkdWUgdG8gdXNpbmcgdGhlIHRl
c3QgYml0cy4NCj4gIAkgKi8NCj4gIAlpZiAodGVzdF9zdGF0ZSkgew0KPiAtCQlyZXR1cm4gc3By
aW50ZihidWYsICIlcyh0ZXN0KVxuIiwNCj4gKwkJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXMo
dGVzdClcbiIsDQo+ICAJCQkgICAgICAgbWx4YmZfYm9vdGN0bF9saWZlY3ljbGVfc3RhdGVzW2xj
X3N0YXRlXSk7DQo+ICAJfSBlbHNlIGlmICh1c2VfZGV2X2tleSAmJg0KPiAgCQkgICAobGNfc3Rh
dGUgPT0gTUxYQkZfQk9PVENUTF9TQl9MSUZFQ1lDTEVfR0FfU0VDVVJFKSkgew0KPiAtCQlyZXR1
cm4gc3ByaW50ZihidWYsICJTZWN1cmVkIChkZXZlbG9wbWVudClcbiIpOw0KPiArCQlyZXR1cm4g
c3lzZnNfZW1pdChidWYsICJTZWN1cmVkIChkZXZlbG9wbWVudClcbiIpOw0KPiAgCX0NCj4gDQo+
IC0JcmV0dXJuIHNwcmludGYoYnVmLCAiJXNcbiIsIG1seGJmX2Jvb3RjdGxfbGlmZWN5Y2xlX3N0
YXRlc1tsY19zdGF0ZV0pOw0KPiArCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLA0KPiAr
bWx4YmZfYm9vdGN0bF9saWZlY3ljbGVfc3RhdGVzW2xjX3N0YXRlXSk7DQo+ICB9DQo+IA0KPiAg
c3RhdGljIHNzaXplX3Qgc2VjdXJlX2Jvb3RfZnVzZV9zdGF0ZV9zaG93KHN0cnVjdCBkZXZpY2Ug
KmRldiwgQEAgLTMzMiw5DQo+ICszMzIsOSBAQCBzdGF0aWMgc3NpemVfdCBzZWN1cmVfYm9vdF9m
dXNlX3N0YXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiAgCQkJZWxzZQ0KPiAgCQkJCXN0
YXR1cyA9IHZhbGlkID8gIkludmFsaWQiIDogIkZyZWUiOw0KPiAgCQl9DQo+IC0JCWJ1Zl9sZW4g
Kz0gc3ByaW50ZihidWYgKyBidWZfbGVuLCAiJWQ6JXMgIiwga2V5LCBzdGF0dXMpOw0KPiArCQli
dWZfbGVuICs9IHN5c2ZzX2VtaXQoYnVmICsgYnVmX2xlbiwgIiVkOiVzICIsIGtleSwgc3RhdHVz
KTsNCj4gIAl9DQo+IC0JYnVmX2xlbiArPSBzcHJpbnRmKGJ1ZiArIGJ1Zl9sZW4sICJcbiIpOw0K
PiArCWJ1Zl9sZW4gKz0gc3lzZnNfZW1pdChidWYgKyBidWZfbGVuLCAiXG4iKTsNCj4gDQo+ICAJ
cmV0dXJuIGJ1Zl9sZW47DQo+ICB9DQo+IC0tDQo+IDIuNDcuMQ0KDQo=
