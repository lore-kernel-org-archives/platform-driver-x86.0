From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Wed, 15 Mar 2017 15:15:27 -0700
Message-ID: <20170315221527.GA2828@fury>
References: <20170210174837.1078-1-pespin.shar@gmail.com>
 <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
 <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
 <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com>
 <20170223083631.GE18639@dtor-ws>
 <CAEGpDub7-ou3YJAOxxK-vj9RYNMp5ER752XMFVLdB8zWWisV8Q@mail.gmail.com>
 <20170307192701.GG13740@dtor-ws>
 <CAHp75VeuhiRvmxhy886N746KvXQq9ye8CG70DQ7UyU8=0PW1tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60347 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750819AbdCOWP3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2017 18:15:29 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VeuhiRvmxhy886N746KvXQq9ye8CG70DQ7UyU8=0PW1tg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pau Espin Pedrol <pespin.shar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

On Mon, Mar 13, 2017 at 06:04:42PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 7, 2017 at 9:27 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Feb 24, 2017 at 02:01:30PM +0100, Pau Espin Pedrol wrote:
> >> >> Dmitry, do we have special events for AC (un)plug? What is the best
> >> >> approach in your opinion?
> >> >
> >> > Not route them through input as they not input events would be the best.
> >> >
> >> Is my patch good enough for this or would you recommend doing it another way?
> >
> 
> > From input POV your patch makes sense.
> 
> Could you give your tag?

Based on this discussion and no additional input from Dmitry or Corentin, and my
own review, I have queued this patch to testing. Thanks.

-- 
Darren Hart
VMware Open Source Technology Center
