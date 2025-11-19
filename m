Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B592EBDFB
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763531994; cv=fail; b=ZVGW3NZNwetLkXN6EQg8MKTT72xNtpDux8kT04vJf66HQvu34HVT7zenQlGyV+hRdp9P5rOnrSiVGctnBjjPA/kWI8OP4vIUVJj/uBtrbzDk2ADzybwj97sIQpFkW4JbWgMpdSEhE1pkIh9NoDQ3nMRMb5Xv+nOKUDL1Ff4anK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763531994; c=relaxed/simple;
	bh=9i/zdtWKgzmvIIPIY9CwomtL1LD6VqCWX0KSNZZ5BWI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GuVy7IApQYDo9IhuyPl2vPZHJNBgqtsz3oXsV+w5uQP70k+cBZsNejDVAoLivPbGKvq4d0n5Gm8N1tQ9vL8w5TWId8gv0t3Sz1sqT8X9Nun4LbsDZ2/7dQlfdXJ4TRDxD+ahJyB4lANFKyulQXaxdQdkKsUDdT1rm7Mz5a9TtaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SMOK2lT4; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SMOK2lT4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8cuat1616VqvJm/B3vX5P22qDLj7ftewSVHa4HCbM8HyvzBtj0zdpzty8qM9ZIONZS7r+5sejxbwyQtiuWwWnzgHov6izAn1JHDXs8Nou3lApBBEGf/ci11ZDCOH5NiMW8mzq7SNtUE2mUPhAkBYtxCeW2r+SW+aaUC8uu1fYQCjBCsAuwUHg2ajiVEryHQyHGaQ3hiPihRkcoPx++gyH5wcyTGHRNHiOAZXxkk2FuDBdFmkpKsjzPBOI2agxmHXr8dfSphETqKwsLnHbJrjzRtiK7DHEZeVL7IxNpqiO0yRig+CLEel8oWYyWZ4TQEAhitWicr4ixerTgsxByK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIR4wjema92nB0tfmIac3/L1AjIxrhPM4PiEeTIhKQY=;
 b=E7igWbb38TOTSFrNokQgJ95zJsCODIvLbJpnhtHklunBKazdO9e9V7L+sPjcuraifRIIGDTGhWKSIu+I3+xqHsDXFfxg0uHnWjMuNya03fzfpu+YWntPDlgnfhnYiGOh7h9L4vwtqbTPF5PITydp9HS8z1U9nFzc/XK31+RAdU1YRwxK7UkyhOUlQluf7GZzTUFch7Y0I8l8hgMzEkkFZyVr4wfUkiXMPSMc8SabW88IlRoDcIgwtdsYRJ+o1461gaBLKXoN6bO0yIH/z15yb7Yrlx6iCB/QT6upkHeohJ4+uILqFX2DYnOrX8ceIXWK3+XVoiBFWvyghr2EUmU/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIR4wjema92nB0tfmIac3/L1AjIxrhPM4PiEeTIhKQY=;
 b=SMOK2lT4598k6SeRHJI2a9YXuOp1Vuer55czTPN/+WOyu5YJ8h5R66ctG0Sr590W+2GSvpG3Xs9Sy+3lMWzI9LK7grA/fjlN5Cad8fhdGh0ap1vgcQbHyVFZF2WLYe3v36vdrZxzeMnvbre3MBKC2As8AsL2eQHVxiQyp65FLLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA5PPF50009C446.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:59:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:59:47 +0000
