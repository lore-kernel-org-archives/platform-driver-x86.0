From: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ThinkPad Yoga 370 thinkpad_acpi:
 unknown/reserved multi-mode value
Date: Wed, 25 Apr 2018 14:22:20 +0200
Message-ID: <1524658940.3938.24.camel@redhat.com>
References: <20180425112937.zsrxthvjwehcezqe@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180425112937.zsrxthvjwehcezqe-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Cc: Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

On Wed, 2018-04-25 at 08:29 -0300, Henrique de Moraes Holschuh wrote:
> FWIW, the error "unknown/reserved multi mode value" is about a real
> problem, and not related to "unhandled events" at all.  What we'd have
> to do is to track down the root cause for this one.

AFAICT, the value 0 for multi-mode type 4 is specified to be reserved.
If this happens at boot time, then maybe it really tells us that the
current state is not known at the time similar to what appears to be
the case for other modes.

Sounds like the best solution is to just assume that a value of 0x0
always means the state is unknown and assume we are in laptop mode.

Simply adding TP_ACPI_MULTI_MODE_UNKNOWN to the lists of valid modes
should fix the warning.

Benjamin
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAlrgcvwACgkQq6ZWhpmF
Y3Bitw//ZiR3S6z5FxP2zrJPFYowCBj96qf63/Fj12dlZoUs4dROqKZzUraf6c23
q5dETfzWaCYM3pNDOpQBs+uAkd6sSf8HfuVgiRUg3tF/mKvfF3eHrvxxVmBQ0Zch
Ul8rsuzG3I23Jpsj4MH/rogTQvIPU8ZoBO0q+pXcGEqSmMmdy4/saNRJtltfhZ6C
WVRs3f754X74OSndkXYO/t01M9woeAQwsjmhlHL07IP0uzEj0tZlspix4I4AePbK
2yAAo6k7RaSshqWldjXpqG1nrF4vstYomY78+ble8tKp+zjgn3TTIZL7MbNvlQU3
6wpQhMRSzgPRqHHprg4fa+8nHPE2ObnyGvNeUj0pc8hbMBlBc4FGe7Vgt4VwaExr
JWVDuTFp0Ae/F7VkmqAxOMOSxDjljm9d3C4jAAzHiuw3nyK+9ZVizEQhC5QB5MjZ
vt5qNdC/efGc5zUpwHGPSfMYt1iLgxXLzV/l2KZzE4B7G/PG2jTjlz23QUv6QkWz
JFCNsqJ/6ziSCOPTsSjNVy5mO6S09LxqHrDWXS75UfZ7FmNlhdQr0e/LF/vmUIsY
6oWQlRxB5oiJeKUrOou+iL3dyzGUJsGvGExiU/TlB/hgW+1Zu7yh7eE1/0ZSt3xX
6TBiKOaLYfPnDYx7UgQ2EZKs5tpA7L9jgfSl1TE1rB0P6FEOIZE=
=YoiH
-----END PGP SIGNATURE-----


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
