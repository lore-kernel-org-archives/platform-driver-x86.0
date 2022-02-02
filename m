Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530BDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 11:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbiBBLz6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 06:55:58 -0500
Received: from mail-bn7nam10on2056.outbound.protection.outlook.com ([40.107.92.56]:38721
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237857AbiBBLz5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 06:55:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5Q/sQ51CA1BsChw6nyZK/iNCyKuIm1fbZHUxVqBeAaFb/5icNZQagi6hN+dOaNje1LrwKVguTUKrM6mtPtN24/FE8zOVhK0shYhvAzUdPmSBFwoIRyQaTtDXaYX7woIoNQe/WgVxdFliHJjQF0s1DHIy+GdVnRpBR6qWflen9Csc2f/N32Ddxd2MyR++GFf8XNSgCyeYPmSv44GbnhnWPLnOpOhFbkH4QPy6FAXZXqX4OlzNSHveEqhmQiR7LnSDtD6gc+qi+F71v+Sqh7VSbUVsakWD8SLSYbGzs94FXruYoRxVg4xaeoPzXIYnEv/Jnsaw1ot868vGqzXZqQK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNEBIW5jvC1Tw5ZvE7QzQntkjC8CzE+nVu8owQGq5II=;
 b=FQSJ2V/BNgmLh8H4tikhPY6j9IeH0FQIQmt0pbN8kKQ5C/wLoF4/z3kLwbshsphC4Qyuxzmtzq7Ts9KpQKZjzpFyLIqWP5Syx5IQNG3Px068ZPTbQHGEQRg2tDBS7abSnCNrRftLvD49+ma0QEY06JwGMgHgHmVINuwY+eqEWCnIUCV1dGB43qEywcABQlwVQS4csL7EGSXXiZ5IpcxtWFMwkD5chx/sSUgEjgqO9fb7b4/CRgQj06GLT4v7s4a4IPpRYu/zEyYynKgrmqWMBQxXIlwSRxtVsGRkQvy1d6BySm9h78HitC6MsKwIy6F7+B6QFErTIl8Lb4SWUoeiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNEBIW5jvC1Tw5ZvE7QzQntkjC8CzE+nVu8owQGq5II=;
 b=lkhabQ9gDtWQoB1yNKdRwFAj+PTObfhJj3tCZO3Oz4INPjAIQYSwcKawRlaNSJrHQA6mC4IfbVRKzBZJtdXzXdjsVuU7XeZovvA8K1Fl6XbnRSvTS6ij3luYSCGqvRwzZBhDG2+2dqrwCPm/qbgQAGJl+hTb5Pa1is0dTSM6R5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by MW2PR12MB2444.namprd12.prod.outlook.com (2603:10b6:907:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Wed, 2 Feb
 2022 11:55:53 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:55:52 +0000
Message-ID: <fdd6de4b-0ca2-9601-a55e-1ba25fa5a929@amd.com>
Date:   Wed, 2 Feb 2022 05:55:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] platforms/x86: Add AMD system management interface
 driver
Content-Language: en-US
To:     Carlos Bilbao <carlos.bilbao@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, siva.sathappan@amd.com,
        Shyam-sundar.S-k@amd.co, Suma Hegde <suma.hegde@amd.com>,
        nathan.fontenot@amd.com
References: <20220201135301.158868-1-nchatrad@amd.com>
 <20220201135301.158868-2-nchatrad@amd.com>
 <dfb59a53-865b-11d5-707c-04b5401d3317@amd.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <dfb59a53-865b-11d5-707c-04b5401d3317@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d72cdd6-d8d1-40a6-be71-08d9e642f66f
X-MS-TrafficTypeDiagnostic: MW2PR12MB2444:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2444565BAB6BED1EE07D0B05EC279@MW2PR12MB2444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/MZbuu25a8aXm22kvvzkGaSubTHXN9z+ea8YQmbpUo0xsJca95D8Br7l0Cs3t/liVOXBCQcrUKixck2tcb34AdQPMSTl93RbVwoWnk5rOkkVkApw9sUQngcXLnVxoXtCWxghkZ+zALa/FP3+28vG23quf2KOL/f6aLKel57Rta2g05KbGLLY0gYSS3QNNFt4Q3QX9uIEMMtMlx3qa6Exm9Cg4GoL15Xur7knhcDZ4LXK4xy56AkgYeiux96WYidr+TmOe+so9kdsvd0btjUdO8iPq8MS0uHzKH8Jvcewmay1QL8Vpg84+zaDK1CK1kdNGmfHkc+l20nqD4Mu4chwWnCkhz9LLYbpPnk2Wbv6nnA/Ii954KW+pd7BAvgu6XZBSx/mTrcdw+3TqFxe0YbF4GxZABGDSTAiFbXKSUxwMQ4kB/iEN21Iln6elbxhcPHDQ5R10cmTcD47qxjxwly/rHwZ5u2j6PVTaK0uK9aiXTEJ9dcYqcDuGZRkku+IcDcaBdDiu+EPIAD25V+6bIg7WALVlr+r4GV1hk8iCoWqZjmX10hZbSQ0670mcNYD4dJRtF4Coy/UeMV1JeVu2eHSS1gNXnRr7XeVu6DALbK+LjofRFyx6ny6GMr4CX2EEdJ0L0a2HYziwonUh5BYZ8+UPISzfjyqrRHv+Llm9ph0oQLlRF9SEEoL0L0lC63L99NuoYQm+Z076Ts6TPlk/aKH2hrKxRClpyeySZ9S+DcG6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(316002)(6666004)(53546011)(66946007)(5660300002)(36756003)(6512007)(6506007)(38100700002)(31686004)(8676002)(66476007)(508600001)(66556008)(110136005)(4326008)(8936002)(6486002)(186003)(2906002)(2616005)(83380400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEpvY0pGSjhnWXNjQnUvNlZocWZsT2d0cFppckZiaE5iUzJFLzRjNlBVempC?=
 =?utf-8?B?Ry8veGJTUGZ4LyswTzg0U2xTd0VLN3laRFRQYWEyNVB6Vmc5NXkwQ0s0Njgr?=
 =?utf-8?B?cHlNNHBSUmYxK1VIQUZwNmRkL1UyckRLUVQ4U2JOekF6b2VHOGRPWkVBSmsv?=
 =?utf-8?B?WEpydER3N2NCbEZpSUFrcm9USWkvMTFWNlBBZWxaRm5iUXdPSHZMUXVVZEJI?=
 =?utf-8?B?amVNTEhWU1ExU0lZdzlwOHdQWXVhOFhON1JiSXZZNUlmR3hDU2R3ejVOaGk1?=
 =?utf-8?B?azU3ajBMOU55anRVQ2o2YkVQOUhEYkp0aWdvMXJoQ2QvbFRDR1NVZDBlZVdw?=
 =?utf-8?B?UVN3MmtzL1hIcWJzY0w0eVAwUUphNDR1RUd2bFNmbGxCT0MrMDRnRElnNzYv?=
 =?utf-8?B?aE5tc1pmZlZDV2VvUXo5TzhQQ0xFdktKcW9VVGRWclF1L2IxVkYzL09YZDFu?=
 =?utf-8?B?N3RkK2owSFFGKzB5eTF1TXF4cEJUVFV2eE9FS1lVOTU4bmZqZEtVMU0yUUpG?=
 =?utf-8?B?aHFxTmlqL3pkbDNCaE9KWXVMOXVGT1I1dWRGTkJsUytjbkhvbmNLTC9NZS9S?=
 =?utf-8?B?OWZDWHZjeHM2ZS82aW1QL2RJcXNFZXkrd2x0UWx5M09JUmF2ZVdTeWpzN1ZC?=
 =?utf-8?B?bkRxSTNscVQxMVowR1EyaUFqZ0dnbTJqSGY1dHVxMVhZeGtWOUZDTFFvRDBX?=
 =?utf-8?B?ejJicGVqWlA3eEJsWkF2anBkQ0lYQ1RlczZwNk9Bb083cWNDRmltaTllTmh3?=
 =?utf-8?B?NHgzbXExajY1LzhOdW5RR0dtcndGSGF3ajF6MU1WN05UTWNFNE9waEdScmh2?=
 =?utf-8?B?OTgxY2tTZmpXMWRJKzkvbnNmWko2ZHBwY0pPUm5JSVNRRHBtQ2lVRS9TV1RF?=
 =?utf-8?B?djM3UldqVGJCd0FWZ1c1a24xV1NpRy9xY3k5Y1NTVlpoeUxCN1pSeXBrSFlJ?=
 =?utf-8?B?UTRwaFZaTjd0ZDRMNjUveVE3OEZPbHYzbE10bng4M0NnbWFrTXhUZis3R2dZ?=
 =?utf-8?B?ekpFb2NXZDdFZC9kemZia3lVZGVoODZha0hJK3ZMT3NneTAvL2VUb2ZkcnNy?=
 =?utf-8?B?b21raU4wVFFKbmhrOTk2NzdrY0ZsNm1nRWdjMGQ0cHB5dzd3U1NRR2tYSEg5?=
 =?utf-8?B?S0JiRXEvamJyaWxPdGYxYUFaL0JYakJHblhkUFRsVFAvU2MvL2xLeUIvRml2?=
 =?utf-8?B?V0tGdnl2Y1d6aUFrb0dWTFVPYmZJUm9lWktiVXNaZ3dxeEo2OUZlanExRUVl?=
 =?utf-8?B?UjJ2NUtDaDRtaG9RS2NoZTZYbENuUC9FTUNENEhQUmt6cC9PZFV2K0dlUEpq?=
 =?utf-8?B?bm52UkhmWnJyNkhRdkhYUXZ3RmsydGt6T1VNNUhjWE1MTlBKeU5vZG4wUWZo?=
 =?utf-8?B?Y2ZXQkd0WTV3MEt2YzMvMUxBbmRKcm5POHRQeHJSSVZZbzRJeEtoL3JMbExj?=
 =?utf-8?B?bi9oTTEyUThKa21KRTYvVmNRMzlFUDB4UklTbERaVWFydkk0OHo4Z0hORGF1?=
 =?utf-8?B?UUJhdHhEbSt0MWhuV1B4WGlQb0FIRC9aZ2x4TUpmVDJVTEI2aDZVc3BRdTFi?=
 =?utf-8?B?Q3hNZjdvLzd2NWpabVpZaE0xMWdjd0xBSkFaaWplSjRreThKQW5kazhrYjFF?=
 =?utf-8?B?S2gvWmk5M2lQVGI3Y3lwSWNCQm1GWThPUVYyZUZlbXo0bVpzMTV4bEJmdXg5?=
 =?utf-8?B?VnVTYzNmUHdKTnJEcE1YRlVibnA1ZHRXa3VVTW1NcVdmNlY4Ymk4Uk1ObFRW?=
 =?utf-8?B?UmZ4MnF4TkRNYkFma1lkc0NRNGwrVTQzbHlHQ1QvOVRQcy9rdkd5VlVlakJY?=
 =?utf-8?B?YXdPcHdMRHBBMS9KeTl3K3QySmNiM3BRb3dvSXNwKzBIdDNMR2RuMDRUaWlM?=
 =?utf-8?B?cjhnUURpK3JmUDRBSE1PakMvbncxUHo3aGdKUHZ3V1piaVpJZEhUSXkvKzRm?=
 =?utf-8?B?WFFMTE9oWTZnTHIwTXFlZXl3ajJRRGJCekRIMFRLMjlmNi9oV3d2dG8yUms3?=
 =?utf-8?B?elgrMHVLVTB3MThwQUpNN0RYbmNqQ2M3Zlg0bFVRSG5tT2tLNXlScXBQMXJJ?=
 =?utf-8?B?VXpSLytEY0JTN0lKdkV3dy9ZekpkbE5tajA0cWFhODBBeWh4MVFHa1NadUFm?=
 =?utf-8?B?cy9lMzQyUXB2SnQyUGJCRVl1Q3JCNER0aURjMTVDU01oWnJiTWlKYXloQmda?=
 =?utf-8?Q?GvDJIfMDW6UPqy4I++H+oC4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d72cdd6-d8d1-40a6-be71-08d9e642f66f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 11:55:52.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvVGCm1z5UtEfw8FzscaOV3bS7ok3NTqPgoZG35zSzgCHlnOEzt7k9WPyUApqcEiZG4hastAqEsgHXeDA8BgTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2444
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/1/22 11:50, Carlos Bilbao wrote:
> Hello folks,
> 
> It's great to see this patch on the mailing list, this is useful stuff! I
> have some small suggestions to improve things a little more. Besides that
> the driver is in great shape I think. 
> 
> Feel free to add Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>.
> 
> On 2/1/2022 7:53 AM, Naveen Krishna Chatradhi wrote:
>> From: Suma Hegde <suma.hegde@amd.com>
>> (...)
>> +
>> +int hsmp_send_message(struct hsmp_message *msg)
>> +{
>> +	struct amd_northbridge *nb;
>> +	int ret;
>> +
>> +	if (!msg)
>> +		return -EINVAL;
>> +
>> +	nb = node_to_amd_nb(msg->sock_ind);
>> +	if (!nb || !nb->root)
>> +		return -ENODEV;
>> +
>> +	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>> +		return -EINVAL;
>> +
>> +	if (msg->num_args > HSMP_MAX_MSG_LEN || msg->response_sz > HSMP_MAX_MSG_LEN)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The time taken by smu operation to complete is between
>> +	 * 10us to 1ms. Sometime it may take more time.
>> +	 * In SMP system timeout of 100 millisecs should
>> +	 * be enough for the previous thread to finish the operation
>> +	 */
>> +	ret = down_timeout(&hsmp_sem[msg->sock_ind],
>> +			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = __hsmp_send_message(nb->root, msg);
>> +
>> +	up(&hsmp_sem[msg->sock_ind]);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(hsmp_send_message);
> 
> In this function it would be nice to check for a msg_id of HSMP_RESERVED 
> and return -EINVAL if so. The function hsmp_ioctl() could do the same, but 
> it's better here since third-parties can call this directly.
> 
>> + (...)
>> +
>> +static int __init hsmp_plt_init(void)
>> +{
> 
> Perhaps instead of __init/__exit let's do __devinit/__devexit?
> 
>> +	int ret = -ENODEV;
>> +	u16 num_sockets;
>> +	int i;
>> +
>> +	/*
>> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>> +	 * if we have N SMN/DF interfaces that ideally means N sockets
>> +	 */
>> +	num_sockets = amd_nb_num();
>> +	if (num_sockets == 0)
>> +		return ret;
>> +
>> +	/* Test the hsmp interface on each socket */
>> +	for (i = 0; i < num_sockets; i++) {
>> +		ret = hsmp_test(i);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = platform_driver_register(&amd_hsmp_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
>> +	if (!amd_hsmp_platdev) {
>> +		ret = -ENOMEM;
>> +		goto drv_unregister;
>> +	}
>> +
>> +	ret = platform_device_add(amd_hsmp_platdev);
>> +	if (ret) {
>> +		platform_device_put(amd_hsmp_platdev);
>> +		goto drv_unregister;
>> +	}
>> +
>> +	return 0;
>> +
>> +drv_unregister:
>> +	platform_driver_unregister(&amd_hsmp_driver);
>> +	return ret;
>> +}
> 
> I think we really need to do some checking for family and model (>=0x19)
> here.
> 

We should only need to do a family check, HSMP is only supported on family 19h.

-Nathan

>> +
>> +static void __exit hsmp_plt_exit(void)
>> +{
>> +	platform_device_unregister(amd_hsmp_platdev);
>> +	platform_driver_unregister(&amd_hsmp_driver);
>> +}
>> +
>> +device_initcall(hsmp_plt_init);
>> +module_exit(hsmp_plt_exit);
>> +
>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> +MODULE_VERSION(DRIVER_VERSION);
>> +MODULE_LICENSE("GPL v2");
> 
> Thanks,
> Carlos
