Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48111482ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Nov 2024 03:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731988472; cv=fail; b=Sg5WENgNsbFUgqcUkEdFoTrytnn/UZC9o9IVECroIRzxgpDTYuIEnV3nLDRCh19KB8CUZvGO2Flb9W73nednR/i0DY6K/lHSIBUpqmlQeS22ZVENQ1/kkdX0J8uVluT9tlQpNMVk1a2wxq86wGpU1jU8rCqa7aaWSHcq4smlKDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731988472; c=relaxed/simple;
	bh=8laj+BPdTTf3txORxn1fry12cwI6tN2PPQbogpMlrg8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s7LcG/TN0uB1PIz9+qy/6E0VA1660WEPO89ebsn54O02/ql89FPRDCooYeg/r1ZbCG6Sm/DKTAHURuWYEfTHJfMYkxfot0wH613SjAFjRV0m1X1LQRrzbIVxw1auUTXKb2tXJoyG7VMxil/cXFa+qPG7aCk+dDj2+YtLiLXmIh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jcs263AV; arc=fail smtp.client-ip=40.107.92.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jcs263AV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6D96tiTlq2y2Uar/GJgxtRpEEFde3CNTrjYTaKUSwbkTd+re0gvoETBpQhPtGMWmduun0iEaRsboH4Kp6Gt93GRvhc4itLklpm3OhfNG8FHcWOH2yTSmEiWjqY259SdsPj8hb2DZHcEHcTSkjcxdrYO0RkHkpuJaLHR/5Sm0PItpWGYZiiv6INuyVBjblkI5H37tG6Iyt+ZzWWh2wRLDj438Wal2jML2OQl2PGbnQUpRTM0ZKjwp2saLXnA26LOlKCFMQUYhNNe6ldqdpZXXUo6BS0Ns7yMcZbFEhkfDlMr1gcdWcLqKPlRSX3XSJP4M6Y3yxZL28qsy3Jhso9QKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMPkGDG+thD1A0QG/Kw6soQpX8PVGv8H8ouzs44EX5U=;
 b=UOi5NkMKb9UDmX5wykG1219Leu+ShiKHc36UmSckOjBcQXkrhmWtQdNE0V0cFZpo/JQHBERpnR+8aoVmhmmeUGt88f6lIzaqfFLOEMKOSU/RMkQEhSda6/XPCgwOqeltuySJomqJHuo7pVRYVS+c4xunPtQSgfWRh7Wnq+bhOZwzOE0tlTqrY3vT78GZvUIE0cZ7GJXcI0Qbo062q0YpG+KBFJAR2FKytsqTrendXtFd5xTRdU8ZtSe142avaM7WxjjKR/bQC2UipnGtJDqnuY8qvuOjuhu2+6C/iB2h7UA01fGfcsDZ+SiD5NEY8XGdqSs4T1UdZhgxCqyZsshS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMPkGDG+thD1A0QG/Kw6soQpX8PVGv8H8ouzs44EX5U=;
 b=jcs263AVXsackwPLl8+JOH91xQ04YlUzp0q98AY2JfPVZxYs1rzl5irMgFG6gWEmvgxOp0TcM8jT3yzqMXnQFL5+8jPkyEmwb3rGOy2MGwrtFoUHHOf9hjyup3GtQ+yZJ26CM1iELw1ZTaxMkYeEjYmXrJPN+U39BSucKgXV6XI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 03:54:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 03:54:27 +0000
