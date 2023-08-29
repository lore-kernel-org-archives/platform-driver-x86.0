Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31360C71153
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 03:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjH2D5C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 23:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjH2D4g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 23:56:36 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4640EBC
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 20:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuzBL89osYj4pdidXxOtoXtcAz9ze28kYz1D+ucHcvIOTtyIsn98h0AxPGJLffP8rczRpXb1ejl+XL6+GjJj4tAN/bZnI/kGNWWVHJzsBKjy3CnsRnFvKfY4LISTo2LsEF33sLUE5ubwiD77pUU9nQBcdpVAcSpg7TlTYjH0bZddUTQSXpXBkIF2yTVkDt8+17FIoHEB/GnCjzzCe4wgHY8+6WgC3psi4Xdn3YxVtTTw76eIV7DanZjZxScAcKdV9hWGVa/IVVb2c+khd+ANDvYAz3As1fWq368GmZ8JjRCnYrw9LkesvP+SOZ41kipJTifvUehybb6JfM1dSFPS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1kGjJ9Abx7jhXxKmLWhEOdkOseg1gc5t9TrR4oFm4A=;
 b=HNkdiFClWc0EeD/y4bkqrM0tvv5IZAQGutaB/p2RiWV8D8kwFI6uIOoIXRZb9Df6p7KG14uFdMSBdO5ejJ5qnG9gTCuN8STg+rhKfsgaDRiiWmBfMBV0sTlm8N9vWqwUr3KkJf14oLnXDPUTlPIkfEeiVIC8Pp4EJxCZINP/oqijTAcQQyDiyxqAB+Edy51fK2wM+T8Jcs9FD+paatmBszUBEA6/smWDqidP5iF0nfG+B1idCMByGe9lWtRz/dZ8DpM7e9B8i97fHeYYt/Yi3T90cNMyLatslYFiD/AX5FwqCPP5X2S/oWHy4H03Z0a8lAZ0Q2ZCo6Yh3PUVyq2GEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1kGjJ9Abx7jhXxKmLWhEOdkOseg1gc5t9TrR4oFm4A=;
 b=dL4Tlee1XMvT5a8NSgim8hlfxR0UC+l6azRxf1FSK/xXriYjFFvQOLdx1HgLm/tplFPpPuOnFbUFEegHEtCcetma+AWrMhy1AUjvrpY8OW3FWnaJc8okVqqisf43x59Efs5b+2rT0k74URod7iSvUltMxiPOm1iCs2+zScGFhgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 03:56:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 03:56:29 +0000
Message-ID: <1cc2c9cb-f0d1-932e-541b-7e8ef398d3c2@amd.com>
Date:   Tue, 29 Aug 2023 09:26:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Add PMFW command id to support
 S2D force flush
