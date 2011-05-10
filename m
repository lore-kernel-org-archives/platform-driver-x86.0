From: Colin Guthrie <mageia-D409yXkIzt2rnn0nCzrM/w@public.gmane.org>
Subject: Re: [Regression] Problem with rfkill on 2.6.38
Date: Tue, 10 May 2011 10:36:45 +0100
Message-ID: <4DC9072D.4030103@colin.guthr.ie>
References: <ip6j66$o5f$1@dough.gmane.org> <1304930195.3475.17.camel@jlt3.sipsolutions.net> <4DC81FC7.9040503@colin.guthr.ie> <20110509171144.GA7194@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110509171144.GA7194-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Backlund <tmb-odJJhXpcy38dnm+yROfE0A@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

'Twas brillig, and Matthew Garrett at 09/05/11 18:11 did gyre and gimble:
> On Mon, May 09, 2011 at 06:09:27PM +0100, Colin Guthrie wrote:
> 
>> Just a quick (non-compile) followup from my last email... blacklisting
>> the dell-laptop module works around the issue, so I think the commit
>> previously mentioned is indeed the culprit (as it's the only recent
>> commit and does fiddle with the rfkill stuff).
>>
>> Not sure what the best track forward is, but it's certainly a
>> regression, so should probably be fixed or reverted until a more
>> complete fix is found.
> 
> If you can confirm that with a build then I'll do that.

ACK. Reverting that commit and unblacklisting the dell_laptop module
restores the previous, working functionality. I've flipped rfkill a few
times and it's always worked fine.

Many thanks.

Col


-- 

Colin Guthrie
mageia(at)colin.guthr.ie
http://colin.guthr.ie/

Day Job:
  Tribalogic Limited [http://www.tribalogic.net/]
Open Source:
  Mageia Contributor [http://www.mageia.org/]
  PulseAudio Hacker [http://www.pulseaudio.org/]
  Trac Hacker [http://trac.edgewall.org/]
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
