From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Mon, 27 Jun 2016 22:10:10 +0930
Message-ID: <20160627124010.GA1544@marvin.atrad.com.au>
References: <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
 <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
 <576D5523.7030309@fbihome.de>
 <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
 <20160625085052.GA5137@marvin.atrad.com.au>
 <20160625091522.GA6423@eudyptula.hq.kempniu.pl>
 <5770E484.4030009@fbihome.de>
 <20160627111655.GA2438@eudyptula.hq.kempniu.pl>
 <57711099.1020802@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:54299 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbcF0Mkc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jun 2016 08:40:32 -0400
Content-Disposition: inline
In-Reply-To: <57711099.1020802@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

On Mon, Jun 27, 2016 at 01:40:09PM +0200, Jan-Marek Glogowski wrote:
> Am 27.06.2016 um 13:16 schrieb Micha?? K??pie??:
> >>> Are you referring to the "touchpad toggle" key?  If you are, I will soon
> >>> post a patch adding support for this key so that Jan-Marek can test it.
> >>> I just need to find some time to actually write it.
> >>
> >> This needs a small patch. But getting the keycode into X11 seems to be
> >> impossible, as X / xev can't handle keycodes > 255 (KEY_TOUCHPAD_TOGGLE).
> >>
> >> I'm currently running evrouter, to call a script on the event, which
> >> dis-/enables the input device using xinput.
> > 
> > So does my patch work after the set_bit() you suggested is added?  You
> > have not explicitly stated that, so I can only guess it works.
> 
> Yup - it works.
> 
> Should I add a Tested-by to the merged version?

To keep everything clear it would be best if a fresh patch were submitted
which included the fix and addressed a comment I'll write in a minute.  Add
Tested-by to that and we can take it from there.

Regards
  jonathan
