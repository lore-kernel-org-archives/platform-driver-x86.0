Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E00E95A9E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346619AbjJIPrS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344542AbjJIPrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:47:17 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6707794
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGkBxlzos7ki387Xrdqkp/jXjcVKnl3/66+q96weQ4zI1Wjk0VsNZwWfIy0pj3XUZyT4A+vhq92Z4O/tWp0wEJ991gD+s2N0JdxVFu1tWE2ABaF7i6iDWY8wxzQQ2xa8zLFAyJJ7+tnea5xdNGsbmyRE186bYNLQRWL+h7/F0s71dTapzXTx3rd6dYMCYBXa7afgjVqJpwev2rKb1YIm2rxG8RRzrBYrbvVf2f2f8L1eiB5IjdCR3Xpe8OyFilLUI68MAj2awcGdeYk5MitHtD0BzM8HUHsh4ckES0cSefFQIhudQUBDbv4lLkBE4E0oZ3vqhhhYwjscsDCnKfP4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnQbOO6zPwAtujg+0tlVAgzuh16vh0oiVwy8nc8DikA=;
 b=goAIW+zGwkjPjgXmVotXXebLY6XEfVeI1snPg4iDEcayCWXNzBZZYMv0HloGrxsYoGoNdgqC8CEUsgHzA6jt2yxiRY5IHuLmuhmoKwwSyiJLtiPj+9wvVm//MYOI8owPyT92MMV2Xb0pM3a72PktHpzB+cw9uFVFzawgJcyly2EZHJGbf8oQgGDwKEhrsHFhbA14yXLb98c1bo4waTohBPVRRSV/P1/dSlcFWjQO09/01iYwNXLiKFjVhOFZCWgaQuwG3LkeAcPIZdA76klMFTY7JMKuJ+jglECxdtscbWL3QgCwz4tEpznPnCK4+5r7r/lm5SYRvDvw6PDXQU8CuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnQbOO6zPwAtujg+0tlVAgzuh16vh0oiVwy8nc8DikA=;
 b=X2H/I05cx6mk1iNHcXDgVyuMbwPr1FuyQj8mTDao5azU9I0zLKz99ejTYDMQ+mdxPwPJKZIfUD7RbB6ac37tgNezhtlPX7VLOsuQ65ovHuu01YdsCIpytBXt4mU1jQJqbmeX5giX3Yt84uzlyTRfk/mghQhqhTJE7pIydl4yPo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 15:47:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 15:47:13 +0000
