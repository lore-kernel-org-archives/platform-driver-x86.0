From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi:
 add mapping for new hotkeys
Date: Tue, 28 Feb 2017 17:03:04 -0300
Message-ID: <20170228200304.GB10069@khazad-dum.debian.net>
References: <20170228161057.28394-1-ckellner@redhat.com>
	<20170228161057.28394-2-ckellner@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170228161057.28394-2-ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Christian Kellner <christian-NSKU5diinRdBDLzU/O5InQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 28 Feb 2017, Christian Kellner wrote:
> From: Christian Kellner <christian-NSKU5diinRdBDLzU/O5InQ@public.gmane.org>
> 
> The T470, X270 emits new hkey events in the 0x1311 - 0x1315 range.
> According to the user manual they should launch a user selected
> favorite application (star icon, 0x1311), snipping tool (0x1312,
> currently ignored), enable/disable bluetooth (0x1314) and open they
> keyboard settings (0x1315).
> 
> The third nibble (0xf00) is used to differentiate between the original
> hotkeys, the adaptive keyboard codes and the new, additional ones.
> 
> Signed-off-by: Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, SlashDot.org! http://sdm.link/slashdot
