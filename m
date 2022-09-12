Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD7ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 14:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiILOBX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 10:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiILOBW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 10:01:22 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A34231EF7
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 07:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWsHP6lEexRufTGw2ogSiq/y2mDkq/4l/C3sswxhpKs7Nk6kK27tuD8xTQObHqvF37/JDbKv/eZ7Dy8ShCmkgRS4avHz9q/LtlbtDg0sL45NRPN2RaswaWlwZo9B4w9cwLtnGLSs9mFDE/A3Le3K5m9R6I74HM0F7qWwVJM1ZBpZr+LPu1DpTSEPIzKfOABQDscnlje5bOrDm42Y/XbZ1dT1ijxBHbSf17ykL5mbv0iRTpojylGKNpl0gWggok8aSg7c7mjdxRh5jX/sDOLaJJk6vMbo5ojqHaLFc6ped8mrsz4c/zspuLBLFpS2Y/NoqtY4gTgXOPlWLQi2zZsaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OFifdenDqM0X8AyNmfgkGuDpOS8RJdsUHuOAKeKuok=;
 b=Ip5TMfZZPhPhoCbc72bOd1/UGFkHPByG2oFC5ROjJwRk+D7NRXc97z7NgjuA7GhFBoESaOmkUlfUCV3qA/xJt0uAQvgb5XR9DiWsKW6396SdwxmoMOSdFyFiUxCjRPy5zVb97jO8lypkkeh+9cLTZgaVzBmkLFc/+Yijg5rjd9E3ffLE5IgmlHNkQa0cJ8kUO5j0FE1MBVqkGHUDgm91nqOkfo4bLRH4TWRZB0MBBYehJSxD6xrxP45OSf4tEDZTOOY1jJQCI4g2iYWcGgtofrUsshStI2kXH4aZ/eBwCT3keE92I9P6dg4i9ypV51Mz4vl5NSs2Pb1Brgbdtcvxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OFifdenDqM0X8AyNmfgkGuDpOS8RJdsUHuOAKeKuok=;
 b=f4iz6N/AD+RgawgPT4sQd9TSoEz68LhW+wa4Pax00Xye4RBMBIee693+gaDflXHrpgY+oxjN636ETUk9tOIFuAfl5XAgnMqYUfk3P6M9X1xBj4ONH30UqvUFAELRH4wIwdpTRsaDtrLKlB7Uu6ivkF9T0neOzCsIpnFe6v1S/hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 14:01:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 14:01:19 +0000
