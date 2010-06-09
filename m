From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Wed, 09 Jun 2010 20:32:59 +0200
Message-ID: <1276108379.14580.23.camel@jlt3.sipsolutions.net>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
	 <4C0F6CDF.9060608@tuffmail.co.uk>
	 <20100609181958.GA2551@barata.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from he.sipsolutions.net ([78.46.109.217]:50083 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530Ab0FISdD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 14:33:03 -0400
In-Reply-To: <20100609181958.GA2551@barata.holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, rpurdie@rpsys.net

On Wed, 2010-06-09 at 15:19 -0300, Thadeu Lima de Souza Cascardo wrote:

> > >+	ipml->rf = rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_WLAN,
> > >+				&cmpc_rfkill_ops, acpi->handle);
> > >+	/* rfkill_alloc may fail if RFKILL is disabled. We should still work
> > >+	 * anyway. */
> > >+	if (!IS_ERR(ipml->rf)) {
> > >+		retval = rfkill_register(ipml->rf);
> > >+		if (retval) {
> > >+			rfkill_destroy(ipml->rf);
> > >+			ipml->rf = NULL;
> > >+		}
> > >+	} else {
> > >+		ipml->rf = NULL;
> > >+	}
> > 
> > I think the comment is wrong, and so is the code it references.
> > 
> > rfkill_alloc() is documented as returning NULL on failure, not an
> ERR_PTR.  So you're going to pass NULL into rfkill_register() on
> allocation failure, which will BUG out.
> > 
> 
> Gee! At the time, I only read the RFKILL=n implementation in the
> header.
> It returns ERR_PTR(-ENODEV), while the RFKILL=y implementation does
> indeed return NULL. This is inconsistent interface, and we'd better
> fix it, in my opinion. But for the time, we must fix the users here.

No, it's perfectly consistent. RFKILL=n returns non-NULL on success,
just as RFKILL=y/m. It's just defined to be always successful for
RFKILL=n, with the special case that it's returning an ERR_PTR for its
own checking in rfkill_register.

All the drivers should do is test for NULL, and if non-NULL proceed as
normal.

> I see why eeepc_laptop would still work right now. But I think it's
> risky for the casual driver writer to trust the rfkill device is there
> while it isn't. If this is by design, to bite those driver writers
> that
> do "stupid" things (like not using the right interface) and that they
> should still manipulate hardware as if the rfkill device was there,
> that's OK. But is this really by design or should we fix it? For
> example, eeepc_laptop does all the wlan pci device hotplug stuff and
> also write some ACPI values. And it will do that if RFKILL is disabled
> but will not do it if RFKILL is enabled but device allocation fails.
> So,
> should we document that ERR_PTR(-ENODEV) is not a failure, but a
> "dummy"?

That's the intended outcome, yes, so that drivers need NOT worry about
whether RFKILL is built into the system or not at all.

johannes

