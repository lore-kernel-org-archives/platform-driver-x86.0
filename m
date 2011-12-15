From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] asus-wmi: explicitly set the wireless
	LED
Date: Thu, 15 Dec 2011 09:22:20 +0100
Message-ID: <1323937340.3337.3.camel@jlt3.sipsolutions.net>
References: <1323244922-2673-1-git-send-email-kengyu@canonical.com>
	<CAHR064iBtSTv79BhXt9_mMWugD4U_xLCM4i1wE7PLnZM8pL57g@mail.gmail.com>
	(sfid-20111215_080747_060859_05239F9D)
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHR064iBtSTv79BhXt9_mMWugD4U_xLCM4i1wE7PLnZM8pL57g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(sfid-20111215_080747_060859_05239F9D)
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard, Keng-Yu Lin <kengyu-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2011-12-15 at 08:07 +0100, Corentin Chary wrote:

> Anyway, you should use a led trigger for that, ideally the rfkill%d
> led trigger, but for that you need the rfkill idx, which is not
> exported, so you may need a new rfkill_idx() function. CCing rfkill
> and led guys, they may have a better advice on that.

Since you wouldn't want to build the string yourself, you'd probably
want a new rfkill_ledtrigname() function like this:

static const char *rfkill_ledtrigname(struct rfkill *rfkill)
{
#ifdef CONFIG_RFKILL_LEDS
	return rfkill->ledtrigname;
#endif
	return NULL;
}

which you use to assign the LED class device's default trigger.

johannes


------------------------------------------------------------------------------
10 Tips for Better Server Consolidation
Server virtualization is being driven by many needs.  
But none more important than the need to reduce IT complexity 
while improving strategic productivity.  Learn More! 
http://www.accelacomm.com/jaw/sdnl/114/51507609/
