From: Darren Hart <dvhart@infradead.org>
Subject: ASUS g752VS Bugs
Date: Tue, 4 Apr 2017 16:34:19 -0700
Message-ID: <20170404233419.GA32193@fury>
References: <bug-195027-5380@https.bugzilla.kernel.org/>
 <bug-195027-5380-w9RpRinDBI@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59610 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751986AbdDDXeV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 19:34:21 -0400
Content-Disposition: inline
In-Reply-To: <bug-195027-5380-w9RpRinDBI@https.bugzilla.kernel.org/>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Corentin,

We have a few bugs open for the Asus G752VS about hotkeys, keyboard backlight,
and touchpad issues. The one that caught my attention listed first below. I
thought this might have been an easy DMI entry to the asus-nb-wmi driver, but
it's starting to look like it might be issues with hid-asus.c, with ongoing work
here:

https://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git/commit/?h=for-4.12/asus&id=0485b1ec280cb9b2b6ed6e44e999294b4c698182

Relevant bugs:
https://bugzilla.kernel.org/show_bug.cgi?id=195027
https://bugzilla.kernel.org/show_bug.cgi?id=191651
https://bugzilla.kernel.org/show_bug.cgi?id=112531

I'd like your take on this, first of all.

Second of all, it would be helpful to have some instrumentation and, though I
hate to say it, user configurable parameters to force quirks for those scenarios
when all we need to do is add a DMI entry - like we have with wapf=4, but for
other common quirks (if there are any anymore - maybe it's moving to drivers
like hid-asus and we don't need to worry about it anymore).

-- 
Darren Hart
VMware Open Source Technology Center
