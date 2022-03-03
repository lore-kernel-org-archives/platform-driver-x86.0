Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAABC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Mar 2022 15:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbiCCPe2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Mar 2022 10:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiCCPe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Mar 2022 10:34:27 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569891409E3
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Mar 2022 07:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LA7RyjHcTypWIvsFhnINGRQiZT2nGMm6K2aW4G2zfTETlrdQsrZIDt5+qpfrAT1HG8YNP75scN4++UnjpMJe6o7nHI0pQjOAE5rflYi0bf8IcptpmTm9WTI6464FyXyZT2qgBkmWeF2qDWRwJdiBJEHn3uBp6H7W837+lCqRBjcpYOLAocOF2Zs8f3HuwapKARFc+8PtYa+v23tuzfu2z5X7Aik5cqm0yCK1k2joMfhD+Vc00FjJktpb5aUDGyylmhakBQSAITzErfLS+PlydH9mgEUT4RG6yvbG5M52PjylY9G0EPkvRpaYyYo3UN7Czj7ZDK3Hk61e4L4g21zEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc4N3fzWeLoicTVSjict/HFAfLXojVS/3Qfc7QYq/20=;
 b=HyN/Sdv1grxHJfLZOE/YhpwGFRbYP1x19gmoN4I7f+ePUK+C7uftIGVFaYA+DoIwT8AuIfI9WOIHEqtRhY6/FdeHyVfoIIC8hH/TfVaHjcjTWBnfHLOaEQt6dWmiEevpNalkMTDm4hk1FDiLcBigpZLsMF1wVSdyWS8/7mSXWUXTAIINPff8MVm58zYzse8wyRcFcUQp8ahhbXDleaKI+QD+Sgu0EBPWtfh371cFBCtDIbAL9Cd2u0+6u1STNBTJTbWSuUogwo7kn24MOgJWl9jS4/4XL2oxj5E34QAtkq4vOLGLdepkybZUgha5QDeCI111nI1BlbWYe0ogF6Kxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc4N3fzWeLoicTVSjict/HFAfLXojVS/3Qfc7QYq/20=;
 b=UxZjNEGMw5JZ0DqcNJ4PzkYwOIcymgTq8M3Himvuw/Nr0MG5+xwGH0wer2tBkefQ+VAAyKQzU09MQLwEuyifW/TvNAQRRHFq5Kbv6JjWIWTjXN9VZQ4vJUCc0IHPPOLFOnTAadUtIhTW8500eTkZ2yFTDZG/eJETKEuKSo8MWBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13)
 by CH2PR12MB3797.namprd12.prod.outlook.com (2603:10b6:610:27::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:33:39 +0000
Received: from BN9PR12MB5291.namprd12.prod.outlook.com
 ([fe80::3061:94f6:750f:b494]) by BN9PR12MB5291.namprd12.prod.outlook.com
 ([fe80::3061:94f6:750f:b494%8]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:33:39 +0000
Message-ID: <e1cacaed-e900-923d-fdc2-bd702a5c2584@amd.com>
Date:   Thu, 3 Mar 2022 21:03:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 2/2] Documentation: Add x86/amd_hsmp driver
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     carlos.bilbao@amd.com, siva.sathappan@amd.com, song@kernel.org,
        nathan.fontenot@amd.com
References: <20220222050501.18789-1-nchatrad@amd.com>
 <20220222050501.18789-2-nchatrad@amd.com>
 <a4c32908-3f54-c375-5efe-fd4daf8ebdf7@redhat.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <a4c32908-3f54-c375-5efe-fd4daf8ebdf7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To BN9PR12MB5291.namprd12.prod.outlook.com
 (2603:10b6:408:104::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f7cfa7c-b06c-4417-7f7d-08d9fd2b305f
X-MS-TrafficTypeDiagnostic: CH2PR12MB3797:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB37979E1CACFB5ABDC73BD882E8049@CH2PR12MB3797.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtqobYDbTgzTj4DvwSo8NTaMNkKqH5Rl6YW3PbKS1obNThbsDDQ2ujDL+W2m9CqiuNaqDlaYN1pRTyS5S3Aemn6vv3QopaNd5vnfxJq5JAHCToNqGIwuNsNK7uEuWmvXYOG2opZSkRPdDvnAg7WEdijStsRYV+RNJBmQrVzzYKEOQEhUSyFpllP0SLCkSnII5GPC/kbNKylzlLuOlNTsoA3LhUwyYl4DxcnNcikJ+aJcfelhc0ZQJFaWWxnJgn6S/JxtsJsOoYJFQ5qR+ZpHDzKfLVlwKQ16GeMNb4ytpjvJ4JmJQVReg5M7cpMD1rhe4fCih07k9g+kUv6D5v85eKLUlTW2Z47yZZylzZjzoNfV1M8piAcjIz1/22mT5S01wJk+XdgIWSCt5cL6dEsEPq87RhLq538Cc+CO87w5gCWsStpbyzDUIZkStZYPQZzGbZ1P+Ut5jklfqUWH0KeDtvCbxh8KFmEFbdlGa5Y1AltYw9LssiSnz393tlWL+/Ri6je/vtVMa12n7Mqxncs82kB3LGGDdNditGFsh56qDzGbf62qClzMgmTpg+LSroGN3BuN7BlZf+JGCQK+1DYyjZLweGTaUt84UI6cT5O+q/uFK6535QljPeIA9NXLECtOquC+G+dLK8HT123hHx/eDgOcZBso8SklpOim/OJBE2GdQd4yu3j/ly2P5dz/GyXY4SWxToAMcu1orAXdyMLMXuh+0Lzu1MbyHRsLkT8FH4fPFJuPLa3HLJ3bhiwnKi5czC82fq2A16MlFno59CY7RpBBrgeO2EcbxyBbiCUL7HrwW5xznBhLAluzux+LRwFUxRwdW/Ijg2ShdLIsbt1p6eA99c0GVWygd7/aOLGonxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5291.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(6506007)(53546011)(186003)(83380400001)(2616005)(26005)(2906002)(966005)(31686004)(6486002)(36756003)(508600001)(45080400002)(4326008)(316002)(31696002)(8936002)(8676002)(66476007)(66556008)(66946007)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RFZDN5RzRKUllSclZpbjRWYVFWWUczMmtVM2hTU2lCbnlFVW03d1A4R3hl?=
 =?utf-8?B?eTg2Tk5IWWRFelhqdG9aUDdpNkpwSUZpdHlUT0xjUlBtVXh4blBDK1c3V1Vx?=
 =?utf-8?B?bGg4MHZhazlTY1ExaWhhV0tYUVZFclExWE45T1hCejYvZVd3dHJDbTZjK0R1?=
 =?utf-8?B?Ni9GaDhFN096MkcrV3hINDRNOXUzNXRVNUtCTk9EbXdNZ0FKcmxaUmlub0Vr?=
 =?utf-8?B?RDU0ZUxuc1VSUVM1c2p2a0VMdktvb29hZ2o1SEhDMWI4SG5YNGIrR0pIRm55?=
 =?utf-8?B?MmxhMlBmb1FhTWl1aGlBekFGMDllL2xNWnNQWFBFQ0dxc0lqVnA0NWtDZUxu?=
 =?utf-8?B?Qlk3ak5kOUdZbkpoM3YzcXRKUDNwd3RFYUFRRW5rVmlOREJWLytwYkkvMUpS?=
 =?utf-8?B?L2N6SEg2UlVqNWxTNkJWUVJkK2d2cFFybEdiRFo4ZkJNQUc1SjNEUTVXWnY0?=
 =?utf-8?B?b3dhcW9xVmhuMEh0VG1NbVFSRkVVWHVqR3dsdXZFQTkvWWtGYjc3cDVuZHR5?=
 =?utf-8?B?dTNzL0V4S3d2MUNsL3FFTVVENDRRRTNBRW93K0pVRTBza1BDQTZ5bjFxSENF?=
 =?utf-8?B?VjRFRTUxWTVCNVIxZHdaSEt1OXFNVE5VemM3b2xVWEc2aWJ6QmpBOXh5ZHB5?=
 =?utf-8?B?RE1rZnN3c1oxdVZQM2tCY1ZGeU4zSllLTENsc3lHTWlhbVNOR1paNEE1aFNy?=
 =?utf-8?B?R1Jlb2drOFBnc2x1OEFzQm40YzFwRER4SWpWZmlXR3I4ZnRVSm1Za2lRaDht?=
 =?utf-8?B?clRoTmxaQ29DNzFtalNFa0M4dDUvRU5xTExCdUIyZExtVDRPNUhDZjdKdzFQ?=
 =?utf-8?B?Y0pOSmdjOTB4ZnJGa013d084cTZUV0hlRXBGZm01eXVpeExCaHltRUJlNk42?=
 =?utf-8?B?WHNHRDYreSttV2d0Mml2WFcvTi9tZjArRmUrM0VsUEwwWk5IRzRhUzVqT2xU?=
 =?utf-8?B?MW1FTy9SK3pQMkhLcVF5WUI1NGd0KzVMa3VqVThNa25oTTlBRElQVWF1VmZz?=
 =?utf-8?B?NGJVeWxQOGpxbGVXTjRsaDVrKy8vWS9iczRzcWoxa01xY1JuV3g1WmVsdEg3?=
 =?utf-8?B?dHN5WHJaNnBrL2FwcUNkZ1V0YitnMy9pVnFBeUlNM2JoZFoyZW9ONUhyS1g2?=
 =?utf-8?B?TUtNZk0rOFgxdWVKVm16RUNoRDc2TXJwaGw2UkZ1UFdCZnUybTlwbTlvcUVH?=
 =?utf-8?B?UlV2VFpXSjdZOGpKVjEvVncrRllmQmlFS3JZd1hINVByRXowMkFGK0RhbHlh?=
 =?utf-8?B?RDgzRmZSaHdpR0Rrc3ZMSXYrdlo4Tk81WklPTllUYm8vMlkxeFAzUWNnM0Qr?=
 =?utf-8?B?aUdMeUJKdEdNMTlZMllEMWxFNVBZSHh2YUdWenF4R0lqUEg0S2RhUm5Ncm5W?=
 =?utf-8?B?dkpSYXBVVmljUEV6bFUybkJnY2JxTm1oR05GUFBzZ0xnRzNJdUdNUzlGa3Aw?=
 =?utf-8?B?cWxIMmV2NHUvSXg3b1pUdFB0WjhnTWVvZmJPeFdxOTNVUkVQQ1d4ZW4rYVFu?=
 =?utf-8?B?SnlBRDIxVDBzVFBiaHo3MSs1bTljcnN3c001Q2hvZm9mTUpHUTBaZW9pNVJH?=
 =?utf-8?B?ZDZCKzZxcWJRY05KV3NlTlRpSXc4bEkvMkJ3SU9TZ1VlbjRlS0JhZjMrbU40?=
 =?utf-8?B?UnN5V3VGcjN6K3M3VTdwMDc5cHZwZEZZQWl3aXl3Z0oxbW8vbnB1bnkyYWZI?=
 =?utf-8?B?ZmZGYW54RjBYSjdxcUd5NTRvejFmZGRuSWRuWWs1NCtxSW5JN0NmdnVIblp6?=
 =?utf-8?B?THBvR0ZuQUt0aWVCYXp3eDRNdStsejBJRjQ5ZzZVNmRNQllZQlB6T2wwQ1p4?=
 =?utf-8?B?K1lacmtVMEtxMXdOMTF4d1gzQjVNak9oNnFYNnlrelkxUkFEaWN0UURqZk8x?=
 =?utf-8?B?NEY3aFIzc01GdFRZM1IwWDgzQXp0cXppNTJmTEE0RkRLdlVYc0FJZDhUWXZy?=
 =?utf-8?B?SXg5RHVzdnA4Um9KUXNoY2xpR3d4VkVYdGhMYjhLWUt3SEpCcWpGUXdMTGdV?=
 =?utf-8?B?OFFHZXRnWlhwVGJ4MytjWVlMYzliZTFSL2tmRDJOamV1VnR4UUxNYTBFVHVK?=
 =?utf-8?B?cFFZOVp0NWdGM29jRmdzbU1ZdC8wYUlKWmdwMElQQnhlWVc4RFNrYmp5cTRB?=
 =?utf-8?B?d2J5UisrYTN6d0tWNVVicXR2dzd2NWZQZEdKakRuZllzb2tVRHg4ODZZY3Vv?=
 =?utf-8?Q?xzfn1867QSyYzCWNYCc4S7I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7cfa7c-b06c-4417-7f7d-08d9fd2b305f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5291.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:33:39.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC9hPCstKuDBh3YVWgiMaAiPh99+3C/cnqgJEm4qJS6WUyy0dxeNN2qoqRn9lMRxzAraxaEnUTrLsLtYMKY3Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3797
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

On 2/24/2022 8:50 PM, Hans de Goede wrote:
> [CAUTION: External Email]
>
> Hi,
>
> On 2/22/22 06:05, Naveen Krishna Chatradhi wrote:
>> This documentation for amd_hsmp driver explains how to use the
>> device interface.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Acked-by: Song Liu <song@kernel.org>
> This patch causes a number of new warning when running "make htmldocs":
>
> amd_hsmp.rst:51: WARNING: Literal block ends without a blank line; unexpected unindent.
> amd_hsmp.rst:68: WARNING: Literal block expected; none found.
> amd_hsmp.rst:69: WARNING: Inline emphasis start-string without end-string.
> amd_hsmp.rst:74: WARNING: Definition list ends without a blank line; unexpected unindent.
> amd_hsmp.rst: WARNING: document isn't included in any toctree
>
> I've fixed these before merging, but next time please run
> "make htmldocs" and check for new warnings before submitting
> documentation patches.
Sure, will do. Thank you for addressing them and accepting.
>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Flog%2F%3Fh%3Dreview-hans&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7Cac8101d2dbed4f228b0208d9f7a938f5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813129193048361%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=KgolLZNNVoNynBa3nAt6agnb271BGHEev%2FXB0fKVIxc%3D&amp;reserved=0
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
>
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>
> Regards,
>
> Hans
>
>
>
>
>> ---
>> Changes since v6:
>> Add acked by from Song Liu
>> Changes since v5:
>>   variable name changed from buf to args
>> Changes since v4:
>> struct hsmp_message is updated
>> Changes since v3:
>>   remove change ids
>> Changes since v2:
>>   Add statement saying the HSMP interface is supported only on
>>   server cpu models from AMD.
>> Changes since v1:
>>   None
>>
>>   Documentation/x86/amd_hsmp.rst | 85 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>   create mode 100644 Documentation/x86/amd_hsmp.rst
>>
>> diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
>> new file mode 100644
>> index 000000000000..9de7e028d6e3
>> --- /dev/null
>> +++ b/Documentation/x86/amd_hsmp.rst
>> @@ -0,0 +1,85 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +============================================
>> +AMD HSMP interface
>> +============================================
>> +
>> +Newer Fam19h EPYC server line of processors from AMD support system
>> +management functionality via HSMP (Host System Management Port).
>> +
>> +The Host System Management Port (HSMP) is an interface to provide
>> +OS-level software with access to system management functions via a
>> +set of mailbox registers.
>> +
>> +More details on the interface can be found in chapter
>> +"7 Host System Management Port (HSMP)" of the family/model PPR
>> +Eg: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7Cac8101d2dbed4f228b0208d9f7a938f5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813129193048361%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=751ukAhaHNuvoXtPZVr8ZBSIA7oWs3gdZijj72AXGVw%3D&amp;reserved=0
>> +
>> +HSMP interface is supported on EPYC server CPU models only.
>> +
>> +
>> +HSMP device
>> +============================================
>> +
>> +amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
>> +/dev/hsmp to let user space programs run hsmp mailbox commands.
>> +
>> +$ ls -al /dev/hsmp
>> +crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
>> +
>> +Characteristics of the dev node:
>> + * Write mode is used for running set/configure commands
>> + * Read mode is used for running get/status monitor commands
>> +
>> +Access restrictions:
>> + * Only root user is allowed to open the file in write mode.
>> + * The file can be opened in read mode by all the users.
>> +
>> +In-kernel integration:
>> + * Other subsystems in the kernel can use the exported transport
>> +   function hsmp_send_message().
>> + * Locking across callers is taken care by the driver.
>> +
>> +
>> +An example
>> +==========
>> +
>> +To access hsmp device from a C program.
>> +First, you need to include the headers::
>> +
>> +  #include <linux/amd_hsmp.h>
>> +Which defines the supported messages/message IDs.
>> +
>> +Next thing, open the device file, as follows::
>> +
>> +  int file;
>> +
>> +  file = open("/dev/hsmp", O_RDWR);
>> +  if (file < 0) {
>> +    /* ERROR HANDLING; you can check errno to see what went wrong */
>> +    exit(1);
>> +  }
>> +
>> +The following IOCTL is defined:
>> +
>> +``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
>> +  The argument is a pointer to a::
>> +
>> +struct hsmp_message {
>> +     __u32   msg_id;                         /* Message ID */
>> +     __u16   num_args;                       /* Number of input argument words in message */
>> +     __u16   response_sz;                    /* Number of expected output/response words */
>> +     __u32   args[HSMP_MAX_MSG_LEN];         /* argument/response buffer */
>> +     __u16   sock_ind;                       /* socket number */
>> +};
>> +
>> +The ioctl would return a non-zero on failure; you can read errno to see
>> +what happened. The transaction returns 0 on success.
>> +
>> +More details on the interface and message definitions can be found in chapter
>> +"7 Host System Management Port (HSMP)" of the respective family/model PPR
>> +eg: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7Cac8101d2dbed4f228b0208d9f7a938f5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813129193048361%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=751ukAhaHNuvoXtPZVr8ZBSIA7oWs3gdZijj72AXGVw%3D&amp;reserved=0
>> +
>> +User space C-APIs are made available by linking against the esmi library,
>> +which is provided by the E-SMS project https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdeveloper.amd.com%2Fe-sms%2F&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7Cac8101d2dbed4f228b0208d9f7a938f5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813129193048361%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=%2Fe%2BQAKkHf8VUGzxbJLsvnCtEm1UAhCOpepV6lLhtah4%3D&amp;reserved=0.
>> +See: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Famd%2Fesmi_ib_library&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7Cac8101d2dbed4f228b0208d9f7a938f5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813129193048361%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=LO1NdoruQ2SrBGrPeJcISwWYuegg42mDJPZu18len9o%3D&amp;reserved=0
