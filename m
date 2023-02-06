Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D45BC05027
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjBFPJ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjBFPJ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:56 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDE32D71
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ezz2cShj3kWF0wyUPuwnj0xFXbDPTXxP1PTEgUP5w7kzEQUgTV1HSVzDv2tbpxm0AkfDPzZZCdkoy2UkdABiz11Qsc9RCcR7saIwAdxu5YTzY77JsOXVUb0x4AdmgkzYqxN8JY4PZmpWD/L4wBYcUD53tfMlslACMlWZVAcM69VMLEyAqZNao5DEqrWzW+QclHs3EAiTI90JMPOVTHzA3EHY83SEy3XCnAv4bYhqCNKinAadaQB2sq+8HRfS9QmXcriRGLaE25WZ3kOIKLt6SPkhzf8uRUhqHpDgiC6UQaQnxJU0Ql0qdCdj6dhv0NsLjLEt2BMbezl0wg72rSCn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJQrTwwrREA8La0oYqg+pMjw8wYl0XrpTTW0EeKYy64=;
 b=M9/tj8c/e5OQ7i2R5M/FVCDqj8Ay/7PnMv3uc7ZOgVnQXQQ+TQnHA/C7a1YRwYCRUS2QyDdZuxdUU/oVQdp5Nw8T2BzW6WEwOuuIr6VgI89+Btn1Gn8AnaljD2FWWet6fIP4HqkiDhLSB+S0SyohL7QVD8UUb1a2X3VJlQtI/6gPsXh/F0dOt22wHVAH1aJjYVTzdwNRl5ag9L9k5EtC1NgzHXrjkLSy3su2hn83nX9LRuaneuw+qFeJbzclsAkEvv/niwy1hXkMqcGOUoPkJw6rVY0CroaqGYLL+AXuFpIeoeGw/eo+BnALzD2y84htGHXZLZ+jvA0FNdZar5z74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJQrTwwrREA8La0oYqg+pMjw8wYl0XrpTTW0EeKYy64=;
 b=hsMCRidgKapr7wNaZTn19B6LVB2SRUjtgi1XVz/+gu07xZymUvnjmZB1dBMmalW2uvcJAnX5Y/D5CzEWbkaFRYo2CJczG3nfTdDRnH5v/R0a8O9nSL4QD44TjwLRT9Ig1UVONV0x7Ff+yWu0fXu6jlEAQtxIt5ZNZihd8nZOHrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 15:09:53 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%8]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 15:09:53 +0000
