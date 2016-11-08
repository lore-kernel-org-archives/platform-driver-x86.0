From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v4 3/3] thinkpad_acpi: Add support for X1 Yoga (2016)
 Tablet Mode
Date: Tue, 8 Nov 2016 09:01:13 -0200
Message-ID: <20161108110113.GB8609@khazad-dum.debian.net>
References: <1478538633-11450-1-git-send-email-lyude@redhat.com>
 <1478538633-11450-3-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478538633-11450-3-git-send-email-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude <lyude@redhat.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, Daniel Martin <consume.noise@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 07 Nov 2016, Lyude wrote:
> For whatever reason, the X1 Yoga doesn't support the normal method of
> querying for tablet mode. Instead of providing the MHKG method under the
> hotkey handle, we're instead given the CMMD method under the EC handle.
> Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.
> 
> Cc: Daniel Martin <consume.noise@gmail.com>
> Signed-off-by: Lyude <lyude@redhat.com>
> ---
> Changes since v1:
> - Clarify kernel output when finding the tablet mode switch
> Changes since v2:
> - Rebase on top of previous patch
> - Use an enum for hotkey_tablet. This does make a bit more sense then
>   just adding another flag.
> - Call hotkey_tablet_mode_notify_change() when getting TABLET_CHANGED
>   event.
> Changes since v3:
> - Move changelog below ---
> 
>  drivers/platform/x86/thinkpad_acpi.c | 37 ++++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index ad93c41..c60701e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -190,6 +190,9 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
>  	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
>  	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
> +	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
> +						   * enter/leave tablet mode
> +						   */

I was not going to nitpick this, but since a new respin will be needed
for the first patch anyway, can you add the BIOS and EC model numbers of
the X1 Yoga (2016) in a comment somewhere in your changes (e.g. in a
comment next to the new tablet mode code you added) ?

These model numbers are the product componet codes used in the
thinkpad-apci-style hardware black/white lists.  You should easily find
them in the dmidecode output, thinkpad-acpi logging, or in the BIOS and
EC firmware update web pages for that specific thinkpad.

Also, please send me off-list a copy of the binary ACPI tables (DSDT and
all XSDTs), and dmidecode output (with serial numbers and UUIDs
XXXX-out) for the X1 Yoga.

Finally, while this is not a requirement at this time, if you could
update the driver documentation with the newer events and any visible
changes to the tablet mode stuff, I'd be grateful.

It is in Documentation/laptops/thinkpad-acpi.txt

I apologise for not asking for these earlier.

Thanks,

-- 
  Henrique Holschuh
