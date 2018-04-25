From: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ThinkPad Yoga 370 thinkpad_acpi:
 unknown/reserved multi-mode value
Date: Wed, 25 Apr 2018 15:08:40 +0200
Message-ID: <1524661720.3938.37.camel@redhat.com>
References: <20180425112937.zsrxthvjwehcezqe@khazad-dum.debian.net>
 <1524658940.3938.24.camel@redhat.com>
 <gIc9JoKNspoNKrS8qo0firQUKDRHW2KhbiAmRxvYakwjc3iY5OPPlnayyEVmLmTDLtVlTY5PxvgvXORfD3N1lFG-J4T-_-v0qKDmSz_ABP0=@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <gIc9JoKNspoNKrS8qo0firQUKDRHW2KhbiAmRxvYakwjc3iY5OPPlnayyEVmLmTDLtVlTY5PxvgvXORfD3N1lFG-J4T-_-v0qKDmSz_ABP0=@protonmail.ch>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Cc: Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Peter FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

On Wed, 2018-04-25 at 08:28 -0400, Jordan Glover wrote:
> After reboot it stays the same except :
> thinkpad_acpi: Unknown/reserved multi mode value 0x0000 for type 4,
> please report this to ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> which is missing then.

That sounds reasonable. It just means that we are not able to resolve
the multi mode state right away after a cold boot. That does leave the
question whether we should be doing anything else so that the state is
resolved correctly.

A quick test could be to do a cold boot with the laptop folded into
tablet mode. I believe dmesg will be identical, but you should see
(e.g. using evemu-describe on "ThinkPad Extra Buttons") that
SW_TABLET_MODE has toggled to 1 rather than still having a state of 0
for laptop mode.

Benjamin
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAlrgfdgACgkQq6ZWhpmF
Y3C6nw//cUDToH0S/hr31xsgxK2A8a0mdE5qWBp4oCVfknLMuWKttyWF8BPgstAP
0hrmA0sGXZSLne4NZaSuCbuLGP5HuFEBvJqKuYJS3dR4W1rNnoTYMguz/NZFcDxx
ByK3fH3YKfZerNQrnfHOhjF3u1D293qFJmkWDHg2MghrMfWl/4472aFrlWGhbLiI
TAOfmXL/RY1zJlt7q4gziLRvqQoV/KV7Ks6vfmw58Z0BMct+/4+cJenFaX5r0y83
1K0HgIkEf8UT3Xr/DptASPu7b++Ik49tF7NSg67qOY949Y0Qagcyfyfcf1G+NEpp
qWDAs5cbToD+W8zz5W5dh85V7qutOJDOjFhXyaCDg/oLxIc01I5siuNn4vWK85cQ
dEL1imuS+lREZaIpksQhAYU91C3pwEt1onAMN1PAp7QbXNgU9tm216rl/rKQd0Nf
NX7zusK6HcsxnHiwxR+aXlmCy3XivxjbLfQVp8hOsWwx9tBIO/n5r9S+9Dryq8RX
5YU1jEMeoGZhaDHisKgZ2eHxFO+ZhC0w26DpV6kTTmu6K2lEXfiAMtJC5S/MHvVa
LB6gvG0OJPXrqpWQOxTXLdBkadI0XqMNgsalt/kvUzq4fQm5nyqbNvltJp51danp
Z6+7eInGqkwg4Y9dYYYdwLbstGMs1iJETHB6caIuaMDns6zCdAU=
=SId3
-----END PGP SIGNATURE-----


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
