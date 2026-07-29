Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1033C3C19;
	Wed, 29 Jul 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360954; cv=fail; b=TEh95bWI40hH39zq3klNZDIKWSHMpMAdvakvax/fo+tsnEq5MNKx0as1S1+kBxAd4rSkutY3y6ERzNQwIj1dt92p8VJfv8xi46kinGvZ1o9/Sksc1uczmmqhS3ObhIQ1TjJOu1N8Q1uafEtB2Ykg4VP50JIp6P5d7iMWZLjl7o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360954; c=relaxed/simple;
	bh=e/Jo0HQH7SQDUwcFHYaNOt+jtm8i5NCZFEE1+yxd4D4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pC/qFtltxIa6pSKmGboO8gNNkLihV7szTDHFwsLLNHIIGORt/aZPai8mvZ91aLmyEKLSAzfNBbmcmciQbsDFnicf03/56WRluj6D9O1PHYUsa3ccZ2LTB6VFARWVfSGzFOGYbNBSqUZv29blmeQ+SDVCLAWDjkPev9sTIJs/hSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1Jty0n5k; arc=fail smtp.client-ip=52.101.57.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1Jty0n5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9PXnUnrSMef2k1YLMUGzS1VV8dIKvElxwLytUZaYhGLaQ7iXGfb/cZflB9I1olpLg4Tg1iMd+U9+12Rim/K175cIAtOYy6j6VnC/pVRyqCVWeYORLiIaoarC7Eqz2Z2gk80SynujyzxvRDqfTcueCRRYqkxtiuAdmfVqByZalX17rp7lQV1mcwfrptBh5fW6kiFutzbh2SOfR8TIa8AWj/v4AbPhax6Zz8JlQA+1QUqZ1tUo9ZJGsWGcwMAYbu5Kweai7mEVXh7nGloaVrvvsZ84qdTjvRH2EDQ/fPs4gf+in0wSJok/IFolaG28LU/07QzGXB2sGR9JQJKE2pGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaOrmPE9H1lDFf7L44l4AEdr7C7FTWre6dzRoOYfq70=;
 b=dE5lHRga26UlIGR/4XpzZDZh3SyMNEx6iEEwQuBrWdGYPQc2PvdTdCHByrht+zynhSYm/FE3FKlVKDNe8+8T/FXliKYU3KMudh5NViEAZbqfwfxWoE+BrMAXwGxumYhvW8Z2kXo713nHS+kW6nTcF+GlD/QrJcYqNp0zBu+mh1161jCI/2H1MU2P5DDuHrjY0GPe0+Lujl/3rd9QEeMuWkf856zsH0TeulkqibmjaswdrVOMJzGqBa50hj8yKZg3AXQI3BzWBAfxW91P8wUjq6dprCzlsmOz+v+PvK7l3oKaLLmGfcSqdCqNDoXnARsZkOWOw65IrE/DfiSQCuTJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaOrmPE9H1lDFf7L44l4AEdr7C7FTWre6dzRoOYfq70=;
 b=1Jty0n5kxv2RvcQhYYISkZvaX5qa2RGRFzyvkurj5lHB5KVriEAJKlqxoF6rFZHeNn4Y7+m1LJzLZTQJgmYk9eSOe9qsKiDZ6q5ZfAQfq8/Bg8YstzbccZ8+j/VaZDEBGRi2D188z60pV50nT6AMIPsb/QEkvZ+IaniWQxdex9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:35:48 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:35:48 +0000
