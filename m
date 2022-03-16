Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C528C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 17:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbiCPRJp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 13:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiCPRJp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 13:09:45 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786821EC43
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 10:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0xyqfqxzJiPEPhJW7ldFm9lKuxJxKifYmmKdo4SeciGvOXBuhzlbKEmRYwBlI6oscCVvyir3upRKwT30yp4w+5ersY2YWyKTBY7O9P/YzQZL5H4bo37SXolstHRE8wmn4x6o9pHwL8xJJwTOVYvDdyh6QZGFdRWtuovsqNaX+NnD3WZk8xvCGB2MEqQOjgJkqeIqVAY9iJbvOqqXiEn5rJqnTJPjCSfCYBohHbwYYK8oMQuzPr08WnaEr3X0ZkhrHQ2ytXMC4Cm6GOGyoxxnz5VtzGYZ5FodFQLzGx+wDpIyjxS3JMbs/kAAEh6iHD+DDYS9L253qQaTMXDZjTQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPZh51VNMScWHIms33KHP/E//R6D7lxI5DJJyA4YvIw=;
 b=ZO9KJ2kzK00vPd57veLfv0l+HiUEF9nadE1cz/41o0VO6XiAzXR+kirgwphjK7AVJ5s7AdbHtUxmyxoPZ4gBvQt4aqZasoJ6Kw6vJJSPKXGG4WtnzUdp4B52LAZtRnTzEZjj5UfGuautELRvZXuRoMmz6S2l7YC+QhjOCVJMeKOo+Q04XK1lZH/88B6r3Jwlv6uqxinUVAgox+PWhQja1p4cGSLZpQM0Z4S5TuuXwmQ0Fuy4+1OSqKiKwffRn/dIwLq/N35WHzubZCQJkRYU2+BNb0d/jv8e9/EtlbuUjAfWrIHzdaBz77Hqbazpv5w2FHWuNfQPAX172xqsIX4uBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPZh51VNMScWHIms33KHP/E//R6D7lxI5DJJyA4YvIw=;
 b=GNKHWw6P06HNptiGA8VKfdcPWayNI4dkoe6jNd7BKTyTWmI6nGzn/7P4HKd/hbePfo4lf6TgQNnH1MD5rr6AP4ricXlJhh7u3sp7Tvlf2wnmWi8J0XlZ93H7NOtlsjdzjpyJNcOYvV4Zmn6/3+l+MkeTitDDHLTz/iB6g1jU3PiV9+fxGjhfa2evJjq7S78FPqbIknsCnARCYB+3soa4znFf4C3d4wW//gYSn/HVP9b+3bhsfra9pzfvLae37NIWqkDFrfD0pECZB/3mNyl42KNFoFLO2yyx6r904O0Xf1t8TbrZLc6pbdgVr6cmZ7NoXV2WyN1lE43aMLMCq/dBDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BN8PR12MB3489.namprd12.prod.outlook.com (2603:10b6:408:44::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Wed, 16 Mar 2022 17:08:26 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4%6]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 17:08:26 +0000
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Alexandru Dinu <alex.dinu07@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
Date:   Wed, 16 Mar 2022 12:08:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN4PR0501CA0111.namprd05.prod.outlook.com
 (2603:10b6:803:42::28) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b14c1f7-d9ea-4eed-40c7-08da076f95c6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3489:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3489FB7482203D18E7656266BC119@BN8PR12MB3489.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0t2DxH5RnsYSJwlHuLrZFK2/ZeFpotLq82x3K/68ajFTMQ9F5rTc1+5gw0i6eCQekMYkEmuDSZ5/mnt1Y22ZjaP9/dlh43R5hVxBjv2bOeGDfrYJ+2kn6o8ME6DRbD/9l2QXHswxFZmvTxEyrdljOuTcJ1nymZy83bgBYP/e52Lo/m2LX/Z7SHaPynbTKeMWWu9gTqbOWqWgXG6gXma9AklGsDkOpdBCWI6ggrB+RhGVVvzdKECuo6vdKiQsmqi/+2orstP7YgOEwpKIE84RdFrdofXXAlxajQZI1sZ0s2tK98uaPGAFQx06q5nUuVvSEMNYFTtGUO+lEGa9PDhjwmccjN9SgZa0hG0uwjRZ2xOGLYl+voq1d8usR/HYJ2wIgfR8cfAIOP+bXE1k1Y8h6aAzvfxY8/5gny0mqVTNbiKtScJs3/6tNnvShPrvpc9bOVmKON04b1d6LSHV+GTJl+mK4tmGc4eq8qnKOawIn0RidraT5fidJ/n66gUw3uP2KfaV05rvA8vO2UilnvGkBNddCwX8ujmmpZZ1+HxNWk6+nfin32GO/d2VRm4Ci4HuPqpI03QzGO1u8/1JjuRBLxq9481/j2znmwMHCk4MwEsnNZTOoqUsps3gc0KWga4qVpVzGMHKXkkYsUJJyAFArMWjBB8r2a0S43scnmh8zQVy2n8EjOkb/8L35p4VeTiFdgtNx/iwE31n0aG5fg880WjJY8VJE+y2tn7vPRkAMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(316002)(31696002)(4326008)(508600001)(54906003)(8936002)(110136005)(31686004)(2616005)(6512007)(5660300002)(36756003)(6666004)(66556008)(66476007)(38100700002)(66574015)(8676002)(186003)(6506007)(26005)(66946007)(6486002)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXY5SWdqeHF2cjJ1M0hXS2VEN21hdTcvY0dKTzd4a3dYam9GeTBXQmlxUmZv?=
 =?utf-8?B?ZDR3RUtFRzJXc3hnL2RzclVCYU94dS9WaEZDWWhCckRsSCs4N3dwYmx1QUpa?=
 =?utf-8?B?MkhDaVRzQWdHSVlKTGFNMkU0bm40RThPV040Y29jK1lPR1V5UWNCci9xYnh3?=
 =?utf-8?B?Mll3YzJVTlpPeWhhVDc4RnJtWTg2T0Y0cFRjd0RWRCtBbkE2S0Ywb0tmbDg5?=
 =?utf-8?B?dUpIa1htTTAzQVdOQXdGRTRNcW1zOS9jZyszYllCNjkwWFUxRmUva2FrcUty?=
 =?utf-8?B?VlQvZUNGS0JVWXBIb1VURkFSeS9JcW1lbzFwL1ljbEYvaGJOaGJqNzNwVnl5?=
 =?utf-8?B?YUhady9Yb2k3SHJwVTY1RUtJZHFYSWlKazVPbTQwQkp4UmxmTHptUjVmeEJo?=
 =?utf-8?B?YUEyZWNRZUI4Y2twN3hGVWxDY1daUVBuKzRXZ1owb1JBRUtIT0RtTHlSYUNo?=
 =?utf-8?B?cXRzenlBWHcvaUZwbTJSUW1SMFVrRDMzeWROaE1pNzZyMDVqSkJpamNlZ2VB?=
 =?utf-8?B?ek1uQ0RQejVRSkhJbGRHK1h5RTVSNUFnUU12Q251b2xKTmIrUHNUSGRsQjhO?=
 =?utf-8?B?Rit3bUt1UFVjYjROWUpyeFF6RGcrZnJxZzFxdFplZytsSzlOelhIQlZhVjEx?=
 =?utf-8?B?bFQvL1pCY096SkUyQVB3K2UrZVhHWHNYZVFpLzdIRm5lQWRaVjg3TXFKN2Nh?=
 =?utf-8?B?ald2OGpxUTQwajZDZ0ZMQWxzNlFoUjNqRWsxd1UxR0FWTVNXcktseUgvajl4?=
 =?utf-8?B?enhsb1p0UnJHQTF2RFFzZVhZNVJrTWhsMElEZXd6ekszS1MzN05ITHdIMXBE?=
 =?utf-8?B?U05ueS8wQnNjNWxmS1F0WjBFR1dzbTE5dU9OQWxsWFNjM0phZmlrWlppVGpI?=
 =?utf-8?B?dkw5YlBGYVdpTTJWa1RWS3VvVVZZWEdlT21MT3lLTFNaVkR0emRrWHhCaTFD?=
 =?utf-8?B?K2pUVGN5SkZxSndyV3BuaTg1bHAyM293NGdUcFFpU3BwU1ZTRDNDMUhaNmV4?=
 =?utf-8?B?ZkRnTWVEK0t0VUllVjkvNC9xMXlVR3c1bGxQbVpNbE1sVFNhYStnYWVFdzBS?=
 =?utf-8?B?WnVUTnRxdkRERE4zQVByQ0QyVC94dTUyYTdvclFWWGF1azgvKzVFR0xFRmNG?=
 =?utf-8?B?RVpROG11Y1lDNytxQ0toVUFkY1pnSXpXNjBkcVNVL0RpRk4va0g5WEJiVk1Z?=
 =?utf-8?B?SmQ2WTJiZXRlN1JXRHhyd0dzZU1EcGR5NzgxeFk0VEVrZHhnVmp2ZVg3UU1P?=
 =?utf-8?B?YlpYbjN2ZVlkTWgxNEh4L1ZnOEdaU2dlcWVjak14Y3N2bWw5VGZsUEZVd0x3?=
 =?utf-8?B?ekZhYVY5dWpkUGo1Vi9lQVRBc0p2NFRtV3oxNVBzRmIzQ1FBdkhPejdzKy9W?=
 =?utf-8?B?MXMxQkRHcEFmaTdiSitLU1V2cDVpNkVkTHRXYVlaenpuZ2cyUnNCZTIzRUZL?=
 =?utf-8?B?L2lUeU5ZNmhMN2F4Y213VWQrVnRVNEpKNWVEYUJ3K1ZGeUw3SVRNaWtlVWFp?=
 =?utf-8?B?TjdrV2pkMXdXT0ZwblRCc3FIMHdIeDBLZEhaZkVlSCtmTW9zR25yeDl0a1pR?=
 =?utf-8?B?NVBPOXlSTUdlM0RSTkRMVVVFMDhITGtFRXYrb2ZNV2pPczNhZjRkT3h4Ym9a?=
 =?utf-8?B?TWNvdHRGS2ZoQmZFNU01bS95MEV0ZE5UYS9Rck51NzBrT3Z2Y1RJYjlqREt6?=
 =?utf-8?B?V3laQlRIZTFEdjU4WFdQM1o1bVJZbERRMVJyZ0tKdTNyS05lbTlZaWZCeFNp?=
 =?utf-8?B?ZHpRcHJaNlZzVVl5M2kxTk1Wby82MmtzYnFMMEJoeEh0Y3lJZjdNUWt1TmhV?=
 =?utf-8?B?SEk1Z3NUdnhjUTB0L2ViMWh0YjBBcGlVSjlaS0R3dTdiQnlpRHFHOVpWVSsr?=
 =?utf-8?B?WUZCb2FxQktxeitKa1ZHbVIzV1ZlSlM4ODh1bGRZRnZQWUg5Q0xQazJnL2tW?=
 =?utf-8?Q?goyqSGE75hWm7OzBRf97w1eOqIaHiTGO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b14c1f7-d9ea-4eed-40c7-08da076f95c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 17:08:26.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4dHevykwvujvEnxF7WtaBO4de/CkPQr57V0+Y2T2yYfqNQgzIcz2UbNVJ0xKVGY3mk+0Tvvh8d8cwU/7zeZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3489
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 3/16/22 10:29 AM, Limonciello, Mario wrote:
> [Public]
>
> + Alex D
>
> Alex, just FYI this was something that came to an AMD bug tracker and wanted you to be aware there are W/A going into nvidia-wmi-ec-backlight for some firmware problems with the mux.
> IIRC that was the original suspicion too on the bug reports.


