From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: How to implement ACPI EC support?
Date: Fri, 2 Nov 2012 00:12:32 -0200
Message-ID: <20121102021232.GB3262@khazad-dum.debian.net>
References: <50912CC2.2050902@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35082 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752615Ab2KBCUk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Nov 2012 22:20:40 -0400
Content-Disposition: inline
In-Reply-To: <50912CC2.2050902@profitbricks.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, 31 Oct 2012, Sebastian Riemer wrote:
> I've noticed the ACPI embedded controller (EC) support in the
> "thinkpad_acpi" driver.
> 
> New Samsung laptops (NP530U3C, NP900X4B, NP900X3C, ...) also have an EC
> which isn't supported by the generic ACPI driver. The lid, the battery
> status and the power supply status are connected to it.
> 
> How did you implement the EC support in the thinkpad driver? Did you
> have documentation or was it done by reverse engineering?

It was done through lots of trial and error by several people over more than
a decade, and sometime ago SuSE managed to get me in contact with some
Lenovo ThinkPad firmware engineers in Japan, which did help a lot.

However, thinkpad-acpi is an old driver, you might want to ask the
maintainers of newer WMI-based drivers about how they are managing...

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
