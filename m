From: Marco Chiappero <marco-YK5v5TwyeXionA0d6jMUrA@public.gmane.org>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Sat, 04 Jun 2011 18:58:53 +0200
Message-ID: <4DEA644D.3030109@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA4D67.8000009@absence.it> <20110604164021.GA12552@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110604164021.GA12552-pM3i+3kAS8Rg9hUCZPvPmw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mattia Dongili <malattia-k2GhghHVRtY@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Il 04/06/2011 18:40, Mattia Dongili ha scritto:
> sure it's possible but it's going to be a source of headache once sony
> changes their keyboard layout again (and it will happen).

Well, it depends on when, if it will happen in 2020 that's absolutely 
fine. ;)

> Using generic key codes and remapping them in userspace where necessary
> worked for more than 10 years and is still working fine.

Sure and I consider to be a good alternative, but it looks to me like 
being another workaround, it is fine for particular exceptions that need 
a few remappings, but it should not be the rule, the driver extension. 
That's why I was asking about this change.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
