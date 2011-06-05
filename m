From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 10/25] sony-laptop: keyboard backlight support extended
 to newer Vaios
Date: Mon, 6 Jun 2011 07:33:01 +0900
Message-ID: <20110605223300.GB26835@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9008D.7040504@absence.it>
 <20110604075815.GA7194@kamineko.org>
 <4DEA0954.6030709@absence.it>
 <20110604112358.GA11241@kamineko.org>
 <4DEA19EF.3000804@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63811 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756247Ab1FEWdF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 18:33:05 -0400
Received: by pzk9 with SMTP id 9so1579966pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jun 2011 15:33:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DEA19EF.3000804@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Sat, Jun 04, 2011 at 01:41:35PM +0200, Marco Chiappero wrote:
> Il 04/06/2011 13:23, Mattia Dongili ha scritto:
> >>Just for safety, since handle 0x0000 is a valid handle [1] it would
> >>be better to initialize it to an invalid value.
> >
> >0x0 is not valid, it's just the lack of a value.
> 
> But you can use it. "Just for safety" we'd better set to an invalid
> value that cannot be used by the acpi methods.
> 
> >>[1]
> >>sony_laptop: found handle 0x0000 (offset: 0x0d)
> >>sony_laptop: called SN07 with 0x000d (result: 0x0000)
> >
> >this is only going through the handles buffer and telling you that at
> >0x0d there is nothing.
> 
> the calling code:
> 
> ret = sony_call_snc_handle(0, 0, &result);
> 
> it returns 0.

this is easily fixed and should be fixed since 0x0 is not a valid
handle.

> sony_find_snc_handle should return -1 when called with handle == -1, right?
-- 
mattia
:wq!
