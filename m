Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C28360
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516664; cv=fail; b=Y8UJad8wvbeiHv4QMi/SIuTFKMjCtQjPWZiDFypq6TC4E8ZLhXUhNx2pLQMXWWoP/uPOL/zas2Qf/vKYFGhV7qor6QZY0dPFSfNJSTzlQtNARSO/1FkN30gzMZh+6OKeEkM/dZKYhfJIdPTA/NDe7aiXLsm3uZ9yoEUkyfc/2EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516664; c=relaxed/simple;
	bh=XbRyEpYQ6rms8N4B8Mf4lIg33/LJ7Skf97u/M6HPKRA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DayvP0beAve1Y9yS53N0V+JlMsH+d5snm5ylZNTmECxFD/L3/b92auASmXuh/TWth7zVy57n4qWduK3O9Y0frluKZbdWiqA1SBuTWwvgpmuwCFxCQTMHrfv7W7T60/uZZ55jAgixMqbEPqQjJK/fPVH+loPqkL2y7GCBSPQ7z2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sBSSLxlS; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sBSSLxlS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkGd/cMPOyI5ujvzk8ssZwD5VIAMzrUBwRlANgTYxnsHxf+OHJeyurIOF/a4uSuPzC4yAvH0IAfNkii9rw2bujWndwN+hCWFoQeYUM16I+ha4IhCJzXiSe4armHg9ty17IQ0xQxGQPbgdzFUEo2oQxpDnpCUA84nSy3q4PF54Md1uc/d+R7NDtjo60LXSjLD6V/T1VHQ3I1XvjV0F5RVPjM4yrigWH33g3hl1rNoR4v0LRVcmwFtriOdE24wUk7qu4KVheGnwVbN3bmzJH7oKouplhKgRHnDAcdS65NFzWlkmLE06Ay12cF4ev2LF+v9wPiwKK892onOYizrwUI14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNqWgnq7+alZyKHFkqoiU+hKpCNW684fExU+lHH9X/w=;
 b=FRFpz2Numw3EElYNom/woBffQ6gATeyJI1LMp44650z9DX9lnL4ghWR2lVeqT3BZcXueRuMQMWuq5QAC8Wliy0CmD61SQLPuQwKrauKBiaKrj+uFqE5xdugY3vj01O2dDCDGWBKkkGP9zpe9WzqFvpP2nIBHb1LGUPN5jXQZXEWCLEx1hBw6MSFOrf7dEOXDPREPQ+1ZYnvwsKLQpkU13lPDmd3jRPmkzH6HhQ8PEag6Guucf+0rm9zAg8BSk3/cBgqQQPTeZKOlC8VFSDxrpyMJ+Pz6tKyWAz9PbEK/yCSjUmQ4v7jARv/WeoPZGbhgWWhUSsqPpXy4aEEU4b0Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNqWgnq7+alZyKHFkqoiU+hKpCNW684fExU+lHH9X/w=;
 b=sBSSLxlSeGkNu8GdW3ziql4QtZNj8n1JoSrkWd6aQxRRMvvP+K5okbErbpJ5+HRBfWf5z/Zn/DSpx499yQrbwC7BeGFl7925jApdiKrLtYO/NEgInDEyb1gmDeMktBtSfy6y/RXsXVlY1+cI4lzDXNnc0iysE730tcQ5PFFJcIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 19:30:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 19:30:56 +0000
