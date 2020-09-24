Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A952CC4363D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 02:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69FCE20BED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 02:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgIXCKg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 22:10:36 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.4]:17526 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726281AbgIXCKf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 22:10:35 -0400
Received: from [100.112.129.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-west-2.aws.symcld.net id EA/AC-25315-8100C6F5; Thu, 24 Sep 2020 02:10:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRWlGSWpSXmKPExsWS8eIhj64EQ06
  8wdGjjBa9TdOZLPZfl7BYeP8Uq8XXb7fZLd4cBwqdWZhksXrPC2YHdo+ds+6ye/zatobFY97J
  QI/3+66yeXzeJBfAGsWamZeUX5HAmvHk1nmmgv3WFRvvxzQwTjfoYuTiEBL4zyjx9dRpZgjnB
  aPEvlNP2EAcYYFWRomNnXfBHBGB7YwSb7p2gDnMIJkpcz6wQfT8ZJRYNn0KexcjJwebgLbEli
  2/2EBsXgFbic4fR4AGc3CwCKhKbFvjDBIWFYiQWHN8IhNEiaDEyZlPWEBsTgE7iU97r4HFmQU
  sJGbOP88IYYtL3HoyHyouL9G8dTYziC0hoCDx8s9VFgg7QWLZyzvMExgFZyEZOwvJqFlIRs1C
  MmoBI8sqRoukosz0jJLcxMwcXUMDA11DQyNdQ2NDXSNDM73EKt1EvdJi3fLU4hJdI73E8mK94
  src5JwUvbzUkk2MwIhKKWi+sYNx1psPeocYJTmYlER5vf5mxwvxJeWnVGYkFmfEF5XmpBYfYp
  Th4FCS4G3+D5QTLEpNT61Iy8wBRjdMWoKDR0mE9/8/oDRvcUFibnFmOkTqFKMux+a5SxcxC7H
  k5eelSonz5oIUCYAUZZTmwY2AJZpLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5uUGm8GTm
  lcBtegV0BBPQEaafM0COKElESEk1MLldMplanNWsJ/865GBY2/yV1wy2Jp5fq8Zlx77N8nft9
  f4Q3yTF9Bknc//Hc/X/klj7WH8Ca9YHy9qAxGuXhBOW84uY9Ma+ZVwqwP+H51yLUon7FsWNkx
  OWNWUIhX9i/B6RH/XiFndt4yzDt2plHzV+ZD+tCLkubuAtd2HGat1HtwonHVh/5J2H1um3/me
  +XN2f8I69NVhHaPqGJ5Mc51r55u/Snbj23eHUJe/q13N6NlrunVS7WHlp8f+tkzfsvPXsTvHy
  nWfm887pbXkwecPrdN+rvTvlVn1ubancZ7Xt0rNn7R/uble/4Zf9jMMob5vApzW1jTvXf5tof
  FBzdcmcRTfsry6OMpm8eW7SeZG/SizFGYmGWsxFxYkAfS6r668DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-326.messagelabs.com!1600913430!28757!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13523 invoked from network); 24 Sep 2020 02:10:31 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-14.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2020 02:10:31 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 64FDF91EE007815FC614;
        Wed, 23 Sep 2020 22:10:30 -0400 (EDT)
Received: from localhost.localdomain (10.38.102.74) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Wed, 23 Sep
 2020 19:10:29 -0700
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>
CC:     Jared Dominguez <jaredz@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
 <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
 <9766663.nUPlyArG6x@pce> <79735e10-6dfc-ffff-5b42-b78e19e24d9b@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <c3446ec8-9dba-8e20-3a15-a03ed39e4f8e@lenovo.com>
