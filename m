From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Thu, 16 Feb 2017 18:43:12 -0800
Message-ID: <20170217024312.GE6814@wisp>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain>
 <CAHp75Vf3_WVGWKo18RikCJMtF9xgYSHem_wK4vTjXQn1WJvJCA@mail.gmail.com>
 <20170209022238.GB185952@localhost.localdomain>
 <CAJ=jquYFgiPEUc248fHb7MhHuqJih-=1SHrbypeS9HGWwPqh3Q@mail.gmail.com>
 <CAHp75VcppJdTqXXK3aVzkOk_d4hnVFc-4ZpSiHJHGjJOBSKMTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57671 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755256AbdBQCnP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2017 21:43:15 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VcppJdTqXXK3aVzkOk_d4hnVFc-4ZpSiHJHGjJOBSKMTQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Thu, Feb 09, 2017 at 09:56:06PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 9, 2017 at 5:09 AM, Alex Hung <alex.hung@canonical.com> wrote:
> > On Thu, Feb 9, 2017 at 10:22 AM, Darren Hart <dvhart@infradead.org> wrote:
> >> On Sat, Feb 04, 2017 at 04:58:33PM +0200, Andy Shevchenko wrote:
> >>> On Sat, Feb 4, 2017 at 3:14 AM, Darren Hart <dvhart@infradead.org> wrote:
> >>> > On Thu, Jan 26, 2017 at 03:33:01PM +0800, Alex Hung wrote:
> >>> >> New firmwares include a feature called 5 button array that supports
> >>> >> super key, volume up/down, rotation lock and power button. Especially,
> >>> >> support for this feature is required to fix power button on some recent
> >>> >> systems.
> 
> >>> >> +     ret = input_register_device(priv->array);
> >>> >> +     if (ret)
> >>> >> +             goto err_free_array_device;
> >>> >> +
> >>> >> +     return 0;
> >>> >> +
> >>> >> +err_free_array_device:
> >>> >> +     input_free_device(priv->array);
> >>> >> +     return ret;
> >>> >
> >>> > This return path is more complex than it could be, since you test for ret before
> >>> > return anyway:
> >>> >
> >>> >  out:
> >>> >  if (ret)
> >>> >          input_free_device(priv->array);
> >>> >  return ret;
> >>> >
> >>> > There is no need for a second return point that I can see. Same for the
> >>> > hid_input_setup function. We can remove 8 lines.
> >>>
> >>> Darren, if I didn't miss anything the function is purely used in
> >>> ->probe() path and thus devm_ version of input_allocate_device() would
> >>> make this error path gone.
> 
> >> These are optional input devices for the driver, so if I understand the
> >> semantics of devm_ correctly, the input device would remain allocated until such
> >> time as the driver is unloaded or if it fails to bind - which for systems with
> >> intel-hid, but no 5 button array, the unused input device would remain allocated
> >> until system shutdown.
> >>
> >> Alex, is that correct?
> >
> > Yes, the input device will be only allocated if 5 button array is
> > supported. Previous firmware that does not support 5 button array
> > won't be affected.
> 
> I guess there is a misunderstanding.
> 
> >From code I see that
> 1. input_allocate_device() is called only at ->probe() and only for
> devices that *have* 5 button HID array.
> 2. Time of live of allocated device is until device driver unbound or unloaded.

It's not critical, and I've applied v3. But, my point was that the driver will
not become unbound or unloaded just because the 5 button array input_setup fails
at some point, such as with the keymap_setup. In this case, if devm is used and
keymap_setup fails, the driver will remain loaded without 5 button array
support, and the input device will remain allocated, but unused.

The error path is definitely cleaner using devm, but it can leave an unused
input device allocated in error cases - although, perhaps such a situation is
rare enough that the advantages of devm make it the better choice.

So, I'm fine with the v3 Alex sent using devm.

-- 
Darren Hart
Intel Open Source Technology Center
