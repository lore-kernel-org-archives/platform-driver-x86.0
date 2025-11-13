Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636B328B53
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763019213; cv=fail; b=jB/gTRd+MR5qOO2sICMLYHmYM9oXXPJgW8k6VQ1+6nxmd1nadAVVNodp+PHD+2MKXuzFxmJ2WRKmdSBF59StL8GNmOWiXEfK6LcWYcLdTy9WBkcE2CWnrcRyhLN2v8XAfrRrZmFj1ySoEEcSYjiHMmMxOWWyU3HhKiit0xrP2fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763019213; c=relaxed/simple;
	bh=u03XSoDAfGNFohU9UTlsN4atTSADuwNwcTY3pt3G/gI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NvxJjfZjjyyiImNbCQFQ2NdtZpiZDMiyX1lfnUmIIcazF15j/hF/pgTS1p4exX3eK2nEjdZ0bocYNLAzsL01ZDlx6ghiNxB5vtb2JBVQV0S3P/ntT3vMphduAbbZEwP5QS5F0+qcrXmnQJmKF0Y0ip5YIp6mkxO3LbKYBjWmH8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bLIVTgbX; arc=fail smtp.client-ip=52.101.48.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bLIVTgbX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc4/fera8eq6yp7szVdzN7ZNkwmSABkTVHEmWUzKr/Sy6lFrM/49mXHNVXrmp49LKaUtvN/hpzfO6qyAgL5wTjex42Q085snEayX0mnbBBFj6BLE5RAp/phf1VcxPfG6nCroSdrCnymd4fxAMMjhD8pWR+W3cVvUU65fJNk+Kif3bpxWwaJ8/Etm312/vBL/ryFsflMifZRcWW9IsngcXHAKAxgtVxILZ+CqPFzVh+XGaRE7iPWO6VfxPo8mhxF2M8sl+Sl2HYfofdfuymICkIQPd8zZeDWIjWh8tLeroeU+TNX0vNUkCLWwS5IwOIm7vdSHMoaYLzRbshdHG2wROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM4ew8D9v9jWkqUfFHhqXI3NUr72j4Ri0UsBzF6dz8Y=;
 b=kIyRFeGQrKF/haIP5A8LtsbwucUg8hW4e8DsnRPQ/YQC0rauWHRviUO2MJna4FgmLUYQO/vhyltBdyTuBRXBnxXUyINETG2uR/jEC2g9V9+LzBzwuKdMYX7SscArNCQKm3E+nGTd9Jz5eux40riMeK7Yf56JQN2Z1M0R4oJp4YmTVU3ena1o1zdbDvaSjN1BWagziQc+q2O1WwblRWcdjr1k9xIDlyBM+jsiW5tqtRAYrc2oUcWtusTNcup//e+CzNqoA4wcz3+IfNGW4gaknQHx30Owu33sE459apSjUcbYxha+OPVj/IrXChwOY4T8k2Hbhsxgv+3WmbKUYKhPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM4ew8D9v9jWkqUfFHhqXI3NUr72j4Ri0UsBzF6dz8Y=;
 b=bLIVTgbXYoGY4XucK+UBXqtpgEO70BJ+/kM0nRewSse9K7PamwdtPPEfXW5BsI8S6mtxTYd6ZAscSQbsNgBJgdOJcooVB2DwQOtkv7cZQ6TG19luuMHUJDn3rjMu+dPBgqPDB2GaCk3bOkuniASXfSFws7dqPNbkT7h3OdhOqjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 13 Nov
 2025 07:33:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:33:23 +0000
