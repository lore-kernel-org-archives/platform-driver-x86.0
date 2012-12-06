From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v2 8/8] msi-wmi: Add MSI Wind support
Date: Thu, 6 Dec 2012 18:39:07 +0100
Message-ID: <20121206183907.22f2cfdd@destiny.ordissimo>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	<1354291477-8788-9-git-send-email-maxtram95@gmail.com>
	<20121130182209.329bebd0@destiny.ordissimo>
	<CAKErNvpE_akTYWRFL3qQHvATd0pqx-jqB=dkkdBwS7Oo+f2TTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:46608 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946407Ab2LFRj3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Dec 2012 12:39:29 -0500
Received: by mail-wi0-f174.google.com with SMTP id hm9so892216wib.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Dec 2012 09:39:27 -0800 (PST)
In-Reply-To: <CAKErNvpE_akTYWRFL3qQHvATd0pqx-jqB=dkkdBwS7Oo+f2TTQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>

On Fri, 30 Nov 2012 20:36:48 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> 2012/11/30 Anisse Astier <anisse@astier.eu>:

[snip]
> >> +
> >> +enum wind_scancodes {
> >> +     /* Fn+F3 touchpad toggle */
> >> +     WIND_KEY_TOUCHPAD       = 0x08,
> >> +     /* Fn+F11 Bluetooth toggle */
> >> +     WIND_KEY_BLUETOOTH      = 0x56,
> >> +     /* Fn+F6 webcam toggle */
> >> +     WIND_KEY_CAMERA         = 0x57,
> >> +     /* Fn+F11 Wi-Fi toggle */
> >> +     WIND_KEY_WLAN           = 0x5f,
> >> +     /* Fn+F10 turbo mode toggle */
> >> +     WIND_KEY_TURBO          = 0x60,
> >> +     /* Fn+F10 ECO mode toggle */
> >> +     WIND_KEY_ECO            = 0x69,
> >> +};
> >
> > Looking at the scancode numbers and the key function, I see no collision
> > that necessitate using a separate sparse keymap, or a separate enum.
> > Merging them would simplify a lot of your patch.
> 
> By merging keymaps we will lose information about what laptop
> corresponds the key to. Should I add this information in comments or
> is it better to use some other way?

I don't think this information would be useful to the driver. Just add it
in a comment.



[snip]

> >> +
> >> +static struct msi_wmi_table_entry msi_wmi_table[] = {
> >> +     {
> >> +             .guid                   = MSIWMI_MSI_EVENT_GUID,
> >> +             .keymap                 = msi_wmi_keymap,
> >> +             .quirk_last_pressed     = true,
> >> +             .scancode_base          = MSI_SCANCODE_BASE,
> >> +             .scancode_count         = ARRAY_SIZE(msi_wmi_keymap)-1,
> >> +     },
> >> +     {
> >> +             .guid                   = MSIWMI_WIND_EVENT_GUID,
> >> +             .keymap                 = wind_wmi_keymap,
> >> +     },
> >> +     {}
> >> +};
> > If you merge them you would only need the quirk_last_pressed variable,
> > and could do away with this struct.
> 
> Yes, you're right. But what if I would completely remove
> quirk_last_pressed and would use last_pressed if event 0xD0 - 0xD4
> happens, otherwise skip last_pressed check? Is it good way too?

Hum, I don't know, this doesn't seem like a good design, hardcoding
values this way (even if the net-effect would be the same).


> 
> >
> >> +
> >> +static struct msi_wmi_table_entry *wmi;
> >> +
> >>  static int msi_wmi_query_block(int instance, int *ret)
> >>  {
> >>       acpi_status status;
> >> @@ -165,11 +231,15 @@ static void msi_wmi_notify(u32 value, void *context)
> >>               pr_debug("Eventcode: 0x%x\n", eventcode);
> >>               key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
> >>                               eventcode);
> >> -             if (key) {
> >> +             if (!key) {
> >> +                     pr_info("Unknown key pressed - %x\n", eventcode);
> >> +                     goto msi_wmi_notify_exit;
> >> +             }
> >> +             if (wmi->quirk_last_pressed) {
> >>                       ktime_t diff;
> >>                       cur = ktime_get_real();
> >>                       diff = ktime_sub(cur, last_pressed[key->code -
> >> -                                     SCANCODE_BASE]);
> >> +                                     wmi->scancode_base]);
> >>                       /* Ignore event if the same event happened in a 50 ms
> >>                          timeframe -> Key press may result in 10-20 GPEs */
> >>                       if (ktime_to_us(diff) < 1000 * 50) {
> >> @@ -178,21 +248,19 @@ static void msi_wmi_notify(u32 value, void *context)
> >>                                        key->code, ktime_to_us(diff));
> >>                               goto msi_wmi_notify_exit;
> >>                       }
> >> -                     last_pressed[key->code - SCANCODE_BASE] = cur;
> >> -
> >> -                     if (key->type == KE_KEY &&
> >> -                     /* Brightness is served via acpi video driver */
> >> -                     (!acpi_video_backlight_support() ||
> >
> > You modify behaviour by removing this test. Backlight might be
> > registered, but we may not want to modify it directly from here because
> > the acpi video driver does that for us.
> 
> I don't remove the test. I only change !acpi_video_backlight_support()
> condition by !backlight condition (actually, it's a typo, condition
> have to look like 'backlight', not '!backlight', I'm sorry for this).
> There is a check in msi_wmi_backlight_setup(). I call
> acpi_video_backlight_support() from there and backlight will be NULL
> if acpi video driver supports backlight. So checking backlight != NULL
> is the same as checking acpi_video_backlight_support() plus fallback
> if acpi video driver doesn't support backlight and WMI driver failed
> to initialize backlight.

You're right. This is true because acpi_video_backlight_support's result
doesn't change at runtime.

[snip]

> >>  static int __init msi_wmi_input_setup(void)
> >>  {
> >>       int err;
> >>
> >> +     if (wmi->quirk_last_pressed) {
> >> +             last_pressed = kcalloc(wmi->scancode_count,
> >> +                     sizeof(last_pressed[0]), GFP_KERNEL);
> >
> > I see why you separated the keymaps. I'm pretty sure we can have an
> > unified keymap while keeping the last_pressed array working.
> 
> I think I could check in msi_wmi_notify if event is between 0xD0 and
> 0xD4 and if so, use last_pressed.

As I said, not a good idea to hardcode the range.

[snip]

> >
> > There's a lot of restructuring in here that aren't directly related to
> > adding support for new hardware (enums, init path for backlight, quirk,
> > etc.), which make this patch hard to review. You should try to put these
> > in separate patches.
> 
> OK, I will do that and resend later, when I'll receive comments on
> other patches and fix all needed things.
> 

Thanks,

Anisse
