Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC04C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A2FF21D7F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgIQNyU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:54:20 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:55759 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727041AbgIQNyD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:54:03 -0400
Received: from [100.112.3.165] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 8A/C6-32770-F66636F5; Thu, 17 Sep 2020 13:36:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleJIrShJLcpLzFFi42JJl3vFrpublhx
  v0DpP26K3aTqTxf7rEhYL759itfj67Ta7xZvjQKEzC5MsVu95wezA7rFz1l12j1/b1rB4zDsZ
  6PF+31U2j8+b5AJYo1gz85LyKxJYMxr2X2Ir+GhRMX36ddYGxvN6XYxcHEIC/xklHs3aygzhP
  GSU+PX/OxOIIyzQyiixsfMuG4gjIjCFUeL94ztgGWaB5YwSp7o2MXYxcgL1VEksXnedDcRmE9
  CW2LLlF5DNwcErYCvR9tITJMwioCpx9UU3M0hYVCBW4ttMP5Awr4CgxMmZT1hAbE4BD4ljL+a
  D2cwCFhIz559nhLDFJW49mc8EYctLbH87hxnElhBQkFj5fSEbhJ0gsezlHeYJjIKzkIydhWTU
  LCSjZiEZtYCRZRWjaVJRZnpGSW5iZo6uoYGBrqGhka6xrqmJXmKVbpJeabFuamJxia6hXmJ5s
  V5xZW5yTopeXmrJJkZgJKUUMJvtYPz5+oPeIUZJDiYlUd43ycnxQnxJ+SmVGYnFGfFFpTmpxY
  cYZTg4lCR4Q0BygkWp6akVaZk5wKiGSUtw8CiJ8E5KAUrzFhck5hZnpkOkTjEqSonzCqUCJQR
  AEhmleXBtsERyiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwryXIeJ7MvBK46a+AFjMBLWbj
  TARZXJKIkJJqYFp3eVvOuk8COrKTc7d9PyK2STs6ZkHW2/8ZhjpqGhI/k9/Ks8t+Fyni+lLQW
  ze9j5l5cc0BW8vFvceaGCUn6EwtyV68y2bnRqFZVyN5IlSDXzGyX9+0ufHC8WNFRkcSvMuFDk
  1k/Ozqt7P9wrtXfwtn/2cX7UrnPGOS8bd1c/S6m10Nl+cZLX04P1FGSEBR7afIz4/RordmJ/3
  ZLOUakL/lUnW649edRtPW9eYpfDTzPOQ4Qb4spPbi7d3z5i6YaWZwWlb1Vbfuy4kbsqLXrxH9
  PPvQ4Ql8crt+yJ433yC5ZqtW1AfLuxZuAq9uykp4TjMqF9S5trKRu6e8Zfaehlv5/9u3Fdt2u
  viV7n/z/LASS3FGoqEWc1FxIgA1WkXxnwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-395.messagelabs.com!1600349796!1659!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30455 invoked from network); 17 Sep 2020 13:36:41 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-8.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2020 13:36:41 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 156BDCB907257C85F5D4;
        Thu, 17 Sep 2020 21:36:33 +0800 (CST)
Received: from [10.46.52.228] (10.46.52.228) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Thu, 17 Sep
 2020 06:36:30 -0700
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
CC:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <f8e4fc83-9665-2a58-d2e0-e858a16417e8@lenovo.com>
Date:   Thu, 17 Sep 2020 09:36:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.52.228]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

More emails came in since I wrote this....but I'm going to send anyway 
and catch up with those after. I need to write faster :)

