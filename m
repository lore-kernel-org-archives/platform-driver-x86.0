From: Andy Ross <andy.ross@windriver.com>
Subject: [PATCH 0/4] asus-laptop: Pegatron Lucid (WeTab/ExoPC) support
Date: Thu, 24 Mar 2011 15:02:06 -0700
Message-ID: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:44866 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757294Ab1CXWIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 18:08:39 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Accelerometer and ambient light sensor drivers for the Pegatron Lucid
(sold as WeTab and ExoPC) tablet PC.

This was submitted a while back, but got dropped before merge as we
were distracted by other projects.  The last change requested was to
fold the accelerometer driver into asus-laptop, which has been done
here.

Unfortunately there is one new wart: doing so causes initialization to
occur earlier, and we were seeing common panics underneath ACPI
initialization.  So I moved the accelerometer initialization out of
the ACPI startup call tree and into a separate platform driver (as it
was earlier when it was a separate module), which helped some.  But
occasional panics persisted, which I eventually tracked down to the
very first accelerometer reads.

Faking this initial report (which I *think* is being requested out of
the input polldev layer, not userspace) resulted in stable behavior.
This code has been running on a bunch of development systems for
several months now, so I feel as comfortable with the voodoo as I
think I can.