Message-ID: <cc23252b-2a11-32b0-3344-c5717dc5effa@amd.com>
Date:   Mon, 6 Feb 2023 20:39:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/4] platform/x86/amd: pmc: Add num_samples message id
 support to STB
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
 <20230130164855.168437-2-Shyam-sundar.S-k@amd.com>
 <9d743107-477a-7af9-153d-f27d2b1f994e@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9d743107-477a-7af9-153d-f27d2b1f994e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: cca8207b-a118-4cec-cb0a-08db0854333e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPs5E2fVRjcLgq6jXXvjkKiHyi5U1sYOu5BE6/RNv660Gjb0ePAhHGgl7u4+mdv3JCULVBs10R8MfTh0Ji+1dX9EWvuGAcB0em89R6GCqmtKim0kJVwludqf7SsNfXeRmbyK9wFBgyRrIwru9kAP95vd1HOf3nPYZffawPnMw+EfppYfw+//a857ri3On0PmI6hDhT8Lj6CaB47T2zRxw0Etszjyrzp2Zvw7j/hp+H2phQrRcBk5z2fZu6gnfVWYemS2AKVNpsJJ7VQodY5Dgc5BuBi3W+loLEQnhe3Thk6d8mtSaN0mVkTkPKmnv+vGaP50r4yDTANRcElbTwgCahpemGGMKZJSYFq+S3meD7mmmjBuQQwUUStmfWQIOCP51KBvGwQx3JS0NaiToQQtEsMnTOIAtLPdDZzp63UGaXoPp1SncDCUwIz/92lyciD06Wc/QxkViSiel/kzHNrYpTiwtb6VK5ELIQg80PGjB3vkWm1+LBCq0ZiD8aKL0cdfV+Sm95U2uOOF35gQwqYK303da0/zjcWecVzn9j/J1lfhqFtw+aiGRJ1YcZmEKrdohlRBcUQTyAltemsTUkk7Ns1NR8TWq40BZ++dxVib+ovXbnhW/TLWbJZ4zCDOa7X0mueH2Nhxl/m5j6lczyCl84BKt4MuTuHqoySWpndf46J5rcnTRiFibOifQztZEcmk2BqzP71IBGJDQc5BNOUKiPVwYfinJxSK8LPd5joWLRqIQ7Sim5YaF3rzeDU/1afQLy1qzC3Ua5JYGfNFUNHreg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(186003)(66946007)(38100700002)(83380400001)(5660300002)(41300700001)(2906002)(66476007)(15650500001)(6506007)(66556008)(4326008)(8936002)(8676002)(6666004)(6486002)(478600001)(53546011)(2616005)(26005)(31696002)(86362001)(6512007)(316002)(36756003)(31686004)(750200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NldEcmRUV1Z4Y2JSRy9KR0VOcWhlTkp6a09ObHo2eEpuVVc4NXFqdWp6SkNJ?=
 =?utf-8?B?WncyVWdHSFJYcTJpVlRrMHNuQ2xGbmdIdG5PYWhmOE9LOG5oMFFQem5KdjVM?=
 =?utf-8?B?Wm5sSzBMdy9rWjQvS05Fekl0Y0FyOXA2ZUhLdkIwVitxMXhNWSt5cnFGbk10?=
 =?utf-8?B?VlpEcmJBQ0wzdzdwd1hTcHdGYjNKWjVid01jQWRpS0NkTUNtd24yaGlpQWZk?=
 =?utf-8?B?eFJGSWhGUzB6Rlcwc3MrTUJXbTBTaUZObXIreEpRZC9ib240djVXajhQRDNp?=
 =?utf-8?B?Wmx1U3ovaVR5dFYrdW9Ia3ZIckEvcFVxZy8wUEthV09pUWxTaUdLQ1RDUE5V?=
 =?utf-8?B?SzlsQS9lV2FjVTBaak1wWThhRmRLaE9iNzg5TmNxaEVkZGRSOEtRclNHdndN?=
 =?utf-8?B?cVRVYVE2SmdwdXBsS0pYSHp1eEF6V3lWbUVib093bUdUWDZ0em5iL00zUVhl?=
 =?utf-8?B?VTgvenJKZExhTlg3aFc3WUVGeFhEYVJyeXFYWlZGQjQyU3RXd3pvcnpRajgv?=
 =?utf-8?B?aXhvN3RvaWtpeHJJaWlsVDVuZzZpZStleDFSYk82emRXTi8zUkZxNHNnVmI2?=
 =?utf-8?B?VGluMldiMVkyc0QxZlNra0drWjJ4VUhsb202U0J3VkZKbVcxSW02dFZXL08w?=
 =?utf-8?B?VG9VcCtuOXhhRUJ0M1lmQVRDSXZNSEtRbnNUUmd3eGhNWFhsbmNFWnVVcjE1?=
 =?utf-8?B?SjNoQmZXQjVCODc0NEQxd2dJa0s0WTcwdSt3WU1TZG9IaCtjdXhlN1NiQkU4?=
 =?utf-8?B?YnU3dndVbjVDZkdqaldTd2JLM29DeER5Smt6aVZUU3NQeE9oa2RmT0MyUnhO?=
 =?utf-8?B?WTQ5d1NhMU8vYnpldDZ1U3JLY0w1WlFabmVBS1dPK2ZBSUd3VnFjQW9VS0ZG?=
 =?utf-8?B?cUhNdWk3OEF0RGZpd0diOEZjcUg3QmZFbUgrTGxnRnhVMWp6RStQM3hQOUxX?=
 =?utf-8?B?aW4zSjM3SGhPelZUZzRhUXdXZlRWMVRsdk1HczF2RVdleEY0SmZUSmd3V3k5?=
 =?utf-8?B?UXdUNDgyY1FYcXJQT0VJNjZvRmNIc21ZV1Nsc1lMVisrTWEzWlV0VEpKekMz?=
 =?utf-8?B?a0gzekNGVytFR29UMytJQTdDb1A2d3ZKSnZXWHZZaWEzOUZQbEZhVmkyZGpG?=
 =?utf-8?B?bTU1SGw0L3lwSE1DbkZYa2pzTTlleXdRM1AzTFdUYUNwTkZPMXl1OGVMSjdk?=
 =?utf-8?B?WGoxank5ZXk2dUVRNFl2ZXJBUGFWN0cwM0NkeEdVaThHN3NLeDd2MnRRdGNS?=
 =?utf-8?B?OVlNNU5Ydm9GTmtTdkUzT0hOUS8zcFJPSjVMeXhiRlRRSm1wdUZBeGJnS0lp?=
 =?utf-8?B?WUNnMXkvWVdVaWZ1YUU3b2JJaUlPUk81UDdTcTUzeXFkeGEvYVZZUDhmVktw?=
 =?utf-8?B?SDNIWEVZQzZpMmtlNG5uRUl1Z29QeCtHQ0l6N0RUcEtIWEwxaHNtQjNnMHpn?=
 =?utf-8?B?dmVVdGhWUVJrU2dtek1FcFFIbU94eXFlU2JxVXBpS1M1T25lYzdtTzc0eXdM?=
 =?utf-8?B?bFhRbndrZDhlMWVuWDlGbUJnanNkcHgyZ0ltZXBsMVJFMml1TjJVeWFoaVRJ?=
 =?utf-8?B?eU8rLzJ0Z1c4cWJMQi9zQUp3ZFhhY0JqZERwYmNla1JRNUg3bXhFRnlKYkpK?=
 =?utf-8?B?TEdLc2hZRTlTc0M2S2sxT2JsVDJQcDUvMzhpNEVuN29OQ3JpTzRJa0ltWjll?=
 =?utf-8?B?Njd5bVFTWjhKVU9CUTNJcExBektwVjVHRFAzZzRTQVVCMTU5U1h0S3ZVV2p1?=
 =?utf-8?B?WitKQlZnTU1KL25yZlJTUlFCWXc2TWV1R1RYNEQzTHdhTytab0xwd0RQZ0c3?=
 =?utf-8?B?eE9reUIzcEIxeEhVVHAwcTBCa0Q2MFB1eC9MaTA5cGJOV29FZjVBYitCWkNN?=
 =?utf-8?B?dkpqb1huWEp2RHpNRTBKdEJvMGRlQlZONWVQUlRmUXFYMVBBdlNFZmN3MTZx?=
 =?utf-8?B?S2FYRk1JVTBGNGZsblRMWlBuOEo2NzBEanpqQjV1U3BoaFBwUEN2QU9PMDRn?=
 =?utf-8?B?Y0N2MHM4QzV3L1lwWW9ncVJEcy8zK2ZXcTJsbGNnMUpoc0trOFRBcGlOcjJF?=
 =?utf-8?B?Q1RZWW9WY1RRMERNRjBvcGhkZ2NKaVF4TTh4SDdBTVA2KzlMTk1lZHQ2YTRa?=
 =?utf-8?Q?B+IVKMXm9dZ4qO1Bn/CeXA+F6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca8207b-a118-4cec-cb0a-08db0854333e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:53.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gjMk95EF1QUn9+vigP0nTJGXUA9ShPpIVyyKzGMQ12ZSo/HhDVF5c2AmePedSucxSVUrYFx2G1xYRjOOtA1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2/6/2023 5:39 PM, Hans de Goede wrote:
> Hi,
> 
> On 1/30/23 17:48, Shyam Sundar S K wrote:
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
>>  drivers/platform/x86/amd/pmc.c | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>> index 3cbb01ec10e3..b0f98a201a81 100644
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
>> @@ -246,13 +247,36 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
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
> 
> You are not clearing dev->msg_port on amd_pmc_send_cmd() errors here
> which seems wrong ? 

Agreed, that's a miss.

 (sorry for not catching this before)  How about:
> 
> 	/* Get the num_samples to calculate the last push location */
> 	dev->msg_port = 1;
> 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
> 	dev->msg_port = 0;
> 	if (ret) {
> 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> 		return ret;
> 	}

Made this change now in v3.

Thanks,
Shyam

> 
> ?
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
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
>> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>>  	filp->private_data = buf;
>>  
>>  	return 0;
> 
