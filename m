From: Adam Lee <adam.lee@canonical.com>
Subject: Re: [PATCH] thinkpad_acpi: support new BIOS version string pattern
Date: Wed, 11 Feb 2015 13:36:25 +0800
Message-ID: <20150211053625.GA2617@adam-laptop>
References: <1423040419-25113-1-git-send-email-adam.lee@canonical.com>
 <20150210043522.GE37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:61308 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbbBKFgd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 00:36:33 -0500
Received: by mail-pa0-f52.google.com with SMTP id ey11so1667399pad.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2015 21:36:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150210043522.GE37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Mon, Feb 09, 2015 at 08:35:22PM -0800, Darren Hart wrote:
> >  static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
> >  						const char t)
> >  {
> > -	return s && strlen(s) >= 8 &&
> > +	bool is_most = 0;
> > +	bool is_new = 0;
> 
> The new variables aren't really necessary, you certainly do not need two of
> them.
> 
> > +
> > +	/*
> > +	 * Most models: xxyTkkWW (#.##c)
> > +	 * Ancient 570/600 and -SL lacks (#.##c)
> > +	 */
> > +	is_most = s && strlen(s) >= 8 &&
> 
> Try:
> 
> if (s && strlen(s) >=8 &&
> 	...
> 	)
> 	return true;

Yes, you are right.

> >  		tpacpi_is_fw_digit(s[0]) &&
> >  		tpacpi_is_fw_digit(s[1]) &&
> >  		s[2] == t &&
> >  		(s[3] == 'T' || s[3] == 'N') &&
> >  		tpacpi_is_fw_digit(s[4]) &&
> >  		tpacpi_is_fw_digit(s[5]);
> > +
> > +	if (is_most)
> > +		return is_most;
> > +
> > +	/* New models: xxxyTkkW (#.##c); T550 and some others */
> 
> Is the second W intentionally left off in xxxyTkkW ? We don't test for it, so I
> wasn't sure.

Yes, we have the latest models, tested it.

> > +	is_new = s && strlen(s) >= 8 &&
> > +		tpacpi_is_fw_digit(s[0]) &&
> > +		tpacpi_is_fw_digit(s[1]) &&
> > +		tpacpi_is_fw_digit(s[2]) &&
> 
> As far as I can tell, the only significant difference here (compared to above)
> is an additional leading digit and the subsequent string indices?
> 
> Seems to me this could be done fairly easily in the same block with only a minor
> adjustment at the beginning and the use of an incrementing index. Should be
> cleaner than duplicating 90% of the block?

I'd like to separate them still, it will be more readable and
extendible(Lenovo may release some BIOSes with other patterns for
non-classic ThinkPad models in the near future).

Thanks, Darren, will send the v2.

-- 
Adam Lee
