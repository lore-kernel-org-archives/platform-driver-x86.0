Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3141A0AF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696719; cv=fail; b=YTNrP48yVTQMr9YCeBgQr25X9txTT4I/OXy7/R89Yy2+UdTqwBcYlLrbE8airb0aXWsxOKp0p5RFXMrLJMJWpgakv+fPv7A4hB0VPouRHeaPhwkawxWR7KTTDrYJlfbEvzvRKytJYqv8LASjGday+kcdJULz30jUsrPypZXZPmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696719; c=relaxed/simple;
	bh=wHRBArETRiQx4oHG/fGrYDpI/TwVfgYaZhzBjMpOYMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NZSw3KiA9SeWw0AWa94eRkkQZki79Mclz7VOwD7ZUCFdYFLzE05qrsJPma4jlXW/i4bMexoGJb5uvbUuaD8Cbk4r+u37UBntDHig34piz2PIaNquBjPid1ObUpiVZMxJYqVb+hfI+uEFdFcJKKWEO8SsXqjZzEGhkWXV8Rn8Tqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jxeE8O+w; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jxeE8O+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4ydaHMO3ByRSyr0OfVbbUEGA8gXJLzcwh3uC19DpNxiGmScJfKdttXwmgIxuXWb262Nt0YPv8eZVr27j/Z8wwkjc/HPRo5ekkpaA+RDy7BCEOdBbMgpRWlcrR9oR9vbY+V4hKq7pqUMiSh1Xy3ggnkTof8216S1l4ED4knv68wgZmbrMQDScyxHZ3bY95gwij4pKqCZRMntlkNSJP6VDQ+mX/AAsOJ/G4zEschjEuRHYGEE9ar9bcCC3TBAk4QOSu1JW5ATsNLRnwe1ERqdPd1mfkJr4j/Fe+pde+7jhGRxxC+Kct0CA0Rh316etD1RE+e3/ksOmpcS7XMSDrNadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EXZ1HPnmOtXahfS15PB3RqHd9HF2Q7btXyIho/HxYM=;
 b=erm6G/SvL2wgaTU5f3sFy++7bVFH5fDHs6s+aK3XHvVQq+ee261N5cVepB+d1DX9ozfj2k1+gngJ02/qsDH5D21VYio3pHLupUxikpcmHTuM2BdpxelkZPYkY2MDD0K64J2DEls+Et8DmesokNs7vJD/Xw1uvBodavyJY8bIFXIu5bKyq0rY+HkEPmtvIHPmEsREr/qcCKUMLQ2uLZ97hNMdndhy3VE+9ONru5rp9LaDswpk8kVf/0i4u5Bo6vDSJAXTGWNTdttHUfDyr3pZRkv02lcrVzwi97kNgOzAew+CCjG4yAVr+WsiIsnmC9e7Tj73mS5xNPD6MPWxKaIk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EXZ1HPnmOtXahfS15PB3RqHd9HF2Q7btXyIho/HxYM=;
 b=jxeE8O+wIYbuIUc2NJl8+5Ucp0brUS5zaTg2Rt2xcB3EMy5NDxt0iOKS5KSRYCT/6S/8ocz3WrsuOGJmrjCAvcOO1VVLGYvSEX4KbxlrjjWmE6zjFwtCvzNL9Dp77nVWf3ky1p5dBqoTCNrWikHcBBbH/afqd9slTc0wKuBn2K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 15:18:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 15:18:35 +0000
