Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12ED15666D
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jan 2025 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587041; cv=fail; b=mJuondpDLi7m7oSc1Uza/ceiPe/onp7l3MIC6M2YDHOvh04ChiEdguSRwdZagdOJ+Jma8sOh3iI3AkK3ivpsCqf5gT1oOuA0hmAG2wGKRLZZjz1y7qI3oTm/KhiIVg25GuHLTnMoov8TghlcNFZx9IpEdW37ayYwvHAAmNSjXAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587041; c=relaxed/simple;
	bh=7G7MjYc/mRJiPYnoOaEGKxb+Ci/4+aytq81G9VFGiXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i4xrEQ5wuGdi2BPEx8WELTPhPZFxZtqRF42B7FauKUZE+XgsaqvdiCsa3mLsJf5FmpivnHedNOH2zUD6pURlq4A+yCj96YZjt94lDk/55BY80lY6WK1lrEqGwZZyh8mWgCvUExZU2Q7lGQ2zt//IdCWnGdy+nMn1DK+3aA4D1y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gdc0mQaK; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gdc0mQaK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGIhBeF/M03yOGlGQOE/H/gcncP162HOWIEACrRqeOxBXQLQUXg6mDR6a/nOGgVnbML1WTmnyY69PfmDfd551JvP+L2zhLmAKDUL5ChBKywDqdyFKojbEXo5x8E2Nr0DeP2G61CrdycT14dZmcTTqzHuaRIEK6Iud2CahAlRIZz3ubG1CReqoq99g9Pk8ztU8LmLnqoNsFO93auHDN5Vj+wUE600c/KcxuSqQTv6ngvP6j0q3TQAN5BzBrDzZlpnvzQUi7q4HCrdIxZk2epN64rE4TIY4mCRnHIr9A3KtY/MKliPG2FZeU9Hat1HdYYHpeaikHuVY6QnXi/LulU+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7G7MjYc/mRJiPYnoOaEGKxb+Ci/4+aytq81G9VFGiXc=;
 b=BhB+d1oETNSBMgDcUCHS4uc6jIFJU5Ur/lobSvtdPNq5TQ22Bfxzl3BkkKO5xRt9KW7NpCdB6KWlTnWbkhRip0FVuibNP0hlJKpMSVWLG6sRe+4x7PU3NOx7FXS+NE0zbIuf3D460Hjatl5njCQK/oqrDF3zzoQhs4J0zDn79x6wwmCJ+8U7YPsdPlmJMjTUWf0B9Xxetqolq/pMaA7YUFk15h3amVupvMgFykonVW8JymGtftv262IELaPIar+4538orDXUjaPxQWPoNgzGMMdZCW7R77oTsFp3yCCWm9BregjX3wXICfWsLxIE6IJLg+UWtTTuFYZCcO61DAoI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7G7MjYc/mRJiPYnoOaEGKxb+Ci/4+aytq81G9VFGiXc=;
 b=Gdc0mQaKeYl8tWDLfDWrUnHjpxWt4UFcjnhF9Qe+HLrnY3B/xAZU+opwkTHRoooxZp/3iTerrnoVzAXzV1/MgR4u6OQjewM0Mq4AOOQmXMLCkptKYSJrdM3IvVtBWa2OkLm9hScJ0ZvKhKFf29mdNSG0/9PMFx+FgE114wwUDXjA1AWH2f3j0hEFnJReokr7bgLWB+gQdV5rJltDA8GESOQhRGdc5UGsBHeCvwDlVTQOv19gsRUIMNbgkFHwEdp1OHGuudyKnntgKWx/SaopARqlkwJUihHB/hGASJkAb9NHSfWL6MXn+Jsv1TILA5gma1DF6Vg800SXjNlh9zCVJw==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Sat, 11 Jan
 2025 09:17:11 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8335.010; Sat, 11 Jan 2025
 09:17:11 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next 11/11] MAINTAINERS: Remove MELLANOX PLATFORM
 DRIVER item