Message-ID: <5348d035-b263-49d3-9067-264cdb4163ab@amd.com>
Date: Wed, 29 Jul 2026 16:35:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] platform/x86/amd/hsmp: Leave the hwmon power sensors
 off on client platforms
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-5-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260729164034.1331375-5-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0209.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::34) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: b918d7a3-08d6-4fab-c3be-08deedb95ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JAYKHple1+idCOgM1k0TPqn/KD2riQqDEyiqKrLfnNA9bt4ZoACCJ1s1ANt73SJ5vjx5u5PAlpwcF9hA/bL/N6lXw6InrOT2h8hw+zsdymx3ouYvjvoiepZghOpQkWaOehS3wvpHTKCyOAa5n80daONUBcWDvlS0OD+iD/KEcdQFh+glJwijFB+SnuDQth0og/SmUeWr8AED39ahGGxcY4yT3W63eGt0F6b5kSWnD5FRFP2XV2L0R7HlbZ98XFu2kn7FP5dvTOolof7Hp+B2pMCCulejGY9d5pz86JxrKNbuDsOl0gOZTnUic80SlBnU3P29wyKcs1SF/gkiHQXFMIbFYMYmkroimRBrg4gJkx/cyVx6bzjty6OLL/siJBwthz7Avtkg2yefT5fX/t+0qnUEKAu2znLh5do3Kw2jHRS8s/XHJz4zYoCY6G7K0bWeK9vIDK9fk7noazxRvj4w540Y5F1dfltt08J35BjMuG02uxMD0tFjOwLYSt2mSa87TUQqI77KAfBUQ7vIlwEpW86fRI8xrAtvvLrj2me7LaALoeB0A1RoUlCJ7K7R6bX3pbm8AU/nU+5FYu692DoEV9us0cuDS4PdEVRIi07c5HBAtmZV97HXwGfWsQAIFplmemqbXOB5u9NvkuNkga6dRGnK3vRN6gBcFGrf6Cvnlfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERmTWJsenp6S2NuNmlZbFFiaWpmQ01ubGZ3RzYrSFZTdGpoY3RveFQwRldv?=
 =?utf-8?B?SEFSWG92NWNWSlFMVUtYYnhLQlByZEtONmpiSUFUU1JHY3ZRRlhGbnV6VEE5?=
 =?utf-8?B?THp1U3JHRi9zNlM1MFBiU0pVSCt5ekswckJuTlE0NGExaTA0bzk2bW1VN2tt?=
 =?utf-8?B?V2NGVWZDZTd0M1hmQmxUSkg5T0dRbmtLNCtKcWVmUHNYU2hsU0g0ZGY0L04v?=
 =?utf-8?B?bFdIYzlYcEFGVVQ0RFZMMTVZZFpkRFJYUHZNOG01NWVYQWE0akFUdlUyVXQx?=
 =?utf-8?B?YzAvaDZYaDd5eEJqeXV6dk9wUFc0QjFQaWpjSHR0d292NXEvc3N3Z1NZS1JZ?=
 =?utf-8?B?Q2g3VnlQT2YwOWE2V3lBbHE5UEZhWkhJNWg4T2lkL1BIQUQzVVFnckZJMjdh?=
 =?utf-8?B?VGpOUnlnTStxT3NJZHBRWWlZc2hhZXJyWGgrTXJpbkI3dXNOWEtSbzc0WXQ5?=
 =?utf-8?B?UGdCUTJoc3ZPcFhXZHZQZlg1SnNPUHNKbzJoUHdGdmhoVm1kK3JWK3BZLzhR?=
 =?utf-8?B?eXZFYjhTdUZkSHA4cWVtZlc1NE9jaXdnQ3BGV2NFMG8rQVpPT25uK1ArNnpr?=
 =?utf-8?B?cE9FV0FqSUtrMTM1NHhKaXZROUhoRWRGOWVwcWJZUTkwRWx4NUsvOGlBZ0ZW?=
 =?utf-8?B?WURDM2p5UEVGb3RSWnpGSHJ2VUVqYU9sUk5VZFFLYkNKbnJTVmNzNDEvc21J?=
 =?utf-8?B?UkFvQlMxazdWbXppTEwyWGhYWEY3WFBjcU1NbVdZQjAyYXBhWllQUTNRRk9u?=
 =?utf-8?B?YzJremhnVlZYSThSQ2Y2cDhKbEVFOE92NFFKQy9vckY4VTcxdzUxb0h2Y0lt?=
 =?utf-8?B?dmxELzBSVG5tSW12d28zZ3JMN0M1VzdMSzQrZGlvQTJlUDlqN1B0NkNKZzNl?=
 =?utf-8?B?eWdIclZIMFRKa3pnc3ZMNFI0TmRuL0pmZkgreFExeVJybE1MZmRNZW1Wb25q?=
 =?utf-8?B?YW1ZYjVoZStHMUdWNkZLeGY3SlZaRHd3dGFNL2pDb0N2TjJrWVBDNUs1YzM1?=
 =?utf-8?B?and5UlpDbTErMWIvK0UwbU9NdHpmdGlzSE5vVCsrckNKZFgzdHZvc1JlVGl6?=
 =?utf-8?B?RG5FakV0SnJXV21IMjQwOE9HTW91UHBGNVgvQjd4Yi9nQktOanozQzl3bXlW?=
 =?utf-8?B?SUZ1NWd5MTFNSFQrRXlOdmliK3RjQ2lCaitDLzJpN1hYWUpJUW1NTTZUeE9J?=
 =?utf-8?B?bzR3TXpKNDh4a2cxbkNST0xsM0Z6YnQzYkhwY3RWRExJaklEdEI5Q1RyK2RT?=
 =?utf-8?B?c1ZtMWZjR3FvK2xwR2VIaHkramYxdVpKYnY4WnRiQ0dlUHdyOGplZnVEQTVU?=
 =?utf-8?B?N1czMCs2YTRCMnZTdXJDZDZjTUptbzU4WDNXMTlBVktaVkFROWxVd2REdXBF?=
 =?utf-8?B?bnFkMUZVeDlzRC9JRUJvL1AwMGdkc3IxSDFsaE5XS1g5TUJkVnNZWWtXK3ZV?=
 =?utf-8?B?d1VuUVYvOVN4aU9VZWpLeDVtNzkxRzU4WFN0d3I1TjdTeWZwZERCQXVtV2Na?=
 =?utf-8?B?cUIwV09RTXRURkROTytaOXMzcW9leUFmQm1tdng0MWxoT3c4U2U3YTdiWW92?=
 =?utf-8?B?TlZuN21Ia1ppR1I3a2ltN2dSc012Y0wxKzhpalZpbkJrTzArNFVGRnVNOTNF?=
 =?utf-8?B?TVN5Z1YxY2EwNlplak85dmVIQmdTS1VBdzYvV2s2QjN5M1I2RUlrZDBodVZt?=
 =?utf-8?B?cWdFbWNwb0lUR05Cc2R0OWZuOGhxUkpGczdEN280WU0rUDZFSER5ZUpGV3Vt?=
 =?utf-8?B?a2JRVWpNWitHVGNMc3VEOTBWaVNPWHlMS2FyUEpiMXE0UktqaDd2TXptQ2Y5?=
 =?utf-8?B?aEpzTjNLNTFpZ1FYUVJtZ2UxRVpxTmtpRlBsUUhrdjZpL2c0VFhSZDIrMUdt?=
 =?utf-8?B?bFo5WW9jb0MzeHRuK3ZMenZPZENidzgzVjhmMURxVllMZFQxYTU1VWpJWDB5?=
 =?utf-8?B?bzcraEVDZURmS0k5VGQ5RFNnN2YxSFVhZHNDMmg0VDhOWHRZM1FqdWNHUzUv?=
 =?utf-8?B?WHRIUjVwQm9XR2pjMXdVWjNkOGpCVUdUN0VtWVJudGliZlpjZEpDTDY4VDhl?=
 =?utf-8?B?dTJKRDBTQU5jWFRScnZaeXlWcWIwd0ZZMGVJWkh6Vit6WkllczF0RHpwWitx?=
 =?utf-8?B?Rzc1cjJqbGsyVjNhTVhHZzRYNnY0amJNczJmMEVXTERrZXlVM3M0azJCUkxh?=
 =?utf-8?B?UFZjczc0MjZ6TTJzUUluM3RVT1MyRzFvU3ZkbmRJRlVWUG9yZzBHNkQ1RzVn?=
 =?utf-8?B?VkgxanM2YVNsSk8yNks3V1Yxd1JUaWpyZ3VSaUt3ZE5tVk1lODY1Yi9XU0Rh?=
 =?utf-8?B?emxRazZKRmZKQVlGaEF4M0VKZnFoZXQ5bU12YUljeFA1cGw4WXZ6UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b918d7a3-08d6-4fab-c3be-08deedb95ac5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:35:48.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ3rZQWGypnBHf2CtnI0Q3lI6Cm8/tr7Dt5253Ofa1IQcUhOEtnJi0rrZLXvTD5rKP/NJnXpEzJmaRsWgL/Xlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056



