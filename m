Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA75F54F
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026342; cv=fail; b=mz16AdxeYEja4kgCb3p8tdSdvmIdxGSlIEakKTh95hvsNrgyg7tOhkuKXQx424tJ2AQnDYZSKXCO9kW52WAOLM10Ja5Xfso253R3oXZtIpir6B7I+hgwQiYwT9VO6vR5YeTx/lambbL98YqmCdQsIikBXwExYnNuv0G4IL6BJyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026342; c=relaxed/simple;
	bh=PQbDhiWfPALGRX6bcX0+vQdPrxqqijuu05wcAT79xRg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MeNRX9tMwUYjdjaAP4vVCxFfjrhrdlHiwHY/9CINTKoPnM7K34B+7Z3wEpSbZ417n3hHY6Uq6ZF8Pr5r4Rk1QGqgydYPRiz2PBQeWs2KMA59wsd+HjSe1bp8LZYoZVoGCaz7IiR6CNShrA5J6p+jnnNeOJdbg+N5PdZC9wFF2m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jN1R7QKF; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jN1R7QKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHNhetHoTfDQ/t6lDDc+vFawiwMuDtGWU/GA4vURLpeFbGU2Osln+hBtjXZhZ/ZjkyOnj/uKQq6hCug/Ggnf5xw6iW4lQD3+JA8hw9/pU+dtq9RbxmAMz6B1Pv1TqOd4VGDu0MN+Zc2NDxQEItFMgI3joTfVYFCG8pmCKPSnH7zkHZbUSVyUxxuFwVKznM3JcFDfLSeg7vhcuHJvF5C8ZhVJlAYsN9MiUhdrZJOOd0wcbv7jiPN9c/h+plLPwgC0VmPSKaQWMLaza4+Rs0O7mucTrBjb5WG6FDh2rbk4cqvweqTzmDMosYtzf+6dx+xpWftJVdLSr6Pr2j5LhgM8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d/Qx36WOBMLYa01Y0O4ff8TI3QQm32gTZiFONam6Uc=;
 b=H/o17mRne3+ecdPPdY10mKcdPtnEe7p6+pMVZDIaPJwQ4GErhX70tBx3fKzbgpLDrFbEGozC/BV9JgvTshReeOriI3LPM72UUfZzMKhWGdbJyHgcC0zz0rZp97NKiomD2yv5Jiv5FEPcpPDev4W2IzfompMnyIIndph0cN5PyYKsD56Fjbj9JNlHZ9O9asbwcQ+8PWSkpBJzfvw0KqpOQ48UczeKel5FKpSzjLa+LldwXfcStCSzW+w09JW+Zn/q6VCKhXyz5jr/sMU1gOe/QzpP9EV/1c2xsFG2WDY8kkHWuSWP3FoqcqbQaO/K4igZ2gCVlFC6Hb824IIrekb5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d/Qx36WOBMLYa01Y0O4ff8TI3QQm32gTZiFONam6Uc=;
 b=jN1R7QKFVkHdu6VAipod3RH9A8r0PlLG/cuenncPmsubhnvzSw55E0Rzv0/vTB6nlkhaWT+pORdEhUl53UQ3RIzNwhzBF3EsZNxU5CCufh721ri79QVgBrnUw+2230nHqNoNCz+dXLg7jTEIuCZpcAzQcYnwb+T/WaHoZEJMT5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 16:12:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 16:12:16 +0000
