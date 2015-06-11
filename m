From: Aaron Lu <aaron.lu@intel.com>
Subject: Re: [PATCH v2] acpi-video: Add a parameter to not register the
 backlight sysfs interface
Date: Thu, 11 Jun 2015 09:43:15 +0800
Message-ID: <20150611014315.GA26277@aaronlu.sh.intel.com>
References: <1433838745-8857-1-git-send-email-hdegoede@redhat.com>
 <20150609091042.GA1280@aaronlu.sh.intel.com>
 <557760A5.9000404@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <557760A5.9000404@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ben Skeggs <bskeggs@redhat.com>, platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org, Sylvain Pasche <sylvain.pasche@gmail.com>, linux-acpi@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 09, 2015 at 11:54:45PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 06/09/2015 11:10 AM, Aaron Lu wrote:
> >On Tue, Jun 09, 2015 at 10:32:25AM +0200, Hans de Goede wrote:
> >>On some systems acpi-video backlight is broken in the sense that it cannot
> >>control the brightness of the backlight, but it must still be called on
> >>resume to power-up the backlight after resume.
> >
> >All the video module does on resume is a backlight set operation, it
> >can't control backlight but can turn on the screen on resume? Hmm...
> >
> >I'll ask Sylvain to attach acpidump, let's see if there is anything
> >special there.
> 
> Ok, lets see what comes out of that. Note in the mean time Sylvain has
> attached his acpidump.

Thanks.
According to the discussion in the bugzilla place, it doesn't seem we
have any other way to handle this at the moment.

Acked-by: Aaron Lu <aaron.lu@intel.com>

Best wishes,
Aaron
