Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E37C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236564AbjA3QZM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbjA3QZJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:25:09 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CBC3A853
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP4ASkBuRjjHmZSSgDQ5Yu6XgvEpYUpBPW85Fg3WIEW/ANToCC1ZvtzidIrbHTi21yxzdzqvqKmhnuBCPy+l4MlaCQ9NZHziB+4XzARNXKELbYl4ioiPnuqmN3NZFojdxdUiusHIlcRRGU96rc6L3WCVVvhm3QFTcDLGv2o+IVtEtSKUbTEm7rWpTfbcCOODl1ORgaqdvmGlgZ1S2o4/UqnM6cFYzUF5bikdSc2fxkkKod+H5U8alMECg7MR+gNqRUI9am+vvCcVyDrt+GBfc2UZ2gaAoMKWD55RokaRfjFi1bq9w15bo9QrMZg/dOiLOjyrdC0ER95I4EaHR0g+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j6rh31XNkoExrgyFkD+ZYPclnWEZ2gBKdcigKL1gN4=;
 b=DQOa/42lnArybsuRw3TCX61FrqGQuGWk3+e1b0NWd4iYih4Jo15a83hD4BKYQb32GHPAMazV2XeuxqOL7aeLrvx71pjcjcqTXiUwVKah4W1HHaO+NHoAwQsOF8O79dNGH4zJQawUTvElS+pLLZs/w/AGuISVrgC9vozwv/kID8OKchMQci2Xha/Dje2OOvvS5zy5fDUH5sLAnu5KfVSTOYtGPDlZ7jYpXbdyr06PLSIABbm08JOvDBFS05zSrysI0THvOj0cZpkx19n/1vRcfuZOWaL/KMXlrjloUnpxpUIayJLvWchMzWDQwNn8/3IsMP713WXdAKjARR0wo39Ecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j6rh31XNkoExrgyFkD+ZYPclnWEZ2gBKdcigKL1gN4=;
 b=SDBToOD9Rr9Ap34COmXvFMQtCRQmHkKuBdq3DEfk8PQWQv3l9XgvOqkp21pUvO16GzfJawHCfTsU16oG+TU9AURk2/nEZ/NKJrfrGaRKeQQGalQnx34WGSgmUmKvklC7dV5cCHJRu2UZwU/J6M2kFYID49A0192WKWRLAqiEzcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 16:25:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 16:25:04 +0000
