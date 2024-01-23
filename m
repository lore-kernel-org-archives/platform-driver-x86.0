Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C25F54F
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026347; cv=fail; b=fhQvFnlD/17LGuqilCsve1jCOr+Sim5oWv4ZBxV1eCSJEdSJ1pWBMJHYiMOtY1pMph8j7gF5/TEoclP6SpEonNWM8kP3h2+Lr7xZw9v5NalHCDI1D+QH+x+RH2vEHlTGJeQXr/rKs+XfD9Fe2y3tdykoFhrxwwlxpyc0Cls0Zdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026347; c=relaxed/simple;
	bh=wlMI8r18mr1vSsskdfNhJrvUQAfmXupakGhZ8fRWmZM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZttC7Ov6O2li8BC/RFvjwpSgXexXStMom086HvHGzbv7pc94EJccfYPkD2wOU00mLdy9qRrHN4/3L6PtDD5FG+/1+5nHZrZXCAnJmMe9y30Svex6RKAOLmlB38Zhwan0PmSvf4/uZxRLiun6awx0rQykSts/kSfM2ilhvXY40Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TqeC1qL9; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TqeC1qL9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjiOOwQ/6sfbMjqUlBI/qyzTKPumYyMPWoDkyBonwhrVySLkjQC9ULIV0No7sQmKyHHMPXd4HNYjHo4PXya/08v3l7ITx36eF8ibYwZSoZytemP1/njRGhrudYsRQ8031pwVShUcB8x9geevr5tWUTKN1ml+hTshcNGfNUWLKRphhniaYbjruVioi6LTphialkVufJdtYCkL525QyF60lUpI/iDh/2ws3J5mzw7WxENWUHyCIhpq/4sv9ddTlPYbtXzORXYPlpJgNCCX+QNzxePQ08rKno272vZjAFBTatt6r3t+kDE5VIEtQmbTtfxu19LZKn4GdrUB1YAxn38Fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIPEyFjtO6k9qDAeCPAf51v01i6c6MV/OLm9NaPXk24=;
 b=T47mHd7foxIKON4j8Q7du1saxdJwvpRlISu8HleP1JGC2dED5Gw0iTBQ2WgRgjYOegjC7BMiwesSLbPuqD+fZf9VTPoj9cXOGlTDpEKI44EalkCVxPW0+rZzEiswnGWZo0858FDlONF9rkHhiqSEZdzKhawndcvnhnNhrYtvGaOBFr1YKhTSQbqD0JvUO45Yk6cTFmV3rNzWru2ZVEaroO5/+EZX4kXPhyn+Nfo0pEVb1v2TJapVNzCLXJvOAYeGZsFqolgRAqiAMdGCbLvHUbFgqiACovOjvGceV5iQldRSrG5F/Gojlt6zjvuGyruAkYZ5jRuIPY38/hjxg5OGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIPEyFjtO6k9qDAeCPAf51v01i6c6MV/OLm9NaPXk24=;
 b=TqeC1qL9+zwhn8Y6qvVLvUMhxdHjSbChNT+Zn8zzPIk1fsY5E0N7lxKxBX5o78MV5ZtpZ82Nsqjz+bbPf0ep+KAH5xmScWw9SwTHvKcdS+mgwKZ+eB/DhNTiAX8H+Sm3442Ar6Jkw60e3gHElmvvcsKzYC2C/idgvsJs4sWX+1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 16:12:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 16:12:23 +0000
