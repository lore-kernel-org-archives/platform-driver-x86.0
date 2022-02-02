Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3605C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 14:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345258AbiBBO6L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 09:58:11 -0500
Received: from mail-bn8nam11on2067.outbound.protection.outlook.com ([40.107.236.67]:24535
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345255AbiBBO6L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 09:58:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ6jy+E1ozRzeU0UlJ4i4O7V78RwmxvPHGvEAz5LuBgu8vJjFdaqhEycjZWey1UEbdTG7r2XTLcb1s9T/TVGtcQH27oV3vQcFLtK9SL39rpFcfEQVUgEC6Qtb4fLM9t3CxYxkHXhZWZIN4EL6styYafFeRs0oPEmUpWgx5dVxRdz08IGwlycUAoz+/4MlrbeEuksySw68G5WpxSGeL56lsjV9BQQRjdEy1Lw9Ra1l4OV+pJVB2jG8nQ0rH70XVZj0j8650/0E5qRczhxSzRpW1oOXAZW4vtn1W2M++OwQKOqsYvmOZlIVNA4f52OHnWR20HNIUplyej017ZvBhnBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tgf/7u+TeKv9+wsdGiz1rcLdlLcVUei3xUNKEF15a8=;
 b=EfeWRyb5TmQff7ZzJiQ3fv19gVojzQnWA8PGHzcTJXo9HNZKOwS9Z5wyyoZqGq7k6sMbrTjVMti5kVkmFL3MzguAhOTreE+6LNfZVf19RNRP7OKT0RjetYEDvVhNtYcGGVFWQmx3rzH7/cb4xA7FlDBQwekBqDdoDnDuBGxnZTzeD8keWmEJ28MOqZnHhmZtESx6PjfQrZSTV0CRBFjLjEYa83KvUFgscymp+RrdDoe/MBEhxkOdRt0oL3tNx7gkfJhy1l096ShzngUJh9s7EnjRdIh5ZoTD8KDp16rcqfw2Ty4jLYn0Cgy7bHbtGJDtsR6iSYrxbebLQRd97JzTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tgf/7u+TeKv9+wsdGiz1rcLdlLcVUei3xUNKEF15a8=;
 b=pxfj039SvhfCzK5kYjxWzL1/B2C3LKP+sW4RGxy/NOMm1ZGe/xjO258yB/oTdzumE8ldDBt4WC3au33CiphhiafnZZS0V5mEnDo+Roec5598VaRqE4ePjT2uhvNI0lM17N4fD/LSYWuck11aKcVikSExQTccOCovQUh+nYxObLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5030.namprd12.prod.outlook.com (2603:10b6:208:313::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 14:58:09 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a%9]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:58:09 +0000
Message-ID: <5b025408-a561-8521-5f9d-ad7469bae71d@amd.com>
Date:   Wed, 2 Feb 2022 20:27:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] platforms/x86: Add AMD system management interface
 driver
Content-Language: en-US
To:     Nathan Fontenot <nafonten@amd.com>,
        Carlos Bilbao <carlos.bilbao@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, siva.sathappan@amd.com,
        Shyam-sundar.S-k@amd.co, Suma Hegde <suma.hegde@amd.com>,
        nathan.fontenot@amd.com
