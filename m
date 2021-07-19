Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9252C07E9B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jul 2021 12:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE72460FF3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Jul 2021 12:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbhGSMGG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jul 2021 08:06:06 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:41372 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236571AbhGSMGF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jul 2021 08:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1626698805; i=@lenovo.com;
        bh=wXIbEL4OU+wH0Yqf0ujILx1sSuW/zoSUlpUdphLDPOY=;
        h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=AjsoYgtXfMZl4VQzeqkgQQEkAD1W2AuDs8dKF/7kDB5ahmmyuy2PHrTgjAzcychFl
         JL/OulE17c9phmURInzdxW257rFKCnb0rjeSBThX0kvq06Gh+h5pusVP6KteOWcxGq
         b2a3u+KBzTdg7S1TDmXZ6JPp7P5iCvHS42DukmZO8ArpsU4VaIWWVfaoYDP8N2f6vZ
         irBrU+YOmnBV62gB3okVruutmeCjkYnfBjwpMI6p9rXnhVSlAv4pCds7rQ5/Q4IO8U
         fdD42+zJGYhkH4D3hFCjVlN158yLEWRf9qJT3GjtuQnhPqpFIQtFvbRrdfctcDWzxt
         ceOUYxIL8PjKA==
Received: from [100.112.3.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 98/FE-07014-53475F06; Mon, 19 Jul 2021 12:46:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsWS8eIhr65Jydc
  Eg+vLtS3eHJ/OZPG5YzKLxeo9L5gdmD3mnQz0eL/vKpvH501yAcxRrJl5SfkVCawZ7eevsBds
  E65o3nCIuYHxAX8XIxeHkMB/Ron/u+6wQTjPGSW2XNrN3MXIySEs4Cnxuf0jE4gtIqAuMbWjh
  w3EZhZwlpjUMgGqoZNRYvGBVSwgCTYBbYktW34BJTg4eAVsJW7MUAEJswioSuzdtBOsV1QgQu
  Lhzi2MIDavgKDEyZlPwFo5BewkDvVcZ4SYbyExc/55KFtc4taT+UwQtrzE9rdzwG6TALL/n/3
  OCGEnSPT8e8Q2gVFwFpKxs5CMmoVk1CwkoxYwsqxiNE0qykzPKMlNzMzRNTQw0DU0NNIFkXqJ
  VbpJeqXFuqmJxSW6QG55sV5xZW5yTopeXmrJJkZgPKQUMHDvYNz65oPeIUZJDiYlUd4Gia8JQ
  nxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR43QqBcoJFqempFWmZOcDYhElLcPAoifD25AOleYsLEn
  OLM9MhUqcYFaXEeUWKgRICIImM0jy4Nlg6uMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDc
  bZApPZl4J3PRXQIuZgBazLvwIsrgkESEl1cA07+XrOVPz6lntzoQmXrP6ErhlOWN6SWWjxLJl
  9sdbdprwn+OYssJ15m/xiWqSb+vu3jwZoPKFWcfbcO/JYxWhOr9tLM7Wnnn9KyTN9v9z+cA52
  +qMNk25vPD2XL6Y7sWRqk3BTG9D1AxsT3/8LOX2f+fpjdlJfQYKC195LWGddvKTkcvzfVZTPf
  mU4sTKlT6Hc37K+CTj8oNv1e7nD2486P0dvrmlcnuw6LtvIZ76hz8JtC3rLi///kXw1E9eo+L
  XC2Y3xnxKf/jp2mE3KdONW6zu79rjZTMrbMKxk9zWu/PvfuecvyJWi/Put03xTwTPLfxeKn/w
  y/T+ImXXtpz2zo12DVpWZjWBNfvK8rZ/UGIpzkg01GIuKk4EADAEsByCAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-386.messagelabs.com!1626698804!264507!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12487 invoked from network); 19 Jul 2021 12:46:44 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-16.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Jul 2021 12:46:44 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 7F481FDF5620DECBF548;
        Mon, 19 Jul 2021 08:46:44 -0400 (EDT)
Received: from localhost.localdomain (10.38.63.73) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 19 Jul
 2021 08:46:43 -0400
Subject: Re: [External]Re: [PATCH] platform/x86: think-lmi: add debug_cmd
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210715230850.389961-1-markpearson@lenovo.com>
 <4e59c26c-d58b-dfd5-ed21-f9cd83fc43b6@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <fc392326-9d19-dc78-bf06-da85b3b53fb2@lenovo.com>
Date:   Mon, 19 Jul 2021 08:46:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4e59c26c-d58b-dfd5-ed21-f9cd83fc43b6@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.63.73]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the review Hans

On 2021-07-17 9:59 a.m., Hans de Goede wrote:
> Hi Mark,
> 
> On 7/16/21 1:08 AM, Mark Pearson wrote:
>> Many Lenovo BIOS's support the ability to send a debug command which
>> is useful for debugging and testing unreleased or early features.
>> Adding support for this feature.
>>
>> Also moved the pending_reboot node under attributes dir where it should
>> correctly live. Got that wrong in my last commit and realised as I was
>> updating the documentation for debug_cmd
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> Thank you for the patch, I'm not entirely sure if we want this in its
> current form though, isn't this new debug_cmd file not something which
> would be better under debugfs ?  Or maybe have it only show up if
> a module parameter is passed to enable it ?
> 
> Note that both have implications wrt secureboot. debugfs is only
> writeable when secureboot is disabled; and ATM module options are
> not protected by secureboot, but at least in Fedora we would actually
> like to change that in the future.
> 
> Anyways, lets discuss this a bit further and then merge something
> for this later.
> 
I wasn't sure about debugfs but did consider it. It seemed to be adding 
a whole extra layer. I'm happy to do that if that's what is recommended 
but not having it available with secureboot could be annoying for users.

This feature is mostly used internally (which is fine) but we have had 
occasions where we've used it with customers; and with the WMI interface 
it's usually the enterprise customers who do have secure boot enabled. 
I'd like to avoid that limitation if possible.

> The pending_reboot move is good to have. You really should have
> submitted this as a separate patch. Hint as soon as you write
> "Also ...", or e.g. "This commit does the following 3 things:
> 1... 2... 3..." or some such in the commit message that is a hint
> that you should split the patch.
> 
> I've split out the pending_reboot changes (and also updated the
> remove path which you left unchanged) now. While looking into
> the remove path, I also found a couple of other probe-failure
> related issues so I'll be sending out a patch-set with a > few small fixes (including the pending_reboot move) soon.

Yeah - apologies. It was such a tiny change that I was being lazy.
Thanks you for splitting them out but if you're busy let me know and 
I'll happily clean that myself. I had missed the remove part completely.

Thanks
Mark
