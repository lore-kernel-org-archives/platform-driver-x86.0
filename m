Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1999C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 06:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245020AbiBBGxG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 01:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiBBGwi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 01:52:38 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0C3C061748
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Feb 2022 22:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mct5sx+uG54rsO3/6jqZNXEwsA/seJkqKT8FVfcr3ep1LxK59PWamz1LQTgIAz7IsbP7L5CM/qYwSx4nUIssfyLvyS0z5OX5o9BA2CQCFryyJl6nA52PBVTpsN0ihz++D4EwGcmEO2tyVRIv98X2WxU6bhPH5+46XButYLvNXW1Oxg4efHivPS7Iu/nBScQeDVMARjRT6gIOe/zr5RFOC5ew7cKrjLwAq5AjAO0Pr39hMpiwIhGPYQiM5dL17es//JQkOcDBFnagRr7xx20pc9OUm+Fb372nR3w5Z4g6wIyDLvmxPoDjIhnvehkA++T+eR99+CYaLeoQ0UZVsWjZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifTbnRsg/Ng1G5VX1znCwkLGHoi9HBNNvB8bVWmezNg=;
 b=YGYWTJv3jXOSUIHaUp5oQKhr9qVaaFYx+oxB1QHLcpGft3zr+OAk1qc6npWAQ78S0bncxYDBGyL4olsN/YmB5OreUAWFC2fWNspZMMyNBUSmCpIzc5uLIaczsvbwYP7Ca0JzGFtfyTuZP0a/oMSRGiBA7YF8+lcdZ8zAlnzGJgvKb+c+bAmPLMfvsshMKnmSlXA9iVjw7fx3tVVDobooX41wbaadvZCAroaq3eKj4aBWeZUauCoRZ1vHbx7msVfhuQeGXcn5N1BvI+iyFMCspTxH3Xu0PT5xDRj1LXZRXHLK4t99OifJmpDVbOAslNrvyyg/lq9wwJGAHDbPnHtVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifTbnRsg/Ng1G5VX1znCwkLGHoi9HBNNvB8bVWmezNg=;
 b=C+bVRTQye5MLmXyVmDSY9Lsq2FotwpFMpt8iOshuzLB5cKd0ApROov0XPS2Wnoo05VQXs3V6XAqYIzBoYZCvBu3cZtB0aM3YkYJ55rDLh0PaROxCiWXvycdkhzNlGLfKoQYZ77dMENT20FvAoXC+qGJ4sjkH0kBk/gLA9VD8oCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 06:03:11 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c194:a53d:81a2:ddf7]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c194:a53d:81a2:ddf7%7]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 06:03:11 +0000
Message-ID: <b01dd497-2b1d-4d0e-5de6-67081986f066@amd.com>
Date:   Wed, 2 Feb 2022 11:33:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] platform/x86: amd-pmc: Add support for AMD Spill to DRAM
 STB feature
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220127100913.2819051-1-Sanket.Goswami@amd.com>
 <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <eb2b2f5c-a484-72af-b275-297533a84c57@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb18c42e-7da1-4636-0ab5-08d9e611b126
