Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792838196;
	b=EJO9u4XYSw/nHTx2i+1mnAuffCl5a36yqGD2evi4leJE6GznFtqC7v9mFSgibv2JKpT4
	 dygD3n3arK8GjTP8HkrTHhENKIH0r4Qci0eYwYnarMoNzCquKV3LdRIoQLUsVqWY/bMT0
	 3e6ClwZeH5JL195hITjNC77D5c8VLFXxQ3XfD2xxQreSOAEa4GuuP2m5aeOr/r5VFrfWm
	 O5I3H0kCxmukP01vSjH4oRY82D86aIxHtsRDKlg9fVl8CprremL0E7wh+jPJPW8GF9dIm
	 vgbQrVJeUnNd8UIVr/JBmIhhk9EY6zrwNRfTHpRG2yhjFOWmHYG4HLQdzBIYq7lP4tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838196;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:X-Microsoft-Original-Message-ID:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zmG7lCMmVqpVe0SCCzLEXuIGNFwB+EIxKSHEUuilX8s=;
	b=v/TDBhFVOq6x70ae2MoO+wy/sdGyvhkR46s/OCtG92QwvWKLNMJFcgNuKqb5lLFsU8P+
	 RW33CqDG254BgW14IXvHNSDGELfswVbYmcogjRrIzHQHP6Agh4O/cRbyXdp1onZvu/Avu
	 g3A6pbS4QYON7xkee1fYpze1lNIe7IjnhteAMQ4DtQKsxcU5NUROYAEk8RrPc4Rtf4Lfu
	 7icxUg0P9SG/jIcrGFPYyd66WZ3dh2jAjWJ2fupxbHfnrxB2i/zSaPon4vsyPM1ZRn30y
	 DS6PWXMbyqRyvxe2JnkiaHzJ5ptpaBwFBJfSAnhuS/lqRZejRas6ZEdfHzbD2AJGdgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=W9db0wjL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.59
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012059.outbound.protection.outlook.com [52.103.43.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7CF606A31F;
	Sat, 24 Oct 2026 10:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7CF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=W9db0wjL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/efbZ9FnbmTQybXvbhNQD7o4mlaQhxhidb8gmlxxpwQa1ufZityjvlJAD9X4GpYmKTWg8/pHzbn8co8XgSMhLo6bjeKH5UzhfGtfIVxXMAKfPxgW9NSHXCYY3F0+Kw4JyMIXV3pR/C8dc7gncWsIeGL5vIpQWsBLbwNNBRgMXhh9gvPpuMRdgc5SGNRM/NqdwAisyeqf6Y5h30fZguECsVaCedhWL0UdqQrjaObR3ImrPVuahPSPS7YNmHcuGzjiGkldGwwkJ7zVAMKNrjiBrce8RclpATNTSFjD28XuGn5gcxzmTnIbrcPLiOgNwH+DgOtuxopqBFOmXVUQXuHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmG7lCMmVqpVe0SCCzLEXuIGNFwB+EIxKSHEUuilX8s=;
 b=i8bHm4a7plml4pSstEuIPSPFka6rDy1MOhmil8RZa+0KM6RGvyqbhFfa294alNaTD3qJPXon7ByAXrc4c6a6xjUo/+i+Wa8ksjN8Lp1HrI6+zIK+UPV3+CitjMRlLp9+ZBemILx31QHrn50atuszB623L263Oyfr1l8JDH20t5eRkgPJ8uzqcFzmACFpsQeaNwDpLz2aqaby0tYdILqrkS6Nxn5w9hTI2nQGWi2LP1lUAvoZBt/V+KNyDAHZeVtL4n0HF6rJMMzaKiLcuxwUkeeiZcuGGRVU4QczfaHtZolN9pgu9rIvuoL+hBoJ0nFgXfDaaYAcWdMZQNIcbzWivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmG7lCMmVqpVe0SCCzLEXuIGNFwB+EIxKSHEUuilX8s=;
 b=W9db0wjLxDVZ+x4grubh+kiBw0vrOewBmrzSdW9bfVv2ahW5XxrnKhVivtlm/DaCTSFoaiWl4jQSiz5v/KGgHU2Oun4SFDJxdNhSh5HJCeyW0Jg/j00vzLXGrM7zsoWbD/m1k7gXA8TZcglb7l3wetS2khzs593LpZwxp8/rvJLak0Mz+pCFGQAaa3g3VX1KFmKh9PDB27KreueODtjiqmOXZyVL1Ib4xqN44a1sJTSHFejikPk9gQySm7Vf993A81S8WEENHXmKRQa2Rj8w9+kL8C1kchFs22hUJKCNAeiDMoKtq7v9UT3am9qAQP5Q6eHC3/iSZGB9R9zw2OSSgQ==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 PUZPR04MB6958.apcprd04.prod.outlook.com (2603:1096:301:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Sat, 24 Oct
 2026 10:36:31 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0546.019; Sat, 24 Oct 2026
 10:36:30 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krishna Chomal <krishna.chomal108@gmail.com>,
 Emre Cecanpunar <emreleno@gmail.com>,
 Suryansh Singh <technosfan14@gmail.com>,
 Radhey Kalra <radheykalra901@gmail.com>,
 =?UTF-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>
Subject:
 Re: [PATCH v3] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Sat, 24 Oct 2026 18:36:16 +0800
Message-ID:
 <SI2PR04MB5895909A0EDE359BDA4F78A3A2632@SI2PR04MB5895.apcprd04.prod.outlook.com>
In-Reply-To: <179207451329.13793.4180821086242621563.b4-ty@b4>
References:
 <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
 <179207451329.13793.4180821086242621563.b4-ty@b4>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SEWP216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::13) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID: <3592109.44csPzL39Z@supercomputer>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|PUZPR04MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: a692b3ab-dfb9-4d50-a721-08df31baaa06
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|8022599003|25031999004|19110799012|8060799015|22091999003|5072599009|15080799012|6090799003|23021999003|24021099003|3071699003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU92dGlHZnFtanNYZ3oreDN1cU1aQzZoZXcxSWc3VnN0MkRQT3h3NjBlazdM?=
 =?utf-8?B?MWR0QVRyVytwMkoxMVgyYjIyNE52d1JPUlU2eVdvbjh4K0JnV2E4YVUwRk1T?=
 =?utf-8?B?TTVGeTVtTnFRdzBGanRLcFBjOHdyd1lmWC9JcHFQN2xtUTNxVFNvQ0Q1cnVy?=
 =?utf-8?B?ZmVNdmdKUkx5NzRwSWs1ZXJhbXN1YzhMQzFLUU1JdzhHZGRlUitTQlA4bU90?=
 =?utf-8?B?Q0FubGdxVVNaZHo0T0NjdFFpdGVrRzNVNS9tZ1lzZlZra0VxandTajcwQUcz?=
 =?utf-8?B?YUJxVlQ5dkdTZ3Z2OGEzTlNKVzZENk0yd0l5a3lieU82WFRua3hXd0VpV09N?=
 =?utf-8?B?aDdrS1lFN1pOK1Q4Tkh4SlV1NU82VVF4dmZLS3VEWmFYUTlWeHVEaFl0N0Fv?=
 =?utf-8?B?blJ6ZktvdkVQUm9rNmtXZlZzdXJ2MVZiY3A0bTZtb0JDanBTWlFKZGhSMWhS?=
 =?utf-8?B?bURWSGdNb0J5bHNVMDlPOS9vaVB0aUNoYVJ5VlhlUi9LV2dGcjFMdTR0YWZ3?=
 =?utf-8?B?R0VDM0wrVEJPUVl4anRkYWpEbzJqSHY1R0JXMnNPZWYvRXF1eVFza2gxSkxa?=
 =?utf-8?B?VHRMN09WanZhQlV2cFB6SWcvOWd2US9QZitJMmpjSnBkU2J0WTBkVkN2cGdL?=
 =?utf-8?B?WmY2YTBHQ3MrWkl5ZjltSnF0VXdOQVZSZXdUNUpuS000M2RScDNOOTRzRGxq?=
 =?utf-8?B?MVBZVWxMeTBlRUJhK2oyT2E4a3AzZU1UQlMxQitpdWNCbGM3UUVvcHAwRFpq?=
 =?utf-8?B?UTlYaU5UN2RnVXo3c0N4ZlZKU3VBR2l3WXFiRCtYNVF1Y2duVE11ejQyY1Jr?=
 =?utf-8?B?b3pDWWZWWEY2bzVhVFJqQVd2VDh6Y3dVK0ZBZGFGSkdLdG1ydUE2Z2NkQUlP?=
 =?utf-8?B?VmYvMW0wNjBjbmQwOVQ3WGVOZU0xd01jMXVTVDRReHZFTHRvUlBLV2hTMXMr?=
 =?utf-8?B?NjU5SUxuWTBqU3lNNDFzeTlHZFVrdEZnbEpFMmt1RGptSS80YVVmMGU0ZnhL?=
 =?utf-8?B?dllTMjJwZmlIVXZMNzY2U1dPd1BGWXpscTF0OS94SExzaDZVTzdMQTg2dnlN?=
 =?utf-8?B?aG9rWkZ3Ym4rUTZDcG9vUFJPN0M0RnFVOGRibXdUV3FnSFpSalhERGQ3TW5n?=
 =?utf-8?B?elRRT3M3L09hdkoyalJKa3BwYU1ab3lnazROc0ZQYkY1UWJMbW4yeDlCeDEr?=
 =?utf-8?B?dC9NaWdwd2g3a2lxd05DK1YrbnIxaDZqSFdWay9McFdMQTZUcWQ5aE1CVkk4?=
 =?utf-8?B?eWI4TENPeFRGK1NUc3YrUEgwRE5GRGwyUXVSUmxic1VlSkFPQ2ZUek5aQ1c3?=
 =?utf-8?B?WnNzdWMzOWRlNVE1dGZ3VHJ1aURkcTlUMVB1MG1wMkJOSzNVNHoxbXplbXpy?=
 =?utf-8?B?N3BNQzFKMi9Md0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE9FaGhKaHZ6L0h6MUhsd256M0tjYkpUQVd5dE83b3FlVXBPS3kxeUc3ai9p?=
 =?utf-8?B?ZjJRbzRxSFhxNXpwUEVXcWhob3lRNDREUmM5U2lDdmU2Q1ZSa2EwR0c5Smpu?=
 =?utf-8?B?VWlaK2RYMmpyKzNlMnJKZEJnU2tDQmV3V2FWQjZDMDV0NGgrYklMR3Q1MGhP?=
 =?utf-8?B?RnFjdXh6eGQrQ3p0OS96UFI0S2FkS0dpcnQwU0thTmNTencwMmF5Mzc1Yjdv?=
 =?utf-8?B?TCthaDJlSGdmc3NocmtIRDdveEVlUzhBVDRkNCtFZ0tFL0kzUXlTZzR6ZjZr?=
 =?utf-8?B?ZlgzRzY0QkgxVmllQzFvUHhlSkRjai9ZOTlxSWltRkhMVVd5TWpodWZ1K2N5?=
 =?utf-8?B?Q1VNMWNzNUIwL2hIb0hDWUsvVXpZcGpNTVg1R2hDUGFUZjJHRDRTalQ5V2hF?=
 =?utf-8?B?a0tzeGtIc3ZMZWJrWHZNWlhiRWNkU2ovb010UnV6eC9tUjlwMjZuVCtDb21k?=
 =?utf-8?B?NVF1Qk5USWd3L0htM0dMRFVNcXdwa1lwd2pPajZZNm1nYmJkSEhQUTIvK1FQ?=
 =?utf-8?B?dWVPVHU5K0tGTTFQTklQbC92dERwOVB4VGlTbHJRL2N1clcvWERLSE1OeVZi?=
 =?utf-8?B?Mlg3WTJCMkd6aWo4bWVLNmpUdVB2Y2IxWGVsQnBQU1pUTzVnYzNZNHpZNmpV?=
 =?utf-8?B?NTNFeGZwd2RTaW1zdG51VG8zQU12Rkc0b2FTRWxIWFJ5UlhDODVhdldZdHR3?=
 =?utf-8?B?WldRRXlCL1JSZkVtYk9aeDg2ckRaSGlpN2NFdExXb05ueXE5U1BDUVN1VWN3?=
 =?utf-8?B?UzlmUHJGYk9YN2E3VHNQN1Y5L3JkS3lReTM0SXV1NWFUYWlaelFjcEJZKzJQ?=
 =?utf-8?B?Tm9jbFVXTkN1ODloZjhBeUdBNE5qODhKWVd5dEdqTDM5M2J1d29pME9BcW1i?=
 =?utf-8?B?Qkp3Y1RDSjZHT2Q2ZE1BQ3FQWWZOdE41REdsV1hMRWNzYlFJL1NhQW5QK3F6?=
 =?utf-8?B?MTIrYUd2NnlYNWREYjhMZVdXcXdzQ2hwc3M0OEdVRFFxY3FMWmlmVDR5QmZl?=
 =?utf-8?B?a3RSL0djQXJqSDVIbFZDaVhuMjJLZGpzMDEvQ01sSS9CZzRyQUFHVkVDb3hv?=
 =?utf-8?B?R0VFSFVCZkk4YjJidHc4VU9JYW01MGRVVWtsSzJwV1l1RUhicWlFVWNOMmFx?=
 =?utf-8?B?NVkzWEFKWUc1cTBkVDg5V1E1SmFKUnAxMzBHTXE3YUVLQThDN2w3UW9lcTRP?=
 =?utf-8?B?a3o5aWxxSUU0aXBCTzJ2a0xJRklHTHRDZ09JeTg2SGhpd1F2RFJkVnMxNURI?=
 =?utf-8?B?VlplZlI5eC9RZXMyZjFIeWx4ZTJnS2NvOE9xV2d1cHd4RXdnM0sxVXdOUTF6?=
 =?utf-8?B?bHllSTJ0RjRpR0lpdU1WL2U1MkZ2V2tha0NpU3ZqNmpOS1ZUVDc0OVNyZTd0?=
 =?utf-8?B?MEFhRTRycTFob2ZXazhXSU1Pb09WVlpkbVBOS3RYZjB1eXd1OG5TMGV3Wkd4?=
 =?utf-8?B?bFdBVUR5VHJIcElxOXR5YWJrM2J3UHlxL3J3SWhSWCtqNTVVVEdaNkxvWm81?=
 =?utf-8?B?UnBiSU1DU1RveXFJeVVmbFlmdW80SEFEQk9KL0hSMkxXSzBMNitVOUpoWFFU?=
 =?utf-8?B?bElQN3hxTEU3NXp1bUN1TmFrVFdXN3dmek9Ta04vMjZQcGNsS3BDeSt4NVJ0?=
 =?utf-8?B?UkQ2Zi8zYjlyUW54Z2xQMmdLZXhuVXVKa1llTXR0Y0tXcFpnb3hhdWN4cko1?=
 =?utf-8?B?S1NZdEdsRXNMb1MyMTAyeVBmYjJFa0NueDZITVRvaTZCb1VNcmxEQkt6WDQ0?=
 =?utf-8?B?Q1hHekxLbXF2S2V5bWhmZHJjWENQNStiWHowOTB1d2FWb0JnY3J6b0pXaDZK?=
 =?utf-8?B?WGhJK0xCcnF0bE5SWDJYdmhjU2grUk5rS0NTbFJYazBJZ2ljbHpYTFBoVTJ1?=
 =?utf-8?B?MnNUbUQ4a1VuVnhKZ3ptcVpJNmI2TGl2WXhjYTZkMzkrbFVBRnlVWXJwdS9w?=
 =?utf-8?B?YnZGWG8ycTRLSU02Ym5FVFNtS3V6eXRlS05qL0ZYSWtXenNCdXJtYU5BaWtP?=
 =?utf-8?B?VUNDbWk0RzZBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a692b3ab-dfb9-4d50-a721-08df31baaa06
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 10:36:30.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6958

=E5=9C=A8 2026=E5=B9=B410=E6=9C=8815=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B =
=E4=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 22:28:33=EF=BC=8CIlp=
o J=C3=A4rvinen =E5=86=99=E9=81=93=EF=BC=9A
> On Wed, 07 Oct 2026 11:08:36 +0800, Shuwen Bao wrote:
> > The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
> > Arrow Lake-HXR) is listed in the OMEN Command Center device
> > capability table with DisplayName "HyperX OMEN 16" and the
> > "PerformanceControl" feature, but is missing from the kernel's
> > hp_wmi_feature_boards[] list.
> >=20
> > Add 8F1C to the hp_wmi_feature_boards[] list, using
> > omen_v1_legacy_board_params as driver_data.
> >=20
> > [...]
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>=20
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>=20
> The list of commits applied:
> [1/1] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
>       commit: 2cd10a35f3f09c49698956d32c6374fbdc03245d
>=20
> --
>  i.

Hi Krishna, Ilpo,

Thank you for applying the patch. However, after further extended testing,=
=20
I noticed a regression on this hardware.=20

Specifically, the board automatically reverts from performance mode back=20
to balanced mode after a period of time (it seems like the time is not=20
constant), which resembles the behavior of a timed thermal board.=20

This doesn't seem to be a thermal threshold or PL1/PL2 limitation,=20
because manually switching the profile back to balanced and then to=20
performance will re-enable performance mode successfully.

I am still investigating the root cause and am currently unsure how to=20
properly fix this yet. I'm currently testing adding 8F1C to=20
omen_timed_thermal_profile_boards as a fix.

I haven't looked deeply into hp-wmi.c before, so if adding it to that=20
array is not the correct or intended way to handle this, please let me=20
know.

@Ilpo, since commit 2cd10a35f3f0 ("platform/x86: hp-wmi: add support for=20
OMEN 16-am2xxx boards") is already in review-ilpo-next, would you prefer=20
to revert it for now until I figure out a proper solution, or should we=20
keep it as-is while I investigate?

Thanks,
Shuwen





