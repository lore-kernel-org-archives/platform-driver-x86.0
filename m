Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B81CACE1
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694267; cv=fail; b=AEd3Yy6KSDmgoi41HsT8HBUV2FMP6BGACbL1ilUCFTtehcQ6hpUiN3rYtVszRCv8ec1vRV6JvhQ3Y+y6ajbslefQLyV2NP/F1kFQIeGh6i3foqhtbqpM9p1tc2RNgO7+53TM0DliHK3n1hIpcdyHboLVrcJ0cGi5X7dSbMzU1CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694267; c=relaxed/simple;
	bh=i8U/OQIx7qWQLKUCUzNfc8bNpfobwQmPSIsqw/Cs6vQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HMcEmXhaPR3oX4djD2oFbT5HmU33JbJapJY6EvIsiZyOI6qK/Iu0Bn9HLtW6X5bYJTw+K8h+377kScfHMIvhTxypuWSEr4G4c/aicQsu9mv0i2U9mAKEQrrLt0BbdJ29Qs5OaNioe9Lw0kakjcmI0cM2XB909NC4eXY9BT5tkJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hgZxiKgw; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hgZxiKgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKgcHkzjkT0yzBY3EVTBqwvx2P+YGQpmKWxgsFyzXGXjUJBJ8LWNoW7V6BFvJ7xwk/N0l96sKpj166EMbjHdoDyKr7g799UhWRPvwa9Ebyvg1N1D+wY/Ap0uSm7bwMiQ/6b/EBt67aROX+iIhVB1NWD+XwlkI5qtR1cQyAfTyUngDSNHAdZ1+eH6OUpabHvkHhmynoZ0YJNnszvKeYjBZXP+nhwwf1Rpff6kPX+c5YNxUMhHMVdwrVkpp7XzdKpXlyjeYWGenRbCXNZwkgjKvLCsh2eE+BoB3bDlm+M4ioQwOLXXsXS0d64Ghe9U31bJNCs8cm+P+9YAtNOKJl6psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIJb31Q4WXBNJm+q7b9U94PuOO4FMFll9kPtDtnkGSE=;
 b=geMvu4bdxC1RiSmZTfNbI162zNCB5X6149HVPG3tc1D3Bslx8KDMSsnyTwWoppR+biRYZHqTF6+IkZQKUVPUoPJ9UvL3Jtyhhsf2lPDN8iYrTHnV/i87pCOTqMYHlFKilQs8rOLSrOztoTV7o/rP6E7LNC8xNWYcclpTN3SgwUXKq201pSQ3eJBYHeHAMEiUu7G6cLOS5r4rMQss+o/7Lyg35VOfZsPoUHsj0e0sWABirO3K51A6jCHXyKcpepduM6lq5zAYPpu6wIVAhqA5ETjYHypabA9Hs1KZg0Cku5iXQHJIFLxVlgId6qBob6L5bFpGVKpmaqZzHOg1+akoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIJb31Q4WXBNJm+q7b9U94PuOO4FMFll9kPtDtnkGSE=;
 b=hgZxiKgwDePWZYCrzJJ0h1pywNh/lIwrMz344yDPi4sEDDeaCJWwAuKXPcdEBsi7PbwCLIKldbwdeu0jhMBkE/pVYr0ONICoinlsyfR0lPenZoypOS7y16L8JphkURHDk4ECTX+xUQMUnJgiJ9ZTAzmhoWuilWfKXQ+5TcwLqiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 14:37:42 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 14:37:42 +0000
