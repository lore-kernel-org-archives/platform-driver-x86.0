From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 00/10] dell-laptop: Bring back (limited) rfkill support
Date: Sat, 28 Sep 2013 21:26:29 +0200
Message-ID: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:3083 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754694Ab3I1T0p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Sep 2013 15:26:45 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Hi Matthew et al,

As the subject already says this patch-set intends to bring back (and fixup)
dell-laptop rfkill support.

I know this was killed with a good reason, still I want to bring it back.

I've 3 different Latitudes in use in my home, spanning 6 generations of
Latitudes, and without dell-laptop rfkill support these have the following
issues:

1) If the hardware radio switch is set to disable the radio, then userspace 
will still think it can use wireless and bluetooth, this sometimes greatly
confuses other users (wife and children) of these laptops.

2) The wwan / 3g modem in one of them cannot be disabled

3) When turning off bluetooth or wife in the UI, the status leds on the
laptop for these will stay on

Now this may not seem like big issues, but with these fixed the overall user
experience of the laptop when there is a need to disable radios just feels much
better.

AFAIK the rfkill functionality was removed from the dell-laptop driver because
it caused more problems then it fixed, and the blacklist for it was growing out
of control.

But in the thread discussing this Dell mentioned that they only QA the rfkill
acpi interface on Latitudes and indeed there have been no blacklist entries  
for Latitudes. This combined with me owning a bunch of Latitudes has lead to
this patchset, which brings back rfkill functionality, but for Latitudes only,
getting rid of the blacklist.

Note that only limiting the support to Latitudes is not enough to get rid of
all the rough edges of the rfkill support. Because the driver itself has some
issues / bad interactions with the firmware too.

I've spend the last 2 days doing a lot of testing on 3 different Latitudes,
a D620, E6400 and E6430, and this has resulted in a bunch of fixes to the
rfkill support, hence this patch-set has 10 patches total.

I've tested the final result of the patch set on all 3 models in various
different circumstances, booting with the hwswitch on / off, suspend/resume,
changing hwswitch state during suspend in either direction, etc.

This now all works flawless on the Latitude series, therefor I'm confident
that bringing back rfkill support for Latitudes only should not cause any
issues.

Moreover I'm willing to put my time where my mouth is and I'm willing
to maintain the rfkill portion of the driver, deal with any bugreports, etc.



Open questions:

1) Should we maybe also bring back rfkill for Vostros ? Looking at the blacklist
and mailinglist archives it seems that all models with issues were Inspirons.

I honestly don't know what the best answer to this question is, one option
would be adding a module option which allows by-passing the Latitude check
and to gather feedback, then decide based on that.

2) Should we maybe limit support to models with a hw kill switch ? One big
difference between Latitudes/Vostros and Inspirons is that the former tend
to have a hw kill switch, where as the later uses a keyboard combo which gets
intercepted by the firmware to toggle the radio, and the latter seems to be
where most of the troubles are. More over my own testbed only has machines
with a hw kill switch (there are some older Latitude models which lack a
hardware switch).

I tend towards limiting support to only models with a hardware switch,
with an option to override this check using a module option.

Regards,

Hans