Is this on a public or private bug tracker? If this was observed on 
systems other than the one already added to these quirks, could you 
share the details of the systems so they can be added as well? (Or I 
suppose you may want to test to see if these WARs are effective on the 
affected systems as well; we can always expand the quirks table later.)


> Comments inline as well.
>
>> -----Original Message-----
>> From: Daniel Dadap <ddadap@nvidia.com>
>> Sent: Wednesday, March 16, 2022 10:11
>> To: Barnabás Pőcze <pobrn@protonmail.com>
>> Cc: platform-driver-x86@vger.kernel.org; Alexandru Dinu
>> <alex.dinu07@gmail.com>; Hans de Goede <hdegoede@redhat.com>;
>> markgross@kernel.org
>> Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for
>> confused firmware
>>

[ ... ]


>>
>> On 3/15/22 9:50 PM, Barnabás Pőcze wrote:
>>>   [ ... ]
>>> Lastly, is it expected that these bugs will be properly fixed?
>>
>> Possibly, but I wouldn't hold out hope for it for an issue at this scale
>> on an already shipping system.
> This question I'm assuming was aimed at narrowing the quirk to only
> match certain FW versions or so.  If there is no certainty of when/if it
> will be fixed I agree with current direction.
> However I think it's still worth at least noting near the quirk in a comment
> what firmware version it was identified.  If later there is confirmation that
> a particular firmware version had fixed it the quirk can be adjusted to be
> dropped.
>

Thanks, Mario. Sure, I'll make sure the firmware version this was first 
observed in is noted.



