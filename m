From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
Date: Mon, 22 Jan 2018 12:59:19 +0100
Message-ID: <CAD6_BovkNuUZndLar=quX82GW_7-0NPYdvWPeMQt3L-c=uaP=Q@mail.gmail.com>
References: <1516283990-3665-1-git-send-email-notmart@gmail.com>
 <20180118154408.eyke3dtn6zlcqphi@pali> <20180119160123.onn7w36hmhrxoaq6@pali>
 <abfbf75104c84a88bfc4b41789f41c66@ausx13mpc120.AMER.DELL.COM> <20180119172902.wgmvlehbsrjesabd@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:46518 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750890AbeAVL7U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 06:59:20 -0500
In-Reply-To: <20180119172902.wgmvlehbsrjesabd@dtor-ws>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mario.Limonciello@dell.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, dvhart@infradead.org, andy@infradead.org, Bhushan Shah <bhush94@gmail.com>, platform-driver-x86@vger.kernel.org

On Fri, Jan 19, 2018 at 6:29 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>> We discussed a little more on the bug he filed with attached DSDT.  I think that in
>> sparse keymap he can use KE_VSW for the entries and sparse keymap can handle.
>
> No it should be KE_SW I believe, as the "keycode" encodes the state.
> See example in intel-hid.c.
>
> So you probably want:
>
>         ...
>         { KE_SW, 0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Press */
>         { KE_SW, 0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Release */
>
> Thanks.

If I add those lines to intel_vbtn_keymap and remove the two special
cases for 0xCC and 0xCD, it does work, but only if I explicitly call
input_sync(priv->input_dev) after sparse_keymap_report_event()
otherwise i don't get the event (cheching for instance with evtest)
until a sync gets called (i tried to put the sync only for 0xcd and in
that case i get both 0xcc and 0xcd when i go out of tablet mode)
