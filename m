Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53206E95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 05:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345049AbjJIFqg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 01:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345120AbjJIFqf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 01:46:35 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1139E9E
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 Oct 2023 22:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUY7pw7skj/BLAEGb7lomSUONd7kiEUJYIxk2dJNpPFPru5DgalIzq6w+TNwgICKTNKkZbFmgpTO8WFWfjb/ebbAkNF/KfHi/q/T68PYDFtZ6tsCtstBzxo8w2W+fJQdPUe26NBDl3d2qAebfVmHjE8LNhwtQPFlzvWCMnNhNYQLcnJvFWgg23iemznv2su/D/AVWS03qCgC/54HQdxUOAQaM/OQgygARvqsmyJNcMkHY0vl3JKA1a1o4zNcixL4mO/sFBmRtqEbLq3tUz/75C8N/u3Mns+Ra0p0Fut8qKM3pNYOewqIxJxzTkELSgR/v/GBKnq3e7aVNUC9WP+/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/Eh2Ny4toAk88+R/AZHXRCYK/jMuj9pdT8qbZ3oydc=;
 b=PwBTjhEuEFW/Vd+jLvVAfVbxSNSnEg55D3jgo0BOGS4a+A9knU1n+cCrF3Y8dG6BxcNcMfi+i+pvAXSlp8NhPsNezHdUEs6U8VkDHQCIkY07VSV5bVXgvhQbR9oDL0ZaMRQHrqEXybxqFlZIiTESImEV3LBxtTw5eBe/YaDiremJNPBhN3CT0eHgW0VT3pPjpDNUKRQt5K6fzbrCs7pPJ+8WHVOoniAg6wXlMaSs110jJIJiMXQxWGxe9gs+ygaLqYq8IT0gG+tAETkLVZ9rNtxNEhiBPEXtAtzMZJ49vvE72JmKO549PRFyrrl+Rajg7pwySiUgXYXhy8SmE4sEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/Eh2Ny4toAk88+R/AZHXRCYK/jMuj9pdT8qbZ3oydc=;
 b=bF2Hf1cmmCTQHMZ9A9Bkdu1oUoYT2+DSnuGGa8OaARn+/34L3Sw/buiZBZl+mEKgzVWP98/UTRs7vUKiY/KvgRLrNKXQoda5gIskEZXrCYRKvzBKQ4nBnO/ipZegXWqzWPAvMOECBSbOk+Nk1qD4D0ZW8N1gr4LjH0bCwGmKIyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) by
 DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.31; Mon, 9 Oct 2023 05:46:28 +0000