Message-ID: <835b845a-d658-4d41-8cdf-c473b6804913@amd.com>
Date: Wed, 19 Nov 2025 11:29:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
 <20251107110105.4010694-2-Shyam-sundar.S-k@amd.com>
 <73a254aa-465c-f6c8-c51e-e462da9acba6@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <73a254aa-465c-f6c8-c51e-e462da9acba6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: 762d1caa-96bb-44f9-39e8-08de2730d7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1plTFFzendhMDNNZXFMa09iTG5wR2p6NkI3a25wb29kcmxXQlF6Tml6QU9x?=
 =?utf-8?B?UzhWdlpIY01XbHkzWmIwa3BZcGxLa2hqY1l6MGViUEYrMHd6Wmg1WHlhcDFu?=
 =?utf-8?B?bkM2NlhrMUhBdEMyVm43ZUQ0Nnc4alFRUllOTFcyWW85ODVBbGdhQ0llaFNY?=
 =?utf-8?B?Um9sRzBRS1hycVEyQVVETEVQbFJJYzdwSG9XRlRIdnduWVBLeWFoVjdRY3VP?=
 =?utf-8?B?akxsa2hYNjJ2UVUxUm5pSkJZTGs3aXdvZHdEb3hXSWpLc0ErUEVEdyt0ZndU?=
 =?utf-8?B?V3loZkk4a2VmYVpyOG9FQnZhSVBub1hGVFBva0dYeG1yV1E2dmRzMFRLcWd0?=
 =?utf-8?B?V0QzKzVqSis2SzhRS3hOMUR4YXl0STJ6QU1MWG5sUWxZV1grUVBKemJzVmFv?=
 =?utf-8?B?QU5Wb05SanhFVk5sTXFCdFdraUpiY0t4WXNXaWZWUHkwU1hOUWkyQkR1R1JQ?=
 =?utf-8?B?ampiYzM2SlZHTU03d3ZoTmoveFB2ekFqeXR6eHlkamVRaUwwekxkeGtxemdM?=
 =?utf-8?B?NFBJODFlM2ZnOWU3SnBad2xqdHBFb09pWVpzYzNJZmNzZmJ3TEYydkNsSEQ5?=
 =?utf-8?B?VjRtWHlUZ0NSRHFDeWdzaG9PRnRzNHdsYmwyYzBSRzFRNzV6dHJ3ODlwVXM3?=
 =?utf-8?B?M1Z2VWpNTDhsazI5MWJlSGZHblBUbS9JL3J0alFoYVZhVkxtMVN2UzY1QmVK?=
 =?utf-8?B?M3ZpYXlvVkpaREdQeFdLcHZ3N0hTcVdKR3lzcVpQYzlqRkhrZHlNK2FPM2o4?=
 =?utf-8?B?NnFOYlh5RjVUZ0kxSDV3dll0aEl3YUxia3NvZS9yVmFCcSs1Q0E1bGg5QTdK?=
 =?utf-8?B?ZEdnUUpsL1BueHVTWWMza28yNUZYZ1hDUnFHdWkxWmlFRzNnYmJUeVM0MUpM?=
 =?utf-8?B?a1VVV0lIZWN0WU1BUjVaTTZoS1hTMmNtNFNmQ2IyMUZLbERzTisrTUdRVjRR?=
 =?utf-8?B?cUE1RzZnM3FINFRyUEQ3WlYxdHhibFJpQ3FXT1hEVlRzK2sydlgzcnBUZlRD?=
 =?utf-8?B?QmFvcTBlT2ozT0oxMXVkdW05ckliVGx4RVJPYW1Ja0VIenk1SWcyMENMLzBi?=
 =?utf-8?B?aGQzeG1ocFh3cExjZlBldkZKT0NhYkhEZWZ1a1V3Y2JJVnVNWWFibzhBKzl3?=
 =?utf-8?B?K3JTOG5ocEwzRzNrb1I4anNpZkVGTGNoVzcwREdYcWh2VFpGME4yMjRDVW12?=
 =?utf-8?B?cGVLREkrNENBZ1d2UmFjWmptRzFuL09scWVXN0IxbWNtbVQ0WmFvemdHZEUv?=
 =?utf-8?B?U3JqSGhCSktYMkM0Uk5tazBlWmpuekJGUTZrblZVV3I1U0pXZXBhbDZWeWU4?=
 =?utf-8?B?UGN3SXJrTk9weFQrclNkMGEvUWZjdU9NOUUrN0RjZS82a0JIalI0MHhTTllF?=
 =?utf-8?B?NjJhc1U0OGduczNKdXhkNFhSTmNwRDRndVBBZ0p0ZmlNd1JYYkRWUE4xM2t0?=
 =?utf-8?B?R2J3a1NCMks3YVdybmRRakluWWJXQ1pqeWJWY2liaDFjK0NHNUkrcTVwWlk4?=
 =?utf-8?B?NHZEeklkWHJROXhHd1BJQjJlaW53VUR2MHMydXZCbS9XbjZyd0VEU1RTdU11?=
 =?utf-8?B?NkdLUnJYNEhLU3F6TWh2ekVrdktaZlppSkpqcSs0UDZGR2VUSEFObklsVGZa?=
 =?utf-8?B?bGFUU3Y2ckI4cGpmUFlVdXNNZkxlUEhnK3h0ckFjczM1OUx5cFpYWUtnelVw?=
 =?utf-8?B?cHFnVjNFVHp3ZU5Vekw4MTYzQ045MjRuRzFoQVIvczBBWDQzUnZxWWZtU2c3?=
 =?utf-8?B?anYzMnRVR3g4emFmcWxvR3pGRlZrdDdkUFlLU00vdm91ZVFpYUx1TUtIZTh6?=
 =?utf-8?B?dEE2bFhWdmdLRWd6VWR0N0VJL29mU29BeVQrM1I5KzRUWVVrbWt5SlY5dEor?=
 =?utf-8?B?NlJYRkFUMFdPZWo3Y2ExZkczYVZJOU1QU3ZrbzAyWHdqOEhiU01QOG8wVi9U?=
 =?utf-8?Q?bd9o3Ptu1ajZ5MrdLgI6iUoDI0LNs4L6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUNMT0lYM2NlNVZVM3MrUkJjNjI1VXNWNzZ2dm1zTHh2OStVZmZxbFUxWnBp?=
 =?utf-8?B?eWhHRWcxeUpWbi83ZElWRVd6K2FkTXhscER6QU9lMUp5TjExYXV2dWswSVlD?=
 =?utf-8?B?NkNiZ01oWktLc1AzeUFrRHpKa2RqbThEVEMyWGxIZXUrOFZFYVNBQlovYzVm?=
 =?utf-8?B?dDByb3lmbjNURFNQNmRmOEpBbDdTUGdsYzZ2YkhTVnJ1eXB4OHJzV2VlUjFy?=
 =?utf-8?B?N3dTUGx4a3gyckNUMTZGTDhST2lQSFd6MFZMUDVVRXlRblladXlPeldqaTRr?=
 =?utf-8?B?NlBpSjc4bjZQMG9xOGtXL056TStxM2doMWdvUWU3ZTg0Yi9RMzVhUmFDOEl2?=
 =?utf-8?B?TEZRajhtWkVKbHVEekl3ZEEvc3hhU1NzVUl3ejNxR2V2VkVsSkVoYlhRYTkr?=
 =?utf-8?B?VHB6K3ZtdGh4WDVhZXhaOVNDOU0za3c0VG5JYUNPQnVIaE9DL3Q4Wjg3NnFk?=
 =?utf-8?B?TjZSVzY5VVBrVHlQNlZpb1g5cDBxcXFaT0dtSTB1K0dmZzlJRTk4dVZPSmND?=
 =?utf-8?B?SThqQVBQdDdDUW1RNTFOV2RqdVlUWEhzMmZkOU5pODZSMlc0T0FPaWpheW56?=
 =?utf-8?B?VjR1bGNJejBJSzhHZTBsRGExeUNpZk1ad3l3YWFuY05SMG01T2RZTk5nNGlh?=
 =?utf-8?B?NjBYN2ovdFcyYlQ3T0l2RnNUaEErQTdEUFVrV3hYMGtnbmlPQnY4T3NFU2lT?=
 =?utf-8?B?dUl5QmFPRzZ6ZTBKNzdHQ0FDMlgxVit3TDRDS3VWK295ZTVYYmVNVG1wMWdG?=
 =?utf-8?B?bjhad3grMnBiTlhScFJUdnlGWDNmQi8yN3lmemhQeFhQR0RCSkxqM2JLT3Jl?=
 =?utf-8?B?MlE4OEFZbmhCZnNUNUxPaGxHcUwzOHVxMEx0TldxODVqNzUrRCttRzVzYXBN?=
 =?utf-8?B?cWlTQS9WUHpsai9BUHNqWnA3VE0wUE51Rmt6d3dQS0Nxd055eXdGVGx0d3RL?=
 =?utf-8?B?Z0FPOG93K0IyRXhORit3OXJBem9DaTFmdlZIVkJEYWY3RldsRUxxK0hRSXFJ?=
 =?utf-8?B?c2pPMG16QUZESFFzSGFCMFFjNTR3ZWo4OERlenlMSk40UW8vUmYyT3krK2ZO?=
 =?utf-8?B?Zlg2ZXFLMWRNdFBNalVwd2hmajRTc1pDb0VpMFBHRGsvZ1NaaGYzb05qNzlT?=
 =?utf-8?B?TWNmU3V5MFV6cElscWdFK243bUtwYnFhR0RuV1U4V24yaFdBcFZlNjFaa3dw?=
 =?utf-8?B?dm9WOWJjWHRYcXlnNG82ZEwrZ2dGMkx5UjNXK3pkZ1NyU05JMUU2cXhZUDFi?=
 =?utf-8?B?K2FxcXdxR0VTUUFaNGF1c3c4SkZ0Vmtic21QeFpubTZ1TDdMNHAwZ0VFd0FP?=
 =?utf-8?B?NkFwY25YWTBBNHhWZ0s4RmJBdlB3d1RqVjE4VFRRME9KY1poVTZNa3k4MDFX?=
 =?utf-8?B?N0kyMTk2M3ZJejZOZXMvMnpYZndoTEdnd2E1TWVFSE12OEo2dU5EUjVqWFRI?=
 =?utf-8?B?cmRGWmpXOXRtQTlyd1dOcTBLNC9VUW1KLzliR0F0U1NTOXJOYUIxaHowVjM4?=
 =?utf-8?B?WXM4dUx5MENVd1FLN2JTOG50QVdFejlFSVhWc29CeWxIRFBCdjZmSmdnOFZ4?=
 =?utf-8?B?a1FxNW55ME1XK2FCTnYzaWdVV3hZdDA3c0tTNkkyZitEdUFoZ0pqdUlWdkwy?=
 =?utf-8?B?cGE5SXlHOEo2TG9ySkVBdlNwSC8vVVpQYldmUDdNc1pjVVdkc2R2eCtqUjRt?=
 =?utf-8?B?dWVkei9EV1RjdEhJRm5KTE01WXUrTXdhdTVYYkdvZ2lVc1NKZGg1b1FaVVlN?=
 =?utf-8?B?WUtiU2hneHM2MFQwVitLd1RiVkJlRXF6T1JEUzR4U1hJVkNScm9qSWgvWWpu?=
 =?utf-8?B?R1RrNFNuVjBTOU5jRGRYcDNDU1gycnFiOHpTNWRacmZVNFBjUWVWRHpVSHhz?=
 =?utf-8?B?RmpZTDlsaVN6Ti9WV2p0RW55RjdWZG1URFdCdkI2cDE5QVdhaGZUTEVkLzE2?=
 =?utf-8?B?MVdpdFBYUW5IZDZxMkQvZ2FqUXpZMDJ2cHlwUFJvdHNTMExQTGFFTGM4Z01m?=
 =?utf-8?B?YXNXNWFweFRzaWM0bGpBVWF5cldYRTQwejNCa1p2TStDVzdUclJTbEpmeXhW?=
 =?utf-8?B?UFdWRkxnMW9Wa2Ura21oUlV6QXBOalBnSjkzbTFuUmxIcjVzRVV1WGIvZENY?=
 =?utf-8?Q?HCfLSx/rmRhrbtYPIvQYrdmbd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762d1caa-96bb-44f9-39e8-08de2730d7fd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 05:59:47.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwQ5pU34FF8cAqZH1O6uc4XgJofAnZybP8sBUj6qQU/EjoVi/UmcUzIogjbkJdaRCW9xLRI6XQ71RGR/715gVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446



