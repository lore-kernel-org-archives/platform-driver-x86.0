Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E695DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 18:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237176AbiCQSJy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 14:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiCQSJx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 14:09:53 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B44F7C7AC
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647540515; i=@lenovo.com;
        bh=uDRI7rXOIF2Qo8IFqVYVUfeCY+UVrHMs/Gz/kifDp14=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=A4b4XUgKNK0xG7YqdTRhNgNDhYd9X/z+ymBmLhfChyEUBz6roWOZf3EUwgTEkl9hA
         csQhqCTOkAgDnkffTcL6IlT3+uTEVNpGz6F1GkBbdnNyAa0ALCrzaD7BtEoZBNdur5
         kSRbOZqwf08dfZY5Kz180Fv6KNfl9p+WD/Lx+pkGK+iXYgllRE3PuFXHmp+Fu+GVEC
         9NDJgBVlSFW6TORZ8ycOaRYU/i1I6OW5D9b99u5n9tHnTFuj6xM7dnz+eaa2SPwb2w
         HDXZNw676nxnpCFQOeYIb+m9TyFoPtzoYBT9wjuYJTZ/JS2FwaZhz3SJ39OIQeRPjL
         2LqjLXA9xbE5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRWlGSWpSXmKPExsWSoS+VratcaZx
  ksO8wv8Wb49OZLA5MncZssXrPC2YHZo9NqzrZPN7vu8rm8XmTXABzFGtmXlJ+RQJrxqwDU5kL
  2qQr7p+dxtrAOE2si5GLg1FgKbPE9I7zrBDOIlaJ7nVfGSGcTiaJRd0z2UAcIYF5TBL3bxwEK
  uMEcg4zSfzdUwxiSwgcZ5ToXuUOUdTJKLF76w+ojn4miVNn/rJAOE8YJX79esIM4dxjlLg99Q
  QzSD+vgK3EpX9HwOayCKhKvNxyjwkiLihxcuYTFhBbVCBc4v6zz2wgtrBAqcS6/i9gNrOAuMS
  tJ/PB6kUE1CWmdvQAxTmA4o4SDQf5IHa9ZZT4uOQHO0gNm4C2xJYtv8B6OQXsJD71bWGEmKMp
  0br9NzuELS+x/e0cZog/lSV+9Z9nhvhTTmLF3utQdoJE85SjjBC2pMS1mxfYIWxZiaNn57BA2
  L4SC+c8h6rRldj96QorhJ0jsXTbbjaYmad6zzFNYNSdheTlWUhem4XkvFlIzlvAyLKK0SqpKD
  M9oyQ3MTNH19DAQNfQ0ETX0kLXwkwvsUo3Ua+0WLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7V
  kEyMwHaUUJYXtYFze/1PvEKMkB5OSKO9RdeMkIb6k/JTKjMTijPii0pzU4kOMMhwcShK884qB
  coJFqempFWmZOcDUCJOW4OBREuG1KgBK8xYXJOYWZ6ZDpE4x6nJc2bZ3L7MQS15+XqqUOC9nI
  VCRAEhRRmke3AhYmr7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3QznQFJ7MvBK4Ta+Ajm
  ACOqJRwAjkiJJEhJRUA9OCzDSxbcozLuZIaUY1HS5c/b5y/m3/R2tSux3ypya6nfnmyHnBddb
  TZVeftChkqcqtyanwX9NWwxjPlN8z5Y9xnsaE+JMxL79OM7mz04PT8IxPN7vQh2LjyLIiveqr
  +daZLp9+35918dDhyNgLzy5tXbR5e6ppWP7/TxXin9u/Xb/CX3yjS1Ski9M/9enNu1XMF36d8
  z1w5uvmg7cWd2056TShfEqD9P6TkyN0dL7ErPv1855x1gVfHjm5j2dOb527a0LosQ+c7KLcsW
  n5+0sCv6Wddr0pn+OdrrNMl33qgsjLDheuOd27YcQce5lXR/7eEzcP3tUuN7ed9Jsgvk5770+
  xKv6kC79D29pCvwoosRRnJBpqMRcVJwIAtdrIyk4EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-655.messagelabs.com!1647540513!22423!1