Message-ID: <b58cf10b-e3de-489f-b5b9-fa0daa407d7b@amd.com>
Date: Wed, 23 Oct 2024 20:07:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
 <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 963ade51-e37e-4b7c-cf57-08dcf3704096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0kxYVcwRzdWZHhnSnltQ0JRUjhkSGFtVUJsZ1IrVmMxRnMzNENJcHRvVnpr?=
 =?utf-8?B?cCtLT3NReGYvNWw3Z243UU9YUjMvS2VCQ0NDTkMvOS9oRENFY2o3Mkp5TzZi?=
 =?utf-8?B?NnlQemRjeHYxZnV4QVJrM0dwVTB6akVnOTQ3R0sra1ZVUDFVVnVua2cwVVhV?=
 =?utf-8?B?dDVmNVREL29BZzBKNTV0SzR1V0NpZjdCNVNNdUM0dmtEZDNPYmdYOHl6K01t?=
 =?utf-8?B?RVQyMDJ5WmpvUGs3MGZhYjFwNDhidEFYUk1qWHByYVF4TTNUMVk4SkxhZVlp?=
 =?utf-8?B?c2ZSM0haeUlucjBSV21pNjltUEo2MzVqYzNHRlY2K2RlNUNKUWVqaDFML1Yz?=
 =?utf-8?B?YndtcXBhZ21tdmtFSHNrckNrenNnd3A5MzlGMkFTNjFHN29zMnVVYUxqbjBN?=
 =?utf-8?B?RmV2SHhHOGR0TVN2OGZnQ3NwVDJOMHZ5ZFpWRTVOTjFSY0lIcktyeVgwYjc4?=
 =?utf-8?B?cHVlUFNrVXhWK09vQkdmb2dUaGlmM2NxcWdZU3dZaGVGT1g0ek44YnZURjZ1?=
 =?utf-8?B?YThjWElmdlB5c3pSWmZCYnQxKzBRSWh0ZU12VlhHN0ZpaWVjTEhOSFVTeHlq?=
 =?utf-8?B?Ti9iOEhYSDRMK0NuZ0dWM0VzSmE5VjJFbzBBZzFPRjRCT3g0T3N5Z3l0V3px?=
 =?utf-8?B?NkVnOUU3dmYwd25Bc3NoQ2J2VnJ3cXo3WWk5eWhFNU9tMHRGWHBWclJaN3FS?=
 =?utf-8?B?VllOT2Rhczk4dTJqQyt4bG9qbElUZEc0ZVFvV0ZJYjJ0MU5aeWg5S3VCQ29m?=
 =?utf-8?B?bnRrZU1OOElIeGJMT2Z3dDFTSnRUZjRFVHA5aWprdVlSTVJEVlM2TlVQVk5w?=
 =?utf-8?B?MVFtMFI3UlM4VXQ2NFhZaHhRWndza2FMaFJFeklDcU5ya09UZXdDSUxJS1Zu?=
 =?utf-8?B?RjJkbGdXWkE3UHhCaXBBUXhrZlhMblZIcEpORzBuVzJaTG1YaUVqeitKNEVh?=
 =?utf-8?B?M2swTEVOVzI0MDQyRmdYM2tvc0Njci9XNUFnZklOSERlV29aZXFSRmJscmZw?=
 =?utf-8?B?V0plRmlOVVpRNk9qaTFYbDdTOVRTVyt6VVUyTDZzbUFZUjN5U3hPNDZXakZF?=
 =?utf-8?B?by81eCs1UExQUWlIV2RSbU5kR1ljSERPTENzTDc1TjNCbzVjSmhGeEtaSFhi?=
 =?utf-8?B?V1FUVmk4cGY5T3lpWHJiMDBIWUs2a0xyV3lKVHBHM3hCanJONy8rVXA0SWtK?=
 =?utf-8?B?UjJDc3k3UlVOUkZFR3dmZzZiU0lIZXdaaWZpSktCSUdxdXF3cDNETVlTeFhC?=
 =?utf-8?B?N3pwL1BvLzVzSElqQUVMSmdRS2Fqc01sL1dpY0NuR2FkRlphVUhTM3k5cGIz?=
 =?utf-8?B?VXZrZ2l1MkpTK3c0dFdDZS9MRzFSeHdlNitDL21yYmdSK0t5VnA1Y0plMldU?=
 =?utf-8?B?MHdZbmNNVUJQdDJvMmJnQlRqU2JBdWpCaWFEcEkwZmR4VENpZmRoMXZtME1N?=
 =?utf-8?B?ZHRQSTNDVFRndEdldlpSak5oMjBlSXplREtYc3IwKzllcHFtSDQvQ3hPTDJE?=
 =?utf-8?B?TitHMjVsK01vblpjY01lVHZOaTV6TUFKR3MxM1N6V1ArRGFKdHpuTjl1YU9l?=
 =?utf-8?B?U2E4ek15N0JocWpuU200VWFSSGJqYlhzd1Z5NEl5eUFwazRaVmJHNlRFV004?=
 =?utf-8?B?OVVKbzc2bnVrSzV0Y3d0VHFvSE5INVNuN2ZOQm05TTRNTWN2K1RXWWhUL05H?=
 =?utf-8?B?Zmx1TnZNckZRK252VEZKMjhrOVo4Si82RHpaN0Z1OXpLQ2JxQTZYL2IwdlY4?=
 =?utf-8?Q?sag75tK/54hnOSX2GhzKuWRkbutpfy1o0q7okuJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtqcHIrdXhiUmU3MDdMT0xlR1hLL21tM0ZvODVvbFRyZUhsTEw3SmhkS0xW?=
 =?utf-8?B?TlJBZ3UxRXlUVWdEQmRPL2MzU2RHY0Jab3VQWWJBakR5eS90bmd5d24vbEQz?=
 =?utf-8?B?SDhWbUtNamJWYnhsK0orbTlnZCtwQUQ2K1I2TmxsS1FuY2FCUUVZZFBGK091?=
 =?utf-8?B?TDJSV2duRDd6ODZTZzVxRzlQS212U1ZpcGJrcytLcmNYM21XeW1abndOM3lm?=
 =?utf-8?B?Qk03NHdENG9uQjFxUWlRMW1WbTVPeDgwMm1uWlJmbnhBQXNOQjRwZEE3Tjc3?=
 =?utf-8?B?STE5R1ZiVEtHdVA4dUw4SHRWdXl3enRneEt6bkFiRTRDNEwxaGh6M2QzeEtx?=
 =?utf-8?B?YkR4eUJpZWVYRTJaaVNwSGNpcmRKZVZha3ozcUNwcFZOMDNrRWVhQmxybTV1?=
 =?utf-8?B?SjdrTVVWU3FnN2dVaGFISHkrdzd5Q1o3bUxtUnNncE1ldGJlSXpmYjN4bFVD?=
 =?utf-8?B?MTB4SXJ5S1ZESldrNmtaWVBHaUJhUjZFb0xseDFKR2k5NnUyL08zYjd4M21n?=
 =?utf-8?B?QTlxT1E5cmZLMlhUYjM0SVl2ZUhjT3hGR0VwV0tXWWYybysxcTZhTnlkUGN4?=
 =?utf-8?B?Yy9iSHF4OVpncDE2SnZkVDZRMWVDdjVDK2o5cnlIY1ZsbDVUTHEyV0FYWDhy?=
 =?utf-8?B?WXJlV3IwaXN5TEFJZzhxME44YTgwaDFsVkhSbXR4V2E5elhSbkJBemFwTmc0?=
 =?utf-8?B?SGlYV2JJdzhiV3g4UFNBRmVDVTZWUE5hbFVzV3Urb0lZdnBmZ3NHdWIySW5W?=
 =?utf-8?B?QkpISjRNVk1SNU14eXNkeDN5Rktyb0pDYVNDRk55QzNwOE13bDhoY0dEdWd6?=
 =?utf-8?B?SzFTdDhMcjh5bzN5cFFOeFNpWHJia1Q0OENwZDR4cjc5TzRRZzBLMzcveDY2?=
 =?utf-8?B?UmZXNGh2Qm9uVk9XNmdDRGtQamNLeUxHdGxGTkI0UzVIZUpMT2tsL1NqVk1a?=
 =?utf-8?B?dkZIdVpYSmkyVWVMV1dsME85TXRSMEVsdngyRDhEZFpiSU5oa0c4dzdzTjBU?=
 =?utf-8?B?L3VqeC81SUNXbFBiVUlTOFJ4eFMrM0ZncFJhUkRZbDd0Z08wbjBHUTdiN3Qx?=
 =?utf-8?B?bFJjaUE4cVVFZDExd3RtakFtM2NnQ2pKd09Kd1ZJaTVUem9Ld0c2OGdJTGhJ?=
 =?utf-8?B?dzZielplN2NPZzdtUWU2QXNrWFk4TW1mTVRROEZ4d0xYMUg3VkFoRUhzdllo?=
 =?utf-8?B?eGcxcmd2aXlQbHMrV0FUeHNZWVV3TU9mS1lhZEtQL0doRllqZjdYdFVuOS9R?=
 =?utf-8?B?ZlBJMWtzOVFiVUJxdlp4YytKMElmZm1MaVg4c1dqTlBMZTJNUDdkeXFydVdz?=
 =?utf-8?B?cmQ1Z3FxU2pGcGtUdlB0b2VydHZRckRYOVVqNmFmT3BHVHZBb2swSXB2OFNx?=
 =?utf-8?B?V3FjblZYY3hOL0xDdFhmS2t4WGV0aFZPcW1nL283K0FEL2l4YnpZdTF4bk1R?=
 =?utf-8?B?NU1FWDZHWk1sT1FmWTdWQTRwMVN1UW9yZk04d1dZQUVkRzZWY2tDMktvaC81?=
 =?utf-8?B?RmJXc2hOWTcxWFQybjh3VENNS1o4UVpzQ2R5bG5QK2hOZkZwU1QwaklzWTNi?=
 =?utf-8?B?aExjbjF1SUt0OEMyS01lejBTMkVoS2xSbWdPMUhLbFhaU2tKMVpYMFlXR1p4?=
 =?utf-8?B?T0daNUxTUDlROVM2ZzRrNWk5Zlk4Z29BMDVhZ0NITEVFM0Y5RU1lZWxZMmdl?=
 =?utf-8?B?dnFMYkd6SkR6ZkFuY2x6N1BoMmszaGlxYjlWcUxsUHorSjJVZ3Q4eGFqbWpZ?=
 =?utf-8?B?Y1NUa05xVS9GeFFITGVGSmVrUDNXajdZbW55Nm1GQWFDVGxuRytKV3BNaUF1?=
 =?utf-8?B?S0VRb1p0VStYWUFURHUva2tHVS9WQ0wwZ1dYaXM4emJVWElwbGpZQTFvOWxM?=
 =?utf-8?B?VXF5QnpnQk1PSjFwWm95aFpPaTN2a3pFQ2N4ZWVwaWhkQkNPb0lQQ3JhMkpp?=
 =?utf-8?B?NHVsWjVuNHZSOEtsS1c0ay9lTjFiMDhJTVhXVXhqMG5maE9wcUY5eFRFeVVq?=
 =?utf-8?B?OTlvWVd4V2FRRzRDakkwanl6Y0RZNVhBdC9KREpzSHUyYTBWQm4wbEFOVmNk?=
 =?utf-8?B?K255ME14RVd2L1NLdXVCYlZLTG5UdkE3Z0FmamxNejc2Q2dlWXRuUjZXNDhS?=
 =?utf-8?Q?jMELlCtoSogXqA05c9XwWwYGw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963ade51-e37e-4b7c-cf57-08dcf3704096
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:37:42.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3oCRlWD7LGceKukJaDlmQ27TP2fqDHS3/pPr7fKUlY3i3Tt3F1WwLo4gQfP293QPsRbBfmcjO5Bv4rNEWSOng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220



