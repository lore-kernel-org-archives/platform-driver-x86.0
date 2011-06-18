From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Sat, 18 Jun 2011 13:15:39 +0900
Message-ID: <20110618041538.GA23770@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9008D.7040504@absence.it>
 <20110604075815.GA7194@kamineko.org>
 <4DF20EB6.2080803@absence.it>
 <20110612222444.GC31095@kamineko.org>
 <4DF61E7F.7070406@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:63253 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790Ab1FREPV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Jun 2011 00:15:21 -0400
Received: by iwn34 with SMTP id 34so2501206iwn.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jun 2011 21:15:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DF61E7F.7070406@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 13, 2011 at 04:28:15PM +0200, Marco Chiappero wrote:
> Il 13/06/2011 00:24, Mattia Dongili ha scritto:
> >On Fri, Jun 10, 2011 at 02:31:50PM +0200, Marco Chiappero wrote:
> >>Il 04/06/2011 09:58, Mattia Dongili ha scritto:
> >>
> >>>>  struct kbd_backlight {
> >>>>-	int mode;
> >>>>-	int timeout;
> >>>>+	unsigned int base;
> >>>>+	unsigned int mode;
> >>>>+	unsigned int timeout;
> >>>>  	struct device_attribute mode_attr;
> >>>>  	struct device_attribute timeout_attr;
> >>>>  };
> >>>>-
> >>>>  static struct kbd_backlight *kbdbl_handle;
> >>>>+static int sony_kbd_handle = -1;
> >>>
> >>>there seems to be no real point initializing this to -1. Also, can it be
> >>>made part of the struct above?
> >>
> >>I'm including these two changes in every patch that provides a new
> >>capability using different handles.
> >>I need some more time to prepare the new patches, but before
> >>resending I'd like to hear some more feedbacks: removing any acpi
> >>notification in patch #8, do patches from 1 to 9 look fine? Is it
> >>possible to merge them, as they are, as soon as I repost them? If
> >
> >potentially, if they seem safe yes. I'd rather review what you have than
> >a stale version that you're already changing so please send the patches
> >over and then we'll see.
> 
> Ok, to avoid multiple resends, does this new naming schema look fine to you?

I'd recommend sending what you have when you think it is reviewable. I
have the time I have to review all this and having some finished work is
easier to review.

> /* Keyboard backlight feature */
> static struct sony_kbdbl_data {
> 	unsigned int handle;
> 	unsigned int base;
> 	unsigned int mode;
> 	unsigned int timeout;
> 	struct device_attribute mode_attr;
> 	struct device_attribute timeout_attr;
> } *sony_kbdbl;
> 
> 
> Another example:
> 
> static struct sony_battcare_data {
> 	unsigned int handle;
> 	struct device_attribute attrs[2];
> } *sony_battcare;
> 
> 
> I think that we might use the sony_FEATURE_device namining when we
> have multiple data regarding a physical device rather than just a
> collection of data related to a feature, so sony_kbdbl_data could be
> named sony_kbdbl_device. If you don't like the "sony" prefix, which
> is not much informative, we can change to "snc", which specifies
> that it's a SNC related feature, even though it's already clear
> enough.

I'd prefer the snc prefix to distinguish it from the spic related
features.

Thanks
-- 
mattia
:wq!
