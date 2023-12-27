Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443EF6FA2
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DD7STrIm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1KiqHcVzx7stOPndC4/ZHYXf38XGKWwTVje6+upjPsKAxMB7/Vm8wwMAKXwEdfUz/cqOjDCtXcm377hmEycLHGe2AsndGpTexSijs5tOH9oGKMMnGUMKQLED1rvTi4ZuTA+oMM2e1aEiZoB65/ECDOE/i1CjTgzSrFnRHGuFXdmUpMcOAiwg9CTFyRN469TSG3lUsCthf3jXOKlyyhVG4piV1oNF+y+nLwuIWx5mhuEyUxuMO9C3qUaGew1bOtjFe7rrsWCyIZQVShgLTV6EhRakFcJy96oBpbFc53OkZFW8E30Gi6V8D85O+OfFHohpx1a1ytV2zG3jfHUlJShEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1iio0HfRIoRLHaVBzc6K0NFjcWRr+yLOICUA6jR9Xg=;
 b=DwJTjaCJ4T9TZt8kbPWcYgkXayNJFNdDlNCpzrMaprlpsHtknQ6dKZDLxxPnuuuWoWHEOWwu3V3HQsS6O9i2gPhvxFt4XR37yJlgc+FKAbFOUHsW3r7DwvD5if80C0Kw3u1czoUbi+C0gXeyIe89gswNZHFEyNC8i2gvC/JMXdvNN3HUkVGrFDMwIgBEe4PHAT00sk0ASrgLzXjWi3hMP6IxzDMambEaWME85kKNfQLterNl/rcAq3FKbQvMF6rEE0/WgUPSNar5eAPapCoJ3VBzgClLuZh/0a34pOmZCTSnr2gBMoaLqTNEJjsbg+QHOafqXYYkRSxZnwvLLP3rHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1iio0HfRIoRLHaVBzc6K0NFjcWRr+yLOICUA6jR9Xg=;
 b=DD7STrImlIsz5Hn0K3Hyap3XsYFku0aI2Y3Uj7tBiaql1Ks4LKth5+uV4n+tEGGdx7ydzAM21QXDhqqUdBrCTfTpPYXiOwU4zIL7Z4JvCnF7GVOgTRCD8CIUgjGuSY2XW7XefpbQwKoxhDQoGsIqgab86hKZn/z2zVI6xl63isM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:34:35 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319%3]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 06:34:35 +0000
