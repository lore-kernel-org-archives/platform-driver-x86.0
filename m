From: Anisse Astier <anisse@astier.eu>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Wed, 8 Jun 2011 10:52:18 +0200
Message-ID: <20110608105218.29a7e776@destiny.ordissimo>
References: <4DDE9B92.3090504@users.sourceforge.net>
	<20110527163346.GD16769@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:57051 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429Ab1FHIwf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2011 04:52:35 -0400
Received: by wwa36 with SMTP id 36so324436wwa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2011 01:52:34 -0700 (PDT)
In-Reply-To: <20110527163346.GD16769@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Alberto Mardegan <mardy@users.sourceforge.net>, platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

On Fri, 27 May 2011 17:33:46 +0100, Matthew Garrett <mjg59@srcf.ucam.org> wrote :

> On Thu, May 26, 2011 at 09:27:30PM +0300, Alberto Mardegan wrote:
> 
> > I would use this code as a starting point (kudos to Javier):
> > http://gitorious.org/iaps/lsrot/blobs/master/lsrot.c
> > The code uses the WMI interfaces to get notified of coarse orientation
> > changes.
> > But how should these changes be reported to userspace? Should they go
> > through the input subsystem (I didn't find any suitable key codes to
> > report these events), or via the /sys filesystem? In the latter case, is
> > there a convention on naming and reporting data from devices of this kind?
> 
> If we're not interested in providing continual fine-grained data then 
> the easiest approach may be to present as an input device and then just 
> send updated values whenever you receive the coarse udpate signal. But 
> you probably want to bring this up on LKML so we can make sure 
> everyone's exposing this in the same way.
> 
We already had this discussion here:
http://www.spinics.net/lists/platform-driver-x86/msg01850.html
and the conclusion was that if you need to poll the device to get the
fined grain data, and you have a separate event(was ACPI hotkey, not
WMI) for coarse orientation changes, you should send a KOBJ_CHANGE uevent
for that.

IMHO, deciding if we need or not "continual fine-grained data" is policy
and up to userspace.


--
Anisse
