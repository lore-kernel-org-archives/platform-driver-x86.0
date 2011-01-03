From: Cristopher Camacho <cristopher.camacho@gmail.com>
Subject: Re: Bug#587014: screen brightness can't be modified on some Panasonic laptops
Date: Tue, 4 Jan 2011 06:14:40 +0800
Message-ID: <AANLkTinvWTSfmfX2Q9FjfwhYt6=_vTssZSbFad3k-5-R@mail.gmail.com>
References: <20101229152428.GB4116@nashi.hw.39mm.net>
	<201101031040.03797.trenn@suse.de>
	<20110103104457.GA20726@nashi.hw.39mm.net>
	<20110103213339.GA5174@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:54515 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1ACWOl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 17:14:41 -0500
Received: by ewy5 with SMTP id 5so6245355ewy.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jan 2011 14:14:40 -0800 (PST)
In-Reply-To: <20110103213339.GA5174@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Nicolas Limare <nicolas@limare.net>, Thomas Renninger <trenn@suse.de>, Nicolas Limare <nicolas+debian@limare.net>, 587014@bugs.debian.org, ben@decadent.org.uk, laforge@gnumonks.org, platform-driver-x86@vger.kernel.org

No, there is no. Only the /sys/class/backlight/panasonic/ directory is present.

Cristopher

On Tue, Jan 4, 2011 at 5:33 AM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> Is there a /sys/class/backlight/acpi_video0 directory as well as the
> Panasonic one?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>
