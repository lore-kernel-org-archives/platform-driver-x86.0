Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E044C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 12:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24F8860F70
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 12:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbhJZM4T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 08:56:19 -0400
Received: from mail-dm6nam11on2046.outbound.protection.outlook.com ([40.107.223.46]:23425
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232718AbhJZM4T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 08:56:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq9FcpS997ss456vX5PMIbnpt++EJF6KjMaowiz87SCPrBebbVWem4PujafA2lCP9sEzP2E2fTepTw3B9jBZxB4e6TWMoepDiDjLINEumy0Wj0qkOlSf9bulqIU/qFRq9RFG0zAyQND3/Lug3NEj/O1qHrkOV5X1iQB2x7EH+k9NKZJOg6Hty/TChw5EzFk8CvbYZi72avix8jezqKWtmDcdSbwEKtkxK5+8Bb2WeVp3rV6xOu1xwgODGLHGyZEp7ATX6tfRVKvYQByMAJ2XZ2GGwErr/bBDWEainkDyjqmmIX45ek9KX6Clnop36nUhZuKYx4RFvw4RuFShHx5m/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FOE2vD+/i6N2jdrT46gAdlC5YGiK3Z7iXAMu/tfb2A=;
 b=cQWrX6tHbkH7f+TgNxlUlg2dra8QlRoS6d5E0yq00K3PEqhJY5g8q9KQZjvH11qCA6XKbOzbeCv4onxf0K3TtaCKNPDJRlktPs/S6OxuH2Inqb0LwJk+z08YTsUHKwA6JiUN828/5ucuyb615v+RfhBfH2FCbwkhh2nC9L4+wj7o65TdfJKB0TvxOsx02QcKysrI+xCnvOnOTs/uag5xLqAvOjlnzM8btIxiunKaTD7XcP5t8w3uGNb9AzDlv9+633duU3/qjxl+UN+Bobeia9fububSgLXjyPSp3f8iKUR2E+xBoy1XtmzZ5KV0DzIBFu92cvgyS9QlyS5wrDSSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FOE2vD+/i6N2jdrT46gAdlC5YGiK3Z7iXAMu/tfb2A=;
 b=pURm+HFgQGw3colPXmFYDtYgy8ok+dBQcAOuOGGq9iQl4bA3X/1WUbylsBMMFmBliP2jxYfvuZuQ4oPc0+kHRSVJzGKCGrr22FHYUnfHaktrv+VmCFJIC2/mIYhowRLNsROOUjNnOvPiL0SGeWeSzHETSCoiZmYvcF0i2gCRPVs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5377.namprd12.prod.outlook.com (2603:10b6:208:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 12:53:54 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53%3]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 12:53:54 +0000
Subject: Re: [PATCH v3 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
To:     Scott Bruce <smbruce@gmail.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
 <20211022172845.2608-4-Sanket.Goswami@amd.com>
 <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <2dd57b69-c075-4a24-bf97-fa36fd272479@amd.com>
Date:   Tue, 26 Oct 2021 18:23:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::26) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.136.40.143] (165.204.157.251) by MA1PR0101CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend Transport; Tue, 26 Oct 2021 12:53:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9da1f717-8936-4114-1dad-08d9987faa85
X-MS-TrafficTypeDiagnostic: BL1PR12MB5377:
X-Microsoft-Antispam-PRVS: <BL1PR12MB537766D434E3726691DEF8E69A849@BL1PR12MB5377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9v3v/nE3Ch4c3lqjUJMBGi1MKBgIBUesKfRGX3F1vtMq31rPeudRIY/Wj3zHBy49c0cmB6Mh6YAfdaiQel89aNlQ5Jahhj1TE8Nx0ZWNMMsU3H74WW3Mbrv/QWea9JzH6XfAFT/eDsO2Jj8dtJ3iGoJR2Flt8KgpijT24jyWOdgXHIAaph8sw0qn2KA5RiVRjgeUf35DXl7HbSA5BuB6LNlUyOnh0wnjpi0CxT9b5VE4r+yKPpX/5cfuh3FlXc4u7lPGGJDTpDR8uWTVoS03lTGWtNMF6l7BFxFbZLRKwNg2t92Gf4w6IC7OyoPXaXOQ0PjnM+p02/kCAGtGmSc7jN/3H3m363hE12sfIMMipjArWXL5sLsOUSWeCCMTABsyofkUuqkoGFFf5klm3+0+nPk/cwZvjynQ1pCCYxy3FVPbANSHm1QF5n+ZrwpW7LAzYTZ7j/LjlrZzIDCw08EvNS982GnlBZaB0wJlAPHtardRkCVtHlh03E5W2lh9j6NnCZ4pN31u6Rgs5QlJkCwfi/mFFRue6pFvo6BlTsRFeYyN/4xKJJiEUW0FOLua1aQVZndAVUWVu+87NgY762NDAmF1yDis+lAvSAikQk1My4Dcwdw5sUKWmUbK9s89vpaMVzd/z9ZxSMRRyHEVO7p5xhjq1GgkHZIC5nZRyfFfY+CDLKtfN6Ac4ZSrJjt3RcFqR716veplVg8VHcABQB+qAxxGD0BK/O0u7IOsXvX4pu4v/Q2hEKyC2vYzpeBVFAIzyrHTOgGZaXmpxR0Pcm93eukIdM3j6ZmurlzjH0ZZPgi5QE6TIpjmkRhSfcK5fj1jN7r19x++HadCWyG23nJSeSOJ+sFPxW8+nhYlBGsVuACwW0tZYcJHzoLjdR1XUKNO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(956004)(6486002)(31696002)(66946007)(66476007)(66556008)(2906002)(26005)(186003)(4326008)(2616005)(31686004)(38100700002)(53546011)(8676002)(36756003)(8936002)(508600001)(16576012)(110136005)(316002)(6666004)(6636002)(966005)(45080400002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZYK2FvWkVPR2R2ZE54VGlNVUpjM2hUOVE1bHBmeXV3Mnh0N1NlKzNWR0h3?=
 =?utf-8?B?MkgwOVcwTWFIZXh5Y3BpNFI3SENsY3oyUmcyZlJCOFhDOGZicDBuRjI2dHZC?=
 =?utf-8?B?Vmx4N3ZMRGJ6YUFzaVJVM0V5aVRFaVdWd3V0R0FhRkM1VEhZUDd0ckV0RjZq?=
 =?utf-8?B?dUd6TjVmV3RBaStZWm4xVVpuKys5dzFGU0M0dVN4VEIxMXJNK3Z0eDdzQysv?=
 =?utf-8?B?S3hpaW81K3ZEMGlsNDRCdnZDdUxhbXpObWY0Vlg1Rml1SkhnS21acGljNEtM?=
 =?utf-8?B?dkw0NHVKQjRzWFUvNDVFUmZvUjJDZlhHQlIrTnpiT1pNRnJxYlprQmFNUVpp?=
 =?utf-8?B?ZUNyRnpaTWp6OFJBMm1qVTJZQ3NoNmIzYkF2b2RpVnNJcWFheGlzbWZIc3Nj?=
 =?utf-8?B?NHVzYmhwQmFPZ2lrVVl3UUJIb2JDdFZUNkJEaC9PK2JSc0RwaWxyQ1I1MmY4?=
 =?utf-8?B?RDlEVVN5TGFzM2U3SHlMcDVId2RGV1dxTzZ5Z1FzM2hmSno3akx4Ym5MMXNl?=
 =?utf-8?B?RThSbDNvZ1ZGaERodUxPVDA0U2hYcEF4WUtPSHNweTF2dG9KdENjK21pMzdN?=
 =?utf-8?B?dm5pNGZwVmwyYjN1QTVOTnA1enY1c1RjVHh0M1dzTW9LZFJwWHQ1NTBHaEQr?=
 =?utf-8?B?UlI1anNuRm43T2FvcTZ6eHZvamhRTU5HTExVMEhHL0lnQkhFM1h0ckJYUlhZ?=
 =?utf-8?B?L0NQQ2hRcm9KMHZJTEJkOFVVN1cwai9mVEpCRFgrUXA3aFNEVmd6NlFabHp5?=
 =?utf-8?B?SThYM0xSeFppWmZITkkxd3RLU1BNTFdPakY0MERCMmJyOWhKMHY4cW4wVUxt?=
 =?utf-8?B?UWlLSE4weW5aazUvUDJ4UWtzenBneW1JN05uUXh6R3NvUm9GdmVVRVRpKytB?=
 =?utf-8?B?Nm9SUzh2SmcxRWhCWlQ3amx0YmFyVkRhVjJEenRsOUlBOEVZTGh1ZHdDMnRq?=
 =?utf-8?B?OHBZRThNc0VuOEF0MUhRWGVNZkRyMGtQYTIvQU52bGwrZ1dqeUhkRkRsYStY?=
 =?utf-8?B?YUxSUjNEWjcvNGV1bEVkRmdrV042QU03ZkRsSUdwaE55RGlLdHVXcTVkNWE2?=
 =?utf-8?B?ZDhaRDRBSTIxM2hxZktHdUxwbkwvdGNGUmJXNTZmczA3QzNqQm5qT3YwWlNU?=
 =?utf-8?B?ZG1uYmozbmdGZDhLNjE2MElxM2FZNmR2T1RsWHk5Q0J0eXZQdWZYM1FVVk5X?=
 =?utf-8?B?YzlsbHVsVHF1TTNsaW9NNjNlYytuNTNaRHVCVHEyK2hTcnNsQlN6QjNGVGRE?=
 =?utf-8?B?OXFBVjVycFdqd1lsUXp5bHNSV3VYbHdPZXloSjhJNmFqNFNLVEJINUlQbDIy?=
 =?utf-8?B?aXZoTU1zUmZrdkRFR1B0ZXVocEZsRkZOV1pJbFpkQXVGV01uOU13QnRWSVNl?=
 =?utf-8?B?L256bGJvaVlMeTk5RXZDRGk4aWNIQ256eW9mTFdlaGVmWWxySUpxWllaNFFj?=
 =?utf-8?B?d0xuNGRKS05KVFlNeXhNUnRKaXFJSGp6WTRoK2Zqdnd2T1ZHaTc0Q21EZHFI?=
 =?utf-8?B?QTlXNnZxTm5UMUNwNS82TlEzZlhVeHgweEdUNUR3M00rLzBOZmJZT0Y2Z0or?=
 =?utf-8?B?bHJvREY5TlU5cEJZSko5R3V4SE5SQk1ZSmZxM21ubVB0RmlJUkIrYmdTVzN6?=
 =?utf-8?B?TEMvZ2lmUkRBbUFtMzlYVmdvUGtveXJNMmdJUVRIdithSU4ycXZmeXp3UTJK?=
 =?utf-8?B?ekVuQU80amxwb25XYi9TUFc3R09mZGd3bldjZXZlN0lDU3pXT2s3eGZJcVJy?=
 =?utf-8?B?NjNGU1FVRWxaYi9GUEx3LytNZVFxbG9OT0dtVnFqbW82SDdYVTdSU0RjQXFF?=
 =?utf-8?B?a21LQytvQjgvU21nd0NRbjdtMnRva1ZpMXVoZmo1b0tmQzN4bEszWnlYVFR6?=
 =?utf-8?B?dkg5dDZTb3Yxa0hTakcwdUJUR2UraitieHpaNlc4QmNYU0JrZGYxNDdwcGFR?=
 =?utf-8?B?NjlNYTQ4U2p2QUJ3NmdjV0EvbHdKRUppdkJNQjI0cjdGQ1hoNGJPdDZnUlYx?=
 =?utf-8?B?WXdVaitNK3FuM1pVZnJhRVBEcThBL1Y4WHdwUUx4VWEzb25XV28zcUs3VXZh?=
 =?utf-8?B?cmZYeGo3VlB6S2txYkxjdTZ1THdsaU54R2JMN1pMaHRmdVlPNWEvOW5IVFFO?=
 =?utf-8?B?QVppMHBtVnV0VjhFOWk0Q0NjRTNhSWhoTmxxT1lSb01XSkhnWElBckVkK3Ji?=
 =?utf-8?Q?f5KDS9wCrnpt1oFjAxKQvAw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da1f717-8936-4114-1dad-08d9987faa85
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 12:53:54.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6xZ8Evis0qIyPUaVJTQp2xJLIjWjAkw8S65DSVZm0nRUG3R26icvra3k1TtS0Bm1NU9enkl5jpLu/CbmK/j7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5377
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/2021 4:51 PM, Scott Bruce wrote:
> v3 of this patch hard crashes on my Cezanne laptop on the second
> suspend attempt. The problem appears to be with the 3rd patch in the
> series, the first two don't cause any problems.
> 
> This tree suspends fine using the original v1 and the first two
> patches from the new series:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fsmbruce%2Flinux-stable-s0ix%2F-%2Fcommits%2Fv5.14.14-s0ix-testing4&amp;data=04%7C01%7CShyam-sundar.S-k%40amd.com%7C78678c08813a422ab71c08d99872d01b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708443387757519%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3cOaDPaQrdwDlVCfje2pyt9ZTp5wqmlJTdpvY2JHmZo%3D&amp;reserved=0
> This crashes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fsmbruce%2Flinux-stable-s0ix%2F-%2Fcommits%2Fv5.14.14-s0ix-testing3-DONTUSE&amp;data=04%7C01%7CShyam-sundar.S-k%40amd.com%7C78678c08813a422ab71c08d99872d01b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708443387757519%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=vPPyw7Ir6yGqwT4PkaSwpVzzLiENQm4VxOHt68VWTV0%3D&amp;reserved=0
> 
> crash journal: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2F-%2Fsnippets%2F2194519&amp;data=04%7C01%7CShyam-sundar.S-k%40amd.com%7C78678c08813a422ab71c08d99872d01b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708443387757519%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=hf425kgujjAWxcma4%2BMy5FUl%2FAbhGwZ7ieMdkfU0T0A%3D&amp;reserved=0

Thanks for trying STB. I would like to see the FW versions running on
your machine (since I am unable to replicate the same with v3 of STB).

Can you tell me the output of:
cat /sys/kernel/debug/dri/0/amdgpu_firmware_info

Also, did you pass amd_pmc.enable_stb=1 to your boot params, STB is a
on-demand feature and that gets activated only when the driver is probed
with enable_stb param. Could not find this info in your journal.

Thanks,
Shyam

> 
> On Fri, Oct 22, 2021 at 10:31 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
>>
>> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
>> isolate failures by analyzing the last feature that a system was running
>> before hitting a failure. This nonintrusive way is always running in the
>> background and trace is stored into the SoC.
>>
>> This patch provides mechanism to access the STB buffer using the read
>> and write routines.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>> Changes in v3:
>> - Address review comments from Mark Gross.
>>
>> Changes in v2:
>> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
>> - Address review comments from Hans.
>>
>>  drivers/platform/x86/amd-pmc.c | 120 +++++++++++++++++++++++++++++++++
>>  1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 50cb65e38d11..665d57ff222d 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -35,6 +35,12 @@
>>  #define AMD_PMC_SCRATCH_REG_CZN                0x94
>>  #define AMD_PMC_SCRATCH_REG_YC         0xD14
>>
>> +/* STB Registers */
>> +#define AMD_PMC_STB_INDEX_ADDRESS      0xF8
>> +#define AMD_PMC_STB_INDEX_DATA         0xFC
>> +#define AMD_PMC_STB_PMI_0              0x03E30600
>> +#define AMD_PMC_STB_PREDEF             0xC6000001
>> +
>>  /* Base address of SMU for mapping physical address to virtual address */
>>  #define AMD_PMC_SMU_INDEX_ADDRESS      0xB8
>>  #define AMD_PMC_SMU_INDEX_DATA         0xBC
>> @@ -82,6 +88,7 @@
>>  #define SOC_SUBSYSTEM_IP_MAX   12
>>  #define DELAY_MIN_US           2000
>>  #define DELAY_MAX_US           3000
>> +#define FIFO_SIZE              4096
>>  enum amd_pmc_def {
>>         MSG_TEST = 0x01,
>>         MSG_OS_HINT_PCO,
>> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>>  #endif /* CONFIG_DEBUG_FS */
>>  };
>>
>> +static bool enable_stb;
>> +module_param(enable_stb, bool, 0644);
>> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>> +
>>  static struct amd_pmc_dev pmc;
>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>
>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>>  {
>> @@ -176,6 +189,51 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>>         return 0;
>>  }
>>
>> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>> +{
>> +       struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +       u32 *buf;
>> +       int rc;
>> +
>> +       buf = devm_kmalloc(dev->dev, FIFO_SIZE * sizeof(u32), GFP_KERNEL);
>> +       if (!buf)
>> +               return -ENOMEM;
>> +
>> +       rc = amd_pmc_read_stb(dev, buf);
>> +       if (rc)
>> +               goto out;
>> +
>> +       filp->private_data = buf;
>> +
>> +out:
>> +       return rc;
>> +}
>> +
>> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> +                                       loff_t *pos)
>> +{
>> +       if (!filp->private_data)
>> +               return -EINVAL;
>> +
>> +       return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> +                                      FIFO_SIZE * sizeof(u32));
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>> +{
>> +       kfree(filp->private_data);
>> +       filp->private_data = NULL;
>> +
>> +       return 0;
>> +}
>> +
>> +const struct file_operations amd_pmc_stb_debugfs_fops = {
>> +       .owner = THIS_MODULE,
>> +       .open = amd_pmc_stb_debugfs_open,
>> +       .read = amd_pmc_stb_debugfs_read,
>> +       .release = amd_pmc_stb_debugfs_release,
>> +};
>> +
>>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>>                                  struct seq_file *s)
>>  {
>> @@ -289,6 +347,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>                             &s0ix_stats_fops);
>>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>                             &amd_pmc_idlemask_fops);
>> +       /* Enable STB only when the module_param is set */
>> +       if (enable_stb)
>> +               debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +                                   &amd_pmc_stb_debugfs_fops);
>>  }
>>  #else
>>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>> @@ -488,6 +550,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>         if (rc)
>>                 dev_err(pdev->dev, "suspend failed\n");
>>
>> +       if (enable_stb)
>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
>> +
>>         return rc;
>>  }
>>
>> @@ -508,6 +573,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>>         /* Dump the IdleMask to see the blockers */
>>         amd_pmc_idlemask_read(pdev, dev, NULL);
>>
>> +       /* Write data incremented by 1 to distinguish in stb_read */
>> +       if (enable_stb)
>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
>> +
>>         return 0;
>>  }
>>
>> @@ -524,6 +593,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>         { }
>>  };
>>
>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>> +{
>> +       int rc;
>> +
>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>> +       if (rc) {
>> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(rc);
>> +       }
>> +
>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
>> +       if (rc) {
>> +               dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_DATA);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(rc);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>> +{
>> +       int i, err;
>> +       u32 value;
>> +
>> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>> +       if (err) {
>> +               dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(err);
>> +       }
>> +
>> +       for (i = 0; i < FIFO_SIZE; i++) {
>> +               err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
>> +               if (err) {
>> +                       dev_err(dev->dev, "error reading data from stb: 0x%X\n",
>> +                               AMD_PMC_STB_INDEX_DATA);
>> +                       pci_dev_put(dev->rdev);
>> +                       return pcibios_err_to_errno(err);
>> +               }
>> +
>> +               *buf++ = value;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static int amd_pmc_probe(struct platform_device *pdev)
>>  {
>>         struct amd_pmc_dev *dev = &pmc;
>> --
>> 2.25.1
>>