Message-ID: <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com>
Date: Thu, 13 Nov 2025 13:03:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power
 estimate via AMD PMF
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 lizhi.hou@amd.com, VinitKumar Shukla <VinitKumar.Shukla@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
 <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: e86c26bf-3a90-428a-c5a8-08de2286ece8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3M1TzNwc0gzNGRCajJZWjQrQVFHODVKeUJLUWNpNWFqY1ZFNHpWdHJxRVF6?=
 =?utf-8?B?V1FKVlhaUS9RQndlTENsUEVrK1lmNlZaQzZTd0lkZFg0VkFSbHNQYitFWmh3?=
 =?utf-8?B?NWUyeW5CQTF3V0xVWW4zNE0xN2g2ZHdYbEgzMVQ0cUF4WUQ2aDFSL0tDU1JY?=
 =?utf-8?B?dWhzbE9PSnN0cFVrekRIaWNPQ0F5K1BvMWZwaVVtKzJ2TTJ5MldzbG14Ty91?=
 =?utf-8?B?L2RVSmFJaUR4ZjRWVDFFS2NUWitmL0NGTGQweGVlN1NORkpmOFA3bkdsUmRu?=
 =?utf-8?B?NHE1SUxieFJpaGUwUEpKZzlKYkN2dy9ad2NJRVNOK0hXVStYZnZpMjIxdHM2?=
 =?utf-8?B?dndBSjB5c2d6SGk1VHh2V05GMzVnVnpzV0RQQkhzMUdFOCszRUpzL2h4UzBV?=
 =?utf-8?B?T0Fqak4vazZla3NQQk9FeGtqVlk4YklpVFZEYTM3ZGRVYzdRZGQxd1VKSmhw?=
 =?utf-8?B?VEJOejc5Ym5ycTJGSzBkd1d5L2JmRVE2Wmc0TGFJNU92SlMvZ05wdkM3aFZq?=
 =?utf-8?B?S0Y4KzdYeVZCQ00waUhyZVA1S3BnU1o1d1ZMOC9OY2lSTDl3QlNIaHlaT0E3?=
 =?utf-8?B?b3NlQ3JueUhNU0NsQU5IeHMyUGs1QTF3V2ZaVW9pTENidGdsZUpobk0rVENI?=
 =?utf-8?B?YWJ1ZldUTHhsVVIwaVE5bzZlaVNmdjVOMmlOaFpLeWtDMkh0QitZMkdPVnZR?=
 =?utf-8?B?UTVSWUxVU0EvYjUvOWpsQzdZOEw1REFXQUZJWHdlUXZCd2drcmkrMWNIU2V0?=
 =?utf-8?B?R3VPVlYxanNESVAxOXpaekMweFRORWw2b1AwSTdia29oVXVPTlhXUlJLVTFR?=
 =?utf-8?B?VW9QKzZLWW1OTjBvYUV3Tzl3Mk9hUnRvb0hDM3NyUEhCa3E3cHAvcm5WYitw?=
 =?utf-8?B?MzhPQkRtOXNVMUVnR0tOM1BYNDBoRlpBWUJueTN3WHoyWHJ3Mk9rNHdXYXhw?=
 =?utf-8?B?SDNnTVhyUUkrdFo2RldtbWhjUHJpdlhpRDQ2M0x5R0JmczVYRjRnOXdtN0VN?=
 =?utf-8?B?K3VZa2hDYUpYem5oOXpsMTNpbjQrUit2TTYvVVN1Y3dMYUczSDRTQlZRaHNz?=
 =?utf-8?B?UGlTSlJaYTN5YW5EYTBZRmw2aXd6WGVuY2l1TmRLMi9FcHMyOTFiOUlZb05x?=
 =?utf-8?B?R2RIZHd2enZUZVlyWGpwZGh5d1o1ZExabmsyb09mUjVLWlRRcXRtcHcvUXE2?=
 =?utf-8?B?RiswaFpJaWFWYXhjQzVGQi8venhBVm13UzN5ckRJVGpwZ3NWR1dYYjJ6S09X?=
 =?utf-8?B?N0RpM1FHak9ZS3hNS3owS3ZnTFZnM1dDUHpFUVJTNEdwT3VJOTlVUUUrck83?=
 =?utf-8?B?aDFxckRMYVZxbHJncXNmd01kVDBoWXlYL1FPcTV1bVpVSmRKMDlneEtZVGVq?=
 =?utf-8?B?disrVWxobnpwamMyT0ZKbUt0WGF3SHo0OTdsTXZHMjdKYjdLaHc0c0FlcFll?=
 =?utf-8?B?My8xcFpkMHh1b3pEMlpJYitPYW9RS2ZRRDdueEx4c01pajdIOTg4NnZMbXJI?=
 =?utf-8?B?cytIUHduOG1SQW85aU84VnF5VmFiekRHS3VaRU03NC96TU1pRFIvekMyZXk1?=
 =?utf-8?B?cC9ReURqMVV1d3c2UGpQTTVxWWY0UXVwb0Myem9WMWx1a0tlQW83Y01lU2xS?=
 =?utf-8?B?L01lV3JwUFpsRzVZTXlMWVk4eDhqdVIxd1E5MEZwMEdBVVlaamFVTEFmOEh4?=
 =?utf-8?B?aW9rWXNnYVpIcmRvUFErK1ZhQ1VSZkYzWWFUbi9jSEFBTy84ekZuV05Tb0d2?=
 =?utf-8?B?MHFOY05qQTZwOWdzbExNUkZDZ0gxT2ZmMkx4UEJnOFFJQkJ0Z1M4cGtZNnNB?=
 =?utf-8?B?T0hBajM3YUNXL2F0LzZleDFqVTF1MmZxQVBtUTBXVFdOenVpcTNqazZ4Qm1h?=
 =?utf-8?B?ai9aY1FCMkVxMzNZTlBtQkw5dFh1L2FwZ3hkaisyOGYxV3o4L0FuSC9MZHAy?=
 =?utf-8?Q?YFClzDKzDYC001RLC/jCBMb1Oupz5CPs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElsRnY0OUxsQ1ExUXYxd3JrQm80T2FYQlBpT3dMaW1udFVhdmlFSE91R0xt?=
 =?utf-8?B?NHhoM0pCRENVYUxjOG5ZamxzNnoxZXNBMDlnL3Y1c1E0eHpXWWszL3JkaUxE?=
 =?utf-8?B?WVRqZTNSOXEzWTQvcTN0Y2pNMTNtUHdXTThKTlVGdjI5cXV3T29FTGYrWHhH?=
 =?utf-8?B?TXlzVzFtdUlWVHR3UnpFZHBQbnVYNkR2ZWkxSi9jWmdGNUtkVktTUjB1MGNK?=
 =?utf-8?B?NWxFRlVXUk1oQS90V1NmSHJxU3lPcmJyWEZyblh0S2tydXZaeHlFMU9NYWx1?=
 =?utf-8?B?NFJOemw5TXRLdy85dGJ4RlNPaEFTUWZ6aFRzWnA4YzltZkVpYmpLYUhHN1cv?=
 =?utf-8?B?NVhwUU1BbEgvN2cxS3MzakpvSGM2UGt2dWg3QmZMVnh5ZGhvWUhnbWl0aFNH?=
 =?utf-8?B?WllLR01BbGpTTWhIVW1HTzdZbTF5NGk3bkU0ZVlQNXU2WGUvUmVQRzJ5YzR0?=
 =?utf-8?B?bHJja2ZVV01sT3p1WGI0ZDhqYkg2MEZsY2p4eUJQRlR3bXh2U0JvTlM5eFVy?=
 =?utf-8?B?eXlsWHJ6d2lYOTF1SldFeFpVSDBldFpGbjdNbkwzemYrV1JNTUJRLzRHa1BV?=
 =?utf-8?B?WUw2eHowb2hVa1A4cTl1NkE3d0tyODR3cXV1dWJleUpXbXR0aG0zcDlyWm84?=
 =?utf-8?B?aW1yYWNRSEZBSXBHdlI0VStiR0Uxd1B5M2R1U25IU2JaSW5zcTBoUjR5WU5B?=
 =?utf-8?B?Y2tqMXI5dVN1UjJyODJaUE5HSmw3QXRFMlRHcitKL1lPVVRINGwrelpXaHM1?=
 =?utf-8?B?VUYzMXZKWkpUWDF4NjdudnpwNEhCeXpLeGJIeXp1K3p6d0pKcURGTzNoWHNx?=
 =?utf-8?B?ajdXaE5IdjVnejNqbjBXNEtCOTNQOHpTdnF2UE1XblFpWm9zRTllODcyblRH?=
 =?utf-8?B?VmgzNEpGQXNRQXp3RFVYQ0YrVjhxUkZZSmdMa1VsZWJJN1hrUnRkY0FtQ2dW?=
 =?utf-8?B?enhVSVBOTXI0WDRWWVYvdEgxNktuUm93Y3RmZjJyUW04Nkx6SHJQMVUvTk0y?=
 =?utf-8?B?M2NIUi9paXVxMkdhalhTVUM5WE05dXpoMDVFeFA0Q0hpUjdUWHh6K0x0NzBK?=
 =?utf-8?B?dC9zRnB0Mms3MGNaVWRFMkFld0FVZ3M3OEp2LzVlTGM1a3V1N1cvaUtCNzRB?=
 =?utf-8?B?VHROTll6NUliemRrNnRaQjBxaXc4L2g5L0YwUWQ0K1JEYXRGcFJzaGJUYWRW?=
 =?utf-8?B?bnZ1SHRMdW9DdXRjSlhaQllXWDB4a3NvZ2ZBeG1tZDFwWEVLUmdtQmRVZ1VZ?=
 =?utf-8?B?bUR5UUcrbUVIUjJac0dPZVpnMWlNSHl0bUk1VjhmaTF5d2dEcmJ3a1pmaHc0?=
 =?utf-8?B?dVhMMW8xNzcxZ3FXUGxFOUpqSVp5TlJTZGE1SG1BQjJFS3VoZ1pkalhuNlNp?=
 =?utf-8?B?eTQyTDdHeldnakZQaVhBWjExaVRKNEFBODY1T0VkQ3IvWVYzU0twcmdGTUcz?=
 =?utf-8?B?RThRVW5VeVpmZGdZd1BReGg3bzBjZHprSml2VFNlSnIyNGgxZk5DTWVjZGxI?=
 =?utf-8?B?Z0wwRGNIV0xWaDRDYmJMVTI0dXh2cUVkVFpSSWI2VVRCVmRyMlcvSE9XTFds?=
 =?utf-8?B?Tm91M3NWSjliYzhUMGVSR2xrV3dDY3pUbld5R3VqbTFsODV6d0RFZnMrREx5?=
 =?utf-8?B?L2hodytzZlFUM0lpOEtlclE2ckZ4b0FONUhhRUF0RkR6MWw5dEFaaU42eGxV?=
 =?utf-8?B?ejNHdTU1NjdpRzhVNWpaUnBmeUZVSDZ6TVp0L0dzN2lDcWdwRnY1V2pSc01I?=
 =?utf-8?B?ajZVckxwbkFEYXdaTFhPd1BsSTh6bEdVeHJQdk9KdjByZy9xNm1QM2hZNm1m?=
 =?utf-8?B?eXM2Nk1sQXQvVjFiNDRuTEg5dHU2aXFRZ0pPVk82YVp3VGRiWG1ubnQ3VTRU?=
 =?utf-8?B?RmJFTmVjSlE4STBrRzA2QzdMcFhmTkdsQVhnSkljVmRzNzJNdG0yZHpObXl6?=
 =?utf-8?B?aTBhRkptNldtSTNORVZWc2ZtN1lhcFdQMEJOanV4ZG9yNmFUTG9CQnhuVHBE?=
 =?utf-8?B?OVJDY3BWSEpJeG1LYUZtYUttODROd283cDlkVjd6SVE1L1Zpa2FpMnh6c1JQ?=
 =?utf-8?B?NExHc2JxZFdNeVdIaHQzbXJEOVEwRTRGdW52TlduVjFJZmZSTE5MTDMrbUho?=
 =?utf-8?Q?fdT0/mt4Y0XwYWxRRrCvzBNms?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86c26bf-3a90-428a-c5a8-08de2286ece8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:33:23.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uu6BQii7hGtvyBfK/tXBxkVwPN55KXt9hPd2N1ZmoPH5rWnTLg1Oi75zZ+qmqLM+IIV9nyx7s/asjbDnKgghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119