Message-ID: <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
Date: Mon, 18 Nov 2024 21:54:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: alienware-wmi rework RFC
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8129c31d-4f01-42f5-2c67-08dd084ddd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjNVWFRCRUw2SStrTHJ2RTErTnJrSWtISld6eThxY0duWDhFSUYvcW5teGVa?=
 =?utf-8?B?Vmt3RStDWUIyR3Y2K0kzL1Q5SnJKajZ4UDFiQVNMRVhiU1EvTjBDYnJwM0Zq?=
 =?utf-8?B?eGtSVHU2cnVJTlRpb1M3YmxBbFR0NEtraWY1Z2JEUHVSZm4yVU9aVDFGMWhJ?=
 =?utf-8?B?UU8xRUo5bXJCMGNYZ2RJZXRUVUZiUUgrcDFCcWhzVlVINXh3WUQ5TFhaK25a?=
 =?utf-8?B?OS9UV0RMbEVGb2VJbzk5Q3pZRVdOejVrR1BKZ1hzMElmTUliVjNaZFo0b2x2?=
 =?utf-8?B?eW81SXNEZm1OU0EvUDN0cGtxaGRWWUNUSGZhY2FkNDBVaGZpcnVtdHlMdk9w?=
 =?utf-8?B?UlZOc01QeDZJT3M5N1U0VXZjV01rYit4NlFLOWpVTGMwMXkzbVhveEJQemN0?=
 =?utf-8?B?YU84QTJ2YTE1SUdIRHRBcUFPc1p0UE54OVQrK2lLcXN5RnVzMUdVbjVJRlFM?=
 =?utf-8?B?TGErQno2R0Z3ZWQraXl4WDdQd3lhNEtHUG9oL0pSajBmNktpc0dUNUVmL2Vh?=
 =?utf-8?B?RVI1QjZtRVRjUU5yQ3FBRjIyNFYwanA5S05CbllGRVc3NHBhSkw2UXpFRTBO?=
 =?utf-8?B?NmhrQ0F3b081N1QwdkorcmpwRkdLK0lPZ09oVFF1T3VVUkE1b2NOdzFVN09x?=
 =?utf-8?B?UEpDM3ZJRXBRaHBEZ2QzMW12WFEwc283WHBzcndhT1VDSEpPY2RKZ2Ryei9R?=
 =?utf-8?B?WGJtMExIZXFtOG5lMC84c1d3Qmp0K0VjcEttcytFVm9ETURNeTZ4QzcvY2xU?=
 =?utf-8?B?azBQNmxoLzh6eDhCb0EyYWF6WEFTTlpmMVVQTnBpNGJ2ODJyajYzSXRFdloy?=
 =?utf-8?B?SGFYdFVOYXZDK0dTVTE0QVBqaThNMDNJNUtqaVdaUE9QQW1zU1kwdHd2RGFX?=
 =?utf-8?B?YUt0cTd0NitmR1N1ZUlVZDF3ejFpRm1PdW91bDR1djlnc2tyNVpZMWxXNUNk?=
 =?utf-8?B?WTZ1cTA1aWVjbFFSYnNrVnpBQ1pidHZBeEhBcDRXVk5SRVNLRVhiUlV2eDBk?=
 =?utf-8?B?SDA0UklLbXJTNDZkVjJoN21xNTJKcWFReitXQ25TcEgyWldRYm1LR1dtOFQ3?=
 =?utf-8?B?REhxMEJmZkVoY2RnMzRzcmRaaG1KUXp1VzZEOWtpblF1allkeGRJbS9JY0Iv?=
 =?utf-8?B?UU9VdkZEZmc5WElscFR5VmdqNk9kL01YeGVyaU1FTWRWdStrRW9jUWN6Vjgz?=
 =?utf-8?B?S2lzblVOSHVQY3ZZZko0Q01SR1RuZ1N4Y1dxQmZEQmdoUzJuZmtoNE1ocEQ2?=
 =?utf-8?B?dS9MU2dMOEFRVVUvaXBMRE9nNDFnT3VicWwveXZrYUhkNDVuMnNqMWI0NVBp?=
 =?utf-8?B?ZmdiSGltYmY2V09DRU9vbGdCMXlRdUxPZUdsN285dFptUkNQUmNPY2tHeENT?=
 =?utf-8?B?NjFSM2tFN2M5R1BPS0dNdHYyWngwMmJVTjhnbVRmYWRoMDZGUW1lK2Nvc2p4?=
 =?utf-8?B?VmNILzZ6NFdkMmRUemU4T1lHTFp4dWJlMlA4QVI4dWQ2azIvMkh1YjhQTGNY?=
 =?utf-8?B?ZkUrVmk4ZDZROEtTdEtwa29oZmFwMVhyeFZpdkpFZG5neFFaVUxBbCtSa0kx?=
 =?utf-8?B?TnkvTHYva2pZdXBxdFBJYjhDTXRXbHh2cWdBOEV5NmY1OFJYUGZ4Y0puVkk1?=
 =?utf-8?B?SStHb3I2RWkvaXdkT1VKbEkyY3RzSlNWK0VIWWlqTlo0RUZqR2RjazZXUitC?=
 =?utf-8?B?RVFsRjFyWVlqRTEzdlM2dmx3NHFtd29oQ1NxOG5HdnFjMlNrQUJxYlJEblh1?=
 =?utf-8?Q?RaQ3SfaN8BYb86xD4PScDzEucMEX5dSrBrf2j/G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRZUCt4S005T1RxTTBGaG05NDBmaUtWTXNxSFFoLzRPZFQ3Y0lnZ3kxbWFE?=
 =?utf-8?B?YmtiUWJmaUpmeGVmYnhRVkw4NnZnVzBoN0d6eGdaUm9lUjkwMEZWQldURmNP?=
 =?utf-8?B?UXpqZUpUMjQzZ1pHVzFBTzRLL2VFMXZmWldLbGEvSWZlc2pKN2ZMMCt0Vy85?=
 =?utf-8?B?TlJTU2hzWUhyN1J6djloUXZ4QXoycDFYRUJCTEFyQytDTkhZeUxPTVlNdXdZ?=
 =?utf-8?B?TVRQK0ROZDhqWGthOG5FU0lET1hkMS85dlhUQVF3YXFhNjBhQ2RFREtnK0Vt?=
 =?utf-8?B?b3lZMXp4U3VvR0N1L2RMMktacnpBYTBmWDV1YzViKzB4S3BURXlrSmI5aXlp?=
 =?utf-8?B?QmhuSHE2eVZlYjRNRnU3cVZKNkpXaHk2QjBKWURIQ2VnM2tNTUlhYklhcHNq?=
 =?utf-8?B?dFBDWjdCcFpKaXNoYlpRRVdsdEY2T0F6WjVGL2JFSUVpOENnMU5ITWpLaXZn?=
 =?utf-8?B?eUlXdG54WVlUUk5DVlEzSnRnaGVvbW1vSitrYU0vK1VNYktkZTVDS3BzdDNv?=
 =?utf-8?B?QTA0T2VJck8wREVPeFcvdnRlYjZEdmlRci9tL0w3NzJvUmRNZ3hCVUFBSStx?=
 =?utf-8?B?djJMRStTcGRFOGpqYzh4R1Y4bmFjaGpqZDZkaW5PTnNjbzV2T2YrNThGU0hK?=
 =?utf-8?B?MXRHbnJSaVZzT3kyMlJqMnBldlN5NFBpNVhRQmZPSk5MdVFMUEF2cnQ5Rng5?=
 =?utf-8?B?amhjZ0xBdFZCN0dJSTYzMlJSQWpMOWxZOG9yTkNzUnFKUUJ4QVZyUFBqRmRF?=
 =?utf-8?B?bFAwR0xjY2dWS2kxUHhvSG9uaWZhY1pzYnk4MEhLcTZrMVhPVGNEdVlEYTda?=
 =?utf-8?B?S1hZM2xqekM1N3RMWnVVNGoyc0dES3VEUlFGRit0a09TYVZLK29RbTN1VzUy?=
 =?utf-8?B?azdNdlhXSG1Wb3V6ckc2YkovaUFkTWlweVhvbkJiNUdoNzlGTVdmUVVJTFpK?=
 =?utf-8?B?bVRnT2tsdldiTTVBZGtqNDdYTnBjV0p6b2J4ZlYzTGhNdnBFMTkrUldZaC9w?=
 =?utf-8?B?LzdhOVQ1clUxSkZQL1JvTVFkQkRCQTJDanV5b1pocEFGZVJkOTNyUUlubC9l?=
 =?utf-8?B?OGdpU2dWQmk0Yk9MZE51SW0yRm1LSi9VSFZQVDJKUkZqNi9IRFBBK2NjMXlB?=
 =?utf-8?B?Qkd6aHhFdzVlaWN2VjdFZG92Q0RJYi9hVk1IZWtnMVNGcktYU2ZoakZsSzBR?=
 =?utf-8?B?WncrN2ZXaTd0bzRBekY1QnMraG91MnMxRUppd3BuSGVtbURjeHZkckpWUGs3?=
 =?utf-8?B?aDg3VmtKTk8wYjNvalRJZVI5UWk1QmRhaVhOVU14OVdRSDM2akh2ZEZrMHZI?=
 =?utf-8?B?clQzRmlCTlAwRERxUlhzbXVFK284c1NtdU9VVE1LUWpNbVhwK0U3d2FPQU5q?=
 =?utf-8?B?ci9zMkRMbTVSYWZWVzAyamZ0OURTM0FzNjMrdnBEeXhYY3NQTFpmZktyTDV2?=
 =?utf-8?B?eDJOWjdoRTZCcGxyMWMrVWVsV0RSZVVxcUdEMk1YRHBVeGhaL0RTN3RTb3Za?=
 =?utf-8?B?VDB0Qlk4RVdvZEpIQVRRTUh2VFcva0pLUkYwSWZ4NE5Qdk5pdGphWVo2ZlVG?=
 =?utf-8?B?aE5KYkpUeUtXQkFpWTRjaWRMZDFIcFA0d1lrWUlySHllT0NydWFYVHVJQng0?=
 =?utf-8?B?Ny8wN0RSQlh2NVJCUENuNnprN093ZGFBZ3A5T0tJLy9OTTlUdWEzNmNqVm80?=
 =?utf-8?B?L1ZkNXhuTkRFNFVyZWdURTlTM00vRVVYUVhZcUhPaVZVTnBnLytiVjlPbVN4?=
 =?utf-8?B?TkpmSVNORnpxK3JsWjRqaERQUWFyNm5XYi8rSzJNTEpVdm1FdG53OFpVcGxx?=
 =?utf-8?B?K0VReTM0amplQ3U3WWRHOWE4dnpCb2xocmxTYUN4RVBTaXo5emx2MnNJdlo2?=
 =?utf-8?B?YUpWc2NReXMrN0R4aC82TVRXRTdoQXVacllIOVk0bk15aTZkNGQrdmhDci9U?=
 =?utf-8?B?Rkx5V1E1cGxPb0xFMlVLRTBvelFKNzlvd2p0TlZwZmxUMDRqVHRyMU9qU2dC?=
 =?utf-8?B?TWNBanMwL21ZT0V4VEVlY0pzVDQ4bXQ5RTJBSWRLM2V6TGtlclNoNGd3OC8v?=
 =?utf-8?B?RmY3VWpscGhWb1k4N25NVXhITmFtVU9PSzh4cnJrcWQyeGd1YXFaNk9ydEdY?=
 =?utf-8?Q?z+2kKwmDF+cJoCz+opOSqwZHr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8129c31d-4f01-42f5-2c67-08dd084ddd51
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 03:54:27.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgSclXAtPatD5JK0MasurxfUNWwJLwnp8WIgqEeEsiSr0vgk9HRNGXTthlHgGumvUjfl2Mfwxi4ZX7LGwqRuug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299

