From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 1/2] X86 platform wmi: Introduce debug param to log all WMI events
Date: Mon, 3 May 2010 15:22:47 +0200
Message-ID: <201005031522.47837.trenn@suse.de>
References: <1272877808-13468-1-git-send-email-trenn@suse.de> <y2u71cd59b01005030507zdeb6db98r7d6620cf44453d75@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56055 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759190Ab0ECNS5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 May 2010 09:18:57 -0400
In-Reply-To: <y2u71cd59b01005030507zdeb6db98r7d6620cf44453d75@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Monday 03 May 2010 14:07:56 Corentin Chary wrote:
> On Mon, May 3, 2010 at 11:10 AM, Thomas Renninger <trenn@suse.de> 
wrote:
> > To give people easily an idea what could be WMI driven on their 
system.
> > Introduces:
> > wmi.debug=[01]
> > ...
> > +MODULE_PARM_DESC(debug,
> > +                "Debug facility to log WMI Events [0/1]");
> > +
> 
> I'm ok with the base idea, but as this debug option is event specific,
> maybe it should be called debug_events ?
Whatabout keeping this as long as it's the only debug option.
If we get more, we can pass a mask:
  0x1 Debug events
  0x2 Debug methods
  0x4 Be more verbose
  0x8 ...
and then also adjust the description appropriately.

Hmm, drawback I just realized: You can't properly document this
with the MODULE_PARM_DESC macro.

> Or we can call it debug, change the param description ("add
> verbosity/debug messages to the wmi driver" for example)
> and also dump all guids (like I do in wmidump).
I also thought about this already.

I'll repost with a third patch adding the same prints as
done in wmidump, just replacing printf to printk.

Would be great to see this merged.

Thanks,

    Thomas
