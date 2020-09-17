Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9092EC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57815221EE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIQSlW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:41:22 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:19583 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728471AbgIQQ6k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 12:58:40 -0400
Received: from [100.112.5.40] by server-1.bemta.az-c.us-east-1.aws.symcld.net id F5/7C-47518-3B5936F5; Thu, 17 Sep 2020 16:58:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleJIrShJLcpLzFFi42JJl3vFrrtpanK
  8wbejFha9TdOZLPZfl7BYeP8Uq8XXb7fZLd4cBwqdWZhksXrPC2YHdo+ds+6ye/zatobFY97J
  QI/3+66yeXzeJBfAGsWamZeUX5HAmnF6yWvWgmmSFYtevWJrYNwk0sXIxSEk8J9RYv7eL+wQz
  kNGiTunl7OCOMICrYwSGzvvsoE4IgI7GSUOL70EVsYMkpky5wMbRM8tJokph1YAOZwcbALaEl
  u2/AKzeQVsJeac2MUOYrMIqEqcenWFpYuRg0NUIFbi20w/iBJBiZMzn7CA2JwCHhIz/x8DK2c
  WsJCYOf88I4QtLnHryXwmCFteYvvbOcwgtoSAgsTK7wvZIOwEiWUv7zBPYBSchWTsLCSjZiEZ
  NQvJqAWMLKsYTZOKMtMzSnITM3N0DQ0MdA0NjXTNdU0s9RKrdJP1Sot1UxOLS3QN9RLLi/WKK
  3OTc1L08lJLNjECoymlgN1wB+PiNx/0DjFKcjApifJ+n5AcL8SXlJ9SmZFYnBFfVJqTWnyIUY
  aDQ0mCV30yUE6wKDU9tSItMwcY2TBpCQ4eJRHekClAad7igsTc4sx0iNQpRkUpcd5ykD4BkER
  GaR5cGyyZXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsLZApPZl4J3PRXQIuZgBazcSaC
  LC5JREhJNTDlBvI5xO1tuHQwWMo3WEaN5VmymFac+1Sn49onDC8vaRUrnlzoful6tml4juSe9
  sTHO9IEFGe+s1lpmv7835IXypHnlh/NPlddybLxMIf727nKgVdLaqd614fWRR8QYK0pmLDBef
  bnrcEzst0afU7H1RXZ561f1bH4aoqZvWx8m+18HiHeHZsbnfZfeTfp4YZ4kc3xj/Ytv8W1z2u
  lm9KvP0+ebX3EuagmL1CA4/mSyuuGE4rD+/qTyidMUQmdJPGes2Fq+uLPMQ82r/i3ffKRYiel
  u/YzfUM6G8y6ftgtuZhVYbpXhN+Yu2x56dfj988xSpTEX16kefw8t/spxaNHNjfWf2AO2Jx5Q
  k/x4zElluKMREMt5qLiRAC9vRQ2oQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-47.tower-406.messagelabs.com!1600361904!9731!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32516 invoked from network); 17 Sep 2020 16:58:26 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-47.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2020 16:58:26 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id AAF2F862D328E0329396;
        Fri, 18 Sep 2020 00:58:22 +0800 (CST)
Received: from [10.46.52.228] (10.46.52.228) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Thu, 17 Sep
 2020 09:58:19 -0700
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Benjamin Berg <bberg@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
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
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
Date:   Thu, 17 Sep 2020 12:58:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.52.228]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/17/2020 10:10 AM, Benjamin Berg wrote:
> Hi,
> 
> On Thu, 2020-09-17 at 15:54 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/17/20 3:50 PM, Benjamin Berg wrote:
>>> On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
>>>>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>>>>> something to advertise the unavailability of a profile, and the reason
>>>>> for that unavailability.
>>>>
>>>> UGh, do we really need to export this though. We have the lap_mode thing
>>>> already; and that is something which we will need for other reasons in
>>>> the future too. Any UI for selecting performance modes can display a
>>>> warning when lap_mode is true saying that: "The laptop has detected that it
>>>> is sitting on someone's lap and that performance may be limited
>>>> because of this." (feel free to improve the text).
>>>
>>> Well, for dytc_perfmode there are actually always the three states
>>> L/M/H. It just happens that the kernel will write "H*" (was "M*" until
>>> yesterday) when the performance mode is degraded due to lap detection.
>>>
>>> Think of dytc_perfmode as a profile that sets a number of things:
>>>    * Thermal Limits
>>>    * Fan Behaviour
>>>    * possibly more
>>>
>>> While dytc_lapmode will only enforce a change to the thermal limit.
>>> So "performance" (H) is technically a valid mode even when the lap is
>>> detected.
>>>
>>>> I guess we could split the "value" attribute from my reply to Benjamin's
>>>> email into "configured_value" (rw) and "actual_value" (rw) attributes.
>>>> If we have the info we might as well export it I guess,.
>>>
>>> I consider the "*" purely a curtsey to users that read the attribute
>>> directly using e.g. cat to help with the interpretation. It probably is
>>> not interesting to userspace applications/daemons.
>>
>> So if there is a difference between M and H and H* then I think we should
>> just do the KISS thing and only have a single value attribute and in the
>> new interface handle the H* like H (p-p-d can still check the lap_mode
>> attribute to differentiate the 2 if it wants to).
> 
> I guess you are saying to drop "H*" and only have "L"/"M"/"H"? If so,
> fine with me, but we probably need that input in reply to
>    https://patchwork.kernel.org/patch/11730133/#23618881
> then :)
> 
> In principle it could be useful for userspace to know that performance
> is or would be dramatically impacted. i.e. when dytc_lapmode is 1, then
> you might want to say something like:
> 
>    performance states >= 75 are impacted due to "lapmode"
> 
> But, not sure if a kernel interface for that is useful or whether we
> should just put that kind of knowledge into userspace.
> 
> Benjamin
> 
I don't have a strong opinion on this but the kernel driver is already 
knowledgeable about the quirks of what does and doesn't work on the 
system so it seems like a good place to have that logic.

What if we have an API for "configured" and "actual" - and if they 
differ userspace knows it should figure out why (likely lapmode, but if 
the HW vendor adds a new setting related to "position of sun in the sky" 
or "how much money is in your account and can you afford the electricity 
bill?" that could be added too....)

Mark
