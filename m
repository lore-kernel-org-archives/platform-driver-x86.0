Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A748AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 06:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbiBQG0H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 01:26:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiBQG0H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 01:26:07 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4822A4A3E
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 22:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwQDOJ4jYDFZp8x4WA2AR/1Zh/LqDQAdlzj0zbaIB3BNgQC+3bXGP8gaRkA6BAgE8p8AAv5KnDCO5RBu5A3OfLMXgXh/VDkvf1UqgWKWel/w9Cw/G1jvc1LqkjGD+N/XO+ZBS9BvC/ulPGvzogXM5nwfCZeQ7ohNPi2i5Xl+ZvXo6GxOUkJLFb0uEuulojeSb7DnfuNwgnIqDYViA4NhRT+MYmAieZg4zJB2f7q80A+iPxUEOPJcobYn/6L92F4rbZhkcmjiGpk/CdBLwgkBQgpXDAIgsC1P4yMvR5Lu8NtvOORhLmUDVdRFQxcQwuEQKZ+afjuLVYrjPa1tDcHY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY35tgw1ExGuqb/1iFD4kj8vKxRLK4jLdzRDPUcGswI=;
 b=Ik150SjS2hRYsKU3YRYhnj/gcOF9wD5svYad0XvzAtUYzME041cL2MymKHecuIJ0o+MR5CGhOzibAIUJ2purwck2MwSX1nEDVJ+bIpMLkTUqZU3rG88ojlR+cd16Q+eOxvqiFQvt7GtllIdPxpz1Z0kDxEFxeCPDMmEPhp+0tMh4Noq0OZJADVoqG5jEGIMAvjgS7UjHYr19oJWGqoiVNgpgfLSFc7xicIXcTgAlGq7i4QeS/CCWb09N4A/Ab0o7JeklMNSveNJGtjue1MWr4TCPAbuB4+gQKdtlwMyy0ei0s4O+vW3HM5HRDWIk/moVBQFqt3xm4phnQYdUxo1+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY35tgw1ExGuqb/1iFD4kj8vKxRLK4jLdzRDPUcGswI=;
 b=MoMC/yzCuvcf7Gm8w6Q3GdZdmqKr7dSF/m9ZcQm11Q+pnEOPNyLKc5tKnt5YeG3k5VLqIh2pzCWZu/8mbxsjRYT9Abd6s4nbIM2IKi9ZgaHlCzFAPLgKvtJ3BDkIXFS+M34S+UiZ+FWfHSSDNrgpLRNq/2ENWIOpEm3fLrhRsDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BN6PR1201MB0147.namprd12.prod.outlook.com (2603:10b6:405:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 06:25:50 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::487c:b25c:8d6:174a%8]) with mapi id 15.20.4995.017; Thu, 17 Feb 2022
 06:25:50 +0000
