From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT
 Home/Express Gate key
Date: Fri, 25 Mar 2011 11:28:50 -0500
Message-ID: <20110325162850.GD14328@thinkpad-t410>
References: <20110324195720.GB31713@thinkpad-t410>
	<1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
	<AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
	<AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
	<20110325161405.GC5099@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110325161405.GC5099-WlK9ik9hQGAhIp7JRqBPierSzoNAToWh@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 25, 2011 at 09:14:05AM -0700, Dmitry Torokhov wrote:
> > If you keep a keyboard key pressed, you want multiple events, not one right ?
> > I think it's important not to loose informations. If someone keep this
> > key pressed more than 1.5 second, I think it's good idea to send
> > multiple KEY_PROG2.
> 
> You can have input autorepeat facilities do that for you. If you want to
> do this yourself then the proper value for repeated events is _2_, not
> 1, or they will be dropped as duplicates.
> 
> > 
> > About KEY_HOME press / release, and filtering KEY_HOME after
> > KEY_PROG2, I'm not sure. So if you really want it, and nobody
> > complains, I'll be happy to accept your patch.
> > 
> > > And back to the question of KEY_HOME -- that's not really what you want,
> > > is it? As in "move cursor to start of line"?
> > 
> > Ho .. right, that's what mean KEY_HOME :/. So no, I don't want that...
> > What about:
> > - KEY_CYCLEWINDOWS
> > - KEY_COMPUTER
> > - KEY_HOMEPAGE
> > - KEY_DASHBOARD
> > 
> > I think KEY_HOMEPAGE is the best choice.
> 
> No, KEY_HOMEPAGE should cause your browser to go to your home page. What
> you want is either:
> 
> #define KEY_CONFIG         171     /* AL Consumer Control Configuration */
> #define KEY_DASHBOARD      204     /* AL Dashboard */
> 
> ("AL" stands for "Application Launcher", "AC" for 'Application Control",
> matched loosely to HUT tables).

Dmitry,

I didn't see you responses before my last response, so you can ignore
it. Let me make sure I understand correctly. For reference, the button
in question sends an 0xe4 scancode on press, repeated 0xea scancodes on
hold, and 0xe5 on release.

So, would the following make sense (KEY_TBD is may abbreviation for "key
to be determinded"):

 - On press (0xe4), send KEY_TBD, value = 1
 - On hold (0xea), send KEY_TBD, value = 2
 - On release (0xe5), send KEY_TBD, value = 0

Also, is KEY_CYCLEWINDOWS intended to imply screen rotation, or
something else?

Thanks,
Seth


------------------------------------------------------------------------------
Enable your software for Intel(R) Active Management Technology to meet the
growing manageability and security demands of your customers. Businesses
are taking advantage of Intel(R) vPro (TM) technology - will your software 
be a part of the solution? Download the Intel(R) Manageability Checker 
today! http://p.sf.net/sfu/intel-dev2devmar
