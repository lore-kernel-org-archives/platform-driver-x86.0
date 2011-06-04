From: Mattia Dongili <malattia-k2GhghHVRtY@public.gmane.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Sun, 5 Jun 2011 01:40:22 +0900
Message-ID: <20110604164021.GA12552@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9012E.5040207@absence.it>
 <20110604080717.GC7194@kamineko.org>
 <4DEA4D67.8000009@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DEA4D67.8000009-YK5v5TwyeXionA0d6jMUrA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Chiappero <marco-YK5v5TwyeXionA0d6jMUrA@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 04, 2011 at 05:21:11PM +0200, Marco Chiappero wrote:
> Il 04/06/2011 10:07, Mattia Dongili ha scritto:
> >>of Fn combos too.
> >
> >the additional key codes are fine though.
> 
> There is one thing (IIRC you already heard of) I'd like to discuss here.
> It seems that on recent models the hotkeys layout hasn't changed for
> some time now, and it's likely to stay the same for a long time.
> However it is different from the one mapped in the driver, and some
> changes are required. For example:
> 
> - Fn-F1 (Touchpad togle enable) to KEY_TOUCHPAD_TOGGLE instead of KEY_FN_F1
> - Fn-F5 (bright. down) to KEY_BRIGHTNESSDOWN instead of KEY_FN_F5
> - Fn-F9 (zoom out) to KEY_ZOOMOUT instead of KEY_FN_F9
> and so on.
> 
> To preserve support for older models we can use udev keymaps or a
> fallback map for any notebook not starting with the "VPC" model
> prefix (since a couple of years this is the starting model string).
> Is this solution acceptable? Having a correct mapping at the source
> instead of remapping for every model is better, is it possible?

sure it's possible but it's going to be a source of headache once sony
changes their keyboard layout again (and it will happen).
Using generic key codes and remapping them in userspace where necessary
worked for more than 10 years and is still working fine.

-- 
mattia
:wq!
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