Date:   Wed, 23 Sep 2020 22:10:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <79735e10-6dfc-ffff-5b42-b78e19e24d9b@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.102.74]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2020-09-22 6:43 a.m., Hans de Goede wrote:
> Hi,
> 
> On 9/21/20 11:03 AM, Elia Devito wrote:
>> Hi all, sorry for response delay I'm very busy at work this period
> 
> No problem.
> 
>> A common interface is surely the best solution, especially because it 
>> allows
>> to standardize the user-space tools and maybe to integrate its with 
>> desktop,
>> like Bastien is doing with gnome-power-profiles-daemon or like the 
>> similar tool
>> plasma-pstate.
>>
>> I think we should keep separate performance and thermal profiles thus 
>> leaving
>> the possibility of setting a thermal profile independently of the 
>> performance
>> profile and vice versa.
>>
>> Hp implements up to 4 thermal profiles (apparently the same ones that 
>> implement
>> dell), my patch implements the first 3 profiles which are the ones 
>> supported by
>> my hardware.
>>
>> 1. HP Recommended -> fan stay off and start at low~medium speed when 
>> necessary
>> 2. Performance    -> fan stay off and start at medium~hight speed when
>> necessary
>> 3. Cool           -> fan stay off and start at medium~hight speed when
>> necessary
>> 4. Quiet          -> fan should stay off and start at very low speed if
>> necessary
>>
>> for each profile the firmware set also a OEM variable to select DPTF 
>> profile
>> with the adeguate power limit.
>>
>> combining these profiles with the performance profiles it is possible 
>> to obtain
>> the desired performance according to the needs of the moment
>>
>> e.g.
>>
>> For gaming purpose when the CPU and GPU share the thermal budget, in 
>> this case
>> the best solution is to set thermal profile to performance to maximize 
>> the heat
>> dissipation and the p-state profile to powersave, in this way during 
>> loadings
>> the cpu gain a performance boost that allow to reduce loading time, 
>> instead,
>> during gameplay the cpu performance will be limited in favor of the GPU
>> allowing the maximum framerate to be reached.
>> (feral had to handle it for its gamemode tool:
>> https://github.com/FeralInteractive/gamemode/pull/179)
>>
>> Another opposed particular case could be thermal profile set to quiet and
>> p-state set to performance, usefull for example to maximizze cpu 
>> performance
>> in silent ambient room like a library, obviously for CPU-only intesive 
>> tasks
>> the best solution is to set either thermal and performance profile to
>> performance.
>>
>> Basically there are infinite combinations that can be made to obtain 
>> the best
>> configuration for each situation, to allow this a common interface 
>> should offer
>> a possibility to:
>>
>> - Define the list of thermal profiles separately from the performance 
>> ones
>> - Eventually define a list of on/off attributes (useful for lenovo 
>> lap_mode?)
>> - Provide a description of them
>> - Switching between thermal profiles regardless of the performance 
>> profile
>>
>> A possible solution could be a "slider like" interface for performance 
>> level
>> and a list of thermal profile.
> 
> So I have been thinking about this and performance level and thermal 
> profile
> are really inherently couple to each other. Telling the CPU it can use
> 25W TPD instead of the default 15W, without also ramping up the cooling is
> just going to lead to a whole bunch of thermal throttling.
> 
> In a desktop machine with a discrete GPU it is sorta easy, in essence 
> you have
> a GPU performance profile, controlling GPU TPD/turbo behavior and the GPU
> fans too match, and a CPU performance profile which likewise controls
> the CPU fan profile too match the CPU performance profile.
> 
> With laptops with a discrete GPU things become harder because there is a
> single shared cooling mechanism. But there you could simply say that
> performance-profile = max(gpu-profile, cpu-profile).
> 
> I mean telling the GPU and CPU that they can burn a gazillion watts and
> then telling the cooling setup to be as quiet as possible, is clearly
> not going to end well.
> 
> This all assumes that we have some nice way to tell the hardware about
> the 3 separate (gpu / cpu / cooling) profiles we want.
> 
> But that is not always the case; and often when using a CPU with
> integrated GPU they are all tied together.
> 
> So my proposal is to have a :
> 
> /sys/class/performance-profile
> 
> Underneath we can have one or more entries (performance-profile providers)
> each one with a performance_level file on the previously suggested 0-100 
> scale
> and a performance_mappings file listing the supported discrete values on 
> that
> scale and some descriptions of those discrete values purely for 
> informational
> purposes.
> 
> Besides the performance_level and performance_mappings files I would 
> also like
> to add a "type" sysfs attribute, which can have 1 of 3 values:
> "system", "cpu" and "gpu".
> 
> So something like the thinkpad_acpi performance levels will be "system", 
> and
> the intel_pstate driver could maybe also register itself here as a "cpu"
> type performance-profile provider.
> 
> This will allow userspace (if / when it wants to) to do things like put the
> CPU in medium/balanced mode while telling the GPU to go full-throttle 
> for when
> playing a game which is clearly GPU limited.
> 
> This game scenario of course assumes that we then actually will have a
> performance-profile driver for both the CPU and the GPU.
> 
> Note I'm still just brainstorming here, but I think that having the
> 0-100 scale + the type thing should cover all the use-cases we want
> to cover.
> 
> As always feedback or alternative API proposals are very much welcome.
> 
I was mulling this over and I think the 1 to 100 slider seems awkward - 
too many levels and the fine graduation mapping onto somewhat coarse (3, 
4 or 5) options doesn't seem to fit well for me. I'm struggling to see 
how it fits the tweaking CPU vs GPU vs system - do we end up introducing 
multiple sliders - which gets complicated with all the choices? I'm just 
not convinced yet.

I'm also not sure about being able to tweak everything too - Linux users 
are smart but is it just getting irritating at that point? Power (hah!) 
users have plenty of tweaking tools at their disposal if they want to 
get into change p-states and tweak every little power option; but this 
exercise is aimed at those who want to make simple general changes - 
increase the power because they have a build to complete, drop into 
quiet mode when watching a movie, or a low power setting when they know 
they're not going to be able to charge for a long time. I suspect some 
smart person will end up automating all this but that's by the by.

So as a counter proposal: Have the slider choose between some key modes 
that we think cover the use cases that people would *want*.

I'd keep the mode list small to avoid it being confusing - more could be 
added later if really needed but I'm guessing (and happy to be 
corrected) that the majority of activities would fit into just a few 
boxes reasonably well.

For instance (I think I get the following from the above):
  - low power/Cool
  - Quiet
  - balance/default
  - CPU performance
  - GPU performance

The vendors would just choose their optimal firmware setting for that 
use case depending on what they have available.

Apart from the GPU performance option that maps pretty well for Lenovo 
and I think it maps very nicely for HP. I wanted to squish low power ad 
quiet together but that seemed unfair - they are very similar though :)
I'm struggling to think of other use cases that would really 
matter...thoughts? Is this *too* simple?

Mark





