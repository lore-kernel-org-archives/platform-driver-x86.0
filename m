From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Mon, 13 Jun 2011 07:24:45 +0900
Message-ID: <20110612222444.GC31095@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9008D.7040504@absence.it>
 <20110604075815.GA7194@kamineko.org>
 <4DF20EB6.2080803@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:45801 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753779Ab1FLWYr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2011 18:24:47 -0400
Received: by pzk9 with SMTP id 9so1885701pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2011 15:24:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DF20EB6.2080803@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Fri, Jun 10, 2011 at 02:31:50PM +0200, Marco Chiappero wrote:
> Il 04/06/2011 09:58, Mattia Dongili ha scritto:
> 
> >>  struct kbd_backlight {
> >>-	int mode;
> >>-	int timeout;
> >>+	unsigned int base;
> >>+	unsigned int mode;
> >>+	unsigned int timeout;
> >>  	struct device_attribute mode_attr;
> >>  	struct device_attribute timeout_attr;
> >>  };
> >>-
> >>  static struct kbd_backlight *kbdbl_handle;
> >>+static int sony_kbd_handle = -1;
> >
> >there seems to be no real point initializing this to -1. Also, can it be
> >made part of the struct above?
> 
> I'm including these two changes in every patch that provides a new
> capability using different handles.
> I need some more time to prepare the new patches, but before
> resending I'd like to hear some more feedbacks: removing any acpi
> notification in patch #8, do patches from 1 to 9 look fine? Is it
> possible to merge them, as they are, as soon as I repost them? If

potentially, if they seem safe yes. I'd rather review what you have than
a stale version that you're already changing so please send the patches
over and then we'll see.

> some changes are required please let me know. I've also posted a
> patch fixing the "0x0" handle issue ("fix potential improper handle
> usage"), I suppose it to be okay, can I include it in my original
> source file before creating the patches? Or should I include that
> patch in the patchset instead?

either way, that patch is not compulsory for any of the functionalities
you posted.

-- 
mattia
:wq!