Thread-Topic: [PATCH platform-next 11/11] MAINTAINERS: Remove MELLANOX
 PLATFORM DRIVER item
Thread-Index: AQHbY2ZtZIHO0tw/kUWMjBuCbi3b1LMRQamAgAAJh7A=
Date: Sat, 11 Jan 2025 09:17:11 +0000
Message-ID:
 <PH7PR12MB6668CF708DC570A7EA9FDDACAF1D2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
 <20250110134515.8164-12-vadimp@nvidia.com>
 <f47671b2-8415-41e1-bccb-ba8e78090692@kernel.org>
In-Reply-To: <f47671b2-8415-41e1-bccb-ba8e78090692@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|SJ2PR12MB8651:EE_
x-ms-office365-filtering-correlation-id: 3b9801bc-17c7-46a3-fa7b-08dd3220bb08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SEwwVHo1UHBzWSt2VnYvZlRiMEVGUUk4MFZ4UUJnaFpBSjJrc2N3K210bHJq?=
 =?utf-8?B?VHFCMFlTWDFKZzhvdEJmODBoLzF6MWo2V2JpV3NnSWxWSFl1VzIwWTRTLy8r?=
 =?utf-8?B?RDVrQUNKZzNuc29KUERHYzI1STJMcWwyZmJ6Ym84Qks3WGl6bU94NWx2RTc2?=
 =?utf-8?B?NDdEeFN6UGFPYXo1MDNDVWNIcmtXMlIrcHdRdXRmbyt5a3ZVNys0K3hLQnFt?=
 =?utf-8?B?dGdYMXlmTDMrQnRvMWtBeTQrNHdrcXhoMUJvM1FBdTBDajdGUlE2Yk5QaTBp?=
 =?utf-8?B?TlEwb056SEUzU3NBZnRZQTBFK0hNeW03VTFrV2wwYm4rUWxaRnFXcHl2VkRP?=
 =?utf-8?B?aWpOdDZ6V3p3U2pwS2svRm1aaUZvWkR4S2ZpelhOMXpsS28wQTMya0NEQUQ1?=
 =?utf-8?B?MG5lTDQ0MlllNzU5YzdqTGJnMVoyS21EK3k3dVlOTmZVNUYva0RCSWFNdGlo?=
 =?utf-8?B?RGwzYjVTMFR0cEovT09MYzRRaTE2TnVMQXk2WitYNy84YXZBWjRvTWdrMmtt?=
 =?utf-8?B?cGlxV1dRTTdEYXhxQ29TWlZ4bW9aNkd4UFNjN053SklmeStyUGVDRVByV0cy?=
 =?utf-8?B?ZzZIQUtnR05lUTR2elFYSEoxeUJ1VkI5dVZwTHZRMjR6UlFkR2V6THh6TE8x?=
 =?utf-8?B?MTllaWNaTDgrQnhzWlN6K3luWHAvQWNNTVhucEo5c2lmL3Ivb3RPOVdZWkRT?=
 =?utf-8?B?dEJoK1V0V3lSZjZyWGtKNEFrVDFWbXhaSldSMEdtNkExWWt3WklKallhRERN?=
 =?utf-8?B?NnRJZEQ5WEszUUhMNlZGdWdDVmdkWDdBZmtxcU4vREt2MCtUOU1Ub3pKQ1M3?=
 =?utf-8?B?eXlvVE1YTzNDSVViNDVqa00vTVkxdUpadXJmM3FWdnoyZ3FRRG1yaExEc1Rj?=
 =?utf-8?B?djJDcjhNbGNHUzJDb0Q5bXpBYkxUM2lCY1dKOTYzb1dmeTVEaUYxWjMrRy9k?=
 =?utf-8?B?RFoxL29JaGV3L09zOUltZjNaNW5OcStBOTZ0cXdzbGR5S3UyYzJVQ3VBWnlx?=
 =?utf-8?B?R3FLWWY2eTIxcllBSDdsdmNMQjZJd0NMNFBUeW0yMElvbm9oZVdtZTBUU29h?=
 =?utf-8?B?Mitadkp6TndxajNpMWtDVThFZEp4aWsyUFREL25ORlVGeUtWNjZLRm9HYnNs?=
 =?utf-8?B?Wlhjd0FwM1lWTXdEcG1kWnFqMGgxOEFQaW53TGF4TjdmdjFwNWJubWY5ODhz?=
 =?utf-8?B?TkhnRHpLa0NCU1ZDNTQ0L3FnempvRlFmRFo1VXMxeGRRdFp5a2wyTnVkVG8r?=
 =?utf-8?B?Znh2alJCRTJKOHFjUkhBY3dKai9oNFF5VHVxVjNTT2wrb0k3T1M2N0x4dnNs?=
 =?utf-8?B?QnE0djhSdUJoZnBzWDFBaFNFRnZQSlMrR3MySzJ3cmYzVi9qZzFBMzFiZlUw?=
 =?utf-8?B?MXpVV3dDQVM1MTZwTC9TQ3YvbzBjQ3ZvcVBabzdZRzFNQXlJOWh3Z1V4YmpJ?=
 =?utf-8?B?R2lvTWMzVlZwR3g5eldPYU9IVEdrTkhxQkFYL2hNOGdzVkNlSlppbTFEYm5O?=
 =?utf-8?B?YWVMbnNXcHFJTlQ3TTdHVUJsclhtZTUycDViU3JCbFI1b0pHMFh6WjliVkxw?=
 =?utf-8?B?RWZ4MGhVK0dNa04xbHhuY3FlYUkvcTFsZDZnWCt2blM5OFJZRkQvWEJVQTFU?=
 =?utf-8?B?VnVOdXc0OVVnaEJPRnpaUDhxR2tVUnpxZ2o2THhaYVNQVDB5Uk5GRHVQQlIw?=
 =?utf-8?B?YTIyczM4aHc2Y1IvUll6aENIY2VqNnl0YjVDOWZGZVRGMU1HaUlmcHNidTZT?=
 =?utf-8?B?RTBtTDlOZ1RBcDBVUkF6VlNtcUQ3TnUvV0hTWmlCZHpScURvSzJNcENVaTg1?=
 =?utf-8?B?djRLNnJibXUyQm9nRHFobVo3V2xxNGhUbUFGb2lqVUJTQkRNa25CR21Nbm1C?=
 =?utf-8?B?NWZFZ0xtcHRiZ2FFZ3duQW9WSlBDVHIraFd6TGVTeUFBQ3hSNkZQbGJ5U3c3?=
 =?utf-8?Q?MMU6u1pGRPDESsfPJ7gITtHB03pFZmks?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0d2ZFp6RzJXODcyaDFYTVBGRnNPa1ltZ2FlNnlicHNYTWkrTlV0cCtYbkp2?=
 =?utf-8?B?RE0rcEVTLytzUDRqS2loSHVBQjI0Slp6cFFGSksrdGxySWhwRGs1Y0ViTjdH?=
 =?utf-8?B?dEVNUlIvOUxSRzJDNE1BZEU3Nm9rU3k4LzhSUzlqMnlVN0NGMEltR3p4ZE11?=
 =?utf-8?B?dCtKVG9SNDJQaVdCT3VBNS9vMTI0SXBiQ25wbEdNbUMvbFZFTlFTWllqcHgz?=
 =?utf-8?B?TmVVL0RBczkvRmZycUh0WnZYZjdybGx6dm90SnM5NGpUTmtUdHQyR2Q5WWZh?=
 =?utf-8?B?eVhLSkUzaEtIdnhVTjZVNFAwYWs5UEt6eVI4cU13ajZqSFlhWmxIMUUwRmhP?=
 =?utf-8?B?OElXek42dDRqU0VXakJrbzJuREFVOEJPazVtL1hRMFQ2bXlLaFBDRUp3VHpl?=
 =?utf-8?B?MGRnemo5VHNjZURzbkJ3bWQ3MWJqcFZGSzZDcVYxaGc2SDNoMUhSQzJoc3ox?=
 =?utf-8?B?T3hzUmljd1haUGNkQUFhMHY3RWU3VG5PQVFzUUNoREtzbklQUlZnU0p4d2tE?=
 =?utf-8?B?YkJVY000MnJRTGZUSXNiNzdVT2xZSWkyVGlkV2FKMHJhZEJkczV2U0h6Z2Nw?=
 =?utf-8?B?UHIybnBya1FkSWFqYTY0aktiRllYQTZvYzA3aitrcHBuRlpCUkx0Y0VXNHlS?=
 =?utf-8?B?USs3cUJuQWVONGZ6Wm55L1gyM2plQThPZjUvZlY0bXNUMUlSOXM1aHAxaGx0?=
 =?utf-8?B?bHVXU0pMU0FWU3hteE1icGlVSTF0b2hoeWw2Zm90a01MUmQ5TnFQSmdkclhn?=
 =?utf-8?B?RVhIVmZ2bGlRNUcyODkzcktoREdhRGpUeG5lMWdpRzNpVXVaajM1N29VOU5n?=
 =?utf-8?B?Q2orRkdpeFZvU1VGZExna2hBNnBhaWJ0ZnBTRUJ1ZEswUUcyeUhYN09lVDlR?=
 =?utf-8?B?WEZpMVBxeldocjQxaDdOTGd6UVVzSmoxTmJ0RVRJTzU2TDlWbUoyaXJGUmFM?=
 =?utf-8?B?U3JlZkJuU0lJeGN1Z0ViRU5UOE5CNTg3QXJxc081NVlVbEdZTC95MVlVZTFa?=
 =?utf-8?B?NEZCWlJ1MG9OZitFR3EwQVJRMHBXYXlmb3ZwYUJXa3lqZkVrVmJPMTJwU0hR?=
 =?utf-8?B?Z2cxWlVwbE8xU1ZCMTB5OVFyVFczNmJUSlA2Ly9NbWtCbXVqNTNoSktScm1F?=
 =?utf-8?B?d1lHZ0g4azJlWFpXQkE4YUFjMDJ2M0N4UG9oUHJPaU9jZVdGVEs0S2w4K2tE?=
 =?utf-8?B?aGlzOEdYei9jMFB2UXFVNWEzNzdyT2hTZ0FRQzhZaG1QZmRSY1RlN0VPbDdX?=
 =?utf-8?B?aG9wdzBneSt1OUZqU1FBYWVnRkR3L29pYng3YUd0cmUwTFFIQW1Bc2kyaVMw?=
 =?utf-8?B?ZFY4ZXFrb0FaZy9nOVNiV2FjUGVUejgxN0ROUWlLVG9sQ3RFVGM0RWdNVkdU?=
 =?utf-8?B?ZDB2MkpRSmNQcXBtTExLSkp0YThxc1hyU0UzSm0vbEdSbTYrK095T3FZbm5N?=
 =?utf-8?B?ZWVEdGcyakQ3NWFhelNjYi8rb0kwOVhPQkc5UzFrNkJCK20zNjMvQnE4MXFD?=
 =?utf-8?B?SkxkdHBBWm1ZcHdPa1RZWjBtMCtmRVJVT1FITFUza05idzdLRUNSU2dSdHVU?=
 =?utf-8?B?ajJ0alg3SzF0QVZPdjJZbWs0bWxET1BNT1VPbUJHZ1hUNlB1U292NGd0dXVS?=
 =?utf-8?B?Y0JXdkRwTlI1a0RTNDVUcmpvSVlFcnBiN251RHVwRFBMSHZyYUsvTTZqaU1K?=
 =?utf-8?B?dGFYNWVKNW5FNlp1UGtlb2pQaXdJcmJWbzc4WjV6WHFMYXcwTXBLTEs2b1dr?=
 =?utf-8?B?MnVBMElyNXhxSFhFQzFFQ3ViMHhabERxUWlud0hoZUwzYi95ZEh5NzY1SHI3?=
 =?utf-8?B?N2dBay9LMEdpdDFtaUp6aGc0MzdleVQzUllqMmdDUjdaQ3kybFdVOHJ5MUtq?=
 =?utf-8?B?NGQ1VUJiei9mdjFiSjhFc2NJa1FGQm5MenhLMFJQYUY2V1RFUEVDYVhIQ1hu?=
 =?utf-8?B?VEpZMnl6NDI5N0RYNCs1VnZINUhuaGRsUUpCdEtMaFBCc0Y2bHVhWFp3bWNq?=
 =?utf-8?B?WjZaWnc0d2xYUGNXcEcyVjNoenA2aWJUTU5ENjZqUXdYL3FyYjU1Z1U0Yy9o?=
 =?utf-8?B?Y0lCSSswYVc0L3JTMjAyWTV6SlJrWElpU3NoYTlJT09NeWNYL21Na3RzRDRy?=
 =?utf-8?Q?PqiQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9801bc-17c7-46a3-fa7b-08dd3220bb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2025 09:17:11.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umXIMS3S5MxyJyuxqbkdteYAhMViHQbrUGlslWz4t2X4XfdQHqIsPEip9EqFR57QeraVK5x7cURolzxM6hwatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgMTEgSmFudWFyeSAyMDI1
IDEwOjM5DQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsgaGRlZ29l
ZGVAcmVkaGF0LmNvbTsNCj4gaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20NCj4gQ2M6IHBs
YXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
cGxhdGZvcm0tbmV4dCAxMS8xMV0gTUFJTlRBSU5FUlM6IFJlbW92ZSBNRUxMQU5PWA0KPiBQTEFU
Rk9STSBEUklWRVIgaXRlbQ0KPiANCj4gT24gMTAvMDEvMjAyNSAxNDo0NSwgVmFkaW0gUGFzdGVy
bmFrIHdyb3RlOg0KPiA+IC1NRUxMQU5PWCBQTEFURk9STSBEUklWRVINCj4gPiAtTToJVmFkaW0g
UGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4NCj4gPiAtTDoJcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmcNCj4gPiAtUzoJU3VwcG9ydGVkDQo+ID4gLUY6CWRyaXZlcnMvcGxh
dGZvcm0veDg2L21seC1wbGF0Zm9ybS5jDQo+IFRoaXMgY2Fubm90IGJlIHNlcGFyYXRlIGNvbW1p
dCAtIHlvdXIgY2hhbmdlcyBhcmUgbm9uIGJpc2VjdGFibGUuDQo+IFJlbW92YWwgb2YgZmlsZSBt
dXN0IGJlIHdpdGggbWFpbnRhaW5lcnMgdXBkYXRlLg0KDQpIaSBLcnp5c3p0b2YsDQoNCkNvdWxk
IHlvdSwgcGxlYXNlIGVsYWJvcmF0ZT8NCg0KZHJpdmVycy9wbGF0Zm9ybS94ODYvbWx4LXBsYXRm
b3JtLmMgaXMgcmVsb2NhdGVkIHRvIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gNCmFuZCBzaG91
bGQgYmUgbm93IHVuZGVyIHNlY3Rpb24gaW4gTUFJTlRBTkVSOg0KTUVMTEFOT1ggSEFSRFdBUkUg
UExBVEZPUk0gU1VQUE9SVA0KTToJSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4N
Ck06CUlscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4NCk06CVZh
ZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQpMOglwbGF0Zm9ybS1kcml2ZXIteDg2
QHZnZXIua2VybmVsLm9yZw0KUzoJU3VwcG9ydGVkDQpGOglEb2N1bWVudGF0aW9uL0FCSS90ZXN0
aW5nL3N5c2ZzLWRyaXZlci1tbHhyZWctaW8NCkY6CURvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtcGxhdGZvcm0tbWVsbGFub3gtYm9vdGN0bA0KRjoJZHJpdmVycy9wbGF0Zm9ybS9tZWxs
YW5veC8NCkY6CWluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tbHhyZWcuaA0KDQpUaGFua3Ms
DQpWYWRpbS4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
