From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v3 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Tue, 11 Dec 2012 18:39:14 +0100
Message-ID: <20121211183914.460ed479@destiny.ordissimo>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	<1354888162-12109-12-git-send-email-maxtram95@gmail.com>
	<20121211172930.0490654a@destiny.ordissimo>
	<CAKErNvpWzBVy=K2RrkKwieZgxPMbTtFF+J5uH4y-zSy5F0jAow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:47567 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753267Ab2LKRjf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Dec 2012 12:39:35 -0500
Received: by mail-bk0-f46.google.com with SMTP id q16so1757335bkw.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Dec 2012 09:39:34 -0800 (PST)
In-Reply-To: <CAKErNvpWzBVy=K2RrkKwieZgxPMbTtFF+J5uH4y-zSy5F0jAow@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, joeyli <jlee@suse.com>

On Tue, 11 Dec 2012 19:07:51 +0200, Maxim Mikityanskiy <maxtram95@gmail.com> wrote :

> >> @@ -169,11 +169,15 @@ static void msi_wmi_notify(u32 value, void *context)
> >>               pr_debug("Eventcode: 0x%x\n", eventcode);
> >>               key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
> >>                               eventcode);
> >> -             if (key) {
> >> +             if (!key) {
> >> +                     pr_info("Unknown key pressed - %x\n", eventcode);
> >> +                     goto msi_wmi_notify_exit;
> >> +             }
> >> +             if (quirk_last_pressed) {
> >> +                     size_t key_index = key - msi_wmi_keymap;  
> > Do you mean key->code - MSI_SCANCODE_BASE ? I'm not sure I understand the
> > intent here otherwise.  
> 
> msi_wmi_keymap is array of 'struct key_entry', i.e. pointer to array's
> first item. key is a pointer to some array's item. So 'key -
> msi_wmi_keymap' is a difference between pointers, i.e. index of key in
> msi_wmi_keymap.
> 
> I do pointer arithmetic here because in patch 12 I add some new
> scancodes, and holes appear in scancode sequence, so we can't just use
> 'key->code - MSI_SCANCODE_BASE' to get item index in array.

Oh, I see. This is very clever, but a bit too clever. You have no
guarantee, that sparse_keymap_entry_from_scancode will give you a pointer
to *your* key_entry. In fact, it doesn't.

In sparse_keymap_setup (drivers/input/sparse-keymap.c), the keymap
array(msi_wmi_keymap) is mempcy-ed, at line 187 (kernel ~3.7). So if you
want to use this method, you might need to re-compute the index by
iterating over the elements and comparing key->code for each.


Regards,

Anisse
