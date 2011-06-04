From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Sat, 4 Jun 2011 16:09:22 +0900
Message-ID: <20110604070921.GA5132@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <201106031400.36141.dmitry.torokhov@gmail.com>
 <4DE9563F.9010503@absence.it>
 <201106031512.38349.dmitry.torokhov@gmail.com>
 <4DE9904E.7050805@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33174 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118Ab1FDHJQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 03:09:16 -0400
Received: by pwi15 with SMTP id 15so1315435pwi.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jun 2011 00:09:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE9904E.7050805@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Sat, Jun 04, 2011 at 03:54:22AM +0200, Marco Chiappero wrote:
> Il 04/06/2011 00:12, Dmitry Torokhov ha scritto:
...
> >What is the feature again? What do users really want to do here?
> 
> Have their touchpad disabled, and have it disabled when using either
> windows or linux. That's what the user payed for.
> Discussing what the user should be interested in, whether a real
> power saving is achievable or not, is a totally wrong starting
> point, it's not your own business.

the point is that disabling the touchpad is already possible via a
common interface already, if there is any additional win in implementing
the switch in sony-laptop then it's worth using this sony-specific
quirks otherwise it's totally pointless.

Something that may be worth considering though is if switching the
touchpad off in Windows survives a hot/cold reboot. We may want to
re-enable it under Linux if that is the case.

For the rest I totally agree with Dmitry and I'd rather not see this
patch applied unless there is an actual advantage in having the feature.
-- 
mattia
:wq!
