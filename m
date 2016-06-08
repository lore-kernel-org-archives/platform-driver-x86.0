From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad_laptop: add an event for mic mute hotkey
Date: Wed, 8 Jun 2016 13:02:40 -0700
Message-ID: <20160608200240.GD28348@f23x64.localdomain>
References: <1464593208-13190-1-git-send-email-alex.hung@canonical.com>
 <575140DE.1000504@canonical.com>
 <20160607215404.GB3829@f23x64.localdomain>
 <57579074.1080303@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33794 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425031AbcFHUCh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:02:37 -0400
Content-Disposition: inline
In-Reply-To: <57579074.1080303@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

On Wed, Jun 08, 2016 at 11:26:44AM +0800, Ike Panhc wrote:
> On 06/08/2016 05:54 AM, Darren Hart wrote:
> > On Fri, Jun 03, 2016 at 04:33:34PM +0800, Ike Panhc wrote:
> >> On 05/30/2016 03:26 PM, Alex Hung wrote:
> >>> Newer ideapad supports new mic new hotkey, and it is implemented
> >>> via ACPI interface.  This patch conver the mic mute event to
> >>> a keycode KEY_MICMUTE
> >>>
> >>> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> >>> ---
> >>>  drivers/platform/x86/ideapad-laptop.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> >>> index 4a23fbc..aa87a42 100644
> >>> --- a/drivers/platform/x86/ideapad-laptop.c
> >>> +++ b/drivers/platform/x86/ideapad-laptop.c
> >>> @@ -567,6 +567,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
> >>>  static const struct key_entry ideapad_keymap[] = {
> >>>  	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
> >>>  	{ KE_KEY, 7,  { KEY_CAMERA } },
> >>> +	{ KE_KEY, 8,  { KEY_MICMUTE } },
> >>>  	{ KE_KEY, 11, { KEY_F16 } },
> >>>  	{ KE_KEY, 13, { KEY_WLAN } },
> >>>  	{ KE_KEY, 16, { KEY_PROG1 } },
> >>> @@ -809,6 +810,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
> >>>  				break;
> >>>  			case 13:
> >>>  			case 11:
> >>> +			case 8:
> >>
> >> fall through is easier to read
> >>
> >>> +				ideapad_input_report(priv, vpc_bit);
> >>> +				break;
> >>
> >> so above two lines are not necessary.
> > 
> > Are you happy with the changes otherwise Ike?
> > 
> >>
> >>>  			case 7:
> >>>  			case 6:
> >>>  				ideapad_input_report(priv, vpc_bit);
> >>>
> > 
> > Thanks,
> > 
> 
> Yes. Looks good to me.
> 

Thanks Ike, in the future, please provide an explicit Acked, Reviewed, or
Tested-by so I can accurately record your level of review. I've added your
Acked-by here.

-- 
Darren Hart
Intel Open Source Technology Center
