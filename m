From: "R, Durgadoss" <durgadoss.r@intel.com>
Subject: RE: A new Subsystem for Current Management
Date: Sat, 5 Nov 2011 22:20:45 +0530
Message-ID: <D6D887BA8C9DFF48B5233887EF04654109F102E43A@bgsmsx502.gar.corp.intel.com>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
 <20111105155054.GC15329@ericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41059 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753253Ab1KEQuy convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 5 Nov 2011 12:50:54 -0400
In-Reply-To: <20111105155054.GC15329@ericsson.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <guenter.roeck@ericsson.com>
Cc: "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alan Cox <alan@linux.intel.com>

Hi Guenter,

Thanks for the inputs.

[snip.]

> > In simple terms, this framework will offer something like this:
> > 	Current[1-N]_limit - set of current limits
> > 	Voltage[1-X]_limit - set of voltage limits
> > 	Controllers[1-Y]_enable - These are the components by throttling/
> >       disabling which the current consumption can be brought down.
> >
> hwmon already has
> 
> power[1-*]_cap
> power[1-*]_crit
> 
> with explicit mention of "the system is expected take drastic action to reduce
> power consumption, such as a system shutdown or a forced powerdown of some
> devices".
> 

Agree that we should consider 'power' also a main factor for the framework.

> We also have
> 
> curr[1-*]_crit

In the systems that I used, this 'curr' stuff is more extensive.
There are at least 3 current limits. The third one is the 'crit'
Stuff; the HW shuts down the platform when the platform hits crit.
The other two are kind of 'warnings' that the system can use to
reduce the consumption so that it never reaches 'crit'.

So, if we are using hwmon for this, we may to extend the ABI
in terms of these.

> 
> though with no explicit mention of any action to be taken. We also have a
> pending patch
> (waiting for someone to comment on it) to add notification and uevent support
> to sysfs ABI.
> It is at the tip of my staging tree:
> http://git.kernel.org/?p=linux/kernel/git/groeck/linux-
> staging.git;a=shortlog;h=refs/heads/hwmon-staging
> 
> Using this would address reporting to userspace. Question is how to handle any
> actions.

No doubt about it!!

> The regulator subsystem may be better suited to handle this, as already
> suggested.

After the discussions on my initial patch of 'intel_mid_ocd.c'
I tried to make use of regulator framework. Although theoretically
We should be able to use regulator framework, for this exact
'Current/Voltage/Power monitoring' job, it does not fit well.

> Another approach would be to have a kernel-internal notification mechanism,
> which was already suggested for the hwmon subsystem.
> 

I am all for this..

> Either case, I don't think a framework should be restricted to currents.
> Power may be an even more important factor to determine if the system needs to
> be throttled.
> In some cases, it may be necessary to reduce (or increase ?) voltage to reduce
> current. So I think this will need a more comprehensive approach.

In general, I am Ok to include 'Power' also & use in-kernel notification
Mechanisms.

May be an initial patch will make things more visible and give more idea
I guess. Then we can add/modify things from there.

Many thanks for the initial inputs.

Thanks,
Durga