Received: from DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::770:785a:6b8b:600e]) by DM4PR12MB5962.namprd12.prod.outlook.com
 ([fe80::770:785a:6b8b:600e%6]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 05:46:27 +0000
Message-ID: <bb3ec2c2-332e-d6ca-2c06-31d2b68d346b@amd.com>
Date:   Mon, 9 Oct 2023 11:16:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/3] platform/x86/amd/hsmp: add support for metrics tbl
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231005053932.149497-1-suma.hegde@amd.com>
 <20231005053932.149497-2-suma.hegde@amd.com>
 <d3b1aeb1-b86e-7df5-1b69-3e7d9ed9caaf@linux.intel.com>
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <d3b1aeb1-b86e-7df5-1b69-3e7d9ed9caaf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To DM4PR12MB5962.namprd12.prod.outlook.com
 (2603:10b6:8:69::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5962:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: fde12f8c-0bdf-40e0-0f29-08dbc88b13d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eTuMyqmU5bmpTB/n3/H9zPyYErZKV5DUwasGcBRat79DunvtvX8knJv31BWJbD+qxGY/PkilOdb4tepsa93tfU6ykh3OW9rmGZ/hK5BN9ulLt5W8xpYJCy6jOSj0sqX1oji8XTo8FeAMwcYZ0B7eZkZnDGIn+Xl/3yyI14uTXVupPzuAe3zeWtZ8V676L5xOj0pSEyDLbsdYYElRoXXJB8/n7mSl+vJEByYryrJ/H8Hi95a+8e8vDVigREMLTekb3aWj/xIQ5NGf6vjsyZ2flb2/V5tOyCJEr/f2leCZn2cF/bD3S886It8VqmwNmUTGAO17uMMU8pBNwSHaEPfZNmPA/raq86///iRhu1e3/5wIKq8ubM3bzm7tN37oBWBW2nEjAoRi2zq/7Jo697j9/lk/B9zXvoyP08SEPgTtFWHTqkauYDZy8Fl+shM5bqopNF16jlhZNDogAT0KtOjAJ+3Q8+65VA4atGzwRHukOO8rFJzHX6uEVOdBY1USvY7EAc6pN58jWdcX8JTvjtenIypzv9ypnuUupHd1jUqX0ho/INNNknw8AvhI7aVZMZaT0f2W2R4dxa9Z/upcIlxs8zTO7bJyXW9YBesyInuc13ZL8NuuE8vvvp+qMxasCmzJWwYpBzMKXCKEAOn2G/BSEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(4326008)(316002)(478600001)(6916009)(6506007)(38100700002)(83380400001)(6666004)(2616005)(66556008)(66476007)(6512007)(6486002)(8936002)(8676002)(54906003)(66574015)(2906002)(41300700001)(26005)(31696002)(5660300002)(53546011)(66946007)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2pIa3FwaUlRUjdDNWtuL0ZVa0xvQjNNeGlFQm5TSE5SeTJBWHc5RWtjOVZy?=
 =?utf-8?B?a2JOVy9PeENqNklaVEEvend0RVdacTM1WUxzd0tYc05Tbzl1RGtDOEZZNEJO?=
 =?utf-8?B?VEJ0a3gyVW0xMndaQzI4a3M0Q3dmOXdDVWMrVzdFTTlHU3ZuQStXQmxveXR5?=
 =?utf-8?B?V1YyQndrdGpzZUJ2OHVVOFhGMG50Nng2TGdFbkp4d2ZkV3ZuMitXOHFLejlU?=
 =?utf-8?B?TmE1cjdpTlBGSGZHUDh2T3hSazJqWGNMUlQwaEdIWG9xTUpyeE9vTklSZ2JO?=
 =?utf-8?B?UjBjRVREd2VnRU1pcHJNNmoyOU03WWZ4UFBwV3VtR3V6Z3RkMDdzcjFoeFdY?=
 =?utf-8?B?RVlreVRQcFNXeWZjVU9wcG9KY0ZsNy85ODM1UzdVVWFmdEFwUFhWVC80RURj?=
 =?utf-8?B?Y3VEdlB2UU45Z3dxWnJLdjgrb3dTNzR1MmY4R3hmOUtnelNiU1FtSmNiaEVN?=
 =?utf-8?B?eEVCZ2xMVXJhekdrNjB6SVkrTTBmeVkvUnBZSCs5Z2RVTStBL3dDL1pNY1FZ?=
 =?utf-8?B?eFUvb3AxWFNVcjJnVWpGU2lLQmp2OHJRL1VsRW5WcUttSDFzN0FOUU1PVkN2?=
 =?utf-8?B?YTM5dTdwWElZbGUva3ZjTnlmTy9EQjYxZEVZUUpqYnBKdlN6YWE5bjhldlNB?=
 =?utf-8?B?LzVHUlhGdGxqUGRzM0taN3lpMXNyUG01U1d4OW9PRDdsa0VwcnhnTDdBUVVQ?=
 =?utf-8?B?QjlybExGeWMyU3NmZ1lvbnlkVFdQNVhQZ2ZLZzNzT3d0WmdHN1Y0NlhzSnFm?=
 =?utf-8?B?bWlkU0hvTHNQcWN5UEdBSGtmazdkM0Q3ZktMeXQ0Yy8wWnpST2FtZ251Q0Ra?=
 =?utf-8?B?dFpNQ1lJUGdxNWN5WlBCU2dZaTdzREZZYklPK2plUFFQTnkxaWRFbnpoblRk?=
 =?utf-8?B?SjRrRWZPZmtrbDB6cXpXbXJXNWRnRHVDdm8xOSt0UGN0YmIzVU9MbUFNRERQ?=
 =?utf-8?B?aEh3MXRvR2dIb2M5Y0ZtemR2d3RYN0twUU9ieHo0NzFKblEzc2xmemwwMHBB?=
 =?utf-8?B?dkpsS0xkbTJqa2tiajE1S1p6QkI3ZllBdjZheU1MUG9CR1VNdHZpKzh1SzRP?=
 =?utf-8?B?bnZVLzdkTllzSEdoR2R5cU1EbExLNlFIQTVXMUttZ1I3dFR4enFocDMyeTc0?=
 =?utf-8?B?Q0pmZnNOSmZ3dXZaV2FHR2ZydG8vYWNCNXZNRGpjMkpWRFVhZWJLSjVHTzIr?=
 =?utf-8?B?WGpuQ0hjOW5nYkpMZWlPL3F1ajJtM3VqWDhRZTdUa1M5WDVuZGRnK1M1SE40?=
 =?utf-8?B?S2YrMnNlNVdBTStCbUF0c2VrVm9ENFM4bmZDYk5iMzRWRFFmeGNacFNWZzg1?=
 =?utf-8?B?YXFwVlA5aXVMRk0xVTF2S25BS2pBamdKV2RvVnptUUZhRWZaR296c2JuMlR6?=
 =?utf-8?B?eHdvcExCbmFTUHZjM2FJSnd6Z2tCcG5tKzdWZzhLUnVzSklUeHRxaTVNbFZQ?=
 =?utf-8?B?Z0tzTjBBWkNwengxamp5SWxXR2VCakZCdEpmRm12VnlzSWJFa0Q1K0huZXdO?=
 =?utf-8?B?OGtpZTI5cmgzOTJJZFR2VFNDZUlDMzFUZmRrTFYrRDcyY05teS9zbzQzbVdx?=
 =?utf-8?B?ODJDYnh3RnB6bE5QOXl5WDJkV2lKLzlRVWN0TTNuZWFjdXVGOFNDaHZpZndi?=
 =?utf-8?B?N1lsSklNK2ZGNENaMFgzeUJTdUwweU9vREh2aElWeEl0dWIwdytQMGVJNzdZ?=
 =?utf-8?B?TXJiL01jeFdRcVRLZVVSd21paEZ6UTNEMnJycWdMdWl4NWlwZEJueGVudjg0?=
 =?utf-8?B?WUFleHh6N0NMTDYyb3ZtZGZxT056WncvV0RRRHAxRkFQZHRVODhtclNhVkNE?=
 =?utf-8?B?eXg2YTkwZzcwai9rdTB3SXJ6MnVMOEVQL0FDazRiR093SkNrV25Ra0N6V00v?=
 =?utf-8?B?UllqYzI3U3ZsM1dWbnRya3dndVdjU00xdm5USmlzNFBKUFQyallpUTJIQ3pQ?=
 =?utf-8?B?amNzdGRMQUJDa1Y1OFNoRHdYRlZ0NXhVaXk5dGkxZ1dZeHNNV3dJZTlQdGdD?=
 =?utf-8?B?MWprRWowYWVqeXcwL3QxUU14dmFDQms0N1dXczRhdVp3R3Z4VXFERGRVMGgr?=
 =?utf-8?B?UVQvZWRCTVRHb2lpREN2cnVtNXFzMXV1V2dLakttdlZGVmx6cjVHTWxTSDMz?=
 =?utf-8?Q?rjswLatue5s3c431/XTSnNwgs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde12f8c-0bdf-40e0-0f29-08dbc88b13d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 05:46:27.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsczWlQ49jckpy9utibRd1bUUQKfSvIwACJGDyLov1JugPX7qKHX558F65FquI2R/qpa8vMlQ3A1tTs2ToDFkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 10/6/2023 6:51 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, 5 Oct 2023, Suma Hegde wrote:
>
>> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
>> all the system management information from SMU.
>>
>> The metrics table is made available as hexadecimal sysfs binary file
>> under per socket sysfs directory created at
>> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>>
>> Metrics table definitions will be documented as part of Public PPR.
>> The same is defined in the amd_hsmp.h header.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>
>> +static int hsmp_create_sysfs_interface(void)
>> +{
>> +     const struct attribute_group **hsmp_attr_grps;
>> +     struct bin_attribute **hsmp_bin_attrs;
>> +     struct attribute_group *attr_grp;
>> +     int ret;
>> +     u8 i;
>> +
>> +     hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
>> +                                   (plat_dev.num_sockets + 1), GFP_KERNEL);
>> +     if (!hsmp_attr_grps)
>> +             return -ENOMEM;
>> +
>> +     /* Create a sysfs directory for each socket */
>> +     for (i = 0; i < plat_dev.num_sockets; i++) {
> The change for i to u8 seems not very wise given num_sockets still is u16
> as it can turn this into an infinite loop.

Hi Ilpo,

amd_nb_num() API which we use to identify the number of sockets on a 
node returns u16. So, we used u16 for plat_dev.num_sockets.
u8 should be enough, as present AMD processors support upto 8 sockets on 
a node.

Coming to the warning raised:
We have defined, HSMP_ATTR_GRP_NAME_SIZE as 10bytes, 6 chars for 
'socket', 3 chars for 3digits (socket index) and a null terminator.
Socket index may not need more than 3 digits in the foreseeable future. 
How about, we declare i as u16 and typecast it as (u8) in the snprintf.

         int ret;
-       u8 i;
+       u16 i;

         hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct 
attribute_group *) *
                                   (plat_dev.num_sockets + 1), 
GFP_KERNEL); @@ -449,7 +449,7 @@ static int 
hsmp_create_sysfs_interface(void)
         if (!attr_grp)
                 return -ENOMEM;

-       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, 
"socket%u", i);
+       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE,
+ "socket%u", (u8)i);
         attr_grp->name = plat_dev.sock[i].name;


Thanks and Regards,

Suma

>
> --
>   i.
>
