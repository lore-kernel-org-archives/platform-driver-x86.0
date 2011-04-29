From: Greg KH <greg@kroah.com>
Subject: Re: [RFC 1/5] platform-drivers-x86: add support for Technologic
 Systems TS-5xxx detection
Date: Fri, 29 Apr 2011 16:32:30 -0700
Message-ID: <20110429233230.GB24864@kroah.com>
References: <1304115712-5299-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1304115712-5299-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:46778 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756731Ab1D2XeR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 Apr 2011 19:34:17 -0400
Content-Disposition: inline
In-Reply-To: <1304115712-5299-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, Jonas Fonseca <jonas.fonseca@savoirfairelinux.com>, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, lm-sensors@lm-sensors.org

On Fri, Apr 29, 2011 at 06:21:48PM -0400, Vivien Didelot wrote:
> +/proc filesystem
> +----------------
> +
> +Information about the TS board is available through the /proc/ts-sbcinfo.

Really?  Why?

As you now have added a new kernel/user ABI, it must be documented in
Documentation/ABI/

Please include that in your next patch.

But first off, why a new proc file?  What is it used for?

> +static int ts_sbcinfo_init_buffer(char *buf, struct ts5xxx_sbcinfo *sbcinfo)
> +{
> +	char *pos = buf;
> +
> +	pos += ts_addbuf(pos, "Board ID", "TS-%d", sbcinfo->board_id);
> +	pos += ts_addbuf(pos, "RS485", "%s", sbcinfo->rs485 ? "yes" : "no");
> +	pos += ts_addbuf(pos, "AnalogToDigital", "%s",
> +			 sbcinfo->adc ? "yes" : "no");
> +	pos += ts_addbuf(pos, "Auto485", "%s", sbcinfo->auto485 ? "yes" : "no");
> +	pos += ts_addbuf(pos, "SRAM", "%s", sbcinfo->sram ? "yes" : "no");
> +	pos += ts_addbuf(pos, "External Reset", "%s",
> +			 sbcinfo->external_reset ? "yes" : "no");

Most of these look like they should be simple "one value per file" sysfs
files for your system.  That would make things much easier on your
userspace tools to handle parsing them properly, right?

Why not do that instead?

thanks,

greg k-h
