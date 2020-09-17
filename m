Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC340C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88DDB21D7F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgIQMFS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:05:18 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:60214 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgIQMFL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 08:05:11 -0400
X-Greylist: delayed 858 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:05:10 EDT
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 350EF3AE63C
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 11:51:12 +0000 (UTC)
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7061E24000D;
        Thu, 17 Sep 2020 11:50:47 +0000 (UTC)
Message-ID: <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 13:50:46 +0200
In-Reply-To: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.0 (3.38.0-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hey,

On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
> Hi Elia, Mark, et al.
> 
> Elia, Mark I'm mailing you both because both of you have pdx86
> patches pending to add a vendor
> specific sysfs-attribute for selecting performance-profiles for resp.
> HP and Lenovo Thinkpad laptops.
> 
> I think that this shows that we might need to start thinking
> about a generic kernel API for this, otherwise we will
> end up with slight different options per vendor ...

Some comments below based on possible use in power-profiles-daemon:
https://www.hadess.net/2020/09/power-profiles-daemon-new-project.html


> So it seems we may need something like:
> 
> /sys/class/system_performance_profile
> 
> Where we would then get e.g.:
> 
> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
> le
> 
> And then we need to standardize on the names/values which
> performance_profile can show / accept when written too.
> 
> The big question is what do we do if there are more then 3 profiles?

The Intel P-State driver in the kernel supports 4 separate ones (plus
default):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpufreq/intel_pstate.c#n591
which we crammed into 3 profiles:
https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/blob/master/src/ppd-driver-intel-pstate.c#L209-226

> One option would be something like the following:
> 
> cat
> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
> le
> 
> low-power [balanced] performance

Are the square brackets to show the currently selected profile? I'd
rather it was a separate sysfs attribute. I would expect to only ever
read the list of supported profiles once, and then monitor an "active
profile" attribute.

(a bit like the intel_pstate kernel driver does, but then all the
devices that support Intel P-State support all the profiles, so it's
not a good example ;)

> cat
> /sys/class/system_performance_profile/thinkpad_acpi/extra_performance
> _profiles
> 
> extra-low-power balanced-performance-mix
> 
> So we add an optional extra_performance_profiles sysfs attribute and
> we ask all
> drivers implemeting this class to implement at least the 3 standard
> profiles
> (by mapping 3 of their options to these) and optional they can offer
> extra
> profiles (with free form names) in the extra_performance_profiles
> sysfs attribute under the class-device.
> 
> The idea behind putting the extra profiles in a separate sysfs-
> attribute
> is that reading the main performance_profile attribute will always
> show
> one selected, even if one of the extra profiles is actually in use,
> then the driver should also show the closest standardized profile as
> being active.

I think it's fine having more than 3 profiles. Something like power-
profiles-daemon would likely trying to match them all to one of the 3
profiles it uses as an interface, or forcing the use of those 3
profiles, depending on what that profile behaves.

> This will allow userspace code to always rely on the standard
> interface
> both for getting a representation of the currently active profile as
> well
> as for setting the active profile.
> 
> Elia, Mark, I assume that both of you want to get your patches for
> this
> upstream sooner, rather then later. But I think we should put them on
> hold until we have an agreement on a shared userspace API for this.

Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
something to advertise the unavailability of a profile, and the reason
for that unavailability.

Cheers

> 
> I would like to think that the above proposal is a good start,
> if we can quickly (*) decide on an userspace API here
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> I guess we should also add an optional lap_mode sysfs attribute
> to the class-device, to have all the info for the Thinkpads in
> one place.
> 
> 
> *) but not too quickly, it is important we get this right
> 


