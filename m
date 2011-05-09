From: Colin Guthrie <gmane@colin.guthr.ie>
Subject: Re: [Regression] Problem with rfkill on 2.6.38
Date: Mon, 09 May 2011 18:09:27 +0100
Message-ID: <4DC81FC7.9040503@colin.guthr.ie>
References: <ip6j66$o5f$1@dough.gmane.org>	 (sfid-20110426_170016_050429_A6E2C01A) <1304930195.3475.17.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from brent.tribalogic.net ([78.86.109.144]:37106 "EHLO
	summit.brent.tribalogic.net" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753759Ab1EIRJa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 13:09:30 -0400
In-Reply-To: <1304930195.3475.17.camel@jlt3.sipsolutions.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Hi all,

'Twas brillig, and Johannes Berg at 09/05/11 09:36 did gyre and gimble:
> [Matthew, everybody from the platform list, please see
> http://mid.gmane.org/ip6j66$o5f$1@dough.gmane.org for the full email
> thread]
> 
> Sorry, took me a while to get back to your email.
> 
>> wifi works fine generally, but after cycling RFKILL I have to reload the
>> various modules before it works again.
> 
> 
>> [root@jimmy ~]# rmmod dell_laptop
> 
> I'm pretty sure this one's at fault, see below.

Just a quick (non-compile) followup from my last email... blacklisting
the dell-laptop module works around the issue, so I think the commit
previously mentioned is indeed the culprit (as it's the only recent
commit and does fiddle with the rfkill stuff).

Not sure what the best track forward is, but it's certainly a
regression, so should probably be fixed or reverted until a more
complete fix is found.

Cheers

Col

-- 

Colin Guthrie
gmane(at)colin.guthr.ie
http://colin.guthr.ie/

Day Job:
  Tribalogic Limited [http://www.tribalogic.net/]
Open Source:
  Mageia Contributor [http://www.mageia.org/]
  PulseAudio Hacker [http://www.pulseaudio.org/]
  Trac Hacker [http://trac.edgewall.org/]
