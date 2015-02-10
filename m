From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: unhandled hkey event
Date: Mon, 9 Feb 2015 19:48:47 -0800
Message-ID: <20150210034847.GA30257@fury.dvhart.com>
References: <1422730323-14473-1-git-send-email-xnaveira@gmail.com>
 <20150207042244.GD20934@fury.dvhart.com>
 <54D90E1A.4090406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54D90E1A.4090406@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xavier Naveira <xnaveira@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 09, 2015 at 08:44:26PM +0100, Xavier Naveira wrote:
> On 2015-02-07 05:22, Darren Hart wrote:
> >On Sat, Jan 31, 2015 at 07:52:03PM +0100, Xavier Naveira wrote:
> >>Pressing Fn+Esc in a Lenovo Thinkpad x240 to lock the Fn keys generates
> >>an unhandled hkey event
> >>
> >>Signed-off-by: Xavier Naveira <xnaveira@gmail.com>
> >>---
> >>  drivers/platform/x86/thinkpad_acpi.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >>diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> >>index c3d11fa..e61c43b 100644
> >>--- a/drivers/platform/x86/thinkpad_acpi.c
> >>+++ b/drivers/platform/x86/thinkpad_acpi.c
> >>@@ -196,6 +196,7 @@ enum tpacpi_hkey_event_t {
> >>  	/* Key-related user-interface events */
> >>  	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
> >>  	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
> >>+	TP_HKEY_EV_KEY_FN_ESC           = 0x6060, /* Fn+Esc key pressed X240 */
> >>
> >>  	/* Thermal events */
> >>  	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
> >>@@ -3717,6 +3718,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
> >>  		*send_acpi_ev = false;
> >>  		*ignore_acpi_ev = true;
> >>  		return true;
> >>+	case TP_HKEY_EV_KEY_FN_ESC:
> >>+		/* key press events, we just ignore them as long as the EC
> >>+		 * is still reporting them in the normal keyboard stream */
> >>+		*send_acpi_ev = false;
> >>+		*ignore_acpi_ev = true;
> >>+		return true;
> >
> >No need to duplicate the logic here, just add TP_HKEY_EV_KEY_FN_ESC to the list
> >of fallthrough keys (right after TP_HKEY_EV_KEY_FN).
> >
> I don't see the list that you are referring to?

Just before where you add the new case, there is:

		/* fallthrough */

	case TP_HKEY_EV_KEY_NUMLOCK:
	case TP_HKEY_EV_KEY_FN:
		/* key press events, we just ignore them as long as the EC
		 * is still reporting them in the normal keyboard stream */
		*send_acpi_ev = false;
		*ignore_acpi_ev = true;
		return true;

You should just be able to do:

  case TP_HKEY_EV_KEY_FN:
+ case TP_HKEY_EV_KEY_FN_ESC:

Rather than duplicating the same logic below a new case block.

-- 
Darren Hart
Intel Open Source Technology Center
