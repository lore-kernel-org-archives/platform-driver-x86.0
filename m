From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT
 Home/Express Gate key
Date: Mon, 28 Mar 2011 08:46:06 -0500
Message-ID: <20110328134606.GA16374@thinkpad-t410>
References: <AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
	<AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
	<20110325161405.GC5099@core.coreip.homeip.net>
	<20110325162850.GD14328@thinkpad-t410>
	<20110325170333.GD5099@core.coreip.homeip.net>
	<20110325185824.GE14328@thinkpad-t410>
	<20110327171304.GD30244@core.coreip.homeip.net>
	<AANLkTikBnAdXHR4iqzq9Zd6D-OYe4yp-zELPh6iLr6sj@mail.gmail.com>
	<20110327191116.GB31692@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110327191116.GB31692-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vojtech-Y4LbUc7mvzI@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 27, 2011 at 12:11:16PM -0700, Dmitry Torokhov wrote:
> > If we do set up auto-repeat and increase REP_DELAY, I'm guessing this
> > would enable auto-repeat for all other keys defined in driver?  That
> > needs to have some thought on if could have negative impact (any other
> > keys not using auto-release?).
> 
> Right. Right now there are 4 autoreprat options (in general):
> 
> - hardware autorepeat (if hardware supports it);
> - input core software autorepeat (one delay and rate per input device);
> - driver-implemented software autorepeat - in cases when different
>   repeat rate is needed;
> - userspace autorepeat (like X does nowadays);
> 
> Well, 4th option is not mutually exclusive with the other 3...

Currently all the other keys are using autorelease, so the autorepeat
setting shouldn't be affecting them at all. So the concern is whether
enabling autorepeat could become a problem the next time some oddball
key shows up on a machine.

Corentin, you were concerned about the loss of information to userspace,
but it seems the only way to maintain the hardware events is to drop the
use of sparse-keymap altogether. Do you have an opinion on how to
proceed?

I'm leaning towards using the input core autorepeat, since it seems to
get the closest to typical key behavior.

Seth


------------------------------------------------------------------------------
Enable your software for Intel(R) Active Management Technology to meet the
growing manageability and security demands of your customers. Businesses
are taking advantage of Intel(R) vPro (TM) technology - will your software 
be a part of the solution? Download the Intel(R) Manageability Checker 
today! http://p.sf.net/sfu/intel-dev2devmar