Message-ID: <15ceb029-9398-4dd7-b24b-80f88c2145f1@amd.com>
Date: Thu, 27 Jun 2024 14:30:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] platform/x86/amd/hsmp: Move strcuture and macros to
 header file
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
 <20240627053958.2533860-4-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240627053958.2533860-4-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:806:125::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 030bc83e-e376-4159-c476-08dc96dfaa7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkdmMHZCbUZIWHdyWmExWG5BanUvaGlpTS9VSXdybC82R1VtVWxOc1ZnUzYx?=
 =?utf-8?B?SzVvM2w3V1JkYmFJOFNaWG02SjhJZTRDN29vWjA3blFQbnFvN243RVNGMU9r?=
 =?utf-8?B?UDVxbll2QzdyWlNTd2swTnJncXFkNy96WWNFbzRhYVpzbHFGUWwwdExJMkUz?=
 =?utf-8?B?TzVwS1gwS2VHdkxtbmtEaHJwQWtOdlFSZyswUHp1ay83UDFIRXdRcWVhVkRM?=
 =?utf-8?B?ZzlTdktlQnliTFpWR0hSZkJlQUVvRDJKVlh3c0V1amk5dmQrT29pZ2hITGtT?=
 =?utf-8?B?VVpia25na0JSUnZTRG4waHlLbjVMSit4ZlVOQmNFZkY1WnhTM2dQQ1dPamY1?=
 =?utf-8?B?VHlGMStINDROay85OWR0T1l5MnNUc1VWT0dWRVZmMWFQWEJIRHFwRWJJOG8z?=
 =?utf-8?B?bk1RY3pHZ0lmWHZkVUk1S1pRTFpGUHBIL3FmM1hHWGxaOUxnbjBmM2ZURmhX?=
 =?utf-8?B?ZTQrcmV6QmZzTHRYZFJsTjQyNUgybzVnOHR3bFYwRE16SmZQQVFldElYYngr?=
 =?utf-8?B?UkJqMHFPaWF2VDRRMzgzUVpFNUNkNEdlZFlmMmhtRzJCM3JBZk5mVkpOZERZ?=
 =?utf-8?B?YnN1Z2ovR093VGZGMEtLK3BiTTRnRHA4dFNFWFpZUHRQRDN0R2pPN3JPQlRs?=
 =?utf-8?B?dy9iMVdmT1RUcnJZRE1sQVRFS1BBd0RNaFFzRzBxZWZwVzdZVUlJWFVOd1dW?=
 =?utf-8?B?dW1Da1JkZmozdHg3anNXVjY1SUJkK2JDNHRFQUs2aFJ1VjNzWGlzK0FUSy9o?=
 =?utf-8?B?WnQ5OWVsM0cvQ1pSVVNacEdDY3BHRFBYU2RHbnl5RHZqQTFvM1g5TFg1WXpO?=
 =?utf-8?B?MDIwMTU3NlJWSWhZZGJTOUEvS2tiM0hvbStnOTlNRHZIYTJoY1VkYUJZcTNZ?=
 =?utf-8?B?UFdFdmx4anMySUI0SVZ3MGY0QjBJMmpvNzlLajhyY1E2bzVYSEdKK3BRckFz?=
 =?utf-8?B?TXFEU1djcUYwRWNmUFFZVFJvTHYya3IrbW5WTXB0QzBEQmw5a0hUTDgrSlhU?=
 =?utf-8?B?WTZOSmNnZTZJNHlHVG01aGxDOWQ4VlZhS0NzOWxhdm9hUnhUY0MrNHlJYjlU?=
 =?utf-8?B?cEFocWc3NVZYeTVBU2JlSWZrUGhGckRoSmtJelU4Y2lwemJwSUFxRlVKS2s5?=
 =?utf-8?B?L1BpZ1BKWWVoejVLTFI3V2NxRXNPMUFZazFWRGFTbFRQUE1UVmpNQTA5SGtx?=
 =?utf-8?B?Z2phZmRSWkFQNHZMd01JazNYREpKUHZXd2NCUDB6NXp6Y1hhQW1adHV6dlln?=
 =?utf-8?B?Z2VTRjhFdVIzSnI4ZHRrOUF3UkV3Q0R4WFMrZ3ZNQ08wRVBtQ1hsK3RpWEpQ?=
 =?utf-8?B?aWg1S0RobW12THEvMFphWGEvNVZCb0c0UGhSUUx4WXU0aFJOU1JBREl3a0pV?=
 =?utf-8?B?TVoxRDloYU5yM1ZHaCtmOGxTWGEwVWEyWjhpbUwrc1BYYWJMaHZBMlBtaTZj?=
 =?utf-8?B?L3BHYjJMTHNYZjNpZUk5aUFWdmtNVHVoaGhjWG9qTWUyRWl5YTNvaDErMFlV?=
 =?utf-8?B?LzBIbWdOa2dydzlZaGoySW0zMnI5akY0cEQvY28yU1UxanA0dnZZZ2M0Slg2?=
 =?utf-8?B?QVltck1tb2xWK0ZwTDhsRTNGdllqc0pKa3IvK0lFUWM3Mk1UWjF5WTltM1E1?=
 =?utf-8?B?bmZJREFTSE9jcVJTTUhPMCtTeHBxS1h2bHgvR254Rm0waVNudGlkOXkyRjFL?=
 =?utf-8?B?YnAvT0o1Sit5V3pHbW1WZndjSnBMaEJxdUxEY0dSaks4bWNNU2xiaHRSOXdQ?=
 =?utf-8?B?YnJSUWQzbFdzRDQ4K212ckNubmxwdDZEOStmT2dMLzdoR3hzbG9Sanh0cWhX?=
 =?utf-8?B?ZmMwalFxRjZqc1loL042dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDJTKzJQSFU2Wmw3aWZWVmdYeFJjNnd3WmN5QUNZSklKblEwOWtxVithWmc4?=
 =?utf-8?B?UzZiN1RpZHFFMC9YRHlmemovekU0KzdYN2pVTnFncHkwZ1grM3RaZEZ4T2F6?=
 =?utf-8?B?K2tKWGt0OW1nSmJrNER0UU50VXpvVU1TVVFDeFFpbHBqRElSL1JQQUNKY0Fv?=
 =?utf-8?B?MUZ4eWs3dDlwaTQybmJ2RVFmS3AydGdXMkVNZDdzYkZMVVNDdGg5Um9QdWhS?=
 =?utf-8?B?czBtQUgxakRlK1VpdXR5ZlJPL3VVcG93Y0Rkeks0TG5TWUhsMlZiVExIeEVI?=
 =?utf-8?B?VE9QOENMTWJyZXRySXUxcVM3QnZtQWVRbkNVMGFqc3ZmOVVhcm9WaEtpaHN6?=
 =?utf-8?B?MW5HNkUxdFQrSVFKTys1TE81ZmZ6QWd3MUlHUGoyaUQ2MHNHTVFaRUN1N2xG?=
 =?utf-8?B?Zkh6dFJGVksxQjk5MUxGcEV3T0VjVXBIbkxwTnFNZFBzbzdMUDBaUkhtM1lo?=
 =?utf-8?B?MXNoUDhHZGQyL1RXbFZZYXdyYzR5ZjM0azdyMzg4M2FGSFFlQisrdE5XOUly?=
 =?utf-8?B?dFQ2eXJ0YW9WTjZ3NFZJRmpRekNGQ1FseFpteFpxOXhkaUJaMk9RODFGdGhY?=
 =?utf-8?B?cnk1V0RwTkVYclRSOVlJVWVsUHJaalpnV3ladlVJRWpYL1VLQ0FOSkJnbnMy?=
 =?utf-8?B?eCsyTHIyY1lHQXlvNExmS0JSWFhMWkxlVTNrbWx4b3l0aEtPZ0JRRlhGMzRC?=
 =?utf-8?B?UGtGdTdKLzlGU2o2NGQ3RjVGOG54RUFobk1UdmgrMkRHTS9PaitadHltWDl1?=
 =?utf-8?B?YUtGaWJKaytsUU1haFh6ZHZxamJ1VnZESWVkcEFUeXRwK2xzTjJzancxSDY5?=
 =?utf-8?B?bGVmc0RmWmVhaUpUSDZnY3NISnloSHFaNnllVElrdWdMbmRQM1JCRGVIcUpm?=
 =?utf-8?B?ZGVWc0NxVTlXVDBZdWFTT003cGswMjRkL2xKdldwZ3dmMEFWM0ZwODZVbVY5?=
 =?utf-8?B?Um1xWGVHQTBVZW9TK0s2TVhObUZ1eHVzMTFjdXZYQ3hrMUpGTjJocjJIb0E4?=
 =?utf-8?B?NkIzcXJuUUdkU28wYWlKek51bndCYkdhak83MlJGa08xRFJva2diZ0QzVHcy?=
 =?utf-8?B?cFZUNEEwZkJSRzF2MFpPTFpjUGtiRzdoK0gwRlV6YmwvUzhmRzRPcnBDS2Rj?=
 =?utf-8?B?dWcyQW9idVBGckN5SlFHR3cyLzJMY3NWVWpCUFJBRXBuNGxhK3huNzFhWFRS?=
 =?utf-8?B?TTZVV0VOQTJ4cFZuL0VmcEtBT3V0a2FtenRsOExjcTh3NXgzNEE2UUJFaGVS?=
 =?utf-8?B?N1FTWWJOellOeHNqUWNkbERSVWZFNGRVUUVoWUhiMVhxSXJuMis3aWZRYldp?=
 =?utf-8?B?cFhIVnlWbTFtZWk2L2daeHN0TmRXSytEK3VpOU1KMnB2S1p5dm5nNGs2dmhn?=
 =?utf-8?B?SlRXQmNCYlNQckxBaHc2anFDVjBFNkZCcFBPcGV2bG11MFhaY1NpeGFuYjlr?=
 =?utf-8?B?TUhaOThaUjNmWnRvM0pqT1RYL21HM1p0UkV2SURONnFWbVFPQW5CbzhUVWhL?=
 =?utf-8?B?MjY2NVJOM294STcxWGlUay9Mb2VFOXlmS3prbXlOdnpWeW9PQjU1b1pZdUNI?=
 =?utf-8?B?YTNmeXV2dytSRFpkZ1VlUXZLWXZBK1pubjBhR0N1QzN0TStqUFFsK211SWw0?=
 =?utf-8?B?bGlIU2ZVZ29UTE5ITUVoQjRSWWVtTlV1dlAvQ0tKd0lyUUxxTmhCWmROYUEv?=
 =?utf-8?B?SlgyK001aXNCYkNjMVgyV3ZxZ0hoM3JqV2JIMERaZUl5dDJFaTcvSUU2Rkp0?=
 =?utf-8?B?SjVlemRLK29ITEZaMjNLSWg1SXVpRXRzbGVYRitIT21zRHVSZksxQ2JvZ21I?=
 =?utf-8?B?ZFdzMmIvVHhISEwxd2t6WkdoaUM4bDQ0bmNjSVZ4M0YyUFovNjhHS3FpalBQ?=
 =?utf-8?B?OFUzWnlrZlZOSDdSdEZoTGJjZjZ3MEFXeVdIb1Z0dWNsbEJXWmpWbVRmaFQ3?=
 =?utf-8?B?OHo1RWtVSk43ZDkxKzBoejcvWE1NeStlU1ZYN1F0cldteVBtNU9YY3paSGNZ?=
 =?utf-8?B?ZDU4am83SlYzRHZVZW5lOU8zd0tBd1Q5TTVRb1RxR3kwd0JsbnpjNURlWDRk?=
 =?utf-8?B?azQ3TDlGS1lJWGpHaHo0QXhITVdFRnJlU1ZJampScEFPR0tJaldRTG41bUYw?=
 =?utf-8?Q?C9hxzCgD1YltlpawY+GlSgnd5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030bc83e-e376-4159-c476-08dc96dfaa7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 19:30:56.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lQn04IdISezF9bqYereSbY66/+n3WQIP6R7oErXO2SaZHaXYVchvL6wKZ1u0Re2cVbT3nvsjCukVGr1ZhATVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974


