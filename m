Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CAFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 07:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5688E20715
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 07:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbhAYHiz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 02:38:55 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58246 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbhAYHh4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 02:37:56 -0500
Received: from 1.general.ikepanhc.us.vpn ([10.172.69.54])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ike.pan@canonical.com>)
        id 1l3wQn-0002Rx-Ij; Mon, 25 Jan 2021 07:37:02 +0000
Subject: Re: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate
 error codes from device attributes' show() callback
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
 <20210113182016.166049-10-pobrn@protonmail.com>
 <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
From:   Ike Panhc <ike.pan@canonical.com>
Message-ID: <b99c4482-faea-ff72-4367-8aeca7250040@canonical.com>
Date:   Mon, 25 Jan 2021 15:36:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfJBvG6ma0UxOjb4Wudeqpf9qrE3AtQ+nwwtsGhZ6fRpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/17/21 3:49 AM, Andy Shevchenko wrote:
> On Wed, Jan 13, 2021 at 8:23 PM Barnabás Pőcze <pobrn@protonmail.com> wrote:
>>
>> Consumers can differentiate an error from a successful read much more
>> easily if the read() call fails with the appropriate errno instead of
>> returning a magic string like "-1".
> 
> Is user space ready for this (for the record, it seems an ABI breakage)?
> 

read() and getting errno looks sysfs/driver broken to me. I think
if button/method is not available, it's better to be something like
sysfs_emit(buf, "%d\n", -ENODEV)

--
Ike Panhc
