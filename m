From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] thinkpad_acpi: added BIOS mute
	interfaces for volume
Date: Sun, 8 Jul 2012 12:43:21 -0300
Message-ID: <20120708154321.GA15477@khazad-dum.debian.net>
References: <1334139302-7152-1-git-send-email-alex.hung@canonical.com>
	<4F855A2B.6070402@canonical.com>
	<20120411114211.GA11445@khazad-dum.debian.net>
	<4FF9A76C.7030308@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF9A76C.7030308-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 08 Jul 2012, Alex Hung wrote:
> Will it be a better idea to disable hardware mute? The hardware mute
> will still send a scancode to mute the volue when thinkpad-acpi is
> loaded, though the led will still not work. More specifically, a
> patch that only calls with hoteky_set_mute_support(1) that works as
> below:

I don't mind adding that as a module paramenter and a sysfs control, but
make it a multi-value integer as follows:

-1:  auto   (right now that means don't touch it.  We can change its meaning
             after some testing)
0 : disable hw mute
1 : enable  hw mute

All other values must return -EINVAL (reserved, to be implemented later).

On thinkpads where no SHDA functionality is supported, do not publish the
sysfs node.  I can test in the T43 if it is EC-supported but not published
in the DSDT, please send me the relevant acpidump of a thinkpad that
implements SHDA, please.

Relevant documentation patch for Documentation/laptops/thinkpad-acpi.txt is
required for an Ack, of course :-)

> This can solve the problems that unmute from desktop will not unmute
> the hardware mute until someone including myself works out a more
> comprehensive solution.

Agreed.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
