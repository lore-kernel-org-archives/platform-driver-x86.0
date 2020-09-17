Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8181C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89EAA21582
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgIQN3i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:29:38 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:36156 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgIQN3Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:29:24 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9288F3AF3B0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 13:07:56 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C7B6140012;
        Thu, 17 Sep 2020 13:07:03 +0000 (UTC)
Message-ID: <9d8037b5151886fd39a9eaf0a5c39b9bd56a56b8.camel@hadess.net>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 15:07:03 +0200
In-Reply-To: <35c8dd96-2e68-ac34-d1a5-78262a573287@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <b62caf7d0d7c78bfb7487cda969f55de30253a5c.camel@redhat.com>
         <35c8dd96-2e68-ac34-d1a5-78262a573287@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.0 (3.38.0-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2020-09-17 at 14:45 +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/17/20 2:22 PM, Benjamin Berg wrote:
> > Hi,
> > 
> > On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
> > > The big question is what do we do if there are more then 3
> > > profiles?
> > 
> > The Intel p-state driver has the 4 modes:
> >   * performance
> >   * balance_performance
> >   * balance_power
> >   * power
> > 
> > This seems to also match what windows does with their power slider,
> > there the modes are mapped to integer values:
> >   * power: 25
> >   * balance_power: 50
> >   * balance_performance: 75
> >   * performance: 100
> > 
> > Which appears to be the same as what newer DPTF versions use. For
> > older
> > DPTF versions this is done through OEM variables, which also appear
> > to
> > have 4 separate states usually. The MS power slider seems to define
> > the
> > four possible modes:
> >   * Battery Saver
> >   * Better Battery
> >   * Better Performance
> >   * Best Performance
> > 
> > https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider#set-default-power-slider-mode
> > 
> > > One option would be something like the following:
> > > 
> > > cat
> > > /sys/class/system_performance_profile/thinkpad_acpi/performance_p
> > > rofile
> > > 
> > > low-power [balanced] performance
> > 
> > I guess userspace is responsible for setting all drivers to the
> > correct
> > state when the user changes a global system setting?
> 
> Yes.
> 
> > > cat
> > > /sys/class/system_performance_profile/thinkpad_acpi/extra_perform
> > > ance_profiles
> > > 
> > > extra-low-power balanced-performance-mix
> > > 
> > > So we add an optional extra_performance_profiles sysfs attribute
> > > and we ask all
> > > drivers implemeting this class to implement at least the 3
> > > standard profiles
> > > (by mapping 3 of their options to these) and optional they can
> > > offer extra
> > > profiles (with free form names) in the extra_performance_profiles
> > > sysfs attribute under the class-device.
> > 
> > I think it would be good if userspace can figure out where such
> > these
> > extra profiles would be sorted in on the "power save --
> > performance"
> > scale. Assigning an integer in the range of 0-100 might be a
> > solution
> > for that.
> 
> Interesting, maybe the primary interface should even be an integer in
> that range, so for each system_performance_profile class-device we
> would then have the following attributes:
> 
> mappings (ro) - This attribute gives a list of valid performance-
> profile-values
>               In the form of "<integer-value> <description-
> string>\n", e.g.:
> 
>               25 Low Power
>               50 Balanced
>               100 Performance

The "description strings" need to come from a list. We're not going to
use those anywhere but in debug messages, so we need a way to figure
out what they would correspond to.

> value (rw) - Integer in the range 0 (lowest performance setting) -
> 100
>               (highest performance setting). Note most drivers will
> only
>               support a number of specific discrete values, see the
> mappings
>               attribute. Userspace may write an arbitrary value
> between 0
>               and 100, this will be rounded to the closest supported
> discrete
>               value.
> 
> value_string (ro) - String representation of the currently active
> value,
>               this is a shortcut for looking up the string in the
> mappings
>               attribute yourself.
> 
> lap_mode (ro) - <lap_mode text here>
> 
> Something like p-p-daemon would then just interact with the value and
> lap_mode
> fields, ignoring the mappings. It would then also need to do some
> rounding of
> its own when reading value to map things back to its own internal
> levels.
> One issue for p-p-d here might be that it writes its internal integer
> value
> corresponding to say "Low power", then reads back a value and when
> rounding
> that to its own discrete steps ends up at a different level then "Low
> power".
> This can be avoid by using the mappings file to get the supported
> discrete values
> and then only generate mappings for the discrete values to its own
> internal
> discrete steps once and always use those mappings, thus always
> writing a
> supported discrete value, avoiding rounding issues.
> 
> I think that this will give us a nice and flexible interface. Note if
> anyone disagrees, or has a better idea please speak up. Once we have
> decided on what the interface is going to be, we are effectively
> stuck
> with it.

That sounds slightly more complicated than I'd have expected it to be,
but I can work with that API.