Message-ID: <3bf7a091-5757-a4aa-6492-30ddb4b2cea5@amd.com>
Date:   Mon, 12 Sep 2022 09:01:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:207:3c::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 808b9b82-640c-4873-3e52-08da94c744a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQVuuFQSd4C9J0EWfTYn3KqooBkYtXogjERmvXklakhXB47SZmAZAjaAtKk97hLA9hSsB8yjzBL8SuKTwiogiG6fFXDObnvinXXldfLaNzp0sgJt7ff6u0as6Nj4dX5l2u35g7Unw8zsk2OYofk9N5I9Fq2jQL8hUOZcoRYg4TNbJ/WeOUAWfqOQcGMyQ7ACCxaAl6WPldDsPfKfx1ateQnEpyqNWaOTV/ONLDKyGp9WvjArdOL7MLJUc1lIg73E7MuJH6ZVOgZd0XaYrphqqVxZxxG7ImraKSiKf3qi4OZUrzSaqh8jjXqGpYK4E+c21YzNdXR70qleH2fLEiVBE19FskCI6+5cBYG/7RLcA1TiSmFxACqyStJ8qohmCwYHkCufWJKhJXvx87vuOMfpeJTxCTJcgficUaSoU5YAtuRi7g/wCJOUlc3Nhf+owLxJMwDs6SjdT0YxpN0+V8sbDcevq4a8Bitv0eqgkZjdAyNW6ScFTMCqglROE5zb3HCiqV4cNLSlPl0In1W2blrzrYII5I+ALNsxRn0MlO+3aIYTc4ftfepFA9gq4lpmmS/i61MRvu6jG+rNEH8aPnix2GX1laNAs8wIkpAxaOL8IP/+QGkRRu5Op0yH781iinFR3XkSi0jTuoVZX/alabavObN4p5QzouxD7p26yVi3WaJnOibORbgZ6ycEZ+l+CYumA7Uog6+F8zZT/SzY61sz6+OY+5q6s6Oqu6pfHtZNi5oSnTuIHV4EXt4ZW66TB6bhA2OF5rVYwZhl5NWL1LYvmIn38ofBfKt3eyvv3wT/Qws=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(2616005)(36756003)(66476007)(66556008)(4326008)(66946007)(2906002)(38100700002)(5660300002)(8936002)(31686004)(8676002)(86362001)(316002)(31696002)(6486002)(478600001)(41300700001)(6666004)(26005)(6506007)(6512007)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThXbmRURjlCb0hOMytVMUVmTTNnSzFxV0lNbGFXMTdsM0MrdkdYSWNyUWND?=
 =?utf-8?B?Snd1UmZOUW5nN0FobWxnTjJqNktLVDR0MUR0VE1sS3Nuc2hxNUpjektacmkw?=
 =?utf-8?B?L1VnbzkyMVFrRTVjSGMvN1M1WVNaMWEvMkVkM2YzeEVQYXNFVTJSbnBOMHpD?=
 =?utf-8?B?bC81Q1hnWGxFSjJBOHVITDlOUCt0SklFQWl6UlhDR3plaFFRS1FlVndKVi93?=
 =?utf-8?B?VVY2U1VsSkRCdHBWcDBtK0FCblc5cVNkWkYyT3BYZXZ2d1BLQUM4WmYyRjR5?=
 =?utf-8?B?cm9iRlViNGdkT1MrV3FFT3VJa0hlK1pJQ2lsN2xUa3Q4SG9kV1NndmlmeDk5?=
 =?utf-8?B?WUEwUWJ4ZVhtUmF5Y0dYbGZWM21tZzNoQktyeW0xWlVtUkZhdHJhTTI0SGZs?=
 =?utf-8?B?YS84dXZoWFRpK09jWDBqOEJLcGx0ZnJEYS9HTjBQNnpnSXJQR3pPbjhkY21m?=
 =?utf-8?B?azh3UjVOWHJSWmVJczE4VmpUWTVieGNDS2huWk9VZWRVUElyNnFYYnRhbEpK?=
 =?utf-8?B?Q1k4ZlRnZ3h6RzVPbW9qdSs4bGVRYVh4aThMYk0vdFpnWUpNcGFrRmg4SFJW?=
 =?utf-8?B?SWozT2syT3ozTGxRMkxnQTlLR2JtV0NDYUprL2ZNN1hkSVhUYVpoTWVsb2Ez?=
 =?utf-8?B?eUxJRy9TTjVqNDBzNFJHdkVyOEZIZHdmWXpQTWxyOU1tYmx3QmJjbk5sQUFv?=
 =?utf-8?B?WG5qQVV0bDBpb1N2TVZnRGh2TFhJSXZmZCs1bVp3VlNSZm9BM1FmZmN3eGJ6?=
 =?utf-8?B?c0d2NVBYQldncWo0VkNHSWY1ZUxDMmFteVRNZmM1Nk5PSitwWjVMcHVYL1Fq?=
 =?utf-8?B?a1F3OWZjSm5DZmljeUU1andNMjd3Y3o2UkE5dk1nL0ZsKzU5aHd2Z0YralRG?=
 =?utf-8?B?WGNOZEJUb1E1bHZLMjIwUkR3OExwSnNWaUtBUlZ5UUhzOWY0Qmk1K09HTHQz?=
 =?utf-8?B?TU5jcUI2dUlTV2t3czBFUEdRSWxydlpxRXJoWVRic3c0RVV6SmgvbWJhWER3?=
 =?utf-8?B?THJSSDJhUmN4TDh0QURmbU10RzN1UzdTMFpMV1BYTHJvRGpGN2hOdXM4WmFl?=
 =?utf-8?B?NHJURktQR0dHT2l0UWxWYmRZMGNYS05iWjNHc0JGODR3Vy8vWCtrNy9qMlZj?=
 =?utf-8?B?L3Mydlo4a1ErNEtvSzdxNnpyL2EwcEZLNUlNUmhzMG96V0xmY1Jqd1BQNm9K?=
 =?utf-8?B?RUhHMzU5dW9ZU0pGTC95c2NsY2d0VEtrSzNqazJNekd6RllWMXEya2lzcENl?=
 =?utf-8?B?TGR0a2N0QzlBelRtYWZJeEU3WkN2d1ppdFJ3TlQ3Qy9yL0g4T04zM1REdEVR?=
 =?utf-8?B?TXhIcCtiVkpWVVNLME5jNGJBcEdtRVplNjZpWnZHNmVNNS9LV01JRDhKNU10?=
 =?utf-8?B?RjJtMC9zaHl2cUlQYkc5NkRFUVlocFgvNkZUTzJOd2pHb3BPZXYvUnA3NEtB?=
 =?utf-8?B?enkrUVpPTmdzWUJkdUZTSFpiNmk3eEZkYUpmYmczUDRPOGNwTXZzK2tuSk01?=
 =?utf-8?B?NjNzbUhzWmVka2ZhK2NLUXFxRUtvOW9keEFkZFY0RDc1Yk5TMmlLdmI4azQx?=
 =?utf-8?B?SXBiLytQVUJCWVNiV1pSbGJTRU9BajRrRXZqb3d6dHdtOWNJcE5SbnBZUito?=
 =?utf-8?B?ZStVTzZzVTN6UnZXc1JrOHVMUnhYWlN3M2FPQUJlSi9lV0tnK010SVUydUJI?=
 =?utf-8?B?QW94bWxEVUhHbWtaMmVRa3FhSkFIN0kzcVI0cmhrRXI2dmJTd3ovK0VmYTF1?=
 =?utf-8?B?N1oxc09rWURoTHJTNWYrai9RZU5HejMvRDM4T1lpSGUxNU5rQ09vMjlwRGxo?=
 =?utf-8?B?bnJLUVZMVFl5eUN3WnRvZG1JdS80bUJqSXozVnFjeWZabmJBVEUvQzdEejAx?=
 =?utf-8?B?cjJUZlNqWEhtMVh5MGs0TzdKWjdROFZNenBPVGtnaEExZHJSWTIrOFBUSkE3?=
 =?utf-8?B?dkpVSElkTE1PV1E1RnA0aU12bnd4ZVhNdjIwYlgxWXRzQWFJSVQxS3QrbmhU?=
 =?utf-8?B?bmQxajBtRTYxaStUMVZQdERna2pvUENyYlcyd3J0SWJwSDBTWm1hUzh2WndJ?=
 =?utf-8?B?VDE3V1M1dkJKSFNFNjA3ZjRLWXp2a09PMU5LNGN0UnBJcUdHNE5ZZkt4aVpu?=
 =?utf-8?Q?EFmXEpx9z0qEfR3kGNM5jZmJb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808b9b82-640c-4873-3e52-08da94c744a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 14:01:19.8391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SskhuBiFF3TJlVMu116RFBjt65yI7knIcFvjFeMSjs4AWUWfiXsB7I8sAvXn1VQ4HcFy61O/MadvKDKBKZwQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/12/2022 04:06, Shyam Sundar S K wrote:
> AMD PMF driver provides the flexibility to turn "on" or "off"
> CnQF feature (introduced in the earlier patch).
> 
> Add corresponding ABI documentation for the new sysfs node.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
> 
> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
> new file mode 100644
> index 000000000000..c75d7426c2c7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
> @@ -0,0 +1,11 @@
> +What:		/sys/devices/platform/AMDI0102\:00/cnqf/feat

Presumably future devices beyond AMDI0102 can possibly support this too.

So maybe this should be "/sys/devices/platform/*/cnqf/feat".

> +Date:		September 2022
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:	Reading this file tells if the AMD Platform Management(PMF)
> +		Cool n Quiet Framework(CnQF) feature is enabled or not.
> +
> +		This feature is not enabled by default and gets only turned on
> +		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
> +		or in case the user writes "on".
> +
> +		To turn off CnQF user can write "off" to the sysfs node.

I think you want to have a comment here to the effect that "systems that 
support auto mode will not have this sysfs file available".
