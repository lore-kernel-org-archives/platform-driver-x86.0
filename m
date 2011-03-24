From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] eeepc-wmi: Add support for T101MT
	"Express Gate" key
Date: Thu, 24 Mar 2011 08:14:15 -0500
Message-ID: <20110324131414.GA20612@thinkpad-t410>
References: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
	<AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 24, 2011 at 08:33:33AM +0100, Corentin Chary wrote:
> On Wed, Mar 23, 2011 at 8:39 PM, Seth Forshee
> <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> > Signed-off-by: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > ---
> >
> > This button is unusual. On press it emits scanocde 0xe4, on release
> > 0xe5, and when held for a few seconds it begins emitting 0xea about
> > twice per second. I chose to handle only the press event in order to
> > make it behave like the other hotkeys.
> >
> > Probably the closest thing to the intended function of this button
> > would be to alternate the display orientation between portrait and
> > landscape, but since there doesn't appear to be a keycode defined for
> > that function I went with KEY_PROG2. I'm open to other suggestions
> > however.
> 
> Hi,
> The manual says that under Windows, this is the "Home Key", so
> KEY_HOME would be more appropriate.

The manual does call it the Home Key (I missed previously that the
Express Gate description referred only to the quick boot mode), but the
description of the key operation reads:

  Shortly press this key to launch the Touch Gate touch screen
  interface. Press and hold this key to preview desktop rotation, and
  then release the key to finish desktop rotation.

Which doesn't really sound like a home key to me, and the icon above the
button also suggests display rotation. But then we don't seem to have a
code for that function, so KEY_PROG2 may be no better than KEY_HOME...

> Also, it would be great to preserve key up and key down informations
> (sparse keymap have an "autorelease" parameter to control that).

Okay, I'll add some special casing for this key to support that. Do you
suggest ignoring the 0xea scan codes?


------------------------------------------------------------------------------
Enable your software for Intel(R) Active Management Technology to meet the
growing manageability and security demands of your customers. Businesses
are taking advantage of Intel(R) vPro (TM) technology - will your software 
be a part of the solution? Download the Intel(R) Manageability Checker 
today! http://p.sf.net/sfu/intel-dev2devmar
