Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73CEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 15:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237445AbiBCPwx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 10:52:53 -0500
Received: from mail-bn8nam11on2068.outbound.protection.outlook.com ([40.107.236.68]:5395
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345506AbiBCPwv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 10:52:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzD9sjWfTFwxnKOfjGlE/fA/4/e7tkSDvFQourNQsXQaCgysMeQfYyvdgEcoEqVRpF3mKKc6xb/nqiL5mizPuvL+R3bonQ62oEjhj9dzHy4bU2Pdtv65ayBjG+/SiTfxGh4fdXIyZfxuONhv3WOSHpeKAy93j2GqP/r4UeTuOtZo1PZ9/3iE/b4WkCGYFmr2DGkR8gUKTkWuPwQaXYOr25Pp98ODz+QDe5NyU1h0LJuLfYfvzKu25dGcoofyS6B635RFFi48ezLYZ3OqDz+Ivi5AiQrLl96pHRt/ZCBxTCTNiAULOSlRfd5T9czl3LIUfrT0zERDG1JDwsjNd8Widg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvqzv0VWF6RIhkR6d/9nefENMZpcXNYSJHb9IdauyHo=;
 b=AYUHoU/tu4PIhZZ2GyBFKBQCrliRcdQveIPgpunN4N5GqP3ywfNbBkHs8mU2doOHsPFrTM1EP4NvHu0Xvow+yJd3BI/+O8hnskz21NelV+8S9jYXKrrjgnze3ZC6gjRi97IEFeDhwKvSWo6tT7LIjjob64OIMH6tlpDzr4Wb4wl3P7C50lPejhXNP73v3lZ2FG4kmWG5HKsaEnDgdBgMjyGTEWwfXLkepyzgdLgANAAM2rgtB9GWZh/gv+HHUe1Y00kFxmQ9s0E6WItWnpXUIGI+1HUTurVOGm/xElvniQrZF0MpEXwEjdb+5o93klv9qYoBcDHJV7xUDHT+kGjZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvqzv0VWF6RIhkR6d/9nefENMZpcXNYSJHb9IdauyHo=;
 b=wufgsOpGvyMifkiu6PfOIZLrRLi4FfefsHment1Dd8QAWph7AmZtVdUSyG+37b6aNrWgP7b0ilNkAimsJw0TQR3Oy0OgxgBsJGCaqWNIE3MuPSWiLMolV3MGK+ZxhbbeIoyLxdjqkELVMHfoWQL4sQhFFzKIc/YPT2vGbH3kssI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by MN2PR12MB3598.namprd12.prod.outlook.com (2603:10b6:208:d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:52:48 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 15:52:48 +0000
Message-ID: <1d5e0f11-71c7-db5f-256e-7ff85c2f897a@amd.com>
Date:   Thu, 3 Feb 2022 09:52:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] Documentation: Add x86/amd_hsmp driver
Content-Language: en-US
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, Siva.Sathappan@amd.com, carlos.bilbao@amd.com,
        Nathan.Fontenot@amd.com
References: <20220203120450.199598-1-nchatrad@amd.com>
 <20220203120450.199598-2-nchatrad@amd.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <20220203120450.199598-2-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0049.namprd12.prod.outlook.com
 (2603:10b6:802:20::20) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb3d8c1c-df18-4a02-ec4c-08d9e72d3a3e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3598:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3598B8637E29DF507EF9DF87EC289@MN2PR12MB3598.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spXjbibpbR6IFvWE+6svWdavF42/0l/Q6cnJk9EsAa5IAXNZvZzsh+a3mQ8l9JyGCE18/oIf8xgSgjZNB4Wxq3AGl01LBHioJ3DBauau2SOlc8K+pwaCwcYJSCGP7bl535newg9jhGh9uBYi4beBldWL5Qg01DvtjoSDWDF6F349XdpFKeZYK3Wqro+bWbzwcpZhqv/BJyouEq0MzpKiRvyo0N4DoghNtvFRQ1cAAwUwFwiwiVy7gDBO57/YMB9Jlyh9pSrgvVQoteAqaLY0GcpBz6ho2NCnxJ5QXmB55FY9gsF1XWypH09/QKhNy1TAjFY3bqplXiZEQtYbWfET6PXLN6ezSkkV3E3yqkb9KmIrsddZYdAIo0/1PYNQZWle+DPMdRLuOH4vuioofmDiRbPyodHsuPHCH7H/a37E9m+A3lr4qTqHkvMboDW9PVW0SgXiLeJp38vjvU+92/V/TGI3jUH3wMY3sAOIgml5EnIMR0ABieSIVq5hjrDFAgyO4SnmMzfrKTgMW+52kXnS+Snwp7Lroo0i2tuFBu6eCXiOWNDcwtCngNQ+WQKdhy9bp+42BI0ApJKKD9lmgG71NlLrvjRSGAFcFFs1JIx4oF69Jkza5SJU0ti/CIWmwwZ6XBxLmfe/SJZLVrg4GYoEXpKrTTylVroEc4snVfiM0CbUxKGRK8xjS9ZB+VHy3UZFX4meKjVsyGwnD5Uf4eACwiKaArqRF/T79ipO8FOcgVOEyLzUqQ+L83Lb58EIFBr0qMUZ1DNTMC4KGGcfGgNGrzOeME59iwbqKPWSX12j0uYjhU5ccyp0RP6q+9Y87ACkJcDHoFr6R4peOUHYVSPoOeW5e4QMAIWV1j1rjytgkDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(966005)(508600001)(6512007)(53546011)(8676002)(316002)(6506007)(4326008)(31686004)(36756003)(66556008)(8936002)(66476007)(66946007)(2906002)(31696002)(2616005)(26005)(186003)(38100700002)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzJpZU1vaWVOWHljRlpCWlNNSU05cjA3aFpIUzlLbGlkZzdIT2cwTzFQcXFk?=
 =?utf-8?B?SzFNWTFzL1Z3cjlRWHdrTXgvNEpFOTZFKzlyaHdQalJFQU1ZUys4RW4zSzZy?=
 =?utf-8?B?OTg2b0NpMTVmYmlVNjJSTkxzWm5YMW5OVm0zYTh4NXV6UzM4S1JnY3BpNC8z?=
 =?utf-8?B?SzBvZTRkZzZ2SmlmOWl4VWVRWW9pV21PK2JTdEh5aWl6cUZCelBrRWE5ZExu?=
 =?utf-8?B?VCsxYUpWNDc3dTN5WUFQVDdIcjdHUnoweU1IcGswdC84emZjTmpOVFU0RklC?=
 =?utf-8?B?Vnd4a3BmYm04YWRpdmpOM3g2TWJyUVpvTnFWWWQzemtTdWRPeHo1aVFqM3da?=
 =?utf-8?B?RVNEQ1AxZG5FdVF4T1dmZ2JKY3ppT3J5U2lsUDFPOCtyODBuNUNtYXFGSHBS?=
 =?utf-8?B?b2FYejR1OFZWRVgzcGsvZ3dyZHVsU21xL2Q1KzVMa1BteklseC9UWStUSmpm?=
 =?utf-8?B?RlMwUzA1SjIzZ3FyYlJoWUpLRVg3U215d3hCeU1nZFFtQ2hMd1VBeWJxdUNP?=
 =?utf-8?B?NkRFYm5RN2EzVHVOWlN3K0lUUDBCaWl0Qm5WN0c4bzNBS1cvNlBSdjd2WjRm?=
 =?utf-8?B?VHNyaENpOUx1RU5WaW50S2I1cU85SFFFQmVYblBFVlhHb3NQNm5xMFFCbjg5?=
 =?utf-8?B?bS9ncXBaRUZkaCticGV6MTlMM2x6NVBlRUdVTURmOEF6RXJKenlTb2RBbkoy?=
 =?utf-8?B?NUlzc1Y4SFF2TnBjTFNpUmJOL0JpYno5RDFDZSs0dnNUd2pvK2FGM3FsMjBX?=
 =?utf-8?B?UlZySi9BR1F0ZERyZHN1N29XL0hIRHdZbVdnQXo5L0dXdnZxMXAveGl3aTBn?=
 =?utf-8?B?STBFcEJQK0l3cFd0NjR4UUg2WDA5b3dqakMrNEtsZklxUHB0akFPUjFkcHkx?=
 =?utf-8?B?Wmk5YlJlY3J6dVVYaXNhdW1PMnBpRzBGSGxFVkJHMitrcUdBV29FSG0wcURX?=
 =?utf-8?B?akdFeWxMTVVZaWQvend3Mlh5emJDNmd0MDlHZU55bnZuZFc4REltVEd0Q3B6?=
 =?utf-8?B?TUpQaEg3NTY1NTF4VlhQeElGZ2R2N29jNnlVekc1UU5qVzdjL0tSWm5vSzlW?=
 =?utf-8?B?TzhrWEpTZUhRcFpJWnpndERxQmkvZzdNMTVrd2Q5S3NOaXZjeVFzQzk3Y1g4?=
 =?utf-8?B?ZXF2c2NwVkFpRmF4V1NyaFpvSnM4S0F2VFV5TktmK0N4Tzd2SVdBdzExTUI0?=
 =?utf-8?B?bVJiMzdxWVkvV3JoeDJFMGdmcjJXaUJRd3BuSGw0VElHYlZ6c2FySi9UZmlX?=
 =?utf-8?B?REtVYmgrT3FFQ3lnZmxzMkE1TFhvTEJDME9EWHkweEJESGdvdkJRUGs2TnVy?=
 =?utf-8?B?Q2NmdXAvZkM5dTNSc09CTks4cE00YlRRR3c1MnB3OGw4OTJVTnFzNzY2eG93?=
 =?utf-8?B?THNSYitNOHE1bHlVT1hRZFdPcFZLaHg4QzlmcVFZdG9NNlI1QmxCTzM0Y2NY?=
 =?utf-8?B?cExObTJBcXpRTXo1dVpEejR1M0RpN3c5dHl3RHNzL0dTcnFWMWg1MjBrM2NY?=
 =?utf-8?B?VUtBQmxUUFNibjUrM2VWRllsRk9GNzJSSFNVVzBibTk5aFRZWnRuNmhGOU1Q?=
 =?utf-8?B?OHU3dWdhQkVpaVlDY1ZZZmRKR0swaU9SY0k2dlgwQk11VlhQN2dUdjdaTnpy?=
 =?utf-8?B?ZFRXZ0N5aWFNVm1ZWGFidHdmQ3c4K2RENitUTTl3cERHOHYvQUxGdFJCMGs3?=
 =?utf-8?B?QnJyTUs4V3piRzVNc242blZ6VkIxRGU0SS91dkY2V0tQNGhKNWNYVHBFZEE5?=
 =?utf-8?B?ZUxJT2dxUzlIeXF1S0NDOEU2d2NFQVNIWmhQbkNSQk9qdG9mSUZCNE9jYllL?=
 =?utf-8?B?UG16WVAxVlA2VDlCSVQvcURWU0h2YU9pQ3RKTFFHYjA2VXA4U3dxWHVJMnAz?=
 =?utf-8?B?cVdvT3NGeFZmcGdmSW5LM1o3NmNTcytCUVl4Rk0wYVd3WldMai9RL2hHdlJ5?=
 =?utf-8?B?REVFZkgwUW9nL3BNVjZpV2FwdkpIUklaZXRwM3NXaU92RFZSMURIbnZPQXIw?=
 =?utf-8?B?MmRkL1hvc2FnVW0yN2FIb3pYNmZQV1kzR0UzNEpvSlRmaHE5RHpha2FKcGgy?=
 =?utf-8?B?Nm9ZYjl3clhTc3VLeVlQZ0QzaG9vK1M3cU1tZ095ZEMyUVU1R1FlaTk0NEo1?=
 =?utf-8?B?c2g3L3NkQWZkMTFxMDgrWU91Tys4Q3VmYVhrWGo0bHVRUzRaem1odnpMVzVl?=
 =?utf-8?Q?EwoWg2JOBeYKPCAkaKWMRP0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3d8c1c-df18-4a02-ec4c-08d9e72d3a3e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 15:52:48.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnV+M4Tl/U4ZdYBDh6GnkchFBVBv0nQhtW7YU1vdLozohkTGgwXW1+zFQ20tX0IjbXnn4sKh1iSKgOYz4DON1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3598
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/3/22 06:04, Naveen Krishna Chatradhi wrote:
> This documentation for amd_hsmp driver explains how to use the
> device interface.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v1:
> None
> 
>  Documentation/x86/amd_hsmp.rst | 93 ++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/x86/amd_hsmp.rst
> 
> diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
> new file mode 100644
> index 000000000000..b77b888f810a
> --- /dev/null
> +++ b/Documentation/x86/amd_hsmp.rst
> @@ -0,0 +1,93 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +AMD HSMP interface
> +============================================
> +
> +Newer Fam19h EPYC server line of processors from AMD support system
> +management functionality via HSMP (Host System Management Port).
> +
> +The Host System Management Port (HSMP) is an interface to provide
> +OS-level software with access to system management functions via a
> +set of mailbox registers.
> +
> +More details on the interface can be found in chapter
> +"7 Host System Management Port (HSMP)" of the following PPR
> +https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
> +
> +
> +HSMP device
> +============================================
> +
> +amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
> +/dev/hsmp to let user space programs run hsmp mailbox commands.
> +
> +$ ls -al /dev/hsmp
> +crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
> +
> +Characteristics of the dev node:
> + * Write mode is used for running set/configure commands
> + * Read mode is used for running get/status monitor commands
> +
> +Access restrictions:
> + * Only root user is allowed to open the file in write mode.
> + * The file can be opened in read mode by all the users.
> +
> +In-kernel integration:
> + * Other subsystems in the kernel can use the exported transport
> +   function hsmp_send_message().
> + * Locking across callers is taken care by the driver.
> +
> +Features support by the interface include monitor and/or control of
> +a. boostlimit
> +b. current power, power limit, max power limit
> +c. c0 residency
> +d. prochot status
> +e. clocks (fclk, mclk and cclk)
> +f. ddr bandwidth, utilization
> +g. data fabric P-state
> +

You may want to avoid listing out HSMP interfaces. The exact interfaces supported
are family/model specific. Instead, refer users to the PPR specific for their
family/model to get the list of supported interfaces.

-Nathan

> +
> +An example
> +==========
> +
> +To access hsmp device from a C program.
> +First, you need to include the headers::
> +
> +  #include <linux/amd_hsmp.h>
> +Which defines the supported messages/message IDs.
> +
> +Next thing, open the device file, as follows::
> +
> +  int file;
> +
> +  file = open("/dev/hsmp", O_RDWR);
> +  if (file < 0) {
> +    /* ERROR HANDLING; you can check errno to see what went wrong */
> +    exit(1);
> +  }
> +
> +The following IOCTL is defined:
> +
> +``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
> +  The argument is a pointer to a::
> +
> +    struct hsmp_message {
> +	__u32	msg_id;				/* Message ID */
> +	__u16	num_args;			/* Number of arguments in message */
> +	__u16	response_sz;			/* Number of expected response words */
> +	__u32	args[HSMP_MAX_MSG_LEN];		/* Argument(s) */
> +	__u32	response[HSMP_MAX_MSG_LEN];	/* Response word(s) */
> +	__u16	sock_ind;			/* socket number */
> +    };
> +
> +The ioctl would return a non-zero on failure; you can read errno to see
> +what happened. The transaction returns 0 on success.
> +
> +More details on the interface can be found in chapter
> +"7 Host System Management Port (HSMP)" of the following PPR
> +https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
> +
> +User space C-APIs are made available by linking against the esmi library,
> +which is provided by the E-SMS project https://developer.amd.com/e-sms/.
> +See: https://github.com/amd/esmi_ib_library