X-MS-TrafficTypeDiagnostic: MW3PR12MB4523:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB452315D12DD8504EFAA3E3009A279@MW3PR12MB4523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jUEJHygmSLPLQBgSI4/OFxkbCjlxPezvR1Yf77gndY+t+uRxTJNDgnNWqVqDXfAcbaBPC7dc0yVl4soLnDg3X9TiAGP5oGVeqhYL9gREjEAzrssv9ANgy0XZJJsJ5BGWg/Mj2pSsvcXse5uT0KxowJmRtOAoU+pfcoLsa9iOOIWlXAsl/5h6hY9P1heR91xc0cx59BCvobRcLxM9pP3+6xql/b3TROGUk0W4uhtDLPJ3Sj1BmgZ6WLHdlp4yOIw/tSOlidKCBio4YNk28vttfXru3KyLQ1Wwi8h/UcHXrFKu3kwvHix+6zJ+xku7ovWLVNVJs2TTpJxXH7RXftkRBN/4ldF8eHr/H5gKxUBHF2HE2byO3WljhkMcMdY0XjQB+aEgoUS2iJTevVXy/GqWuGd2w8jhSvpP3dCJxIWU+HybudowlUk2SeKp9CuSAiP1xaR6T6R/K3nQ1PWi+V/vO6r032kiWP5FUjkOiQuCy+I6e7Bgn4upcsYq2JuHI/DekGG8uplqXn3kT1yat48e1FGWhGitxWZf8weOIQ0wrF6iguZtCmxYnejeBACqnAYWXUIwYYksrle651uIN6O1Y8ONB7eRbAQBxzwEHE4laAyu/uiLgyMB9tyGmn1lJvB0qy/Y1t+NuhvLKrjyUWXPa+Vq30LX/oC96enBK03tgdb7sNoVRgKVwe71UwErjlcV/8Mk9Buf6cb4yVvQiKhR+weXJNH+braOZNY9Jpkas0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(66476007)(31696002)(86362001)(508600001)(316002)(66556008)(31686004)(38100700002)(66946007)(8936002)(8676002)(4326008)(36756003)(110136005)(6512007)(2616005)(6506007)(53546011)(2906002)(186003)(5660300002)(6666004)(30864003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVNob2dNc2ZZSktHdkNmL0xyais0dEZWSktUNlZKQ1RKTkZDdHlqZHM3dDVS?=
 =?utf-8?B?TUJLZzQ4YzExTUs5bFlZcXJ3ODlZUDNGWXlHS1BvRmpCUmF3WDdRR1o2elBj?=
 =?utf-8?B?L0tHUlBhYUhpZGIvZCtRZnQ1blh5bTN1M0lxVFhHMW5PdnhFTndUSjRSK2o3?=
 =?utf-8?B?cXB0Wmw1emRRRTc1c0pNSVBaVWhNbEltbG9XbDRCMjlKa1VPdkFsbEpiUjFU?=
 =?utf-8?B?Nm4ybjNaTmRmTTJYUDNhdGFHSktwVWpQYmFaQVpIbFh6YUg3alBkQkUvcXpj?=
 =?utf-8?B?TVNCUFoySDdHUUFTL2QwWkZ3a1NCQUJXZmFpejYxZWtjUFBSMllqMUdjWVRN?=
 =?utf-8?B?VXIrZTQ0REFIWUh1SUNrdllOckxDY3BQRmh3dFJ1NXpZbkFEdlRiWlBiS29P?=
 =?utf-8?B?T3dQRXBmZDVNeXZvQkgrMGFOdk1DRUZhSzdHNTU3TFp0YzE2ZGdyQ1pySytG?=
 =?utf-8?B?YXFjTE83d3o1M0RtRCtUL0FPTEtrR21mM3R0eUIzalpwYmdHSmJJWEMwSUJL?=
 =?utf-8?B?WFVadm80bm4rOXJTYXE1ZUJpMmlacjByU3UxVXpXT2huMDAvQ1QrbnAwR3Q4?=
 =?utf-8?B?aFltWmtQd05jMVZxSlBvVmtnVUVzRUc3b0Mzd2tkbmg4MC9qMnQ0c0VWbTVs?=
 =?utf-8?B?Rzd5cE5kbHpoc0NZbWRJNEJIcmdqTnp6eGxkeTA2b1NlNWxyVGh6dTJIRjN6?=
 =?utf-8?B?SkdpUmtlZHRzNjBkOGlOcWJkamJUY01GYkFYTlFaSXQrS0YzL3F4VVh0bWtu?=
 =?utf-8?B?dGNWYjJSTjJyMUttb0RqN1RlZjVxQ1VDRloyVXpwQkFROXYvT2tOSGZ1SVY0?=
 =?utf-8?B?TmNXZ2VUc3BNTzUrUlAvRmtBUEJELzhWbzBrdnhHQkN6NU9LTmNjOGd4dUpo?=
 =?utf-8?B?bkc5UXhGQXduR1lSOWxYT1A5V0NaVHByaVhYQzg1V2VTcGp0d3lZNC9RQkpj?=
 =?utf-8?B?R0lYU3p0YmloMi9XcjZGT3JsNll0VEtrZWx4MVVsVWdIaHNtMkhpN3RsVG5I?=
 =?utf-8?B?UlFnY0phL0k3YzE0L2FDU2VNK1BWWGF2QTk0NUU0WElFTG1iQ1NLWnRjREhN?=
 =?utf-8?B?Rk5nOCtrNWxjNG1QVkZJcWxncUhwNWIxZ2FEK3Z3dHpZOWQvOHlGS3FGaTNL?=
 =?utf-8?B?S0QyTnFZSlQrSDYrTmllckFrMEZWWmZQbUd6aWlMbUFkU1gvNlAxV0U2WGpn?=
 =?utf-8?B?VThkdkw0K3o4WjJvY0NYa2ZXcGhFb01sTkx1SFpiNDF5MXgvS1hsTVBZT2J2?=
 =?utf-8?B?R3JrdkxmRnRLVWl1TmJRZGlkMmc0eW5icmFxZ3Fsa1F1WlZVenYvVnNlUVJo?=
 =?utf-8?B?bGJCRVBybWZvTnZSY1BlTFJjY2tDSDJOemNwOXp3dWtUK3ZHNEZzRUpjcFVB?=
 =?utf-8?B?dWJlVjBWaUJscHh6RmtpdWFMQjhsb1JZbFhwMDdNWVVNMlN1Y3hxdmVoaWor?=
 =?utf-8?B?ZVNqbXFNU2pSRnhVZ25CUGF6SUNyM1U3bit6bzFzcTlXVWJtN2N3SDRPNGdL?=
 =?utf-8?B?NUNEVE9lUitXZVBqbEEvSUJYcWlZdHhnNWxMdTV6TW5qZkhmbDJFM05vbGZJ?=
 =?utf-8?B?ckw4YjIxNnJlUFB4RUJ2QUIvWlZ2d2NKejI0OFhlN2NySHdaYSs2YTJYNGpZ?=
 =?utf-8?B?TWJGTHZVc0xKQ3dqdVdpdVR4S0kzcDVRdVdSYTN4bXR4SWtHd0l4Zk91Q21M?=
 =?utf-8?B?MkdyTDlnK3F0YkJlaFBsaGxWaS9kMldYTEFNYWFPUFdHdUZmc1dSb2lMU2c5?=
 =?utf-8?B?TStPYW9LeEEvYmpGNkprYW1XTTlXMm85S0NWZG9lUGNDV09SckNjRXMxZXh1?=
 =?utf-8?B?M28wRzBldzBrL2NPbnJiNXFLa1llZWZxZ1pkR0NyMWw1bk93TkN4bDczR3gv?=
 =?utf-8?B?REE3UXVKNkljZmdDeDdlOFVOK2NybXN1NGVHeG81dFR3WGJtNmFhSnFHODFk?=
 =?utf-8?B?VitqREVsU1VrY2M5bzV2c2Rzd2NJMWl0cFZMTS9PaXlmSnhxMDNWQXdWeUEr?=
 =?utf-8?B?NjdxT29DZnF1WXE2MXJXMmZDQjhWQ3Fubm5UYWVXV2gvK0VsT2U3a2pHQWNM?=
 =?utf-8?B?UDVTc3FhZ0JvL2xBUGZHMFJkRm8zZCt1TUdDY3VOSWlseE9xbnZUUGJzYk5p?=
 =?utf-8?B?VVg0RVIvWWk2djNVVWVRbVoyMFpjU2pYVW1rZGZtSGhyYmhsYmp3QUxkVnV2?=
 =?utf-8?B?a09tRmJNeEVRWlRkakdCUWQvaDlhWDM0dzhuNFlNK2lwQU56Mk1YeE5wbXox?=
 =?utf-8?Q?9Leoxs6Vwfj1Ch+I9956edlU9/96wxBx7phxnTJ6s0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb18c42e-7da1-4636-0ab5-08d9e611b126
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 06:03:11.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPlCKIW4KCpmhMz9J/IbIHQRZT390VEqjGsfK+D2iH+lYoHTR7Uz3umjdBacPbJkb+9nBvf/mgUIfFwpVxMjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2/2/2022 10:14 AM, Limonciello, Mario wrote:
> On 1/27/2022 04:09, Sanket Goswami wrote:
>> Spill to DRAM functionality is a feature that allows STB (Smart Trace
>> Buffer) to spill data from SRAM into DRAM on some future AMD ASICs. The
>> size allocated for STB is more than the earlier SoC's which helps to
>> collect more tracing and telemetry data.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>>   drivers/platform/x86/amd-pmc.c | 132 +++++++++++++++++++++++++++++----
>>   1 file changed, 118 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c
>> b/drivers/platform/x86/amd-pmc.c
>> index 4c72ba68b315..3040f50627c6 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -41,6 +41,16 @@
>>   #define AMD_PMC_STB_PMI_0        0x03E30600
>>   #define AMD_PMC_STB_PREDEF        0xC6000001
>>   +/* STB S2D(Spill to DRAM) has different message port offset */
>> +#define STB_SPILL_TO_DRAM        0xBE
>> +#define AMD_S2D_REGISTER_MESSAGE    0xA20
>> +#define AMD_S2D_REGISTER_RESPONSE    0xA80
>> +#define AMD_S2D_REGISTER_ARGUMENT    0xA88
>> +
>> +/* STB Spill to DRAM Parameters */
>> +#define S2D_TELEMETRY_BYTES_MAX        0x100000
>> +#define S2D_TELEMETRY_DRAMBYTES_MAX    0x1000000
> 
> Why have two separate definitions for the same value?  Is there a case
> that these will ever be different?

Values are different right? _BYTES_MAX is 1M and _DRAM_MAX is 16M

> 
>> +
>>   /* Base address of SMU for mapping physical address to virtual
>> address */
>>   #define AMD_PMC_SMU_INDEX_ADDRESS    0xB8
>>   #define AMD_PMC_SMU_INDEX_DATA        0xBC
>> @@ -95,6 +105,13 @@ enum amd_pmc_def {
>>       MSG_OS_HINT_RN,
>>   };
>>   +enum s2d_arg {
>> +    S2D_TELEMETRY_SIZE = 0x01,
>> +    S2D_PHYS_ADDR_LOW,
>> +    S2D_PHYS_ADDR_HIGH,
>> +    S2D_NUM_SAMPLES,
>> +};
>> +
>>   struct amd_pmc_bit_map {
>>       const char *name;
>>       u32 bit_mask;
>> @@ -119,7 +136,9 @@ static const struct amd_pmc_bit_map soc15_ip_blk[]
>> = {
>>   struct amd_pmc_dev {
>>       void __iomem *regbase;
>>       void __iomem *smu_virt_addr;
>> +    void __iomem *stb_virt_addr;
>>       void __iomem *fch_virt_addr;
>> +    bool msg_port;
>>       u32 base_addr;
>>       u32 cpu_id;
>>       u32 active_ips;
>> @@ -236,6 +255,65 @@ static const struct file_operations
>> amd_pmc_stb_debugfs_fops = {
>>       .release = amd_pmc_stb_debugfs_release,
>>   };
>>   +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct
>> file *filp)
>> +{
>> +    struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +    u32 *buf, phys_addr_low, phys_addr_hi, size, samples;
>> +    u64 stb_phys_addr;
>> +
>> +    /* Spill to DRAM feature uses separate SMU message port */
>> +    dev->msg_port = 1;
> 
> This message port is only used for STD right?  Existing messages for
> version, OS_HINT and the like should go through the old port.

msg_port is a flag to decide whether to use the regular PMC port or the
new STB port defined for Spill-to-DRAM feature.

Both are complementary. Spill-to-DRAM will only be enabled in Yellow
Carp and future ASICs and lower than that the new message port will not
be enabled.

The decision of whether to use v2 or v1 versions of debugfs is being
taken in the debugfs creation with a cpuid check and hence I believe the
versions/OS_HINT will not collide.

Also, this change has to tested several iterations on older and newer
platforms before it was posted here. So, based that this we should
ignore any such concerns around the OS_HINT.

> 
> You don't seem to ever unset this, so I think if the STB was opened
> before S0i3 was invoked I would think it would cause the OS_HINT message
> to be sent to the wrong port wouldn't it?

I tried to cover this in the above details. No, it would not cause HINT
to be sent to wrong message port.

> 
> It might be safer to modify amd_pmc_send_cmd to have an extra argument
> of which port to use in each invocation.  Then only in debugfs_v2
> operations you can use this port.
> 
>> +
>> +    amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size,
>> STB_SPILL_TO_DRAM, 1);
>> +    if (size != S2D_TELEMETRY_BYTES_MAX)
>> +        return -EIO;
> 
> What if the firmware was configured to use less than 16MB?  Shouldn't
> you be able to respect that?

That is why there is a seperate call to fetch the S2D(Spill-to-DRAM)
size which the FW has configured it for notifying it to the driver.

Btw, though 16M is the max DRAM carved out space for 16M, but currently
only 1M is allocated to get the full STB dumps from DRAM space and this
by design. We have the same change on the windows side too.

> 
> I would think you instead want to have a boundary check on the "max" to
> support.

Above explanation should hopefully address this.

> 
>> +
>> +    /* Get STB DRAM address */
>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low,
>> STB_SPILL_TO_DRAM, 1);
>> +    amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi,
>> STB_SPILL_TO_DRAM, 1);
>> +
>> +    /* Get the number of samples present in the STB buffer */
>> +    amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &samples,
>> STB_SPILL_TO_DRAM, 1);
>> +    stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>> +
>> +    dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr,
>> S2D_TELEMETRY_DRAMBYTES_MAX);
>> +    if (!dev->stb_virt_addr)
>> +        return -ENOMEM;
>> +
>> +    buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>> +    if (!buf)
>> +        return -ENOMEM;
> 
> Shouldn't you clear the iomapping for dev->stb_virt_addr on this failure?

