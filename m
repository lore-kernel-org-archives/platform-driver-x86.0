From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT
 Home/Express Gate key
Date: Fri, 25 Mar 2011 13:58:24 -0500
Message-ID: <20110325185824.GE14328@thinkpad-t410>
References: <20110324195720.GB31713@thinkpad-t410>
	<1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
	<AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
	<AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
	<20110325161405.GC5099@core.coreip.homeip.net>
	<20110325162850.GD14328@thinkpad-t410>
	<20110325170333.GD5099@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110325170333.GD5099-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, vojtech-Y4LbUc7mvzI@public.gmane.org, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 25, 2011 at 10:03:33AM -0700, Dmitry Torokhov wrote:
> > So, would the following make sense (KEY_TBD is may abbreviation for "key
> > to be determinded"):
> > 
> >  - On press (0xe4), send KEY_TBD, value = 1
> >  - On hold (0xea), send KEY_TBD, value = 2
> >  - On release (0xe5), send KEY_TBD, value = 0
> 
> Yes.

There's a little problem with this. The driver uses sparse-keymap, which
calls input_report_key(), which is doing this:

	input_event(dev, EV_KEY, code, !!value);

I don't see the hold events in userspace, so they must be getting
dropped as duplicates as you suggested.

I'm not sure who is at fault here. Should input_report_key() not be
forcing value to 0 or 1? Or should sparse-keymap be calling
input_event() directly? Or is sparse-keymap the wrong tool for handling
keys this way?

Thanks,
Seth


------------------------------------------------------------------------------
Enable your software for Intel(R) Active Management Technology to meet the
growing manageability and security demands of your customers. Businesses
are taking advantage of Intel(R) vPro (TM) technology - will your software 
be a part of the solution? Download the Intel(R) Manageability Checker 
today! http://p.sf.net/sfu/intel-dev2devmar
