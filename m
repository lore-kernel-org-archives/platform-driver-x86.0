Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560D8C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 162032074B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIQN2w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:28:52 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60237 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgIQN2v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:28:51 -0400
X-Greylist: delayed 1275 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 09:28:51 EDT
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3EDC81C000B;
        Thu, 17 Sep 2020 13:28:08 +0000 (UTC)
Message-ID: <085164663786cefb3159549cf4909658872e2795.camel@hadess.net>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 15:28:07 +0200
In-Reply-To: <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
         <3748b6be-cd8b-19e6-eb36-c5f94850d764@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.0 (3.38.0-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2020-09-17 at 15:24 +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/17/20 3:02 PM, Barnabás Pőcze wrote:
> > Hi
> > 
> > 
> > 2020. szeptember 17., csütörtök 13:22 keltezéssel, Hans de Goede
> > írta:
> > 
> > > [...]
> > > I guess we should also add an optional lap_mode sysfs attribute
> > > to the class-device, to have all the info for the Thinkpads in
> > > one place.
> > > [...]
> > 
> > 
> > Excuse my ignorance, but why does "lap_mode" need to be here?
> > I understand the implications of it regarding performance, but
> > I think it would be more sense to export it via the hwmon (or
> > something similar) subsystem? What am I missing?
> 
> Well hwmon has very clearly defined sensor types, like voltage,
> fan-speed and temperature. lap_mode does not match any of them.
> 
> Also registering another-type class device just for the lap_mode
> boolean seems overkill, esp. since lap_mode is inherently coupled
> to the performance-profile stuff.

There's proximity sensors in the IIO subsystem which this could use (I
guess that was what was planned to be used, as that's how I got
involved in power-profiles-daemon).

