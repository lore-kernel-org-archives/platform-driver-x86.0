Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49830205E26
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761488257; cv=fail; b=ewS7UrQWpVUNs8xivCb8eadkCQuCgCSrwg4QEPN5h9U5kRfGMjd58yBtket/JbgK4Yc9LplOQIQMjuEYv/EcyCcTyI0IvdQg/3Tr9rVFOYZHGUfkWCCfUlr23AKCn3b+5sOoDznuoeEvgpNKjUJgXn2SRyiMm+OzT9Bdtj2hGrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761488257; c=relaxed/simple;
	bh=w0X98VAJ9ZFnGkIUdOxb4h7+q+gEA4iVlkeLk/FMVh4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SPcYmtxtPVho8RpimbTA4C8cQx8sKWJptjnnyE6PfGFh8YZ2az5tR3WPUjLUr17Wl9s2agp8UURrTQ/koU6XggV1oX2TuhN01Wuw+f8ap7P7ATEfa3Fut2mnhY8syT7GJNR3yrIKvFZAhxbxYkgRLWkVu6PQpGiknIihMUcrvH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=di1Am7Ng; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="di1Am7Ng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKNIcPvv4bDU45MZdFBewp6PSFbviUxQ0KrmHHg1NG/IqipuBKwAK9LSwyzDBTUb9lpfmaNx6rqFzKTwO9Fnx46SJ35ihntifW4GkSWCU9XMoZUoZBc1qCEkOCDAWACCvVNUsixdlt3oNjim0qC61Mx7HF89RKuvlnnFKk3Sfzt5Nf1nK6f3zovWWZgoQjzrqCHoAGIK9I8W6drsCeWFP1ng4/wr64cRksRVWAjg2lWVtTQ2XWGNHiB0vGL+Heehe3pO2y15dmVQdR6syQQwVDUSh3jWL+rGhGjMzDg9zVyrPVjzaCu4/LuRX7DkOzu07DW+102tkh5V4dHKvLDr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOwozTTJ1L1T/uy7qK76FUsU+NgMmlDyfkUdR3phuPQ=;
 b=wyao3Bb9yIFmhAnxEQM3eAgz/gNaZ50kKEUBHkYPVMWIpowwtbeo5gO4z5kXaD+GmUvCBmWA/To5WvOvfx3WKXf0VVjQ3TwmtiDyPeQ4RUi9vFaD8T+ioTfpsKdCxGdezMyJ1FhVTcU9rBuiqNSkLmX4p3ZFV7ce/JbNiwRp5+b3Ty2QW25b1cbW3O5a86hY0bOLnC4VZShWRAniy1++d5RVJHCU7rzRbZHal0xe8HjQu0S4RZA4jp1y47V+HQnYSRFTXluJk96jT2hdUSMFJK0UXPTBs5s45IZYoUEAeOYJ3lMFFbpBpdB+EHfCysk9O/Idsho1Z9cPDiBcnlOQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOwozTTJ1L1T/uy7qK76FUsU+NgMmlDyfkUdR3phuPQ=;
 b=di1Am7Ngr1jogcz+bEORKro+DNr6+JleE/kCoO/YLT9T4C+tMj8R+p7IAHQDdyl8tv7VA+xF9TgsOixoJUIvfn88ZzTE5z4Klc72YREnqSE0rtEsTFOzlbFxxlTQoXfHSwX7Pc3o1eewH3fxQh3WRXTs2dWxddscZIsjVr+vMy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Sun, 26 Oct
 2025 14:17:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9253.013; Sun, 26 Oct 2025
 14:17:34 +0000
