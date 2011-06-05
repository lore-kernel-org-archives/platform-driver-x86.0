From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Mon, 06 Jun 2011 00:21:58 +0200
Message-ID: <4DEC0186.5010209@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE93AC0.3000506@absence.it> <20110605053110.GA21142@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:40002 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756030Ab1FEWWD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 18:22:03 -0400
In-Reply-To: <20110605053110.GA21142@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>

Il 05/06/2011 07:31, Mattia Dongili ha scritto:
> To my understanding, SNC will receive GPEs in two cases under managed
> mode:
>   1. when the user request a backlight change via the standard acpi_video
>   2. when ambient light changes

Right, more in detail:

When managed mode is set to 1, automatic backlight is desired by the 
user and a userspace tool is supposed to take control of every backlight 
change, to be applied via als_backlight node (which offers a fine grain 
backlight control for smooth transitions). It will receive two different 
types of ALS events, depending on the source of the event, as you said: 
1 - ambient light change 2 - backlight change request via backlight 
device (in linux, the standard acpi_video backlight device). When either 
of the two events occurs, this software will calculate a new backlight 
level (using a model specific formula) and set it by writing in the 
als_backlight file mentioned earlier. (NOTE: this is how the hardware 
has been designed and it supposed to work even though workarounds are 
possible).

When managed mode is set to 0, no automatic backlight control is 
requested by the user and no userspace software is doing any backlight 
regulation based on the ALS readings. This implies that no ALS events 
are generated (regardless the source) and the standard ACPI  backlight 
methods (used by the acpi_video backlight device) will work properly as 
usual.

> In both cases your code sends an acpi event to userspace. Let alone the
> acpi event discussion that belongs to another thread, why aren't we
> just setting the requested brightness?

Simply because any calculation can be done in userspace, but if we can 
include the calculation stuff inside the driver, then we can get rid of 
the daemon, everything will be easier and we can avoid the als_backlight 
file too. Is it possible? The formulas are a bit complex but just a few 
lines of code, while the keyboard backlight based on the ambient light 
is just a matter of a threshold check.