On 11/18/2025 15:45, Ilpo Järvinen wrote:
> On Fri, 7 Nov 2025, Shyam Sundar S K wrote:
> 
>> Custom BIOS input values can be updated by multiple sources, such as power
>> mode changes and sensor events, each triggering a custom BIOS input event.
>> When these events occur in rapid succession, new data may overwrite
>> previous values before they are processed, resulting in lost updates.
>>
>> To address this, introduce a fixed-size, power-of-two ring buffer to
>> capture every custom BIOS input event, storing both the pending request
>> and its associated input values. Access to the ring buffer is synchronized
>> using a mutex.
>>
>> The previous use of memset() to clear the pending request structure after
>> each event is removed, as each BIOS input value is now copied into the
>> buffer as a snapshot. Consumers now process entries directly from the ring
>> buffer, making explicit clearing of the pending request structure
>> unnecessary.
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v3:
>>  - include headers wherever missing
>>  - use dev_warn() instead of dev_WARN_ONCE()
>>  - remove generic struct names
>>  - enhance ringbuffer mechanism to handle common path
>>  - other cosmetic remarks
>>
>> v2:
>>  - Add dev_WARN_ONCE()
>>  - Change variable name rb_mutex to cbi_mutex
>>  - Move tail increment logic above pending request check
>>
>>  drivers/platform/x86/amd/pmf/acpi.c   | 42 +++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c   |  3 ++
>>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c    | 36 +++++++++++++----------
>>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>  5 files changed, 89 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 13c4fec2c7ef..4750ae6d70b0 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -9,6 +9,9 @@
>>   */
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/array_size.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/dev_printk.h>
>>  #include "pmf.h"
>>  
>>  #define APMF_CQL_NOTIFICATION  2
>> @@ -331,6 +334,41 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>  									 req, sizeof(*req));
>>  }
>>  
>> +/* Store custom BIOS inputs data in ring buffer */
>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>> +{
>> +	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>> +	struct pmf_bios_input_entry entry = { };
>> +	int i;
>> +
>> +	guard(mutex)(&pmf_dev->cbi_mutex);
>> +
>> +	switch (pmf_dev->cpu_id) {
>> +	case AMD_CPU_ID_PS:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>> +			entry.val[i] = pmf_dev->req1.custom_policy[i];
>> +		entry.preq = pmf_dev->req1.pending_req;
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>> +			entry.val[i] = pmf_dev->req.custom_policy[i];
>> +		entry.preq = pmf_dev->req.pending_req;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
>> +		/* Rare case: ensures the newest BIOS input value is kept */
>> +		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
>> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>> +	}
>> +
>> +	rb->data[rb->head] = entry;
> 
> I'd prefer the entry is construct in place.
> 
>> +	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>> +}
>> +
>>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>>  {
>>  	if (!pdev->cb_flag)
>> @@ -356,6 +394,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>> @@ -374,6 +414,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index bc544a4a5266..8d5ac84ae025 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/power_supply.h>
>> @@ -468,6 +469,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	mutex_init(&dev->lock);
>>  	mutex_init(&dev->update_mutex);
>>  	mutex_init(&dev->cb_mutex);
>> +	mutex_init(&dev->cbi_mutex);
> 
> devm_mutex_init() + add a patch to convert the existing once to use it 
> too. And don't forget the error handling as devm_*() can fail.
> 
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>> @@ -494,6 +496,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>>  	mutex_destroy(&dev->lock);
>>  	mutex_destroy(&dev->update_mutex);
>>  	mutex_destroy(&dev->cb_mutex);
>> +	mutex_destroy(&dev->cbi_mutex);
>>  }
>>  
>>  static const struct attribute_group *amd_pmf_driver_groups[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 2145df4128cd..5a18b3604b6e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,7 +12,9 @@
>>  #define PMF_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/circ_buf.h>
>>  #include <linux/input.h>
>> +#include <linux/mutex_types.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>>  
>> @@ -120,6 +122,7 @@ struct cookie_header {
>>  #define APTS_MAX_STATES		16
>>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>>  #define BIOS_INPUTS_MAX		10
>> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>>  
>>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>>  
>> @@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
>>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>>  };
>>  
>> +/**
>> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
>> + * @val: Array of custom BIOS input values
>> + * @preq: Pending request value associated with this event
>> + */
>> +struct pmf_bios_input_entry {
>> +	u32 val[BIOS_INPUTS_MAX];
>> +	u32 preq;
>> +};
>> +
>> +struct pmf_cbi_ring_buffer {
>> +	struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
>> +	int head;
>> +	int tail;
>> +};
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -407,6 +426,8 @@ struct amd_pmf_dev {
>>  	struct apmf_sbios_req_v1 req1;
>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct pmf_cbi_ring_buffer cbi_buf;
>> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 85192c7536b8..7c6bbfaa785a 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -11,6 +11,7 @@
>>  
>>  #include <acpi/button.h>
>>  #include <linux/amd-pmf-io.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/power_supply.h>
>>  #include <linux/units.h>
>>  #include "pmf.h"
>> @@ -132,30 +133,41 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>>  	}
>>  }
>>  
>> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
>> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
>>  				       const struct amd_pmf_pb_bitmap *inputs,
>> -				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
>> +				       struct ta_pmf_enact_table *in)
>>  {
>>  	unsigned int i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
>> -		if (!(pending_req & inputs[i].bit_mask))
>> +		if (!(data->preq & inputs[i].bit_mask))
>>  			continue;
>> -		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
>> -		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
>> -		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
>> +		amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
>> +		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
>> +		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
>>  	}
>>  }
>>  
>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  					   struct ta_pmf_enact_table *in)
>>  {
>> +	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
>> +	struct pmf_bios_input_entry entry = { };
>>  	unsigned int i;
>>  
>> +	guard(mutex)(&pdev->cbi_mutex);
>> +
>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>>  
>> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
>> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
>> +		return;	/* return if ring buffer is empty */
>> +
>> +	entry = rb->data[rb->tail];
>> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
>> +
>> +	/* If no active custom BIOS input pending request, do not consume further work */
>> +	if (!entry.preq)
>>  		return;
> 
> Should this function empty the whole ring, not just process one entry?

Yes. This function should drain the entire ring buffer - but not all
at once (i.e. process one entry for each invocation)

Ack for other comments.

Thanks,
Shyam

> 
>>  	if (!pdev->smart_pc_enabled)
>> @@ -165,20 +177,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  	case PMF_IF_V1:
>>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>>  			return;
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
>> -					   pdev->req1.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs_v1, in);
>>  		break;
>>  	case PMF_IF_V2:
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
>> -					   pdev->req.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs, in);
>>  		break;
>>  	default:
>>  		break;
>>  	}
>> -
>> -	/* Clear pending requests after handling */
>> -	memset(&pdev->req, 0, sizeof(pdev->req));
>> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>>  }
>>  
>>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..add742e33e1e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  		status = ret == TA_PMF_TYPE_SUCCESS;
>>  		if (status) {
>>  			dev->cb_flag = true;
>> +			dev->cbi_buf.head = 0;
>> +			dev->cbi_buf.tail = 0;
>>  			break;
>>  		}
>>  		amd_pmf_tee_deinit(dev);
>>
> 

