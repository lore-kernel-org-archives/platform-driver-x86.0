From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Thu, 23 Feb 2017 00:36:31 -0800
Message-ID: <20170223083631.GE18639@dtor-ws>
References: <20170210174837.1078-1-pespin.shar@gmail.com>
 <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
 <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
 <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34154 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbdBWIgq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Feb 2017 03:36:46 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pau Espin Pedrol <pespin.shar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "dvhart@infradead.org" <dvhart@infradead.org>

On Tue, Feb 21, 2017 at 05:38:59PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 21, 2017 at 3:39 PM, Pau Espin Pedrol <pespin.shar@gmail.com> wrote:
> 
> > If we have user space tools supporting and using this type of event,
> > then what about adding them properly with a define + entry in the
> > structure array so that it can be standardized and on top get rid of
> > those kernel message every time I (un)plug the charger? Would that be
> > welcomed? I could send a new patch as specified above, adding the
> > KEY_CHARING_ON/OFF defines + add entries to eeepc_keymap.
> 
> Please, do not top posting.
> 
> Dmitry, do we have special events for AC (un)plug? What is the best
> approach in your opinion?

Not route them through input as they not input events would be the best.

I'd look into hooking up power_supply class.

Thanks.

-- 
Dmitry
