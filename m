From: Jesper Juhl <jj@chaosbits.net>
Subject: Re: drivers/platform/x86/amilo-rfkill.c::amilo_rfkill_probe() avoid
 NULL deref
Date: Mon, 11 Jun 2012 22:36:24 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1206112231280.32000@swampdragon.chaosbits.net>
References: <1337654855.11796.8.camel@deadeye>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from swampdragon.chaosbits.net ([90.184.90.115]:26847 "EHLO
	swampdragon.chaosbits.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138Ab2FKUg0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jun 2012 16:36:26 -0400
In-Reply-To: <1337654855.11796.8.camel@deadeye>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: platform-driver-x86@vger.kernel.org

On Tue, 22 May 2012, Ben Hutchings wrote:

> I don't understand this change:
> 
> commit 41603e9783a24c8c7cce548c0819bdc9e46a585b
> Author: Jesper Juhl <jj@chaosbits.net>
> Date:   Fri Mar 23 01:08:34 2012 +0100
> 
>     drivers/platform/x86/amilo-rfkill.c::amilo_rfkill_probe() avoid NULL deref
> 
> amilo_rfkill_init() checks that dmi_first_match() does not return NULL,
> before registering the platform driver.  So why would it return NULL
> when called by amilo_rfkill_probe()?
> 
To be completely honest - I don't (currently) know.
When I did the patch I was convinced that it made sense and that I could 
prove that - now I can't.  So I must either have been drunk or delusional 
at the time...

Seriously; I really don't know. I remember crafting the patch after 
reading some coverity reports and reading the source and thinking "this 
makes sense"... Now, when I read it again, it does not..

-- 
Jesper Juhl <jj@chaosbits.net>       http://www.chaosbits.net/
Don't top-post http://www.catb.org/jargon/html/T/top-post.html
Plain text mails only, please.