To:     Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
 <9a9f7b6b-45d6-42bc-9a98-fcfff2d83f3a@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9a9f7b6b-45d6-42bc-9a98-fcfff2d83f3a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: c554f8b0-8500-42d9-8312-08dba843ece8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSZ3SHMKHerWa1PRl1wNQju2zeiD/2UT3wlPAaHgZyUa/evaG4h15UqhPcOzVp/mCltskXJS0l8ZoU4HFOHLhOHb77nHUjCYevjALitP76ltZBnYPhqV1Fi2xaLFNKyT8H4CDiif8uvN+0EsJGONTUrIs4OJ6OM2tZaCVUWMOozkfyWbDHJ7SUeS4n9yIzAX42KW4/4+L0gBPzp6rk27V2O79sQNYPaGbOICE/7KlEGGyN+ota/6xLRT/PzawMeVulhEfK3hpt84wjoaeYZk22bLBnYRQat1az1BRRgVEWZPBugmJ4o2ZXvK9fbxFTS7sgJ392zn50mqxJFbky2GhMv5kLatz/ATK2xlT+nAgaSEHVTmYNj/K41/EaBOFna0zCsvKU88NYhK1BJcAd2DGeDYjd3QwrEaxSjFnkEtW8n8qvk1SPv2MU5Nc+eKhC1zk7gxEpBTZJ/S2o+SxKNm4VJiXxMwHzTYMkZMCD+3JVRVQUyAyo82mmmYPeP+iacEpYsdhqOq4sedeUWggN9Vngyvm6LQBxSx8zBJlou7s8u6tMdJWtuuazY/q77X7C0U6+y3cMQcdJ1H6/rWvwYQDkN+qEoJi2x5qb8OazhJSwngw5Zesem6Y9DpnE/1k0/x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(41300700001)(4326008)(2906002)(83380400001)(31696002)(86362001)(2616005)(26005)(36756003)(5660300002)(8676002)(8936002)(6666004)(6506007)(6486002)(66556008)(66476007)(66946007)(53546011)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVN0T2FrZEtRZk5NOExES2p3ZnlCd1ZES0tiK2NZdzlpV1BXSkkyZGp5VzdR?=
 =?utf-8?B?eGZnWDNrZGJKTWh4b0JCekJFZkVPanFCaDk3dnZBaVN5Ylhqb1phUEFaVXpY?=
 =?utf-8?B?SmFMZ0w2VThrZllxMFBYM0JNdlpwb0hrb1pnMkNjUkVyTnBCVEhYdXdNQ3JM?=
 =?utf-8?B?dVkwUFF2b2lpemFzcU9VcFFJK2NYbXRJckFTZUp5OEVtQU5GTTMxRUY0SHlP?=
 =?utf-8?B?alNBZUxSY0M2cHhIUHJmWEIxd01Bb0VPR2JSWGR0eXFMZjNManlxSjdCUWhw?=
 =?utf-8?B?NmZPcDNEWW9YS3FSbEVhc09OaXVCbzF6UFhxelpMOU9ld09jSnRQR284ZkRm?=
 =?utf-8?B?T0tid1lMV1h1b0hTWktBazl6VVUxK0EvVkQ5RHN6SWJvYno5RFlNYnk5a1Jk?=
 =?utf-8?B?dW9JbEtVUWhzNURHcU93L2xab1NOQ0J6MEdieU5YT0JqMUxNSTlRWTJuM2JF?=
 =?utf-8?B?SHREM1V5U1FrTDlIWm50OWpKeU4wNWZyYU0zZnd4Z1ZkNDBmU3d0Y0pmbXpr?=
 =?utf-8?B?bEFYU0s2Sk9lMkwzY1ZZYll2azZkOTJ3dUtyNmhsL0h0SWlWWm5vSnI4Y3FM?=
 =?utf-8?B?SGl5MHV1SkJKdzBLUGhxTmZRdytzNmRzZE9jVC9KUkN4TVdyazVMYmFPK0s1?=
 =?utf-8?B?WHpXWVhCUGRHU1ZpcXM3bHVncDdLOUVpWGJ5N2pBWlBiUjBQRXNnZGJXZE83?=
 =?utf-8?B?Y2dBYVNVY1FadU85OWl1WngwS1Brd0tsU21SVlVGRXFqOWxwaEJEbDhqWEJ3?=
 =?utf-8?B?MFo2cGdGNnRtRDltSUc4ZkR2QTJkM05hQ1FPYTRvV0pqaHd0S0NUb2c1MmJ3?=
 =?utf-8?B?V2JzVyt2R2w2NGdKN1hwZW8wMUk3QnhWQnFuc2krdURQYmZueThGS25DUGtH?=
 =?utf-8?B?MTZSYXp1R3RDeDl1SGNRbTArd3NISEVFUWlBNk5NbE1lTlg0UTZwVXVjT0c0?=
 =?utf-8?B?eGk0UCtIUndRazc3bjc0Q3VQSnZZbGF2QTJIUUpFY09ILzJTMzZ6dGVQVVRY?=
 =?utf-8?B?UjVsSytsYzZ2S2N2UDc1aEpnMzFmMkplTk5pV0dTOCtvSVlQeTRrRzB4NS83?=
 =?utf-8?B?ZTZPeWFhVlQ1STBvRnQ2blR3cUJBL1pLd3dveUZBdHQ0dXNPbVNoaXhxbnBr?=
 =?utf-8?B?eU1GZDhxZ2hZMXVCNkp4YXF0OVR0TDYxdGErSW0zSllrQ2JFYm84QVBnaVI5?=
 =?utf-8?B?d080ZWkxVHN0ZVNzQTdnREQzU0l4Y2s3STgrSkt5WDdSdWpGRmZQNUNCMHND?=
 =?utf-8?B?aFJkaFFCcW5vZ1g5ZWtHVnlOKzZLWWtEY05kK0ZhZkltOG1aVjQzS0w5RzdY?=
 =?utf-8?B?eHo1b1FKWlNoajk0cmJlY1p3ZEdJL3dIZDRYRFI5VisreU4zaVNqZDVKMmpm?=
 =?utf-8?B?bVJiUkdqQUFIQi9raXBYbUVWSm5sdUlYMUlxVGlpS0MySDN0c29BLzhJdXZz?=
 =?utf-8?B?T1A4Q0gzSitUdmtMcTRTY20wT1lRS1Q0UW1zcUlnamtrOGNGTHBxejIwcVVH?=
 =?utf-8?B?UlE2L2JoeUh6TCt3c0Rrb0pUZlNwTjlyakQ4WWd6d1VRZ2t6RXM4cDAxeG5D?=
 =?utf-8?B?dFRncHFUSHRqRlFCTWVKM0g4c0dTQVMybUtrSlc2RStvTUgyK2tyRi9vL0pk?=
 =?utf-8?B?SHZBeEVWejR6a1BFZFJ6Z0lIakpJWUQ4dkZRZGswNzlERmpObG9WdmtFSVFt?=
 =?utf-8?B?UkVFNU1rTUpaTGIzR0dOUXJFRWdyeElLTnRXelRPeEVMU1cyOWYwV1F1dSt5?=
 =?utf-8?B?a3hNWVluUWM2RmllaHFMMzhXUVhUcC9iZy9aMTRpODhQdHMrRDRENjk1TEZw?=
 =?utf-8?B?cEs3eFB5eTdsTkxXQS9kT3BIczFaVGIyZ1JjZWtBUUJqUUFsKzFxZXhIYWMr?=
 =?utf-8?B?NGtIaVVoTnhmaVZKMktUVC9Td3VxaUJaSUNIelVFNlRXWkp5WUxkWmRqWVYz?=
 =?utf-8?B?Zk8vY3oxa2Rwc2xmdXE2aGkvUWNnLzJzTWtncVR1S1A2dlJVZUJsNGdlQjVl?=
 =?utf-8?B?TGxKbytyRkg5RFBKTEQ2cDh3ZkZ6UUIwOFB1ampySjhlUHJrU1RoRlkvNUw1?=
 =?utf-8?B?anBUYVBQTUtRQVR5dlFNZ2xSR2NmNHNXdHh2cVV4NjcrYzBnZkhHbVNDMFFE?=
 =?utf-8?Q?7gwvkvrS3siUUBBXFnakDPfAs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c554f8b0-8500-42d9-8312-08dba843ece8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 03:56:29.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeWOX8bLMmwPcJXGvaGyYFuTfwWI5DfoAF2Q1JFeyOoKbafvepZpZCF7XW4FpVVVORgp4xO8OYk1WlAPGzSzfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/29/2023 12:47 AM, Mario Limonciello wrote:
