From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] x86,mrst: Intel Medfield over-current detection patch
Date: Mon, 20 Dec 2010 16:31:00 +0000
Message-ID: <20101220163100.GA27327@srcf.ucam.org>
References: <20101213112147.15213.12742.stgit@bob.linux.org.uk> <20101220161033.GB25502@srcf.ucam.org> <20101220162620.6488c276@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39343 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932841Ab0LTQbE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 11:31:04 -0500
Content-Disposition: inline
In-Reply-To: <20101220162620.6488c276@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Dec 20, 2010 at 04:26:20PM +0000, Alan Cox wrote:
> > Hm. Do you have a summary or a pointer to that discussion? This really 
> > does seem to be a hardware monitoring device, and so hwmon would seem 
> > the more natural home for it - I'd like some idea of what the 
> > justification was.
> 
> Basically that it has no interface features in common with anything in
> the hwmon API, nor that looked likely to be generic or could be made to
> fit them.
> 
> hwmon isn't "any hardware monitoring device", it's classes of devices
> that fit certain common interfaces - eg thermal reporting ones.

But also voltage and current reporting ones, including alarm thresholds.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
