From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [RFC PATCH] thinkpad-acpi: Improve hardware volume controls
Date: Thu, 12 May 2011 18:43:14 -0300
Message-ID: <20110512214314.GA9336@khazad-dum.debian.net>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110512134827.GA26159@srcf.ucam.org>
 <BANLkTimmrM4HMATSbsYzz6kh=e9hrfAZmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:37797 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932814Ab1ELVnR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2011 17:43:17 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTimmrM4HMATSbsYzz6kh=e9hrfAZmg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, 12 May 2011, Andrew Lutomirski wrote:
> Still, someone who has an older laptop should test it, because all I
> can do is pretend I carefully inspected all the possible code paths.

Will do, will do.  Please be patient.  I will have thinkpad-acpi time this
weekend :-)

As you all noticed by now, you really must know what you're doing when
messing with the thinkpad volume stuff.  I will carefully review the patch,
and we should be able to massage it into something that can be merged during
the weekend and next week.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
