From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Wed, 20 Jul 2011 06:26:02 +0900
Message-ID: <20110719212601.GA16532@kamineko.org>
References: <4DEA4D67.8000009@absence.it>
 <20110604164021.GA12552@kamineko.org>
 <4DEA644D.3030109@absence.it>
 <20110605222401.GA26835@kamineko.org>
 <4DECD592.6000707@absence.it>
 <20110607142332.GA4087@kamineko.org>
 <4DEE4094.8040300@absence.it>
 <20110607162413.GC4087@kamineko.org>
 <4DEE66F5.1020406@absence.it>
 <4DFF50DB.30100@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:53207 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073Ab1GSVZd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jul 2011 17:25:33 -0400
Received: by pzk3 with SMTP id 3so5464366pzk.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2011 14:25:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DFF50DB.30100@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 20, 2011 at 03:53:31PM +0200, Marco Chiappero wrote:
> Il 07/06/2011 19:59, Marco Chiappero ha scritto:
> >Il 07/06/2011 18:24, Mattia Dongili ha scritto:
> >>On Tue, Jun 07, 2011 at 05:15:32PM +0200, Marco Chiappero wrote:
> >>>Il 07/06/2011 16:23, Mattia Dongili ha scritto:
> >>...
> >>>>lovely, does it make any difference if udev maps those keys and the
> >>>>driver instead just sends FN_F* making old and new models send the same
> >>>>keycodes and scancodes?
> >>>
> >>>Models equipped with the SNC device are already using the same
> >>>scancodes, there is no need to translate them twice.
> >>
> >>having the translation layer makes them consistent with all the other
> >>hotkeys on all vaios.
> >
> >In this case I can't see how consistency is relevant (especially if we
> >think that it's a nonexistent layout!). Moreover every SNC equipped
> >notebooks use the same map while SPIC related code is going to be
> >deprecated.
> 
> Mattia, what is your final decision about this topic? Would you like
> to maintain the KEY_FN_F* mapping?

yes, there is no need to change them now.
-- 
mattia
:wq!
