From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v3 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Thu, 13 Dec 2012 18:10:48 +0100
Message-ID: <20121213181048.57670178@destiny.ordissimo>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	<1354888162-12109-12-git-send-email-maxtram95@gmail.com>
	<20121211172930.0490654a@destiny.ordissimo>
	<CAKErNvpWzBVy=K2RrkKwieZgxPMbTtFF+J5uH4y-zSy5F0jAow@mail.gmail.com>
	<20121211183914.460ed479@destiny.ordissimo>
	<CAKErNvqxMiKQaXmLhKt4HOMnLNic_LHayaQKrsnyKH6WZ45Siw@mail.gmail.com>
	<20121212105829.15819617@destiny.ordissimo>
	<20121212185856.GA10583@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:58113 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754757Ab2LMRLJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Dec 2012 12:11:09 -0500
Received: by mail-wg0-f46.google.com with SMTP id dr13so905438wgb.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Dec 2012 09:11:07 -0800 (PST)
In-Reply-To: <20121212185856.GA10583@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, joeyli <jlee@suse.com>, Thomas Renninger <trenn@suse.de>

On Wed, 12 Dec 2012 10:58:56 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote :

> On Wed, Dec 12, 2012 at 10:58:29AM +0100, Anisse Astier wrote:
> > On Tue, 11 Dec 2012 20:27:26 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :
> > 
> > > 2012/12/11 Anisse Astier <anisse@astier.eu>:
> > > > On Tue, 11 Dec 2012 19:07:51 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :
> > > >
> > > >> >> @@ -169,11 +169,15 @@ static void msi_wmi_notify(u32 value, void *context)
> > > >> >>               pr_debug("Eventcode: 0x%x\n", eventcode);
> > > >> >>               key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
> > > >> >>                               eventcode);
> > > >> >> -             if (key) {
> > > >> >> +             if (!key) {
> > > >> >> +                     pr_info("Unknown key pressed - %x\n", eventcode);
> > > >> >> +                     goto msi_wmi_notify_exit;
> > > >> >> +             }
> > > >> >> +             if (quirk_last_pressed) {
> > > >> >> +                     size_t key_index = key - msi_wmi_keymap;
> > > >> > Do you mean key->code - MSI_SCANCODE_BASE ? I'm not sure I understand the
> > > >> > intent here otherwise.
> > > >>
> > > >> msi_wmi_keymap is array of 'struct key_entry', i.e. pointer to array's
> > > >> first item. key is a pointer to some array's item. So 'key -
> > > >> msi_wmi_keymap' is a difference between pointers, i.e. index of key in
> > > >> msi_wmi_keymap.
> > > >>
> > > >> I do pointer arithmetic here because in patch 12 I add some new
> > > >> scancodes, and holes appear in scancode sequence, so we can't just use
> > > >> 'key->code - MSI_SCANCODE_BASE' to get item index in array.
> > > >
> > > > Oh, I see. This is very clever, but a bit too clever. You have no
> > > > guarantee, that sparse_keymap_entry_from_scancode will give you a pointer
> > > > to *your* key_entry. In fact, it doesn't.
> > > >
> > > > In sparse_keymap_setup (drivers/input/sparse-keymap.c), the keymap
> > > > array(msi_wmi_keymap) is mempcy-ed, at line 187 (kernel ~3.7). So if you
> > > > want to use this method, you might need to re-compute the index by
> > > > iterating over the elements and comparing key->code for each.
> > > 
> > > Oops, I'm sorry, I was looking only into
> > > sparse_keymap_entry_from_scancode() and I didn't discover the fact
> > > that dev->keycode is not equal to msi_wmi_keymap. I just wanted to
> > > avoid iterating through the array second time. Also, can I use
> > > msi_wmi_input_dev->keycode instead of msi_wmi_keymap as array base?
> > > input_dev::keycode field is documented at include/linux/input.h:62.
> > 
> > As I said, you could iterate over msi_wmi_keymap and compare key->code to
> > each keycode to compute key_index each time.
> > 
> > > 
> > > It's strange that I didn't get a crash or data corruption on my system
> > > when I forced usage of last_pressed for my laptop, loaded this module
> > > and tried to press keys.
> > > 
> > > It's very unconvenient that struct key_entry does not have some field
> > > for driver-specific extra data. In such field we could store index in
> > > last_pressed or event last press time. But we haven't such field.
> > 
> > If that's really needed, such field could be added. Cc-ing Dmitry
> > Torokhov to ask what he thinks about altering the sparse keymap API for
> > this use case, ie having per key_entry variables to store information,
> > here used for debouncing.
> > Previously the keymap was contiguous, but we're adding new keys, so it'll
> > really be sparse, so we can't use the same trick substraction trick.
> 
> A different question - do you really need to store times for all
> possible keys or you actually need to know just the last key that was
> pressed?

Not at all. This isn't a gamepad, so I think this quirk could be
simplified by just storing the last trigger time overall, not per-key
trigger time. 1 key every 50ms means you can still input 20 keys per
second, which isn't bad.

Maxim, if you make this modification it would simplify your patch even
further.

Cc-ing original author Thomas Renninger for feedback.

Anisse
