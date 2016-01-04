From: David Binderman <dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: linux-4.4-rc8/drivers/platform/x86/thinkpad_acpi.c: 2 * bad shift ?
Date: Mon, 4 Jan 2016 17:42:47 +0000
Message-ID: <DUB128-W24662478169DFCC5C275139CF20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

hello there,

1.

[linux-4.4-rc8/drivers/platform/x86/thinkpad_acpi.c:2297] -> [linux-4.4-rc8=
/drivers/platform/x86/thinkpad_acpi.c:3694]: (warning) Shifting 32-bit valu=
e by 51 bits is undefined behaviour. See condition at line 3694.

Source code at line 2297 is

=A0=A0=A0 if (hotkey_user_mask & (1 << scancode))

and at 3694 is

=A0=A0=A0 if (scancode> 0 && scancode <=3D TPACPI_HOTKEY_MAP_LEN) {

Maybe new code

=A0=A0=A0 if (hotkey_user_mask & (1UL << scancode))

is better.

2.

[linux-4.4-rc8/drivers/platform/x86/thinkpad_acpi.c:3696] -> [linux-4.4-rc8=
/drivers/platform/x86/thinkpad_acpi.c:3694]: (warning) Shifting 32-bit valu=
e by 51 bits is undefined behaviour. See condition at line 3694.

Duplicate.

Regards

David Binderman
 		 	   		  =

---------------------------------------------------------------------------=
---
Site24x7 APM Insight: Get Deep Visibility into Application Performance
APM + Mobile APM + RUM: Monitor 3 App instances at just $35/Month
Monitor end-to-end web transactions and take corrective actions now
Troubleshoot faster and improve end-user experience. Signup Now!
http://pubads.g.doubleclick.net/gampad/clk?id=3D272487151&iu=3D/4140