X-Originating-IP: [104.47.26.107]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11802 invoked from network); 17 Mar 2022 18:08:35 -0000
Received: from mail-sgaapc01lp2107.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.107)
  by server-17.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2022 18:08:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1KikcGL8A7P1tUliV9mLtw7k4N8Uu7e9Bl/Mj/+6Ckniww7TWzK0VNVm1HnuyBhyrIeNpzRizGABvXS6/5+loHa4zUJVI19bwAljQH21K3Z4y6ySDyxopm/BkCIC0QUvdzPFMnh29hmnxClHTpIXxEwkqG/uovK5HShMV2VVq9dfLLEyKe9faP2DGq7B3pl47X4CTcvvf+1jRS3G+4CYZxPknELDiHHdGJEBYqUruUyS7DPYWaGDydLLn0fpY4p/t0adnHYZ9gUwf6GjtL1wcy/HuLDgRXb58j4CFVyqxoFWdccq9pFv+PuV4g8kjoPhyrkm+qz9pgRjy0V5/6+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDRI7rXOIF2Qo8IFqVYVUfeCY+UVrHMs/Gz/kifDp14=;
 b=Mv+m8tNsn5MC3L9Ub/MynUiMaIzb6hCLL12e5LQjz9xuOJILrO5ZkCnuBldPWZTLsF9s06CWcb5rtzVsAgeZUAtuTG6vEOS/j6M7tLa6MjOmkXVO2PZTG7Fb/mN3I4vKPaTH6bsMGed1cQiZykemiN6zm/zv7Mk6L4g1WKuEDBmdFLzgKrgN42SOvECRUaQPoMDgm7r8zIfSQQH2iFmUwNQmg0d4WzBpzC4Cbp7C6ggEBBslYq834LwUoi37RWtXJcDFIegibJC6DmipDEnCWXldjxBpHQH6Ts8XpfAtQJFyR44W4EGCwBf1EhEWavveClP30oseAm8SpZ6DbjmPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2P216CA0037.KORP216.PROD.OUTLOOK.COM (2603:1096:100:1a::23)
 by TYAPR03MB3085.apcprd03.prod.outlook.com (2603:1096:404:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.13; Thu, 17 Mar
 2022 18:08:32 +0000
Received: from PSAAPC01FT035.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:1a:cafe::ad) by SL2P216CA0037.outlook.office365.com
 (2603:1096:100:1a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 18:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT035.mail.protection.outlook.com (10.13.38.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 18:08:31 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 14:08:30 -0400
Received: from [10.38.63.5] (10.38.63.5) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 14:08:29 -0400
Message-ID: <d938f450-2760-e7b3-b0e3-6006550269b5@lenovo.com>
Date:   Thu, 17 Mar 2022 14:08:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH v2 1/2] Documentation:
 syfs-class-firmware-attributes: Lenovo Certificate support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
 <c3ef4c4e-9862-88f6-ef7f-2fd741ce9ea9@redhat.com>
 <90f1a4ce-a3ba-ed14-f27a-348af368afad@lenovo.com>
 <f9151a77-f7ad-78cc-41e5-e5d13945c3a2@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <f9151a77-f7ad-78cc-41e5-e5d13945c3a2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.63.5]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 450d6302-94d7-47ef-44dd-08da0841259f
