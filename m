From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add TP_HKEY_EV_SCREEN_FLIP (0x60c0) for
 Lenovo ThinkPad Yoga 12
Date: Sat, 10 Oct 2015 18:40:34 -0300
Message-ID: <20151010214034.GA9431@khazad-dum.debian.net>
References: <c6aa1c8ded9833fe62619d00f459ae438b1e2f9c.1444502507.git.dvhart@linux.intel.com>
 <20151010184509.GA27137@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60939 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752140AbbJJVkm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Oct 2015 17:40:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D9E8B209E7
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2015 17:40:39 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20151010184509.GA27137@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, 10 Oct 2015, Darren Hart wrote:
> On Sat, Oct 10, 2015 at 11:41:47AM -0700, Darren Hart wrote:
> > From: Darren Hart <dvhart@infradead.org>
> > 
> > thinkpad_acpi reports "unhandled HKEY event 0x60c0" when switching
> > between laptop and tent/tablet mode on the ThinkPad Yoga 12. This key is
> > reported by atkbd serio0 as e058 and e059.
> > 
> > Add TP_HKEY_EV_SCREEN_FLIP to the list of ignored events and silence the
> > warning.
> > 
> > Cleanup whitespace on preceeding line for TP_HKEY_EV_KEY_FN_ESC.
> > 
> > Signed-off-by: Darren Hart <dvhart@infradead.org>
> > Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> > Cc: ibm-acpi-devel@lists.sourceforge.net

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
