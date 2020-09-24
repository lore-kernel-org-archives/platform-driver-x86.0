Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3B9C4363D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 01:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 739A7206A5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 01:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIXBpC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 21:45:02 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.113]:34234 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725208AbgIXBpC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 21:45:02 -0400
Received: from [100.112.4.58] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-c.us-east-1.aws.symcld.net id 66/A5-48531-A2AFB6F5; Thu, 24 Sep 2020 01:45:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleJIrShJLcpLzFFi42JJl3vFrqv1Kzv
  e4MNGRovepulMFvuvS1gsvH+K1eLrt9vsFm+OA4XOLEyyWL3nBbMDu8fOWXfZPX5tW8PiMe9k
  oMf7fVfZPD5vkgtgjWLNzEvKr0hgzbj8y6/gMX/FtK+TGRsYj/J0MXJxCAn8Z5S4NfkWC4Tzg
  lFi0ZKNYI6wQCujxMbOu2wgjojATkaJoxt6mUEcZpDMlDkf2CB6lrFIzH2yCMjh5GAT0JbYsu
  UXmM0rYCtx+d4GJhCbRUBV4tvzm8wgtqhAhMSa4xOZIGoEJU7OfMICYnMK2ElMuXgXzGYWsJC
  YOf88I4QtLnHryXwmCFteYvvbOWBzJAQUJF7+ucoCYSdILHt5h3kCo+AsJGNnIRk1C8moWUhG
  LWBkWcVollSUmZ5RkpuYmaNraGCga2hopGuia2RsoZdYpZusV1qsm5pYXKJrqJdYXqxXXJmbn
  JOil5dasokRGE8pBSzvdjCeff1B7xCjJAeTkihv3M/seCG+pPyUyozE4oz4otKc1OJDjDIcHE
  oSvEEgOcGi1PTUirTMHGBsw6QlOHiURHhbfwCleYsLEnOLM9MhUqcYFaXEeX1A+gRAEhmleXB
  tsHRyiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73WQ8TyZeSVw018BLWYCWmz6OQNkcUki
  QkqqgSn2aY78bbnZbMdMbha8frByCvfiJaWbHL9YMZvqXcpZ/HXji531CSZ1uQ0HG715ourVL
  508WfLn+wv912s1Baapc5Vu3/FZxFPUPuZILs/eAv4dGQJiM1UfvY6LcPeI0Jw2sWxtesIRTa
  0IbdEHFbp6k6f73pnjN7l9YrIZ47riLfNcDXwYWXeJHlCbfV4gNFf6twLrKU6bBb9dPDI/vfH
  juJoieG1VlOmxSSWTE55fWPPwy5FA7RM8Nlu7TW0nBlyWeMr4/35L6o1IVkMumSu7GzNVz/OJ
  BQZ/rD612OHJmqcCuqsY7O5rvvQWfie8V+9222WphsPfVnFP1N64Ls07wDw/OZFDV7xi3f7uD
  iWW4oxEQy3mouJEACxjtEGiAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-416.messagelabs.com!1600911911!341895!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16405 invoked from network); 24 Sep 2020 01:45:13 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-11.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2020 01:45:13 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id A1569F33FF900FA748E1;
        Thu, 24 Sep 2020 09:45:09 +0800 (CST)
Received: from localhost.localdomain (10.38.102.74) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Wed, 23 Sep
 2020 18:45:04 -0700
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        "Mark Pearson" <mpearson@lenovo.com>
CC:     Jared Dominguez <jaredz@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
 <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
 <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
 <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
 <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
 <c06f214d-ca9d-9ca3-236a-82a0bacfb582@redhat.com>
 <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
 <9d473bcb-9773-6ee6-d60c-e180e3bb8e0a@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <ff465456-58c5-4486-bdee-8db2e6bb5718@lenovo.com>
Date:   Wed, 23 Sep 2020 21:44:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9d473bcb-9773-6ee6-d60c-e180e3bb8e0a@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.102.74]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2020-09-22 6:30 a.m., Hans de Goede wrote:
> Hi,
> 
<snip>
> 
> The big question is, do we want to expose that even though the user 
> configured
> a performance-profile of high, the user is only getting medium atm 
> because of
> reasons?
> 
> Note I say "because of reasons" specifically, because things become even 
> more
> complicated if we want to spell out the reasons in the sysfs interface too.
> 
> I mean high will give different results even when in desk mode, depending
> on if there is a cloth on the desk (bad) or if the table is a metal 
> picknick
> table full of round holes to drain the rain (allowing more airflow to the
> bottom of the laptop) not to mention that the ambient temperature in which
> the laptop is used can probably vary from 15 to 35 degrees celcius.
> 
> IOW there can be many factors why high may not really lead to high turbo
> clocks; or why it leads to higher turbo clocks then normally expected...
> 
> I still have the feeling that it would be best to drop the UI requirement
> to show being in a degraded performance mode, because the performance
> with modern laptops is just very variable and dependent on many factors.
> 
> If we drop that UI requirement; then there also is no need to advertise
> configured vs actual performance profile in the sysfs interface.
> 
> Users who really want to know what is going on will get much more
> detailed and useful information when using something like turbostat
> (or a UI for that) anyways.
> 
> Regards,
> 
> Hans
> 
Thought about this some and I'm in agreement. My vote is to keep the 
first version simple and see where we go from there based on user feedback.

I'm going to make the lapmode information available via debugfs for 
those users who do want to see it anyway - and this exercise is really 
about the user space controller so I can see how fitting in all these 
extra pieces just makes it awkward.

I had some other thoughts but I think they tag on better to Elia's email 
so I'll save those for there

Mark


