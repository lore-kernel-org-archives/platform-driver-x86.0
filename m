From: =?UTF-8?Q?Marco_Trevisan_=28Trevi=C3=B1o=29?= <mail-DXHccXIHLaFeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Thu, 9 Jun 2016 01:05:12 -0400
Message-ID: <CAALaSckmmACY6ZxBOKFumT0tJe1Yo24S7-5jsUuREw7SFrde-w@mail.gmail.com>
References: <20160607235338.GA3147@khazad-dum.debian.net>
	<1465397665-9343-1-git-send-email-cpaul@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1465397665-9343-1-git-send-email-cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

2016-06-08 10:54 GMT-04:00 Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> From: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
>
> Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
> HKEY version 0x200 without adaptive keyboard.
>
> HKEY version 0x200 has method MHKA with one parameter value.
> Passing parameter value 1 will get hotkey_all_mask (the same like
> HKEY version 0x100 without parameter). Passing parameter value 2 to
> MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returned in
> that case there is no adaptive keyboard available.
>
> Signed-off-by: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Marco Trevisan <marco-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>

Can you also Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org so that it can be imported
there once merged?

------------------------------------------------------------------------------
What NetFlow Analyzer can do for you? Monitors network bandwidth and traffic
patterns at an interface-level. Reveals which users, apps, and protocols are 
consuming the most bandwidth. Provides multi-vendor support for NetFlow, 
J-Flow, sFlow and other flows. Make informed decisions using capacity 
planning reports. https://ad.doubleclick.net/ddm/clk/305295220;132659582;e
