From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [lm-sensors] A new Subsystem for Current Management
Date: Sun, 6 Nov 2011 14:53:31 +0100
Message-ID: <20111106145331.2979656f@endymion.delvare>
References: <D6D887BA8C9DFF48B5233887EF04654109F102E3BC@bgsmsx502.gar.corp.intel.com>
	<20111105155054.GC15329@ericsson.com>
	<D6D887BA8C9DFF48B5233887EF04654109F102E43A@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:6864 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751954Ab1KFNxk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 Nov 2011 08:53:40 -0500
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F102E43A@bgsmsx502.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: Guenter Roeck <guenter.roeck@ericsson.com>, platform-driver-x86@vger.kernel.org, Alan Cox <alan@linux.intel.com>, lm-sensors@lm-sensors.org

On Sat, 5 Nov 2011 22:20:45 +0530, R, Durgadoss wrote:
> > We also have
> > 
> > curr[1-*]_crit
> 
> In the systems that I used, this 'curr' stuff is more extensive.
> There are at least 3 current limits. The third one is the 'crit'
> Stuff; the HW shuts down the platform when the platform hits crit.
> The other two are kind of 'warnings' that the system can use to
> reduce the consumption so that it never reaches 'crit'.
> 
> So, if we are using hwmon for this, we may to extend the ABI
> in terms of these.

Note that in the hwmon sysfs interface, every input traditionally has
up to 3 upper limits: _max, _crit and _emergency in this order. While
the sysfs-interface document doesn't list all of them for each input
type, all this means is that so far no driver needed them and
libsensors doesn't know about them. But they can be added at any time
if the need exists.

> (...)
> May be an initial patch will make things more visible and give more idea
> I guess. Then we can add/modify things from there.

Certainly. It will be easier to evaluate the different options after
seeing actual code.

-- 
Jean Delvare