On 7/29/26 11:40, Muralidhara M K wrote:
> hwmon.c issues the server power message IDs unconditionally, so on the
> Family 1Ah client platforms the sensors address whatever the Ryzen
> Master SMC set puts at those numbers:
> 
> 	power1_input	04h	HSMP_CLIENT_GET_METRICS_TABLE_VER
> 	power1_cap	06h	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR
> 
> Both match the num_args and response_sz that the sensors ask for, so
> validate_message() accepts them and the two files report a metrics-table
> version and the low half of a DRAM address as microwatts.
> 
> The other two accesses are already rejected, as they land on a client
> message taking a different num_args: power1_cap_max on 07h
> (HSMP_CLIENT_SET_CORE_PSM_MARGIN) and the power1_cap write path, which
> sends HSMP_SET_SOCKET_POWER_LIMIT on 05h
> (HSMP_CLIENT_GET_METRICS_TABLE). No unintended firmware write is
> possible either way.
> 
> The client message set has no power telemetry to report instead

Is that right?  I thought the metrics table has accumulator values.

Which brings me to my next question - where is the format of the metrics 
table declared?

It's probably (but not guaranteed) the same metrics table format used in 
PMF.  IE this:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-ilpo-next&id=641b41a7a12537f8898b1e14c62e0d85a8b872c2

