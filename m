From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [Regression] Problem with rfkill on 2.6.38
Date: Tue, 10 May 2011 16:48:57 +0200
Message-ID: <BANLkTinVwnSei_VobfKtgzrwSP+cJSvxaQ@mail.gmail.com>
References: <ip6j66$o5f$1@dough.gmane.org> <1304930195.3475.17.camel@jlt3.sipsolutions.net>
 <4DC81FC7.9040503@colin.guthr.ie> <20110509171144.GA7194@srcf.ucam.org> <4DC9072D.4030103@colin.guthr.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DC9072D.4030103-D409yXkIzt2rnn0nCzrM/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Guthrie <mageia-D409yXkIzt2rnn0nCzrM/w@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Backlund <tmb-odJJhXpcy38dnm+yROfE0A@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 10, 2011 at 11:36 AM, Colin Guthrie <mageia-D409yXkIzt2rnn0nCzrM/w@public.gmane.org> wrote:
> 'Twas brillig, and Matthew Garrett at 09/05/11 18:11 did gyre and gimble:
>> On Mon, May 09, 2011 at 06:09:27PM +0100, Colin Guthrie wrote:
>>
>>> Just a quick (non-compile) followup from my last email... blacklisting
>>> the dell-laptop module works around the issue, so I think the commit
>>> previously mentioned is indeed the culprit (as it's the only recent
>>> commit and does fiddle with the rfkill stuff).
>>>
>>> Not sure what the best track forward is, but it's certainly a
>>> regression, so should probably be fixed or reverted until a more
>>> complete fix is found.
>>
>> If you can confirm that with a build then I'll do that.
>
> ACK. Reverting that commit and unblacklisting the dell_laptop module
> restores the previous, working functionality. I've flipped rfkill a few
> times and it's always worked fine.
>

May I have the model of your Dell laptop?

dell_latop has a debugfs node in /sys/kernel/debug/dell_latop/rfkill,
can you attach the logs at both the moment when the radio devices are
enabled and disabled? the output of the command `rfkill list` at both
moments will helpful too.

In my experience that different models of Dell laptop may have
different reaction/behaviour on the rfkill handling. Reverting the
patch may make your laptop working, but can cause others non-working.

It should make sense and be appreciated that you attach more debug
information for investigation on the bug.

  Thanks,
-kengyu
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