On 9/17/2020 7:50 AM, Bastien Nocera wrote:
> Hey,
> 
> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
>> Hi Elia, Mark, et al.
>>
>> Elia, Mark I'm mailing you both because both of you have pdx86
>> patches pending to add a vendor
>> specific sysfs-attribute for selecting performance-profiles for resp.
>> HP and Lenovo Thinkpad laptops.
>>
>> I think that this shows that we might need to start thinking
>> about a generic kernel API for this, otherwise we will
>> end up with slight different options per vendor ...
> 
> Some comments below based on possible use in power-profiles-daemon:
> https://www.hadess.net/2020/09/power-profiles-daemon-new-project.html
> 
> 
>> So it seems we may need something like:
>>
>> /sys/class/system_performance_profile
>>
>> Where we would then get e.g.:
>>
>> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
>> le
>>
>> And then we need to standardize on the names/values which
>> performance_profile can show / accept when written too.
>>
>> The big question is what do we do if there are more then 3 profiles?
> 
> The Intel P-State driver in the kernel supports 4 separate ones (plus
> default):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpufreq/intel_pstate.c#n591
> which we crammed into 3 profiles:
> https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/blob/master/src/ppd-driver-intel-pstate.c#L209-226
> 
>> One option would be something like the following:
>>
>> cat
>> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
>> le
>>
>> low-power [balanced] performance
> 
> Are the square brackets to show the currently selected profile? I'd
> rather it was a separate sysfs attribute. I would expect to only ever
> read the list of supported profiles once, and then monitor an "active
> profile" attribute.
> 
> (a bit like the intel_pstate kernel driver does, but then all the
> devices that support Intel P-State support all the profiles, so it's
> not a good example ;)
> 
>> cat
>> /sys/class/system_performance_profile/thinkpad_acpi/extra_performance
>> _profiles
>>
>> extra-low-power balanced-performance-mix
>>
>> So we add an optional extra_performance_profiles sysfs attribute and
>> we ask all
>> drivers implemeting this class to implement at least the 3 standard
>> profiles
>> (by mapping 3 of their options to these) and optional they can offer
>> extra
>> profiles (with free form names) in the extra_performance_profiles
>> sysfs attribute under the class-device.
>>
>> The idea behind putting the extra profiles in a separate sysfs-
>> attribute
>> is that reading the main performance_profile attribute will always
>> show
>> one selected, even if one of the extra profiles is actually in use,
>> then the driver should also show the closest standardized profile as
>> being active.
> 
> I think it's fine having more than 3 profiles. Something like power-
> profiles-daemon would likely trying to match them all to one of the 3
> profiles it uses as an interface, or forcing the use of those 3
> profiles, depending on what that profile behaves.
> 
>> This will allow userspace code to always rely on the standard
>> interface
>> both for getting a representation of the currently active profile as
>> well
>> as for setting the active profile.
>>
>> Elia, Mark, I assume that both of you want to get your patches for
>> this
>> upstream sooner, rather then later. But I think we should put them on
>> hold until we have an agreement on a shared userspace API for this.
> 
> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
> something to advertise the unavailability of a profile, and the reason
> for that unavailability.
> 
In all honesty I was slightly dreading this email :) I know the similar 
issue killed our ePrivacy patch...but I fully appreciate that is part of 
open source contribution

So yes - I agree that having a common interface would be a good idea and 
making it common between the vendors makes sense. Let me know how to 
contribute and make that happen.

 From Lenovo's firmware point of view - our three settings should map on 
to this quite closely with the exception that we have one setting that 
covers balance_power and power (I never understood why the FW team did 
that - as they have the four states in Windows - I wasn't able to get a 
satisfactory answer to that question)

> Cheers
> 
>>
>> I would like to think that the above proposal is a good start,
>> if we can quickly (*) decide on an userspace API here

Yes and understood. Let me know what is the best place to make this 
happen - from my point of view the main aim is to get this to our users 
to make the whole performance mode implemetnation more usable and 
obvious. Without my proposed patch it's really hard to tell what mode 
you are in on our platforms (and leads to lots of support questions).

I'm particularly aware of the eprivacy patch where that got rejected for 
a generic solution that was under development - but the person working 
on the generic solution stopped part way through to work on other 
things. We didn't have the knowledge or experience of the graphics 
driver to be able to really go and contribute effectively so for now 
that feature is dead even though our initial patch was fairly simple. It 
is still disappointing that our users don't get useful functionality 
(and I also have to argue with marketing as to whether we can sell Linux 
systems with ePrivacy screens which is no fun - I spend way too much of 
my life doing Lenovo internal paperwork).

I figure on this item it's less complicated (not tied into the graphics 
drivers details) so I hope I can contribute more directly - let me know 
if I'm being naive.

One question - the main reason for a common interface is for user space 
to not deal with a mess of APIs. Is it worth me doing a simplified 
version of my patch (maybe using debugfs?) so I can expose the modes to 
users whilst we work on the common solution? I'm assuming there is no 
mileage in getting my patch (with the fix I owe Benjamin) in and then 
changing it in the future once the generic solution is available as that 
potentially messes up userspace too much? Something as a stopgap measure 
that won't annoy the kernel community but is good for Linux users as I'm 
guessing the generic solution is likely to be months away

Let me know what you recommend as the next steps.

>>
>> Regards,
>>
>> Hans
>>
>> p.s.
>>
>> I guess we should also add an optional lap_mode sysfs attribute
>> to the class-device, to have all the info for the Thinkpads in
>> one place.
>>
I'm good with this too - but the lapmode patch is accepted and there is 
the palm sensor patch too which I'm hoping is accepted soon. Whilst I'm 
happy to make them part of this implementation (if they fit) I'd 
appreciate if they didn't get removed or held up as they're needed for 
our WWAN implementation which is already overdue.
The main consumer there will be our WWAN enablement utility and we can 
change that to support different API if needs be :)
>>
>> *) but not too quickly, it is important we get this right
>>
> 
> 
