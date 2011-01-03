From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Bug#587014: screen brightness can't be modified on some
	Panasonic laptops
Date: Mon, 3 Jan 2011 22:18:21 +0000
Message-ID: <20110103221821.GA5998@srcf.ucam.org>
References: <20101229152428.GB4116@nashi.hw.39mm.net> <201101031040.03797.trenn@suse.de> <20110103104457.GA20726@nashi.hw.39mm.net> <20110103213339.GA5174@srcf.ucam.org> <AANLkTinvWTSfmfX2Q9FjfwhYt6=_vTssZSbFad3k-5-R@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54465 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751603Ab1ACWSc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 17:18:32 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTinvWTSfmfX2Q9FjfwhYt6=_vTssZSbFad3k-5-R@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Cristopher Camacho <cristopher.camacho@gmail.com>
Cc: Nicolas Limare <nicolas@limare.net>, Thomas Renninger <trenn@suse.de>, Nicolas Limare <nicolas+debian@limare.net>, 587014@bugs.debian.org, ben@decadent.org.uk, laforge@gnumonks.org, platform-driver-x86@vger.kernel.org

On Tue, Jan 04, 2011 at 06:14:40AM +0800, Cristopher Camacho wrote:
> No, there is no. Only the /sys/class/backlight/panasonic/ directory is present.

Can you attach the output of the acpidump command on your system?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
