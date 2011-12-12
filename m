From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] acerhdf: Message logging neatening
Date: Mon, 12 Dec 2011 10:56:37 -0800
Message-ID: <1323716197.19538.3.camel@joe2Laptop>
References: <9be2717594eec36bdcc072a90d81b044500270e4.1322593277.git.joe@perches.com>
	 <96a258354ce375bf80259f783506bbd7191b520d.1322593277.git.joe@perches.com>
	 <cone.1323714410.432860.1894.1000@zopiie>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:54308 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753365Ab1LLS4i (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Dec 2011 13:56:38 -0500
In-Reply-To: <cone.1323714410.432860.1894.1000@zopiie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2011-12-12 at 19:26 +0100, Peter Feuerer wrote:
> > @@ -605,8 +603,8 @@ static int acerhdf_check_hardware(void)
> >  	}
> >  
> >  	if (!bios_cfg) {
> > -		pr_err("unknown (unsupported) BIOS version %s/%s/%s, "
> > -			"please report, aborting!\n", vendor, product, version);
> > +		pr_err("unknown (unsupported) BIOS version %s/%s/%s, please report, aborting!\n",
> > +		       vendor, product, version);
> 
> disagree, as it exceeds 80 chars.

Format strings should be coalesced.
checkpatch ignores these long lines.
