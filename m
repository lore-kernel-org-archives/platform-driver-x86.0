From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH] thinkpad-acpi: Enable microphone mute LED
Date: Fri, 27 May 2011 12:39:10 -0400
Message-ID: <BANLkTint5_Vcm5rWKHL_j5XsVmcAu8X7pw@mail.gmail.com>
References: <8dc2b2140c2794291811cd38f51f9dc7596f482c.1306266017.git.luto@mit.edu>
 <20110527162844.GA16769@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:55584 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078Ab1E0Qja (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 12:39:30 -0400
Received: by pxi2 with SMTP id 2so1355853pxi.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 May 2011 09:39:30 -0700 (PDT)
In-Reply-To: <20110527162844.GA16769@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, May 27, 2011 at 12:28 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Tue, May 24, 2011 at 03:41:02PM -0400, Andy Lutomirski wrote:
>> I don't know exactly which models have this LED or how to identify
>> them in the quirk table, so I just enabled it for all unquirked
>> Lenovo models.
>
> Is there any chance that this is meant to be controlled via ALSA, in a
> similar way to the mute LED?

I don't have docs so I don't really know.  But the mute LED does not
appear to be controllable from the LED interface and when mute is lit
there's no sound regardless of what ALSA thinks.  When I light the
micmute light, I can still record sound just fine.

The mic mute button does nothing on Windows unless the special driver
is installed, and that driver seems to mute the Windows mixer, so I
think there's nothing special other than a little userspace helper
going on.

--Andy

>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>
