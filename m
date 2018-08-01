From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] thinkpad_acpi: don't overwrite
 supported battery operations
Date: Wed, 1 Aug 2018 08:47:47 -0300
Message-ID: <20180801114747.qrjclik665ya7oh5@khazad-dum.debian.net>
References: <20180616093954.8435-1-linux@weissschuh.net>
 <00b72055-929d-4bda-bff3-3a9249568b73@t-8ch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00b72055-929d-4bda-bff3-3a9249568b73-khTSGRnkC0s@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux-9XfqOkM5JgxKQ7RDE2T8Pw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Ognjen Galic <smclt30p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 30 Jul 2018, Thomas Wei=DFschuh wrote:
> On Sat, 2018-06-16T11:39+0200, Thomas Wei=DFschuh wrote:
> > Previously the struct containing the supported operations for all
> > batteries was zeroed every time a battery was probed.
> > This prevented all batteries except the lastly probed one from being
> > configured.
> =

> Is something wrong with this patch?
> If so I would like to remedy it.

Nah, it is fine.  Please resend it to
platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and I will ack it there.

However, it will have a trivial conflict with an already accepted patch
that adds quirk handling to tpacpi_battery_init().  The fix is obvious
(place the memset before the quirk handler is called).

-- =

  Henrique Holschuh

---------------------------------------------------------------------------=
---
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