Loop Dell Client Kernel M/B for any comments.

On 11/18/2024 21:47, Kurt Borja wrote:
> Hi!
> 
> I'm planning on migrating the alienware-wmi driver to the new WMI
> interface, as it's currently using the deprecated one. 

🎉

> My plan is to:
> 
> rename alienware-wmi.c -> alienware-wmi-base.c
> create alienware-wmi.h
> create alienware-wmi-legacy
> create alienware-wmi-wmax
> 
> The last two files would not be independent modules, just includes for
> the base module. The base module would be in charge of initializing the
> platform driver plus the correct wmi_driver backend, but the wmi probes
> would register the platform device. This would be very similar to what
> other dell drivers already do. Aditionally I want to migrate everything
> to the state container design pattern.
> 
> I would do this in such a way that the legacy and new code would be
> completely independent of each other (i.e. different state containters,
> dmi checks, etc).

As the original author of this driver when I was at Dell I'll add some 
comments.

The 'legacy' code was very narrowly focused for supporting a handful of 
hardware specifically for lighting control.  One was the original 
Alienware steam machine, and then a few generations of the X51.

I don't know how much of the driver continues to work on hardware since 
then.  Maybe Dell guys I added to CC can comment on how much of this has
stuck around over the years and keeps working.

> 
> Pros:
>   - Modern interfaces and design patterns
>   - This is compatible with Mario's upcoming platform profile changes as
>     the WMAX device would hold a reference to the platform device
>   - Would not break compatibility as legacy code is independent
>   - Easier to understand and develop in the future
> 
> Cons:
>   - Initialy alienware-wmi-base.c would be almost completely legacy code,
>     as new features don't require a platform device (yet), so
>     alienware-wmi-base would basically just register the wmax wmi driver
>     on newer machines
>   - With this design users would not be able to completely exclude legacy
>     code with CONFIG parameters

I wonder if you're better off just having the legacy driver as it's own 
kernel object?  If it only supports a handful of systems, most people 
won't need it compiled.

> 
> After this I want to add HWMON and sparse keymap capabilities to the
> wmax interface.

🎉

> 
> I'm sure there are things I'm not seeing so feedback is greatly
> appreciated!
> 
> Regards,
> Kurt

