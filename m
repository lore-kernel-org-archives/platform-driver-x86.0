Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF32AC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbiG1Rok (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbiG1Roi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:44:38 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F317274CC5
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1e/uw6mSdd69VvIjrofiZuFboRd+JI8j96j3Mkw31+XQ3eKNJ4ugximJX2x+4/bTFeZ1SJE7J8WJyg4SwU3xFDMqCPiZgufQl57+qgG+kql3Oo4AvkcSZ1ruH2KhWA7FLr7UcznkYhQg+rQ4s87K4xfxO8lFCBiIma3vuvBW8/FEPTl8wLqwh9MBWYHrRZAZc1x2dvlYl2AUryaMt0B5zyOWCBjICzI2ZnozeJ1K8crgeSB2uoRhRh7C36w19bKnd/uJ1ANN4ovowAJ6Gvq1+UahraZN7lwpL/5OJjAKgzChj/ajtdDh7p5VCWhMtnyvOqs5eR/p8mpJN2z4gU7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2zmnM6MWnGC8mhlT0eecd+MSH+MpYK77BO//1bIeCc=;
 b=AMnfAg54Ioy6LJPUKiymGEVsEVq7Deo0tR3tYbZvM/77yvjDN3Pql08825gyWufym+eJ2ZtDryQtFDiFT74kXRRbNGhJTgg9c/gJTll6xQBndh+XYTNp3izhHj5z43zrROVDrDMGcSMHop7GrYK0kRpx/j+ONAiPfDcowtwUbhfwi1xDoEKKN4hJtuMUi2AvA6N8LJY0npj0Eyv7z6ZgYyghwpELQknAcYYqCcvUaWajkcWJAK9Pm11qvEgqwI1TqSfbH0mwi/ccVgySJMm+WsT4pdG0ACllqbpBKqreMwx4ycRzLRqROnWW/HSbtEc7yR06eKxwAPx1rr3qlNcesg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2zmnM6MWnGC8mhlT0eecd+MSH+MpYK77BO//1bIeCc=;
 b=Z7Om6GDP1SnuvTYXurpTSxUl8wQpFyqCnhqd0qZWj4SUppLY0x3V5Qm3MrvQSrUzXhh478zf4wIQmiSl7StpW+OgvXlig2N2lbGaB1qQuTBJL27lUDR9JFkuGUpAjy6Ld41crePsGLNcYOTeHLY26hJTBN8SQv8+boa3WK7Xd/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW3PR12MB4507.namprd12.prod.outlook.com (2603:10b6:303:2c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 17:44:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 17:44:34 +0000
Message-ID: <910eb72c-22be-f010-8ae7-35abc7467d24@amd.com>
Date:   Thu, 28 Jul 2022 23:14:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v1 15/15] MAINTAINERS: Add AMD PMF driver entry
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-16-Shyam-sundar.S-k@amd.com>
 <0d4b3aae-c9ae-fd0d-6beb-aa98fb3fba86@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0d4b3aae-c9ae-fd0d-6beb-aa98fb3fba86@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 272b77bb-e911-4d47-9ec4-08da70c0d544
X-MS-TrafficTypeDiagnostic: MW3PR12MB4507:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7yRSvL4zMYSc05En4qfsWIhJBVTUZwN3azHL5MvaAjy7mEvPKpzCtD9coFpluZrtXm5ZlujOHDEjad16fgUj1OuZp25/uz1cMO4MgyyTd+5fTTY4F47fJru0lQ4pbtNSeI6xlqbUyN98YSfmI2YQlfYspZOAccvwOojqaRLlNPJA72ChM4RRScoeQgsZPBADCCjC/iAeIRQMx2Rno/SHvge2y/ScLIL1gAoC2SDBIR3VLmJop6Vs/xFTglORCrtkKCJtl0VPqDzyE7b9PFMkUMHjX+NuOUlX3NySQ834Izl/Gvvm7F3AEGSjtEpgurh5Bg/LYmMc1zlsG1BLJxMShS7ivhRann6pGH79Y4iprPVi0R6L09hOc1qjN0huqqD1WUsEzC0Tjk5j4LADQuaWSLUIo4xqzvnLY+Jb8wzuyHbxKQk/Hq/p/dQ+Qk2MBqnUZW7qXHnrwNde6PsD0EpOqjl122+1dh6hJBid7FqMHi/mesWLAbca8ZHmuBh/rRH5+OFi1fRo3XYoyBveScmEG1iPIuTO8Zh9UlE14mj6pvlBrqrQhFz9oA2K2tNtyJKr0wRszOW8/YoPYSXaXmpXUm2kyQlj6aiYZEawcGNMhCGrdttbE72Y9ZVSupvnKlDvZxVGUH0MlaOYqlt5eAXIL0yGPZJRaqNWXs7NuiBm24npKBiZQi9pjT8g1XNXgFpLzyNv89oqjkW32ZOtmgGdF8DGcMaV2gIibnnZBOW3ThoNspKlJl4aZa/l+Uytv2h/Ya2Riewz8TSPOnJqpElsbJxZmQd9E7gUgeX+cCRGWw+N8O2jq+hX2mqt/1hMi+dSd2WSl8Q4Dl+2HNmoJ0J0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(6512007)(53546011)(6506007)(26005)(86362001)(41300700001)(6666004)(31696002)(38100700002)(2616005)(186003)(83380400001)(66556008)(66476007)(8676002)(4326008)(8936002)(36756003)(5660300002)(2906002)(31686004)(478600001)(6486002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHNsUTdGZFJZSGg2QWorWGJpRndibUxoSEtIUmpTSnl3Nm1BaDJDYXlXbld3?=
 =?utf-8?B?K0hORVBuTEdJYlBLeXRMa05kcFVid1JhcTNsdDVVWTU5eVB4U2RoUy8xWTdH?=
 =?utf-8?B?TnpjNTRlaUh6Um5PZTZIbDU1R3hLK3FWWTdNRFpxTFp3NmFDWVdxb2tZWWlC?=
 =?utf-8?B?eXVqZDZ0TGNNNHNSQ0tCRFlDQmpLNG92ckRqaU5lMWw3R21NTFowUW9IQkdi?=
 =?utf-8?B?UFdhdXlSUmZLM09yazBMN3B5OW0vOC9DbVlGMk9RZS9lK3l2YWh3WlVobk1L?=
 =?utf-8?B?RXUza1RpYUd6LzE2bHNvRzdnTFlqQVBnQStlbkRBM0dFeU41S1pMUk1oQkJp?=
 =?utf-8?B?aU56ZnE2cDlIMjJlRDdjbEY4cHZmc2tlUnUxNGF0U01nZ0JscURHTUJVZ0Qx?=
 =?utf-8?B?cVlTbFVYdWZDTmdHcmJNWHYyMm1vUW1jeWc4L2h6NmhsMnJFYzlQSVA3bGpB?=
 =?utf-8?B?ZnVSenQ5KzdJOGVSRVR4U09WZkNPdDhyVHhpRzN1NE52NDA3ck4yYlZ0WlJa?=
 =?utf-8?B?UDgxN3R5cGhHTGVtNzlPTlI2N1dCdCszUUUyZTd3SUoyaXMxS25SN0dKejhi?=
 =?utf-8?B?RW5Ic3J0WCtMTk5TcFBBU1o5Tm9BYklsdGY4T3Ywek4vYkZiUWhtMjRqekN1?=
 =?utf-8?B?Zlg3Ui81aC81Um5hYU9WVzBYNWVJSGhaTXpLOElLZmc1TFpUMWVMTkQ0aWtS?=
 =?utf-8?B?a1FBWjRhQ3lLcWpzTTVMVHdycnNzY3lZS1pWMTZudlJXcE9oL1UyS1BYUkJ2?=
 =?utf-8?B?Y0NKTlQrSHBUVkVoSkI2a0d6Qmt4T3V0OWdkRGluTno3SmR2Tm1xOEIwNXNK?=
 =?utf-8?B?MEFkeXlXVnRYMGQ0SkhOZ3hNbXlZVVlnTGtoeDRTUldxV3dQQ3Q5cU8zc0dn?=
 =?utf-8?B?SXUxaDh1RkN6dTduWk9TSHVONnlsckJkSXNnMWsrVE5kREk5NVowZXBnU2Ji?=
 =?utf-8?B?Zyt3WDJZU2JVdUpKNXl2Tk9hakIvaldxVjhpRUJkaHVTVjJDUCtYVFEzaG8z?=
 =?utf-8?B?a1VTSHpPOXgwejJWMzYvdXI1Ylo5cC8xZzI0K2VoMjZrQVZSc2lSdktlZzlY?=
 =?utf-8?B?NHI3cTEzamovMFNMNVVQNmp3Ty9ObHZienpkeEp5c1o4VWRmSDNOS1FmQVBJ?=
 =?utf-8?B?UE92SWNRVjRwWjFOWTRuWDNsMW80amhaNERzbFpIS3U2RW5wMGkwUnc4SERU?=
 =?utf-8?B?VXlBVVp5dDdyUnowd0JSZ1Zsd2FhVVpVQnFxbUVyQTQ0TWRpdXhaQ3F6ZkU1?=
 =?utf-8?B?QXVzck1KdnNmOEppb1Zxa0RPTFhFSmVDQXpKRnpOTnZ2WlJCSkNkenRiWks5?=
 =?utf-8?B?UFBCMnUyNlpFVjZRMlR2MnAvamFiSnVRaE9PM2NMNEcxYXRlOFZRM0tkbFJ3?=
 =?utf-8?B?aHZpS2tHZ2ZiRmJDM2lIVHdIVGR6ZlJTczBmZHBNcDhYQktjeXB1SjVXdEI0?=
 =?utf-8?B?SU1ESldPNTNSYlZWMlRMMi8zRTdzRWp2clhnVmFGVGFJclp5aFFSeDV1Z01O?=
 =?utf-8?B?czIzeXl0bmgzUUhKakJsOERoWVVxc1E2K2I1VnNWWnlVdmp4eklORWRlbTd0?=
 =?utf-8?B?OExxQ1ZJMW1Ha09IU2toTzh6M3RueFF2N3JrMy93VmpMUjZYQ2EvMS9WbmFm?=
 =?utf-8?B?Unl2V0N1NmNWcGRHaGJmRGVJQkZXTklLRm1QZW50amJZS0xaQVFYWmdsTUQ5?=
 =?utf-8?B?dGxESHJ1NmErbk5rd3JGaFc4TnhJMEdCdXJSMmRYU2toY0lsaWdaRjZEMVRT?=
 =?utf-8?B?M0xBUUZVQ1FYamZaNktBbzZaV25zbDY2cm9pODhDNzhaakZ6UFZRYUljVldC?=
 =?utf-8?B?dnVTQmdGUnRYVHVPQmNibU1lbktaTWQ4VG5lS3FQMTB6QmpYOU9INFVORjY0?=
 =?utf-8?B?c1FuQTF6emVvaVFHYTZwWlArd3lDbHpsMlNCRnhRWG9GSWFxdC95amNZMTE0?=
 =?utf-8?B?Vm45L2VUeEVrc2w1NGtZaFc5ejI3VmJMeTAwYk50enpydGErME83Z2JYYkt6?=
 =?utf-8?B?eFdIS1NJNVZQY3pBdGtWdnlrZXRWcHNlanFGM3dXZ3MyTGFYMkpmZ0hvVWZp?=
 =?utf-8?B?bm40ZzlMZWlvMk1ZaDdFdGN4QW5YK1hwSHU1TDdjL1NZMVNVZnFHdGMrZmRB?=
 =?utf-8?Q?KHluxqs/ka3dZ08qk8+nkHeXP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272b77bb-e911-4d47-9ec4-08da70c0d544
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:44:34.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rLO2BLL7HIbDwEsPDGwEbrpPxEu0x/B1Wv1S7I5QAAk4Hq0t/rZsd+z7X3lK2r5Lq8+2ktHXzKP5BRlOAXUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 7/28/2022 3:11 AM, Hans de Goede wrote:
> Hi,
> 
> On 7/12/22 16:58, Shyam Sundar S K wrote:
>> Update the MAINTAINERS file with AMD PMF driver details.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Regards,
> 
> Hans

I attempted to address all your review remarks in v1. Please have a
relook at the revision 2.

Thanks,
Shyam

> 
> 
>> ---
>>  MAINTAINERS | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e01478062c56..d3f6cabcaab2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/platform/x86/amd/pmc.c
>>  
>> +AMD PMF DRIVER
>> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/ABI/testing/sysfs-amd-pmf
>> +F:	drivers/platform/x86/amd/pmf/
>> +
>>  AMD HSMP DRIVER
>>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>  R:	Carlos Bilbao <carlos.bilbao@amd.com>
> 
