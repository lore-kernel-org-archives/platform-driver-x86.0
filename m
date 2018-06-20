From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add
 support for calculator hotkey
Date: Wed, 20 Jun 2018 09:51:08 -0300
Message-ID: <20180620125108.n6jmpetshhamn2ig@khazad-dum.debian.net>
References: <20180619155152.4984-1-bberg@redhat.com>
 <20180619181236.4qcyc7qmziqiijn4@khazad-dum.debian.net>
 <5b3d294cd3bfd1c8ce8ae955f13df4d3814109aa.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5b3d294cd3bfd1c8ce8ae955f13df4d3814109aa.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 19 Jun 2018, Benjamin Berg wrote:
> > That said, it would be nice to know if other models also have this
> > hotkey, especially if it has a different meaning (in which case we just
> > special-case the keymap in the driver, so it is *not* a problem).
> 
> I believe this is not specific to the P52 but simply the keyboard
> version that includes a numpad. I only have the P52, but looking at
> photos of e.g. the T570 and T580 the keyboard looks identical there.

Hopefully we get a report from an user of these keyboards.  Identical is
good, the only issue would be if they were not identical...

> On a different note, these keyboards also have "=", "(" and ")" keys
> above the numpad. These keys emit the key combinations required for a
> US keyboard layout on the P52 I have. I do believe there is a way to
> set the keyboard layout through ACPI which I suspect changes the
> emitted keycodes to match the expected values for other layouts.
> Unfortunately supporting that seems quite involved.

Yikes.  Hopefully we won't need to mess with this.

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
