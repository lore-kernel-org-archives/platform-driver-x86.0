From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [lm-sensors] A new Subsystem for Current Management
Date: Wed, 9 Nov 2011 12:09:20 +0000
Message-ID: <20111109120919.GB31441@opensource.wolfsonmicro.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
 <CADkCAuv16KY4B-A-Oym-1pX+7WmP2WWzRZMsKeB_1=7-DfDASw@mail.gmail.com>
 <D6D887BA8C9DFF48B5233887EF04654109F102E436@bgsmsx502.gar.corp.intel.com>
 <20111106141302.40365383@endymion.delvare>
 <20111108165426.GB21630@sirena.org.uk>
 <20111108175749.2ef50f93@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33738 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754285Ab1KIMJW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Nov 2011 07:09:22 -0500
Content-Disposition: inline
In-Reply-To: <20111108175749.2ef50f93@endymion.delvare>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: "R, Durgadoss" <durgadoss.r@intel.com>, lm-sensors@lm-sensors.org, Alan Cox <alan@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Tue, Nov 08, 2011 at 05:57:49PM +0100, Jean Delvare wrote:
> On Tue, 8 Nov 2011 16:54:26 +0000, Mark Brown wrote:

> > Actually the regulator API isn't really about power savings - it's about
> > voltage and current regulation.  Higher layers can use these features to
> > save power but it's not somethnig the regulator API cares about.  If the
> > documentation suggests it is we might want to fix that up.

> I came up to this conclusion after reading the CONFIG_REGULATOR help
> text in Kconfig. I'll let you decide if this should get improved in any
> way.

I think the current text is OK, it's saying that it allows other
subsystems do things which save power which is what's happening.
