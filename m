From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] thinkpad-acpi: Enable microphone mute LED
Date: Fri, 27 May 2011 17:28:44 +0100
Message-ID: <20110527162844.GA16769@srcf.ucam.org>
References: <8dc2b2140c2794291811cd38f51f9dc7596f482c.1306266017.git.luto@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43162 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754210Ab1E0Q3A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 12:29:00 -0400
Content-Disposition: inline
In-Reply-To: <8dc2b2140c2794291811cd38f51f9dc7596f482c.1306266017.git.luto@mit.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@MIT.EDU>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, May 24, 2011 at 03:41:02PM -0400, Andy Lutomirski wrote:
> I don't know exactly which models have this LED or how to identify
> them in the quirk table, so I just enabled it for all unquirked
> Lenovo models.

Is there any chance that this is meant to be controlled via ALSA, in a 
similar way to the mute LED?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
