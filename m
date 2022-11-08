Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA7CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 12:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbiKHMrS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 07:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiKHMrQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 07:47:16 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45785289C
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 04:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHMxMtUHIO1RG5BStukQzVZOfB0gh486i4V/+6n+JHHYHplj9P9ByD7EjHKcDXhprKZJ7spSeF1Fm+DZD1ttek29sbaeOIsdm0tj8JEWDQCLofjxKGpyyYhg6LTldVNaj3kfepzaaY5w+0S62cuaqq9kdiSr2NI/SnGk3it2+DvoXVm7+bMq/u4ZLloLgMxWkERkRj15gbiaK3KfDvXzpUF0sknLC01tHet5TgiREh/J8W0HDf0uZlYHXZ0q7PwaWlOL7MTkxDmGEeidaw4+8i7HZ0hGRf/O2BVpb9EwrhG0fWLvOo7QeVuiV91XiUyGGS+Vs3u6X7zE4cOOUnx7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovZfW7Y/YWXL0h11Hqt/F7Pf+Jqjydn4ZSMY9b2ShB8=;
 b=lEiA2405hd0AGDRfBRVf6AYMxc6fu6upCn4MIY1GFAvvjeWvqX1FuxDJ0g7fo0Le/fPe0vorw0kwaCbIS2Fbe+arnOCZ+aIXdSbo1aPylb5wgVbSmWnc/2yU4aXIuKaifeHaoelZkxxq1OBbEI0/kcr7iRTLqQBuKsmiIQsSDdVHov4H6olr977EBz4n0fApxj/z+XS/qxdgSEYHta9pvpBEZdDjA75CFNJy0Ia8WT2B0/c5LfONpa2QO3RrfSNJReTLZQVU7iBXcsOU0bXTjahE/ZpRzEY8iAlO+t/man4tgSdmAo1+IVa30EDm7x3JXbiRtBzYCMzXFt7e1PMpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovZfW7Y/YWXL0h11Hqt/F7Pf+Jqjydn4ZSMY9b2ShB8=;
 b=C4EYB97weiMyvIA8N0bR25R9okjioBycY8SYL02ALc42PEKpK7X4IaSI0AmbIYrDT3OuGPklXOyKV3pzuFIWyWUhyR3tmCONgekuwUXrnhNQHz49VxA9Fm3RaRsefBKZDqucyijGRmyPbIut0so6WU6ku3E4oX0I4laUrwMwPDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 12:47:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f842:a9ba:3f41:3c3c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f842:a9ba:3f41:3c3c%5]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 12:47:07 +0000
Message-ID: <abbd370f-4240-db15-5add-b848a5108c21@amd.com>
Date:   Tue, 8 Nov 2022 06:47:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] x86/thinkpad_acpi: Enable s2idle quirk for 21A1 machine
 type
