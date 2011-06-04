From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Sat, 4 Jun 2011 20:23:59 +0900
Message-ID: <20110604112358.GA11241@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9008D.7040504@absence.it>
 <20110604075815.GA7194@kamineko.org>
 <4DEA0954.6030709@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:53377 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754724Ab1FDLX5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Jun 2011 07:23:57 -0400
Received: by pwi15 with SMTP id 15so1370883pwi.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jun 2011 04:23:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DEA0954.6030709@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Sat, Jun 04, 2011 at 12:30:44PM +0200, Marco Chiappero wrote:
> Il 04/06/2011 09:58, Mattia Dongili wrote:
...
> >>  static struct kbd_backlight *kbdbl_handle;
> >>+static int sony_kbd_handle = -1;
> >
> >there seems to be no real point initializing this to -1.
> 
> Just for safety, since handle 0x0000 is a valid handle [1] it would
> be better to initialize it to an invalid value.

0x0 is not valid, it's just the lack of a value. For sure it's not a
valid value for the keyboard backlight handle.

...
> [1]
> sony_laptop: found handle 0x0000 (offset: 0x0d)
> sony_laptop: called SN07 with 0x000d (result: 0x0000)

this is only going through the handles buffer and telling you that at
0x0d there is nothing.

-- 
mattia
:wq!
