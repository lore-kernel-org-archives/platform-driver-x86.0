Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E6152532
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 06:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740981782; cv=fail; b=AUVLlFZoiD3hBiUG5/FhtqeoZPH3J+7XPGhUysiATyj/g0Ok270OI1GgS/6GbKs3cbH5EKyAydaN/f7jEKdV1GHKlQ/hb9jzgov/1jqbK5Naf0voyNpTeJH4YP2BDIh7PkLkvsFiR21b0peXfjzn1kXU9QbQ57Twt6GNNKqVKN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740981782; c=relaxed/simple;
	bh=XIGnBJxoNAvJJtE2hOIZZye+aw6xTbuMLQIr3X6X7+s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dbjHf37GaEKsFxWJsaiLrGUuDTMViavdUPFoHnvo3P9VUSQnDBo1KQQsHUAXYSfXqy1WVJTj2A5x9ump6gaRQSLfOjC2/hgfGrcwSBQbE0QEyvYrtOoSswix4QRJiBd9huHMMx4lpc0/Mfa+eF+gfiMG20NfF/4ZfGq33SuEeMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CP+NE5UT; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CP+NE5UT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GP9rxnxHdzkrWvnmZilrU1A5sjzLa+EwlPKf1sKJS1N1mdfjDCITyqywe5xqiVmbEV4T3H9OwbQ0jKQ3KS0VopCjiMmi6GbVcjqdmFI4OILl18ZAdJpJbzXDcA+GPamwYLlUx4bcnlAP1fkNDT1syil0pTGIK0kyLOmw/SRP/lulczoRe4DwTGBQ7v0wxMPHEr4sH/EttaQkBENH52uJdn5hgSoP02JHrFTPYEAfqQuYn32s0PjHVRB8w36T4Lqd1aBptIcf70LR4keZ5lpx7BfaLSuQ4ebySKQxF7meizljRnK4B9PW9gsIcSxTjGMyY3Tm34e7R2SDRBXc6y+4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS2LJ4Ag4+iisADRiqOFXR98WrQuCGrTY3hii8IQdOQ=;
 b=KVV3mfD3G/hJEfpIasqkaWE4RTfLs8aox0Ovrdto+FZMpOqPXrnf1zlqd2HzkwsWiOVhp/iiMEH01gBKCO7XN6ATEHlCtQhsXJ//oPpvZeVAJ/Azd3+FFvEkj66fOC8X9zwBoGu/mEDG3A4FEf9mAGyqDWq7o06SEvcNMugDOPFgACzelM/ZbJukljYIf0zYdKEvvejEVjAcNorYt+895rTf+h36/gju5+XSMWYzyYZaAQAPTpOACoCW1PTzE2ZLTaJbGHfie5NdIj5zMAXMbb+mMzA3F3erXkfiUO9U0tajbtUUxrenfboE/ZoFKrYc1PLu3ADSv9qaDs9DyV5teQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS2LJ4Ag4+iisADRiqOFXR98WrQuCGrTY3hii8IQdOQ=;
 b=CP+NE5UT3weL0COuY8UpT7B05nNWwTWlSxPc9qE8zGY3lhLmxRy/yzWLvJ8CVVEO2rg86kIuKkfgrTHdUJIUgdgjUUc1Ao4CKi1zZZrbm5+6vb9L80okPimIGj2lhVHeC3rcqMCJ8DVfvWE5Mzs1IMi63FCtnGrbzYbQktMOaWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.23; Mon, 3 Mar 2025 06:02:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 06:02:58 +0000
Message-ID: <c51f8e90-0d69-4d34-bd56-771c68ff9cd0@amd.com>
Date: Mon, 3 Mar 2025 11:32:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
To: "Shen, Yijun" <Yijun.Shen@dell.com>,
 Mario Limonciello <superm1@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "Patil.Reddy@amd.com" <Patil.Reddy@amd.com>