Message-ID: <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
Date: Sun, 26 Oct 2025 19:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: fe10f5fe-4f32-402c-5f80-08de149a681c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXJwNTBDdDZhaUJPcjJOWk4zQ05Sc2g1ZDdERmVmNFhVeGMyREsrL3MwQUpx?=
 =?utf-8?B?TnBHYjZ5OGdua0pndjRzYk9VU2kvLzJ6SkViNFZDMmRERU1TL3B6d3VIZDM2?=
 =?utf-8?B?a2lKQ0NreDRtc2hxVGhuN3ZUR25OdWlndUg1UVVSL3JhNkxkVGVOQzFXeFdt?=
 =?utf-8?B?bitlOUZXcnE4VTVGSFNiSVI4VmMrNVNwTWthUEVGcUJhUmIwem1lMGM3R0h5?=
 =?utf-8?B?bTMrWlZjZ3d5TmJ5aFVXNGRDaHJzSW4ySnlQSlNBY2F6VUFHZ2c5RHdNM2dK?=
 =?utf-8?B?Y0NBd053bWtlaEQwcmd5dEYxVWtobTJKWXUxS3lRaWhTNWErUEo1dURjalMw?=
 =?utf-8?B?bTd5Tk1UWW12R0VUKzNVUytjYVVYQ1p2Szh6KzdvYUhpeHFLK0k1aXRYWTRh?=
 =?utf-8?B?QjZhcjNjdW1kNVZ2RmRTeGZQRGZraDVNZHdZUXhaeXhxejB0QUNkS3lhaU85?=
 =?utf-8?B?RjBNRXJnZmVneE9vaC83cTFJTmtnekxYcWRqOU5kNkVvY2FxTjIyRUl5S1Rv?=
 =?utf-8?B?bVo0TjV0Z0N2czRvbytpd2FMcUhTNGJpbXdzL2NYTXJiV0NaRlpCZFpSdzBh?=
 =?utf-8?B?anJHcVZOUzkySFhWY3RFQ29tNkxlaXVQOGx0K1ZhZWZCWnZYb2VmdnBWQUZj?=
 =?utf-8?B?T3RJYmV5Ymp3dURuQ3cvS25MQ0U3ZExhSGQ5cjhOeTZhdkdCMVplRjNJb3JV?=
 =?utf-8?B?SG9CUFpBcGFxU1Z0VERIUEhWSnhNV3IwMTJsK0k1WmdHWnp0bkFBelZ1a3E4?=
 =?utf-8?B?V053MjJxQ2paZkYwV2toZ2RhbVFoRkQ0b0gydzhjdk8wdE0xRWJDSWtkOHM3?=
 =?utf-8?B?aVVlNHpRQThzSzd3OTdUUGc4U01SaEM0N2YyVnJBMHkwRFlTeG9vT2llamND?=
 =?utf-8?B?QnYwOUZGcE1NMDhCeUkvNy9MQXgwcytGRUVFQmlUVGJrcFc4SDVIVkYzZGh1?=
 =?utf-8?B?dk5PdCtSa09MTzZ5dnNCUXJvdVl2WHhuMTRVd2N2ajd2UTZETDNDMVUrR0Uv?=
 =?utf-8?B?cWxiOEgvMVhSbXZYak9VTUFWU2NRekFKeUtZQmRSTVZRK0lnS21LSkFCZWE2?=
 =?utf-8?B?eWZLMVAya3ZCRkhvR0k3VUpEZmVNYklreTQxdzJzUzdCMVJob0J5WHphTEhR?=
 =?utf-8?B?djJvcGFKb2tuYmlPZUlwUDN5cDNHdGV6ODhIbi9za084cVdVckh6TmwwZW1W?=
 =?utf-8?B?K05XNFN2dVNwaW53dUg4d0R0T09HV09rNW5PbE54ek5sYWpialY0UWVCNmZM?=
 =?utf-8?B?YmE1eSsyOUcrdmk5SldNUFcwKzBOa0dVdElhRHNYVVBIT0xRTlZ2Vk9ja3J2?=
 =?utf-8?B?R1lXQXhUekUxRjBHakcrOW9xdzhKZXJnbWkxelFMMTMzNDYzYVZtYjhMNElE?=
 =?utf-8?B?eHdibHNoc1k4U0p5dVlFOU9YZ2k2YVhPdEpQQWdpRWN2MndRM2xaTnpMbVlN?=
 =?utf-8?B?NHIzekRrLzV2elZ4eUtlYTlnMkI4RXVPUFRiWkVudzJjWVBTS0dJK00reGJk?=
 =?utf-8?B?OTJ4eEhQZmZ2cUszbXU3ZTdBL3ZlWGMyZUZhVlRYeDFRYkpDbjFGVzIzYUh6?=
 =?utf-8?B?aVhSdklrc1lJQmlKY1dIaWZWdVlUMkQ2UTNpaUl4NHdZYUdUWlNDTHR2cTV1?=
 =?utf-8?B?NVRIanJoRGI0TG1oSGZ1UmYvZUFlcHg3MlV0MzdjUWFlUDVVRzExV2I3TnJo?=
 =?utf-8?B?SFRQTkljbmwzdTJaOTFlNlVNRk8rRnBpUmRoSjVYclIyamViMWJOalVKUWJz?=
 =?utf-8?B?TU83aloyVnlvOUhobGcvdThqRW96dFFRY1pHaDRDeWVWV2V1SjZRUFFKU1Zu?=
 =?utf-8?B?U09teEM5OXhFR3lLSU52dUFzVm11N2RjUDUyME9zenpGZ3dub1IyUmpaNkps?=
 =?utf-8?B?cTV0NTk2M0ZXQmtpRXUxbHNLZzRkRytLbWRnQTd0bjdIQXgrQ3VJeWh4THZV?=
 =?utf-8?B?SlpzZnVZZzJzNGFXRXVmZGljQ3RIU0drNkwzUVVrd2hCT2VReWRRK0FIdHAz?=
 =?utf-8?B?aWo2MlVnb1ZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFZXUHNhczlpWHp1eWYvaVhIQ0FRQjVNSTNJVmh5dDZqUUl2dGxUNVlnS1Zh?=
 =?utf-8?B?TFUyNXdsUjRVR3B0cFRwUjczaXFWS0x2TW04NnNyalQrL3U4M2hybi9DN0Q4?=
 =?utf-8?B?Q3dwOGxZcHZpeUJvejFrZkoyeE5JUFM4RElNaThzZVFDU1c1eHJaTkpsOTIy?=
 =?utf-8?B?U3hiQ2wvMENNaVlQWkJsMjhEaGdIamlyRW5oOWVmZzZqbkhVU0E0M1hURlRO?=
 =?utf-8?B?V1JPM1B3OTV2WEFjcWYzM2V4QmpsZlU5NS9zQXd2MDdPTGoxZ24yVWprRW1Q?=
 =?utf-8?B?UW5RL21teHFtWHZaNENGS1JxbHFGcERaYzZ0dW4xRjJLeFYzaVB1UUZYSXBh?=
 =?utf-8?B?U2sva3RDRXBqamZvT3p3dWRycXFvZCtNRGRPV1Q2K05HdlBmOUpkUFJTbmFH?=
 =?utf-8?B?K3pzOC9DL1FObDRDYjE4b2dCNWp5blNyNHorMzVFSVFydDVPQlowcUF1ekha?=
 =?utf-8?B?Uzk2N3crQmdKWmxtSTJYakpZV0NTUmkwWmtJMzQ2eldCUGtlN1FoTW1VYnNL?=
 =?utf-8?B?YnJvQWVtelBIdlNGUXA3MVNqVm5aN1hkai92b3hkRnFmWkc0Z1pxdE1uWDln?=
 =?utf-8?B?NDRiWXRpYjNJc1hwa1dhbklXQkl4YnpEVG4zNjQ0enI1ZnBlWVR2U0hDK2tU?=
 =?utf-8?B?RGFhaG81OEZzMUxPdStlNElZUzZXcjg3RjRxNmVxUVFqN3RocG95ZVVOcVNs?=
 =?utf-8?B?YkVDa2dwaHJzZjJjTzN4Ty8zb1hSdUszTTF3RERpdG9YZGpaSDladEtyTUJH?=
 =?utf-8?B?WWhHSEptelpwRGlRdERvdjZEVWJmV2E2ak40RUt6RU4ydWE5V1FUdUN1OXVZ?=
 =?utf-8?B?bGJMc290blJqdlNLc2FwdURJZ0orb0FYNXkzaFI0UXExK3JyTFF4ZVJwWkNF?=
 =?utf-8?B?dTM2T1pVOU0xY29YclduRkJyeWQ3eWhTb0YyU3IycmtsUy9uNE5tcnZDbWtl?=
 =?utf-8?B?VExsbERPY1ZZOTAyT25YOUlncFJ4MkNPMjdqWGRyMW1GRkx6VFBVUXZ2ZjZP?=
 =?utf-8?B?Y0pHdWJlbXBHSE84SlV0SkI5cmhqNjluTElUL004eTNFcmM5K1YvZFJ6RnN3?=
 =?utf-8?B?YkJBWndUK3o1SUdZellOWFVLNDJZc1lyMExJRFdpMWc3YUpqOVZKN1pRYVZs?=
 =?utf-8?B?R1k2bFJmaUFEcXNYbEVWZzFabncra3kveHZvQkxwRVErT29mR3ovUFFtRDkv?=
 =?utf-8?B?TCsxUnMrL2FseHFHK3JWaDF3eXA2YWNqS0RXZDV4L3lyb1d6a0dhUnBOVm5E?=
 =?utf-8?B?MGMvMDVjOGRqbVR1dlV5MGM4dlRHSXJLUXl3aG4vcjVsdzdlYlF0Q2picFhQ?=
 =?utf-8?B?blY1VHZ6VVJqckcrcFZRRXl4N0JtSHZwc0k1ZE1ldklQRHMxU3QySDgzZ05q?=
 =?utf-8?B?eDg4YXROellxMWx2S21pb3A2SUplR2NvTFlmMEZHWHdLVHVzRUd1Y1Z6NTI0?=
 =?utf-8?B?TCtpUzMzWVdVM1pMenhvcWJMcFg2ZVFxTXBNL0hlUHJSeThRU1lSNHJISjNP?=
 =?utf-8?B?eTBYbHJPblpHeVhMWUhFWUprcXR2a2t4ZkN4VEZRbzVRckxrUDNsY0lxN1pC?=
 =?utf-8?B?bVFML3lsSG9IdlhFWnFvYy9MOFVlbGcrUkZkdlVsVDQwTGRqZlF4WkpleE5n?=
 =?utf-8?B?VzRNZmF3RWNycGdhQkVkTFZyWTByQzI3U0ZGeGx1TzlsU1U3bmNUVmVjV0ZQ?=
 =?utf-8?B?M3BVV1JGRGN1Wm5UdzZabjlXZjZXM3lwdmE3ZUphSytXZUhxb1ZMeUI0bDN5?=
 =?utf-8?B?eWRqRkJIeGZ5WU9WajJNNTdTTldHVEFqMDRuR3ozWUNlRktPbmZqbjN4T3c3?=
 =?utf-8?B?b1JHbDVjMWphcyswVnFZdWJoMDVnSDRNOTB3K2hRQ216aEtIQTVTT1lCTXNV?=
 =?utf-8?B?a1JGakxQZEc1Z0VBRHVmRk0zVXRWbzVXd3p0SjllaUJuSzcxa2hvelVWOWJ2?=
 =?utf-8?B?SXAxaml4Y29sWkZGYzlPaFN3WXlkT01TQ0hTaVdMVHhFdnhCSnIwS1YzOFVT?=
 =?utf-8?B?bERjbHB1bllJd3BJUUYvcjlmQXJNRDQ2YjFpTUpVakIwTlhGSVF6VlpBNDNu?=
 =?utf-8?B?d2hFTVF1bVFjaHY1K20wVGFqWWxxbjU5TDBxdXZjRmRDcTREa3pkTXBjY0s3?=
 =?utf-8?Q?JuTG6vDBVe1hc9Eh3mTpVvU+6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe10f5fe-4f32-402c-5f80-08de149a681c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:17:34.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFygQQIK6tz/ZbxWERKkl7nhaFrOrmLTTONVMYKn88cCAXtOFnNGYCrwXB2d738cbO6Q/HNeyv2yha3NqzaDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359



