Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EA19EED2
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729604771; cv=fail; b=RmtFr/1OMdNkjQCs/0eRTJtjwy8K0vmhFgx4hG3vKEVGg/tVQ3Me8vWu4oMonRF9s8PLVPvjC8Wk+4yIjlH1CkEYZmQQnMikwbrb1ObqMQWb0RQvLmM2aniAOvPNkxM6SvhBDXeCW3P9eHNcCN+8SqBqyZCshkVKCFDRRFZIMzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729604771; c=relaxed/simple;
	bh=Pjup/gsqwlHkBiZcH8H1D/qdJ52vjlJkfoZFpGO8j6c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f6e43rfKKmqNbBj5I/vNvy9f0IpbpxlYC9D1n8Th77MOZu3nEVbrP6cLpD/jZc5XbS8LbpGcNnHrE6aHiZPvB/9SB/LdIsmQieF7Egneq/mXncpvraeDj5REIQ59vTQSfHmaxW47RR1ZwOXczvJuImrBjA6/umMsZXBQaeAp/RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UyCIdUeq; arc=fail smtp.client-ip=40.107.237.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UyCIdUeq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MypHKgjVOULsFk3vgnov7qYVaHAZmb9ebX+tUu1KKtDHqOZWBSlj90RvPFMqUjsHBq055TUrYsmW65EsfwWy8TxG+eJjRczHwtZ0NzN5SQ+IJcCs2+sVjIN7+mvIFmiesSxMbXMxHcDUfPI4bP9FzqnYq9Mb0aVwnnx9Ox55b3nGJqZrGpRH9jpt9jhIsNxeZbHeBjAWx+Mk1aqluJSfk06kRARC+coHCtQoore4RYBPEbbyW3ay1VF9Hp1JqZuDFDBRZnPp6DsOMe+xz6UScg2VmMl6XbxPhufbrlvfyhC2LIaApeV1T6eMSnj4YXIZ4RQRy/jiSfACAYrVombtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNHn1+gdZet6VzARKkA1n4yVZ8X2y1/ym3Z5d+qvOF4=;
 b=g7SKMX6Rrnk79eTCLVPk3MYS4M0IofksTWtaSBBF7OC71oStrE+QuXcx4gK8aqlWcSshDu4BY8KGO5aPs65KRBNER9gcSI1LWzIP2Xu+no6ItQ8kJUiP1sx//yqi1lem8QxtdYzfZd9NsUgGLvMUdOJR/rF0jCG2Wwm2nN/kq+0Kl0NQyGoE6QuSZSHE2RnYBCBNgJSk4HVBEEPz7mTzZBufua4Xi6a97lFyiV9NH7KgEr5Mxw+BKQjidgxHTtA3aKbBHb8tJtVRlaV01L13KRP7CJBn0imQ7CzWv4JlFXnKOKdgckbb5o/VxDi0wVZRPa45jSXLgofYvcySFnH9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNHn1+gdZet6VzARKkA1n4yVZ8X2y1/ym3Z5d+qvOF4=;
 b=UyCIdUeqEFqdpmt0SBMfr+X7fn3hr2mVUzqWZeQqINUK9U9sfod/HeNRgrYH7CKM7GunqhlP0lwgyesdJb0pyyET1hirP1n4chIixvvd147JV42ixqe7WJjwXV+RwBSo3x0VAY/iwuHhMA1BnFMckzR8Rx+GqYdwQ3fJmMDY4Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 13:46:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 13:46:06 +0000
