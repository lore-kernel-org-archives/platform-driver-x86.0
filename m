From: "Javier S. Pedro" <maemo@javispedro.com>
Subject: Re: Looking for some pointers on WMI/EC access
Date: Wed, 1 Dec 2010 21:13:51 +0100
Message-ID: <AANLkTinRS_3vjoWDYVtY3eKbOhFSPDpWJ5YgjGtByDQC@mail.gmail.com>
References: <AANLkTimfj1QEqXWOp-Rc2KJZ6XdstkB_ct+P0zuQxVCa@mail.gmail.com>
	<20101201013125.GA21225@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59887 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756882Ab0LAUNw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Dec 2010 15:13:52 -0500
Received: by iwn42 with SMTP id 42so6357iwn.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Dec 2010 12:13:51 -0800 (PST)
In-Reply-To: <20101201013125.GA21225@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, floe@butterbrot.org

2010/12/1 Matthew Garrett <mjg59@srcf.ucam.org>:
> Excellent! Send a driver and I'll get it merged.

Note that I have read the iasl -d'd DSDT myself, so I ponder if that
forbids me from writing the module (due to unclean room and all that);
either way, here's the source of the test module I used [1].

Only available are the front keys -- with the rotation one not being
fired when not in "tablet mode" (the EC event is not fired, seemingly)
--  and also "tablet mode" detection, mapped of course to
SW_TABLET_MODE.
There's also some kind of orientation detection events that I'm yet to
fully understand but seem nearly useless. I would very much prefer to
read the raw accelerometer values from EC or HDAPS.

Also: should this be a separate "lenovo-wmi" driver or integrated with
lenovo-laptop?

[1] http://gitorious.org/iaps/lsrot/blobs/master/lsrot.c