On 10/23/2024 19:35, Mario Limonciello wrote:
> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>> Use platform_get_resource() to fetch the memory resource instead of
>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>> resources.
>>
>> PS: We cannot use resource_size() here because it adds an extra byte
>> to round
>> off the size. In the case of PMF ResourceTemplate(), this rounding is
>> already handled within the _CRS. Using resource_size() would
>> increase the
>> resource size by 1, causing a mismatch with the length field and
>> leading
>> to issues. Therefore, simply use end-start of the ACPI resource to
>> obtain
>> the actual length.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>   drivers/platform/x86/amd/pmf/acpi.c   | 46
>> +++++++++++----------------
>>   drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>>   drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>>   4 files changed, 28 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>> b/drivers/platform/x86/amd/pmf/Kconfig
>> index f4fa8bd8bda8..99d67cdbd91e 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -11,6 +11,7 @@ config AMD_PMF
>>       select ACPI_PLATFORM_PROFILE
>>       depends on TEE && AMDTEE
>>       depends on AMD_SFH_HID
>> +    depends on HAS_IOMEM
>>       help
>>         This driver provides support for the AMD Platform Management
>> Framework.
>>         The goal is to enhance end user experience by making AMD PCs
>> smarter,
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>> b/drivers/platform/x86/amd/pmf/acpi.c
>> index d5b496433d69..62f984fe40c6 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev
>> *pmf_dev)
>>       return 0;
>>   }
>>   -static acpi_status apmf_walk_resources(struct acpi_resource *res,
>> void *data)
>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>   {
>> -    struct amd_pmf_dev *dev = data;
>> +    struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>   -    switch (res->type) {
>> -    case ACPI_RESOURCE_TYPE_ADDRESS64:
>> -        dev->policy_addr = res->data.address64.address.minimum;
>> -        dev->policy_sz = res->data.address64.address.address_length;
>> -        break;
>> -    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> -        dev->policy_addr = res->data.fixed_memory32.address;
>> -        dev->policy_sz = res->data.fixed_memory32.address_length;
>> -        break;
>> -    }
>> -
>> -    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>> dev->policy_sz == 0) {
>> -        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>> -        return AE_ERROR;
>> +    pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +    if (!pmf_dev->res) {
>> +        dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");

here        ^^^^^^^

>> +        return -EINVAL;
>>       }
>>   -    return AE_OK;
>> -}
>> -
>> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>> -{
>> -    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> -    acpi_status status;
>> -
>> -    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>> apmf_walk_resources, pmf_dev);
>> -    if (ACPI_FAILURE(status)) {
>> -        dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n",
>> status);
>> +    pmf_dev->policy_addr = pmf_dev->res->start;
>> +    /*
>> +     * We cannot use resource_size() here because it adds an extra
>> byte to round off the size.
>> +     * In the case of PMF ResourceTemplate(), this rounding is
>> already handled within the _CRS.
>> +     * Using resource_size() would increase the resource size by 1,
>> causing a mismatch with the
>> +     * length field and leading to issues. Therefore, simply use
>> end-start of the ACPI resource
>> +     * to obtain the actual length.
>> +     */
>> +    pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
>> +
>> +    if (!pmf_dev->policy_addr || pmf_dev->policy_sz >
>> POLICY_BUF_MAX_SZ ||
>> +        pmf_dev->policy_sz == 0) {
>> +        dev_err(pmf_dev->dev, "Incorrect policy params, possibly a
>> SBIOS bug\n");
> 
> This upgrades the previous message from debug to error.

It is dev_err() even before this change.

> 
> TL;DR I feel this error should stay as dev_dbg() if no function checks
> are present for Smart PC.
> 
> I don't think it's necessarily an error though.
> Smart PC checks are a bit different than the other checks.  There
> isn't a check for a bit being set to indicate the function is supported.
> 
> So if the BIOS has the declaration for the region but it's not
> populated it might not have a Smart PC policy and this shouldn't be
> reported as a BIOS bug.

This should be included in the CPM package, and the BIOS team is
responsible for packaging a policy binary.

From a driver design standpoint, the absence of the policy binary
should be treated as an error, as there's no reason for the BIOS to
advertise the Smart PC bits without providing the policy binary.

Therefore, this should trigger a `dev_err()` and be considered a BIOS bug.

Thanks,
Shyam

> 
>>           return -EINVAL;
>>       }
>>   diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index 8ce8816da9c1..a79808fda1d8 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -13,6 +13,7 @@
>>     #include <linux/acpi.h>
>>   #include <linux/input.h>
>> +#include <linux/platform_device.h>
>>   #include <linux/platform_profile.h>
>>     #define POLICY_BUF_MAX_SZ        0x4b000
>> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>>       /* Smart PC solution builder */
>>       struct dentry *esbin;
>>       unsigned char *policy_buf;
>> -    u32 policy_sz;
>> +    resource_size_t policy_sz;
>>       struct tee_context *tee_ctx;
>>       struct tee_shm *fw_shm_pool;
>>       u32 session_id;
>>       void *shbuf;
>>       struct delayed_work pb_work;
>>       struct pmf_action_table *prev_data;
>> -    u64 policy_addr;
>> +    resource_size_t policy_addr;
>>       void __iomem *policy_base;
>>       bool smart_pc_enabled;
>>       u16 pmf_if_version;
>>       struct input_dev *pmf_idev;
>>       size_t mtable_size;
>> +    struct resource *res;
>>   };
>>     struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 19c27b6e4666..555b8d6314e0 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct
>> amd_pmf_dev *dev)
>>           return -ENODEV;
>>       }
>>   -    dev_dbg(dev->dev, "Policy Binary size: %u bytes\n",
>> dev->policy_sz);
>> +    dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n",
>> dev->policy_sz);
>>       memset(dev->shbuf, 0, dev->policy_sz);
>>       ta_sm = dev->shbuf;
>>       in = &ta_sm->pmf_input.init_table;
>> @@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>       if (ret)
>>           goto error;
>>   -    dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr,
>> dev->policy_sz);
>> -    if (!dev->policy_base) {
>> -        ret = -ENOMEM;
>> +    dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>> +    if (IS_ERR(dev->policy_base)) {
>> +        ret = PTR_ERR(dev->policy_base);
>>           goto error;
>>       }
>>   
> 