Content-Language: en-US
To:     =?UTF-8?Q?Lennard_G=c3=a4her?= <gaeher@mpi-sws.org>
Cc:     hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20221108072023.17069-1-gaeher@mpi-sws.org>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20221108072023.17069-1-gaeher@mpi-sws.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR05CA0013.namprd05.prod.outlook.com (2603:10b6:610::26)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: fb63f938-08e4-4950-7753-08dac1875876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWFFgN+F2LPfPpCDgTem+TNgx8LIKA1yWbtG5EF2DMaVFskYV5FXGyHb0wczij91IKOwcNFg3pj/vAATTjq8drqRJ4l2qBhVzhtbHd+kqZt1cDbRrg9OL9nlZj4e8uaB2vv9g1jBulS5gW+cyYdgIF6lXniwvEAYZsn8H+iUaIqrumE43EFA7yc7A1gWPM3b/ECkg56z0l6xqKghqXQW8VRrinjH6oRyZw2qKX3BgqEsGtNufjIDAqZ/rTS7hpVQl3gkhauNNInoRdFhdRTz9QuHsGCBOl6nhSvcZn3DK0Lbq6/xAZ8W7CPGl2Lyx6uDALgOAzQmLCkxg+rEqPLydpeDqoEipN+ZxOd+CiCPRvbmcVHx4EUCSEnwHvSu7G489eS14b5UpJsxAWNas4u45eOzGyh38lk4rA84S+mUTqs+bDXwcQLEs/0Uz6i6kH3WwPtG5il8Q2mbhdjb4lUEjVP+5qHzNK6xXpcW87Vocmm3X86dUQIk7CEy7UMLyjE42hMJPOQISA1xCPkUg6925UStumVij6y6yluM8UWqBwj/6eblL34+ZUvKct4WmY6bUfvVx0cvHl/AGNeW50h2LtZsSPlS5OSGgmP9dtJbc0sEi1LH7Sa9gYyHKMm9OYysqv0LZaUYegMs0IDJobk3z+P9nTth6taHu5umOJ9y559684P2lpH4GeQaZBOPn6qlZgYGujHWThAOluI6OC/fEc8gbL5JNyYv8P0eQLCDLjqWPBVO+pStNrKYPXUYetdO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199015)(31686004)(31696002)(86362001)(53546011)(966005)(6486002)(478600001)(38100700002)(2906002)(36756003)(6512007)(186003)(26005)(2616005)(66556008)(4326008)(6916009)(66946007)(66476007)(8676002)(6506007)(316002)(8936002)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RxaEpKcXpUWFBBcFV3czdjbnMwczdtYTFQcjA1Yy8wYkxxWGtDV0tvWTFR?=
 =?utf-8?B?RUF3WUpJaUNvSnJScG05dDJsY2FDS0FxTGN4Qm1rUCs1SGJaMlVQaS9rc2dt?=
 =?utf-8?B?cW1yd2NKd3NlZFJ3TTR4dDlvRjJHYkk0Um9oM3U5aytLZTFYNVcwK2RJdkZV?=
 =?utf-8?B?Kzdkd2VLM3NGN1N0Z05mb2d3eUVySzAwLzYwT0NHRzR2YUR6TEx3VXBHM0ZJ?=
 =?utf-8?B?NWxvWWdadHRqVTNGbmlpYVFZNHF1Q2lpZ2M1RnphcFpCNGttN3R1WnYxQXZE?=
 =?utf-8?B?WnFaSVpUZk41RlZLTmd0UUdoK1Jzay9KRnRZb1lnV2tRY2NwekhNeVViQVZs?=
 =?utf-8?B?VVFnMHZFN3dVS2JtOXR0MWFZNmlxT2RXTHN3UWdLNVBkbjRWeER1VHFHWDEv?=
 =?utf-8?B?bHZ2VFhRbHdBU25td21ieTk3UnRobFhlK3lZK0duS1BlcDhDWmN2YUtKTWRr?=
 =?utf-8?B?R2xjdHp5QytUNHVOOEc5SUpYRFpKTVU4VVV6dTJCd1lyVlZvOGNOMkU5MXRI?=
 =?utf-8?B?L1J6TUxEbFB2aW9nVTFWVzluUU5OS2JhektKaXk3MGVBRWJ6b09tcnlaK1dN?=
 =?utf-8?B?b1JCTDYrT3Q1VnVqY2hrMG5EVEtZN0NiR2dXQ3lxMUlmOGlQc0R4MG1uVDJp?=
 =?utf-8?B?dzlLdVJ3Wm93WjBOVTBEdWRWc0NWTHd2Sk9QZ3dkRFNWRGJheDlDT0toYnhD?=
 =?utf-8?B?UmFFVE1seVNabkpkb1F4ZnJ1OWdTTTAvYTJMTjEzSkNqQ2hhd2JGZS9NRXNB?=
 =?utf-8?B?YlQxdU1DMUNSNUsvRXk4V0pLNXZ1Q3ExRVJJd3BMM1ZQb1Z0aG1rZFJlM0Js?=
 =?utf-8?B?VytuTEduMllvZ1dad0ZjdjROSjRYeGlKTHBiRFJxSTIzQ09FQWc0ZDk1MmpX?=
 =?utf-8?B?YnpobkcyeStsZ3EraWhiaGZpb0hKdFI3ek5sL0F0cmtDeWVvZFhuU0I3VXlH?=
 =?utf-8?B?SjRUZ2xRemJhYWJFVjRWcDlDcDAxVnRWMlpLWUE1cG5ZY2oyQ3ZWSlp0MzhN?=
 =?utf-8?B?aGkyNzl4eEcrSHNWWjVadjJyRzA5WHhleThCYk4rczVPMUpXVGZpZGdMQzBI?=
 =?utf-8?B?bnYvaFo2cHlLMC9mTFJlcTUxUlg3K1hEc0UwSGNuMm1QUW9yL3VkSENDcHBJ?=
 =?utf-8?B?RWo3TWxEL0NKMzJrd3VNemozMHkzVnhVQUJPTTdyaXpMRitJTjRhWmpXNzUw?=
 =?utf-8?B?cXV3eHRNUUhFUGN3b01GZ1pwQWVWY0RXV2NFSUprTU5IU2w5QmREMVMyMmFE?=
 =?utf-8?B?Z3RHVkFEdEhVKzFDNDNmejZOVE1MZ2pBTWhrRFN2QVQzb1pJOGV1SHZKbFF3?=
 =?utf-8?B?anFESm5rRzVBOHVwUDMzak9zdzZ3ZnUrSkFoMXAxN0ZReUdNOVlHVlJrWnVL?=
 =?utf-8?B?MlVHMmV2NmVvSFVaWlJIc1JiRXdVQjI3MnJBVzB0WCtZNHZNZktWVlo5Mk1X?=
 =?utf-8?B?TjVVd1luK1VRTEprZDJTNDlhSmVrTGpOOS9xM0ErWk00RjBWYUR5d3UyNUo5?=
 =?utf-8?B?MUJ1VlluTS9mN3ByRUVzc01Rck8yWlN6eFhmd2V5OUZBdXdsV0lyZUNXMVNk?=
 =?utf-8?B?MG9waldGdEVGTHQ4YTRLYkljWU8yNjZVcklUZSsvdi9WN2F4ckhrMkhUUWpL?=
 =?utf-8?B?OGVYTzVaVGovWTJFNGpSNEx1cjVwSkxnOE9XTzcyUmVHUlBYSjlDbzRlYnN4?=
 =?utf-8?B?TE1QdXlaMGIyV1F3RnRiWGJHWXNvRGNYOURnWk5EWlEwWjZBTklBT0x2Z2RL?=
 =?utf-8?B?RnRabjl2bkllU0RPN2x4NXBSVnk0d2ZiMTdWenlXWERPbE1UVjVwVFF5SWMz?=
 =?utf-8?B?bis4QnlSTldpemJFYzBQMlIrejJQNTJHN1QvVG54bnZRQmgrQndxS2pXc05x?=
 =?utf-8?B?L2swd0ZpZjBVL1VRQVhiaUJRRnRqdHZEM1hXZGk4MEczUnN0SVhTcjlIMTli?=
 =?utf-8?B?ejQwZ0kyZUp6dW5lV2FvMVAwUytzV2pKbjVSNUZsRGRWYTVLTDBrR0ZkZjJk?=
 =?utf-8?B?V3lINWZKdTFiT1JwOUVPYngvamZZVGhWUEttMld2d3RhODFvZVJQSG9CUzRK?=
 =?utf-8?B?WFpEREtKRU1NR09wTlQ3eVpYdEhkOTFUY0dKbXJWRjZFQjN1Z1FVdHBoMDJV?=
 =?utf-8?Q?/lct1VbKXeL6cABQ+x8d8oJFl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb63f938-08e4-4950-7753-08dac1875876
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 12:47:07.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGVeGmwedZgDkvcv+HVSbbEtnOVUtFioqL+vLA2rctkeF918sZmElP7FYwTWi9io85WRVOFSoPk23oAK0JLnWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/8/2022 01:20, Lennard Gäher wrote:
> Previously, the s2idle quirk was only active for the 21A0 machine type
> of the P14s Gen2a product. This also enables it for the second 21A1 type,
> thus reducing wake-up times from s2idle.
> 
> Signed-off-by: Lennard Gäher <gaeher@mpi-sws.org>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2181

> ---
>   drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 20e5c043a8e8..8476dfef4e62 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4497,6 +4497,14 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "21A0"),
>   		}
>   	},
> +	{
> +		.ident = "P14s Gen2 AMD",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21A1"),
> +		}
> +	},
>   	{}
>   };
>   

