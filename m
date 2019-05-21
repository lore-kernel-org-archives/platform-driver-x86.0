From: Jett Rink <jettrink@chromium.org>
Subject: Re: [PATCH v2] platform/x86: intel-vbtn: Report switch events when
 event wakes device
Date: Tue, 21 May 2019 07:37:13 -0600
Message-ID: <CAK+PMK47_OE-BgOYD_TD0kwxD4RG+nS9Wstg4ydUy7yV9nVmHQ@mail.gmail.com>
References: <20190520224124.153005-1-mathewk@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520224124.153005-1-mathewk@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathew King <mathewk@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 20, 2019 at 4:41 PM Mathew King <mathewk@chromium.org> wrote:
>
> When a switch event, such as tablet mode/laptop mode or docked/undocked,
> wakes a device make sure that the value of the swich is reported.
> Without when a device is put in tablet mode from laptop mode when it is
> suspended or vice versa the device will wake up but mode will be
> incorrect.
>
> Tested by suspending a device in laptop mode and putting it in tablet
> mode, the device resumes and is in tablet mode. When suspending the
> device in tablet mode and putting it in laptop mode the device resumes
> and is in laptop mode.
>
> Signed-off-by: Mathew King <mathewk@chromium.org>
>
> ---
> Changes in v2:
>   - Added comment explaining why switch events are reported
>   - Format so that checkpatch is happy
> ---
>  drivers/platform/x86/intel-vbtn.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 06cd7e818ed5..a0d0cecff55f 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -76,12 +76,24 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>         struct platform_device *device = context;
>         struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
>         unsigned int val = !(event & 1); /* Even=press, Odd=release */
> -       const struct key_entry *ke_rel;
> +       const struct key_entry *ke, *ke_rel;
>         bool autorelease;
>
>         if (priv->wakeup_mode) {
> -               if (sparse_keymap_entry_from_scancode(priv->input_dev, event)) {
> +               ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
> +               if (ke) {
>                         pm_wakeup_hard_event(&device->dev);
> +
> +                       /*
> +                        * Switch events like tablet mode will wake the device
> +                        * and report the new switch position to the input
> +                        * subsystem.
> +                        */
Thanks for adding the comment; This looks good to me.

> +                       if (ke->type == KE_SW)
> +                               sparse_keymap_report_event(priv->input_dev,
> +                                                          event,
> +                                                          val,
> +                                                          0);
>                         return;
>                 }
>                 goto out_unknown;
> --
> 2.21.0.1020.gf2820cf01a-goog
>

Reviewed-by: Jett Rink <jettrink@chromium.org>
