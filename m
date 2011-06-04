From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Sat, 4 Jun 2011 13:44:48 +0100
Message-ID: <20110604124448.GB14809@srcf.ucam.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9012E.5040207@absence.it>
 <20110604080717.GC7194@kamineko.org>
 <4DEA0C27.1000508@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DEA0C27.1000508-YK5v5TwyeXionA0d6jMUrA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Chiappero <marco-YK5v5TwyeXionA0d6jMUrA@public.gmane.org>
Cc: Mattia Dongili <malattia-k2GhghHVRtY@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 04, 2011 at 12:42:47PM +0200, Marco Chiappero wrote:

> As far as I know this event should be forwarded and the rfkill-input
> code removed as soon as there is enough userspace support. Another
> platform driver (thinkpad_acpi) is using it.
> What is right and what is wrong? Should it be removed from
> thinkpad_acpi too?

This event should be sent if hitting the switch is a request to 
userspace. If pressing it causes the hardware to perform the change and 
this is merely a notification that the change has been made, it 
shouldn't be sent. Just update the rfkill state and let userspace notice 
the uevents from rfkill.

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
