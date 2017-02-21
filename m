From: Pau Espin Pedrol <pespin.shar@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Tue, 21 Feb 2017 14:39:37 +0100
Message-ID: <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
References: <20170210174837.1078-1-pespin.shar@gmail.com> <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34714 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbdBUNjk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2017 08:39:40 -0500
In-Reply-To: <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "dvhart@infradead.org" <dvhart@infradead.org>

Hi, resending as I initially replied from my mobile phone and it seem
plain text support is not enabled:

Hi,

If we have user space tools supporting and using this type of event,
then what about adding them properly with a define + entry in the
structure array so that it can be standardized and on top get rid of
those kernel message every time I (un)plug the charger? Would that be
welcomed? I could send a new patch as specified above, adding the
KEY_CHARING_ON/OFF defines + add entries to eeepc_keymap.


> On Feb 18, 2017 17:16, "Andy Shevchenko" <andy.shevchenko@gmail.com> wrote:
>
> On Fri, Feb 10, 2017 at 7:48 PM, Pau Espin Pedrol <pespin.shar@gmail.com>
> wrote:
>> Otherwise those are printed several times when (un)plugging the AC
>> connector.
>
> If we have a user space tool that supports them better not to ignore.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
