Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA1EC433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0507A20731
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 15:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbhADPsN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 10:48:13 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.114]:23019 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726419AbhADPsN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 10:48:13 -0500
Received: from [100.112.132.72] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id AE/69-33082-DA733FF5; Mon, 04 Jan 2021 15:43:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsWSLveKXXet+ed
  4g+9bpCxeTjjMaPHm+HQmi88dk1ksVu95wezA4rFz1l12j3knAz3e77vK5vF5k1wASxRrZl5S
  fkUCa8bfFZdYChZzV2yad4G1gbGbs4uRi0NI4D+jxJJ3rSwQzjNGiTcHF7J1MXJyCAskS1y7c
  RjMFhEIlbg34S4jiM0sEC+x799EdoiGs4wSX271gyXYBLQltmz5BdbAK2ArcXPVc1YQm0VARe
  LCit/sILaoQLjE+iUrGSFqBCVOznzCAmJzCthJTJk/B6iXA2iBpsT6XfoQu8Qlbj2ZzwRhy0t
  sfzuHGaREAsjueSgLEpYQSJBY9vIO8wRGwVlIhs5CGDQLyaBZSAYtYGRZxWiRVJSZnlGSm5iZ
  o2toYKBraGika2hsAsRmeolVukl6pcW65anFJbpGeonlxXrFlbnJOSl6eaklmxiBUZJS0Naxg
  3H6mw96hxglOZiURHklhT/HC/El5adUZiQWZ8QXleakFh9ilOHgUJLgNTQDygkWpaanVqRl5g
  AjFiYtwcGjJMJ7GiTNW1yQmFucmQ6ROsWoKCXOWwCSEABJZJTmwbXBksQlRlkpYV5GBgYGIZ6
  C1KLczBJU+VeM4hyMSsK8N0Cm8GTmlcBNfwW0mAlosVjie5DFJYkIKakGJo37xSd0ltrPCe+1
  VRExnPZpXWfVw4VRi6Y/mNEg3TujX6uL86/lfH9to+D5ST5MXDtuPVpXYfXzwFSt1+Yl2R4TC
  ljr3iefmpCyPvEw55kfm94emPBlMv/hHq2AW2VdPE85/06fctGiyK3Gq7B+h3WOzkyFlS8s7E
  /YpkRO3HGsNmK7WErx141Wl3jdfz1TOP622Yo/PeenQoqv1TYlt1dJVZr8Sy/ZLS66abrtVeQ
  bZvfS2Pdx60X0Ts+dt/fpukMJk4v2rzK8xfBs4iT2DbN6W1f77Zm6ZdoaxwuSvCs/TZQ4fHKK
  09zVpTNecBwLevLxuajve+U9iZM8tXPjJjY1XD13J/tqa/U8pshA+RtKLMUZiYZazEXFiQADM
  SySjQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-22.tower-356.messagelabs.com!1609775019!3798!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20054 invoked from network); 4 Jan 2021 15:43:41 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-22.tower-356.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2021 15:43:41 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 416787B581366AABC956;
        Mon,  4 Jan 2021 23:43:38 +0800 (CST)
Received: from localhost.localdomain (10.38.54.96) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Mon, 4 Jan 2021
 07:43:37 -0800
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: correct
 palmsensor error checking
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20201230024726.7861-1-markpearson@lenovo.com>
 <CAHp75VfS3hAJ+vP54V+80zzWVW-+vYK-gGocRMrQhHkWnPXzXg@mail.gmail.com>
 <c99cbd33-4969-568a-205d-52c53509e586@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <e9f57686-bdd1-89eb-622f-851b26e35f17@lenovo.com>
Date:   Mon, 4 Jan 2021 10:43:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c99cbd33-4969-568a-205d-52c53509e586@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.54.96]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 04/01/2021 10:32, Hans de Goede wrote:
> Hi,
> 
> On 1/4/21 4:17 PM, Andy Shevchenko wrote:
>> On Wed, Dec 30, 2020 at 4:54 AM Mark Pearson
>> <markpearson@lenovo.com> wrote:
>>> 
>>> The previous commit adding functionality for the palm sensor had
>>> a mistake which meant the error conditions on initialisation was
>>> not checked correctly. On some older platforms this meant that if
>>> the sensor wasn't available an error would be returned and the
>>> driver would fail to load.
>> 
>>> This commit corrects the error condition. Many thanks to Mario
>>> Oenning for reporting and determining the issue
>> 
>> Hint to the future (maybe Hans will fix this while it's in his
>> review queue): we have a Reported-by tag. Of course if a person
>> would like to avoid it, then it's fine.
> 
> I did notice this too, but I did not fix it. For future patches the
> right thing to do is to ask the reporter if he is ok with a
> Reported-by tag being added (which will expose their email to the
> world) and then proceed depending on their answer, at least that is
> what I usually do. Although sometimes I do just add the Reported-by
> tag, esp. if the email has been send to a (couple of) lists, so the
> email already has been exposed to a large audience.
> 
Ack - thanks all. I wasn't aware of the reported-by etiquette :)

Probably a good one to know about....I'm sure this won't be the last
issue reported against a Lenovo system!

Mark
