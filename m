From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6,
 etc.
Date: Sat, 27 Nov 2010 00:36:10 -0800
Message-ID: <20101127083610.GB28745@core.coreip.homeip.net>
References: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
 <20101124223058.GA30035@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:48472 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab0K0IgR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Nov 2010 03:36:17 -0500
Received: by iwn35 with SMTP id 35so352205iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Nov 2010 00:36:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20101124223058.GA30035@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Gyorgy Jeney <nog.lkml@gmail.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Thu, Nov 25, 2010 at 07:30:58AM +0900, Mattia Dongili wrote:
> On Wed, Nov 24, 2010 at 07:22:55PM +0100, Gyorgy Jeney wrote:
> > Hello,
> > 
> > On a Sony VAIO Z12C9E, I get some messages from the kernel when
> > certain buttons are pressed:
> > 
> > "Assist" pressed: sony-laptop: Unknown event: 0x100 0xa6
> > "Assist" released: sony-laptop: Unknown event: 0x100 0x26
> > "VAIO" pressed: sony-laptop: Unknown event: 0x100 0xa5
> > "VAIO" released: sony-laptop: Unknown event: 0x100 0x25
> 
> I wonder what keycodes we should associate these to... Maybe KEY_HELP
> and KEY_SETUP?

For VAIO key another option is "KEY_VENDOR".

Thanks.

-- 
Dmitry
