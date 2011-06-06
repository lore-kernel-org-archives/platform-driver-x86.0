From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Tue, 7 Jun 2011 07:24:06 +0900
Message-ID: <20110606222405.GA32602@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE93AC0.3000506@absence.it>
 <20110605053110.GA21142@kamineko.org>
 <4DEC0186.5010209@absence.it>
 <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
 <20110606130802.GB30602@kamineko.org>
 <4DECDB72.9050909@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:65495 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751912Ab1FFWYM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 18:24:12 -0400
Received: by pwi15 with SMTP id 15so2361186pwi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2011 15:24:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DECDB72.9050909@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 06, 2011 at 03:51:46PM +0200, Marco Chiappero wrote:
> Il 06/06/2011 15:08, Mattia Dongili ha scritto:
> >i.e. would it work if you always enable managed mode to receive the
> >ambient light events and just let userpace react for automatic dimming?
> >Also, userspace will intercept key-presses and scale the user
> >requested brightness change to an appropriate value using the current
> >lux values.
> 
> sony-acpid is already doing this without listening for key events
> (we can do that but we miss any other different backlight correction
> otherwise).

how many sources of backlight changes do you have? A system should have
only one application trying to control the backlight, having more than
one is asking for trouble in the first place.
Also, if I echo a number to /sys/... directly I would expect that to be
applied no matter what and without any magic correction going on.

> >At this point you could have a generic software (modulo the not yet
> >standardized als interface) handling any laptop that has these simpler
> >features.
> 
> The small big issue is that not every notebook use the same LCD
> panel, so, in theory, different calculations are required (and this
> also the reason why a model specific parameter list is also provided
> by every Vaio notebook too). A single suboptimal formula for
> everybody is not likely to provide satisfactory results.

this is something else that should be thought of presenting in a unified
way to userspace. The entire idea of platform drivers is to enable and
unify how platform specific features are handled. Having each one of
them diverge to its own custom interface defeats the whole purpose.

> >the question was why sending a "user requested to change
> >brightness"-event instead of setting the brightness. The calculation
> >should be done in userspace
> 
> ...taking into account both the current
> user/power_saving_sofware/etc. backlight correction level and the
> ambient light level. We need to forward both informations to
> userspace otherwise no calculation is possible.

the backlight change request is initiated in userspace already, why do
you need to tell userspace that it generated a backlight change request?

So again, can you split the patch in two so that we have the driver in
one patch and the interaction/integration part in another?

Thanks
-- 
mattia
:wq!