Message-ID: <26c020dd-bb27-a7ce-78d8-407f42e06282@amd.com>
Date:   Thu, 17 Feb 2022 11:55:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Carlos Bilbao <carlos.bilbao@amd.com>, Song Liu <song@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
References: <20220216133336.108810-1-nchatrad@amd.com>
 <CAPhsuW7gbYinzABHiDri5xpiHPrNh2tbPz8X+kTo9qWZbjGzmQ@mail.gmail.com>
 <a130d618-c4c4-4a05-2401-74058275a8bb@amd.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <a130d618-c4c4-4a05-2401-74058275a8bb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b53d88b3-648e-4ad6-b491-08d9f1de5739
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0147:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB01475A3099FCC967195B3E7CE8369@BN6PR1201MB0147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCKNuHr0c+ZLQH/8W+Uph3CxYYLrvudIiEjN1SL4N8kYdQZQkR8XpI9eG8SgVXATvEGWk2kfglKX+M+gGQyc2tVnilaPMrQTgeSlNwwG++qqC66vQhKyaHFckWH5EG65LZQrW7SbJnglwOv5bxH3QVCj+EPIxdwjaRY6q9xOT3xMNO67Kc4qiIMxMZop48Rf+hiJk92FQGnQcDBw1rpw+wB0Kw0u/FJejgjXqBTldtYMf9oDHciHJC40ZvVWCIC/QZYRd4voErzzJ9LjXxk32lBj0VolMEmIlH+jWbg3sQeY5IZQpO0RYBOUDMCREIhTszrgykSRUVvWX3IoyM2johxbz0vTGCYjTeotQLiHNB7Df7JyZayDYU/dUml6qeNyuCuyWeZ3lgqYSjpVyXyEBTxTbvMolUi/Utf6mCaH50aXWd37lHDphI6ep0lWoDLs0700bIlXbaKAoFHNFPcPMHJKfk9EACjE7qyabXbFYreboE+v1SGs0vWBRvqFmk31aVi01E+JSgER1UJ1iDl8ElkRI6QqNTV9k/doGor8gvpOoyP4UCKs0ROvCHJb32I73qvO3FCdeCe3CzLCQZSRTCb34pX0AnPnGGYzkGjyxIA39g4iiQNRVbeSrMgvEvIfV3hTIeWtJZYBjJIHt7o7uaZN0/wt0UaqOEsiGJz00lx7z/RF9+flP1XtNKVTWSvgYVVTo7HyZGIjjtlchLLHYVEQwaaUjJaK2HrXPT3FDl53WDV4R4AeF9DkVYfZ/3ZVXPnrLS0EFSOd1V2GUbjh5cPeP4rMvJ7jJfGHJ8gieHuwB6qXMiD0ZpORrhY5xOOWC2ofpAdn9ICJ4kV6nIr6Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(966005)(186003)(6486002)(31696002)(2616005)(508600001)(53546011)(45080400002)(26005)(6506007)(66556008)(83380400001)(38100700002)(66476007)(66946007)(8676002)(54906003)(2906002)(316002)(5660300002)(8936002)(110136005)(31686004)(36756003)(6666004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUIrQjFYOWlEWitZMG90NXllbER1RFVmNmpKRW9XSlFSSERaZUpXVXlZTGhV?=
 =?utf-8?B?NXJVaC9MZE5OZ0JDcFgwRlFCL3A4S2hOTDkzM3pPb0JDZTVWRTJFMnd5U3Rs?=
 =?utf-8?B?ZjZzMnM4cGdxamdKOFRoRTRoSzlIeXNUeVJGWmRIOFFlZndjdXk2MTBRb212?=
 =?utf-8?B?QUlkaEw3WEExVklrL1VRMTErTHd4dlgra3g5WUR6ZU1kZDh0S0I4a3F4Tmg0?=
 =?utf-8?B?VmY1L084bGJETzFDZTRYMURQOW95eGNOS05ROGNxcjY1VjhsTCtzRE5WcEV6?=
 =?utf-8?B?MzU2bXdLZnRVUytncG9iK2dTTHZWZ3l2Ym1KZG9EajExamFKU21oeHJlRm5E?=
 =?utf-8?B?dWNRcHZ0aVlLUWc0TWhQOHdhUjQ1anN4ZGh5UlBrdlR5V3I1MU80YXRtUVU0?=
 =?utf-8?B?R2JYY3FjUDdFaGtrRWZKNjB2Rmk0M0duenNXeTZmM3JyRmNxdFJWUi9uRmNu?=
 =?utf-8?B?bG9GWmg1VERXSHJIdzlWQkcvNndIdmhVNTBzeS9wcEVXMnc3eEVFZ2l1NmEz?=
 =?utf-8?B?RmtIbGxwK1dYWEtPL3BpZVRiRDdqNGRMVk1QNWoyTlA0VnhSdnFUVkN5aVFG?=
 =?utf-8?B?S05KRGZXVTlNaWNqREU3UFhwOHdOUW5ZYWhlYnVlRFRFR09jdEtVd1dKM2sv?=
 =?utf-8?B?M1Fhbkg3ZU9meVRjaWRyY09PL05GcDRHWVhYaGY3TUtOWUhYRG1XNGtRTjIr?=
 =?utf-8?B?SjA4eDBlK3Fvbm9rQWh0N0Jvc1Z6dUtQNDhZQjI0dmdKQ3JCS2xyOFRmckg0?=
 =?utf-8?B?b0s1cVZSSmlReHJ4QjVSaFBzUkFUTFl5T3NFWElEeDl0THhGdGNnQ1dVempq?=
 =?utf-8?B?QlJXeGY5U3NBVXpXTEZxb0NBbWZidkNld0t5ODN4SXZnZWkyTUdybzkyampE?=
 =?utf-8?B?NjQzZDFOV3NUeXFGYVlyZkFDcDN5ejhxK2cxZ05haWpFdk9qUTlGb1MwNkw3?=
 =?utf-8?B?Rk52SFlycWM1bGlOdzE5Q2Z2NUYzU3hYY1VjUFNaclArQW5mNCt0VXNockM0?=
 =?utf-8?B?UUZiVHEvdUhDNUh3VkEvdW9hZGtYOW9lUTVmNE9JU2I5eEIrSXZEanNDUUtW?=
 =?utf-8?B?QkozcS8wYndlNkxmOTJsbXlOT2VUbExaNTBVVGlDMG5EMmgzYW43eU9JR2dI?=
 =?utf-8?B?dVZxczNUZkFNU2F2c0xLOXpRaEdrTURXeDBlK0NrZkp6LytPSDduanpxOVVx?=
 =?utf-8?B?eC9UYlF5WndwbVBkTUVkRHc3RlZpSGdUVGxhTG9hYWZqd0J6K2tBMzZ4Y3A3?=
 =?utf-8?B?ZnN4emFxbmJVRkxFWnRzejdxVXZwNTNrcFZLUkpaZ3ZxYUVIb2UyZlpLSVBV?=
 =?utf-8?B?VWg3OGRqK3p2dGR1QVhzUDVpMXdnMnBqK1NqdUVvRUpKbitGQ0p3VjZzZXlJ?=
 =?utf-8?B?eWlkaW1Bajg5YnRkM00wbk5UbVJuQnY0RVBHdmI2QWJsRCtVMEFRRmtrbW9N?=
 =?utf-8?B?TEkyUThmYzFkQ1RhTUVWa3dDakRtNHhNZlZlUFluc0V0aWhUMVV6SXBHaEpn?=
 =?utf-8?B?d3RSaDE3bmhsczdrK0lYN2o2dnloMzFRbkFnMGtrNlhDdjJCOXlKQ0lYTW44?=
 =?utf-8?B?VmZDNndZUXFQMkhVeGpRTGtRdnlEZ1c5MEpkOUNQSFpMdHZkcENmTXVreGhi?=
 =?utf-8?B?eENSazFjOGZpSTFrajF3NzZYTWxpcG94Y09XZzBIckRiYkMzL2QxQUtJR21Q?=
 =?utf-8?B?ZHZac3lrd3JRZ1BHZjJiV0hrcFJNazE0T3NEUmxyckUxV1ZaeXpMTTRZMWU0?=
 =?utf-8?B?N2ptbWd0UDBHUks1d2szNGFQWml5TktXN2U0NDdXaFlrQWZYVkRrS3N4NjZG?=
 =?utf-8?B?cUxaTUxxN000aDJrZXh4dVMrd3Y4cG5ackFmdWVFTFhRQnBHa3g5ZWQ1OWRK?=
 =?utf-8?B?c3pGV1IvcGNpZ1J4b3g1dVRaSnpKRTNTOVlIK3V5ZmNHTFM4WG9xQnJFTDRT?=
 =?utf-8?B?Q0I5YTg2bmUvYW9MWTR0bFQ0Y3dJMjJ1bytNS3hQTTBJSWhiWTVuYXAvMlNI?=
 =?utf-8?B?TnFLRWJBd2k4dFh0cjVPN3BraWdoNWRBd2V4YjZUaVRYOUZGSUVoZ291QVJ3?=
 =?utf-8?B?dDVzd2wyR1B0WStCTnIxdWYzN1YvRlNrUVRLSXp6T3lCdWRvV1RFdWltRzZP?=
 =?utf-8?B?TTNuaUc3VDQrUnNnTk1iNXpuMnI5bHQzMGxaSCs5eHozRExtZTZ2SjkwQXha?=
 =?utf-8?Q?CKOT9ju4y9rNu6pYx2yOBBM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53d88b3-648e-4ad6-b491-08d9f1de5739
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 06:25:50.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAe5Kpo3R4lBmWfMLyyhYuLle4OzFZH2NbMVoABNjkaCbEGdS2SrG8RXUDBrW3kHXShZXjzVv+yCI7GKzjq1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0147
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Song, Carlos

On 2/17/2022 3:54 AM, Carlos Bilbao wrote:
> Hello,
>
> On 2/16/2022 4:06 PM, Song Liu wrote:
>> On Wed, Feb 16, 2022 at 5:34 AM Naveen Krishna Chatradhi
>> <nchatrad@amd.com> wrote:
>>> From: Suma Hegde <suma.hegde@amd.com>
>>>
>>> Recent Fam19h EPYC server line of processors from AMD support system
>>> management functionality via HSMP (Host System Management Port) interface.
>>>
>>> The Host System Management Port (HSMP) is an interface to provide
>>> OS-level software with access to system management functions via a
>>> set of mailbox registers.
>>>
>>> More details on the interface can be found in chapter
>>> "7 Host System Management Port (HSMP)" of the following PPR
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7Ccarlos.bilbao%40amd.com%7Cb33402053aa6443bf4f308d9f198a7fe%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637806460908911848%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=F%2BQgWoHlueI1CW14pJHhY4%2FwM5rOTOj0D3IO%2B7yhrbQ%3D&amp;reserved=0
>>>
>>> This patch adds new amd_hsmp module under the drivers/platforms/x86/
>>> which creates miscdevice with an IOCTL interface to the user space.
>>> /dev/hsmp is for running the hsmp mailbox commands.
>>>
>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
>> Acked-by: Song Liu <song@kernel.org>
>>
>> With a couple minor comments below.
>>
>>> ---
>> [...]
>>
>>> +
>>> +struct hsmp_message {
>>> +       __u32   msg_id;                 /* Message ID */
>>> +       __u16   num_args;               /* Number of input argument words in message */
>>> +       __u16   response_sz;            /* Number of expected output/response words */
>>> +       __u32   buf[HSMP_MAX_MSG_LEN];  /* argument/response buffer */
>> How about we call these args instead of buf?

Now that we are using this member for both input arguments and output 
response, I've changed it to a

generic name, no problem will change it back to args.

>>
>> [...]
>>
>>> +
>>> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>> +{
>>> +       int __user *arguser = (int  __user *)arg;
>>> +       struct hsmp_message msg = { 0 };
>>> +       int ret;
>>> +
>>> +       if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
>>> +               return -EFAULT;
>>> +
>>> +       ret = validate_message(&msg);
>> We call validate_message() twice in this path. This is not a big issue, but it
>> will be nice if we can avoid the extra check.
> Yes, we can probably just rely on hsmp_send_message. We shouldn't remove it
> from there since we export that function.

We are using msg_id to reference elements from the table. so, i will 
validate the msg.msg_id

is with in the array bounds of hsmp_msg_desc_table[] here.

>
>> [...]
> I have reviewed the patch, compiled with several configurations (including
> allyes) and functionally tested. Also not a single hole on pahole.
> Everything looks in great shape to me.
Thank you.
>
> Thanks,
> Carlos
