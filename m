Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0A8C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:45:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA985206D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgIQSpu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:45:50 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.114]:17251 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728684AbgIQQv7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 12:51:59 -0400
Received: from [100.112.135.189] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id 85/0E-22172-914936F5; Thu, 17 Sep 2020 16:51:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleJIrShJLcpLzFFi42JJl3vFpis5JTn
  eYPsPOYvepulMFvuvS1gsvH+K1eLrt9vsFm+OA4XOLEyyWL3nBbMDu8fOWXfZPX5tW8PiMe9k
  oMf7fVfZPD5vkgtgjWLNzEvKr0hgzdj77R9rwX6hikXPLBsYr/J1MXJyCAn8Z5SYvDOoi5ELy
  H7IKLFo0yJWEEdYoJVRYmPnXTYQR0RgCqPE4jvTmEAcZoHljBKnujYxQvQ8YJQ4+GYaG8gwNg
  FtiS1bfoHZvAK2Ei39x9hBbBYBVYmm/p1AcQ4OUYFYiW8z/SBKBCVOznzCAmJzCthJ9G6ZBdb
  KLGAhMXP+eUYIW1zi1pP5TBC2vMT2t3OYQWwJAQWJld8XskHYCRLLXt5hnsAoOAvJ2FlIRs1C
  MmoWklELGFlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGhob65pZ6CVW6SbplRbrlqcWl+ga6SWWF
  +sVV+Ym56To5aWWbGIERlNKQavLDsb/rz/oHWKU5GBSEuX9PiE5XogvKT+lMiOxOCO+qDQntf
  gQowwHh5IEr/pkoJxgUWp6akVaZg4wsmHSEhw8SiK8/ycBpXmLCxJzizPTIVKnGBWlxHlVQRI
  CIImM0jy4NlgyucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHctyBSezLwSuOmvgBYzAS1m
  40wEWVySiJCSamCK/aBYcfPvfp3m6gcm9su7ztW8air1uyot2a60i8Mj9JbiGbHbN/d0WhSJn
  prGlt0Y8CipTNLy7a5Pv97Mdtk9ifdo3IpDu9Y4TtBcMIFxu6fay9dfPqbJF7UUH745r/jpmo
  73OX/KPLj0bh0KFpC/VMG5i2HSvwzl30eXCXZczWG/atAnF1uspqv/9ZzNmea6Z/oFnkpPpB0
  SrfSDYldyN31vmqG6I+Pw65dHfdYpsRQ3TVx+T7dhQ0VbruTd6FmaRkli5Uam9e5eDr5XfwmZ
  fHa6l+n69uQvVhXOzB+XbOReTOthXpumvKv9cCebNuf6fPeM+onZKYuSaqw05nAJqr63T3pYl
  lEuUBavCDQ6I9FQi7moOBEA3BQAUqEDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-28.tower-346.messagelabs.com!1600361495!43421!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23852 invoked from network); 17 Sep 2020 16:51:37 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-28.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Sep 2020 16:51:37 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 87D53D092206406B0E50;
        Fri, 18 Sep 2020 00:51:33 +0800 (CST)
Received: from [10.46.52.228] (10.46.52.228) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Thu, 17 Sep
 2020 09:51:30 -0700
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
CC:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
 <f8e4fc83-9665-2a58-d2e0-e858a16417e8@lenovo.com>
 <6e49abf2-6e93-bb41-7df3-0ac66b689df6@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <a2861f6e-7e7e-3bf8-8f31-c4c2c92096ce@lenovo.com>
Date:   Thu, 17 Sep 2020 12:51:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6e49abf2-6e93-bb41-7df3-0ac66b689df6@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.52.228]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/17/2020 10:04 AM, Hans de Goede wrote:
> Hi,
> 
> On 9/17/20 3:36 PM, Mark Pearson wrote:
>> Hi all,
>>
<snip>
>>
>> One question - the main reason for a common interface is for user 
>> space to not deal with a mess of APIs.
> 
> Correct.
> 
>> Is it worth me doing a simplified version of my patch (maybe using 
>> debugfs?) so I can expose the modes to users whilst we work on the 
>> common solution? I'm assuming there is no mileage in getting my patch 
>> (with the fix I owe Benjamin) in and then changing it in the future 
>> once the generic solution is available as that potentially messes up 
>> userspace too much?
> 
> Using debugfs as an intermediate solution is a good idea. debugfs 
> interfaces have no ABI guarantees, so we can simply drop it when the 
> generic stuff lands.
> 
Great. I'll look at that as an alternative for the short term.

>> Something as a stopgap measure that won't annoy the kernel community 
>> but is good for Linux users as I'm guessing the generic solution is 
>> likely to be months away
> 
> The generic solution will definitely not make the 5.10 kernel, but 5.11 
> is not entirely out of the question, although to be honest 5.12 seems 
> more realistic.
> 
OK.
> <snip>
> 
>>>> I guess we should also add an optional lap_mode sysfs attribute
>>>> to the class-device, to have all the info for the Thinkpads in
>>>> one place.
>>>>
>> I'm good with this too - but the lapmode patch is accepted and there 
>> is the palm sensor patch too which I'm hoping is accepted soon. Whilst 
>> I'm happy to make them part of this implementation (if they fit) I'd 
>> appreciate if they didn't get removed or held up as they're needed for 
>> our WWAN implementation which is already overdue.
>> The main consumer there will be our WWAN enablement utility and we can 
>> change that to support different API if needs be :)
> 
> As the rest of the dicussion has shown the lap_mode thingie indeed is 
> best left in place as a
> thinkpad_acpi only interface for now.
> 
> I guess the same applies to the palm_sensor stuff. We may want to 
> advertise that through
> some standardize API later, but for now we can just use a thinkpad_acpi 
> specific API and
> then also export the info through the standardized API later, as we will 
> do for the
> lcdshadow stuff.
> 
Sounds good.
Happy to work on that too in the future

Mark