Message-ID: <5e6297c1-2b22-4b85-8c70-a488c7a243f5@amd.com>
Date: Tue, 23 Jan 2024 10:12:22 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Get Human presence information
 from AMD SFH driver
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
 <20240123141458.3715211-2-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240123141458.3715211-2-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60993b7c-02e4-4215-55ca-08dc1c2e154d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G2Pgtu3L3mwKWwviOrsVWTGRY7hjrPYW42va6hUovRN/npr5botfk3tuqH/bUasbUs2XFxVdpjBUcH6Mmk3wkVPTrskL2vumKs2nTttNn4dFg+TtWTCTv7hXgkuzOiThu42UCkae+bvTeWTVmELQ9sOLjUIdC6IYg16uWz8oqGRv5QvQsfRuQ2jtlFdBkHzzKCR/XBkWNWYRghfUjMItigI879cE6hUEjcOhoRhcli+iUvhFQTGUPs+jJcoeClSmNmAOa/g+MG5jweu9aUe+T87sfy1dW5L+dOd+vi3JHgxHDQWhPn8f6rS7vDWNN01IAoS5mr+81XKX3316ch8DAFz2YL2YFX1vW2hBdJ2ythC67X6J+dPjM5GDxPXzqfx+Mg7un1lUQ2ywYqa1OJ4EZJ/LRRHS2eWM7RWuDl7Oq57MOJiCGBe+F/iOf6xVCkfxurRb5aW/NKRshkMLXt5tyz6UgNBWK9juGjdZXqRDKiN1OIJWtOoXmaj43tyrePQrg2ktVh8/DRDQd3isBsilwhPIkKKDEGTHFWtPh7IfiRamIXh+j9tps74zdVhDh3yKxE+4JsMIlKJmP1o9BOTp2a30KK6Ne5hTIx4xVB6XUnijWX9VSLm8l6L03cEzPTBfk2Nk388okMaqucwcrJfl7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(6486002)(478600001)(26005)(31686004)(2616005)(6512007)(38100700002)(5660300002)(316002)(36756003)(2906002)(31696002)(66476007)(86362001)(44832011)(8936002)(8676002)(66556008)(66946007)(41300700001)(4326008)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDgrall5OU9HamYvVFRCTWpvTUh0MXE0ZTRaVzhxc3k2d0VKNjZwMS9tK04w?=
 =?utf-8?B?bmNaV29LU0t6TlVLajFWbDZqd0FPZnQ5VHFZZjl2V0dNN3A5WEhZYVFrQ1VU?=
 =?utf-8?B?Njk3bnF4MUNFUXpQckxLTFA4dlYwbHV6azFib0J5S2JCV2I3c1lGU2ZJZGl3?=
 =?utf-8?B?VEVPeEs2NGdzUUJwSTdQOU13cldPTUxWd29wN2xJci9uZHZSUkFQdjdEOURu?=
 =?utf-8?B?NzBNT2MxUEZWLzRZYW5QSWlOTEpGL3YrR25NQ3drNHVnaEk5cFNRQWRUcHpE?=
 =?utf-8?B?SlJZRUVacU9pQlFqSW5EdnZkMEtFZHJjZStvMHBVSFhUNEpNVDZVWVg5UFJI?=
 =?utf-8?B?czhkekF3WjNwdm5NRU1sNXdWNDNMOExFa3dCa0R5T3FrL3RINzFaQzV2Z0Yr?=
 =?utf-8?B?akxnN0NqTnBSZzdaQVkrdFpMc3A3a0E1SGRiNDd2Q0RFcm44blNEanJpRzJj?=
 =?utf-8?B?dmxtOGU5TjNkeXJHV085V2FUOTRUNDBzOWVNS1UyV3d6SlFsclNLbjVOU2I0?=
 =?utf-8?B?NDUxcjlsbjdtREQyZXdiWXdQRUZEOUlHOTI0bTR2TUpLcUtNZ2MwTXVqY0to?=
 =?utf-8?B?enUrbUJDdEE0SUVGWGxCTlVQeWZnTTdoeEYwMXVobmQzNExydEVCZU81WHlr?=
 =?utf-8?B?VDVCUTNiYys3WmNkQ2ZOL0pSc2lvYkpkR3ZwY1BiWE1nOUhsRU82VEN0NUNs?=
 =?utf-8?B?NzBDcXBWRXQ2S1U1blBiTGRtcVEyM0lQcXVJS0lweHJ0aGNBK2tvQTVRR1dC?=
 =?utf-8?B?OG0rVnBrVENPR1pnckxYRnNOOEozYWF1RHdKK29QZlByK2crWnpCOTVCTVN1?=
 =?utf-8?B?NUJIcVR2S2hjM3FuZzNwUFV4MjFta2Q0OXlKUEhPWitxbTVyOHA2L24wSkFI?=
 =?utf-8?B?K2VCTWpEdTR6dE5BSEt2TXloRThwRVlqV0VsTTlSWnRLR1RXVWlIN1RJSEpB?=
 =?utf-8?B?MEU1OU5TanlQZk1oRm5wTEVsbVVCcHE0TFZYRkVyWXU4cWNoNmx6VWZ1MWxY?=
 =?utf-8?B?UzZlWnNldm1aR1VIQ1phelEvcXN4NTBpaFlreFNzc0s5OWxxR0JXbzBLZnMz?=
 =?utf-8?B?R21UNWYwdHo4NzZ0emQ3ZUdvenc1a3hrSFJnTmlCUHRNMFRLZWRJdWVJeUhp?=
 =?utf-8?B?cmNnRG1zb0hJR1VVbzV3dVlRMFlldjVlTTRxZ1ZQL1R1QUlKUU1kaU95YUJX?=
 =?utf-8?B?anZIWXUwcmhBMG51cnNvZEF4cWZ0QTFzSDlTRDViRGtXTTVRNE5TYWNSa3Rq?=
 =?utf-8?B?VGNBZmZKcnNBcklJWncwc3YwZFkwWTN2YTg0VWM2UlhTQVgxWTB3WHl0Q1Rw?=
 =?utf-8?B?WHNPNFI0Z0Z5YkVKMTFkSExjM0JBOWFPYTNPakVZVVhST2lDSTZxMHllVTlR?=
 =?utf-8?B?ditRdWtsd0JsOWdpQXF0N1ZOUnpYKzVBWjZEMDdPL1M5aXFEcFVKQW4vRHJj?=
 =?utf-8?B?WU1BYm91TlIrM0xRcmtzZ0NnRkp3T0l6QzVKcW5QNTUvVlRnWXFGYmtJeGdm?=
 =?utf-8?B?SnFzbXNRam5HczFldmtDQkNUZnhoNTJGL1NwU1plOXVWUXUyV0ErM3N1RzRp?=
 =?utf-8?B?aWJlTkh5RWg0MHhrb093ZUh3NjBjVitGaVNQaXV0QmwvTUIyeFRNTGpJY1hk?=
 =?utf-8?B?UmtrVGVpSjFGSEdoM3MwZmpHcll6SFVxUEpkak5tVGNESVBrZkg4YXFRNnBL?=
 =?utf-8?B?UTBwZGpDT2dndjlBWnBnekVQbGtzNDVRUldHakVERDdpQ3ZETkhHcTJxVWhx?=
 =?utf-8?B?OXVPYkRJZGtJRC9HejVrSWpnVHpCaWtCV3VoMXdnOXo5ckhqSDY0YmlyRXAy?=
 =?utf-8?B?eXFUV3YzVk02c01nbHZUSm5NblpINVJ2RVE0b1FJRmRxMXRPMFh1TkFTOEpm?=
 =?utf-8?B?T2ZzOHBMY21sTzdVYkEzNFpWSlQ3S0tUd2lMMXVzWjNsSHhZdXgySlNCUkZh?=
 =?utf-8?B?WG5tdkl1KzNjN2JHY3QrL1Fvd056VHkvaXBBOXV6bitzdjkwS3RNdS9BVW9F?=
 =?utf-8?B?aTdtelJXY1lwRVN1R0FKNE1JajRvOHAvOC9zV29PcmxXakptK0dmYXNwSGkw?=
 =?utf-8?B?Z2VlRmpHZUowekplMEozQmhrRXRTQUVDbWpIQVgyVmcvdHB0SktuTDZTcmNW?=
 =?utf-8?Q?slAPi9dKP0jyYoMIujhw96Xek?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60993b7c-02e4-4215-55ca-08dc1c2e154d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:12:23.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ysb9HWAdW09qygeVsejLjsgcVYkCF3bm30dBSAJXqryDguiiIMbGH0DGG+IIfOu8nViWVu8j9EUmkLOuR/Hhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

On 1/23/2024 08:14, Shyam Sundar S K wrote:
> AMD SFH driver has APIs defined to export the ambient light information;
> use this within the PMF driver to send inputs to the PMF TA, so that PMF
> driver can enact to the actions coming from the TA.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/spc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 87ae7c41c9f8..a3dec14c3004 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -46,6 +46,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>   	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
> +	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -154,6 +155,13 @@ static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   	struct amd_sfh_info sfh_info;
>   	int ret;
>   
> +	/* Get ALS data */
> +	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
> +	if (!ret)
> +		in->ev_info.ambient_light = sfh_info.ambient_light;
> +	else
> +		return ret;
> +
>   	/* get HPD data */
>   	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
>   	if (ret)