I believe, that is why we use managed devm_*() APIs which is supposed to
 take care of reducing the reference counts ?

Thanks,
Shyam

> 
>> +
>> +    memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
>> +
>> +    filp->private_data = buf;
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char
>> __user *buf, size_t size,
>> +                       loff_t *pos)
>> +{
>> +    if (!filp->private_data)
>> +        return -EINVAL;
>> +
>> +    return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> +                    S2D_TELEMETRY_BYTES_MAX);
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct
>> file *filp)
>> +{
>> +    kfree(filp->private_data);
>> +    return 0;
>> +}
>> +
>> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>> +    .owner = THIS_MODULE,
>> +    .open = amd_pmc_stb_debugfs_open_v2,
>> +    .read = amd_pmc_stb_debugfs_read_v2,
>> +    .release = amd_pmc_stb_debugfs_release_v2,
>> +};
>> +
>>   static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct
>> device *dev,
>>                    struct seq_file *s)
>>   {
>> @@ -350,9 +428,14 @@ static void amd_pmc_dbgfs_register(struct
>> amd_pmc_dev *dev)
>>       debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>                   &amd_pmc_idlemask_fops);
>>       /* Enable STB only when the module_param is set */
>> -    if (enable_stb)
>> -        debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> -                    &amd_pmc_stb_debugfs_fops);
>> +    if (enable_stb) {
>> +        if (dev->cpu_id == AMD_CPU_ID_YC)
>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +                        &amd_pmc_stb_debugfs_fops_v2);
>> +        else
>> +            debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +                        &amd_pmc_stb_debugfs_fops);
>> +    }
>>   }
>>   #else
>>   static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>> @@ -392,26 +475,47 @@ static int amd_pmc_setup_smu_logging(struct
>> amd_pmc_dev *dev)
>>     static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>   {
>> -    u32 value;
>> +    u32 value, message, argument, response;
>> +
>> +    if (dev->msg_port) {
>> +        message = AMD_S2D_REGISTER_MESSAGE;
>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>> +        response = AMD_S2D_REGISTER_RESPONSE;
>> +    } else {
>> +        message = AMD_PMC_REGISTER_MESSAGE;
>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>> +        response = AMD_PMC_REGISTER_RESPONSE;
>> +    }
>>   -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
>> +    value = amd_pmc_reg_read(dev, response);
>>       dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
>>   -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>> +    value = amd_pmc_reg_read(dev, argument);
>>       dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
>>   -    value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
>> +    value = amd_pmc_reg_read(dev, message);
>>       dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>>   }
>>     static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32
>> *data, u8 msg, bool ret)
>>   {
>>       int rc;
>> -    u32 val;
>> +    u32 val, message, argument, response;
>>         mutex_lock(&dev->lock);
>> +
>> +    if (dev->msg_port) {
>> +        message = AMD_S2D_REGISTER_MESSAGE;
>> +        argument = AMD_S2D_REGISTER_ARGUMENT;
>> +        response = AMD_S2D_REGISTER_RESPONSE;
>> +    } else {
>> +        message = AMD_PMC_REGISTER_MESSAGE;
>> +        argument = AMD_PMC_REGISTER_ARGUMENT;
>> +        response = AMD_PMC_REGISTER_RESPONSE;
>> +    }
>> +
>>       /* Wait until we get a valid response */
>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>> AMD_PMC_REGISTER_RESPONSE,
>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>                   val, val != 0, PMC_MSG_DELAY_MIN_US,
>>                   PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>       if (rc) {
>> @@ -420,16 +524,16 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>> *dev, u32 arg, u32 *data, u8 msg,
>>       }
>>         /* Write zero to response register */
>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
>> +    amd_pmc_reg_write(dev, response, 0);
>>         /* Write argument into response register */
>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
>> +    amd_pmc_reg_write(dev, argument, arg);
>>         /* Write message ID to message ID register */
>> -    amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
>> +    amd_pmc_reg_write(dev, message, msg);
>>         /* Wait until we get a valid response */
>> -    rc = readx_poll_timeout(ioread32, dev->regbase +
>> AMD_PMC_REGISTER_RESPONSE,
>> +    rc = readx_poll_timeout(ioread32, dev->regbase + response,
>>                   val, val != 0, PMC_MSG_DELAY_MIN_US,
>>                   PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>>       if (rc) {
>> @@ -442,7 +546,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev
>> *dev, u32 arg, u32 *data, u8 msg,
>>           if (ret) {
>>               /* PMFW may take longer time to return back the data */
>>               usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>> -            *data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
>> +            *data = amd_pmc_reg_read(dev, argument);
>>           }
>>           break;
>>       case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> 