Message-ID: <3521d78b-c7d6-47d3-8439-6391036aa7fb@amd.com>
Date: Wed, 27 Dec 2023 12:04:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc: Sanket.Goswami@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20231226082002.1778545-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20231226082002.1778545-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: bf498cd0-037d-40ae-d532-08dc06a5e433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jTfyfvw0HEN8vpnUyU4hh7vFcdPt9O5jC6KOHx3v/CgKkGZAZFOTd4PDR8o/ROZ8W+0YkYEYu2PxuNGid+HoJhdDbk6KUjNRw3Ff38pzoNWtpPMiYwHTmf2Qm6EJzw2r/JHZ64VqE1udzAltpLl1FQ4/TehssRr2XR2K1TskUyIw9ix4f7L+JE/ml+4nkT5ocXQQaQyh2D89YQAH33oWsoZb10jnkSAzAnjPvdLbbewmdKdxpQIVk6/Hv4DE1gDn6UtgXKteHq+mc7rZ2MfFpsl4QGeWFREyMl5dnMrYg3Yt1mv/9tB6KKCodZJHdeAAWKXK16bjkr3L3n57m2geJztffioENPh+Q8dqyiKNcxC4dGA+DjOKRnmIEvvKOxpDU2chHTfrbfQXSgNR3j5qY5kGPW8PctF2i3GWOGIsmUoU/cIh67yHB4RoIp/L0uYmmBrJZ33XAfhHrPTyF92nuBnDEVdFgizTJ8pgJdN0e9oCo4yAW3eaLt+pdYF8qL/DIbsLDP1Qa5U4uYyH4wPN7ZoPOna5PHUIvxFWlohux58XVkm+wkdk4rNKn0aM32rbqVuDQrYZ3/JShER9joyCiLc4hH4kz26iF4kT/uIhf9KM8XLZ+DC3s7IrhfT/wQH670vstTQE0bq5P2IYHS1T2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(31686004)(6512007)(6666004)(6506007)(53546011)(66946007)(66556008)(66476007)(6486002)(86362001)(31696002)(38100700002)(26005)(83380400001)(2616005)(41300700001)(4744005)(5660300002)(2906002)(15650500001)(478600001)(8936002)(4326008)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9XN3hvSmdObkxQU2pVZHpsd2lqM2U0amczUVR0S3c5Y1FLbXFnall0TGM3?=
 =?utf-8?B?MU9oTkY1QzlxMlczSi9WM0JvVWF5ZGtTLzY3d2s0WnRVbktySnZHMEhQSklT?=
 =?utf-8?B?bElSVExKdXlKOS94cVBQbXZMZVFZQnRrM0JsZnh5K3BYU1NHdVNpTVc1b2FV?=
 =?utf-8?B?dEdRNk5QZFVhUW0xN1BoY2RYRnNoZCtQbnNOV3VsUUVycTMvWVJ3b0prUG5E?=
 =?utf-8?B?MFUvdnhveVlDUDBlcmt3Q1FGaS9yc2xuSkRWUDFWcDRjNzNNV054S29nOGFj?=
 =?utf-8?B?RU00dGk1eUNoN1VCSitab3JUTUpvVXNZcVBPb2dNaTFmVVFkZGRza1FBbHFi?=
 =?utf-8?B?d0V1UjRWZytIaHQ3NmIvcDN2R3NHVldLVHJWYU5hQjlMV2Y0V1ZxNEx6MEN0?=
 =?utf-8?B?RVpCTGhIaklLY1YrQm1BTHdzays1azNkTEpCQmliaXZzOHUzYzdaZHZwcndG?=
 =?utf-8?B?R3VCOTlOL3RvRGJ2aGcxaWlyQnFOOEEvaXhkNlhlSEhUQmoyd1J2MXJENGxD?=
 =?utf-8?B?UndXTk1VNUpLbm1LVWZQT2pQdUo3VFNnMzFQL0VoeEZVT01xclI4RmZRSGJD?=
 =?utf-8?B?VUNaa3Bsa1hTVHhDckh6RHd2RGZkVEUwOUEwVStyRWp4SjhYUm1DUXRvVlJW?=
 =?utf-8?B?MzVUTzVNQmlyRTN0RmJocjJsM0plOUN1L3M2V0ljeTVFQjkzYlBPeXZDMmEv?=
 =?utf-8?B?RWRvQ3JSYXFtbnpDTGVlbE9sTktzd3NDdnRYbnhSdWNsM1RlV2RpdjlLb3c0?=
 =?utf-8?B?U3F1M3VJMnQrYlNkRUpSTDMveDlUMHZZU2kwQTJGVm1EYW5iaHpsQ0R6WkFV?=
 =?utf-8?B?K3J4ODIyZkJZMklibkcydExNTW9GSTcvRWF4MmRtYlhsbTkrb1RyaUR3UDQy?=
 =?utf-8?B?ckFFOE9ocE81UUhndlRnaGtxK0xLWkxEVjk2R2xiL0xXbnVQTFVvMUVDVURJ?=
 =?utf-8?B?eWZ0VUFDdjVnSTE1RWJxRUlaVGNrWmR6TWM1QVdDWW1QSEl0TlNJV2o4RVJs?=
 =?utf-8?B?WlEyamZUN3dOSTlnMU1ZUnFYZjZ2RDloZkhFS2JpcklqRFVybFZDTTRVcGFk?=
 =?utf-8?B?K3pBMUlhRjY0SWdUV2ZXaHAweDIvcXFWaXhhQXY1TUQyNjFIampBV1hBc1pt?=
 =?utf-8?B?ZlAyaDRwc2VCSXEvOXRQL0NFZ09OeFA4WlZTRXo4eXVVa2FEU0RvaUUrL3d1?=
 =?utf-8?B?Z21Cc2dqSmZvMzJydDQ3eTAzWUdyUFo5YnVlbnBTKzV1bU9OVXNvVnVEemc5?=
 =?utf-8?B?Y2xRWklKZmRMMVZXK0lUbm1CSTJPaGFiZEY0K2tVLzNvbGs4TURXN29kUzJi?=
 =?utf-8?B?aXg4Q3NnZXE1TWJnRUpKdkFBcWVJS0ZndThaOU16TEJlZC9nZ21naVM3ejV4?=
 =?utf-8?B?OWxNR0tEeDRsZGNkcSsyY0ZtQW5JWTlEWHBkMGh3OENRelkybDZIR0EwZTZS?=
 =?utf-8?B?Rm9QaDR4YTdndHh3ZGxjRnV3OTRHZXFhalFVdHRuRkhPVUhnNzdDWC82OXZB?=
 =?utf-8?B?aEFXYStZSGlmREhyV1ZiOTg3RzVVeTV1SFVLUnpZK2JXWXBQV1I2YldtSE1E?=
 =?utf-8?B?YW5URjJocU5QMDkzeHJlbjZGTXlzM2IwMmtPWEp2TEo3aUtlRVVEYUl3VXAy?=
 =?utf-8?B?RUo1MkgxR0JBL1FyUnVaTFgxUlpBWnhlTi9MMGl3VEdDOE5lWlcvUUdsV2dH?=
 =?utf-8?B?QjJaNzNOTXd6NExiZkliS1JKbThVU3luampVS1hPbWk2WkVqVWNJMnBUUXpw?=
 =?utf-8?B?QlZpdEdlTEVsLzhOOXdaSE1OeHM4RTJqbVprRnVyVzdzRTFMd1ViVGVicXkv?=
 =?utf-8?B?bnZQSm5yRjhNaStVcStiQm9QSTFXSkNia1ZxWlI1RUpaZUpLcGhWbHppM2Np?=
 =?utf-8?B?VmxGUHMwR3NGSndmL3dwRXZ0MUw2ZW14NVNTOEl6eEVRMCthSWRjRTBNWjFt?=
 =?utf-8?B?NU1ld2dZc2RWQjV3ZTZOaXNEb05kNk5nNE9lR3dlYlMyNTIrRlpQTkVvZVZ1?=
 =?utf-8?B?Q2h4NmdoZU5reU5FZDlqQ0JHZ284VUY0dUJndm1nLzRzM01tMDZ6V3F5U3Jq?=
 =?utf-8?B?QXpxOEJzd1pNUTZ3YU42QlI1cm8rclNlM2xzcWEzcXZwbDNPMTRia3ZYZzZF?=
 =?utf-8?Q?iqoyNnLmNCnKvaZu7UQBAULEX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf498cd0-037d-40ae-d532-08dc06a5e433
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:34:35.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijJ0u99skCZO5uqbINw9oLgqgQOF6OKkR4ofqFUpmrdzDd0fq60WXov7oY1DLce3wJ62N9qzdDKZaMSAvLNUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637

Hi All,

Please ignore this series. I will do a patch resend again.

On 12/26/2023 1:49 PM, Shyam Sundar S K wrote:
> This series is focused on adding support for AMD family 20h series (or 

In the entire series, I should have mentioned the family series as
"1Ah" but mentioned it as "20h", which is incorrect.

Thanks,
Shyam

> with platforms that support AMDI000A) that adds support for s2idle, VPE
> IP block information, STB and idlemask.
> 
> Shyam Sundar S K (6):
>   platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
>   platform/x86/amd/pmc: Add VPE information for AMDI000A platform
>   platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
>   platform/x86/amd/pmc: Add idlemask support for 20h family
>   platform/x86/amd/pmc: Add 20h family series to STB support list
>   platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
