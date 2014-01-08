From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v6][RESEND] platform: x86: New BayTrail IOSF-SB MBI driver
Date: Tue, 07 Jan 2014 16:00:32 -0800
Message-ID: <52CC9520.4060208@zytor.com>
References: <1388427149-25456-1-git-send-email-david.e.box@linux.intel.com> <4364833.i22acYTaeM@vostro.rjw.lan> <20140107214300.GA30423@linux.intel.com> <3119193.jBSlNlK309@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:33360 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754374AbaAHABK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jan 2014 19:01:10 -0500
In-Reply-To: <3119193.jBSlNlK309@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "David E. Box" <david.e.box@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 01/07/2014 04:11 PM, Rafael J. Wysocki wrote:
>>
>> Ok, I spoke with other developers and I apparently misunderstood the context
>> here. Distro's enable these features and this is too detailed for them to know
>> what to do with it. How about simply "Required to enable platform specific power
>> managemnet features on Baytrail"?
>>
>> KISS is easier said than done.
> 
> Well, I personally think that this code should go into arch/x86/ as library code
> needed to access IOSF Sideband on some platforms.  I probably would make modules
> depending on it select it, so for example if the RAPL driver is going to be
> built, your driver should be build either and rather unconditionally in that
> case.
> 
> So the rule should be "if something *may* need it, build it" in my opinion.
> 

I thought we were targeting this for drivers/x86?  However, perhaps with
power management tied in that doesn't make too much sense.

	-hpa
