From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] dell-wmi: Update code for processing WMI events
Date: Tue, 11 Nov 2014 12:43:41 -0800
Message-ID: <20141111204341.GA13729@vmdeb7>
References: <20141111060243.GC56947@vmdeb7>
 <1415733682-8699-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33586 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbaKKUnn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Nov 2014 15:43:43 -0500
Content-Disposition: inline
In-Reply-To: <1415733682-8699-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Tue, Nov 11, 2014 at 08:21:22PM +0100, Pali Roh=E1r wrote:
> WMI buffer can contains more events. First value in buffer is length =
of event
> followed by data of specified length. After that is next length and n=
ext data.
> When length is zero then there is no more events in bufffer.
>=20
> This patch adds support for processing all events in buffer (not only=
 first)
> and parse more event types (not only hotkey events). Because of varia=
ble length
> of events sometimes BIOS fills more hotkeys (or other values) into si=
ngle WMI
> event. In this case this patch process also these multiple hotkeys (a=
nd not
> only first one).
>=20
> Some event types are just ignored because kernel is not interested fo=
r them
> (e.g. NIC Link status, battery unplug, ...).
>=20
> This patch is based on DSDT table from Dell Latitude E6440. Code shou=
ld be
> backward compatible so will process other events of old types same as=
 before
> this patch.
>=20
> This patch also fixes problem when in kernel log are written messages=
 about
> unknown WMI events. Now all know events are parsed and those which ar=
e not
> interesting for kernel are dropped without unknown message.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Tested-by: Pali Roh=E1r <pali.rohar@gmail.com>

Queued, thanks. I took the liberty of cleaning up the commit message ju=
st a bit:

    dell-wmi: Update code for processing WMI events

    The WMI buffer can contain multiple events. First value in buffer i=
s
    length of event followed by data of specified length. After that is=
 next
    length and next data.  When length is zero then there is no more ev=
ents
    in bufffer.

    This patch adds support for processing all events in buffer (not on=
ly
    first) and parse more event types (not only hotkey events). Because=
 of
    variable length of events sometimes BIOS fills more hotkeys (or oth=
er
    values) into single WMI event. In this case this patch also process=
es
    these multiple hotkeys (and not only first one).

    Some event types are just ignored because kernel is not interested =
in
    them (e.g. NIC Link status, battery unplug, ...).

    This patch is based on DSDT table from Dell Latitude E6440. Code sh=
ould
    be backward compatible so will process other events of old types sa=
me as
    before this patch.

    This patch also fixes a problem with unknown WMI event messages bei=
ng
    written to the log. Now all known events are parsed and those which=
 are
    not interesting to the kernel are dropped without an unknown WMI ev=
ent
    message.

    Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
    Tested-by: Pali Roh=E1r <pali.rohar@gmail.com>
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
