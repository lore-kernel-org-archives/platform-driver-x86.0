Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231A2989B5
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459238; cv=fail; b=STekANUboTzwPHgcBudnNu5v9HIWhLHVmOziebGDQc2URnXfUjKFFpuJ0agADQFCOGDNDEkW3BYg3C55eTR//R1ZJ33VHKKQgGtTSkksHSEegr2dbJb2FEFOp90FMlKBpYbRd1fDAzXtvoV3lMQygAES8TuV7pCk5RoPcY0aMkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459238; c=relaxed/simple;
	bh=o9mqUE4FtGbGmsONO+heazbVtb7GmYDgqvwFQJLPZH0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qOlTBne5uekanEqCs+ZjWGcc8lbyFOjLb/Ybh53UydTNZIL6SO17rvPDFHOz4Ne75bUt2tmEoOGpWQtPeqzoAg5KCGL4IHDvYVtmgrL8o5cEl05npf5f6PSD/KqELWat8GFnoG8hrwOV7vx0CxBg6Kx7RUHL/KUL9fNhlipo/CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=koW+Bwiu; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="koW+Bwiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFwl99tnZT/6czQYbVgemi+nT0K1rixxR3YcyTaO2/ZwMTKKPpcLMN3H5CCfJNO6tcafxaA4lufUwmEwJZyRlsWwhGVYPL9Bdj5DIz476llB88QEZA4VzYmyXWY1oWpelSovUVPVC6gidoUrzuBl5cgTLmplPOU1B+XQSMqdWCG7MuvLcXyG9rxhQM8QHx1p5/VdkH9q2fIp1VgEYUDerto34bMprwsx1A9QaMBrSqD+GojElVArE18H9J0RyZZTEcuhcI5SvVZiAmv/bRwCYyMfCYXJpRcgAztKbfsPfv98lYr7YampubLcWzeHYJLgGBwZZAXlgT7s3bZlB8pmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1LSxRRoVt0NILjB30d6gX1mqSTOIm/+6IQ5EnVUxvU=;
 b=f4WqqQaCqfe3KdVB8q2a34JJx8HcV56mmtO7p25oVMEooOPBOUbN41BC+RVvChwwb7WWUnfNLcf7CyvniWG2XZuhMLhSdl+HqMj+Nv3FpYkMu3tfBkiA8GU4bDyeXV06+sd4OHMXC4tfI8WE3S8nqB8TSTEX/a9Ag10S5ernZG2509c+uLTvgRKoHAMBHrflD1xZe+Bu8v4NMsVY94FcDJnLPYWIn36jxnfiP++2xlAWDT3SGk67ftD4gp0joBXDGj1WMEoh3WgJsL/DIdr1bNDYvEZLao7P1xtZqqZwSavzMfwMWLMMU6mGBBhPbXt/82PM78O1xOLw9AVoWt0CPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1LSxRRoVt0NILjB30d6gX1mqSTOIm/+6IQ5EnVUxvU=;
 b=koW+Bwiu0tEivd+atlhlZYrw/Xzxe+0+qL88BMQMMr1oKk7kS+HtPhKRKEuGE6cXnZeKf/abFqjwppRtJu6982GmNBEh8zdYqjGcmBXt1HTt2ZnZPHz8a1zFyIzkJ6gTFFFeXRtiX32rcumt5jXONqtN/gurwqd0e3LU3/kyl18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 16:27:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:27:14 +0000
