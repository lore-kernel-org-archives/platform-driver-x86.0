Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25B19DFA5
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343667; cv=fail; b=JX+wIiBGMpXvWWiOgN7G2Kl26E1PTjqPyRUqVFqKXVm3/yTQfO6ii9mUVgVQVKZsqcKSSrd5iLh/V5x7hnqs75tDDA1yNTx9/xZvHMSCoRY3ldXT+FtypAv0gs1XzeQAI840Kr3iWSMq9u3WW1dyjOdUUH00hiw3vyGNv23kZLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343667; c=relaxed/simple;
	bh=LifTD+3ItNlrTWqDAYEfv2mf1d94Qw8hj2tdaK/bFRQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y4ESrthU4MppUXKbUHcLo4DsqNv56B5g6uDxf3Tt2n5mObEhTrZfBE19puhDppMEQMKw3W8uhEljbLAfBdlFdvEJqtIkCA3ZUvNUD5oe278LU4cWrSHOk15gNcSN/RezjiK4Gq/yD4lpbzA4FxnLtK2a90fSJObayQ29h0j6mI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HJmX/rLi; arc=fail smtp.client-ip=40.107.92.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HJmX/rLi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0PRV2Hk7S9uSW2VZ23lc2nYI4LSa6a2VSc+DFSbmbB0uCuFlmY436D95S7BkhwMc2Bc2J1B4Rh2qcRjpT/J0LppPOMM7uZguz9NdN0KvQz+r8AAE4UlMnBSkjcrHHenIvXEt5LE2U7j7uXtcdTb+oznrP5gFh8W/K7AM8EUoxDLpXdgtxEBHfAkiGIOibqo1bcJ97CBOyIvL+B21CYkvyYpz4FsuLRRW/GTTe98nVob9ZHjgL2GE4pc/HYrorcoSI+m875r03ZPDhbpNGn4s7v8VIKtm+kv2417VWgNdjruNaF20AsjdcFrgA1MoOaAE1uxWC3K35syLKxpgTiACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlRWj0sKip8EfukQo2GY+m5lpw5Nb8iDJQZeFzzoAWs=;
 b=GSk59EkQDpF53UvKz0+/5ivPZgKr1s0U35TrEe6ZYXH1mnzrDlGUEwmkH/FdiaCuwY5smipUDUS8KTmrwRW0LoiGPmK9XwmPddlFo9Q1f3v1vr90xMr742h2f0IDv4Tb4g1KF8R3HTd2tcrVNdtt+6rxdg1VKoKA+JGpC+i4EaV3CecbPeIcnVsQdaAzHB79lJxnyTjvJ6F0Z3rDXTRIOU/b0jFtQOx735neWEwKVxzNcG1UfP/CAiTXTW8aZ8h1XmznmWVsXlS6ABdjuk1s66CBt+lo/SbL5cShUQWKMTWgE9FiVZm0sJQSRvMt46G8ZacoyMw/W8cR9r3iarf7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlRWj0sKip8EfukQo2GY+m5lpw5Nb8iDJQZeFzzoAWs=;
 b=HJmX/rLiNj1U7hHtAVdeDVNzTpPFnu8Rl2uhMuKNd7Jjj0POhic+RCFPPMavajLj6/UELSszMeEUSD9flfEJBWCZjUJ6JLIgjo/XuxIfWuNcQrtXdimvD7JPYMZUXgH/vL0HRgeCUPpSotvULlvRT2iZ4JVhNu2o2pW4+qIOei0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Tue, 30 Jul
 2024 12:47:42 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 12:47:42 +0000