Message-ID: <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
Date: Wed, 23 Oct 2024 10:18:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
 <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f342641-170f-40da-215b-08dcf375f657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTdMdWZPRUxVSDlKdlV2bWIvT3cvdU4wbTd6ZmhYVmNLL0NZWWpBU1ZoYkRU?=
 =?utf-8?B?VktrZWNRSlp1bUNHUWxiZzZlZ00wZ0xnRkVxR0hvOE9iWTRsakxsM2F6Mzlu?=
 =?utf-8?B?c0IrYnc0aEhuNE9sd0trVkZ6SEhybC9OL3NhQUtvWlNmZHJmcTBUN3p2UmNB?=
 =?utf-8?B?ZmE2VEkxV1dzaktzOWJRM3U4RU0xdVlEZzFabzdDczlsRlpOejJkdXpFSDNL?=
 =?utf-8?B?Vk8rMXJVTngwWXFuSnkrOHY1dGVEaTN4T01VNzQzTkNhZU01bk5NN2JWR0pz?=
 =?utf-8?B?N3JLY1UvL29ITXA0MUU3ei9MYnQrT0E0NEk0aEpRN3I4Z0NWOG1sN0Jwayt6?=
 =?utf-8?B?WXMwUnl6YUt6bTZsMGp1M053eDVyclFhM29BRjUwWEVjVGsydFZFN0krVTVU?=
 =?utf-8?B?Ty9MaWVONFE1YWNjQTNCbTFxT3UzbTdlYVhmWXlBZ1NSMWpGNlZ1ajZpOGxj?=
 =?utf-8?B?aVY1NGtOcGtUSGJjdnpHL0ozanlnaVJESzhPSkNFY1VjS3p2ZUF2R3dtRU5k?=
 =?utf-8?B?ZmEzZDM5NFFJVDNjenNGajhMMFJEYkZJWTJuWnlYaTk1MEl5dDhIbmFuMGVQ?=
 =?utf-8?B?bWNITTE4cE9mdlh4T3MweEcvaU81bWM4ajlMMGt6OWg4Tm5kWU5WTVRQYXVN?=
 =?utf-8?B?MkRCakhOOTRqM2drUW95TmN2RnRoc1F0V3pqY00xdWQ4Q1Z4dlRXUWhGbU1Q?=
 =?utf-8?B?NnZqOFh2ZEcvNEdpSkxVMk5zSGxNYjFJVEVRR1lDQ3J1MXdLUCtpeUExVXdn?=
 =?utf-8?B?a0lOdjhSM0E3bVY4M1haOEdRRlFhZUtDNzRVbjBiZnBER09zUTM2amxhOXA4?=
 =?utf-8?B?ZHZlTmFOdWs1WDZlTVhmL28vbHgreXdnektGYzVTTmhHZVM1WEZ0bjI5N0F1?=
 =?utf-8?B?WDhyR0pCMURkcDhKR2dOL0g3SnQ0OUZhWXUwMzFoYmhLOGRYNXVjaE4vb0xT?=
 =?utf-8?B?dWxDMzNnVVd5SGkxclo3Nk9mT0hTZXlxWk4yRDFFUHlJTEIrYVVuQkFwSFl4?=
 =?utf-8?B?MEtTYmtqWmJDcWhxL3NDQ2Iwb25HendXY2l5allVZCtReVNxZmQwT3RETDF5?=
 =?utf-8?B?Sjl0a0FLUmNEbE1qQnZiSnNZcHpGS0g1RDdHTHBka2N4SGhyV2UvdjNBNTFx?=
 =?utf-8?B?azJ4NHBYS1VGRlk2ZHBGcnFnekdnUnVUR1B5Wm4rTTUrQkVscEtyRWlMYTJU?=
 =?utf-8?B?Rnh1RWc1ZlhvYll4aWNIOFBPWTRlM1R3ajNPYkxmZmNibkorMjdXdFlEa1hV?=
 =?utf-8?B?MXJMb2N6V2pyWnArVTQzUEYxS25YaTB2Nyt4SDB4akxxT00rRWQ2WmI1OUlB?=
 =?utf-8?B?cER3ZjZ5aFhKTmRHMEhnamVyK21kZEFoOEJqMDNEMk1JRHVGWG56Rjg3K1hq?=
 =?utf-8?B?bVNLaU9LNUd3d2t0aE84ZllEUlZkNmszQlhqREJyTGxWdFVLcFcxeXlKcllv?=
 =?utf-8?B?QzhmMHhXSk1ZNGYxejhmdWNXNlhNell6aStwckZPSEprL3dDZzZsc0pxamdL?=
 =?utf-8?B?RFFrSzUwV3JSZll0dW5KK3F0aTJPSStBdzlVVVNSVEFFNjB5eHk3bmxXajRP?=
 =?utf-8?B?aGR0dUMxOU5MTy9hTTJCY0xScU1xMzFCQk1GTlBhblFoZVZkdk00Rm4zM3h1?=
 =?utf-8?B?RFZmdnlLeTBKeUdLd1ZnOFcwZzBONFh1QVd2aDgzUUZ1bTNtRmJwK0FxWTFJ?=
 =?utf-8?B?U2p5cldNUUYySER2cVpoSS9QUUtOTFI3WVkzQnVVY3VDSzBEMTBpbjR2UTIy?=
 =?utf-8?Q?GLB+b5y3vS0CF69Qhka1nX+eG5RFnXOsuVk2AQR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklFK3VVVXozd3RGVUpGbmhKVkJjd0s5Q2ZwSnpOcFRLN2VJS0JYdEVlUmNy?=
 =?utf-8?B?TUZ3K0xmZ3pGNWdaeVdSejF2dmVHT2REck80SEtPRWlwUjhEc2lLRXg5cnZa?=
 =?utf-8?B?WnVNaTNOcWdtV0Q0NzZDakFITGZhQm10WEtaTW1nQ2ZneXNjNSsrTHgwR3k1?=
 =?utf-8?B?VFJjZUJ2cGMvVy9vK1dpYUdoUlpqQmVmdWZKOWlzblhXZnpxNUdNczBLN05S?=
 =?utf-8?B?Qk1WQ0FORTNtcDNQcDVkem15cCswUktEY1AxQVFOcDV4UjlVVjBCS1YrdW53?=
 =?utf-8?B?bDdvLzdTaWk2L2p2czA0QzBxb1EyblJTK2NDZ0xwTmVqS1UzMVRNSUZGM2JV?=
 =?utf-8?B?OW91MmlIK1BkL0w5K1Y2QUoxU2ZoK3JkdklScVFvdEowSTNYVno2c2ZqSnBo?=
 =?utf-8?B?eVhCcTV6bnMzeCtQdVNWRytQbUg3UDBQbUh4bkRYZStXS3cyUGs2SDlHMlNa?=
 =?utf-8?B?SndxN0RrU2pQWDMxNzE2UHl3Q1FZOFFQTVNkRzVXODM2VS9hdHhGLzBwSFhv?=
 =?utf-8?B?ZTZGdElrNDAxQkswZDNlbjUvdHZaTVRVZlBxckZyaTAybkRkRUV3cy9KL2Zh?=
 =?utf-8?B?R0N2MUFaVVlKN0pWbmJEZXlTQ0dROG4wNzhSVW5TRi9IbGJOTVpabWRQQmNp?=
 =?utf-8?B?UStGbnJ1bmtXQTVMYUxrTnFKQThUKzltOUJGUEhVUWlyOUZJZGF1VmFMSWhl?=
 =?utf-8?B?WFBYY2VhYWhiZEtPaEUyY3hCaWVJYmVaajVsRnVyR216c1FzZjA4MmZ3RE5s?=
 =?utf-8?B?WFN1TytBQXZnSDQ1YjgvVXdZUEx3c1BCL09tUTdrTnBlOTZXalJ3WDBIeVJF?=
 =?utf-8?B?TkN3b0NRWVE5eXFRa2RNa2JGOEhmU1RjL1FnTUVRK01lbnN1RE51dXc1VUJH?=
 =?utf-8?B?aVh5RHJ6eHRjMi9idFJWTWU5SUVEUWw0UndESVhBVTRDNUJwM1VTUWpvU2NF?=
 =?utf-8?B?ck5Oa1YrNkhucFlWSHhsUTVVNDdVZXo2MFNXN01DRTY2VGF3NnJ2Q21acDZl?=
 =?utf-8?B?eWQ5NTdtUkpkYXA1WW4zSGx1SmtIdjdLU1Fra2NrOWRWRWdKQ0NuRVJoR01n?=
 =?utf-8?B?OVhDakxrdDhldGYvNHdnc3hhRTFRVkhiMWJrNWJWTmp2dU5hdFR6RGtpYWRK?=
 =?utf-8?B?cFQvQXlxTmRvRUVob01CUmhvUzM3UHg0MWdRTGhnSjd0ZDZFai9FUDc2Tzlt?=
 =?utf-8?B?NUJrcFdBU0w2Ym10Q1ZIZndIaWN0RlpMdUoxMWpSbzJHNGVJVHZmT1R4Z0Mz?=
 =?utf-8?B?b3VUeHgyYkQ0dk9NL2Y0TTJRMmRmK2Z4OVhkTFd2ZDhROXg3ZXREMTB6cHQz?=
 =?utf-8?B?a0ZFSWhxNXl4alk4YlRyeVA4Ky81bURzb0xTRnRRRUNkN3VkaEhiTDc5SUhv?=
 =?utf-8?B?UnBpdWszQ2JjUFlOdUpsVk1GdmlrVUpCQmlZeTFNMFg0YXd3K2szQjlIcXVw?=
 =?utf-8?B?U2NKVXYxZFI0aXFGcnZoV2tOTzhWVG1PMGNTWGp5TXJpQVdQUkVxNTZSNlhp?=
 =?utf-8?B?TEhwWHNuNXN2MGN5WVYzRGtWVVZneDRCWStBaDJEemtHM1ExRVNsUXJzK2tW?=
 =?utf-8?B?ZU1FaEdGRWxKUW15RGMzK09kOVpBSHJFcHhMdGdmZjlyNTZ6akpxdHltdm16?=
 =?utf-8?B?N1RObitwL3BJK1AxRHFrcm9uZG5URUdLK2pnbDZzMHVnQmtneDM3alFMUGhq?=
 =?utf-8?B?N1JZSlRUaFRFa09Pckpic0Z4VEIwVjJJbFh0ZXRIeU1ld0hqU1JpeWtkdHli?=
 =?utf-8?B?ZjBpZmFYbW9Cc1lWWmtWYVBWcVNiblR2ejBlZFRZbkd0OHBjV2ZaZitwQk9i?=
 =?utf-8?B?Vk1zcUVBWlBZY09jYmZFaFlDMUJZZ3BlYWs3ZUREdTRUbTF3MzlDeUVXR0lv?=
 =?utf-8?B?ZnBXNGxrSDc4L3JiU1B0djNMTkQrWWw1dkJiK2kzY08rbmIrZzNCZjVQempy?=
 =?utf-8?B?b0VwYXdKYjZwWFBKRFZ4dHN5MTdQM2o4bURxTUVkYUx3UXN3WlFZTE5FK2dY?=
 =?utf-8?B?SEpmV29jdU1ZaDFQNlVSbXkvb2lzZUNKZW5RaXZEaVB5Q1BZejNHZFhHOUlx?=
 =?utf-8?B?clhhaFB2WmhaVXNjTXJpL2xzZ1NEM3dPVkRqc2VoWWdhVGlTU250LzRvYjl3?=
 =?utf-8?Q?H6DVoYr89tOy3LW21obbb8GNs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f342641-170f-40da-215b-08dcf375f657
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:18:35.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjDsR0nxTWXTKoereoPKZRLq4nEiD2Ij/R843FE3r03pBSy8WLgl5x/JeE3sHxL6gppszOgvqbqSif3Q2cV90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