Message-ID: <5c779186-d79f-4cb7-8d77-065498dbad6b@amd.com>
Date: Tue, 14 Oct 2025 11:27:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Use ring buffer to store custom
 BIOS input values
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com
References: <20251014110141.1844925-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251014110141.1844925-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:5:190::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be708c4-91fa-4d52-3b5c-08de0b3e8870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NG92eDVUUmZiVEJjaUR2ZVlnYjVqdXZpUjJtU2lLZGw4clNiQkNaa3NEeUlt?=
 =?utf-8?B?VEdPako2cnNmakJCZEJIc2EzNGwzOXhTL3Byei9wTy9VUytKVWdGTE5iYVY4?=
 =?utf-8?B?bTBjMC9zbjlEbDRTM0ptM2wyeTdaaW9YL21yc3hlMjBnamxrczBncGgvS29V?=
 =?utf-8?B?VlpjeUwySDE4VlJqZGpKSUZPWmRITTBrcXRlWjlUZytwSTNFSU15elVzbFhN?=
 =?utf-8?B?cm51ajhVUlA2YmNJcStEeVhPNGp6cStJM0pPTDFVdDZERHhWbjlXQmE5TDZw?=
 =?utf-8?B?Rnlkd3RObWY2S0E1dXM2VTVHSkFYTTE1UHBubHhYSXRqWDg0M2ovTCs4dzlO?=
 =?utf-8?B?QVVWc2Urb1luMmkyOFV6ZWFzMEVoWFdoWDNKcU4yWWFqRTYvVldHKzRkWFpV?=
 =?utf-8?B?SE8zY0RDcGlHTEF1N2QrYzZ2VGZQMXJSSWh3LzdiVkZjVVc5SXRnMGxCb0lx?=
 =?utf-8?B?T1NtNkp2VzZTK2NXQ0x3TnhvSzdWRGVVc1FOSE9qZ0lCYXZEenRUVGNwcVRN?=
 =?utf-8?B?a05MeGhUbWtDdEtBQ2cycTlBZVNrQ1BSY2xMUi9sSFBJWlZQUE9aT2dvUkVi?=
 =?utf-8?B?c2dKN1o0MlhtM3ExeVRHQlpHb2VFS1kxSzUzSzh2c0dLRnpiWDFDTFM0cTAy?=
 =?utf-8?B?eDZyVnJyTlpCQTVneTBHbHpFaGRVSGpxdzJXUmVYdlp4b2kzNnZsRTRlUURi?=
 =?utf-8?B?d3RaUVppcFdWczI0RERxZ2puV3JaZFZ1NXNCUkFXYmtYVFpqSGlMWkhCMjBX?=
 =?utf-8?B?SlZRL2N4YnU2ckNaY0ZrdzdKRkdkU2drRDBrT05QOFN1d0NOSEJ0Ylg5c2F1?=
 =?utf-8?B?dHFnQWpEQ0lTcnNIaUplWnhvMHZ5MGN0dmNJWG15SFNnQ3NVYTRKcmZobjBT?=
 =?utf-8?B?Mmo3UHE1STIwR0ZYYk5iY3JNOHA3RzdiTHlvaHNCZ0xweFpaZlZhNCtZYUlz?=
 =?utf-8?B?cmg2Q3VzTWQxN2NYc0hBdUZqbTNKTDMxMWFkVW5IS3RsYzMvd3M0Nmh0YlVS?=
 =?utf-8?B?emtIanVsSjN2YXl5cHp0eDMwRENBY1MvS3orQnhOU1NleUFFUnpld1lWZmNu?=
 =?utf-8?B?dFgveHBQdXFIWnd2Q2NudndReTFjOXdWK1N2YXFmWVFKOFVOZUV3V2FnNWxN?=
 =?utf-8?B?ZHIwSW9XbEdLeFdRbDZCVmpIZGthVDk0OURTVWFrbDdKMFZTZTMrMEQ4K3g4?=
 =?utf-8?B?TFhFeTlnWVA1Zk5CUE5YQ3RBWExySmRqSFNaZ1hYVkFFMXNyMFNVa3lXbjQx?=
 =?utf-8?B?V01PY1BVWHY1QnFyMENkc1JFcFFIc0pqSVEwMmNQWmpwNE55UXNBNENkMkpC?=
 =?utf-8?B?dkROSURNUW85bXFKZTd1cFNBZU5pZUV6MlRuN3NoQ0VST1Z6UU5ZTGtidlZt?=
 =?utf-8?B?T1hYdC9uTUYyMnF0R0xiU2tMbnJHejFnQ21tRjI2RlRkTDR0UmVtOHF5dzFq?=
 =?utf-8?B?WmZPQ2tzWEpVRDJwQnAzdGxadDBZNUN0TDV5Z3ZpQ1Bab243b0JlOHRTNnFq?=
 =?utf-8?B?VFRTb0xudWE4eGErOG4vM3VBcUR3L1hHZ3hsdWlNNHRjSS9icXhVc3Q5NnRT?=
 =?utf-8?B?L1NpMzlvTkUvdFNLVGNxNHZOSVBxbFo2NG4xZlV4N0FxdjhLc2dYZFYvQWZv?=
 =?utf-8?B?MXVlZU4rRDdZekZsaUZkd29pVEZVU1NRZkxBSUU4Tmd1SFBsVWZ3aTJiV2s3?=
 =?utf-8?B?eEtHZTY5ZVgwZWFIRXUwOUVMVkY3aldXSldTTWM3NGp6R1JIaFUzcXRGcWZw?=
 =?utf-8?B?MzFSa05hQTNoeUFRQ2dRYlB6RFNXWlFrc0V3L1BHaEhLZHd3MWl4Rm1XR3hy?=
 =?utf-8?B?UUtXMEdaWjB3a2EzazFMWmdvWGxoT2JLanhhZU1Za3dOek5oZndhWGFDTE1p?=
 =?utf-8?B?djh1b1ViT0xOM1Fvei83MnFuWGFKTGhmRUZ0czVEbE1qbjB5RU44S1QvcSs3?=
 =?utf-8?Q?6rTw/wVnNlilrMDqZQRAhO10hPg5OqkK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGFmTlBUSXFBL2FuRW1kaVVhNTFzWGZpdVgrRStlK3BsWC9mY1NFeXhLRWZ5?=
 =?utf-8?B?QkpGZlB4bFphOG9yZ0xuMy9UdHVKM25WQjlxUkRJbzNxTFRJU2xPNVNaV0xY?=
 =?utf-8?B?aVNBbTRTRFYyWFhnNlNMR1BpYldPcXN0ZGhYS2w5bk90TDNuNUhRVXdoSWtN?=
 =?utf-8?B?T1BTcFRsbklSSThsaE43ZlJrMllKLzhFck5VRzhmc1NJa0NneGs4MmZLM25m?=
 =?utf-8?B?Slc2UGNNMjZRVFFTcXkyTU04ODZ1N1gvV1JwTzhYMFhkd0ExRDlCQ0U4ZUtT?=
 =?utf-8?B?YW5GbEQ0U2gwWUxGS1RhOVg5K2hRTEpjRFRaY01MVFVzVndjclVhYlI4aGdO?=
 =?utf-8?B?cC9LY3ZrZmFCVWkvNTRKMStyQkxlUzR1TG00T3pBRjQzU1pmUGhOUGx3YXE5?=
 =?utf-8?B?SklrVnovM2dBRDJZR0RxdVRjMWNHR3FPbktOdVNMQUxZbWpGbWQrdUN2RUM5?=
 =?utf-8?B?dzhWd3ZicXl3WlV1YUMreG1JMUJ4bHRRL3VKVFdGWnZjMnNvb2VSTXd6d2oz?=
 =?utf-8?B?VWZsbzF3Ujl2QjNUekw2M3d2Zk5xd1NSbVhOTGNKd3N0ZC9vcXVob1lqN2Q5?=
 =?utf-8?B?SVoxSmhKK0REWkJnV3NZT0JLZ3dYQnVJZmo4dmo1cVVWTWlDNWxnWWxSQTAr?=
 =?utf-8?B?TDJJR0NjblMxYmJWdHB6QjhXQTBVMU54bVdxNURZK2FEa1BnWUdwV2J5dlQ5?=
 =?utf-8?B?MzU0ZERXM3JWMnprOW10T21TbEx3M2c3d0UrRGVnSUFuYUV5S2Q2eU9JaEtx?=
 =?utf-8?B?cFl6Ykd2SU9oS0wwNHh1THU2WkJXMjJtOFJKWmMxRmx4TmErYkcxWDBMejhB?=
 =?utf-8?B?UHNrUHluWjdDTXZhZitJbk9Da1RJcDhFV2MzNHk1c1hPeXhhMGlKZjk0c2Fz?=
 =?utf-8?B?WVh2bk5IUFJ6Sk9IMW9XU1d3NExGOUVzVlBpWUxZOTZOVTJBQXZRSm02Y05y?=
 =?utf-8?B?Y3ViS2h0UkJ2ZmMyZ1pPVzQwQ2xsN3hrSHlUZlNqWWdaVWR5S1o5dGRKeXIr?=
 =?utf-8?B?b0pITVRlMGc5V2FBbXR6UFl2N2VFbG1BQkd5N2pDRHI0dSs3MUdmT1lTU0Fw?=
 =?utf-8?B?K1Z3d3BOdnJMaG8zWnBSSjk2R3FCZTVzc0I2UjMvY200eUJxZ3RlajdtVWV0?=
 =?utf-8?B?cDZwQk9hVWwwWWdEVERMY1hJTW8rWTNFZTlDeVhvb1NJaTlNT1JTUUhGUXR5?=
 =?utf-8?B?RkUvSVBZRDJsT25hbktOdTlhRFZOeHpKR3BqVEdOTmRhZFhiTXRiZGY2QXpR?=
 =?utf-8?B?aGgxdkNKaFgyem9vUlBhZDAxWE9JSFowTXY4eEYxWU9wazJxeXNFUVR0azBG?=
 =?utf-8?B?bzIwc24ydzNRZGtYNFhSemFCaTlsOC9vUmxkVWtqMDZyL0k5R3l2TTZCQ3lP?=
 =?utf-8?B?ekJ2SzM1VXBmaXJFOTdjOHJzTVBwL3FpUFRuZ3VrS1UvejZaSFRWUGU5YkdQ?=
 =?utf-8?B?aEhOT2F1YkZIY09Zd2h2TElIaUk5emFKbUs2RVRXeFF4aXRVMUtmV2NjSXhD?=
 =?utf-8?B?MWh3WDdYQTBwN0xza1drK1R1djVXTzFzN0VHUHd4YWxiNXBkNWY5cGtnbWt5?=
 =?utf-8?B?dC9sRmRGNVB2MFBBbGxHeGg5TTN3UElQNGJEQnlGWVBWUUR6R0tWU2FWZytv?=
 =?utf-8?B?elNLdW42Tktsa3pmdE90c3I2ZmxpOWZCaXRxS1dobUlZbmJXYkJ1OEw1eDJo?=
 =?utf-8?B?aHExK01nOXAzdmlCeHc0ZDNqakNyK2ZteFVxWDZ1UmR2YzFzUjZmcXRjWXRk?=
 =?utf-8?B?bDVLR3UzcHh1blB1clVoKzRuYk8yclhzaTVHQktNaXhCUXN4b2hPZElueEdZ?=
 =?utf-8?B?RjRjSGZxaW5HUVFydmRDc0N2V0VCdW15djdmakkrU0diN1Y5UGJ1eHhuNGx5?=
 =?utf-8?B?bllEY280cEg3eUh3Q1Bjd2owYUd1Q3hnaXNzSjBBOWhBQUtYSW1GakRoZjNR?=
 =?utf-8?B?UWJHQmJlYUV0VTA4UUdKUlk4RWEwQ0lqYURycndkM0VMRzhMdWxIYTdWVFZh?=
 =?utf-8?B?RkpSWTEzRlNlSHgvZVhiZjBxVVl5TTdiM1NCZUhIaXh3NGJrVGszdjFVRUdL?=
 =?utf-8?B?bHlRK0s4ZVp0eloyZ3pRT1RJR1UvMXF5Yy9SNHRZU2dRRlNlZjMyaVJrVkVp?=
 =?utf-8?Q?IhcxdUji0Y6mPi3l9eFFEa3dw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be708c4-91fa-4d52-3b5c-08de0b3e8870
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:27:13.9941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3himCZ1hYlCNaGLX/oc6yA/csKH7uUWqOEfXNSQzkwr2IdN+oyOG6qwwktRhjsTfYcGku+XmlINglhCLcc3aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920



