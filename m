Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD06C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 22:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237017AbiBPWZC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 17:25:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236979AbiBPWZC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 17:25:02 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2074.outbound.protection.outlook.com [40.107.100.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDE42402EC
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 14:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fe9WEdKbbcplUUSdlZmKjbIfLHJmJxGzW7+bxta88GcPQabpR1pM0SnMQQ/6ZK36yJckVHT2I0In3oz1k2t8D1tku7XMWFe/ErN9jfqH1hWVw1YIARY/pQ7k5nVYH68tygAZ0kQYI6UfhTOnnkTd05+EQ79nVjh254gB/+I8wbYwP1WDeoHT1prgH0WQXMu8Fo9N1vzcmlaAm+LuAhCW4S+M0UuhoFK33J7BmshLOiIgdrp8lfJTaTPU1XFa7TGwOCbrc3zlP+6+G3JXwxnbp+N7nSZwK30wrBCamx5iFdhC4ZiOxGNvz5w+p/gHNi5ClvYZGH2tfgBLxofvypu9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orNTWTABKsnCy8TwUEjSiguQC/dItHgkG/bpcx6PE/A=;
 b=P9Ga/qT7ZoeTQP5XEgKDqidVYPDtd7tVEj5jL5IiH6WpuDi+EnKILravI6sW6dVx4f5pggmqV8yd9bUz3Go09tnoBEscV9GtUJvGQCjq+aepgkNIGuDZSZ1Ve0doSaipiMeqauNfnQdeo267R3oMhygYGLY68uWfsCeI675p2+yEqwPjem9SlpRoNiD1LFuP6mKmqkIq5BT2MtqroBApKI9nJ/kKXwUam/ajqMqLHDAphKuvnwXkWS4gM39xOCQfNLoUSAhfxYioEyX6oaqRcwouxrAFzeIVCGYWqKrvTG3UZ1cRjE9A/B9mF0AYYJ9C12FElKYe+nePFKwgxyzXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orNTWTABKsnCy8TwUEjSiguQC/dItHgkG/bpcx6PE/A=;
 b=qP/XNFpX/tZUKK99LU84qMZHWoR6H4L+9Gl1+S8/76YLM1tZk0ubzAsOvFlDrLua+m/3tfa9OevN/CW7sN85JX1KCLWe2dyI6laSZ2BsJUZJElBLtcKcOM8DLT3p+pW1ze1yqXsjFVn/PVQiTeBcoZ4pqRXlz6zQUO9m+C5UAcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by BN6PR12MB1187.namprd12.prod.outlook.com (2603:10b6:404:1b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 22:24:47 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8d44:d69b:b031:1d50]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8d44:d69b:b031:1d50%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 22:24:47 +0000
Message-ID: <a130d618-c4c4-4a05-2401-74058275a8bb@amd.com>
Date:   Wed, 16 Feb 2022 16:24:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Song Liu <song@kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
References: <20220216133336.108810-1-nchatrad@amd.com>
 <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
From:   Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:91::11) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 138024b0-7093-4d07-f112-08d9f19b237f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1187:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB11870603C853B27046905E40F8359@BN6PR12MB1187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2P879rbBx4pC+bHyPARSyULghc/ayMhl8+Dl5nffKDM4T/CwHzfaDvgez2+W0h+RUYJWO+eAF1FfVm+6f3fTodl55pmqve0CZ8TR0CAaxOALh7QOVhswpqf686qHbFUlDcc2XOScqyjrJQr8B0w6m76tAMEtM3tkrNjsorP+dAC6FlrRM9t0ce8FDiVsfM6FYZHUDgdiFsvG6Im9JcJOk1l/rKA1uY7PFNMKEi8MkwDBVYVeJgBGVAE42EM6HvSM9Ixg7Apm8NSVR3QCE2CmfrNOtjURhxobZ8tkIn+lsw6TWgGJGjSh3D0xa2psHSCwfXbRHaxacXSDBvCnC8dloeykXOcT486eJzaGZVABukkAgqtTG0DL5+CIhgdWC9s4POd5HUSuFPq7x1STcveHxbSBxOB4IR74x5b6IQx4MpS64TjRJEB0DolPwr+GOMzhYdxbN44QhO89s5uem2kypI9AVj7iodU+FK728C5DuDx5CoWY/rjOe49RYQy32OlTCrLtUZebtdlRTlaq5hw3cVuBeSv/PD/GD/wNvrmCom06VF+auRb8GEjb4Jh4+Plbo+1Nw1NAEBVvO/KFwAHb8HjDrAiuIYw/Av+k5S1VB56SQWqnL3te+Qj5haMliIwMu31Cx9a+chkLF1jb+Imza3+1HaDD29BRc2XtUdsyiUVW/T8B3Q6fSuKYU28khSM+yJrqdLJiBExZsr9k2/7pTpkF4XN1YmP3Ck1ZtzDgZS7N5QFl0m0LN/rZDJL/VGlAzs2YsVFRXCMTC7ig5jGDp0jpHDyKR4IBjK+kDuQD9f/joOTcB2w4rAwhuX7qKHs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(83380400001)(38100700002)(8936002)(966005)(6486002)(5660300002)(508600001)(2906002)(6666004)(66476007)(66556008)(54906003)(316002)(66946007)(26005)(186003)(2616005)(4326008)(44832011)(31696002)(53546011)(6512007)(45080400002)(6506007)(86362001)(6636002)(110136005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3lJZWJmV3pSNEVhMkpaWTRhdDV4b1ZuOEVKRHVYc3RtWm5rSFRYMXRteUoz?=
 =?utf-8?B?UWJXUjB1RTV0MHovUG1rQjQwWHB5YnpFWlpXUUM0UnMzRENpWUFSdkVRVzBF?=
 =?utf-8?B?MXQzdnVoRkxsNW12ZXQ0RnVOeWJ1dzR2am5JUW9vVFF1V3NOWEVXcElPRFdi?=
 =?utf-8?B?MWJ0K3gvNXVSWldaVUpTOTlqcWdqQmVHRm8yR1VnWm9uV0ZvejZxZWxyVXpa?=
 =?utf-8?B?NnNLcDhwUVc2Q1ZmWXNvK1NxbkZvSXpzUmx4cjJVc01TWWp2eDNnRVdWa1dh?=
 =?utf-8?B?M29xaGNJZ0g5aVg0MkxlaHhySHc2bFFuUWhvVC93N1UzeHhJNkNjSGFlbXY3?=
 =?utf-8?B?QWw0Y2F6TTFGcnFnWUh5NWhRV21DMGNUOUtYSjVKY2dSTi8xY1hKcHVmNUVr?=
 =?utf-8?B?N1RzR1Q2c2ZLeVUzcHp0QUdsUkcreVFIY29SRlVoRWxoQWJ1dXB0SWJnNy9a?=
 =?utf-8?B?ekkxMnF0R3BjK1lkaWJBWHJNZU9oNVgwWGRTdVQwNXc5dHdjcGRDRDRmeGFY?=
 =?utf-8?B?RGNLTkNpZEh0UERsZnN5VHg2ZG04a1VodFRPa1ovVCttYVZ1NkVKRWxDdlMv?=
 =?utf-8?B?R3Z1cUlMc0RLWEw0N3kxU1Vsd0lMWEwrSGNvclBmdlVieFJ6cmJlR0tOYlJT?=
 =?utf-8?B?OTNLVzNUWEVJN1IrR25LZ0dJeW1aaWEvaTNWckFoOFJ4b2dDQ0czUlpoblZD?=
 =?utf-8?B?UlpxbXMvY1JSUE5zanR4TDNHVnc5NjhvRDNCTkR1c1BtMDBETXpHSkpIL0V0?=
 =?utf-8?B?Z0tPMEJYMWcySjhIVXZkT0FLNEttZkkxSDltNnp0WkRLdEhEck5qV240ZmNJ?=
 =?utf-8?B?UGtNekRSbVhVUU9SK0tDbXhPWTZsNERIMktvMzJDZEJhck5yR09HOXltYVdH?=
 =?utf-8?B?M29Da3dOR2lsdHR3cjlyS0JWTFBZdGtqVUp6b2pPdHNpTHNqLzhkQzJSSHN4?=
 =?utf-8?B?bW9HVkY2SUNzYjREck1CUnJiZ1YzMmpOVnhGN0pYOHAxWmRlNURHTDN5dmJw?=
 =?utf-8?B?WUQ4UWoyVnRkd1FoeGRWL0N0NHhIUTA4NEhRU05tYnVJVkhaYlI1dVd2M0pZ?=
 =?utf-8?B?ejVRNnZUUHZ3a2VMSmxwVVhiaktvTDY2TG1meVhmMlBrUUgySE56Qlh6NXda?=
 =?utf-8?B?bWs4S0pSODlVY1VPQ2VIMWtZbkJhTjB1OFdTVmxqZklOQW14REt4Uyt5bTBO?=
 =?utf-8?B?L3duZkN1UzRJM2h5cjFmZFlkL3V1a3NNTm10M1NZL2RUTVVLb3h3THpGN0ph?=
 =?utf-8?B?NnFhWEJFTzhEcTlieFpGYmdTN2dGcGpQUkllcytSQmExT014em5YSUhBVzJ3?=
 =?utf-8?B?WVVPMU1yVkVjd3RPcVVnWlZ2d0dJeEljL2FRUkFvYUpPT0VLa21XcHM5ajZ2?=
 =?utf-8?B?S1NBZlB5T2d3ckhMSVFUV2lKYVEzYUdJUHYrS3NMalhGd2lZUFpVOGFuRW1Q?=
 =?utf-8?B?SFVQOC9uR0JYM2RaMVY4THFma0krSG44QjViRm9uVW1Ma0JKcmZUbHJnOFFa?=
 =?utf-8?B?VnJvQXhkRzZuTlA3bjNzdzJ0SFBDSC9menNveDV2NHNrMUtqSnBpelR2bHVV?=
 =?utf-8?B?OFFudGJzOEkzZUhlMnRzSG1XOUpiMzdRRi9TY3ZWZUVaRjM3eVJjMkR4RHBl?=
 =?utf-8?B?QUdlSlpKazAybHF2Nzhkb3hMZ0J3VGFXMlVrNVhhd0ZyNVpvdXpPSzdQbWNZ?=
 =?utf-8?B?dkVPMm1Ic1BMUWV0ems0OGNRcnNyTHRocXdwU2tkeGZEaldUdkxRbmVuMnM3?=
 =?utf-8?B?MHQvVWRHSTlDYm5HeEIydjhkWFVOODZyLzBNaFBLMmN5Ny8wbnFLZ3Z2K0RN?=
 =?utf-8?B?UllSL3BVQnl5TlFyakhJK1VZYW1UWnVGZzcrdURCY1hpK1c1d2ludXZranVu?=
 =?utf-8?B?UFRtR2xEdytRS0QzV0lEV1kyTzluS0h5aGdYSkJxOGFoaVZ1M1pGNW9CcWl2?=
 =?utf-8?B?V2tqNE9qQlhvY0MxZmFqUXRHd2pWZzEvaTBKRGYwQlF6eHR5TitvNEJPZG1r?=
 =?utf-8?B?aktyWUUzY3JKWDVpSWl4a2JnNElTNFVuYndDMm4vaDgweGc2UDFEdmxuMHhU?=
 =?utf-8?B?dnFmTU9QVmZ2ank4Y3d1akViaUFhL1RUQk5STHJjZmVvOHZHWjRUcVRCQ3lt?=
 =?utf-8?B?dG05eHhRRllEMmJyY20wSGJMa0N1cVhBMW94d2MxSXRoam5BTWlZSHR3SnUr?=
 =?utf-8?Q?dZDSknc2MZZDnmNTL7eTG58=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138024b0-7093-4d07-f112-08d9f19b237f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 22:24:46.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLaLkos7dCx2XQIyePPvMQzZyL0n/jNvXQV41AMVIBsEsXbOlws4zdINLJCar5jGIpICfzeJ6OWrpofGRUuqHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1187
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

On 2/16/2022 4:06 PM, Song Liu wrote:
> On Wed, Feb 16, 2022 at 5:34 AM Naveen Krishna Chatradhi
> <nchatrad@amd.com> wrote:
>>
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> Recent Fam19h EPYC server line of processors from AMD support system
>> management functionality via HSMP (Host System Management Port) interface.
>>
>> The Host System Management Port (HSMP) is an interface to provide
>> OS-level software with access to system management functions via a
>> set of mailbox registers.
>>
>> More details on the interface can be found in chapter
>> "7 Host System Management Port (HSMP)" of the following PPR
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7Ccarlos.bilbao%40amd.com%7Cb33402053aa6443bf4f308d9f198a7fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637806460908911848%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=F%2BQgWoHlueI1CW14pJHhY4%2FwM5rOTOj0D3IO%2B7yhrbQ%3D&amp;reserved=0
>>
>> This patch adds new amd_hsmp module under the drivers/platforms/x86/
>> which creates miscdevice with an IOCTL interface to the user space.
>> /dev/hsmp is for running the hsmp mailbox commands.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> 
> Acked-by: Song Liu <song@kernel.org>
> 
> With a couple minor comments below.
> 
>> ---
> 
> [...]
> 
>> +
>> +struct hsmp_message {
>> +       __u32   msg_id;                 /* Message ID */
>> +       __u16   num_args;               /* Number of input argument words in message */
>> +       __u16   response_sz;            /* Number of expected output/response words */
>> +       __u32   buf[HSMP_MAX_MSG_LEN];  /* argument/response buffer */
> 
> How about we call these args instead of buf?
> 
> [...]
> 
>> +
>> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +{
>> +       int __user *arguser = (int  __user *)arg;
>> +       struct hsmp_message msg = { 0 };
>> +       int ret;
>> +
>> +       if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
>> +               return -EFAULT;
>> +
>> +       ret = validate_message(&msg);
> 
> We call validate_message() twice in this path. This is not a big issue, but it
> will be nice if we can avoid the extra check.

Yes, we can probably just rely on hsmp_send_message. We shouldn't remove it
from there since we export that function.

> 
> [...]

I have reviewed the patch, compiled with several configurations (including
allyes) and functionally tested. Also not a single hole on pahole. 
Everything looks in great shape to me.

Thanks,
Carlos
