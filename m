From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Wed, 8 Jun 2011 01:24:14 +0900
Message-ID: <20110607162413.GC4087@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9012E.5040207@absence.it>
 <20110604080717.GC7194@kamineko.org>
 <4DEA4D67.8000009@absence.it>
 <20110604164021.GA12552@kamineko.org>
 <4DEA644D.3030109@absence.it>
 <20110605222401.GA26835@kamineko.org>
 <4DECD592.6000707@absence.it>
 <20110607142332.GA4087@kamineko.org>
 <4DEE4094.8040300@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:43762 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754481Ab1FGQYY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 12:24:24 -0400
Received: by eyx24 with SMTP id 24so1790681eyx.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2011 09:24:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DEE4094.8040300@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Tue, Jun 07, 2011 at 05:15:32PM +0200, Marco Chiappero wrote:
> Il 07/06/2011 16:23, Mattia Dongili ha scritto:
...
> >lovely, does it make any difference if udev maps those keys and the
> >driver instead just sends FN_F* making old and new models send the same
> >keycodes and scancodes?
> 
> Models equipped with the SNC device are already using the same
> scancodes, there is no need to translate them twice.

having the translation layer makes them consistent with all the other
hotkeys on all vaios.

> > you're a bit too optimistic here but well...
> 
> Maybe, but I don't think that Sony wants to deal with model specific
> layouts under Windows as well (in fact it seems to me that is
> shipping the same base software on every model).

one would hope so.

-- 
mattia
:wq!
