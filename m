From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Looking for some pointers on WMI/EC access
Date: Wed, 1 Dec 2010 20:19:39 +0000
Message-ID: <20101201201939.GA13106@srcf.ucam.org>
References: <AANLkTimfj1QEqXWOp-Rc2KJZ6XdstkB_ct+P0zuQxVCa@mail.gmail.com> <20101201013125.GA21225@srcf.ucam.org> <AANLkTinRS_3vjoWDYVtY3eKbOhFSPDpWJ5YgjGtByDQC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33186 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755632Ab0LAUTm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Dec 2010 15:19:42 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTinRS_3vjoWDYVtY3eKbOhFSPDpWJ5YgjGtByDQC@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Javier S. Pedro" <maemo@javispedro.com>
Cc: platform-driver-x86@vger.kernel.org, floe@butterbrot.org

On Wed, Dec 01, 2010 at 09:13:51PM +0100, Javier S. Pedro wrote:
> 2010/12/1 Matthew Garrett <mjg59@srcf.ucam.org>:
> > Excellent! Send a driver and I'll get it merged.
> 
> Note that I have read the iasl -d'd DSDT myself, so I ponder if that
> forbids me from writing the module (due to unclean room and all that);
> either way, here's the source of the test module I used [1].

We've never really worried about tainting from ACPI - you're writing coe 
that interfaces with that rather than copying any of their code, so it 
should be fine.

> Only available are the front keys -- with the rotation one not being
> fired when not in "tablet mode" (the EC event is not fired, seemingly)
> --  and also "tablet mode" detection, mapped of course to
> SW_TABLET_MODE.
> There's also some kind of orientation detection events that I'm yet to
> fully understand but seem nearly useless. I would very much prefer to
> read the raw accelerometer values from EC or HDAPS.

Ok.

> Also: should this be a separate "lenovo-wmi" driver or integrated with
> lenovo-laptop?

I'd go with lenovo-wmi.

> [1] http://gitorious.org/iaps/lsrot/blobs/master/lsrot.c

Wonderful. I'll take a look.

Thanks!
-- 
Matthew Garrett | mjg59@srcf.ucam.org
