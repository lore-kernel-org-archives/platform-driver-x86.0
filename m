Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E74C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 17:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiBARuq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 12:50:46 -0500
Received: from mail-mw2nam08on2084.outbound.protection.outlook.com ([40.107.101.84]:65095
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233237AbiBARuq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 12:50:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJsxjsBwzXP3hG6dAKRCQluKMrHoeuu1Nek1m7HtgtRNlXv6RbEFsxJEiuVYBcQqxpFrx2DduLQpGkjsQf9r9HzvVmFK3GKsaC6VBSvZdiM2d1vzkzwAidE82steFcnePVtcl+KeHIAXB3/PuyqJOm5t1UyiByQxKy+5zmXBFOaPvO/MWLQ2GwsvJn14cL7RmzgqnyQhPXgnUyRf2Q1JeJR+b28t7vrpCaE2+rxr5/795h/wn//3TUpXfwgTkORgm191zK/7nqCCyNogpfNIaYbtou1URh68hVyFdf3/MF+5uSBZlfOKJRjkKWLtJxlxCOl18DVpd+pF+B1zG+1BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46jwoXtwFATHlcd9IgmENRfdzRM3zBZnKLt00dQDiT8=;
 b=crTJMZIZDdb1DwIhbeDUMNJRuitPrLSDAn7iNqUY+kHPE/2HpaEDB41GeENyd+yfalhmAIJFOdyaciIWT+9+OZHQ+6kmI6/yHUE424oiIDwhuOfH6zb1LmRRLB+Cc4PVVxvEeZiRwUYjBgUdywdjuAh13YgTA/zwwwDgoVH2KLF0kCIeaBON5VB3RGmZa+4X3FYwDYtkTR4rUznNf6vuPhkdhExfaiJPxmi7t8yc+hIJEcGdFlcmNdCIYpknYKszeaiomnBRn24qfjj6N3pacRqS/4uL247Tl5tcBt29RdByyOiaZd4rDKMvLQmw3KAp7bqrcFhH52XpFLx6GGmaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46jwoXtwFATHlcd9IgmENRfdzRM3zBZnKLt00dQDiT8=;
 b=wrZELF6YmasoMIMotxX2w1hG0Q361aA/f9uHCPov2DiACwMx2mQ2S/9j5CfAWMqzsdqLaETGxdebO9klwIHfkGMOjgfjr/TeZSBSsanrGqvJAKd7BJdMk6qWAqzDsH9lqO+fUYQnF1mPYDTj5X8s8WPOiiIuuJ0bdlEB9vzW56g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3877.namprd12.prod.outlook.com (2603:10b6:610:27::32)
 by DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 17:50:45 +0000
Received: from CH2PR12MB3877.namprd12.prod.outlook.com
 ([fe80::504a:964a:aaf3:473e]) by CH2PR12MB3877.namprd12.prod.outlook.com
 ([fe80::504a:964a:aaf3:473e%4]) with mapi id 15.20.4951.012; Tue, 1 Feb 2022
 17:50:45 +0000
Message-ID: <dfb59a53-865b-11d5-707c-04b5401d3317@amd.com>
Date:   Tue, 1 Feb 2022 11:50:42 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2] platforms/x86: Add AMD system management interface
 driver
Content-Language: en-US
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, siva.sathappan@amd.com,
        Shyam-sundar.S-k@amd.co, Suma Hegde <suma.hegde@amd.com>,
        nathan.fontenot@amd.com
References: <20220201135301.158868-1-nchatrad@amd.com>
 <20220201135301.158868-2-nchatrad@amd.com>