Message-ID: <40b5dc1b-0594-46cb-9411-258d47e6566e@amd.com>
Date: Tue, 23 Jan 2024 10:12:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Get Human presence information
 from AMD SFH driver
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 819b20a3-ed52-4e10-37ec-08dc1c2e116c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M96mmlgCsIz6AeQjIeyNz69bfEnlzqVSGwa3kBcGEsPk+Tbq1LAvHECyQDKTXePh3dSg+wM/fV23ZKOJjWuHNRNF4iSqCsL2LE0A05cwuhchbQjvYlQWA+oY/iVJRZLXKug9LiYVf1up3Hox58y9e3Pbk/DkuAqdAY2DZhEJXQjg67cCIO3C0xsV0pMXDwJ6iDtzuQ/7tHmx5A5V3kAfNYzYVjuNNvLb13/krKTvDWYBhXFnaObdKl3YOP+1Qv3DrsoQnB+fCNjlQtIEKZzTI12gFFlrQI5mQqM4CB2lApi23/whPDYXlK14Upc86JvvEXxMb18iY5EE2lBLAsKpUj8BI69pOmqVUNDcVtCYhC07hm7edIuUxtKUB3+BEzbb7euHspjDDlDI44phatG5RJCY4NaU0VOtBxPCfItS328hxoUEDMBDTwAyBlx9E34LTusgr0CW/8PcVgOFo8EnPjIuVTQvGpWgEG7vBkPOV4Tyj+tq2JTYfv6YH4JMDMkARa6/3xGCiZ0vbg/DIJJbyoGPqW5m7cu1nr3oYf15W20cVytYVTOy7DY0xWNWDntMQPEuFt5knLW8tg8Cppv1wW1Sw0oW0xmUnQ9jmheglUyy5w+IoXcCrL3SbP+KKm9K16pXHk7MhI4W8aOj6ZvhWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(6486002)(478600001)(26005)(31686004)(2616005)(6512007)(38100700002)(5660300002)(316002)(36756003)(2906002)(31696002)(66476007)(86362001)(44832011)(8936002)(8676002)(66556008)(66946007)(41300700001)(4326008)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1MxUmVFNW5jRHVOc2dCZ01qWEFPZ3FMS3gxUXU5YVZ2bGRyV2NERUhvMk5B?=
 =?utf-8?B?N0F6YUdPV2dGaWNVWWZqTFZYOXRYdm5POS9aWi9zRlRmd0VYZEVDSVcvWDc3?=
 =?utf-8?B?ejk5MUxVTXRqTlpLaEhNUGhjKyt4RlhVdzJicWd3QVEzOGVWU0RBaHlHSUUv?=
 =?utf-8?B?NGU3RFJQYVZvV0diYmQxUTFlbTFXSVNiL0l2T0NxRkJUT1NrNlprdTF0d3Zo?=
 =?utf-8?B?eFFscStONUR4TzBqSU1XVUNDMHhqMkRJaldxSFl5clVFK2F3TjFyTVlNSVEy?=
 =?utf-8?B?eHVmaEZLak91dkttb2JkdlVNblpzOUUxS0tmWWFRRVBRRGdBdDlLOUd4RlFW?=
 =?utf-8?B?WTB5bU5UckhwMlgyUTduRGFyaHpaY2JWVTJxc3RUTzgxU1ZWM3VBeXdTVGZk?=
 =?utf-8?B?THVKc1cwbTk1eFBvTTZ2U3IyUzZGaGVJdmVBdzd3bDlNS1pIblRvNUxZQnU2?=
 =?utf-8?B?SEovSVFKU3duM2xwcHA0K3hMZVlKUElmamV5bnkraVNLNjJyekdKc0tYRm1h?=
 =?utf-8?B?ak1UNTA2WEZjeDg4TklZR1N3YVhTMXVtdk56aXJzTlI2c0xyRWlWQ042Q2Vx?=
 =?utf-8?B?MnBZRjllQmw0NnlTQ3dRNXlpRExEcFdwMTVBWm1xQVpvN2F2cGxXVU9INUM1?=
 =?utf-8?B?WG9KekUvZUU3VXZqK29FRVNTb1VKUDFlZWZ3WWhlUmFNbUJPMzFKU1Eycnlx?=
 =?utf-8?B?OXpSUTZnRXZ6NDI5V0ptWFhUelRlKzlObjRGUUpldExtU0VwdmxSUjNnQXVy?=
 =?utf-8?B?d2xza1JRdk9KL0s0R29GbDI4K0hDU3JxaG00Q0dvU1JXWlVEZHR3OE9mM09P?=
 =?utf-8?B?K3poVTJFM0lVQlk5YWVhZiswdjVnbXdRUWpMazlZbllhR2FpQ09PZVFpWGti?=
 =?utf-8?B?N1dEemtBMFRDVzRZSVdhSXFMUUdZSEhhaVp3MXZPMUNZVHk3TVNsdklORDRp?=
 =?utf-8?B?NVZYUEcrdE5UcUNxcVdkblpaRXdvRHY2eDdzVGtIUGhpMldsa1k4Q1Y3b2dj?=
 =?utf-8?B?Ry9HSHFVSkw5dGk1ZFdENm83YnREcmE3UkFSNWFNb0NxdStrZkkyRDFQU3l4?=
 =?utf-8?B?eFFoZ0lYL2hNaWpoTmdRZnA3akNNR1VBUGFUdDZWYXNpcG1wV2NnWW9LdDVS?=
 =?utf-8?B?Q2d4aDIxaHJqanhrUzB4R2xpbFZvS1BDVktaSDIrQjhGbzN6c0RFSExuYUFo?=
 =?utf-8?B?T29kczFKdnBnRk9hRlJXNzFJdU1aWnkvODlXSXVPNWVXS1BYS3ZRMkVML3pq?=
 =?utf-8?B?OHUvVHRZa0o4OVRWWUVFUCt4djhheGI2aGFYby9kNVQybnJWcVI3RTBJKzM5?=
 =?utf-8?B?dytXU1E5SitOeDRtLzVBQlRMcDBNMDJkRWJxVjdhekZnVksrYi9LZzZ6N1Jt?=
 =?utf-8?B?MjdKUWtHZWFFVGpNNDR4SGdyRFlLaWQ1UE54K0s4bWkzRlFCTGE0N3Fid2ZU?=
 =?utf-8?B?VFBYT2NvaFN5SkRWcWMvNVErRGFqV0ZIOHNsbVQyWjFJeVBHSGJWa2w0SXp3?=
 =?utf-8?B?OGxzcG1sR0dGUEpyZTNXbm04TGVvZXBadWJTQ2NIZlVSMmxMRTlqZnlaMVE2?=
 =?utf-8?B?VzBnVGRTemlaaFlWSGdOSUE4Z2REOEt6MUF1bmJvYjFXdUNTaWRNQ1NkWVdy?=
 =?utf-8?B?SVdiNmFieGkzQTdRMzdDMWRXdUQwbUFkM0FhWUo2T1gxYTNXazl4dy9jZ0Jj?=
 =?utf-8?B?MnBaY0JCT1BJc0FuUmRXbXA1Qjl4NVJqQ1l1WExWeGx4NkppVzlKMFJJT0h6?=
 =?utf-8?B?RGJnY05Td2xRMUFZM0Nyb3JLRGNRbzBUZEQrTEtxL3FlL21mM1hkeGJyMWFn?=
 =?utf-8?B?YmVjK3ZKY3Joc29UWGh3ekk2UHF0TnhCdEpkbWs0R1NxWkthUlgwT0ZhYzZD?=
 =?utf-8?B?eXdMWWxuZ0Y3ZW9MM3FYUWRndkttVU5vYTVxc29TbWdNdHFmWW9tcllxMnZV?=
 =?utf-8?B?UG1zSjdRQ3pYV29FNTk4anhsc2VnMXErYXdWUXJQSjdCS05uQWM4M2ZXbFdD?=
 =?utf-8?B?NHFwbEtGMTB0U1d1M2lOZ20vNU9mbkFFbUlRRlRMYW96eUgrTXZ4TkY2RDJ5?=
 =?utf-8?B?L2ZvTHF2bU4ydjB1WmlpSitMWGxDSUhpQVJMb1VOdlFTdDNiaDUwbmR3K0Uz?=
 =?utf-8?Q?suDgbtiu1csL2T2WV4Gc/IxI3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819b20a3-ed52-4e10-37ec-08dc1c2e116c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:12:16.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+En9YtExs8UEzV6EdjKz8jPytwZ0irwn/JvSWYegSyKTWWJJKx5CRsmvlai41zDVDY6Q7pP8gQwWFeHXRd2rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

On 1/23/2024 08:14, Shyam Sundar S K wrote:
> AMD SFH driver has APIs defined to export the human presence information;
> use this within the PMF driver to send inputs to the PMF TA, so that PMF
> driver can enact to the actions coming from the TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig |  1 +
>   drivers/platform/x86/amd/pmf/spc.c   | 28 ++++++++++++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f246252bddd8..f4fa8bd8bda8 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>   	depends on AMD_NB
>   	select ACPI_PLATFORM_PROFILE
>   	depends on TEE && AMDTEE
> +	depends on AMD_SFH_HID
>   	help
>   	  This driver provides support for the AMD Platform Management Framework.
>   	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a0423942f771..87ae7c41c9f8 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <acpi/button.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/power_supply.h>
>   #include <linux/units.h>
>   #include "pmf.h"
> @@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>   	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -147,6 +149,31 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   	return 0;
>   }
>   
> +static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +	int ret;
> +
> +	/* get HPD data */
> +	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
> +	if (ret)
> +		return ret;
> +
> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -155,4 +182,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_smu_info(dev, in);
>   	amd_pmf_get_battery_info(dev, in);
>   	amd_pmf_get_slider_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>   }

