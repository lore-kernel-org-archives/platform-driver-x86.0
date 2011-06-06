From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Mon, 06 Jun 2011 15:51:46 +0200
Message-ID: <4DECDB72.9050909@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE93AC0.3000506@absence.it> <20110605053110.GA21142@kamineko.org> <4DEC0186.5010209@absence.it> <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com> <20110606130802.GB30602@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:59303 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164Ab1FFNvt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 09:51:49 -0400
In-Reply-To: <20110606130802.GB30602@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 06/06/2011 15:08, Mattia Dongili ha scritto:
> i.e. would it work if you always enable managed mode to receive the
> ambient light events and just let userpace react for automatic dimming?
> Also, userspace will intercept key-presses and scale the user
> requested brightness change to an appropriate value using the current
> lux values.

sony-acpid is already doing this without listening for key events (we 
can do that but we miss any other different backlight correction otherwise).

> At this point you could have a generic software (modulo the not yet
> standardized als interface) handling any laptop that has these simpler
> features.

The small big issue is that not every notebook use the same LCD panel, 
so, in theory, different calculations are required (and this also the 
reason why a model specific parameter list is also provided by every 
Vaio notebook too). A single suboptimal formula for everybody is not 
likely to provide satisfactory results.

> the question was why sending a "user requested to change
> brightness"-event instead of setting the brightness. The calculation
> should be done in userspace

...taking into account both the current user/power_saving_sofware/etc. 
backlight correction level and the ambient light level. We need to 
forward both informations to userspace otherwise no calculation is possible.