Cc: Richard Gong <richgong@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20250227170308.435862-1-superm1@kernel.org>
 <BY5PR19MB392275906AA040DF44DD8EB29ACC2@BY5PR19MB3922.namprd19.prod.outlook.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <BY5PR19MB392275906AA040DF44DD8EB29ACC2@BY5PR19MB3922.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d2e879-feff-4108-c487-08dd5a190c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWdGV1RlVVZ5cDUrcEY3NG84SVhrbXZJVlUzbG90bllKOVN0Y1dkWnl5NG1I?=
 =?utf-8?B?RkM2a1h0Y09SSmxyYU1WK251QXN2Ri9ySGRNOW5CY1J2Znk1STRDcUNOUHNO?=
 =?utf-8?B?N3N0TmloajZuV1U3Q1kvL3FpdjFZMjJ1YTAxNDBCdE11VlhETzdVRkh1Y09J?=
 =?utf-8?B?TVhvazJuZjVQMmhnTlFkR2Yzb0ZKTUJYOGhYK3BkcFhMR0ZnNkoxQjRtQ1lC?=
 =?utf-8?B?ZTNsQTlGaFJIQ0lZdGpITkdsTWozeGtYR3VsOEVrTUFzdStPbG1kOEkxMmtz?=
 =?utf-8?B?amZOdGt2MnE0RXJ4eGFnbXRwV2haTWhKV1ZLSUN6NDhzV0hNbUV5aml3UFhL?=
 =?utf-8?B?REc2UUJhS2dRUDk3UzhNOWNGY1lvTG53MzRQN09OWGQ0RUdqTWFFSThrdUFP?=
 =?utf-8?B?TEdoanBvNzBER0ltU3pZdjNqNWk1TmtLZlFKaEo5YUQvbXRSSkd5c3c4M01u?=
 =?utf-8?B?V0xUS3AzT0IvK0NrNFFFR3NxSXQvNjlDRkNIYmk4Z0t5OHg1b2U2MzE5L2ox?=
 =?utf-8?B?OU8wWVhDZ2ZiUHRwTVF4S3NtZWtVUy9mR2dyeXZ1RXUzUm0yOStaNGtrSXFt?=
 =?utf-8?B?OEF0TkpIb1FjTWo2OEFMZVAzdE1pcllxOVFjNjJuUWsyajcvY0xUUWpzaDNU?=
 =?utf-8?B?bUU5R1oxRU0yeXpOaHdkRHhrS0RSb0pvbVN4VUFid3RvZGwvbSs3R3hiSTN5?=
 =?utf-8?B?elNJRTFaazJacTE2ejIwZWFLQUFEcVl0eGNRY0FaSk5LWXVQN1ZpTmtSdkM5?=
 =?utf-8?B?aDlmR1ZlWVJpTWs1MDRsbzhnd1VPK1dCRXUvOTZxdmFXd1BTbnVPTEZPZ283?=
 =?utf-8?B?RVhTRWtPM3RHTmM1RGduVzd3SFkwQ2JSenhCUm9oOG03NTFMUnB1bk9LY21Z?=
 =?utf-8?B?SHdKMzM4WGxJYnJHSTMyZ0Z1bkRiM3FGTDhpNjMvMWtob2xaY0t5dkpOU3FG?=
 =?utf-8?B?bElUbnVNYk9uWVpoYmFYTWd5Si9BUjc1dE1rYzlRR2U5N051YjUyMWtyZktL?=
 =?utf-8?B?Znc2eEtLdjNWalA3TmVCb2psbG1hay8vOXZHRFY2eWpDcXU3ZHpwMWlHajVm?=
 =?utf-8?B?bnV2ZDVEYmV4L0Z5eGpUMHk2cndmdlpIZ2xwSzI3WmhTcWNPUGU3ajFOaGxa?=
 =?utf-8?B?YW5JZXN4Y2FDUnhGa296RjYwdDR6QXNRMk1CVDhEMlJ4cDBCd0IvOFZsajBo?=
 =?utf-8?B?VUVpU2Nac3pWRUdabEpOeUpsVjQ2S0tCMExYRzlTT0VtdUFobXpDeTJUaDJX?=
 =?utf-8?B?QldqbFozWWZXSkV1UnZlRHN5Z1NIMllsV0pjb3dncU5IczdhSitzR1NRUmNq?=
 =?utf-8?B?V1JvbkoralpkQ1JjUnVRUk81SDlpZUFRSnQxWXBYa0VSMkVXRHhuTVA4SUlR?=
 =?utf-8?B?WXNiV1Jjd0ZwR2RUWXdwMjQ0aFlnZW5RMUFhcndYNXlDeHJLUWEwV0xZeUFz?=
 =?utf-8?B?cFhWb2xnVGd5QTVPa1FaQkZGWmtNN1liUHVaTG8rT3locER6Nkg3NGdYeG45?=
 =?utf-8?B?a2Mwd3A1MnkrcjZ1ZVlyMmpIUGZPOUtFUVg1RGQyNmdHek1GeWNkRThCWDUr?=
 =?utf-8?B?UE9RSW9aWmdveU9zL2VkUmpXYTV1VkZwaGZtNHg5OGVzYmNmNytxTGE2akR4?=
 =?utf-8?B?ODE0cXByVzUwd2tsYkplUklaRkxmcFlocVlHb1RkdnhhNDM2cFpuUHZWNm5w?=
 =?utf-8?B?VmIvZmRjZXhOMjRHaXFtcTJBdytJUWk4a2ljeWhPRkhBMEtnVldQYzIyMFJD?=
 =?utf-8?B?L2w1WjdxTyt4Z3hDeklZazhWSy9MbDlmOWdqRUlrbGlvdnlsRzJnakwwN2ZO?=
 =?utf-8?B?VU45NS91SmxuTExUUHdyQ0wxUVB5K2hJYURwR0w4YTMxTzVJMUpIYlFLWWpX?=
 =?utf-8?Q?/YMSmVli9NRrl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJSYUxmbGRBcUFkNmJCMGFob0dZV1dsRERWVkRaT3hHWUFJKzN0a2Vtcjhl?=
 =?utf-8?B?cTlrK3pBeHVUczJLZUFrSmVaTFRkQ3pRK3U2MnRiUjVjOExrTTg5YUVTcWpq?=
 =?utf-8?B?TTh3R0xhVjN0OVdsd3QxcFdWdGtacHN5N2tuWEJIeXNvNWs4dHZKblhDQmNx?=
 =?utf-8?B?YWYzQ3JtZ3AxMlUvUjNjaUc3M3NETHpLeGkyR3h0QlBSSDVPa3NUeURTU0Vv?=
 =?utf-8?B?SHZzN3JGT2lCVm5SbVEvSTFlZDdPRWZ1aHlXRmxIYTNveFhyOG9XSmszQmtq?=
 =?utf-8?B?VEE3SXg3SXdPQW9LSE1wT1V0VFM2MXhLbnk2a2xYQTRQZTJicXo1ZDFieWsz?=
 =?utf-8?B?elh3aTUzUll5ZWxIUnJxd01raTdSbEVkeXlSNHVRYjlqbXlOUXRZZzdVaGRO?=
 =?utf-8?B?NlY1cU1jTDJqdjFqSTJqYmJwdGdiUG54Q1FkbE9KUGNhM2JUSkZyWWpOY0tC?=
 =?utf-8?B?RFlWU1ZDOXUvQjN5YjdybEhiK1J4Ym9ZSmhpQnNBUHRSOGZBZmZKMGxlTmd0?=
 =?utf-8?B?STA2bTl5azJ4L1JjQVpVWXZpUWEyRk5JbHdGS21JdGtYc1czK0NQM2xycTlX?=
 =?utf-8?B?blk3Y3NmL0hSNXF0WnkrM2IyWGVhZXFsK2grS21WOFN6d0NCK0lMY3UrTDZq?=
 =?utf-8?B?MENZcndxc0hFeUVQaTRTeXgzd2VueEl3Y0FSQlc1YVV6eGVWMlZEWkxBZnZX?=
 =?utf-8?B?cGpBNngrTkVvWVpOS3I3NDJ4NDcxcGZjMWhHNGhFVERXWlEwZ1hLMkRwYmhy?=
 =?utf-8?B?MDlEdmtvdzRLZDUweXdvWlh2SGNHeHkwYlNpMFdqdE81NDRPMmh0QmRtQnU0?=
 =?utf-8?B?eXlXeDNMMXNhSUhhU2JyMitiSjlCdHlkdThXYkg2WmJkRDFSL1ZGMnJFbG9T?=
 =?utf-8?B?cHN5djRHRXpIZEh0MFBzeUJTTnhVWjU3ZGs5Q0tqdWQ2ck9PZVcvdnNMNWFE?=
 =?utf-8?B?aThrU0JWU1UwTE1wUVIxK2VLSkJGOEtRd3VGYUJicnNQWDV3Nmw4TG5xUGFw?=
 =?utf-8?B?SFFhSnRJSTg0cVNqdGFLODUvRWpWWW1ZUitabDVQT0IvK3BpRjV0YnVIcFln?=
 =?utf-8?B?NVFsMTBsK0xDSUREL1VEKzYrWElFZmRpYStidkpVbjZjMW5SZU1kNEllVW5x?=
 =?utf-8?B?TjVJVGN1bVQ3S1pPZk9VNm1mRHpRcjZRdHdSQW5kZXMraEZBblBMUHpERkt6?=
 =?utf-8?B?ZUJyVXhWWkxsOCtZUW9nUWZyWlh5Ky9jL1MxOStYSHQ1NHdRdHlORnVqQmdC?=
 =?utf-8?B?TVRob3ZpYTNxMDNFZ2k0cHdTRDQ0eHFIQ0VXd3A4RHYwVEp3WVlOYjdaYjJF?=
 =?utf-8?B?MWQ5SXZZNjVVMWoySkFwYWpHbjNiMzMranEwSXNoeURja1FFS1IxaDZ0QlVM?=
 =?utf-8?B?M2kxV0dlTWNzRTlvTWN1RjFSWUdKQ1FmWjFmamdQWTBLMVltR3FoMFJNaDkw?=
 =?utf-8?B?U0hZZE1sQXRsQWN1eTlGeEw4MmJ6aHJOaW5Na0g3aklYeG1yUUJXdGRzMVZF?=
 =?utf-8?B?c1p5SmdKOVFOV1FKbUJaNGVPamcvQy92SGs5Wnk4MlJpd2lsenVRWDVVT2Jt?=
 =?utf-8?B?U0VXbU40WXdRUkoyWlJycFF4S0FJZVJubUtON0dHK2NNZENxYjlzaTdkR252?=
 =?utf-8?B?Z3M3OHpVUTNWRHplSVU1TUNmNzFkV3lvcThLNTI1Q2hNMFJ4eUp3K2Vhakg4?=
 =?utf-8?B?YzFiOE5JM3c1MjNMNVFGdDFaTHhnTmEzQjBDUGNqejNVd0FUMVRPb1RIZmZn?=
 =?utf-8?B?VmdoSXY4eG53ZmhtbW9VVHlEQnJMZW5heXA0UVQ2RnFYaUROVzNuOEhaQmlF?=
 =?utf-8?B?S056bE5YWTQyWnNlcEVIdjJzcXFLNjdkQVdUaForcjMvQWdtQmY4SHRObHpF?=
 =?utf-8?B?R2pvT1F4R2lqMHdDZnZIaG5BQzdUdUN6bFo5K3VydmhVUEZtYWdXczFQd21I?=
 =?utf-8?B?MVJpT2ZVZGVOVGxxeGQ1VS9QRUFGMXYvL0R3RG9XaEQ1UDhlbUVvVWlGS0ZO?=
 =?utf-8?B?Yzc5TTRrN054VDJqNVd0RUpKdnl1M2VWK1lEN3lUZmJ2ajdncmhMSGltbGdn?=
 =?utf-8?B?ZXdxSWd6UTlwYms1LzRsTTAvZU9NVE5XV0YxUkRwaVZHeW9yS0dIa0dRNEtN?=
 =?utf-8?Q?ID42ppryQHJk193GbS5whMnLO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d2e879-feff-4108-c487-08dd5a190c1c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 06:02:58.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPwveX4RTngMGvPL9dDMBa9vmy6SpHH09SsHKUeG4+6fgT6VT9LJGbxy+K1JX5C0dAyKl/rbB+6xt9IxJN3a6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216



