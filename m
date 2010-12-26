From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] ACPI Thinkpad: We must always call va_end() after
 va_start() but do not do so in thinkpad_acpi.c::acpi_evalf()
Date: Sat, 25 Dec 2010 23:03:22 -0200
Message-ID: <20101226010322.GB16593@khazad-dum.debian.net>
References: <alpine.LNX.2.00.1012241952200.28973@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:37348 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751333Ab0LZBD2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Dec 2010 20:03:28 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1012241952200.28973@swampdragon.chaosbits.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesper Juhl <jj@chaosbits.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 24 Dec 2010, Jesper Juhl wrote:
> In drivers/platform/x86/thinkpad_acpi.c::acpi_evalf() we don't always call 
> va_end() after va_start(). This patch corrects that.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Although that codepath is for a driver source bug, so arguably it would
be better to just BUG().

It has never been tested (or hit in practice), I think.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
