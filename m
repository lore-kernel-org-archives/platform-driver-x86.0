From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 0/25] sony-laptop: code improvements and support
 extension for newer Vaios
Date: Sat, 4 Jun 2011 17:54:31 +0900
Message-ID: <20110604085431.GF7194@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52778 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab1FDIy3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 04:54:29 -0400
Received: by pzk9 with SMTP id 9so1136482pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jun 2011 01:54:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>

On Fri, Jun 03, 2011 at 05:22:50PM +0200, Marco Chiappero wrote:
> Hello,
> 
> this set of patches aims to reorganize and clean the driver code
> where necessary [patches 1-9, 13], improve some functionalities
> [patches 10-12] and add some others present on recent Vaios (TT, Y1,
> Z1, F1, S1, SA/SB/SC, CA/SB and possibly others), such as ALS driven
> backlight control, HDD shock protection control and Battery charge
> control.
> 
> During the development of these patches a long list of new handles
> has been found and analyzed (the list can be read here:
> http://absence.it/vaio-acpi/handles_list.txt), many of them are now
> well known and mostly implemented by patches from 14 to 24.

Thanks for this. Note though that some of the clean-up code is
conflicting with other patches I have yet to submit, I'll see if it's
easier to adapt your code to mine or viceversa.

I tried to comment on some of the patchese that you submitted, those I
have yet to comment on I'll get back to later.

Regards,
-- 
mattia
:wq!
