Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC53EDAA6
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874682; cv=fail; b=QcefiTy2mqawObOovN/PmetyixOH+3PKtw1aAhnizIB7x3WqLSzWhaNgloY7DswG68uLu3XERgvH4n5KeCp77hwnkHB4+Son/88y7dqjqkkdkewsE6h4+A4VE207jiOtFtdAc3vGIjhN5buhviWUgKB5UWdefUTEBGaSkSN6WIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874682; c=relaxed/simple;
	bh=twvXyXpwQslj/C/XB11UG0nD/IsoQcgvay4EmyYWaHM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oifzp2qmPd+P86z9w15zSlHXMbQKyGk8yjuctJV19y7EITqkTVnX+sHSncJ+zLwUuo9WU7rzXnzfNPKx/uCl0TPkqZ2LvpN7lacUZZNZ0XELLOXxI7OKk4tbqOQc4yLX4hL0nbgDwbD8NDA/whcmv3Dn7nBVuKdHFJsWVTSxMSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d+x7+Tae; arc=fail smtp.client-ip=40.107.208.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d+x7+Tae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rzv1S6feaB4Szl/sw6ZaSDDUeKk0YNtcusXqR7/jbC3UnGpKgxYAbeh1G7lwzPfvXSvlJiZikkyJqSPcsGYUPA1c4di1bOFhbpwqo9nAJ8T3iYVHVBqlAyg8ltk7H1DAUL1QCMQ1zZk5gLJAhaJrCv10H5Q/dh6/P2u+NMf0xR/yS+mzE1ZW5auoO8o+uo1Ie9usQ+4kdaCxYVg3Q0E6he7f5CioMMih3coLeYKKi3Q4mtgFIwHfb/X7dWFnnz5Ub1VU9ENGbsdrjaRj93J1eZ8kfKNStsn+cDLxFzx5j8nzsXDmrqUDea8aNk2HYGq2qfMrzTICMGJkvoR+9eilzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXE0NQkBhCdvDTiOzHEgex7se4XPMqQekz2uc0AZpzQ=;
 b=r9HNUX3jty4oZSV30H/e/ztHfae5PkzFoy/I/ji92PetChKEPN72nej3D/GXI3VhCRQyjsggp45akdgf+3fSzwQ+6lajrzVEt18928eBWJ5fzd9eMh3PjBlvWJQ/1dfLAeT8o+Is5gREIdskuSTwcRiF/g/TbFa3BHRh2Lz1OOOl5g25XtKMQnvJWrUiJx044SoenQRr0tXWvvTXP6zRJ1S6fwGhCDKQKs86oeH1D2PYFqomZuvZHr0TFuWdkXMWQ9tlPEvreBY2aORPegsko8FQnhYfF/aWTLDA1p5WTh7eaf12Lg0nkureBVJwrD3e3HQKAwqOv16/kJF0XzLw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXE0NQkBhCdvDTiOzHEgex7se4XPMqQekz2uc0AZpzQ=;
 b=d+x7+TaecFbtUvIVOCiDEeJ+9Ji9FjWxwSFcZHgjgUZ8yL6pvxmoFl3OS1kdjT13uRAA7WsVFKiZSLJGm7D1l9LVuwFqBV4+VYHLeCr9s4MZ1iL4Zh93rwY6PfYi2LBcjMHGNbKHfhtpI23jp11BpGxta6fIbcohnNVbk91KZnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 09:37:54 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 09:37:54 +0000
