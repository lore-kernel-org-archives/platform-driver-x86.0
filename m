From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Bug#587014: screen brightness can't be modified on some
	Panasonic laptops
Date: Mon, 3 Jan 2011 22:32:40 +0000
Message-ID: <20110103223240.GA6181@srcf.ucam.org>
References: <20101229152428.GB4116@nashi.hw.39mm.net> <201101031040.03797.trenn@suse.de> <20110103104457.GA20726@nashi.hw.39mm.net> <20110103213339.GA5174@srcf.ucam.org> <AANLkTinvWTSfmfX2Q9FjfwhYt6=_vTssZSbFad3k-5-R@mail.gmail.com> <20110103221821.GA5998@srcf.ucam.org> <AANLkTikKrrMOihzE2FVpqBG04FZOcWWhDZjNog6fO1+=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:51594 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980Ab1ACWcw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 17:32:52 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTikKrrMOihzE2FVpqBG04FZOcWWhDZjNog6fO1+=@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Cristopher Camacho <cristopher.camacho@gmail.com>
Cc: Nicolas Limare <nicolas@limare.net>, Thomas Renninger <trenn@suse.de>, Nicolas Limare <nicolas+debian@limare.net>, 587014@bugs.debian.org, ben@decadent.org.uk, laforge@gnumonks.org, platform-driver-x86@vger.kernel.org

Well, that's odd. There's certainly support for ACPI backlight control 
in your firmware, and it goes via opregion so it should work correctly. 
I think the thing to do here is to have the panasonic driver bail if 
there's ACPI backlight support, and then figure out why the ACPI video 
driver isn't working for you.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