Message-ID: <d958b8e8-0a09-4449-ab6e-7eaf2d34ecd3@amd.com>
Date:   Mon, 9 Oct 2023 21:17:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Move structures to pmc header
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
 <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
 <95a0ef77-ea2-a698-9ba7-3049195c7481@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <95a0ef77-ea2-a698-9ba7-3049195c7481@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0c9c20-d88e-4f83-6b1c-08dbc8df0182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yce1g3tpD/dABUvjksWVhFt90dZKeW684ulo0Q1BsSlcR5zht0ibuTyjKCarsyvtfcTRaUSQKL0MS998POCofkFgPsz0cvLXGWpbOc2JSfIa2E2QX0wgSjwKI5+3hoc9zFsiCE70lZQeeyz5PQzG0os8NcmqC4xXlS6Sw9mt+KRrhZ1juoFIziFIgIba+qS7UzGv+TtSXiULxSCf91w+xkmFE6t4jubEONeziXWK6wM2LeGAOz/j1pHy+kBTfKT/YbHzPoYDCWq41+NeLheEmLqs75+DZfbM1rj8x/SQQC0O7HIN0elbkseIFsJI59YYUdiNn4O6wXwwAjOhtKFyI7MJztKwKQZ9ue72OVdsd/KynYRgCbjifNKbKE+I/BO+W6jByfXqlJHteKlUQO9FZsOln+AZ0VJHQIpRlZHoJph6GZWzwHqcbumAnwI4kjvQctcRyWGzRQ+vPemfEpoHHmlVrCXb1tqX+FfIo5OV+lBcL5krQj3ub/CzcSYCIwEE+RfPUtPfDNcTkPDfTSUeqzQYXqdjkRXnnlDXxhCm6PAG1RhNzdImAfaDTnIWhedPzzTEKLEYGEzMakqbxStXmFQ5YtMk7GHtnvwFj91wxe8/DuoEPj7A/JOMetGgAi+ndxeiQvyIJcdCVn2MM/Pw2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6512007)(2616005)(6506007)(41300700001)(316002)(478600001)(26005)(83380400001)(66574015)(2906002)(6486002)(66476007)(66556008)(5660300002)(6916009)(66946007)(4326008)(8676002)(8936002)(31696002)(38100700002)(36756003)(86362001)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHd3Z2JMaVVlR1JZSHdXSDV5Ny9USFpWOTVPWW9BbDVscUpyOFpxSW1Zd0Nv?=
 =?utf-8?B?ZThxWWx1NisxKyttN0ZDOWdKVTBDYXFEaUc5WWFDWTd1WGJqWmNaeVVLT3FH?=
 =?utf-8?B?SUt4MVpEa0N6UTNpY2FuRUlPekhlT1pQUHc3Z1ZnUkxCRGNrZ2ptcitrbUNU?=
 =?utf-8?B?TlNXc0Q1dm1zTVJNY1VDbENoaVl2Z1pMRnhRdnduTVNRRGdveXNROU1YaXdj?=
 =?utf-8?B?Y1NLRmlBTktTRHA4b0VKQm12elNHODVRNXRVOU9sQVhuZUt4YUhRWWJuck1S?=
 =?utf-8?B?bzlSVUNJZk5EK3l1R1pvc2JPL2tuRTQ1Ky91NWRvd2tMYkxpbXdFNlA1d3lx?=
 =?utf-8?B?QllZUDF4WFlEc05pMGF5ZWRtKzk3SXI0UFgzVTc1Nm94RG1KdWJrWUlJUkxC?=
 =?utf-8?B?MWlUdTZUWWlSTXMzWmhiZnBvS3Zwbkx4N083RDVUS0JQaWo2alU0NDIyUk51?=
 =?utf-8?B?bEVoSVcxaGkzQlcxK0hubFQ1MmtqUHBYazNiSXY4bEtHUi9BQjIxVnMvdE5v?=
 =?utf-8?B?Wi8xamNPZExpNUVyc20yM3M5WlpVVmJYaWN3TXFUYWNJNE00WWtVMTdqMW1G?=
 =?utf-8?B?ZkF3QnFjdjFsVVYxTVJYTjRPdEZwaENnK0NGZDRvNnV2RlZ6cG1jWVAyRG5t?=
 =?utf-8?B?RnhvNWpodzZsYmZHcEhvMkhTWWpEaXRnczVVSDQ3SWx3dmpmd1ZQVkdqZjlJ?=
 =?utf-8?B?YXhyazhOOE41UVlMemtYUklXZkZ5Wlp1QU1uRVBzYlhHR0xTZ2RTdWtUbElL?=
 =?utf-8?B?VlNRMVpOcUErODR6ZDhLRFlsMzZNYUhqUDFsSG5UcnFwQVBBM1F6THB1bWdU?=
 =?utf-8?B?cFM1VEhEY1g5KzVpYnU1bTNEeFFMWkovR2x4SE9XaWJMVFJTd1NFS0FwWGtW?=
 =?utf-8?B?MnVzN2N5TWJhdTlrRHA1RmZXREZuTnBEcWVXVXkrSmNEbENkajZNYU14cWM5?=
 =?utf-8?B?NE5kZnY3YnpkbzVUTDJycVN1S1VjZUtJbmRGbDlkRXB4SmczQlVhUGxqL0ty?=
 =?utf-8?B?RndRMXFUWjNFQ3NLYnBhWVR2bXpabk5qVW1IWmQxMVQ0U0RjanhJRlBtQ0lG?=
 =?utf-8?B?M1FnMEZUUW8ydXdPY21NL0t1RkV0VjJJSkJyd0hGWlpqenFNeDJKMnBvUStm?=
 =?utf-8?B?TnV4R2JEZk0zZG5FeWN5MXlpcDlpWlNoUWJZc1JXRS90Zk1aU2dUZTNRYis4?=
 =?utf-8?B?M2VTNlBpczNNL0E5TDRYanYyWWpzL0taN25vbVdaUzRxMjZEa0RPRVJTbjZu?=
 =?utf-8?B?SVpHTW95VEcycysxTy9SdmkxbmdhQktMSTJYMUdDZ09PSExDaTVKVVM4cXJC?=
 =?utf-8?B?YVJBVHowZ090UVNESjdJYkx4RldYWG4ybzd1Q3FpRkcvZTRuWFBLZFprYmpS?=
 =?utf-8?B?UmpadHd6UGtXRTI1L3o3dUJHQnpvZXVKUi9xTWltUzlIOWZlNklGamF3MGhi?=
 =?utf-8?B?WEUxS0F3NDdnNGdKdFlTN3ZNNjJFcWdxaWZhZlB4VVBhWTI0cXovY0F3R0tS?=
 =?utf-8?B?Y3hwSllvbnRPVGpUK1Jjb3Q2MHJQZkdvTUI0dlJWUWV5VkF0c3R6VG5LSHVE?=
 =?utf-8?B?a2djdFB5STBNWkdMZ1c2ZGhZckpyeUFTMWcwa1IxTzJvQjZvMFlLY0dXZjll?=
 =?utf-8?B?WkZscGtNQ3RNU05zd1dzeGlMMlZCdmszTkFHRHc0LzhLQTBscW1Od0o1cGxo?=
 =?utf-8?B?aGxiY3BNYWM0TE8zcFlUTjVQdmsvakx3QnJ4SXUySEJPTm41YzhreE1zS2lL?=
 =?utf-8?B?elNPZUc1aGZFbUdwUkwxZXpMY1E0cXh0ZWYwR09KNy82VnVOa1NTbmZrK25Z?=
 =?utf-8?B?c2hhS0JncURneFRwc0F6Rk5JeVU0clB5dVJQaGR0SUVHRnRwVU5YNHNjUFBT?=
 =?utf-8?B?TElwWkxJbGRFTkc0MS91RTRxdWxPamVTMnJHaDNPVVpKWGZYZ2lPRk9kU09q?=
 =?utf-8?B?ZGlpSEhWWHpTMEFjZzhvNzFjSXRKQ2NQdmpDNFFhT1lGZnd3czc1bmlUMEVS?=
 =?utf-8?B?eHdJbU5BdWpBWkk0Zk5LY1ZVOGNEU0gweFhBSDlwb2s1UGhFMWVydGlnU1c1?=
 =?utf-8?B?SEJyb1k2OFZ3dXlHNWdJZE9vNG5PNTIzMWRiMEJPL2tBNUZsS1dWUWltMkVm?=
 =?utf-8?Q?K1LiVmoJUjwdPa1YslE19e5Oc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0c9c20-d88e-4f83-6b1c-08dbc8df0182
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:47:13.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqDSwQZth92o/bl1DSucVBvJWReGc29yBpUKdky29l3HXCNsWgNqMNY7LEYBGqVN4maRfHHf32nUX8d1K6o5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 9:09 PM, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> 
>> As we have a separate header for amd_pmc driver, move the common strutures,
>> enums, and macros to the header file.
>>
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
>> +#define RESPONSE_REGISTER_LOOP_MAX	20000
> 
> This is borderline, I'd add prefix for this.
> 
>> +#define DELAY_MIN_US		2000
>> +#define DELAY_MAX_US		3000
>> +#define FIFO_SIZE		4096
> 
> These look way too generic names when they are now disconnected from the
> code using them, not that DELAY_* ever was a good name for anything :-).
> 
>> +enum amd_pmc_def {
>> +       MSG_TEST = 0x01,
>> +       MSG_OS_HINT_PCO,
>> +       MSG_OS_HINT_RN,
>> +};
> 
> I suggest you consider adding a prefix for these too.

But these are there from long time, probably from the inception of
this driver :-)

This patch is just cleaning up of the code and move to header for
readability purpose.

You mean to say, make the prefix change while I move the macros to header?

Thanks,
Shyam

> 
> 