References: <20220201135301.158868-1-nchatrad@amd.com>
 <20220201135301.158868-2-nchatrad@amd.com>
 <dfb59a53-865b-11d5-707c-04b5401d3317@amd.com>
 <fdd6de4b-0ca2-9601-a55e-1ba25fa5a929@amd.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <fdd6de4b-0ca2-9601-a55e-1ba25fa5a929@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::24) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36f44b99-c548-4c74-0ef6-08d9e65c6cc4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5030:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB503010F97D8027307967AFE0E8279@BL1PR12MB5030.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4j+sajtwrDRCK10NKhXe+sEujD7IKLZBWndYGUMwbElMfzYkVFs2jPnzLIVBvalaXnqapi5/HHwuqi6y9wGU4Yevnu6RxFxErDmmrjgUOBSEGCq8GANXithNNbcTf5MTpRmwhW4I2+WfRTibRlbmdisxgNTVtdpn10Hupxrn21fljatvkrqcv3mG5m5VH7hErTJptJlR7RP3VZbGBo2Wylfy5Vjh2UH5EvEdoHMnpmuP7WHJHsS6v8cpF/csCd8EhxsYoj6ZlmB+YywT51ovRNORzBGamaQLQkqAGGSsw41QilldHXUy+WzUC0kynLU8HZTC0NnPFeZyjLjMCy9Fvbto+NRI4Q1DtXsFM19kYcBYUNo3ya4s1rHVHmEpkd11DS3mPUzB3oyUGRlUAmR1z1VNuqgM3B4IlTxUPTSuARJvfRIVxh/34k3X/MWdVsqXh8rOoR0F7RGzwi/ZdUYqHXKJoxeusKldM0sSXaITigSsG1rTD00iwUYhEXEQuWnYgGH2amH437dyL7AoTTVCoXT7O8px28rWT4k0W0qKtEon/e28c8TRT9u4jRIWNktUVo8/taqwXCO4mq4r5zQkJfzbUAlvTQvDtVHKmbVvf55nnfuUin+5csdtYO+pnH72c7IaYssDuaEKRlz2jfq7MASIoqUCcmq3u+5wdk65jS8jzC8c3NGPzOrtoLhVuX5nh6L60GF/S4vTpdgfnQ3I5k3cl4U/qwNlBUSLguxe6vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(8936002)(31696002)(66476007)(66556008)(316002)(66946007)(5660300002)(110136005)(38100700002)(83380400001)(6506007)(53546011)(508600001)(36756003)(2616005)(6512007)(6666004)(186003)(26005)(6486002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjVucjZHYUNBWmljekNWYjk5WjhiTzBFNlhFSml4TVJnVUl3YjNOR3JybHBZ?=
 =?utf-8?B?b1J4TGtoK0hsbXpJRnNRcGRScUtjTzFmbTBCZmcxejBKYUFLa2JUbmVLMjlH?=
 =?utf-8?B?QzBnWGNteXdaUFpDbDlodDR2ZmJldWVBU1FhdFJhSTQrdWlqTStNYmczNWh6?=
 =?utf-8?B?djYvL1Fkdk9NSTA0Q2x4NnhrcmdvMVlZL1cxMTRsODIwOUNPeEF4UW1GOGU5?=
 =?utf-8?B?NU1HYmhHbFFYVktlSktoS1g0VzRTaVJKN2RWajhkZWs2ZTRud1lmNVZSZGNU?=
 =?utf-8?B?UzBsYVErbWtkamNaQVpmMGQwTy9UT2xKT3hIQWFaR1FLdDV1K3l6dW96WWlS?=
 =?utf-8?B?NExiUDZxbEVuOHVxR05hZExsYTBFc2FDdzBsdEJaSTZRQkZGUm9kMnBudVlM?=
 =?utf-8?B?UEl3U08wZHVoTWdTS3dkVmxLQmdwRUhUb2dvYXUrbC9HcSt6YWlEa2hlT3oy?=
 =?utf-8?B?eTV1M3lwdTg0bjBRazNQUlkvN0VTMWpyR2xmUmVoS0hVMlRVdTd6aWVvc2NI?=
 =?utf-8?B?ZzhYTTZjWUpienRyNUMzN3dxVTIzUWl1SGEybVM5K3NuTjlpZUZ4SW1JRW9w?=
 =?utf-8?B?OHArV2g1VS9lVjhTQ2VxZFFlRUttbGovZC9naXN4UjJidTlhbHFjUzRSQXp1?=
 =?utf-8?B?Slp0USs2ZnQrOHhrcTNtcU5WeXBKbm1yQmkrQko2K0MzUnFORjFWY2ZWaFRY?=
 =?utf-8?B?YWl0NzZIZnVPQllBeUg1MGE1Uk5YaUthYlk0cld3Mk9iQTZjNDNnOHluWnNl?=
 =?utf-8?B?cGNZZ3NlMGVzZ09XNnB2T3E1Yi9iUW1pcTY1THZiWTYxUE9nZXRTUUQwcldM?=
 =?utf-8?B?ZitVQjd5bWhMa2RDd00walQ4NVVNRUF1NGVQdS9pTTRLNDA0RFRqYWZIVmlE?=
 =?utf-8?B?anlDZ3dTSTIzUldLZXdkZTF0SHJHSTZ3N3M4aGN0M1QyY2dZOTExZEYxM29T?=
 =?utf-8?B?S25uSXY2TFhXTGVuOEpMWCthTzYrWEsvRll4VmUrRVErR2h4UGhqV3BGSmUy?=
 =?utf-8?B?Z3VLWDNJeVRPc3JYUS9KRmdrUzV3SllTYVJpT2luSDJhTHVGeTNIdjF2eGVZ?=
 =?utf-8?B?eW81RWNTUUJad1o2T3BES01YNEwxZ3V5d3NyZGFNci95M0tBeUNaVkpJTzdH?=
 =?utf-8?B?ZUlQdXMzaEdFUE1jRmRmaENKWXNseXJoYzFpN1ZaMDVGbzVyRWhkVW5vQ3U3?=
 =?utf-8?B?UHJCQmxOcDliZTJzcHpwTHgwTGxLbGIvYXVsNEdoelRuUjdzSUlDSHhjdm12?=
 =?utf-8?B?RkRJR1JzVVpobFEvSy9OSzdTaCtoVmF1Rm42cU9nTDk1a0hJTExoLzFXMzJq?=
 =?utf-8?B?dzAwcksvZFR1ckRYNExFS21aZ0ZlRlAvb09mLzZScXVZQ0tTV3d6RDlvTnlV?=
 =?utf-8?B?MWdkL29Wa2xlVVV5Tlp5MXJZWERycDU0U2Z4TjRZVjBScy9uVi9wdGVlbklv?=
 =?utf-8?B?RFRSRjQ4RW9GN0p6b3QvckY1UjNpaFE1a1NtWXhZWG1DeTVpbVAvVGJoYWNt?=
 =?utf-8?B?YndXQUpHL1VxT1dmMGppaXhxODRDU1Z6Y2VKUFIwUWkzZzVtdWJPcEVUNFNp?=
 =?utf-8?B?VWJIYllhMW1laytMVDVGRkhYL2FQd21KZmJSdnI1RDI3REZMTE1vOWZuaElu?=
 =?utf-8?B?SFQ3NmdzT3haMkdWN2c5SmN5b2dYQjFwZUFUZkJGQjErMkJoSnMzeVNKMzZ1?=
 =?utf-8?B?ZjBncUIzRnF6S1Q1RHRUZkk2dDNCYnFXM2xxUks1UWhwVWVzdFM0cUZ0a1Bk?=
 =?utf-8?B?MjAyQmJDUHRBZlVWMGdzYzNEalJRZWVyMlg1WlFFV2dINExZSEVtYWxrY2FD?=
 =?utf-8?B?ZkVhMXJVYzlEWU55UElITkVXM0hKOCtiQmdxdXQvL1pWczJ3K1dYc2dqNW5p?=
 =?utf-8?B?SHRwSWpveU1Cc24xUzB1SUFjdUpacUxGMC9ZZnZKTGhyR21RRFpmVEc3RDQ4?=
 =?utf-8?B?VEpNRDJLTGQ2SDROYjJGV1QxZTdTRnA1U0oreDJGMHE4V0ZMMjA3TndHZUUx?=
 =?utf-8?B?YzRkMHl3dXdhSnMxOGxHSlQ0cjZZYXduYTNjblJCOU1mYUk4NzVRQkZFOGkr?=
 =?utf-8?B?dnRBc0U2WDlQQitaZzNkV2xVWWJOOVpicy91cTFDbnlBQkFYQmZ4Tyt1Z1dP?=
 =?utf-8?B?TmR3TjFoN1d0bDhKNW4ybTZ6VXJFOXNoYzBHN213aHNDZDkwSzljQmVsc2tw?=
 =?utf-8?Q?d+TypbGLbAv1JaiXmkJE7tg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f44b99-c548-4c74-0ef6-08d9e65c6cc4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:58:09.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvxJyYVI75Jso7NaKPWhNVg9SpKZIG4A3rPJ3qvEJAkDdrUEDpRhijusVzzmL1hkhzkTKute/qofNq0gPb2aYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5030
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Everyone,

On 2/2/2022 5:25 PM, Nathan Fontenot wrote:
> On 2/1/22 11:50, Carlos Bilbao wrote:
>> Hello folks,
>>
>> It's great to see this patch on the mailing list, this is useful stuff! I
>> have some small suggestions to improve things a little more. Besides that
>> the driver is in great shape I think.
>>
>> Feel free to add Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>.
>>
>> On 2/1/2022 7:53 AM, Naveen Krishna Chatradhi wrote:
>>> From: Suma Hegde <suma.hegde@amd.com>
>>> (...)
>>> +
>>> +int hsmp_send_message(struct hsmp_message *msg)
>>> +{
>>> +	struct amd_northbridge *nb;
>>> +	int ret;
>>> +
>>> +	if (!msg)
>>> +		return -EINVAL;
>>> +
>>> +	nb = node_to_amd_nb(msg->sock_ind);
>>> +	if (!nb || !nb->root)
>>> +		return -ENODEV;
>>> +
>>> +	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	if (msg->num_args > HSMP_MAX_MSG_LEN || msg->response_sz > HSMP_MAX_MSG_LEN)
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * The time taken by smu operation to complete is between
>>> +	 * 10us to 1ms. Sometime it may take more time.
>>> +	 * In SMP system timeout of 100 millisecs should
>>> +	 * be enough for the previous thread to finish the operation
>>> +	 */
>>> +	ret = down_timeout(&hsmp_sem[msg->sock_ind],
>>> +			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	ret = __hsmp_send_message(nb->root, msg);
>>> +
>>> +	up(&hsmp_sem[msg->sock_ind]);
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(hsmp_send_message);
>> In this function it would be nice to check for a msg_id of HSMP_RESERVED
>> and return -EINVAL if so. The function hsmp_ioctl() could do the same, but
>> it's better here since third-parties can call this directly.
>>
>>> + (...)
>>> +
>>> +static int __init hsmp_plt_init(void)
>>> +{
>> Perhaps instead of __init/__exit let's do __devinit/__devexit?
>>
>>> +	int ret = -ENODEV;
>>> +	u16 num_sockets;
>>> +	int i;
>>> +
>>> +	/*
>>> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>>> +	 * if we have N SMN/DF interfaces that ideally means N sockets
>>> +	 */
>>> +	num_sockets = amd_nb_num();
>>> +	if (num_sockets == 0)
>>> +		return ret;
>>> +
>>> +	/* Test the hsmp interface on each socket */
>>> +	for (i = 0; i < num_sockets; i++) {
>>> +		ret = hsmp_test(i);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	ret = platform_driver_register(&amd_hsmp_driver);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
>>> +	if (!amd_hsmp_platdev) {
>>> +		ret = -ENOMEM;
>>> +		goto drv_unregister;
>>> +	}
>>> +
>>> +	ret = platform_device_add(amd_hsmp_platdev);
>>> +	if (ret) {
>>> +		platform_device_put(amd_hsmp_platdev);
>>> +		goto drv_unregister;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +drv_unregister:
>>> +	platform_driver_unregister(&amd_hsmp_driver);
>>> +	return ret;
>>> +}
>> I think we really need to do some checking for family and model (>=0x19)
>> here.
>>
> We should only need to do a family check, HSMP is only supported on family 19h.
>
> -Nathan
Thank you for the comments, will wait for some more feedback before 
submitting the next version addressing these comments along.
>
>>> +
>>> +static void __exit hsmp_plt_exit(void)
>>> +{
>>> +	platform_device_unregister(amd_hsmp_platdev);
>>> +	platform_driver_unregister(&amd_hsmp_driver);
>>> +}
>>> +
>>> +device_initcall(hsmp_plt_init);
>>> +module_exit(hsmp_plt_exit);
>>> +
>>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>>> +MODULE_VERSION(DRIVER_VERSION);
>>> +MODULE_LICENSE("GPL v2");
>> Thanks,
>> Carlos