Message-ID: <630596ce-d298-4513-8fea-9b2dca5782e2@amd.com>
Date: Tue, 22 Oct 2024 08:46:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Basavaraj Natikar <bnatikar@amd.com>, Armin Wolf <W_Armin@gmx.de>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 perry.yuan@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
 <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
 <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
 <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
 <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 132de887-a54b-47a2-e82b-08dcf29fe073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djl3anNjUHYrUDlwcXlPOWUxb2RUQmFReWZVME9iVWVFK0Q1M3g2Q05tYWlJ?=
 =?utf-8?B?NlloL1ZoeVhJdnNjK0VPN0lyREZaOTUzYlNiY2d0S2hxN3ppWms4dkJ2M1NB?=
 =?utf-8?B?WmNLRnNDTHVvNGt6c1pTUTBCSjNoTEkwTVF2VHQ2d3A5emNwcG5acm1HU2ZP?=
 =?utf-8?B?ZTNrSElHdVFQWHNqaUx2amt0S1F1bEoxYUh1TGpuUkVtclJiSXRmcGhnU2M2?=
 =?utf-8?B?Tmo3elM0WW15VHR3andveHBQck9qOHpNM3Exc291WkNzV1dPZG9hbFhya1Br?=
 =?utf-8?B?QURkVGZqQzdpclJkQ3NhL2s0MnRBbUx0UzZsc1BFbjRjcTdhK04zZWpmbnZj?=
 =?utf-8?B?RXluWXZ3R3RPSUwwNkVqR1FrSFEzNEtId0VBK3JUOVQxYWhlSlFIZGMrazd0?=
 =?utf-8?B?V3NLODI5V0dmbzVFZUpKTFhISy91dUNHVnp6M2IrZkp3dzY3VExwNUJ6MFRi?=
 =?utf-8?B?L0VRWnhGN2RQSVJ4ZXFLd0xvbVM0dVkyRUs4MEoyZ3VMZTBwamVGU2ZFVFFX?=
 =?utf-8?B?NlFia0FjUitldmFxc3NTN0tPdGxtVGVjQ2dyY3pTL2hXZHF0akRHeGdST3R5?=
 =?utf-8?B?QW5VK0RVUGdVUHZiTUlVaDJuamUva0JuRVYvYmZCRU1SSWhuYmFneWR5cGhi?=
 =?utf-8?B?TStQWWlXU2ppL1drYjVUWFlrVGpzcTFzam00d0lucDV1M1ozQWNZWVJjZ2c3?=
 =?utf-8?B?bW5aUE5sYXpLVzJ4TTdSTkdieFJDa0RmeHpKVlZ2Wko3bE1ZdEt4YUt0bkh2?=
 =?utf-8?B?S2poZVZqak9SQVloK3RCbXRtVXVPRVNpaFAveHZCR0RIUGZNdjNnbWxIbUto?=
 =?utf-8?B?NDVGL1ZTd1dGeG9EZVlGMG5PKzdJWG9QejFxbXMvT0tNVi8wVk1UeEhLajRh?=
 =?utf-8?B?MVh2OVZVR1dlTzhpSG92elNuZThPOU1ScTNyczJ2RTFFWkNPZUM0QlM1YjA1?=
 =?utf-8?B?andJTmMwZzkycjQvRUNqM2V6UnE2SkhOUWtYdUROSHhicUZyT2Q3RkFDbDBZ?=
 =?utf-8?B?N1AySWt2S0FMNUdCSUtwT29nMjYyYnM5YmZTdVJOcDM3cVZaN2xTYkxUeXhH?=
 =?utf-8?B?S1FpV2ZkaTdPaThkYWpUejhHRVBQRCtWNHhpQXl1Z1NIRjBSOXZBOU9YelN0?=
 =?utf-8?B?aEJ6Y01LaXRHTHJGVGtaa1BrNllKejVSaHJNVlMxRUk2Wis2aDVSL3dmWk96?=
 =?utf-8?B?VTNFVjhmVE9EanFSWUZ2QjF5ZWR3NDdoa01CMDdtOE1DMURCc1AxWHpRTGd2?=
 =?utf-8?B?ZXc5Ykw5SFpxWUF1aHJtcTFlbk44bE1DbUUzSG9aNU13ZllwMDA4VXE0bFp0?=
 =?utf-8?B?dEVSalpGcEtYYk1xUGNLWFdqN3BpTUVhMG5RMVRmWDArbHRubWVHRnB4WkhO?=
 =?utf-8?B?dmN5RFl6WHVWTFl0U2wxSVZVRXg4MWxRQS9DYWxaRW1KODFYVHdldDFJWFBY?=
 =?utf-8?B?WWdBOTl4QXZPUm9pVWpCbkZaclJqcWV0Kzg4amlubU5JSlpNQktQTXRLWWJO?=
 =?utf-8?B?T1E0dGFVdFZyZVpBVVpFUE9jSjAyaklFRWd1MnhaWDNTOUxreTk5QUw1c3Nj?=
 =?utf-8?B?T0xlakY3MVdPbndYNDhBaWJwbU9xVGtVTjVsYzIrQ3NMaWhKQTJORjNuOU8z?=
 =?utf-8?B?blZwZE1RazlqaEw4aHV4a0R5VUNFSk9WU05tR2xpYmV6ZjZ6VEFtaGQyRDFP?=
 =?utf-8?B?YWd2YjZpMzVVMWhQS0VtdnNQRHh1Zm45N25nUUxydmU3Rys4OVlJN2E1MTRB?=
 =?utf-8?Q?3QBN7Hjpxo0IBg0W2Nbf9WfGx2Z9tjdJ+FcxagK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUIyUGpST2NIZVFqZGc3SzY2RjVnN21OWHgzUXlZZEw2cUZhZWNrcmtZemFv?=
 =?utf-8?B?S0J0SExhZERHZFUveXFGUlprS2luREVFN29UL25aZVptQXg5UkI4U0VkdXBW?=
 =?utf-8?B?ZWt2dkxCS29TVjJKZlo2MGY0Z0pyM3JWRkhJeDRaQ1p6Yk5kUE53a1hkZ0dy?=
 =?utf-8?B?SFBXbkE1V0RNUTlMWHBnL25aM0xTYnlOOGJiL3dlTFNoR2dnWXhYUXg1ekgx?=
 =?utf-8?B?M2NuTmFodGdBNkdVY2l2UFc5Y2E2RkZTYlkxUFlwNEpkNXpHOWFVemJHekM2?=
 =?utf-8?B?eWhiVVlSTEpXcWY0d0JlS3E4U0pxSHJzd005eEsvcTFnVUJWTnpseXUxR3ky?=
 =?utf-8?B?OVROVmR2WUhsQmlpQWNEQUp6REtvZXpzUi9MSzhOL2dzQ1RnUlVTUnNlaGtj?=
 =?utf-8?B?c1Vaa3J2eXlBTzI1YUFyeC9lT1A2cVpVZHlOcEZKcVgrT0FEUzMrUDJua0Zx?=
 =?utf-8?B?NEZ5aFF0SWxjQmwyZVk1MXBQUVYxbTdZd3VKOURaa1AvNllsV1ZJRTRackR6?=
 =?utf-8?B?OStHZ2pEVnovZjZ4U1oya0NTZnkvNWgwYzRFMjcxa3B1RmVzUzFNVVU4UGJL?=
 =?utf-8?B?aDg1ZXdLckl5azg2Z0Nnekg0VlQvUDhxNzlDOHJCSXJZdFdRUzI5SGFnem5S?=
 =?utf-8?B?cTc1ZWRyWDhRRDVuTUZ1dTN1b2czRW5zMXZyY3BnQUdvUExKRXdjSVBtUWYx?=
 =?utf-8?B?em5YeGxicUllZGIxTnNRSmRzUFpXckxkV2JFRE0rRmszengyYVl0SmlydmNQ?=
 =?utf-8?B?NXFiZ3A5dXVnVnF0YVRDN2RVWDJzNDZsa2p3M2NIQllPMnpTZEFhcE1tRFJF?=
 =?utf-8?B?UGgyOE5EVWZTSWxGNzdpUS9IS0tUSUJEZVJlSXNrY2x5bmp4eVVMS05xWXM5?=
 =?utf-8?B?cUw5N2pWOUlQRktoTTBFbG9zcUtrTklFbWdGMkljYklFdG9GM3BZcUcxckI2?=
 =?utf-8?B?Tk1sclkzNzdWU0dWb1VyYi9BQWlOVXRiUHF2d1M2Z3lQei9jMUJoN3htMThi?=
 =?utf-8?B?cnBMSkozK2tpNk1ITlBjNDVBbmE3USs2SjFwK1pyaW9na3J5Qnp0b0xiRXB1?=
 =?utf-8?B?OUhEajdJREpvN1h5ZU1iMFd4cnNKaTZsVDhhWUM5QkQ1QkltZHBzd201aGI1?=
 =?utf-8?B?KzVhVlZCWENUVlBNb0VYMUhFRDZYZ1NQQys2YmhCNCs1UVhMaHMrSXNyTHNx?=
 =?utf-8?B?MW1IR2FPY0EycWJJTHd0bEl5MUF3RSswS0dWZjZwY2JiV0kvMzMvTGpDMmpH?=
 =?utf-8?B?all6NHlicWdYYWFPTVBQd3pRanpIczBBSTd6UFdXL01PQU9LckN4OUNkUVU0?=
 =?utf-8?B?VDlMeDJ1a20wejdsckhHdmdPUEh2S25MUWMyWXlkbE9nbSs3d1AwRytjeTJi?=
 =?utf-8?B?KysvNTh0UXZtY0hQRERjSmtDS3J2M1ExNi9tUkJiOXVJSHg3TUt2NVVXbnQ1?=
 =?utf-8?B?Z2l6UndjMGRQMGhHQ05melFLMkcwQ3VuUVBEQ290NU1PVGFldjVNV1pncjdX?=
 =?utf-8?B?cWxRaEVNc25YQktiRjNTSzhCdmRFdC80MDJyOTFOejFXdUkyK3ZaOThMU2xj?=
 =?utf-8?B?SHpxQ2d1UndEY2M2RGFXb2w4TjZZYzMwSzNiRFJVODQ0V2Q4Q0hML0pwamFI?=
 =?utf-8?B?OWJJWnhnTTZKTHFkbldWbGdpR1FmdkZNVmRoTFdYYUJNbi9BRjZuZ2UwTnha?=
 =?utf-8?B?VDlYNlRNenJad0VUNDBwalJ2OFV6VnBMSGRYTHZSR0JnV2lBNDl1QTRWSE81?=
 =?utf-8?B?V2J2L2hOM05JQ1ZLdnoyMmJuMXZyM3VhNFREZVhhNXpEWWVKYW9oWEFKcmNO?=
 =?utf-8?B?c1VEU3BtV08xeTRmK3hqcjJVMVZwVEZWbU15YzRyOUZBTEU3bkRFUXhzdzNY?=
 =?utf-8?B?dVQ0UExDUThUVlZtd3AwRWtQSEtta2h6eWhXUmRmbVlra1QvWVF5S1d4NVlW?=
 =?utf-8?B?dTA5ZVc3cThJa3RyN0g0bnRKL0FXL2JDV1FGbE1mZFgwL1p0b0d2SHpOWFN2?=
 =?utf-8?B?NXNtSDdnRURTR0VFZW5qc3hvd1ZkMzRNSWl4VGgxZUVVQ1dDUTgwdktoT2FW?=
 =?utf-8?B?THNpN0ZWbnppekNFcFZUcmJqcXZkUCtIUGd4YUQvSDJGT1B5Rm5lemZiaDlk?=
 =?utf-8?Q?pLbqbJEDttX+xxcd4l0o4TmyP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132de887-a54b-47a2-e82b-08dcf29fe073
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:46:06.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpXPCQB4nUrAznsy8jkKbidJQueYr1ZGzeDK+7QR8sTDhDfDIuoQtrHu48oX2XZYINXXXTXew36Fz9xUfmrT1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849