Message-ID: <9ae3602a-0c11-8830-5492-cd23978c017f@amd.com>
Date:   Mon, 30 Jan 2023 21:54:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/4] platform/x86/amd: pmc: Add num_samples message id
 support to STB
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-2-Shyam-sundar.S-k@amd.com>
 <1957447c-ac4a-8684-708f-9f6f2aa3a92e@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1957447c-ac4a-8684-708f-9f6f2aa3a92e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e75a76f-c610-4c5e-a462-08db02de8aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X3vGOeL9CHdcSkES8HC+UXDk4JqgA1TZGKoEq9qIv0Vj3ykpTj9a28IqJrJfHwL98f7lwLa++H6e75Cuyj9qBk4wEzaTP0DfxfHbx8QVAdh9hum8ew+B+s9T8y38Z3cIx7kdPEN8mPDmVmab18jEL0m5uFG2JR2Ejv9fj/8oLRvc0qhIDaupeIR0vb0TxTSvD/PJ3czegeyQ0LuJAF8ST1Q36RGA4DVyaMqSrDS4bl+oVC6GAYMGQpKnndzDDi2xToGhAGQdBII0lkAgRMU2CpIxYx7pw6Nfz+7QE6Y2mVaZAlfqjwnBLXW49EVqclH7J/xZPnxlRjdqoipk8yOWzWzld6o7VYpMBSPyBM9eCJCeGIYyyl45E2uLzimQxkK4B2WlR+u6ErAfqYJjyvedBE7MVQHOgC02SsaaQdh5MbsSntAi7r9fD1uJgNrwGMSsbF+2vmIb+SygCtPpWroyvUwtICjDx93KAVoCf3ohhiunNduaFuAuzpftYDArTEw/TPPKtmvZnwMmeHI8RFOvKtdoggOrxBz/6epeCl8MxH0f6Bnk9rHhTv52QAd91HCdyGww2nir5D+YgSppJdsIJ+YC93L0h0rZY2SfWmb51veT5M2iYddhRWTOhb4d/R+EJxsuqt2eXhSx1LEz8LSLqH+e/eFj7ym9huwD6uSAFkWgZiGPthYRfJBvYNZNFZ/81gSRcpfWAM62M1NhDWJW9KROCUiRPSqTIhgSsKN4ndRHHTPT3et7I3TNgeWVxoTDdtqbQVSbvT4mBbcSODv//w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199018)(8676002)(66946007)(316002)(66476007)(66556008)(4326008)(8936002)(5660300002)(15650500001)(2906002)(31686004)(41300700001)(6486002)(86362001)(31696002)(478600001)(186003)(26005)(6512007)(6506007)(53546011)(6666004)(83380400001)(2616005)(36756003)(38100700002)(750200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0hYUVZDVlVwOWoza25xRVpkRk05Y1BKWW9wZFJNc3VnRys4c3VpRGk4L095?=
 =?utf-8?B?Wlg5cVcwdS9UNjhUWWF2Skp6Mm1lVkplV25TMU0xMzY0WWhrS2VINzBqTDdG?=
 =?utf-8?B?V0dLZzlON2wrNXh2OWRtN3VSWGRCeDFhdmQ4d3NRbEJCZTVqc3hLNTR1UUdT?=
 =?utf-8?B?QjJORkRxaUYrMk03YlpSQUl2MFBEUUdHb0hRWElVWXRVQzhRQnVmZGRaWDdS?=
 =?utf-8?B?aXNNY1dVa2ppTjNOdmhISC93M0VleE92WDV4TXpzallkYnFWblhLQ2JSeWNO?=
 =?utf-8?B?TjZKNzJ6SGh3VkNiNWh5MUg5bHVuN2RpSEU5MnV6UWREdFN1Y0pTNm5aN0dq?=
 =?utf-8?B?OUFzWjJrSmtHWmQvWU9oVkdscVpqMnZOckRDYmovblpoK1pZQlFrNy8vcGZB?=
 =?utf-8?B?NW0zYXlwNWlIaFBNNElpNzNnUTF3bVQvV3FhOHE4NS8valhmTGNQNmlMNlJK?=
 =?utf-8?B?RFl2TFVFOUVzR0RiWXdqdmtRT0hRQnY2WUVwMFZJL1lzdCtJbG9YZlAreUZP?=
 =?utf-8?B?bzVGTkR1c0dqNklyQ1hqM29TcEdNSlIyanhOeUY3amgzL2tXUStIT2N3RFhx?=
 =?utf-8?B?QlF3RlI0V1ZjYmJDenhhNzYzdEliOUtvVGVDYW5Qbi9SOTFKOUFZL3N0QVZY?=
 =?utf-8?B?T0xoZVJEUzdJeHRnaHl4VGhXMlF5T3hQU2VLY0lpWmFzOFF6YVhDRCtkNmFN?=
 =?utf-8?B?aUt6RW85RkZDdERqOXJodytQb01KV3hNQnVuN1lZcWtFWXdzOW0xK1gzeU9B?=
 =?utf-8?B?dEZwWFE1djhYdG5YYU1HN2dSWXdBemovcldteWhzQUZGYmY3RVpnemhUSmVN?=
 =?utf-8?B?VURGZm9OdDRNVFVvcUp4Y1duR3RhZU45b3F6ZHc4d2JIQng5NU5nUURLSkJP?=
 =?utf-8?B?ZlUvRnM2RHAwTTRsa2tTaEJySTl1VEd0M0R0VER1bkRDQjlmbU5zZG9aZ0hV?=
 =?utf-8?B?WmdHZXlvUnE4cEFQeVhvbkM1YmMvMXFkQXJtbnpZVEp1dEZuQjdhTVR4L21W?=
 =?utf-8?B?VmFyZ012aHBGTGMxQjJNOVlDODdwTE1ZQlVGeDlUaDNTRjVRM2RkTHMzSk52?=
 =?utf-8?B?V0N1d2pPWTFFVFJ4NytaQks3UE1YTzI1Q1R3ZWN0bnVBMTl0WEJyb3cyRkpi?=
 =?utf-8?B?NmUvVDB3VTQ5eUp1NG45amcrRUpRUWY1Z3ZaL0QzdHBONE83NEVhOHdBTlJi?=
 =?utf-8?B?ZXQyRDhDZFhDdjNpL1lOblo0angwUE5IR2x5Z0loTzhFNkIrSy9uQ2U3T0w2?=
 =?utf-8?B?TXU3WDhvMUdod3I3S2RKeWtjaWF3Tk81ZVBmNExKdTFER3p2QW5KaDczdUZn?=
 =?utf-8?B?emFCV3ozL3lnaXNzQ1hUQzhwRXZPMUZJOENnS2lSd3VFUVNMTGNqNDZEZmNS?=
 =?utf-8?B?VEJyOEpWQjFQdjhnVkRPWW9nUlJrMHo1Zy9DbzJaZFcwd2NZMFJUUWdkZml5?=
 =?utf-8?B?SXBTS3BOZHNONDhkTkJDN1FsWmFNdHNNc0x0U3BVVkxIQ3J2bGRyVEpmaUlp?=
 =?utf-8?B?RzZuNzVSd3MraStscTBFaFMwMDdTVW53K2N4NHdEeHJqRGN6MlIxS3NxeUFL?=
 =?utf-8?B?NmZNY0ZBSzQ0Vk9WV0huemZXcW9nVzROVDZzUkVRZ3l4Ynk1K2plRDJrMFRZ?=
 =?utf-8?B?TWVXb3NFVWVWMEdLQzc4MFBBbE9HeXI1Y1hBK3dNUlhoMWRkYlRHZWRucVBR?=
 =?utf-8?B?MzhqR2ozRTg4R2R0TzJwVXN6ck5yYlBzQ2d0OHFwNGNuaEUvUisxWFdKWThq?=
 =?utf-8?B?LytyTjA4bXRkMXhMVzhRUDZwUllvWmJNaERTK3NiKy83Q3FndXlSZGJ2Rkda?=
 =?utf-8?B?amN0Q0FVUWQ5L2dlNnhIblIwMGZBdWlvTVd4d3ROd3p0RWdoUWw0V3h1c0Zr?=
 =?utf-8?B?VmR2ZzJuODMzZS91cm51eTBCNXpBZW1uMmJJZFc1UVk1akk0WmdCSC9tc3k4?=
 =?utf-8?B?bEk3MnVzU3NQMmMwVXovTU1hei9BWE40a29pWFVGSFRvSUlBM3NIcG1rRjk4?=
 =?utf-8?B?MDNlODhMbm1BK2lxVzl5Ynh5Y1JONmtnbXRVYWk5Mno5TlhwUGRoQTBRQWpm?=
 =?utf-8?B?Q2t0dVVMeUlUTjdPYUNXQzZtRDhOSUpyejI4RmhFVTFWZ3RjOVlUWnNUdU9r?=
 =?utf-8?Q?AbLSkkWAEBuNM4f4ij/juMpWU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e75a76f-c610-4c5e-a462-08db02de8aae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:25:03.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RoRXSBwhzvZBWhMO+uUAUOgjP2utk14aXS/uZwCUnhXRBY/li0OmVzdCvhLh7XYN7n1S1ZWY7YQYbNo+k1hKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 1/30/2023 8:12 PM, Hans de Goede wrote:
