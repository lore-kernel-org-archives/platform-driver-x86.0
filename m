From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: intel-vbtn: Report switch events when
 event wakes device
Date: Fri, 24 May 2019 19:31:10 +0300
Message-ID: <CAHp75VdQs-e0F-MHk3bX3Csp6cGCf5mYJLdVVTBc3i3S8ExgmA@mail.gmail.com>
References: <20190520224124.153005-1-mathewk@chromium.org> <CAK+PMK47_OE-BgOYD_TD0kwxD4RG+nS9Wstg4ydUy7yV9nVmHQ@mail.gmail.com>
 <a7a23cbea93d46b48f7c9bd4e4cd4314@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7a23cbea93d46b48f7c9bd4e4cd4314@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: jettrink@chromium.org, mathewk@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 21, 2019 at 4:43 PM <Mario.Limonciello@dell.com> wrote:
>
> > -----Original Message-----
> > From: Jett Rink <jettrink@chromium.org>
> > Sent: Tuesday, May 21, 2019 8:37 AM
> > To: Mathew King
> > Cc: linux-kernel; AceLan Kao; Andy Shevchenko; Darren Hart; platform-driver-
> > x86@vger.kernel.org; Limonciello, Mario
> > Subject: Re: [PATCH v2] platform/x86: intel-vbtn: Report switch events when event
> > wakes device
> >
> >

Pushed to my review and testing queue, thanks!

> > [EXTERNAL EMAIL]
> >
> > On Mon, May 20, 2019 at 4:41 PM Mathew King <mathewk@chromium.org>
> > wrote:
> > >
> > > When a switch event, such as tablet mode/laptop mode or docked/undocked,
> > > wakes a device make sure that the value of the swich is reported.
> > > Without when a device is put in tablet mode from laptop mode when it is
> > > suspended or vice versa the device will wake up but mode will be
> > > incorrect.
> > >
> > > Tested by suspending a device in laptop mode and putting it in tablet
> > > mode, the device resumes and is in tablet mode. When suspending the
> > > device in tablet mode and putting it in laptop mode the device resumes
> > > and is in laptop mode.
> > >
> > > Signed-off-by: Mathew King <mathewk@chromium.org>
> > >
> > > ---
> > > Changes in v2:
> > >   - Added comment explaining why switch events are reported
> > >   - Format so that checkpatch is happy
> > > ---
> > >  drivers/platform/x86/intel-vbtn.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> > > index 06cd7e818ed5..a0d0cecff55f 100644
> > > --- a/drivers/platform/x86/intel-vbtn.c
> > > +++ b/drivers/platform/x86/intel-vbtn.c
> > > @@ -76,12 +76,24 @@ static void notify_handler(acpi_handle handle, u32
> > event, void *context)
> > >         struct platform_device *device = context;
> > >         struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
> > >         unsigned int val = !(event & 1); /* Even=press, Odd=release */
> > > -       const struct key_entry *ke_rel;
> > > +       const struct key_entry *ke, *ke_rel;
> > >         bool autorelease;
> > >
> > >         if (priv->wakeup_mode) {
> > > -               if (sparse_keymap_entry_from_scancode(priv->input_dev, event)) {
> > > +               ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
> > > +               if (ke) {
> > >                         pm_wakeup_hard_event(&device->dev);
> > > +
> > > +                       /*
> > > +                        * Switch events like tablet mode will wake the device
> > > +                        * and report the new switch position to the input
> > > +                        * subsystem.
> > > +                        */
> > Thanks for adding the comment; This looks good to me.
> >
> > > +                       if (ke->type == KE_SW)
> > > +                               sparse_keymap_report_event(priv->input_dev,
> > > +                                                          event,
> > > +                                                          val,
> > > +                                                          0);
> > >                         return;
> > >                 }
> > >                 goto out_unknown;
> > > --
> > > 2.21.0.1020.gf2820cf01a-goog
> > >
> >
> > Reviewed-by: Jett Rink <jettrink@chromium.org>
>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>



-- 
With Best Regards,
Andy Shevchenko