On 10/22/2024 08:22, Ilpo Järvinen wrote:
> On Tue, 22 Oct 2024, Mario Limonciello wrote:
> 
>> On 10/22/2024 00:54, Basavaraj Natikar wrote:
>>>
>>> On 10/22/2024 2:05 AM, Armin Wolf wrote:
>>>> Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
>>>>
>>>>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>>>>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>>>>> switching between Frequency and Cache modes. To optimize performance,
>>>>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>>>>
>>>>> Frequency mode: cores within the faster CCD are prioritized before
>>>>> those in the slower CCD.
>>>>>
>>>>> Cache mode: cores within the larger L3 CCD are prioritized before
>>>>> those in the smaller L3 CCD.
>>>>>
>>>>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>>>>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
>>>>> +static int amd_x3d_resume_handler(struct device *dev)
>>>>> +{
>>>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>>>> +    int ret = amd_x3d_get_mode(data);
>>>>> +
>>>>> +    ret = amd_x3d_mode_switch(data, ret);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    return 0;
>>>>
>>>> Please directly return the result of amd_x3d_mode_switch() here.
>>>>
>>>> Also i think that maybe there exists a way to avoid locking data->lock
>>>> twice
>>>> during resume, but i will leave that to you.
>>>
>>> I will leave as it is.
>>>
>>>> Other than that:
>>>>
>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>
>>> Thanks for the feedback. I will re-spin a new version after looking for more
>>> feedback from others. Thanks, -- Basavaraj
>>>
>>
>> FYI - if no other feedback comes in there is no need to re-spin just to add
>> R-b tags.  Maintainers will automatically pick them up when they use 'b4
>> $LORE_URL'.
> 
> ?? There's the return change requested above.
> 

Basavaraj said he will leave it as is in response to Armin's comment.
