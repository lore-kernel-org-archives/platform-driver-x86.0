From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2 0/1] thinkpad_acpi: Add mappings for F9 - F12 hotkeys
 on X240 / T440 / T540
Date: Wed, 9 Apr 2014 21:12:21 -0300
Message-ID: <20140410001221.GA23977@khazad-dum.debian.net>
References: <1397036806-31106-1-git-send-email-hdegoede@redhat.com>
 <20140409180300.GB22476@khazad-dum.debian.net>
 <20140409182758.GA3196@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60513 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933317AbaDJAM2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 20:12:28 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 085FA210BE
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Apr 2014 20:12:28 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140409182758.GA3196@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org

On Wed, 09 Apr 2014, Matthew Garrett wrote:
> On Wed, Apr 09, 2014 at 03:03:01PM -0300, Henrique de Moraes Holschuh wrote:
> > On Wed, 09 Apr 2014, Hans de Goede wrote:
> > > This patch seems to have fallen through the cracks, so here is a resend.
> > 
> > Sort of.  There was a doubt about one of the keycodes.
> 
> I think I'm ok with the keycode.

Ok.  Now, provided that it doesn't clash with the other thinkpads (in which
case we'd just add selective keymaps), we can merge.

Heck, we can fix that later too, it doesn't count as an ABI break, these
keymaps are _already_ configurable from userspace _and_ usually reconfigured
by userspace, the driver just tries to provide sane defaults.  So...

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
