Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4DCC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 17:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BB72221E7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 17:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgIQRRd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 13:17:33 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.112]:54095 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726580AbgIQRQp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 13:16:45 -0400
Received: from [100.112.133.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-west-2.aws.symcld.net id F9/50-44464-BF9936F5; Thu, 17 Sep 2020 17:16:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRWlGSWpSXmKPExsWSLveKXffXzOR
  4g2ubDSx6m6YzWey/LmGx8P4pVouv326zW7w5DhQ6szDJYvWeF8wO7B47Z91l9/i1bQ2Lx7yT
  gR7v911l8/i8SS6ANYo1My8pvyKBNeP19ofMBS1KFTc7GpkbGJ9KdzFycQgJ/GeUuLKqlQnCe
  cgosfnNAXYQR1iglVFiY+ddNhBHRGAno8TRDb3MIA4zSGbKnA9sED0HmCV+XXsKNICTg01AW2
  LLll9sIDavgK1E697p7CA2i4CqxObDl4FqODhEBWIlvs30gygRlDg58wkLiM0pYCexdPdlVhC
  bWcBCYub884wQtrjErSfzmSBseYnmrbOZQWwJAQWJld8XskHYCRLLXt5hnsAoOAvJ2FlIRs1C
  MmoWklELGFlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGhob6RoZWOglVukm6ZUW65anFpfoGukll
  hfrFVfmJuek6OWllmxiBMZUSkHLhR2M69580DvEKMnBpCTK+31CcrwQX1J+SmVGYnFGfFFpTm
  rxIUYZDg4lCd7WGUA5waLU9NSKtMwcYHzDpCU4eJREeE1A0rzFBYm5xZnpEKlTjIpS4rwrQRI
  CIImM0jy4NlhKucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcBmKCEeDLzSuCmvwJazAS0
  mI0zEWRxSSJCSqqBifP82a0fTqyXYTd4U/hH95R3rn6b57/1PfFiYv7cOsnFj68Zbr0xjd1Cz
  2tp+blbv8w0BX8ULRR0PKCb++c/S0L63DPBe3j7+X193WwVTiV99maN/30xyXyZSMvXtvqEwu
  k+v3a+aHZ+LB++MoNNhs1+/Ub5kOvn+iaG/pklpM6h+qhd+N8Tn3OZX6sePN5sscLhgXBJxfu
  Z+1SjGn2PObza+3CphercxdE+hSrdTNqTHG1TH0XMKjn0JPgrh/iviBNOa87uWXosuGx76Q2J
  p+ycx9paz3vNvJvmrLZy40+ef/oRheUvtHXnZDWahF42XCjDZphZnL9jYcei7dPurTPZtv9MF
  uMtgYj/Z8VnKbEUZyQaajEXFScCABw7BHikAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-25.tower-346.messagelabs.com!1600363000!45854!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22718 invoked from network); 17 Sep 2020 17:16:42 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-25.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2020 17:16:42 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id E650D38CE4D84E9E9269;
        Fri, 18 Sep 2020 01:16:38 +0800 (CST)
Received: from [10.46.52.228] (10.46.52.228) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Thu, 17 Sep
 2020 10:16:35 -0700
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
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
Date:   Thu, 17 Sep 2020 13:16:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c06f214d-ca9d-9ca3-236a-82a0bacfb582@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.52.228]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/17/2020 1:03 PM, Hans de Goede wrote:
> Hi Mark,
> 
> On 9/17/20 6:58 PM, Mark Pearson wrote:
>> On 9/17/2020 10:10 AM, Benjamin Berg wrote:
>>> Hi,
>>>
>>> On Thu, 2020-09-17 at 15:54 +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/17/20 3:50 PM, Benjamin Berg wrote:
>>>>> On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
>>>>>>> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
>>>>>>> something to advertise the unavailability of a profile, and the 
>>>>>>> reason
>>>>>>> for that unavailability.
>>>>>>
>>>>>> UGh, do we really need to export this though. We have the lap_mode 
>>>>>> thing
>>>>>> already; and that is something which we will need for other 
>>>>>> reasons in
>>>>>> the future too. Any UI for selecting performance modes can display a
>>>>>> warning when lap_mode is true saying that: "The laptop has 
>>>>>> detected that it
>>>>>> is sitting on someone's lap and that performance may be limited
>>>>>> because of this." (feel free to improve the text).
>>>>>
>>>>> Well, for dytc_perfmode there are actually always the three states
>>>>> L/M/H. It just happens that the kernel will write "H*" (was "M*" until
>>>>> yesterday) when the performance mode is degraded due to lap detection.
>>>>>
>>>>> Think of dytc_perfmode as a profile that sets a number of things:
>>>>>    * Thermal Limits
>>>>>    * Fan Behaviour
>>>>>    * possibly more
>>>>>
>>>>> While dytc_lapmode will only enforce a change to the thermal limit.
>>>>> So "performance" (H) is technically a valid mode even when the lap is
>>>>> detected.
>>>>>
>>>>>> I guess we could split the "value" attribute from my reply to 
>>>>>> Benjamin's
>>>>>> email into "configured_value" (rw) and "actual_value" (rw) 
>>>>>> attributes.
>>>>>> If we have the info we might as well export it I guess,.
>>>>>
>>>>> I consider the "*" purely a curtsey to users that read the attribute
>>>>> directly using e.g. cat to help with the interpretation. It 
>>>>> probably is
>>>>> not interesting to userspace applications/daemons.
>>>>
>>>> So if there is a difference between M and H and H* then I think we 
>>>> should
>>>> just do the KISS thing and only have a single value attribute and in 
>>>> the
>>>> new interface handle the H* like H (p-p-d can still check the lap_mode
>>>> attribute to differentiate the 2 if it wants to).
>>>
>>> I guess you are saying to drop "H*" and only have "L"/"M"/"H"? If so,
>>> fine with me, but we probably need that input in reply to
>>>    https://patchwork.kernel.org/patch/11730133/#23618881
>>> then :)
>>>
>>> In principle it could be useful for userspace to know that performance
>>> is or would be dramatically impacted. i.e. when dytc_lapmode is 1, then
>>> you might want to say something like:
>>>
>>>    performance states >= 75 are impacted due to "lapmode"
>>>
>>> But, not sure if a kernel interface for that is useful or whether we
>>> should just put that kind of knowledge into userspace.
>>>
>>> Benjamin
>>>
>> I don't have a strong opinion on this but the kernel driver is already 
>> knowledgeable about the quirks of what does and doesn't work on the 
>> system so it seems like a good place to have that logic.
>>
>> What if we have an API for "configured" and "actual" - and if they 
>> differ userspace knows it should figure out why (likely lapmode, but 
>> if the HW vendor adds a new setting related to "position of sun in the 
>> sky" or "how much money is in your account and can you afford the 
>> electricity bill?" that could be added too....)
> 
> As I understand the problem with the configured and actual 
> value/performance_level ideas is that if I understand things correctly 
> that H* is not the same as M,
> it behaves close-ish to M because of the lower thermal-limits from 
> lapmode, but if I understood Benjamin correctly is is not exactly the 
> same, so if we were
> to advertise "M" in the actual_performance_level sysfs-attribute then 
> that would not really be correct ?
> 

Just a small clarification - in our case High performance is only for 
deskmode. It drops to Medium in lapmode.
Medium mode is slightly different in power rating between lap and desk 
mode (e.g on X1Carbon 14.5W on lap, 15W on desk). I haven't really 
worried about this in my patch implementation - it's still "medium"

Does that make it better or more confusing?

Mark
