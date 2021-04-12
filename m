Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFCFC433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 17:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04EA61288
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Apr 2021 17:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240644AbhDLRLC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Apr 2021 13:11:02 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:17906 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239716AbhDLRLB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Apr 2021 13:11:01 -0400
Received: from [100.112.3.43] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id E0/EC-00973-21F74706; Mon, 12 Apr 2021 17:10:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleJIrShJLcpLzFFi42JJl3vFritUX5J
  gcPmYuMWb49OZLFrv/WKz2NZ8mNHi8LzNrBar97xgtrgy+QajxendJQ7sHjtn3WX3WLxpP5vH
  plWdbB6bX79g9ni/7yqbx+dNcgFsUayZeUn5FQmsGZObtzEV3BWt2Nyh3MD4WrCLkYtDSOA/o
  8T6aT3MXYycQM5zRok795S7GDk4hAXCJT5e8AWpERFYwSRxt20+C0gNs4CExOHeXewQzUuYJP
  Z/nAyWYBPQltiy5RcbiM0rYCtxbF4DI4jNIqAqcar3BCuILQo0tPfKbVaIGkGJkzOfgPVyCsR
  KnFjzlxVkMbOApsT6XfoQu8Qlbj2ZzwRhy0s0b50NdqcEkP398SIWCDtBouffI7YJjIKzkEyd
  hTBpFpJJs5BMWsDIsorRNKkoMz2jJDcxM0fX0MBA19DQSNdY19REL7FKN0mvtFg3NbG4RNdQL
  7G8WK+4Mjc5J0UvL7VkEyMwnlIKmM12MP58/UHvEKMkB5OSKG+kT0mCEF9SfkplRmJxRnxRaU
  5q8SFGGQ4OJQnen9VAOcGi1PTUirTMHGBsw6QlOHiURHg/1gCleYsLEnOLM9MhUqcYFaXEeX/
  VAiUEQBIZpXlwbbB0colRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8AyBSezLwSuOmvgBYz
  AS2+uLUQZHFJIkJKqoHJ0vV91VJ97jevZP3OP0oUc3Kw1D11QV45vGb9IqO2isMb6hfJHFufv
  OPm1P2Xb988fVGOUyLT3KuZ4/PWNNU/1uFWK1Y4m8865vrg1YfVWTuOix15PH3piw+a2hwlx2
  5ZmdY0tk67W9PXvSP8oNrV0zsX6USFBfTcPZ3qmWa3abXLocfn50/M/O7bXfn2asf3l2d17zR
  Yyx/f8+brUoWFHJ89I7bd/eubdvX8ybNV2RIp+ul+Ss+4HE7zBC9cuveWTrm8xpyNC2sVLIvn
  PX7Y1BZ/uPBt40q/+ZtiDapNrDMvyOmkqUkWZ0cGdkQev3xk2fNdWm/+KL62VGhjLmh8enDxr
  tWSi1YsYt+mlce/S4mlOCPRUIu5qDgRAKzcPmKiAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-386.messagelabs.com!1618247440!475893!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3247 invoked from network); 12 Apr 2021 17:10:42 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-9.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Apr 2021 17:10:42 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id AE99A3AAA2DC2C57B4A0;
        Tue, 13 Apr 2021 01:10:38 +0800 (CST)
Received: from localhost.localdomain (10.38.52.10) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Mon, 12 Apr
 2021 13:10:36 -0400
Subject: Re: [External] Re: [PATCH 1/3] thinkpad_acpi: add support for
 force_discharge
To:     =?UTF-8?Q?Ognjen_Gali=c4=87?= <ognjen.galic@outlook.com>,
        Thomas Koch <linrunner@gmx.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        "Nitin Joshi1" <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
CC:     <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <6ead1585-9743-e56b-6552-564fabdd9930@gmx.net>
 <b99aa7c2-0086-2f0b-f7b7-8ac7033b68d4@lenovo.com>
 <VI1PR09MB2302B7C3AD8014CC98D36AA595759@VI1PR09MB2302.eurprd09.prod.outlook.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <a194b7e1-d812-5c63-373c-db11080d5e1d@lenovo.com>
Date:   Mon, 12 Apr 2021 13:10:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <VI1PR09MB2302B7C3AD8014CC98D36AA595759@VI1PR09MB2302.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.52.10]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 07/04/2021 15:01, Ognjen Galić wrote:
> 
> On 07/04/2021 19:48, Mark Pearson wrote:
>> Hi Thomas, Hans and Nicolo
>>
>> On 07/04/2021 08:19, Thomas Koch wrote:
>>> Hi Hans,
>>>
>>>> 1. These features are useful, but not super useful and as such I wonder
>>>> how often they are used and this how well tested the firmware is wrt
>>>> these.
>>>> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
>>>> comment on if it is ok from a firmware pov to try and use the following
>>>> battery related ACPI methods on all thinkpads? :
>>>> #define GET_DISCHARGE    "BDSG"
>>>> #define SET_DISCHARGE    "BDSS"
>>>> #define GET_INHIBIT    "PSSG"
>>>> #define SET_INHIBIT    "BICS"
>>> These ACPI methods are present in (with very few exceptions) all
>>> ThinkPads released since 2012. I am curious to hear what Mark and Nitin
>>> have to say, never read anything official about it.
>> I'm afraid I've not come across these myself before, but will go and ask
>> the firmware team.
>> <For my internal reference LO-1115>
> 
> I received the documents a few years back directly from a Chinese
> contact with all the methods
> and parameters described. I can mail the document to you privately if
> that's needed.
> 
>> It would be good to confirm the implementation details if I can. I found
>> recently that some of the temperature sensors that are read in by
>> thinkpad_acpi from the EC RAM are not temp sensors (patch coming
>> soon....hopefully later today). Hopefully I can check the internal spec
>> and give a thumbs up on the implementation - even if we're not allowed
>> to share the actual paperwork (maybe one day....)
>>
>>> Since 2012 there is also userspace tool tpacpi-bat [1] employing them
>>> along with those for the start/stop threshold.
>>>
>>> My own tool TLP makes use of tpacpi-bat for force_discharge also since
>>> 2012. From my experience in TLP support i can say there's a significant
>>> user base and those who use thresholds also want to use force_discharge
>>> for recalibration from time to time.
>> This probably isn't the right place for the discussion, but I've been
>> meaning to dig into battery management but never really get the time. I
>> know in the windows world that ThinkVantage has extra hooks for setting
>> thresholds and I wanted to see what we can do on the Linux side. If
>> there is anything that would be particularly helpful that is missing
>> please let me know.
>>
>> Thanks
>> Mark
>>
>>>
>>> The patches at hand work flawlessly on my small ThinkPad collection.
>>> [1] https://github.com/teleshoes/tpacpi-bat
>>>
Just as a follow-up - I got some more details on the four ACPI methods
from the firmware team and it all matches up with the code (and indeed
the implementation in tpcacpi-bat).

Mark