> Hi,
> 
> On 1/25/23 12:31, Shyam Sundar S K wrote:
>> Recent PMFWs have the support for S2D_NUM_SAMPLES message ID that
>> can tell the current number of samples present within the STB DRAM.
>>
>> num_samples returned would let the driver know the start of the read
>> from the last push location. This way, the driver would emit the
>> top most region of the STB DRAM.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc.c | 30 ++++++++++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>> index 3cbb01ec10e3..01632e6b7820 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -114,6 +114,7 @@ enum s2d_arg {
>>  	S2D_TELEMETRY_SIZE = 0x01,
>>  	S2D_PHYS_ADDR_LOW,
>>  	S2D_PHYS_ADDR_HIGH,
>> +	S2D_NUM_SAMPLES,
>>  };
>>  
>>  struct amd_pmc_bit_map {
>> @@ -246,13 +247,38 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  {
>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 *buf;
>> +	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
>> +	int ret;
>>  
>>  	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>  	if (!buf)
>>  		return -ENOMEM;
>>  
>> -	memcpy_fromio(buf, dev->stb_virt_addr, S2D_TELEMETRY_BYTES_MAX);
>> +	/* Spill to DRAM num_samples uses separate SMU message port */
>> +	dev->msg_port = 1;
>> +
>> +	/* Get the num_samples to calculate the last push location */
>> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
>> +	if (ret) {
>> +		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Clear msg_port for other SMU operation */
>> +	dev->msg_port = 0;
>> +
>> +	/* Start capturing data from the last push location */
>> +	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>> +		fsize  = S2D_TELEMETRY_BYTES_MAX;
>> +		stb_rdptr_offset = num_samples - fsize;
>> +	} else {
>> +		fsize = num_samples;
>> +		stb_rdptr_offset = 0;
>> +	}
>> +
>> +	dev->stb_virt_addr += stb_rdptr_offset;
>> +	memcpy_fromio(buf, dev->stb_virt_addr, fsize);
> 
> This looks wrong, you are moving the pointer stored in the amd_pmc_dev
> struct and subsequent uses of stb_virt_addr will now all use the moved
> pointer...
> 
> I think that instead of these 2 lines you actually want:
> 
> 	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);

This is a good catch. Thank you; will respin a v2.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> +
>>  	filp->private_data = buf;
>>  
>>  	return 0;
> 