You have a typo in the title.

On 6/27/2024 00:39, Suma Hegde wrote:
> This is in preparation to splitting ACPI and platform device drivers.
> No logical change, move common structures and macros to hsmp.h
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 42 ++--------------------
>   drivers/platform/x86/amd/hsmp/hsmp.h | 54 ++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+), 40 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 10ab9b2437f1..2c9ba51b9614 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -9,15 +9,14 @@
>   
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
> +#include "hsmp.h"
> +
>   #include <asm/amd_hsmp.h>
>   #include <asm/amd_nb.h>
>   #include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/miscdevice.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
> -#include <linux/semaphore.h>
>   #include <linux/acpi.h>
>   
>   #define DRIVER_NAME		"amd_hsmp"
> @@ -51,48 +50,11 @@
>   #define HSMP_INDEX_REG		0xc4
>   #define HSMP_DATA_REG		0xc8
>   
> -#define HSMP_CDEV_NAME		"hsmp_cdev"
> -#define HSMP_DEVNODE_NAME	"hsmp"
> -#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
> -
> -#define HSMP_ATTR_GRP_NAME_SIZE	10
> -
>   /* These are the strings specified in ACPI table */
>   #define MSG_IDOFF_STR		"MsgIdOffset"
>   #define MSG_ARGOFF_STR		"MsgArgOffset"
>   #define MSG_RESPOFF_STR		"MsgRspOffset"
>   
> -#define MAX_AMD_SOCKETS 8
> -
> -struct hsmp_mbaddr_info {
> -	u32 base_addr;
> -	u32 msg_id_off;
> -	u32 msg_resp_off;
> -	u32 msg_arg_off;
> -	u32 size;
> -};
> -
> -struct hsmp_socket {
> -	struct bin_attribute hsmp_attr;
> -	struct hsmp_mbaddr_info mbinfo;
> -	void __iomem *metric_tbl_addr;
> -	void __iomem *virt_base_addr;
> -	struct semaphore hsmp_sem;
> -	char name[HSMP_ATTR_GRP_NAME_SIZE];
> -	struct pci_dev *root;
> -	struct device *dev;
> -	u16 sock_ind;
> -};
> -
> -struct hsmp_plat_device {
> -	struct miscdevice hsmp_device;
> -	struct hsmp_socket *sock;
> -	u32 proto_ver;
> -	u16 num_sockets;
> -	bool is_acpi_device;
> -	bool is_probed;
> -};
> -
>   static struct hsmp_plat_device plat_dev;
>   
>   static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> new file mode 100644
> index 000000000000..cc11e9303a83
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * Header file for HSMP driver
> + */
> +
> +#ifndef HSMP_H
> +#define HSMP_H
> +
> +#include <linux/io.h>
> +#include <linux/semaphore.h>
> +#include <linux/miscdevice.h>
> +
> +#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
> +
> +#define HSMP_ATTR_GRP_NAME_SIZE	10
> +
> +#define MAX_AMD_SOCKETS 8
> +
> +#define HSMP_CDEV_NAME		"hsmp_cdev"
> +#define HSMP_DEVNODE_NAME	"hsmp"
> +
> +struct hsmp_mbaddr_info {
> +	u32 base_addr;
> +	u32 msg_id_off;
> +	u32 msg_resp_off;
> +	u32 msg_arg_off;
> +	u32 size;
> +};
> +
> +struct hsmp_socket {
> +	struct bin_attribute hsmp_attr;
> +	struct hsmp_mbaddr_info mbinfo;
> +	void __iomem *metric_tbl_addr;
> +	void __iomem *virt_base_addr;
> +	struct semaphore hsmp_sem;
> +	char name[HSMP_ATTR_GRP_NAME_SIZE];
> +	struct pci_dev *root;
> +	struct device *dev;
> +	u16 sock_ind;
> +};
> +
> +struct hsmp_plat_device {
> +	struct miscdevice hsmp_device;
> +	struct hsmp_socket *sock;
> +	u32 proto_ver;
> +	u16 num_sockets;
> +	bool is_acpi_device;
> +	bool is_probed;
> +};
> +#endif /* HSMP_H */