On 11/12/2025 23:33, Mario Limonciello wrote:
> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
>> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>>
>> Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
>> AMD PMF driver. This xdna interface enables user space to reflect
>> current
>> workload power consumption in real time.
> 
> But.. it doesn't.  It just adds a new function that could potentially
> do this job.  The actual gluing it to userspace in some way to use
> this function will be another patch.

For now, yes.. that's right. XDNA team will add more support on it
that goes via the accel tree. But this patch is meant to have a
minimal change on the xdna side so that there is a  consumer of the
pmf symbol that is getting exported to the kernel.

So, there is more support coming on the way. If you think, its worth
to rephrase the commit?

Thanks,
Shyam
> 
>>
>> Signed-off-by: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.h |  2 ++
>>   drivers/accel/amdxdna/aie2_smu.c | 12 ++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/
>> amdxdna/aie2_pci.h
>> index 91a8e948f82a..5601de841b5b 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -8,6 +8,7 @@
>>     #include <drm/amdxdna_accel.h>
>>   #include <linux/semaphore.h>
>> +#include <linux/amd-pmf-io.h>
>>     #include "amdxdna_mailbox.h"
>>   @@ -240,6 +241,7 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>>   void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
>>   int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>   int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>> +int aie2_smu_get_power_estimate(void);
>>     /* aie2_pm.c */
>>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
>> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/
>> amdxdna/aie2_smu.c
>> index d303701b0ded..7b5e2c383dd3 100644
>> --- a/drivers/accel/amdxdna/aie2_smu.c
>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>> @@ -54,6 +54,18 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl
>> *ndev, u32 reg_cmd,
>>       return 0;
>>   }
>>   +int aie2_smu_get_power_estimate(void)
>> +{
>> +    struct amd_pmf_npu_metrics npu_metrics;
>> +    int ret;
>> +
>> +    ret = amd_pmf_get_npu_data(&npu_metrics);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return npu_metrics.npu_power;
>> +}
>> +
>>   int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>>   {
>>       u32 freq;
> 