X-MS-TrafficTypeDiagnostic: TYAPR03MB3085:EE_
X-Microsoft-Antispam-PRVS: <TYAPR03MB3085461D5C3709969527DE4CC5129@TYAPR03MB3085.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGzBHFiXS+5Q9OjpsDapjuoTUeoswORa96oxdRFSmkjpgd44jIvhjogGIxP9oFVJ0T7k+sKiYI/rhJPZ5vAtRqkB9FMsk2hNY467g8/sIJvvNOI5hwualB0dVjO+r2AirT2TzrSgb+W9GJr7CYL5Zu+IHr51UZxC3blaPbEsYUcbUh67h1gbUSumVcDCXr1NGTLpygWdHuRQL1jYV/9TfY/xQckJlXOxmZ4pTz3lNj9nU3V5vaNXYAFkl2cFxSVi9I2rUOtZN4V9+okdHfYfD6y7sOHvusRwYw1ZhbbdNSz0boAqieWKSlvz3pgMeGRSTGPxRzqMOKqnt+OQiDF0U6RPf4zZjTe+ayuTuBaLhSJlP3+K+JFv/Fxk5Iky3Cv4pBa5xYldTSEdxrQ703LK92wQVP806gsGJDqlSnv4xHGzZR4RNo/G07vscdCs4dLoce0Q7m2dAdC3QRmQtve2V1P9GLM5GntxRvM2ck+QQC3j5ZW632DkU2vl9XZ8Db4GGkdKWcG0Gg58kmQ6I3c0PyE28XsNWXEfPYCvGaXS1cHtFO9ifdlNxHcNXCal9Zm3Pw5iOySUq95ust6rHZWzzmdSNT4NwLSlDpD49CxE1xgQUznGCX5XIFfvgNDAy1WNAtEHrvib5beyat3Dqx29l0xR5vpsYRTiNU8lW4IzcjPkciRw1DWuSAofZWo/4aGFTCTS9JHoczY12O6d3PPeeOH11iorRW733txwvOptMSJbpt15p+1+RNst9A7viNGeqDWX7k1A+tod2833zw3Grw==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(53546011)(31696002)(54906003)(36906005)(316002)(16576012)(6916009)(47076005)(70206006)(70586007)(82310400004)(8676002)(508600001)(2616005)(16526019)(4326008)(426003)(5660300002)(2906002)(8936002)(83380400001)(26005)(31686004)(81166007)(36860700001)(40460700003)(356005)(336012)(186003)(82960400001)(36756003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 18:08:31.9063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450d6302-94d7-47ef-44dd-08da0841259f
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT035.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR03MB3085
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org




On 2022-03-17 13:23, Hans de Goede wrote:
> Hi,
> 
> On 3/17/22 18:08, Mark Pearson wrote:
>>
>> Hi Hans,
>>
>> Thanks for the review
>>
>> On 2022-03-17 06:58, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/15/22 20:56, Mark Pearson wrote:
>>>> Certificate based authentication is available as an alternative to
>>>> password based authentication.
>>>>
>>>> The WMI commands are cryptographically signed using a separate
>>>> signing server and will be verified by the BIOS before being
>>>> accepted.
>>>>
>>>> This commit details the fields that are needed to support that
>>>> implementation. At present the changes are intended for Lenovo
>>>> platforms, but have been designed to keep them as flexible as possible
>>>> for future implementations from other vendors.
>>>>
>>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>>
>>> This looks good, but looking at this a second time I still
>>> have one open question:
>>>
>>> What is the difference between removing a certificate and
>>> switching back to password auth?
>> The main difference is clear goes to no-authentication, and switching
>> obviously switches to password
>>
>>>
>>> Looking at the WMI calls there are 4 different calls:
>>>
>>> LENOVO_SET_BIOS_CERT_GUID
>>> LENOVO_UPDATE_BIOS_CERT_GUID
>>> LENOVO_CLEAR_BIOS_CERT_GUI
>>> LENOVO_CERT_TO_PASSWORD_GUID
>>>
>>> Going by these names I guess there can be only 1 certificate
>>> otherwise I would expect:
>>>
>>> 1. add/remove naming
>>> 2. update to take an id of which certificate to replace
>>>
>> Correct - there is only one certificate
>>
>>> So I guess that LENOVO_CLEAR_BIOS_CERT_GUI disables all
>>> authentication. IOW, installing a cert replaces/clears
>>> the supervisor password and the difference between
>>> clearing the certificate and cert-to-password is that
>>> after clearing it we end up with no supervisor password
>>> set, where as cert-to-password sets the passed in password
>>> as the new supervisor password?
>> Correct
>>
>>>
>>> Or does clearing the certificate fall back to the old
>>> supervisor password if one was set?  (that might lead to
>>> some interesting issues if users clear the certificate
>>> many years after the password was last used ...)
>> clearing reverts to no password
>>
>>>
>>> Given where we are in the cycle I was planning on adding
>>> this to my review-hans branch so that it could maybe still
>>> get into 5.18, but given the above questions as well
>>> the remark about the test X1 BIOS you are using I've
>>> a feeling it would be better to give this some more time
>>> to bake and target 5.19 instead. Do you agree ?
>>
>> I'd love to have it in 5.18 as I expect his feature to be available in
>> our 2022 platforms and they're all going to start landing in the next
>> couple of months. If that's unrealistic I can live with it so I'll defer
>> to your preference
> 
> The 5.18 merge window starts coming Monday, if you can get me
> a v3 with the last few minor items addressed sometime tomorrow,
> then I can throw it into my for-next branch and if it does not
> cause any issues there then it can make 5.18.
> 
> But if anything non trivial pops up while this is baking in -next
> I'll probably drop it from -next and then this becomes 5.19 material.
> 
> Regards,
> 
> Hans

OK - sounds good :)
As a note - the feature is in the release BIOS, I just checked on my X1
Yoga 7 updated to the latest. I'll test the next round of patches on
that system for extra sanity.

Mark

