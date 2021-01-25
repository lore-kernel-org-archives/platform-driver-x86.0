Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4292BC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 06:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E097A22CA2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 06:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbhAYGOz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 01:14:55 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56827 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbhAYGOs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 01:14:48 -0500
Received: from 1.general.ikepanhc.us.vpn ([10.172.69.54])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ike.pan@canonical.com>)
        id 1l3v7k-0004Fq-9g; Mon, 25 Jan 2021 06:13:16 +0000
Subject: Re: [PATCH v2 07/24] platform/x86: ideapad-laptop: use dev_{err,warn}
 or appropriate variant to display log messages
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
 <20210113182016.166049-8-pobrn@protonmail.com>
 <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
 <xOz_6Hj0TZSyCFbqlSs7eCqC-z6d7ayRd425T6w2A_aZ02Y4KoUDTXMSXZWr08SGO3msoWaW91uKT9fJODw5QD257jNRxl7yd-gTBdAwdWo=@protonmail.com>
From:   Ike Panhc <ike.pan@canonical.com>
Message-ID: <88c95a19-61f9-dc71-39ce-d671e0ce7645@canonical.com>
Date:   Mon, 25 Jan 2021 14:13:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <xOz_6Hj0TZSyCFbqlSs7eCqC-z6d7ayRd425T6w2A_aZ02Y4KoUDTXMSXZWr08SGO3msoWaW91uKT9fJODw5QD257jNRxl7yd-gTBdAwdWo=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/17/21 4:34 AM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. január 16., szombat 20:46 keltezéssel, Andy Shevchenko írta:
> 
>> On Wed, Jan 13, 2021 at 8:22 PM Barnabás Pőcze wrote:
>>>
>>> Having the device name in the log message makes it easier to determine in
>>> the context of which device the message was printed, so utilize the
>>> appropriate variants of dev_{err,warn,...} when printing log messages.
>>
>> This doesn't explain transitions like pr_err() -> dev_warn() or
>> pr_info() -> dev_warn().
>> Care to elaborate in the commit message?
>> [...]
> 
> Thanks for the review, and thanks for pointing this out. I don't recall intendeding
> to promote/demote any of the log messages when I was making these changes. I will
> revisit my them and modify the commit and commit message accordingly.
> 
> 
> Thanks,
> Barnabás Pőcze
> 

Hi,

For unknown key/wmi event, it might come from latest model on new function.
That's why it is pr_info.

For backlight_init, this should not happen. that's why it is pr_err.

I am ok if you have any though of promoting or demoting.
--
Ike Panhc