But if userspace does and HSMP message to get the metrics table I think 
we need a kernel header that shows them how to decode the structure.

> , so gate
> the registration on the platform in both drivers rather than teach
> hwmon.c two message sets. Server behaviour is unchanged.
> 
> The ACPI sysfs attributes are left alone. They are hardcoded to server
> message IDs too, but on the client each one is either meaningful or
> rejected: 02h and 03h are the SMU and interface version queries in both
> message sets, and the num_args and response_sz checks in
> validate_message() reject the rest, including every ID that lands on a
> client SET.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++++++++---
>   drivers/platform/x86/amd/hsmp/plat.c | 15 +++++++++++----
>   2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index bbf2b9a8a408..57758df9d353 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -670,9 +670,16 @@ static int init_acpi(struct device *dev)
>   			dev_info(dev, "Failed to init metric table\n");
>   	}
>   
> -	ret = hsmp_create_sensor(dev, sock_ind);
> -	if (ret)
> -		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +	/*
> +	 * The hwmon power messages are numbered as metric table queries in the
> +	 * client message set, so the sensors would report those responses as
> +	 * power readings.  Leave them off there, as plat.c does.
> +	 */
> +	if (!is_client_platform()) {
> +		ret = hsmp_create_sensor(dev, sock_ind);
> +		if (ret)
> +			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +	}
>   
>   	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
>   
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index bc29b0ec18f7..17877e25f43e 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -196,10 +196,17 @@ static int init_platform_device(struct device *dev)
>   				dev_info(dev, "Failed to init metric table\n");
>   		}
>   
> -		/* Register with hwmon interface for reporting power */
> -		ret = hsmp_create_sensor(dev, i);
> -		if (ret)
> -			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +		/*
> +		 * Register with hwmon interface for reporting power.  Skipped
> +		 * on the client, where the power messages the sensors issue
> +		 * are numbered as metric table queries and would report those
> +		 * responses as power readings.
> +		 */
> +		if (!is_client_platform()) {
> +			ret = hsmp_create_sensor(dev, i);
> +			if (ret)
> +				dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
> +		}
>   	}
>   
>   	return 0;

