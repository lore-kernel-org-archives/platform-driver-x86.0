From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] x86,mrst: Intel Medfield over-current detection patch
Date: Mon, 20 Dec 2010 16:26:20 +0000
Message-ID: <20101220162620.6488c276@lxorguk.ukuu.org.uk>
References: <20101213112147.15213.12742.stgit@bob.linux.org.uk>
	<20101220161033.GB25502@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:43633 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752775Ab0LTQ1m (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 11:27:42 -0500
In-Reply-To: <20101220161033.GB25502@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

> Hm. Do you have a summary or a pointer to that discussion? This really 
> does seem to be a hardware monitoring device, and so hwmon would seem 
> the more natural home for it - I'd like some idea of what the 
> justification was.

Basically that it has no interface features in common with anything in
the hwmon API, nor that looked likely to be generic or could be made to
fit them.

hwmon isn't "any hardware monitoring device", it's classes of devices
that fit certain common interfaces - eg thermal reporting ones.

Alan