On 10/23/2025 01:34, Lars Francke wrote:
> Hi,
> 
> while I've been active in the open-source ecosystem for years, this is
> my first report to the kernel. Please be gentle if I made mistakes.
> 
> I'm debugging hibernation & sleep issues with my HP ZBook Ultra G1a.
> It has a AMD RYZEN AI MAX+ PRO 395 w/ Radeon 8060S.
> 

Thanks for the bug report! I need few more details to investigate this.

> After resuming from hibernation I get this log line once a second:
>   amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0

Can you please share full dmesg log? Perhaps with both ccp and amd_tee
drivers enabled with dynamic debug.

> 
> Right after hibernation and before the first of those errors I get:
>   ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
> 
> On boot it looks good:
>   ccp 0000:c3:00.2: psp enabled

Do you see this message after hibernation exit?

> 
> I had to google what TEE, CCP and PSP mean so it's partial guesswork
> on my end that these are related. It looks like PSP hardware(?)
> doesn't come out of hibernation properly and is disabled which means
> all further calls to it fail and I get the error message.
> It looks scary but seems harmless?
> 

It is harmless, but only the amd_pmf driver will not work in that case
of you.

> Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
> more or less exactly my error message but it doesn't seem
> to be fixed for this case.
> https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/

This was a case fixed for S2Idle cases, but I seem to understand that
you are attempting hibernate here, right?

If yes, can you switch to S2Idle or S3 and see there are no errors?

Thanks,
Shyam