> On 8/28/2023 10:21, Shyam Sundar S K wrote:
>> Recent PMFW have the capability that can force flush the FIFO
>> contents to DRAM on sending a command id via the mailbox. Add this
>> support
>> to the driver.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v1->v2:
>>   - rebase to 'review-hans' branch
>>   - drop 2/4 of v1
>>    
>> (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>
>>
>>   drivers/platform/x86/amd/pmc/pmc.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index c1e788b67a74..c92dd5077a16 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -55,6 +55,9 @@
>>   #define S2D_TELEMETRY_BYTES_MAX        0x100000
>>   #define S2D_TELEMETRY_DRAMBYTES_MAX    0x1000000
>>   +/* STB Spill to DRAM Message Definition */
>> +#define STB_FORCE_FLUSH_DATA        0xCF
>> +
>>   /* Base address of SMU for mapping physical address to virtual
>> address */
>>   #define AMD_PMC_MAPPING_SIZE        0x01000
>>   #define AMD_PMC_BASE_ADDR_OFFSET    0x10000
>> @@ -236,7 +239,7 @@ static const struct file_operations
>> amd_pmc_stb_debugfs_fops = {
>>   static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct
>> file *filp)
>>   {
>>       struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -    u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
>> +    u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>       int ret;
>>         /* Write dummy postcode while reading the STB buffer */
>> @@ -251,6 +254,10 @@ static int amd_pmc_stb_debugfs_open_v2(struct
>> inode *inode, struct file *filp)
>>       /* Spill to DRAM num_samples uses separate SMU message port */
>>       dev->msg_port = 1;
>>   +    ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>> +    if (ret)
>> +        dev_warn_once(dev->dev, "S2D force flush not supported\n");
>> +
> 
> As this is only supported by some PMFW versions, isn't this message

I believe this is going to be supported all the new PMFW version, but
yes its going to be noisy.

I have dropped to dbg and sent v3.

btw, I missed to add --subject-prefix to my v2 submission, apologies.


> going to be pretty noisy if it's used on something older?
> 
> As it's not critical I think it can go down to dbg, and you should also
> add ": %d, ret)" so that we can confirm what error code if something
> ever goes wrong with this in the future.
> 
>>       /* Get the num_samples to calculate the last push location */
>>       ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples,
>> dev->s2d_msg_id, true);
>>       /* Clear msg_port for other SMU operation */
> 