From:   Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <20220201135301.158868-2-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0031.namprd12.prod.outlook.com
 (2603:10b6:208:a8::44) To CH2PR12MB3877.namprd12.prod.outlook.com
 (2603:10b6:610:27::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67582259-31b0-40b3-4983-08d9e5ab5f13
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR12MB5070D02244F6C7477C6B8A65F8269@DM4PR12MB5070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0MWrUz05RVIMJzZxBP0GUkq529BhTWsrjIAjW+0PXHL/t48uUChK4S9iBXoBOBKMOZ6QP3T00jN/zyRorV/tqVq2JWlKAATz1EkmDevNOmPcvLFzXxMOUi/k3+frlQWKUIm3OO0M+21K9jjp3g/UGH8hBh3o4BoRRG7rNea77x0T63vuOdo4JU1mHpJsHKBt/RL9TyuekIAv3bB7+wb1YD5nUOcftTlgPOigp7y+g+59TR/YtoKMOAr8Vtdx+6a0YtURjmU9VwL14+UvL1oUkQ5u0t/IpxOSCWkuVQ66P2t06TVvX1egVF5j3EhHyQsmQh6AjPpvijsCu3kbYEu2SIXRz52v56xWcFcfdfrL84YY2s/wXkh5ddDeJ3vlE9BbGjY6+xQaDYXY2GMqNbWIot6svHudji4FAnBXF+vvbjoKChoER95oUbbAwA+iq/o0ZCwy+vaPe/6nDsZ11o/HxY8izvpg655Q1TTcCpRBrkFsaqG31WFtQQAlX+36KmJdvV9XRdr4GU7ArXjqgLJO7ebuboqhl8YCxHSytvaCHJJ+Dusvtox35QBpcZa13ZSD83pvZBxOYvG3BqUAL0ar9Y96Tg/on3eIaL9hm85TJMooSraeAYAWp4Lz7i/vbBFh9DgRoVDJ1GgoGmCyyzL5MqKKD2M3jjRpoGCr6ZQusWzX2/ZhqC5v9D/gAY6dIKkvwa+7akriW4Y3UV4n6u6vIFALFN8G66yWGfb1VlnY2/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3877.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(8676002)(8936002)(6486002)(66946007)(31686004)(66556008)(2616005)(4326008)(6666004)(508600001)(316002)(186003)(26005)(83380400001)(6512007)(2906002)(86362001)(31696002)(36756003)(6506007)(53546011)(5660300002)(44832011)(38100700002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDVkcjU0YmExYkF2NEl0YUsvMGlHbHdjT1JXMHNYdTNaeEhVWGtHYitMbm5Q?=
 =?utf-8?B?U0gwekwrVmw4TDdGc052Q1hIMVlhRDJpdUdtSEFYdHdjMnpsYllnTTlLeEIw?=
 =?utf-8?B?bWw2YzFhdTZQZ0k0ay9iNzdrSFNMTjFiUmVzczVzZFE4UU9oMVZsWVUxazBy?=
 =?utf-8?B?d3B1RW8rRG9RK01pdFIxUkJ5OThrUlhlaCswRWFDdk5HTXo4bENxQ1JzT3pi?=
 =?utf-8?B?dkpCUThSbmttQ2JMRnB3d3VKRHg3NDFmbHZSNlNpQ1ppamNtVWtiOEswM0Rr?=
 =?utf-8?B?N3ZFRTQvTWhFOGcxYUhCdzVDNlArTlB3SjhWb2drY3A0Mk5LRHJGaHdGaGg4?=
 =?utf-8?B?NWlHWkJHcG1ENkVmSjdrUlZxK3N6MUZEeFFsWDIyMnpJdUZseWsrc2psR3VT?=
 =?utf-8?B?dUFxMmcxZEx6bHo2OGY5cW9mOWlVM3FlRHhFVnBCKysrYWwrQ25SVWhQSEZD?=
 =?utf-8?B?OHNmSEdodlZwNVlScGl6ZGRTTUg1RDVBUDV5eEFHWWxaY2tmMElKckRaYThk?=
 =?utf-8?B?TjVlcTloWjkvelV4Z0pZTTZEci91N25KMVRQODFvWW9DMnJWTVI0U3paOHB5?=
 =?utf-8?B?R1g1dk1ML3UvS291WTdqNjcwS1crZnVYU3QzZFFmUHJkTjFVSVFoRzRDY1RE?=
 =?utf-8?B?bkN6SFhIc3FrdGhmZlR4UVRUaCt4dDFJRWVJOHVxVzg0dndtK0FJR3lxekdK?=
 =?utf-8?B?cVRUeWQ3Y3lPSzd6UUs1T1BheitGYjBkUDI0L21PN3BKZFVxRnprVzNzc2w1?=
 =?utf-8?B?UEVuYmpWR3M2YXArWS9NKy8weUlhSVJzaGdOQXRwQ29uR2IxWVE2VGJFTkd1?=
 =?utf-8?B?YTIveTdDVmVnTE9lZGhHOEhzY3Y2cWdjV29lbVdFVDlKWUR1Q1hZVHNwbUZT?=
 =?utf-8?B?NXZUck9aY2dvQTVqQm5xVHBNSHdNZ2tPWjNqLy9xbFJYTC9QT1JITTZ5Rlls?=
 =?utf-8?B?b1Vjb0JucVRUMWJuOFJDREtHV1FFcE1mc2tKVExoN01xM0FCL1lNSUNjMzFs?=
 =?utf-8?B?M3BpVVZFK0IxeEtZNUtidlFRSzRodzE3eUYrdURieWFrQ1NPaTNuelIxam5J?=
 =?utf-8?B?c3h3VzI0T2JqR2sxUzVneGR6T3dKQWVpSTdrRE5zVzdyR2hTNzJ5T0ZWcHo1?=
 =?utf-8?B?QVZSK2NzN09iSnY3M0Z1UWpzbEpVaHZNbjlSaWhFOWp2TjlvcUt1K2VqSFJn?=
 =?utf-8?B?clNuL25VOXpjQ3laT0pyQ1lOamdXWVdNdzAvZ3Z5SENib0t4bjE1WDliSFV1?=
 =?utf-8?B?K1NhVzlGVDJ0eU5Nc0N0Q0JNcGRyRUNGekNhMnRiclNXWmFjVkw2UWVDaFpX?=
 =?utf-8?B?RC9YelFOUkQrNmlnMHFaTUV2WkdOeXZnR1lBaG0xa0xqSjdZMHZLdXl6NkxG?=
 =?utf-8?B?L09EN2JOZlExcEhMbE0zZzE0eFNFakNqV25WNFBOVXBWUGx3TjdjWHgvRDlW?=
 =?utf-8?B?NmtRVEVCT2NqQ0RtUEcrZGg5bVh1R2R4U1NRWjdWYkZ1VXBkZlhZa2R5WC9L?=
 =?utf-8?B?V0s0N1RFSXpQb0wyYm5IQ2p2YzZVbDJ3S2FQd2NGaWlmTHVXTjV1amM4K2E2?=
 =?utf-8?B?L3ppQkp6NDZnWkQ3UjJhbGdqRXpLTTZCdDZLMFI5VSs3b2dOWTgxMEJUWlk4?=
 =?utf-8?B?emo5TWxCdjRHT2xUOFpycjBySE5BSGlNRTk4VWtQam9ZRHpKemh4VUQrUXhy?=
 =?utf-8?B?T3VVOWFZeCtNWFFTMmgzbTNTQWcyNUhFK29zQ3pVUDFQZXR4WVcyUm5wSW9n?=
 =?utf-8?B?SmJpTDhITDdWdVloajBoNEYzQk8yWm5DVEdXNzBjZjRnZWFDL0ZpSys0T0hI?=
 =?utf-8?B?czNoS1hXNE1EMjE1SU5xeUQyOHcrK0dGNEppRTUwM2tBSk9HWHZNaXR3VEV5?=
 =?utf-8?B?MnY4VzRKWUJ4Y3VCZTJSTDZaYlZOZmNNbVhIUTc1eDlNdml4TW5mbEFCZVBC?=
 =?utf-8?B?OUppR2ZwOU9MeDZDbXpFQlI0TUdaTlpna21tb0dyYkY0SDhLSk5VTE9FaUNi?=
 =?utf-8?B?VXNWdlhFaUI1RjA0OWtqUE9GQmZaMlVJcmNwQTRuQWtQald4Z3ltZTUrZkhL?=
 =?utf-8?B?TDk2TktnNHdJNnNQTlN2ZUtSK2dtL2lvTjN3eTducHFxRlRSRTlFZlhuRVg3?=
 =?utf-8?B?OEFKTVNiWUd5azgrdUhXVm9ZVk5BS1ArV0FKZXdiaGZuUXVRand0ZmlTdlZB?=
 =?utf-8?Q?kQWT5HtJZWlf2RbItfoslHY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67582259-31b0-40b3-4983-08d9e5ab5f13
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3877.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 17:50:44.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3rFEgHdRz4FWfQfRYSsgiCk607hGNIwfDzyBunU1hjOPxx3XcrmQfj68Ajyfjmc/eloRrzzUMICjQDEO/oaXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5070
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello folks,

It's great to see this patch on the mailing list, this is useful stuff! I
have some small suggestions to improve things a little more. Besides that
the driver is in great shape I think. 

Feel free to add Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>.

On 2/1/2022 7:53 AM, Naveen Krishna Chatradhi wrote:
> From: Suma Hegde <suma.hegde@amd.com>
> (...)
> +
> +int hsmp_send_message(struct hsmp_message *msg)
> +{
> +	struct amd_northbridge *nb;
> +	int ret;
> +
> +	if (!msg)
> +		return -EINVAL;
> +
> +	nb = node_to_amd_nb(msg->sock_ind);
> +	if (!nb || !nb->root)
> +		return -ENODEV;
> +
> +	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
> +		return -EINVAL;
> +
> +	if (msg->num_args > HSMP_MAX_MSG_LEN || msg->response_sz > HSMP_MAX_MSG_LEN)
> +		return -EINVAL;
> +
> +	/*
> +	 * The time taken by smu operation to complete is between
> +	 * 10us to 1ms. Sometime it may take more time.
> +	 * In SMP system timeout of 100 millisecs should
> +	 * be enough for the previous thread to finish the operation
> +	 */
> +	ret = down_timeout(&hsmp_sem[msg->sock_ind],
> +			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = __hsmp_send_message(nb->root, msg);
> +
> +	up(&hsmp_sem[msg->sock_ind]);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hsmp_send_message);

In this function it would be nice to check for a msg_id of HSMP_RESERVED 
and return -EINVAL if so. The function hsmp_ioctl() could do the same, but 
it's better here since third-parties can call this directly.

> + (...)
> +
> +static int __init hsmp_plt_init(void)
> +{

Perhaps instead of __init/__exit let's do __devinit/__devexit?

> +	int ret = -ENODEV;
> +	u16 num_sockets;
> +	int i;
> +
> +	/*
> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * if we have N SMN/DF interfaces that ideally means N sockets
> +	 */
> +	num_sockets = amd_nb_num();
> +	if (num_sockets == 0)
> +		return ret;
> +
> +	/* Test the hsmp interface on each socket */
> +	for (i = 0; i < num_sockets; i++) {
> +		ret = hsmp_test(i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = platform_driver_register(&amd_hsmp_driver);
> +	if (ret)
> +		return ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
> +	if (!amd_hsmp_platdev) {
> +		ret = -ENOMEM;
> +		goto drv_unregister;
> +	}
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret) {
> +		platform_device_put(amd_hsmp_platdev);
> +		goto drv_unregister;
> +	}
> +
> +	return 0;
> +
> +drv_unregister:
> +	platform_driver_unregister(&amd_hsmp_driver);
> +	return ret;
> +}

I think we really need to do some checking for family and model (>=0x19)
here.

> +
> +static void __exit hsmp_plt_exit(void)
> +{
> +	platform_device_unregister(amd_hsmp_platdev);
> +	platform_driver_unregister(&amd_hsmp_driver);
> +}
> +
> +device_initcall(hsmp_plt_init);
> +module_exit(hsmp_plt_exit);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL v2");

Thanks,
Carlos