Message-ID: <fc9458c0-b6d3-4f2c-bb57-7b33e578e3e3@amd.com>
Date: Wed, 27 May 2026 15:07:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] platform/x86/amd/pmf: Move debug helper functions
 to UAPI header
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
 <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
 <393119ac-3a30-9baa-da10-a123969b4c96@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <393119ac-3a30-9baa-da10-a123969b4c96@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c55b21f-4b20-4d6d-36ac-08debbd3a08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|6133799003|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bIRwylDUOAj+joF+QZbOFOHG5YjNrFF23T0LKdBje61nqbMZSbnSo17vMCO5XcWFslIkYEN/6i2C5ituo4Zvtr1PWllvsW7Mt7shGA3kAnfPkM3payNXOoRjj4Z7x4WHBv7P675Dci2xAioBiftW14jQphJVdtbZFqGjSFx1hf9v+HxDbOTKXBH0A5USc3aAZBQAInFE4dwmj7ikfzE+fJUvgM5SI5nTcjwTmXQ0gVkZA/6fhJwFoX8d7FwXdYL3s4gy5jy7kpmlFfgpQ367lbMp/+MXBIePhbt6sc7Fd/n7Epb5wa7pkkx+gMgurVOZrl/mwTVE2vw/R1v2WLL62Y+xjfbJjMUyWCWn3dnIGuV5ultCLrY3x5eS1+gmcfk2+Dfv7rafBpyZ2WWvgIvdXT7t63zfyloTq95CjCDYd1W8T5JRmH9xI+CqQGSjgJMJQyMEaBt41JwyKL0S7NJT4X/bU9x1BSASHznaA+w0Ybt/HHUVnFnYQHxqCfQ+hkOqw5gBvWHoM3UFtNg7F+yxY9D9n24emaaTf111ky55g/rQIoOVWxOvOXgM6ov2jspwB2qvNRw2YDoTVDx+R6iJkPJ+B4dBDXxk4v0x06stdTXyT7I5pKokf3182+NzcYaCn7+/DecqtVoIkkrYe47d54j7FvtDU1J5KPDo+ZH4Ddz9mfIoQZScKTLiTy1ksCCZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(3023799007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZ1bnNnWUJQZVVXa2Erckd0bzBubUFIN0pBbXpGL2d0ZHZjTnpvZ1JkcHRY?=
 =?utf-8?B?N0dYMkQ3YzZ2NVdWL05sTURNdDJDanNDWGZ0Mk5TQnZuN21DUloxU2pCVExi?=
 =?utf-8?B?SVczMTU4VTRLa2s3Nk9vVHhIOG9TcU9qWHRXWEYxcEdMTHNDeGFKT3BvWEho?=
 =?utf-8?B?UWlzV3lBYU1KaXFESGFPYzA5NEdLbjR3S2UrYWpUdXdKN1lBLzhGeDVRTWpR?=
 =?utf-8?B?djl1SlZNRldXc0xWcldOaEttMVpKWUkwb0srVkkvM0wvT0g0MnNNcXMvdkhB?=
 =?utf-8?B?M2duOUF4N21oV3orYlkwdXpjWk9KWEgvMldtaXVtcFFyQ2szWWRHd2pOOS96?=
 =?utf-8?B?b1U5NW1zYTNzSWQ0d1pFbElCY1ZkYzlMcDI5R0V6WXBaR2pXYzdFa05kS3lL?=
 =?utf-8?B?L01LTUk1MVZoajRQNDVTUGQ5RUQ1ejEyWlVvVFQ0ZENNbVBjc1FXUEJ6OFNQ?=
 =?utf-8?B?a0lodldxd2tlbGxDNHVhdFYzZmltSXBHMFRKSUNvSjJSa1Fka1hYaDg5ZGJE?=
 =?utf-8?B?SnFvOEJXV1daR2JEVGVBQmZKVFpxb2dvOXlqMTc2emdoRHpxcC9mT29WM2Fz?=
 =?utf-8?B?WVEzcXFERi9yS1J6Q2dsN3JpZnUxNmg3UmkzTlFwY2ZUVHI5NnMwT0lPSWZk?=
 =?utf-8?B?VHlHcnlvbkFvd2Uza09lcm5laU43SlFwVEpEWUcvaEY1a1hVOHpWZkxobFYv?=
 =?utf-8?B?aU5qVEI5aHBMWEY4aVBCV1BYdFVhSzhYMmZBdFZUeEpsVVladUp6ZFhJaGdM?=
 =?utf-8?B?emNaaUpLSkxPN1oydTRINEVqSDhUVFUveVhIQmZZQWQwbExlY3RkUWxUMVVD?=
 =?utf-8?B?bDYzcll3bzlPNnBqaXJKblVpRjZwOVBYRE84TmtXekR1WWF1SDJ1MTY5b2FS?=
 =?utf-8?B?QXlyMU5HVjk1aUlZeE9IekpmNm9kUlJKdjRBSU54SzhFTlVpRDNMV1JwUXhZ?=
 =?utf-8?B?Ky9HYVhERXlqMVBMaW5ZQVlWZDdtWDRWMUxXVGNPckt5bVF4Q1ZkR0pRSDVG?=
 =?utf-8?B?TEJlY2dHaVhDNjZ5eC8rWVdMZ0lYeEluSi9yc2taMUhFeUxKcFN1QURZdXdp?=
 =?utf-8?B?SnN6WmpIMVhjcCtCaXJ0UjUva1dBd1ZNUjZVUjBlRDZsUWRrMGU2Qm02bkxD?=
 =?utf-8?B?dmNoN2lJN0N4ckYwT2M5ejhpcUhhSksxa1dqclFjOXl1cGNrNFA2MzQxTkRa?=
 =?utf-8?B?UXJZQ1JNQ29GbGhUUDhBVzd0WlFZWXFjQjRoaS9PTEQ5bStRTTJPTDIrMWR1?=
 =?utf-8?B?Nk5ndmdBR0Y1Y1RQK3ovR21BMTVQNmdpY04wUlJreVI4TkJmbDZwVFFBYWVE?=
 =?utf-8?B?ZGxhendJWllwVHR1R0t3UW1zbm9mYXlqeGVLemZpQVFjenEySG10Qm9jRVJS?=
 =?utf-8?B?T25NaDdTZXZrRmlSV3BZUkQvUUJEb0FZN2VFcStRMy9LKzNYMXVlNVk5cS9p?=
 =?utf-8?B?aDBHYzBoVDlZVTNJZXM0M09aUmZXdTNRcTFBazFONzgreFBFVThJS1I3ZXBZ?=
 =?utf-8?B?eVNZNTYxbW56djFoRnBzeWNHR2xNbnFwbWRZWE5OdGlkR0FLc3VPa2tFT2E5?=
 =?utf-8?B?bzUxMHM4OXpWNFZlS0FnQVUzN0x5c1k5dE9FTGs5N2lPVmppVEFBQ3ZoM1RL?=
 =?utf-8?B?MVZJVUo3QXpSOW0yenY1OWFUdi9oSUZVWlJNRUU4N1l6SVV2LzljcmJrdVBI?=
 =?utf-8?B?WjlSdmptbENHQW9QWmRoYkJsdVpYK2E5cGpkUFk4ckc2ZEJzWTJCR2hhUkxs?=
 =?utf-8?B?SDdlejRTY1NqT1Y2Z0xzdzhoZlBqR1gxMEwxT0txdUVmc0RxOVhkNVFVdHBX?=
 =?utf-8?B?R21FRENGMlJ5WmVhZ05YNEdNR1FNRHpmdTR4RXgzT3JFYy9oWHZOOW0waHM2?=
 =?utf-8?B?ZjhTUk45KzRnNXBhbnZPY3l2RVBXdEl4Qll5elVSSTRpT3JTS2RVejdHM1pj?=
 =?utf-8?B?bFFrWlRJVVNocnl0YkdiK093SlVwSmVBRUJ5ZzhYWjNkaGFsenZSSlFOVEgz?=
 =?utf-8?B?bUY1UWIwUWRXVWRaV25FeXJTZjV5SlNJbnBYbDIxMTZIV20vbng4NGF0R2o4?=
 =?utf-8?B?bkkxVXJQNlIxZFh3WWMrZWErSHZISVJ3eGFHV1p0T2lhdlN3N3N5bkJUTnRS?=
 =?utf-8?B?R2dJQ1JvaEdjMlh2ZEhKdVc5WnJBRmVKZ3Zad09tZE51MjlEQkNUaVZ0Zkk4?=
 =?utf-8?B?RTBBNVBSODVLL3luMkNINlhYcVlibk5LbmVDNFpzUXMydkZhOTN0U3FIaHgy?=
 =?utf-8?B?MUR3dUw1dENoQkFYek5qMDJrMnQ0TWRXYkFvb3g4U2t6T0VIQVI3MnFEdFJG?=
 =?utf-8?B?Mmo5QVN5Z2t0Q0F6SUp0YjV1WXFLcEFyTzh3cjIzRU9GN0VWSWFtdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c55b21f-4b20-4d6d-36ac-08debbd3a08e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 09:37:54.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oeJdr7+INS+IlCeq29ImsXmshBxecuwr4TSjtg9tMmGizABU3nPE94TRSSGYBSe5kAA+zG/uSUPskcHoosqJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962



On 5/21/2026 16:32, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, Shyam Sundar S K wrote:
> 
>> These debug helper functions convert enumerated values to appropriate
>> message and can be useful for userspace tools and other kernel components
>> that need to interpret AMD PMF state values.
>>
>> By making them inline functions in the UAPI header, they become available
>> to both kernel and userspace without code duplication. Also, prefix the
>> function names with amd_pmf_.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/spc.c | 61 ++----------------------------
>>  include/uapi/linux/amd-pmf.h       | 57 ++++++++++++++++++++++++++++
>>  2 files changed, 60 insertions(+), 58 deletions(-)
> 
> 
>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
>> index 54baf015e4c1..a8c715bee9cc 100644
>> --- a/include/uapi/linux/amd-pmf.h
>> +++ b/include/uapi/linux/amd-pmf.h
>> @@ -115,6 +115,63 @@ enum amd_pmf_platform_type {
>>  	AMD_PMF_PTYPE_INVALID = 0xf,
>>  };
>>  
>> +/* Retrieve the platform type as a string */
>> +static inline const char *amd_pmf_get_pt(unsigned int platform_type)
> 
>> +/* Retrieve the laptop placement as a string */
>> +static inline const char *amd_pmf_get_lp(unsigned int device_state)
> 
>> +/* Retrieve the slider position as a string */
>> +static inline const char *amd_pmf_get_sp(unsigned int state)
> 
> "pt", "lp", and "sp" are not particularly descriptive. I know they get a 
> bit longer if you expand them but it'd be huge win for code readability 
> still.
> 

Ack to all the comments for patches from 1 to 5. Specific to this
feedback, I thought instead of having long names thought to shorten it
as "pt", "lp" etc along with a comment to say what that function does.

But, yeah; I get your point. Shall change it to longer names in v6.

Thanks,
Shyam