Message-ID: <dafe4ee9-17e9-4151-9622-4dbf705f9067@amd.com>
Date: Tue, 30 Jul 2024 18:17:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Add new ACPI ID AMDI0107
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
 <d7accb91-4cf8-f89c-ebc8-210137e19530@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <d7accb91-4cf8-f89c-ebc8-210137e19530@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL1PR12MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: 0808038e-5c02-443c-8f56-08dcb095cd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXNSMW1MQzFqUEFndGJ2aTRZUUFycFdZVmcxakYvQ0FyVHowenRHQkVKVlF6?=
 =?utf-8?B?QzltdEY0dVRWTUR2MHdvbHhJVlFoMFd6Qnh5RDVBb3ZsemhUNXBkSlVjV1ZE?=
 =?utf-8?B?WFc4a3VNL1JEb3pJd3lOdGowSGtjQWRieFBzQTZ0RmZyajdad1pvWXNIV1Bs?=
 =?utf-8?B?NkdaeXYrTkoxWi9DUEdULzVHZ085bUVuekRxWUNuY3dsaWRRdmYrMTZnWkkv?=
 =?utf-8?B?ZEN5ejFzSE8wQnZDZk52VTMwTGZ1WmZ2YldieG90cmhlY0owOWN4UFlwKzN5?=
 =?utf-8?B?aElOQUErbnQ4NXBGR0pHVTlUS0JUWEJlTThXNXI5MG9kRDk3RFdPVnRDRDdQ?=
 =?utf-8?B?WVlyVGVjejJVUjVKMm1pUnZkTzJNVFl5OFhwVHIrS2FkNDNCalVSbkFGVUpy?=
 =?utf-8?B?c1dUWERpdSsrTlZaTFVjall0UkdrWU15YXF5UDd5Y2Q0aUduRDFKSXBhWFAw?=
 =?utf-8?B?THdTQ21DVWFjalExYmxhOElidjgrZmd3YnFqTGIwMTh1K29wUWlVVy9sSXR0?=
 =?utf-8?B?MWJDakRTeGQvaWtDQ3EwSHhzdi9lQmRlSm5OU05MVDlYalI1d081azgyQzIz?=
 =?utf-8?B?eVdxZjc0WmJpWHFxWldrTTBENmUyd0ZRbHRlN2hxZHV3ZXdYcTUzVzhpblFi?=
 =?utf-8?B?N1BUblhZRlNvbTlwTVdSengwZ3J2T1o4QmtkMFZXOGR1Y2FxQUNRemlLN3Ax?=
 =?utf-8?B?R2tJQ1prSnp4b0EzL0dERG0xaTlMNS95ZHh3cjJ1UnlxZklVQnB3Z2lQMWV1?=
 =?utf-8?B?UGF0Y0xOenJvdStVdWxWWk9EVjJWTmx3cy93RXRTb3FORWVQOUx4Sy9Wc1hy?=
 =?utf-8?B?QWhhVDBDN2VnendCbElOM2c2RGVKd0VPaXBuYnBRNzVSbnByT25JU1V1OHRC?=
 =?utf-8?B?RStCQ1dEN0s0SlVYMkEwMnB5Q2syQW9ObHA3SXM5eWZ6MnZuM1FIK05HakRB?=
 =?utf-8?B?dXhMTitxN0tzRStnSjE2VGdSK0hmWXRBMHNBTWFodk05alJnQjh0S1V6b01Y?=
 =?utf-8?B?cFR0QXo2NS9scXhVWlpqMGpkMHhXbjV1R0toVnEwOGtVMFVKUGQzWURmZ1Ev?=
 =?utf-8?B?NUZsQ3dnSGY3bWRDSkE5aE5CY0Q2OS9JSzk0QXNXRW84aVZjaWxDVjZPdmhB?=
 =?utf-8?B?amswVHI3cmtSUzNDTkorcXB5RVBmTjNpVHRJUnNaUW9vdGVhaDdvOWVWc216?=
 =?utf-8?B?QTM1eGtDanlPM3pnc1ZwRmpXc2lEU1E3c3pZUFVreFlHU0MrN1cybHRXWldu?=
 =?utf-8?B?RVgyNEZNMFBKVm1KMTBFcTJZdXlNNTk4VlVjQ29MbEJyVktaM2E2cWlPQURP?=
 =?utf-8?B?Qi9qc0wzQW9SQjFNS1ZLQzVHT2U4T25oSFk2YWxaQ3cxOVdiK0s3MTNxM1No?=
 =?utf-8?B?eXc1ZmdqVUVUd1FrakFRdDd0Y0FDVnBJbVJEK0NsdWpyUUFGdTdmV0VSRyt5?=
 =?utf-8?B?Sk1vZGZVMkQyKzJON1VrRG1Ebmc0MS95K3V3b2o0ZXAxTlFybUo1K2ttWm1E?=
 =?utf-8?B?Mjd2QTlBQTliYVl5dE9EYUxtT2hCejdsaDRaeDA3QUhTUUZGeFF3WlBoSnNq?=
 =?utf-8?B?UjFvYWJ3YmNVQ2VqdHpLZFNOVS9CT2lGR0lvVlZvSGIrbFN2NjVSMUxyQW9E?=
 =?utf-8?B?c0poNWFKTGF1ZnZlRkVGeCtEd2pheDBDcUJIOW0ydE4vY0U2WnNaZ0hVUEtP?=
 =?utf-8?B?ZkRrMG9FUUw3ZS9yQXQyTUd3cVRXYWlaMllVWC8vTzBNRCtOLzVKVFgyamw5?=
 =?utf-8?B?VTB1bE1sY2F6aE9EWE5lZ3dPb2UwVzhVclNHQTlsckw3VFF6V2E1ejFPSERV?=
 =?utf-8?B?YnhybzUrUnBpblJ5L3QyZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJNK29qSkxUWWtWT2V5S2c1c1FSMDNENlpWVHA0SmpkRERFUzZiRkUxR0pt?=
 =?utf-8?B?bTJHZUxQQnM0eVFpZmZIQ05RQzQwL1pSNlpGeTkvc0FjekFtc1F0TVdUR3hR?=
 =?utf-8?B?VVgvQTMzcFQ2RkgvcnNwQ3QxSzYzUkNWNXJEL3VMcys1ZFIrT0o1WG03MFVz?=
 =?utf-8?B?MW9ZSkQvZE1hUlpqWkZvYlR4dGJFdHhFUWZmcHovRkkvenczOHRJWFFHYW12?=
 =?utf-8?B?TnpXWDRJSHg3S0JpNXl0UURNN1diTEhDdEMvYUcwSFVaU2xqSGpDQ1Buc0Qx?=
 =?utf-8?B?NFlCMWxqMVEzZElpVERaeDdraFpkSXFnaVNUMEF6YXQ0cW0wVmZGSXJGR2ZM?=
 =?utf-8?B?ZzV6MWl0a0hqZjNoNGF6VTllZ0p5c1hEakw5NDFETnJzU3IvdDFLRkRWYnFQ?=
 =?utf-8?B?VlR6UGswY0ZBL20yVjNIZkxEdE1EOFZuRTVUWjh6SUlWS1ZrN2wvMTNBZGgv?=
 =?utf-8?B?bXk0K211WE92UFVCT2p1Qk5XRGJ6ZDk5d3ZRYXR4QmtmWnhOaS9iVGVaQkpB?=
 =?utf-8?B?ZjVySVpLM1RqV1JrK0RWWVUvWU1JR2Y5UWhweHE0RVNkWElMUXROaVRNdTF5?=
 =?utf-8?B?YTdMUFc0S1U4SkJUN0Npb2hGalM2NHRnczlHd01QVzJHbnB0cDRwRFhDdmY4?=
 =?utf-8?B?QklwUjVTU08rdWE3L1lsR3crc1ErL0NHYTZCQzJQaTVXTHo3QjdZSS9ZdTdF?=
 =?utf-8?B?UTFlSklzcFRDOUtXTWhCaHFXZlVzRTRLc2J4d08yd1hSZCtFZWVTeitvd0dN?=
 =?utf-8?B?eUlZRkY0N2FadWd2SlNUdGlVRDQ5bGhvTGVVMVlwSk1heVpFQW5nUk1vUnZl?=
 =?utf-8?B?Q0U3L2lKMnR6UWEzWW5uN2ZjdGlXMkt4SEtFTG13MFdKaWk2ZXJkTDN1VTdq?=
 =?utf-8?B?bGN3bHVQUDdLNWZ6Wm1rQWUwd0dWcjVNVENoeUg2RzJnd0ZxeG5YSGtieWxv?=
 =?utf-8?B?U1dYS29kU2tNcXl3cllZbkFXbjdrdFlYN0hOZmtGMzBLbmNtWGx0eDI3alQr?=
 =?utf-8?B?TDY3MGFDUS9uZlorcFVNZ0FjbGVHLzVWVUtnQ0x3V090dTgwaTV4ZWZadFJQ?=
 =?utf-8?B?Wkg0ek8vZWF5T1Q2eFNNeHc1TVhWUGlhOHpzRisxcVV1L2tyZlRMUmw5ajJ5?=
 =?utf-8?B?RjdYRTYzVWpIWGgvakQ5VEoraDNXRGNJTE9tcVI5emVRQUxxRnp6QlcxdWE2?=
 =?utf-8?B?UXJtT2FLT3RIOERxVTdrMkd0bGp6MWhkWllOTGxkejl3SSszdjV0OGNSRmk1?=
 =?utf-8?B?RDlwazRYRlczN0NKaGJiellnSGpvVU15aHN4N2ZvTStreVRqR0phRjFSajVK?=
 =?utf-8?B?eTA4cHNhblVWVjBCRHZCZXYxbUdOdkNvUXJUblluZkZZOG1WcDFzME5FNERm?=
 =?utf-8?B?RVV2SS9CY3BDbGdMU09SOG41c0hiNm51TGd2WllpL0x5Y1NLa2tJNnoybmlD?=
 =?utf-8?B?UGlFaFYrMXIwZTNDcjV5K29SVmFZNG9aNXloVlJDUVRyalZrRy9zWDl6d0lS?=
 =?utf-8?B?UHVzclQ1WE96OHFFODM0aGo5THdQM0RCR2dVVUxqN2hRUWViOE5GdVBPOFZ2?=
 =?utf-8?B?UzJIenRGblVtOHlyMGZZZUg5eVdKNUdTcUdoRXBiRHlaZEJLZklhYkNPcGs1?=
 =?utf-8?B?eGNZdXRFSGFDb29ac1lobnBCeWxTUms2emdsb3hmRlMxYUJtYjA3NzgyREI4?=
 =?utf-8?B?Wjk0dVdyZ2pENmE0dW1VVS8vcXBLRTJDNUhtNGVxTm9VbHNrQ1VHenE0eVY0?=
 =?utf-8?B?OWVrSzhIc3hMZ3dESmoyOFE2Y2I2eVY0c2RmbEF6cGxuVUtWdnpnOFFkZFFD?=
 =?utf-8?B?cWJqUVpaTWhLQ1lINmRTajNwUXFObU80VWprNU1XaGNDQ0pxbEdQWURreDI5?=
 =?utf-8?B?WEkxOEJwMm5NNUZmRTVCUWRqbENhS2tiSFdEQ2sxc3oxNjdDYU1zbjBLZkRn?=
 =?utf-8?B?NzlsZjJZSUNBWHJVU2RleWdZODMrRzRTaDlTL3c4K2pvbFlZT1dhWkREeEpN?=
 =?utf-8?B?WTFsWUNwWk0wVDd4b0w5YWdoUU8zTm5LaU5oM0xkWm1jcTA2OVIrTndFTlZn?=
 =?utf-8?B?Q3M0QlRwVzZHaFAydDZNbi80UzBJdHlDbWRHcDBDNFRYVU5DNGxxU1JVS3hy?=
 =?utf-8?Q?krHAdCXA8mcYZaj1+TJwVtcqh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0808038e-5c02-443c-8f56-08dcb095cd76
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 12:47:42.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e2CKXaoy6UOTWbNgBD8pXfjEi99ND6X8N1c1XmGW0PMXOEIH1F0Ne/wd2huWm9gzRpuJ6tVAZUf0M+AW2+PuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729



On 7/30/2024 18:08, Ilpo Järvinen wrote:
> On Tue, 23 Jul 2024, Shyam Sundar S K wrote:
> 
>> Add new ACPI ID AMDI0107 used by upcoming AMD platform to the PMF
>> supported list of devices.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
> This patch 1 applied to review-ilpo (the other is still pending with an 
> outstanding comment/question).
> 

Thank you Ilpo. I have looked at your remarks on patch 2/2. Shall send
a new revision in some time.

Thanks,
Shyam