On 2/28/2025 10:06, Shen, Yijun wrote:
> 
> Internal Use - Confidential
>> -----Original Message-----
>> From: Mario Limonciello <superm1@kernel.org>
>> Sent: Friday, February 28, 2025 1:03 AM
>> To: Limonciello, Mario <mario.limonciello@amd.com>; Shyam-sundar.S-
>> k@amd.com; hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com;
>> Patil.Reddy@amd.com
>> Cc: Shen, Yijun <Yijun_Shen@Dell.com>; Richard Gong
>> <richgong@amd.com>; platform-driver-x86@vger.kernel.org
>> Subject: [PATCH] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
>>
>>
>> [EXTERNAL EMAIL]
>>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> `cb_mutex` was introduced in commit 9e0894d07072e
>> ("platform/x86/amd/pmf:
>> Enable Custom BIOS Inputs for PMF-TA") to prevent conccurrent access for
>> BIOS inputs. It however isn't initialized and so on use it may lead to a NULL
>> pointer dereference.
>>
>> Add code to initialize on probe and clean up on destroy.
>>
>> Reported-by: Yijun Shen <Yijun.Shen@dell.com>
>> Cc: Richard Gong <richgong@amd.com>
>> Fixes: 9e0894d07072e ("platform/x86/amd/pmf: Enable Custom BIOS Inputs
>> for PMF-TA")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Verified the patch on the issued system, the issue is gone.
> 
> Tested-By: Yijun Shen <Yijun_Shen@Dell.com>
> 

Thank you. Looks good.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

>> ---
>>  drivers/platform/x86/amd/pmf/core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>> b/drivers/platform/x86/amd/pmf/core.c
>> index 764cc1fe90ae4..a2cb2d5544f5b 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -452,6 +452,7 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>
>>       mutex_init(&dev->lock);
>>       mutex_init(&dev->update_mutex);
>> +     mutex_init(&dev->cb_mutex);
>>
>>       apmf_acpi_init(dev);
>>       platform_set_drvdata(pdev, dev);
>> @@ -477,6 +478,7 @@ static void amd_pmf_remove(struct platform_device
>> *pdev)
>>       amd_pmf_dbgfs_unregister(dev);
>>       mutex_destroy(&dev->lock);
>>       mutex_destroy(&dev->update_mutex);
>> +     mutex_destroy(&dev->cb_mutex);
>>       kfree(dev->buf);
>>  }
>>
>> --
>> 2.43.0
> 