On 10/23/2024 10:12, Mischa Baars wrote:
> Hi Mario,
> 
> Why would this be the wrong mailing list?

The correct list would be the amd-gfx mailing list.

> 
> I understood it exactly as the article tells us: there is an issue
> with the HDMI 2.1 specifications and its intellectual property that
> prevents the driver from being implemented as an open source driver in
> its entirety, but that certain aspects could be implemented closed
> source through the firmware.
> 
> What's holding the kernel driver developers / AMD back to take this road?

The architecture of amdgpu can't support it.  The applicable code needs 
to be open source.

> 
> Kind regards,
> Mischa.
> 
> On Wed, 23 Oct 2024, 15:12 Mario Limonciello, <mario.limonciello@amd.com> wrote:
>>
>> On 10/23/2024 03:36, Mischa Baars wrote:
>>> Hi,
>>>
>>> I recently purchased a new television that is capable of 4k@120Hz
>>> resolution and refresh rate, but when connected with the proper cables
>>> to an AMD Radeon RX 6500 XT that does support HDMI 2.1, the maximum
>>> resolution and refresh rate I get is 4k@60Hz.
>>>
>>> I've 'spoken' to AMD about this, and all they do is recommend
>>> switching to Red Hat / Suse / Ubuntu and using the official closed
>>> source AMD drivers. If it is supposed to work after that, remains
>>> unclear.
>>>
>>> Did someone get the desired 4k@120Hz / HDMI 2.1 resolution and refresh
>>> rate to work using the in-kernel amdgpu driver? If not, why does it
>>> not work or when will it work? I have other vendors with other
>>> hardware that have different restraints on the number of operating
>>> systems that I can use, and they do not go well together.
>>>
>>> Kind regards,
>>> Michael J. Baars, the Netherlands.
>>>
>>
>> Hi,
>>
>> Your inquiry has come to the wrong mailing list, but I would mention a
>> few things because I happen to be subscribed here too.
>>
>> 1) AMD doesn't have a closed source driver.  AMD has a packaged driver
>> that is a DKMS package for use in older kernels before support has
>> landed upstream.  With all AMD products on the market right now there is
>> support in mainline kernel and with most products in LTS kernel too.
>>
>> 2) HDMI 2.1 covered in the past, and AMD's hands are tied.  Here's some
>> recent press on it.
>>
>> https://www.tomshardware.com/pc-components/gpus/hdmi-forum-rejects-amds-hdmi-21-open-source-driver