On 10/14/2025 6:01 AM, Shyam Sundar S K wrote:
> Custom BIOS input values can be updated by multiple sources, such as power
> mode changes and sensor events, each triggering a custom BIOS input event.
> When these events occur in rapid succession, new data may overwrite
> previous values before they are processed, resulting in lost updates.
> 
> To address this, introduce a fixed-size, power-of-two ring buffer to
> capture every custom BIOS input event, storing both the pending request
> and its associated input values. Access to the ring buffer is synchronized
> using a mutex.
> 
> The previous use of memset() to clear the pending request structure after
> each event is removed, as each BIOS input value is now copied into the
> buffer as a snapshot. Consumers now process entries directly from the ring
> buffer, making explicit clearing of the pending request structure
> unnecessary.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/core.c   |  2 ++
>   drivers/platform/x86/amd/pmf/pmf.h    | 20 ++++++++++++++
>   drivers/platform/x86/amd/pmf/spc.c    | 24 ++++++++++------
>   drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>   5 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 13c4fec2c7ef..8a5eb3eeba55 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -331,6 +331,42 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>   									 req, sizeof(*req));
>   }
>   
> +/* Store custom BIOS inputs data in ring buffer */
> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
> +{
> +	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
> +	struct bios_input_entry entry = { };
> +	int i;
> +
> +	guard(mutex)(&pmf_dev->rb_mutex);
> +
> +	switch (pmf_dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> +			entry.val[i] = pmf_dev->req1.custom_policy[i];
> +		entry.preq = pmf_dev->req1.pending_req;
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +			entry.val[i] = pmf_dev->req.custom_policy[i];
> +		entry.preq = pmf_dev->req.pending_req;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	} else {
> +		/* Rare case: ensures the newest BIOS input value is kept */

Even if it's rare, maybe a warning should be emitted so that it's clear 
that "some data" might have gotten lost.

> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	}
> +}
> +
>   static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>   {
>   	if (!pdev->cb_flag)
> @@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>   	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>   
>   	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>   }
>   
>   static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>   	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>   
>   	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>   }
>   
>   static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..98aa9712b7f6 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	mutex_init(&dev->lock);
>   	mutex_init(&dev->update_mutex);
>   	mutex_init(&dev->cb_mutex);
> +	mutex_init(&dev->rb_mutex);
>   
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>   	mutex_destroy(&dev->lock);
>   	mutex_destroy(&dev->update_mutex);
>   	mutex_destroy(&dev->cb_mutex);
> +	mutex_destroy(&dev->rb_mutex);
>   }
>   
>   static const struct attribute_group *amd_pmf_driver_groups[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index bd19f2a6bc78..31dfd671f44b 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>   #define PMF_H
>   
>   #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>   #include <linux/input.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> @@ -119,6 +120,7 @@ struct cookie_header {
>   
>   #define APTS_MAX_STATES		16
>   #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
> +#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */
>   
>   typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>   
> @@ -358,6 +360,22 @@ struct pmf_bios_inputs_prev {
>   	u32 custom_bios_inputs[10];
>   };
>   
> +/**
> + * struct bios_input_entry - Snapshot of custom BIOS input event
> + * @val: Array of custom BIOS input values
> + * @preq: Pending request value associated with this event
> + */
> +struct bios_input_entry {
> +	u32 val[10];

There's a few places that are fixating on "10 inputs":

* apmf_sbios_req_v1
* apmf_sbios_req_v2
* pmf_bios_inputs_prev
* amd_pmf_notify_smart_pc_update

Do you think a define is worth while?

> +	u32 preq;
> +};
> +
> +struct cbi_ring_buffer {
> +	struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
> +	int head;
> +	int tail;
> +};
> +
>   struct amd_pmf_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -406,6 +424,8 @@ struct amd_pmf_dev {
>   	struct apmf_sbios_req_v1 req1;
>   	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>   	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct cbi_ring_buffer cbi_buf;
> +	struct mutex rb_mutex;		     /* Protects ring buffer access */

For consistency how about 'cbi_mutex'?

>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..436ecbf07aec 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -150,14 +150,26 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
>   static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>   					   struct ta_pmf_enact_table *in)
>   {
> +	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
> +	struct bios_input_entry entry = { };
>   	unsigned int i;
>   
> +	guard(mutex)(&pdev->rb_mutex);
> +
>   	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>   		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>   
> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
> +		return;	/* return if ring buffer is empty */
> +
> +	entry = rb->data[rb->tail];
> +
> +	/* If no active custom BIOS input pending request, do not consume further work */
> +	if (!entry.preq)
>   		return;
>   
> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);

Is this the right place?  I would think you still want to move the tail 
if CIRC_CNT() > 0 and there is an empty request.

IE move this before

if (!entry.preq)


> +
>   	if (!pdev->smart_pc_enabled)
>   		return;
>   
> @@ -165,20 +177,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>   	case PMF_IF_V1:
>   		if (!is_apmf_bios_input_notifications_supported(pdev))
>   			return;
> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> -					   pdev->req1.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs_v1, entry.val, in);
>   		break;
>   	case PMF_IF_V2:
> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> -					   pdev->req.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs, entry.val, in);
>   		break;
>   	default:
>   		break;
>   	}
> -
> -	/* Clear pending requests after handling */
> -	memset(&pdev->req, 0, sizeof(pdev->req));
> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>   }
>   
>   static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..add742e33e1e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		status = ret == TA_PMF_TYPE_SUCCESS;
>   		if (status) {
>   			dev->cb_flag = true;

Do you think you still need cb_flag?  Or could you instead look at 
cbi_buf head and tail where it's used?
> +			dev->cbi_buf.head = 0;
> +			dev->cbi_buf.tail = 0;
>   			break;
>   		}
>   		amd_pmf_tee_deinit(dev);

